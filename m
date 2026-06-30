Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C84FC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 05:52:36 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14769.1782798747911718937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 22:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=mY9hlZlF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Llg5c0pK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019f171604b5-2f9fb5c8-5897-443d-ae66-842cd3a2bdf4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782798747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dV1MAwCM3BF5pJY3RVYn+lE/GIjgMBoLeJCQ1UJTgz4=;
	b=mY9hlZlFus/RJVz0MFG8Vek7SgsJzXSGhKEC9PFFFAMuqQSuG++CUVl6Fcg5Win0
	43ChI29XkBSBX32IWkHswFbOgXIVIcuQRw8RThUUoDFk4caXw+rTC0ot4myhiJfDYot
	slfjMDp0VML0p/QWWd8lVnyX4tEfOCd67dUvtDmY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782798747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dV1MAwCM3BF5pJY3RVYn+lE/GIjgMBoLeJCQ1UJTgz4=;
	b=Llg5c0pK9Q0MZF/PGY/dy2eAYautSvDgF3aZ0XEevDcwbH1cOVomqPo4jQt91wH2
	FvyakRYM9kOm0Ci/P9ykRoRqnznWtEvtW/cn8AOiJJ3AJDK2lRZTR4BxuVtqhopFSIt
	4pag2GfkE4/lb7UEaiatjUHvHSb3+l5bV7lzB5Jk=
Content-Type: multipart/mixed; boundary="===============5826051345165596214=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alex Stewart <alex.stewart@ni.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] opkg: upgrading to 0.10.0 SUCCEEDED
Message-ID: <0101019f171604b5-2f9fb5c8-5897-443d-ae66-842cd3a2bdf4-000000@us-west-2.amazonses.com>
Date: Tue, 30 Jun 2026 05:52:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.30-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 05:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239840

--===============5826051345165596214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *opkg* to *0.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-opkg-upgrade-0.9.0-0.10.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 4e6a94ff7b6b9337f26673d930bc74f0eb8070a3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 30 Jun 2026 05:16:51 +0000
Subject: [PATCH] opkg: upgrade 0.9.0 -> 0.10.0

---
 ...-opkg.lock-in-run-instead-of-var-run.patch |  4 +-
 .../opkg/opkg/0002-config.h.in-fix-typo.patch | 27 ------
 ...003-cmake-fix-WITH_ACL-and-USE_XATTR.patch | 95 -------------------
 .../opkg/{opkg_0.9.0.bb => opkg_0.10.0.bb}    |  4 +-
 4 files changed, 3 insertions(+), 127 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0003-cmake-fix-WITH_ACL-and-USE_XATTR.patch
 rename meta/recipes-devtools/opkg/{opkg_0.9.0.bb => opkg_0.10.0.bb} (94%)

diff --git a/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
index 98daf746ec..88aadbd51c 100644
--- a/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
+++ b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
@@ -1,4 +1,4 @@
-From 82b29dcfe3033d8285890bf46e58f464d9944196 Mon Sep 17 00:00:00 2001
+From 1b1ea74d7375168eadc562d316a590e0dcae1260 Mon Sep 17 00:00:00 2001
 From: Jonathan Liu <net147@gmail.com>
 Date: Mon, 21 Sep 2015 20:23:23 +1000
 Subject: [PATCH] opkg_conf: create opkg.lock in /run instead of /var/run
