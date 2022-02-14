Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B68CC4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 14:28:21 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.34524.1644848899956674077
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 06:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BHp7js/W;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644848896; i=@fujitsu.com;
	bh=eWnRNooBVpqOQrN+M0uE5RTVo0BMHAZnpEHPvOUEg1Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BHp7js/W3tnVwokyYrul+xiR/XRKbPdtQDAJuUxJjEF5WFr3NBO0is4ftyjInFY4W
	 tNH80GXaaaJorKWLma/UCrhKn5TV3mEmgRl7IXXMJHrKI/qNA6qEo6QA6lLhSzx52x
	 20ABkPfvBC03C8O8SiQG4DqXTtjOoNyi0AJ+o3atGO1B+Qn6JOug3EIdMyUJX+tgsm
	 3f8fupw086UnMZwg5UHDJy9rmV7YyiVNx/UohHAm8hDiv9yu7InBLEeTLHP+AP1x9M
	 wmX/DjNHgi/OFvpzab4r3jQ8oa8eia7kV+yd+76tkaaA0v84YQvq/5YeOa9Z/XZBoI
	 HsHnCO2fBYl5A==
Received: from [100.115.69.41] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 1F/6D-30582-0076A026; Mon, 14 Feb 2022 14:28:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8ORqPs/jSv
  JYPMLM4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaPn02TWglbuiuUX17I3MF7i7GLk4hASeMwo
  sWjjDGYI5zyTxOoty5ggnBOMEu+OzQByODnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAVuLywsdsIDaLgKrErs/tTCDlvAKOEpPXeIGEJQQUJKY8fM8MYnMKOEmc6p0KNl0IqG
  TZuxdgY3gFBCVOznzCAjFeQuLgixfMEL2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+yw
  k7QsYmVYx2iUVZaZnlOQmZuboGhoY6BoamuqaWeoamprpJVbpJuqlluomp+aVFCUCpfUSy4v1
  UouL9Yorc5NzUvTyUks2MQJDOaXYdc4Oxgt9P/UOMUpyMCmJ8nbbcyUJ8SXlp1RmJBZnxBeV5
  qQWH2KU4eBQkuDdkQKUEyxKTU+tSMvMAcYVTFqCg0dJhDc1FCjNW1yQmFucmQ6ROsWoKCXO+z
  4VKCEAksgozYNrg8XyJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvN9BpvBk5pXATX8FtJg
  JaHFaDxvI4pJEhJRUA1P6zuOPYydGHswuzWd6ZL4k0HzPbHXXgjr3ea+Lr+5/cyCgYvp53in3
  Hu+4ePto5KUK5T8l3fwiZgZr5xom+O3811R39ApflHfGUtP5myxvZC6Zzmi+/lfmmt3MnDKq3
  uxavwPUdH5kdkT473jCbPFmVdS8m6cfaH9++qZf/oveTqOE/JAE6RvLtWQum1de2KAn+H/B9C
  3Rgn6KwfvVzA2jf1uJWN9bP8MixukRnym3yWS1+UV3SoPO3xN6/f/Upzv7J6zt7lspmrnCsCP
  v9HzBFWF+D2/sMzh59majz72WWRMnfGoM1hT6b7U/p6ZgbY3JvN/zJV9/uy2xOUljY1zCC99+
  u24dhfJiQXbNpk4lluKMREMt5qLiRABH7EEWYAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-545.messagelabs.com!1644848895!5792!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10710 invoked from network); 14 Feb 2022 14:28:15 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Feb 2022 14:28:15 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6C965100183
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 14:28:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5E3A0100190
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 14:28:15 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 14 Feb 2022 14:27:53 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] glib-2.0: upgrade 2.70.3 -> 2.70.4
Date: Mon, 14 Feb 2022 22:27:25 +0800
Message-ID: <1644848847-3331-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644848847-3331-1-git-send-email-wangmy@fujitsu.com>
References: <1644848847-3331-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 14:28:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161708

Changelog:
=========
* Bugs fixed:
 - !2462 Backport !2461 "Fix memory leak in gio/gdbusauthmechanismsha1.c"
   to glib-2-70

* Translation updates:
 - Czech
 - French
 - Indonesian
 - Japanese
 - Polish
 - Portuguese (Brazil)
 - Russian
 - Slovenian
 - Spanish
 - Swedish
 - Ukrainian

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../glib-2.0/{glib-2.0_2.70.3.bb => glib-2.0_2.70.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.70.3.bb => glib-2.0_2.70.4.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.70.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.70.4.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.70.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.70.4.bb
index 760f71dcda..704d428f04 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.70.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.70.4.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "233fa4841c1e19e396db7607d58f6b75ba3313c50bf0fce07b2e3532d5eb7d46"
+SRC_URI[sha256sum] = "ab3d176f3115dcc4e5d02db795984e04e4f4b48d836252e23e8c468e9d423c33"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.25.1


