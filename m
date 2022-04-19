Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE15C4707F
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 02:46:34 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.4556.1650332724147269928
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 18:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=e+N1oUdH;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650332722; i=@fujitsu.com;
	bh=45lIkONkDRD25q0AGW+CQj14wNEo/N1hbSd6hMZ4Fkg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=e+N1oUdHWRFpmGLtVEYLPXQLOOkStJBKX7TKJoUhs1A1FOh72tH9Rq2mAjD1zOK3h
	 NvzuprqPN/9/9SOSRfwTNiTu3cJ/ie0+DTIesV0cBv+2Y4zKSrb4Fm7y9pToOmvrI/
	 APbhT0lPqDDWQ95KCvCQgROk+5kdjUKe7KAXbcmNk3qI4675qrGmzFENeytiEYB7ST
	 KohK3K91L9JEuIyvFMi3fWSkdplVYLrCXK2A3K6MrFW5ySjPpGwcU/xqgmlZ+p2opB
	 pVGhUGGvQgbJ//snPdJEx5/Htui7B4/hNKDNzvdMl5+pM3gonRpXF+BAyrFv0RNX0W
	 URZGUDt2ArFZg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MRomsoEpd
  k8Hu1ssWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvG29yFjwXauihXTFzM1MO7h7GLk4hASmMUk
  Mf/pcXYIZw+jxOdzr5i6GDk52ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7x52EFtYwEGis
  20bC4jNIqAq0dp2FCzOK+Ak8f3yLFYQW0JAQWLKw/fMIGM4BZwlFi3QAgkLAZX8/9zKClEuKH
  Fy5hMWiPESEgdfvGCGaFWUmH25mQXCrpCYNauNaQIj/ywkLbOQtCxgZFrFaJtUlJmeUZKbmJm
  ja2hgoGtoaKprZqJrbKKXWKWbqJdaqpucmldSlAiU1UssL9ZLLS7WK67MTc5J0ctLLdnECAzL
  lGIHpR2MZ/t+6h1ilORgUhLlfXQwNkmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK+0QFySkGBRa
  npqRVpmDjBGYNISHDxKIrxrBYHSvMUFibnFmekQqVOMilLivCuEgBICIImM0jy4NlhcXmKUlR
  LmZWRgYBDiKUgtys0sQZV/xSjOwagkzPsOZDxPZl4J3PRXQIuZgBZXT4kFWVySiJCSamBKO2+
  wp3RGkHTbte8LdZzFcnWWzluSJvm0qH3Pgj1MBs/vOleZJ3WoZDFMnKRiGr9aKeGdkfymB1Of
  srNZ7Zo0uXfhmny/zzltzQWXWf6knpphe5nZ78LjtUs/uF19EGd4NitO+fvW7UsVrNPN/gSVZ
  LU49Xue8G63ZfyjkHX/Besrt5p/fy4c21Qv9HTlw4W7U0Js1560nMutab2xkeP8jH/lu64z3T
  Bb9v77mn3qnX32uVea3i5kYthw4fjMpwZ3VuZtErmX9m/as4pii50vfh7ad/gS32nZo9oN1/S
  2ynvGzLhoFtmr/LA91OXXhCV17yQjruZYywsucn46bQWzdOTW8E+/syIvtX//ukGZQ4mlOCPR
  UIu5qDgRAEreKMxGAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-545.messagelabs.com!1650332721!232057!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12721 invoked from network); 19 Apr 2022 01:45:21 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-25.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Apr 2022 01:45:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23J1jFiP009699
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 02:45:21 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Apr 2022 02:45:16 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pip: upgrade 22.0.3 -> 22.0.4
Date: Tue, 19 Apr 2022 09:44:45 +0800
Message-ID: <1650332686-20457-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650332686-20457-1-git-send-email-wangmy@fujitsu.com>
References: <1650332686-20457-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 02:46:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164613

Changelog:
==========
Deprecations and Removals
--------------------------
Drop the doctype check, that presented a warning for index pages that use non-compliant HTML 5. (#10903)

Vendored Libraries
--------------------
Downgrade distlib to 0.3.3.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pip_22.0.3.bb => python3-pip_22.0.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_22.0.3.bb => python3-pip_22.0.4.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/recipes-devtools/python/python3-pip_22.0.4.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_22.0.3.bb
rename to meta/recipes-devtools/python/python3-pip_22.0.4.bb
index 09a305edf8..899b04d2c2 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.4.bb
@@ -38,7 +38,7 @@ SRC_URI += "file://0001-change-shebang-to-python3.patch"
 SRC_URI += "file://no_shebang_mangling.patch"
 SRC_URI += "file://reproducible.patch"
 
-SRC_URI[sha256sum] = "f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c5349d70aa581b333d0"
+SRC_URI[sha256sum] = "b3a9de2c6ef801e9247d1527a4b16f92f2cc141cd1489f3fffaf6a9e96729764"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.25.1


