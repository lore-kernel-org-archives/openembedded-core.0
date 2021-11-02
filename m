Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E03FC433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 03:36:22 +0000 (UTC)
Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.4762.1635824179933014976
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 20:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=neutral (domain: fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@fujitsu.com)
IronPort-Data: =?us-ascii?q?A9a23=3A0rtDA6KBHCTZIe/qFE+R8ZclxSXFcZb7ZxGrkP8?=
 =?us-ascii?q?bfHC9hT100mcDnWsZWG+GP6qMMWOheN9xbImxoU8E6MDdx4NqS1BcGVNFFSwT8?=
 =?us-ascii?q?ZWfbTi6wuYcBwvLd4ubChsPA/w2MrEsF+hpCC+DzvuRGuK59yAljPnRHuGU5NP?=
 =?us-ascii?q?sYUideyc1EU/Ntjozw4bVsqYw6TSIK1vlVeHa+qUzC3f5s9JACV/43orYwP9ZU?=
 =?us-ascii?q?FsejxtD1rA2TagjUFYzDBD5BrpHTU26ByOQroW5goeHq+j/ILGRpgs1/j8mDJW?=
 =?us-ascii?q?rj7T6blYXBLXVOGBiiFIPA+773EcE/Xd0j87XN9JFAatToyqAmd902f1DqJ6xV?=
 =?us-ascii?q?Rw0eKbLnYzxVjEBSn8hYPEbouavzX+X9Jb7I1f9W3z0zvNjCUs7MYEV9qN8Bnt?=
 =?us-ascii?q?D3fgZMywWKBebiuS7xbi2RuVhioIkNsaDAW+1khmM1hmAVbB/H8+FGP6MuLdlM?=
 =?us-ascii?q?P4LrpgmNZ7jiwAxMFKDtCj9XiA=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AdhQ5eq/m8T6/jLmL7Yhuk+C9I+orL9Y04lQ7?=
 =?us-ascii?q?vn2ZKCY0TiX2ra2TdZggvyMc6wxxZJhDo7+90cC7KBu2yXcc2/hzAV7IZmXbUQ?=
 =?us-ascii?q?WTQr1f0Q=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.87,201,1631548800";
   d="scan'208";a="116754521"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Nov 2021 11:36:18 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 260044D0F90F
	for <openembedded-core@lists.openembedded.org>;
 Tue,  2 Nov 2021 11:36:16 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 2 Nov 2021 11:36:11 +0800
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] glib-2.0: upgrade 2.70.0 -> 2.70.1
Date: Tue, 2 Nov 2021 11:35:10 +0800
Message-ID: <1635824112-40302-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635824112-40302-1-git-send-email-wangmy@fujitsu.com>
References: <1635824112-40302-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 260044D0F90F.A5CEE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@fujitsu.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 03:36:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157731

Fix network changes not being signalled from NetworkManager (work by
Julian Andres Klode) (#2505)

Fix build when building with --fatal-meson-warnings (work by Eli Schwartz) (!2304)

Bugs fixed:

2245 gdesktopappinfo: Do not call xterm when it does not exist, inform the caller the launch failed

2253 Backport 2251 "GString: Bump minimum size" to glib-2-70

2256 Backport 2254 "Small optimization for g_object_set" to glib-2-70

2259 Backport 2257 "Fix documentation for g_dbus_object_manager_get_object()." to glib-2-70

2262 Backport 2244 "gutils: Avoid segfault in g_get_user_database_entry" to glib-2-70

2271 Backport 2266 "fix uninitial variable" to glib-2-70

2276 Backport 2274 "Do not try to access errno after calling getpwnam_r." to glib-2-70

2300 Backport 2285 "fix issues found by svace static code analyzer" to glib-2-70

2301 Backport 2293 "glib-private: Fix MSVC build with AddressSanitizer" to glib-2-70

2302 Backport 2291 "gnetworkmonitornm: Stop using removed PropertiesChanged signal" to glib-2-70

2304 meson: fix warnings for extract_all_objects function

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../glib-2.0/{glib-2.0_2.70.0.bb => glib-2.0_2.70.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.70.0.bb => glib-2.0_2.70.1.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.70.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.70.1.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.70.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.70.1.bb
index 8217aaa8d0..f7bb62f74b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.70.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.70.1.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "200d7df811c5ba634afbf109f14bb40ba7fde670e89389885da14e27c0840742"
+SRC_URI[sha256sum] = "f9b7bce7f51753a1f43853bbcaca8bf09e15e994268e29cfd7a76f65636263c0"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.25.1