@@ -17,7 +17,7 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
-index 3fa6ca9..b12672e 100644
+index 650b59c..f9cf981 100644
 --- a/libopkg/opkg_conf.h
 +++ b/libopkg/opkg_conf.h
 @@ -42,7 +42,7 @@ extern "C" {
diff --git a/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
deleted file mode 100644
index 626bbd01b6..0000000000
--- a/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 5a81faadbc2397d554bc598d535fd2d44cbc8d10 Mon Sep 17 00:00:00 2001
-From: Etienne Cordonnier <ecordonnier@snap.com>
-Date: Mon, 20 Oct 2025 18:57:56 +0200
-Subject: [PATCH] config.h.in: fix typo
-
-Upstream-Status: Backport [https://git.yoctoproject.org/opkg/commit/?id=d723a90bfe6409c7ad983ed911225d4aefbfd09e]
-Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
----
- config.h.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/config.h.in b/config.h.in
-index 4fa9842..877b8c7 100644
---- a/config.h.in
-+++ b/config.h.in
-@@ -2,7 +2,7 @@
- #cmakedefine01 WITH_XZ
- #cmakedefine01 WITH_BZIP2
- #cmakedefine01 WITH_LZ4
--#cmakedefine01 WITH_LZSTD
-+#cmakedefine01 WITH_ZSTD
- #cmakedefine01 WITH_CURL
- #cmakedefine01 WITH_SSLCURL
- #cmakedefine01 WITH_ACL
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/opkg/opkg/0003-cmake-fix-WITH_ACL-and-USE_XATTR.patch b/meta/recipes-devtools/opkg/opkg/0003-cmake-fix-WITH_ACL-and-USE_XATTR.patch
deleted file mode 100644
index a041965515..0000000000
--- a/meta/recipes-devtools/opkg/opkg/0003-cmake-fix-WITH_ACL-and-USE_XATTR.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From 6d2eb69bb7b8f1ada6232eba4eb9c223be386d29 Mon Sep 17 00:00:00 2001
-From: Etienne Cordonnier <ecordonnier@snap.com>
-Date: Thu, 27 Nov 2025 19:05:16 +0100
-Subject: [PATCH] cmake: fix WITH_ACL and USE_XATTR
-
-- CMakeLists.txt was using USE_ACL, but config.h.in was using WITH_ACL.
-  Use the consistent logic that optional dependencies use the prefix HAVE_,
-  and thus since use WITH_ACL consistently (build dependency libacl).
-
-- opkg_archive.c was using ifdef instead of if for both USE_ACL and USE_XATTR.
-
-- ENABLE_XATTR and ENABLE_ACL were both "no" per default in autoconf, and this default
-  value was mistakenly changed during the cmake migration. Change it back to OFF per default.
-
-Upstream-Status: Backport [https://git.yoctoproject.org/opkg/commit/?id=6d2eb69bb7b8f1ada6232eba4eb9c223be386d29]
-Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
-Signed-off-by: Alex Stewart <alex.stewart@emerson.com>
----
- CMakeLists.txt         | 6 ++++--
- config.h.in            | 2 +-
- libopkg/CMakeLists.txt | 2 +-
- libopkg/opkg_archive.c | 4 ++--
- 4 files changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f2c01b1..316e343 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -13,6 +13,7 @@ set(PROJECT_VERSION "${PROJECT_VERSION}+git")
- set(VERSION ${PROJECT_VERSION})
- 
- option(STATIC_LIBOPKG "Statically link libopkg into opkg" OFF)
-+# Options which add optional dependencies are prefixed with "WITH_"
- # The current libopkg API is deprecated so only build it if requested
- option(WITH_LIBOPKG_API "Enable deprecated libopkg API" OFF)
- option(WITH_XZ "Enable xz compressor support" ON)
-@@ -23,8 +24,9 @@ option(WITH_CURL "Enable downloading with curl" ON)
- include(CMakeDependentOption)
- cmake_dependent_option(WITH_SSLCURL "Enable certificate authentication with curl" ON "WITH_CURL" OFF)
- option(WITH_SHA256 "Enable sha256sum check" OFF)
--option(USE_ACL "Enable ACL support" ON)
--option(USE_XATTR "Enable xattr support" ON)
-+option(WITH_ACL "Enable ACL support" OFF)
-+# Options which don't add optional dependencies are prefixed with "USE_"
-+option(USE_XATTR "Enable xattr support" OFF)
- option(USE_SOLVER_LIBSOLV "Enable libsolv solver support if true. Enable the internal solver if false." ON)
- if(USE_SOLVER_LIBSOLV)
-     set(USE_SOLVER_INTERNAL OFF CACHE BOOL "Disable internal solver")
-diff --git a/config.h.in b/config.h.in
-index 877b8c7..f2d74c5 100644
---- a/config.h.in
-+++ b/config.h.in
-@@ -6,7 +6,7 @@
- #cmakedefine01 WITH_CURL
- #cmakedefine01 WITH_SSLCURL
- #cmakedefine01 WITH_ACL
--#cmakedefine01 WITH_XATTR
-+#cmakedefine01 USE_XATTR
- #cmakedefine01 USE_SOLVER_LIBSOLV
- #cmakedefine01 USE_SOLVER_INTERNAL
- #cmakedefine01 WITH_GPGME
-diff --git a/libopkg/CMakeLists.txt b/libopkg/CMakeLists.txt
-index 628cb8c..39064c2 100644
---- a/libopkg/CMakeLists.txt
-+++ b/libopkg/CMakeLists.txt
-@@ -182,7 +182,7 @@ if(WITH_SSLCURL)
-     target_link_libraries(libopkg OpenSSL::Crypto OpenSSL::SSL)
- endif()
- 
--if(USE_ACL)
-+if(WITH_ACL)
-     pkg_check_modules(acl REQUIRED IMPORTED_TARGET libacl)
-     target_link_libraries(libopkg PkgConfig::acl)
- endif()
-diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
-index 48f80c0..fb40db3 100644
---- a/libopkg/opkg_archive.c
-+++ b/libopkg/opkg_archive.c
-@@ -914,11 +914,11 @@ struct opkg_ar *ar_open_pkg_data_archive(const char *filename)
-     ar->extract_flags = ARCHIVE_EXTRACT_OWNER | ARCHIVE_EXTRACT_PERM |
-         ARCHIVE_EXTRACT_TIME | ARCHIVE_EXTRACT_UNLINK | ARCHIVE_EXTRACT_NO_OVERWRITE;
- 
--#ifdef USE_ACL
-+#if WITH_ACL
-     ar->extract_flags |= ARCHIVE_EXTRACT_ACL;
- #endif
- 
--#ifdef USE_XATTR
-+#if USE_XATTR
-     ar->extract_flags |= ARCHIVE_EXTRACT_FFLAGS | ARCHIVE_EXTRACT_XATTR;
- #endif
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/opkg/opkg_0.9.0.bb b/meta/recipes-devtools/opkg/opkg_0.10.0.bb
similarity index 94%
rename from meta/recipes-devtools/opkg/opkg_0.9.0.bb
rename to meta/recipes-devtools/opkg/opkg_0.10.0.bb
index 7551f1bc49..debcd94a30 100644
--- a/meta/recipes-devtools/opkg/opkg_0.9.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.10.0.bb
@@ -15,12 +15,10 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
-           file://0002-config.h.in-fix-typo.patch \
-           file://0003-cmake-fix-WITH_ACL-and-USE_XATTR.patch \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "440ef321862e01f83da4d02884a0cbb4d9d7b32f82faa81a6a85493f0c89d0f5"
+SRC_URI[sha256sum] = "4d099e010a5d262b34184fee4766bc60a8c7439741fb210aa11d51704afd04d1"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
-- 
2.47.1


--===============5826051345165596214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/opkg: SRC_URI changed from "http://downloads.yoctoproject.org/releases/opkg/opkg-0.9.0.tar.gz file://opkg.conf file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch file://0002-config.h.in-fix-typo.patch file://0003-cmake-fix-WITH_ACL-and-USE_XATTR.patch file://run-ptest" to "http://downloads.yoctoproject.org/releases/opkg/opkg-0.10.0.tar.gz file://opkg.conf file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch file://run-ptest"
packages/x86-64-v3-poky-linux/opkg: PKGV changed from 0.9.0 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/opkg: PV changed from "0.9.0" to "0.10.0"
packages/x86-64-v3-poky-linux/opkg/libopkg: PKGV changed from 0.9.0 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/opkg/libopkg: PV changed from "0.9.0" to "0.10.0"
packages/x86-64-v3-poky-linux/opkg/opkg-dbg: PKGV changed from 0.9.0 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/opkg/opkg-dbg: PKGSIZE changed from 649024 to 651560 (+0%)
packages/x86-64-v3-poky-linux/opkg/opkg-dbg: PV changed from "0.9.0" to "0.10.0"
packages/x86-64-v3-poky-linux/opkg/opkg-dev: PKGV changed from 0.9.0 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/opkg/opkg-dev: PKGSIZE changed from 231 to 232 (+0%)
packages/x86-64-v3-poky-linux/opkg/opkg-dev: PV changed from "0.9.0" to "0.10.0"
packages/x86-64-v3-poky-linux/opkg/opkg-doc: PKGV changed from 0.9.0 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/opkg/opkg-doc: PKGSIZE changed from 15125 to 15121 (-0%)
packages/x86-64-v3-poky-linux/opkg/opkg-doc: PV changed from "0.9.0" to "0.10.0"
packages/x86-64-v3-poky-linux/opkg/opkg-locale: PKGV changed from 0.9.0 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/opkg/opkg-locale: PV changed from "0.9.0" to "0.10.0"
packages/x86-64-v3-poky-linux/opkg/opkg-ptest: PKGV changed from 0.9.0 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/opkg/opkg-ptest: PKGSIZE changed from 172305 to 173222 (+1%)
packages/x86-64-v3-poky-linux/opkg/opkg-ptest: PV changed from "0.9.0" to "0.10.0"
packages/x86-64-v3-poky-linux/opkg/opkg-ptest: FILELIST: added "/usr/lib/opkg/ptest/tests/build/test-openembedded-build.sh"
packages/x86-64-v3-poky-linux/opkg/opkg-src: PKGV changed from 0.9.0 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/opkg/opkg-src: PKGSIZE changed from 523591 to 525200 (+0%)
packages/x86-64-v3-poky-linux/opkg/opkg-src: PV changed from "0.9.0" to "0.10.0"
packages/x86-64-v3-poky-linux/opkg/opkg-src: FILELIST: directory renamed /usr/src/debug/opkg/0.9.0/libopkg -> /usr/src/debug/opkg/0.10.0/libopkg, directory renamed /usr/src/debug/opkg/0.9.0/src -> /usr/src/debug/opkg/0.10.0/src, directory renamed /usr/src/debug/opkg/0.9.0/libopkg/solvers/libsolv -> /usr/src/debug/opkg/0.10.0/libopkg/solvers/libsolv
packages/x86-64-v3-poky-linux/opkg/opkg-staticdev: PKGV changed from 0.9.0 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/opkg/opkg-staticdev: PV changed from "0.9.0" to "0.10.0"
packages/x86-64-v3-poky-linux/opkg/opkg: PKGV changed from 0.9.0 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/opkg/opkg: PV changed from "0.9.0" to "0.10.0"

--===============5826051345165596214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/opkg/opkg-ptest: FILELIST: added "/usr/lib/opkg/ptest/tests/build/test-openembedded-build.sh"

--===============5826051345165596214==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-opkg-upgrade-0.9.0-0.10.0.patch"

RnJvbSA0ZTZhOTRmZjdiNmI5MzM3ZjI2NjczZDkzMGJjNzRmMGViODA3MGEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMzAgSnVuIDIwMjYgMDU6MTY6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
cGtnOiB1cGdyYWRlIDAuOS4wIC0+IDAuMTAuMAoKLS0tCiAuLi4tb3BrZy5sb2NrLWluLXJ1bi1p
bnN0ZWFkLW9mLXZhci1ydW4ucGF0Y2ggfCAgNCArLQogLi4uL29wa2cvb3BrZy8wMDAyLWNvbmZp
Zy5oLmluLWZpeC10eXBvLnBhdGNoIHwgMjcgLS0tLS0tCiAuLi4wMDMtY21ha2UtZml4LVdJVEhf
QUNMLWFuZC1VU0VfWEFUVFIucGF0Y2ggfCA5NSAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4vb3Br
Zy97b3BrZ18wLjkuMC5iYiA9PiBvcGtnXzAuMTAuMC5iYn0gICAgfCAgNCArLQogNCBmaWxlcyBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEyNyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3BrZy9vcGtnLzAwMDItY29uZmlnLmguaW4tZml4
LXR5cG8ucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3Br
Zy9vcGtnLzAwMDMtY21ha2UtZml4LVdJVEhfQUNMLWFuZC1VU0VfWEFUVFIucGF0Y2gKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3BrZy97b3BrZ18wLjkuMC5iYiA9PiBvcGtnXzAuMTAu
MC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3BrZy9vcGtn
LzAwMDEtb3BrZ19jb25mLWNyZWF0ZS1vcGtnLmxvY2staW4tcnVuLWluc3RlYWQtb2YtdmFyLXJ1
bi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9vcGtnL29wa2cvMDAwMS1vcGtnX2NvbmYt
Y3JlYXRlLW9wa2cubG9jay1pbi1ydW4taW5zdGVhZC1vZi12YXItcnVuLnBhdGNoCmluZGV4IDk4
ZGFmNzQ2ZWMuLjg4YWFkYmQ1MWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9v
cGtnL29wa2cvMDAwMS1vcGtnX2NvbmYtY3JlYXRlLW9wa2cubG9jay1pbi1ydW4taW5zdGVhZC1v
Zi12YXItcnVuLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9vcGtnL29wa2cvMDAw
MS1vcGtnX2NvbmYtY3JlYXRlLW9wa2cubG9jay1pbi1ydW4taW5zdGVhZC1vZi12YXItcnVuLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4MmIyOWRjZmUzMDMzZDgyODU4OTBiZjQ2ZTU4ZjQ2
NGQ5OTQ0MTk2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxYjFlYTc0ZDczNzUxNjhl
YWRjNTYyZDMxNmE1OTBlMGRjYWUxMjYwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
Sm9uYXRoYW4gTGl1IDxuZXQxNDdAZ21haWwuY29tPgogRGF0ZTogTW9uLCAyMSBTZXAgMjAxNSAy
MDoyMzoyMyArMTAwMAogU3ViamVjdDogW1BBVENIXSBvcGtnX2NvbmY6IGNyZWF0ZSBvcGtnLmxv
Y2sgaW4gL3J1biBpbnN0ZWFkIG9mIC92YXIvcnVuCkBAIC0xNyw3ICsxNyw3IEBAIFNpZ25lZC1v
ZmYtYnk6IEpvbmF0aGFuIExpdSA8bmV0MTQ3QGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2xpYm9wa2cvb3Br
Z19jb25mLmggYi9saWJvcGtnL29wa2dfY29uZi5oCi1pbmRleCAzZmE2Y2E5Li5iMTI2NzJlIDEw
MDY0NAoraW5kZXggNjUwYjU5Yy4uZjljZjk4MSAxMDA2NDQKIC0tLSBhL2xpYm9wa2cvb3BrZ19j
b25mLmgKICsrKyBiL2xpYm9wa2cvb3BrZ19jb25mLmgKIEBAIC00Miw3ICs0Miw3IEBAIGV4dGVy
biAiQyIgewpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29wa2cvb3BrZy8wMDAy
LWNvbmZpZy5oLmluLWZpeC10eXBvLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29wa2cv
b3BrZy8wMDAyLWNvbmZpZy5oLmluLWZpeC10eXBvLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCA2MjZiYmQwMWI2Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9vcGtnL29wa2cvMDAwMi1jb25maWcuaC5pbi1maXgtdHlwby5wYXRjaAorKysgL2Rldi9u
dWxsCkBAIC0xLDI3ICswLDAgQEAKLUZyb20gNWE4MWZhYWRiYzIzOTdkNTU0YmM1OThkNTM1ZmQy
ZDQ0Y2JjOGQxMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEV0aWVubmUgQ29yZG9u
bmllciA8ZWNvcmRvbm5pZXJAc25hcC5jb20+Ci1EYXRlOiBNb24sIDIwIE9jdCAyMDI1IDE4OjU3
OjU2ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZy5oLmluOiBmaXggdHlwbwotCi1VcHN0
cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL29wa2cv
Y29tbWl0Lz9pZD1kNzIzYTkwYmZlNjQwOWM3YWQ5ODNlZDkxMTIyNWQ0YWVmYmZkMDllXQotU2ln
bmVkLW9mZi1ieTogRXRpZW5uZSBDb3Jkb25uaWVyIDxlY29yZG9ubmllckBzbmFwLmNvbT4KLS0t
LQotIGNvbmZpZy5oLmluIHwgMiArLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvY29uZmlnLmguaW4gYi9jb25maWcuaC5pbgot
aW5kZXggNGZhOTg0Mi4uODc3YjhjNyAxMDA2NDQKLS0tLSBhL2NvbmZpZy5oLmluCi0rKysgYi9j
b25maWcuaC5pbgotQEAgLTIsNyArMiw3IEBACi0gI2NtYWtlZGVmaW5lMDEgV0lUSF9YWgotICNj
bWFrZWRlZmluZTAxIFdJVEhfQlpJUDIKLSAjY21ha2VkZWZpbmUwMSBXSVRIX0xaNAotLSNjbWFr
ZWRlZmluZTAxIFdJVEhfTFpTVEQKLSsjY21ha2VkZWZpbmUwMSBXSVRIX1pTVEQKLSAjY21ha2Vk
ZWZpbmUwMSBXSVRIX0NVUkwKLSAjY21ha2VkZWZpbmUwMSBXSVRIX1NTTENVUkwKLSAjY21ha2Vk
ZWZpbmUwMSBXSVRIX0FDTAotLS0gCi0yLjQzLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL29wa2cvb3BrZy8wMDAzLWNtYWtlLWZpeC1XSVRIX0FDTC1hbmQtVVNFX1hBVFRS
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29wa2cvb3BrZy8wMDAzLWNtYWtlLWZpeC1X
SVRIX0FDTC1hbmQtVVNFX1hBVFRSLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCBhMDQxOTY1NTE1Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9vcGtn
L29wa2cvMDAwMy1jbWFrZS1maXgtV0lUSF9BQ0wtYW5kLVVTRV9YQVRUUi5wYXRjaAorKysgL2Rl
di9udWxsCkBAIC0xLDk1ICswLDAgQEAKLUZyb20gNmQyZWI2OWJiN2I4ZjFhZGE2MjMyZWJhNGVi
OWMyMjNiZTM4NmQyOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEV0aWVubmUgQ29y
ZG9ubmllciA8ZWNvcmRvbm5pZXJAc25hcC5jb20+Ci1EYXRlOiBUaHUsIDI3IE5vdiAyMDI1IDE5
OjA1OjE2ICswMTAwCi1TdWJqZWN0OiBbUEFUQ0hdIGNtYWtlOiBmaXggV0lUSF9BQ0wgYW5kIFVT
RV9YQVRUUgotCi0tIENNYWtlTGlzdHMudHh0IHdhcyB1c2luZyBVU0VfQUNMLCBidXQgY29uZmln
LmguaW4gd2FzIHVzaW5nIFdJVEhfQUNMLgotICBVc2UgdGhlIGNvbnNpc3RlbnQgbG9naWMgdGhh
dCBvcHRpb25hbCBkZXBlbmRlbmNpZXMgdXNlIHRoZSBwcmVmaXggSEFWRV8sCi0gIGFuZCB0aHVz
IHNpbmNlIHVzZSBXSVRIX0FDTCBjb25zaXN0ZW50bHkgKGJ1aWxkIGRlcGVuZGVuY3kgbGliYWNs
KS4KLQotLSBvcGtnX2FyY2hpdmUuYyB3YXMgdXNpbmcgaWZkZWYgaW5zdGVhZCBvZiBpZiBmb3Ig
Ym90aCBVU0VfQUNMIGFuZCBVU0VfWEFUVFIuCi0KLS0gRU5BQkxFX1hBVFRSIGFuZCBFTkFCTEVf
QUNMIHdlcmUgYm90aCAibm8iIHBlciBkZWZhdWx0IGluIGF1dG9jb25mLCBhbmQgdGhpcyBkZWZh
dWx0Ci0gIHZhbHVlIHdhcyBtaXN0YWtlbmx5IGNoYW5nZWQgZHVyaW5nIHRoZSBjbWFrZSBtaWdy
YXRpb24uIENoYW5nZSBpdCBiYWNrIHRvIE9GRiBwZXIgZGVmYXVsdC4KLQotVXBzdHJlYW0tU3Rh
dHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9vcGtnL2NvbW1pdC8/
aWQ9NmQyZWI2OWJiN2I4ZjFhZGE2MjMyZWJhNGViOWMyMjNiZTM4NmQyOV0KLVNpZ25lZC1vZmYt
Ynk6IEV0aWVubmUgQ29yZG9ubmllciA8ZWNvcmRvbm5pZXJAc25hcC5jb20+Ci1TaWduZWQtb2Zm
LWJ5OiBBbGV4IFN0ZXdhcnQgPGFsZXguc3Rld2FydEBlbWVyc29uLmNvbT4KLS0tLQotIENNYWtl
TGlzdHMudHh0ICAgICAgICAgfCA2ICsrKystLQotIGNvbmZpZy5oLmluICAgICAgICAgICAgfCAy
ICstCi0gbGlib3BrZy9DTWFrZUxpc3RzLnR4dCB8IDIgKy0KLSBsaWJvcGtnL29wa2dfYXJjaGl2
ZS5jIHwgNCArKy0tCi0gNCBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCi0KLWRpZmYgLS1naXQgYS9DTWFrZUxpc3RzLnR4dCBiL0NNYWtlTGlzdHMudHh0Ci1p
bmRleCBmMmMwMWIxLi4zMTZlMzQzIDEwMDY0NAotLS0tIGEvQ01ha2VMaXN0cy50eHQKLSsrKyBi
L0NNYWtlTGlzdHMudHh0Ci1AQCAtMTMsNiArMTMsNyBAQCBzZXQoUFJPSkVDVF9WRVJTSU9OICIk
e1BST0pFQ1RfVkVSU0lPTn0rZ2l0IikKLSBzZXQoVkVSU0lPTiAke1BST0pFQ1RfVkVSU0lPTn0p
Ci0gCi0gb3B0aW9uKFNUQVRJQ19MSUJPUEtHICJTdGF0aWNhbGx5IGxpbmsgbGlib3BrZyBpbnRv
IG9wa2ciIE9GRikKLSsjIE9wdGlvbnMgd2hpY2ggYWRkIG9wdGlvbmFsIGRlcGVuZGVuY2llcyBh
cmUgcHJlZml4ZWQgd2l0aCAiV0lUSF8iCi0gIyBUaGUgY3VycmVudCBsaWJvcGtnIEFQSSBpcyBk
ZXByZWNhdGVkIHNvIG9ubHkgYnVpbGQgaXQgaWYgcmVxdWVzdGVkCi0gb3B0aW9uKFdJVEhfTElC
T1BLR19BUEkgIkVuYWJsZSBkZXByZWNhdGVkIGxpYm9wa2cgQVBJIiBPRkYpCi0gb3B0aW9uKFdJ
VEhfWFogIkVuYWJsZSB4eiBjb21wcmVzc29yIHN1cHBvcnQiIE9OKQotQEAgLTIzLDggKzI0LDkg
QEAgb3B0aW9uKFdJVEhfQ1VSTCAiRW5hYmxlIGRvd25sb2FkaW5nIHdpdGggY3VybCIgT04pCi0g
aW5jbHVkZShDTWFrZURlcGVuZGVudE9wdGlvbikKLSBjbWFrZV9kZXBlbmRlbnRfb3B0aW9uKFdJ
VEhfU1NMQ1VSTCAiRW5hYmxlIGNlcnRpZmljYXRlIGF1dGhlbnRpY2F0aW9uIHdpdGggY3VybCIg
T04gIldJVEhfQ1VSTCIgT0ZGKQotIG9wdGlvbihXSVRIX1NIQTI1NiAiRW5hYmxlIHNoYTI1NnN1
bSBjaGVjayIgT0ZGKQotLW9wdGlvbihVU0VfQUNMICJFbmFibGUgQUNMIHN1cHBvcnQiIE9OKQot
LW9wdGlvbihVU0VfWEFUVFIgIkVuYWJsZSB4YXR0ciBzdXBwb3J0IiBPTikKLStvcHRpb24oV0lU
SF9BQ0wgIkVuYWJsZSBBQ0wgc3VwcG9ydCIgT0ZGKQotKyMgT3B0aW9ucyB3aGljaCBkb24ndCBh
ZGQgb3B0aW9uYWwgZGVwZW5kZW5jaWVzIGFyZSBwcmVmaXhlZCB3aXRoICJVU0VfIgotK29wdGlv
bihVU0VfWEFUVFIgIkVuYWJsZSB4YXR0ciBzdXBwb3J0IiBPRkYpCi0gb3B0aW9uKFVTRV9TT0xW
RVJfTElCU09MViAiRW5hYmxlIGxpYnNvbHYgc29sdmVyIHN1cHBvcnQgaWYgdHJ1ZS4gRW5hYmxl
IHRoZSBpbnRlcm5hbCBzb2x2ZXIgaWYgZmFsc2UuIiBPTikKLSBpZihVU0VfU09MVkVSX0xJQlNP
TFYpCi0gICAgIHNldChVU0VfU09MVkVSX0lOVEVSTkFMIE9GRiBDQUNIRSBCT09MICJEaXNhYmxl
IGludGVybmFsIHNvbHZlciIpCi1kaWZmIC0tZ2l0IGEvY29uZmlnLmguaW4gYi9jb25maWcuaC5p
bgotaW5kZXggODc3YjhjNy4uZjJkNzRjNSAxMDA2NDQKLS0tLSBhL2NvbmZpZy5oLmluCi0rKysg
Yi9jb25maWcuaC5pbgotQEAgLTYsNyArNiw3IEBACi0gI2NtYWtlZGVmaW5lMDEgV0lUSF9DVVJM
Ci0gI2NtYWtlZGVmaW5lMDEgV0lUSF9TU0xDVVJMCi0gI2NtYWtlZGVmaW5lMDEgV0lUSF9BQ0wK
LS0jY21ha2VkZWZpbmUwMSBXSVRIX1hBVFRSCi0rI2NtYWtlZGVmaW5lMDEgVVNFX1hBVFRSCi0g
I2NtYWtlZGVmaW5lMDEgVVNFX1NPTFZFUl9MSUJTT0xWCi0gI2NtYWtlZGVmaW5lMDEgVVNFX1NP
TFZFUl9JTlRFUk5BTAotICNjbWFrZWRlZmluZTAxIFdJVEhfR1BHTUUKLWRpZmYgLS1naXQgYS9s
aWJvcGtnL0NNYWtlTGlzdHMudHh0IGIvbGlib3BrZy9DTWFrZUxpc3RzLnR4dAotaW5kZXggNjI4
Y2I4Yy4uMzkwNjRjMiAxMDA2NDQKLS0tLSBhL2xpYm9wa2cvQ01ha2VMaXN0cy50eHQKLSsrKyBi
L2xpYm9wa2cvQ01ha2VMaXN0cy50eHQKLUBAIC0xODIsNyArMTgyLDcgQEAgaWYoV0lUSF9TU0xD
VVJMKQotICAgICB0YXJnZXRfbGlua19saWJyYXJpZXMobGlib3BrZyBPcGVuU1NMOjpDcnlwdG8g
T3BlblNTTDo6U1NMKQotIGVuZGlmKCkKLSAKLS1pZihVU0VfQUNMKQotK2lmKFdJVEhfQUNMKQot
ICAgICBwa2dfY2hlY2tfbW9kdWxlcyhhY2wgUkVRVUlSRUQgSU1QT1JURURfVEFSR0VUIGxpYmFj
bCkKLSAgICAgdGFyZ2V0X2xpbmtfbGlicmFyaWVzKGxpYm9wa2cgUGtnQ29uZmlnOjphY2wpCi0g
ZW5kaWYoKQotZGlmZiAtLWdpdCBhL2xpYm9wa2cvb3BrZ19hcmNoaXZlLmMgYi9saWJvcGtnL29w
a2dfYXJjaGl2ZS5jCi1pbmRleCA0OGY4MGMwLi5mYjQwZGIzIDEwMDY0NAotLS0tIGEvbGlib3Br
Zy9vcGtnX2FyY2hpdmUuYwotKysrIGIvbGlib3BrZy9vcGtnX2FyY2hpdmUuYwotQEAgLTkxNCwx
MSArOTE0LDExIEBAIHN0cnVjdCBvcGtnX2FyICphcl9vcGVuX3BrZ19kYXRhX2FyY2hpdmUoY29u
c3QgY2hhciAqZmlsZW5hbWUpCi0gICAgIGFyLT5leHRyYWN0X2ZsYWdzID0gQVJDSElWRV9FWFRS
QUNUX09XTkVSIHwgQVJDSElWRV9FWFRSQUNUX1BFUk0gfAotICAgICAgICAgQVJDSElWRV9FWFRS
QUNUX1RJTUUgfCBBUkNISVZFX0VYVFJBQ1RfVU5MSU5LIHwgQVJDSElWRV9FWFRSQUNUX05PX09W
RVJXUklURTsKLSAKLS0jaWZkZWYgVVNFX0FDTAotKyNpZiBXSVRIX0FDTAotICAgICBhci0+ZXh0
cmFjdF9mbGFncyB8PSBBUkNISVZFX0VYVFJBQ1RfQUNMOwotICNlbmRpZgotIAotLSNpZmRlZiBV
U0VfWEFUVFIKLSsjaWYgVVNFX1hBVFRSCi0gICAgIGFyLT5leHRyYWN0X2ZsYWdzIHw9IEFSQ0hJ
VkVfRVhUUkFDVF9GRkxBR1MgfCBBUkNISVZFX0VYVFJBQ1RfWEFUVFI7Ci0gI2VuZGlmCi0gCi0t
LSAKLTIuNDMuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3BrZy9vcGtn
XzAuOS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29wa2cvb3BrZ18wLjEwLjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL29wa2cv
b3BrZ18wLjkuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL29wa2cvb3BrZ18w
LjEwLjAuYmIKaW5kZXggNzU1MWYxYmM0OS4uZGViY2Q5NGEzMCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL29wa2cvb3BrZ18wLjkuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvb3BrZy9vcGtnXzAuMTAuMC5iYgpAQCAtMTUsMTIgKzE1LDEwIEBAIFBFID0gIjEiCiBT
UkNfVVJJID0gImh0dHA6Ly9kb3dubG9hZHMueW9jdG9wcm9qZWN0Lm9yZy9yZWxlYXNlcy8ke0JQ
Tn0vJHtCUE59LSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9vcGtnLmNvbmYgXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMS1vcGtnX2NvbmYtY3JlYXRlLW9wa2cubG9jay1pbi1ydW4t
aW5zdGVhZC1vZi12YXItcnVuLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDItY29uZmln
LmguaW4tZml4LXR5cG8ucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMy1jbWFrZS1maXgt
V0lUSF9BQ0wtYW5kLVVTRV9YQVRUUi5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRl
c3QgXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0NDBlZjMyMTg2MmUw
MWY4M2RhNGQwMjg4NGEwY2JiNGQ5ZDdiMzJmODJmYWE4MWE2YTg1NDkzZjBjODlkMGY1IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjRkMDk5ZTAxMGE1ZDI2MmIzNDE4NGZlZTQ3NjZiYzYwYThjNzQz
OTc0MWZiMjEwYWExMWQ1MTcwNGFmZDA0ZDEiCiAKICMgVGhpcyBuZWVkcyB0byBiZSBiZWZvcmUg
cHRlc3QgaW5oZXJpdCwgb3RoZXJ3aXNlIGFsbCBwdGVzdCBmaWxlcyBlbmQgcGFja2FnZWQKICMg
aW4gbGlib3BrZyBwYWNrYWdlIGlmIE9QS0dMSUJESVIgPT0gbGliZGlyLCBiZWNhdXNlIGRlZmF1
bHQKLS0gCjIuNDcuMQoK

--===============5826051345165596214==--

