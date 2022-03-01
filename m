Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639B6C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 09:42:15 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web12.6404.1646127733527976540
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 01:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ElH7D9Eo;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646127731; i=@fujitsu.com;
	bh=zYuBPAXsJgpE0bXgmrNlehSdO/Hu4/ELolgFwY+VTCA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ElH7D9Eo9fE/bJVUJbARAVejQ8gVINFQ6YD2zquAm5VnQ2eYXf+hgGkTfSQqt/Pdr
	 l+hO/AyOsefSAYh6LflKsNboB4Qe7kGYTTtfmVIHXjDlgR1pVMS87xXa99qY1MlURa
	 VadYEOkBeqWOFKOwCcqTRhv8DDZ4jLb4u+VvvpMweH15iifGGy71OgppXssd+YxrG5
	 fZL7br38+fMHzym7mfKPmNzG9Q8PvYjVDwvx4S/e86AjFwV+B/Bw4olv7JJIqkgc77
	 l+F3HC9r6qbDb8qfVYA21WEJNP7SO/ml2XzddL6aNHQUYGlRDayJzJxb+l4UixH0Uw
	 ZYS5FWcv7O8Bw==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 4E/8E-00700-37AED126;
 Tue, 01 Mar 2022 09:42:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqFv8Sjb
  JYN16Tos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPmngdMBfu5K47eOMHWwLiIq4uRi0NI4DGj
  RNP2rywQznkmiZ5TnawQznFGiZ1XzwJlODnYBNQkpt+6AZTg4BAR0JO4+k8UJMwsoCLx4ncPO
  0hYWMBd4vk/MxCTBSjcMl0FpIJXwEni44FHTCC2hICCxJSH75lBbE4BZ4n+BRfAhgsB1Zz+M5
  MNol5Q4uTMJywQ0yUkDr54wQzRqygx+3IzC4RdITFrVhvUTDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGK2SijLTM0pyEzNzdA0NDHQNDU11TXSNjC31Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OT
  c1L08lJLNjECAzilmOX9Dsamvp96hxglOZiURHnVbsomCfEl5adUZiQWZ8QXleakFh9ilOHgU
  JLg5XoOlBMsSk1PrUjLzAFGE0xagoNHSYS35xZQmre4IDG3ODMdInWKUVFKnLf2JVBCACSRUZ
  oH1waL4EuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHktQabwZOaVwE1/BbSYCWjx32ApkMU
  liQgpqQampjO7OloVveXNG6Z9LttheP29hZdK0Srx8N62vi3fOBPs9f91WE35/Sfs+ZJ77OYb
  L2rdU85d/bmgN+p6+QXH4I99Qj99u94YF0nkTk/bsVxTT2vTrY9HbQLiZv/6wrxoT5C7rM2G0
  LWrnRVF3mh/cek6PPVUlq5O04FQZXmp7dvVD79xnLV11yET7j9NW/dITzkWYvPFV2bm/jlV/3
  1zf3Qmqi446jtl2/oEs+cck5dyRHEasErm3bXWuXwq6xZ31SXx/Zr/En7zxoccqyplmM15wcR
  Lacere80lWsbq2+IOn14t93T1p3A1c55aviM+/jH/mxNbMwLub+i2LlU3tJzrI/Pf+haT/t6X
  e6qVWIozEg21mIuKEwH9cujAWwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1646127730!2947!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30080 invoked from network); 1 Mar 2022 09:42:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Mar 2022 09:42:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A8C4A100192
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 09:42:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9BDA4100187
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 09:42:10 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 09:41:55 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.37.2 -> 6.39.0
Date: Tue, 1 Mar 2022 17:41:44 +0800
Message-ID: <1646127704-38701-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646127704-38701-1-git-send-email-wangmy@fujitsu.com>
References: <1646127704-38701-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 09:42:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162539

Changelog:
=========
This release improves Hypothesis' handling of positional-only arguments,
which are now allowed @st.composite strategies.

On Python 3.8 and later, the first arguments to builds() and from_model()
are now natively positional-only. In cases which were already errors, the
TypeError from incorrect usage will therefore be raises immediately when
the function is called, rather than when the strategy object is used.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.37.2.bb => python3-hypothesis_6.39.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.37.2.bb => python3-hypothesis_6.39.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.37.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.39.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.37.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.39.0.bb
index 4deed1e56f..81bc26208d 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.37.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.39.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "79321035b9174ffa506d724ca5e8af375d7bf532c80e4f602bd433792c527e6c"
+SRC_URI[sha256sum] = "1744b82251ce89173e9d5b3627c59723ec0b5130df1c1710e19b8e6f5f42399b"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.25.1


