Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9002BCD12AC
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:58 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.130856.1712646648325041376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LMLA6Um3;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646649; x=1744182649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pClv16BxLHgqITezmYx6CbbrFiLnw2tAlA3bJbF5C+M=;
  b=LMLA6Um3DLyjmfdWIIVVW72VDdopUaq7XK8CP41XI6HXA4TyvoRjzsKf
   AO9S8MoXLuzyjkgyjFoG9aNcuoQ8XHN9Y4cSqsgws6He/+Urc/SZgXF4W
   km27iYZcJoJnx7eN7ZZ7pPjmYtcMeqMyGeTC+KmSqqqaDPkK2zI6TKBmL
   1AxxrKLrnOqMD8Maq+E+8e5JkzNjF1dGqXb2aNNzbgBoORNiYltpfGgTc
   GlF9mMCzyufOz4fVe6g9ZOTFuTqs5nnP7xXCzGWxiM2y+XllGG2+7wRX2
   GweECCEYWPSLiEzjNYqw7RArfE0JkUCw90of5FSQQ1F9oSxF7czyt5FQp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="143488796"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="143488796"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:47 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D8192E9A34
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D152D4189
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9393220093260
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 41F741A0002;
	Tue,  9 Apr 2024 15:10:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/33] man-db: upgrade 2.12.0 -> 2.12.1
Date: Tue,  9 Apr 2024 15:10:07 +0800
Message-Id: <1712646620-16608-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.006
X-TMASE-Result: 10-0.860300-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yW03YawHJvPCnJdsOLB4zv79wRnyxuPjhOaG
	g/Bit59tO3wTUW8jWH6D2Pqt0Y7e50D5iYRASGy6xvp0tuDMx3kxXH/dlhvLv1FexdJHJX6CZ/S
	mwZqazWxOSSO5+gh9/hJwcdfSstcEcQWiiOTPqOk/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365busIM/D0ygBYG2ANca2kG5QgfYkXDL/VwgXGi/7cli9jrOCEGIPhtwiZshW6yUCW6WtCB
	JGDrKJFm+k0frxBuek9l1mFkoi18j5F1MjWWCn6OyPKih4Rysgmx9ECx5U2BYFum2PEjqt1o8WM
	kQWv6iUoTQl7wNH8PgP5zT0d393c4kYXbobxJbJtwx+p5fx65+dXa8o9+LmDqQg4iW+jBZ2k4X1
	/RDll5wcXYH5K9BSAShJNNGFcN4pI/7XOb5JlmFYrbHWvctNZIc1oxFyluk6tm4h4r4um2+x9n1
	XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198037

From: Wang Mingyu <wangmy@fujitsu.com>

0001-man-Move-local-variable-declaration-to-function-scop.patch
refreshed for 2.23.1

Changelog:
=============
* Fix excessive cleanup of '/var/cache/man' by 'systemd-tmpfiles'.
* 'man' matches the display width more accurately to the configured width.
* Upgrade to Gnulib 'stable-202401'.
* Mention 'groff''s 'pdf' device in 'man(1)'.
* Speed up 'seccomp' filter slightly.
* Document how to format pages using italic rather than underlined text.
* Remove the obsolete 'chconfig' tool for converting man-db configuration
  files to the FHS.  This transition took place almost 25 years ago (at
  least in Debian), so it's not worth keeping it around now.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ove-local-variable-declaration-to-function-scop.patch | 9 ++++-----
 .../man-db/{man-db_2.12.0.bb => man-db_2.12.1.bb}        | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/man-db/{man-db_2.12.0.bb => man-db_2.12.1.bb} (96%)

diff --git a/meta/recipes-extended/man-db/files/0001-man-Move-local-variable-declaration-to-function-scop.patch b/meta/recipes-extended/man-db/files/0001-man-Move-local-variable-declaration-to-function-scop.patch
index dc6966629c..57ecd48b1f 100644
--- a/meta/recipes-extended/man-db/files/0001-man-Move-local-variable-declaration-to-function-scop.patch
+++ b/meta/recipes-extended/man-db/files/0001-man-Move-local-variable-declaration-to-function-scop.patch
@@ -1,4 +1,4 @@
-From 126dfefb5fddf411ad0a1316209e9c1b47abfcd2 Mon Sep 17 00:00:00 2001
+From e4125223631f0d555fc327da6d8705bcc8ee5ba5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 9 Feb 2022 17:30:16 -0800
 Subject: [PATCH] man: Move local variable declaration to function scope
@@ -10,16 +10,15 @@ code without changing the logic, until its fixed in clang
 
 Upstream-Status: Inappropriate [Inappropriate: Clang bug]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/man.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/man.c b/src/man.c
-index f16fae8..333df03 100644
+index 195d35d..6870989 100644
 --- a/src/man.c
 +++ b/src/man.c
-@@ -352,7 +352,7 @@ static void init_html_pager (void)
+@@ -379,7 +379,7 @@ static void init_html_pager (void)
  static error_t parse_opt (int key, char *arg, struct argp_state *state)
  {
  	static bool apropos, whatis; /* retain values between calls */
@@ -28,7 +27,7 @@ index f16fae8..333df03 100644
  	/* Please keep these keys in the same order as in options above. */
  	switch (key) {
  		case 'C':
-@@ -384,7 +384,7 @@ static error_t parse_opt (int key, char *arg, struct argp_state *state)
+@@ -411,7 +411,7 @@ static error_t parse_opt (int key, char *arg, struct argp_state *state)
  		case OPT_WARNINGS:
  #ifdef NROFF_WARNINGS
  			{
diff --git a/meta/recipes-extended/man-db/man-db_2.12.0.bb b/meta/recipes-extended/man-db/man-db_2.12.1.bb
similarity index 96%
rename from meta/recipes-extended/man-db/man-db_2.12.0.bb
rename to meta/recipes-extended/man-db/man-db_2.12.1.bb
index 19dbb41d16..27b47a7f47 100644
--- a/meta/recipes-extended/man-db/man-db_2.12.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.12.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://0001-man-Move-local-variable-declaration-to-function-scop.patch \
           "
-SRC_URI[sha256sum] = "415a6284a22764ad22ff0f66710d853be7790dd451cd71436e3d25c74d996a95"
+SRC_URI[sha256sum] = "ddee249daeb78cf92bab794ccd069cc8b575992265ea20e239e887156e880265"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS:${PN} += "base-passwd"
-- 
2.34.1


