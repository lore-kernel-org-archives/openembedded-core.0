Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED5FC04FE2
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:10:55 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.4235.1689585045628021946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="112851585"
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="112851585"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:10:44 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id EDFD0E428A
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:42 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E6D4D3F08
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:42 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D7512FC86AA;
	Mon, 17 Jul 2023 18:10:41 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] opkg: upgrade 0.6.1 -> 0.6.2
Date: Mon, 17 Jul 2023 17:10:15 +0800
Message-Id: <1689585025-23731-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27756.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27756.006
X-TMASE-Result: 10--5.407600-10.000000
X-TMASE-MatchedRID: 82BO9bqjodKjz0nOeth/yR1kSRHxj+Z51QQ6Jx/fflZawy/TWxLyYtAY
	WUo4HSIkwyil7aU0E/7vOpaxrqKQ/agc2zmjUT0fe015woyPLfahmhSedX3bwgdg22sPhpJkbnm
	a6mGW3moqqtDuUtwyfC38M+247Q7B3Nkas/vriw78dMpK2wMYwnIa+KQSxiLwB/FMznsE8cO/BR
	68O365bjSAa8O4E9d0L/8yUNGojyb1Ht3BefL9t9Hu43wY4QfHWq/snXbxpCDgm7lSO4VWyyuh0
	LN7/qaj112g3H7nUseCUTsqrMaHWUhxfanmO7G++GYt8f/VhTtULRRq00o2mUYx760ONDcWhbep
	reNtFJRLjDR7Rr7DRhy2Siw/fJrMMoQ5/zRMpdC628cXbnOhT3Fd5+Cf9M1D5lhx0mBJyPGYnwB
	r+v+Q9jot2u/QNNBswp1qGgAVpwk1zNhuXDQgUO9VsdrlGzy3rKPJ48qPWiXMB0kPsl40w4Z1XW
	jYW8Mcd71p4n0mTTMua2HxxNDjveVHGbcDbAq6FEUknJ/kEl4BpRCTkRk5SfoLR4+zsDTtFEAkL
	aTcFnpFjU3umH6g2B2FtWDeWP2qwRJC3xpfhJEVlZwE64boOQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184445

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch
removed since they're included in 0.6.2.

Changelog:
===========
### Changed
- the project's developer documentation to be more correct and current.

### Fixed
- a bug in the 'opkg-keys' utility script which caused the script to ignore settings in the '/etc/opkg/gpg/gpg.conf' file.
- a compilation error in 'md5.c' when using clang16+ and '-std >= gnu11'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...sing-_Alignof-when-using-C11-or-newe.patch | 51 -------------------
 ...emove-no-options-flag-from-gpg-calls.patch | 34 -------------
 .../opkg/{opkg_0.6.1.bb => opkg_0.6.2.bb}     |  6 +--
 3 files changed, 2 insertions(+), 89 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch
 rename meta/recipes-devtools/opkg/{opkg_0.6.1.bb => opkg_0.6.2.bb} (92%)

diff --git a/meta/recipes-devtools/opkg/opkg/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-devtools/opkg/opkg/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
deleted file mode 100644
index 3406878a1d..0000000000
--- a/meta/recipes-devtools/opkg/opkg/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 4089affd371e6d62dd8c1e57b344f8cc329005ea Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 14 Jan 2023 23:11:08 -0800
-Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
-
-WG14 N2350 made very clear that it is an UB having type definitions
-within "offsetof" [1]. This patch enhances the implementation of macro
-alignof_slot to use builtin "_Alignof" to avoid undefined behavior on
-when using std=c11 or newer
-
-clang 16+ has started to flag this [2]
-
-Fixes build when using -std >= gnu11 and using clang16+
-
-Older compilers gcc < 4.9 or clang < 8 has buggy _Alignof even though it
-may support C11, exclude those compilers too
-
-[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
-[2] https://reviews.llvm.org/D133574
-
-Upstream-Status: Submitted [https://groups.google.com/g/opkg-devel/c/gjcQPZgT_jI]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libopkg/md5.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/libopkg/md5.c b/libopkg/md5.c
-index 981b9b8..ccb645e 100644
---- a/libopkg/md5.c
-+++ b/libopkg/md5.c
-@@ -237,7 +237,17 @@ void md5_process_bytes(const void *buffer, size_t len, struct md5_ctx *ctx)
-     /* Process available complete blocks.  */
-     if (len >= 64) {
- #if !_STRING_ARCH_unaligned
-+/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
-+   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
-+   clang versions < 8.0.0 have the same bug.  */
-+#if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
-+     || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
-+         && !defined __clang__) \
-+     || (defined __clang__ && __clang_major__ < 8))
- #define alignof(type) offsetof (struct { char c; type x; }, x)
-+#else
-+#define alignof(type) _Alignof(type)
-+#endif
- #define UNALIGNED_P(p) (((size_t) p) % alignof (uint32_t) != 0)
-         if (UNALIGNED_P(buffer))
-             while (len > 64) {
--- 
-2.39.0
-
diff --git a/meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch b/meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch
deleted file mode 100644
index f216950002..0000000000
--- a/meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a658e6402382250f0164c5b47b744740e04f3611 Mon Sep 17 00:00:00 2001
-From: Charlie Johnston <charlie.johnston@ni.com>
-Date: Fri, 30 Dec 2022 15:21:14 -0600
-Subject: [PATCH] opkg-key: Remove --no-options flag from gpg calls.
-
-The opkg-key script was always passing the --no-options
-flag to gpg, which uses /dev/null as the options file.
-As a result, the opkg gpg.conf file was not getting
-used. This change removes that flag so that gpg.conf
-in the GPGHOMEDIR for opkg (currently /etc/opkg/gpg/)
-will be used if present.
-
-Upstream-Status: Accepted [https://git.yoctoproject.org/opkg/commit/?id=cee294e72d257417b5e55ef7a76a0fd15313e46b]
-Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
----
- utils/opkg-key | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/utils/opkg-key b/utils/opkg-key
-index e395a59..8645ebc 100755
---- a/utils/opkg-key
-+++ b/utils/opkg-key
-@@ -53,7 +53,7 @@ else
-     exit 1
- fi
- 
--GPG="$GPGCMD --no-options --homedir $GPGHOMEDIR"
-+GPG="$GPGCMD --homedir $GPGHOMEDIR"
- 
- # Gpg home dir isn't created automatically when --homedir option is used
- if [ ! -e "$GPGHOMEDIR" ]; then
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.1.bb b/meta/recipes-devtools/opkg/opkg_0.6.2.bb
similarity index 92%
rename from meta/recipes-devtools/opkg/opkg_0.6.1.bb
rename to meta/recipes-devtools/opkg/opkg_0.6.2.bb
index 4c25fe963a..46be137354 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.2.bb
@@ -15,12 +15,10 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
-           file://0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch \
-           file://0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://run-ptest \
-"
+           "
 
-SRC_URI[sha256sum] = "e87fccb575c64d3ac0559444016a2795f12125986a0da896bab97c4a1a2f1b2a"
+SRC_URI[sha256sum] = "ac73a90a2549cd04948e563d915912c78e1b8ba0f43af75c5a53fcca474adbd5"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
-- 
2.34.1


