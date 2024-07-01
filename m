Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D25C52D70
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:01 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2175.1719853075763009769
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KWmBu8ye;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=eSVzx5Vn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101906f3b4a4b-96384298-ddd8-4628-ad4a-8ba599aa3d5d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Nr/mfJHsSWwDVI4Y7P8tyP036Jfm9oUkmehGlifNCDI=;
	b=KWmBu8yeD58MxBbKzOMx0EeOAakqLiS37h2rjroa69mwrPh1y+2r4Y99iwvVC1As
	ABngPl1tIqF7a56vPTsTvbHEEGVJcz7LuTe6cp6YYzR+FOoPIfLNNM3Fzz73RE4CEp7
	hnosuihXQcCguXAAvrh64vR4OWwBOuF8sXZpKBtE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Nr/mfJHsSWwDVI4Y7P8tyP036Jfm9oUkmehGlifNCDI=;
	b=eSVzx5VnGzWmmD7q/YajSgEszVCELB6zP9aAXPekyX1dPIO1N+As2EJXq3QWbusE
	m1WEY69w5+JehChzKcqR4a5/ZHGRJY6Bs7hFNsEgbeDskeZ1F7sE6QoN1L3IbBVW1eT
	zi7+XDMcMjoVWr0Mz+DdfkL/7vuXfI+fl3MaJBX0=
Content-Type: multipart/mixed; boundary="===============4263118442891028428=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.9.2 SUCCEEDED
Message-ID: <010101906f3b4a4b-96384298-ddd8-4628-ad4a-8ba599aa3d5d-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201324

--===============4263118442891028428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.9.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.8.1-6.9.2.patch
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
From a3e8fa99e01d3bfba3c92c52391f631b7dc35076 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 06:58:02 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.8.1 -> 6.9.2

---
 ...y-to-specify-where-python-modules-ar.patch |  6 +-
 ...ename-of-inode_includes-from-e2fspro.patch | 64 -------------------
 ...fs-tools_6.8.1.bb => btrfs-tools_6.9.2.bb} |  3 +-
 3 files changed, 4 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-convert-handle-rename-of-inode_includes-from-e2fspro.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.8.1.bb => btrfs-tools_6.9.2.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 4b1797b65f..cc08db5430 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 980f6edc269fa3ef8d4d4b9cd1aada2328131c19 Mon Sep 17 00:00:00 2001
+From 640d65ef735843305deba55a5f896d88e6117d0c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 374f59b9..ed083f6b 100644
+index 82dfb1b4..4968989a 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -959,7 +959,7 @@ endif
+@@ -984,7 +984,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-convert-handle-rename-of-inode_includes-from-e2fspro.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-convert-handle-rename-of-inode_includes-from-e2fspro.patch
deleted file mode 100644
index 6fefbb2bca..0000000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-convert-handle-rename-of-inode_includes-from-e2fspro.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From f9ba9752ba5fd72441bc2018b2453967e75460d4 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Mon, 24 Jun 2024 02:00:11 +0000
-Subject: [PATCH] convert: handle rename of inode_includes() from e2fsprogs
- 1.47.1
-
-Upstream-Status: Backport
-[https://kernel.googlesource.com/pub/scm/linux/kernel/git/kdave/btrfs-progs/+/bcb887a4de2c56426a7a7de8d440b6ad75579f10%5E%21/#F0]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- configure.ac          |  3 ++-
- convert/source-ext2.c | 11 +++++++++--
- 2 files changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 007d29b..816dd36 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -312,7 +312,8 @@ AS_IF([test "x$have_ext4_epoch_mask_define" = xno], [
-             AC_DEFINE([EXT4_EPOCH_BITS], [2],[for encode and decode tv_nsec in ext2 inode])
-             AC_DEFINE([EXT4_EPOCH_MASK], [((1U << EXT4_EPOCH_BITS) - 1)], [For encode and decode tv_nsec info in ext2 inode])
-             AC_DEFINE([EXT4_NSEC_MASK],  [(~0UL << EXT4_EPOCH_BITS)], [For encode and decode tv_nsec info in ext2 inode])
--            AC_DEFINE([inode_includes(size, field)],[m4_normalize[(size >= (sizeof(((struct ext2_inode_large *)0)->field) + offsetof(struct ext2_inode_large, field)))]],
-+            # Use name from 1.47.1, backward compatibility is handled in convert/source-ext2.c
-+            AC_DEFINE([ext2fs_inode_includes(size, field)],[m4_normalize[(size >= (sizeof(((struct ext2_inode_large *)0)->field) + offsetof(struct ext2_inode_large, field)))]],
-                 [For encode and decode tv_nsec info in ext2 inode])
-         ],
-         [AC_MSG_WARN([It seems that ext2_inode_large don't includes tv_nsec related info, probably old e2fsprogs, no 64bit time precision of converted images])],
-diff --git a/convert/source-ext2.c b/convert/source-ext2.c
-index 2186b25..bba81e4 100644
---- a/convert/source-ext2.c
-+++ b/convert/source-ext2.c
-@@ -727,10 +727,17 @@ static inline void ext4_decode_extra_time(__le32 * tv_sec, __le32 * tv_nsec,
-         *tv_nsec = (le32_to_cpu(extra) & EXT4_NSEC_MASK) >> EXT4_EPOCH_BITS;
- }
- 
-+/*
-+ * In e2fsprogs < 1.47.1 it's inode_includes, from >= on it's with ext2fs_ prefix.
-+ */
-+#ifndef ext2fs_inode_includes
-+#define ext2fs_inode_includes(size, field)	inode_includes(size, field)
-+#endif
-+
- #define EXT4_COPY_XTIME(xtime, dst, tv_sec, tv_nsec)					\
- do {											\
- 	tv_sec = src->i_ ## xtime ;							\
--	if (inode_includes(inode_size, i_ ## xtime ## _extra)) {			\
-+	if (ext2fs_inode_includes(inode_size, i_ ## xtime ## _extra)) {			\
- 		tv_sec = src->i_ ## xtime ;						\
- 		ext4_decode_extra_time(&tv_sec, &tv_nsec, src->i_ ## xtime ## _extra);	\
- 		btrfs_set_stack_timespec_sec(&dst->xtime , tv_sec);			\
-@@ -771,7 +778,7 @@ static int ext4_copy_inode_timespec_extra(struct btrfs_inode_item *dst,
- 	EXT4_COPY_XTIME(ctime, dst, tv_sec, tv_nsec);
- 
- 	tv_sec = src->i_crtime;
--	if (inode_includes(inode_size, i_crtime_extra)) {
-+	if (ext2fs_inode_includes(inode_size, i_crtime_extra)) {
- 		tv_sec = src->i_crtime;
- 		ext4_decode_extra_time(&tv_sec, &tv_nsec, src->i_crtime_extra);
- 		btrfs_set_stack_timespec_sec(&dst->otime, tv_sec);
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb
index d61d956a70..9f5586490d 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb
@@ -17,9 +17,8 @@ DEPENDS = "util-linux zlib"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
-           file://0001-convert-handle-rename-of-inode_includes-from-e2fspro.patch \
            "
-SRCREV = "5d97c32d6f94cf6f473a5f82964e3edaeb1b146e"
+SRCREV = "b0e5ef4cf7c8b473119e0d487a26b96058e8f80d"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.44.0


--===============4263118442891028428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.8.1 [default] to 6.9.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: FILELIST: removed "/usr/lib/.debug/libbtrfsutil.so.1.3.0 /usr/lib/.debug/libbtrfs.so.0.1", added "/usr/lib/.debug/libbtrfs.so.0.1.3 /usr/lib/.debug/libbtrfsutil.so.1.3.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 25045480 to 25111536 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.8.1" to "6.9.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.8.1 [default] to 6.9.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 218990 to 219002 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.8.1" to "6.9.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.8.1 [default] to 6.9.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.8.1" to "6.9.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.8.1 [default] to 6.9.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.8.1" to "6.9.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.8.1 [default] to 6.9.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4179972 to 4192255 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.8.1" to "6.9.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.8.1 [default] to 6.9.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.8.1" to "6.9.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.8.1 [default] to 6.9.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: FILELIST: directory renamed /usr/lib/python3.12/site-packages/btrfsutil-6.8.1-py3.12.egg-info -> /usr/lib/python3.12/site-packages/btrfsutil-6.9.2-py3.12.egg-info, removed "/usr/lib/libbtrfsutil.so.1.3.0", added "/usr/lib/libbtrfsutil.so.1.3 /usr/lib/libbtrfs.so.0.1.3 /usr/lib/libbtrfsutil.so.1.3.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5824852 to 5829244 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.8.1" to "6.9.2"
packages/core2-64-poky-linux/btrfs-tools: SRC_URI changed from "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch file://0001-convert-handle-rename-of-inode_includes-from-e2fspro.patch" to "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch"
packages/core2-64-poky-linux/btrfs-tools: PKGV changed from 6.8.1 [default] to 6.9.2 [default]
packages/core2-64-poky-linux/btrfs-tools: PV changed from "6.8.1" to "6.9.2"
Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/libbtrfs.so.0.1 changed type from file to symlink
  /usr/lib/libbtrfs.so.0.1 changed permissions from rwxr-xr-x to rwxrwxrwx
  /usr/lib/libbtrfs.so.0.1 changed symlink target from None to libbtrfs.so.0.1.3
  /usr/lib/libbtrfs.so.0 changed symlink target from libbtrfs.so.0.1 to libbtrfs.so.0.1.3
  /usr/lib/libbtrfs.so changed symlink target from libbtrfs.so.0.1 to libbtrfs.so.0.1.3
  /usr/lib/libbtrfsutil.so.1 changed symlink target from libbtrfsutil.so.1.3.0 to libbtrfsutil.so.1.3.2
  /usr/lib/libbtrfsutil.so changed symlink target from libbtrfsutil.so.1.3.0 to libbtrfsutil.so.1.3.2
  /usr/lib/libbtrfsutil.so.1.3.0 moved to /usr/lib/libbtrfsutil.so.1.3.2
  /usr/lib/python3.12/site-packages/btrfsutil-6.8.1-py3.12.egg-info moved to /usr/lib/python3.12/site-packages/btrfsutil-6.9.2-py3.12.egg-info
  /usr/lib/libbtrfs.so.0.1.3 was added
  /usr/lib/libbtrfsutil.so.1.3 was added

--===============4263118442891028428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: FILELIST: directory renamed /usr/lib/python3.12/site-packages/btrfsutil-6.8.1-py3.12.egg-info -> /usr/lib/python3.12/site-packages/btrfsutil-6.9.2-py3.12.egg-info, removed "/usr/lib/libbtrfsutil.so.1.3.0", added "/usr/lib/libbtrfsutil.so.1.3.2 /usr/lib/libbtrfs.so.0.1.3 /usr/lib/libbtrfsutil.so.1.3"
Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/libbtrfs.so.0.1 changed type from file to symlink
  /usr/lib/libbtrfs.so.0.1 changed permissions from rwxr-xr-x to rwxrwxrwx
  /usr/lib/libbtrfs.so.0.1 changed symlink target from None to libbtrfs.so.0.1.3
  /usr/lib/libbtrfs.so.0 changed symlink target from libbtrfs.so.0.1 to libbtrfs.so.0.1.3
  /usr/lib/libbtrfs.so changed symlink target from libbtrfs.so.0.1 to libbtrfs.so.0.1.3
  /usr/lib/libbtrfsutil.so.1 changed symlink target from libbtrfsutil.so.1.3.0 to libbtrfsutil.so.1.3.2
  /usr/lib/libbtrfsutil.so changed symlink target from libbtrfsutil.so.1.3.0 to libbtrfsutil.so.1.3.2
  /usr/lib/libbtrfsutil.so.1.3.0 moved to /usr/lib/libbtrfsutil.so.1.3.2
  /usr/lib/python3.12/site-packages/btrfsutil-6.8.1-py3.12.egg-info moved to /usr/lib/python3.12/site-packages/btrfsutil-6.9.2-py3.12.egg-info
  /usr/lib/libbtrfs.so.0.1.3 was added
  /usr/lib/libbtrfsutil.so.1.3 was added

--===============4263118442891028428==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.8.1-6.9.2.patch"

RnJvbSBhM2U4ZmE5OWUwMWQzYmZiYTNjOTJjNTIzOTFmNjMxYjdkYzM1MDc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAwNjo1ODowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuOC4xIC0+IDYuOS4yCgotLS0KIC4uLnktdG8tc3BlY2lmeS13
aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCB8ICA2ICstCiAuLi5lbmFtZS1vZi1pbm9kZV9p
bmNsdWRlcy1mcm9tLWUyZnNwcm8ucGF0Y2ggfCA2NCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi5m
cy10b29sc182LjguMS5iYiA9PiBidHJmcy10b29sc182LjkuMi5iYn0gfCAgMyArLQogMyBmaWxl
cyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDY5IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAx
LWNvbnZlcnQtaGFuZGxlLXJlbmFtZS1vZi1pbm9kZV9pbmNsdWRlcy1mcm9tLWUyZnNwcm8ucGF0
Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMve2J0cmZzLXRvb2xz
XzYuOC4xLmJiID0+IGJ0cmZzLXRvb2xzXzYuOS4yLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBv
c3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3Nz
aWJpbGl0eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCmluZGV4IDRi
MTc5N2I2NWYuLmNjMDhkYjU0MzAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9i
dHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnkt
d2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lm
eS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTgw
ZjZlZGMyNjlmYTNlZjhkNGQ0YjljZDFhYWRhMjMyODEzMWMxOSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gNjQwZDY1ZWY3MzU4NDMzMDVkZWJhNTVhNWY4OTZkODhlNjExN2QwYyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogRGF0ZTogV2VkLCAyMyBNYXkgMjAxOCAyMToyMDozNSArMDMwMAogU3Vi
amVjdDogW1BBVENIXSBBZGQgYSBwb3NzaWJpbGl0eSB0byBzcGVjaWZ5IHdoZXJlIHB5dGhvbiBt
b2R1bGVzIGFyZQpAQCAtMTEsMTAgKzExLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmls
ZQotaW5kZXggMzc0ZjU5YjkuLmVkMDgzZjZiIDEwMDY0NAoraW5kZXggODJkZmIxYjQuLjQ5Njg5
ODlhIDEwMDY0NAogLS0tIGEvTWFrZWZpbGUKICsrKyBiL01ha2VmaWxlCi1AQCAtOTU5LDcgKzk1
OSw3IEBAIGVuZGlmCitAQCAtOTg0LDcgKzk4NCw3IEBAIGVuZGlmCiAgaWZlcSAoJChQWVRIT05f
QklORElOR1MpLDEpCiAgaW5zdGFsbF9weXRob246IGxpYmJ0cmZzdXRpbF9weXRob24KICAJJChR
KWNkIGxpYmJ0cmZzdXRpbC9weXRob247IFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLWNvbnZlcnQtaGFuZGxlLXJlbmFtZS1v
Zi1pbm9kZV9pbmNsdWRlcy1mcm9tLWUyZnNwcm8ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1jb252ZXJ0LWhhbmRsZS1yZW5hbWUtb2Yt
aW5vZGVfaW5jbHVkZXMtZnJvbS1lMmZzcHJvLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCA2ZmVmYmIyYmNhLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLWNvbnZlcnQtaGFuZGxlLXJlbmFtZS1vZi1p
bm9kZV9pbmNsdWRlcy1mcm9tLWUyZnNwcm8ucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw2NCAr
MCwwIEBACi1Gcm9tIGY5YmE5NzUyYmE1ZmQ3MjQ0MWJjMjAxOGIyNDUzOTY3ZTc1NDYwZDQgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3Uu
Y29tPgotRGF0ZTogTW9uLCAyNCBKdW4gMjAyNCAwMjowMDoxMSArMDAwMAotU3ViamVjdDogW1BB
VENIXSBjb252ZXJ0OiBoYW5kbGUgcmVuYW1lIG9mIGlub2RlX2luY2x1ZGVzKCkgZnJvbSBlMmZz
cHJvZ3MKLSAxLjQ3LjEKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydAotW2h0dHBzOi8va2Vy
bmVsLmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2tkYXZlL2J0cmZz
LXByb2dzLysvYmNiODg3YTRkZTJjNTY0MjZhN2E3ZGU4ZDQ0MGI2YWQ3NTU3OWYxMCU1RSUyMS8j
RjBdCi0KLVNpZ25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+Ci0t
LS0KLSBjb25maWd1cmUuYWMgICAgICAgICAgfCAgMyArKy0KLSBjb252ZXJ0L3NvdXJjZS1leHQy
LmMgfCAxMSArKysrKysrKystLQotIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5h
YwotaW5kZXggMDA3ZDI5Yi4uODE2ZGQzNiAxMDA2NDQKLS0tLSBhL2NvbmZpZ3VyZS5hYwotKysr
IGIvY29uZmlndXJlLmFjCi1AQCAtMzEyLDcgKzMxMiw4IEBAIEFTX0lGKFt0ZXN0ICJ4JGhhdmVf
ZXh0NF9lcG9jaF9tYXNrX2RlZmluZSIgPSB4bm9dLCBbCi0gICAgICAgICAgICAgQUNfREVGSU5F
KFtFWFQ0X0VQT0NIX0JJVFNdLCBbMl0sW2ZvciBlbmNvZGUgYW5kIGRlY29kZSB0dl9uc2VjIGlu
IGV4dDIgaW5vZGVdKQotICAgICAgICAgICAgIEFDX0RFRklORShbRVhUNF9FUE9DSF9NQVNLXSwg
WygoMVUgPDwgRVhUNF9FUE9DSF9CSVRTKSAtIDEpXSwgW0ZvciBlbmNvZGUgYW5kIGRlY29kZSB0
dl9uc2VjIGluZm8gaW4gZXh0MiBpbm9kZV0pCi0gICAgICAgICAgICAgQUNfREVGSU5FKFtFWFQ0
X05TRUNfTUFTS10sICBbKH4wVUwgPDwgRVhUNF9FUE9DSF9CSVRTKV0sIFtGb3IgZW5jb2RlIGFu
ZCBkZWNvZGUgdHZfbnNlYyBpbmZvIGluIGV4dDIgaW5vZGVdKQotLSAgICAgICAgICAgIEFDX0RF
RklORShbaW5vZGVfaW5jbHVkZXMoc2l6ZSwgZmllbGQpXSxbbTRfbm9ybWFsaXplWyhzaXplID49
IChzaXplb2YoKChzdHJ1Y3QgZXh0Ml9pbm9kZV9sYXJnZSAqKTApLT5maWVsZCkgKyBvZmZzZXRv
ZihzdHJ1Y3QgZXh0Ml9pbm9kZV9sYXJnZSwgZmllbGQpKSldXSwKLSsgICAgICAgICAgICAjIFVz
ZSBuYW1lIGZyb20gMS40Ny4xLCBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IGlzIGhhbmRsZWQgaW4g
Y29udmVydC9zb3VyY2UtZXh0Mi5jCi0rICAgICAgICAgICAgQUNfREVGSU5FKFtleHQyZnNfaW5v
ZGVfaW5jbHVkZXMoc2l6ZSwgZmllbGQpXSxbbTRfbm9ybWFsaXplWyhzaXplID49IChzaXplb2Yo
KChzdHJ1Y3QgZXh0Ml9pbm9kZV9sYXJnZSAqKTApLT5maWVsZCkgKyBvZmZzZXRvZihzdHJ1Y3Qg
ZXh0Ml9pbm9kZV9sYXJnZSwgZmllbGQpKSldXSwKLSAgICAgICAgICAgICAgICAgW0ZvciBlbmNv
ZGUgYW5kIGRlY29kZSB0dl9uc2VjIGluZm8gaW4gZXh0MiBpbm9kZV0pCi0gICAgICAgICBdLAot
ICAgICAgICAgW0FDX01TR19XQVJOKFtJdCBzZWVtcyB0aGF0IGV4dDJfaW5vZGVfbGFyZ2UgZG9u
J3QgaW5jbHVkZXMgdHZfbnNlYyByZWxhdGVkIGluZm8sIHByb2JhYmx5IG9sZCBlMmZzcHJvZ3Ms
IG5vIDY0Yml0IHRpbWUgcHJlY2lzaW9uIG9mIGNvbnZlcnRlZCBpbWFnZXNdKV0sCi1kaWZmIC0t
Z2l0IGEvY29udmVydC9zb3VyY2UtZXh0Mi5jIGIvY29udmVydC9zb3VyY2UtZXh0Mi5jCi1pbmRl
eCAyMTg2YjI1Li5iYmE4MWU0IDEwMDY0NAotLS0tIGEvY29udmVydC9zb3VyY2UtZXh0Mi5jCi0r
KysgYi9jb252ZXJ0L3NvdXJjZS1leHQyLmMKLUBAIC03MjcsMTAgKzcyNywxNyBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgZXh0NF9kZWNvZGVfZXh0cmFfdGltZShfX2xlMzIgKiB0dl9zZWMsIF9fbGUz
MiAqIHR2X25zZWMsCi0gICAgICAgICAqdHZfbnNlYyA9IChsZTMyX3RvX2NwdShleHRyYSkgJiBF
WFQ0X05TRUNfTUFTSykgPj4gRVhUNF9FUE9DSF9CSVRTOwotIH0KLSAKLSsvKgotKyAqIEluIGUy
ZnNwcm9ncyA8IDEuNDcuMSBpdCdzIGlub2RlX2luY2x1ZGVzLCBmcm9tID49IG9uIGl0J3Mgd2l0
aCBleHQyZnNfIHByZWZpeC4KLSsgKi8KLSsjaWZuZGVmIGV4dDJmc19pbm9kZV9pbmNsdWRlcwot
KyNkZWZpbmUgZXh0MmZzX2lub2RlX2luY2x1ZGVzKHNpemUsIGZpZWxkKQlpbm9kZV9pbmNsdWRl
cyhzaXplLCBmaWVsZCkKLSsjZW5kaWYKLSsKLSAjZGVmaW5lIEVYVDRfQ09QWV9YVElNRSh4dGlt
ZSwgZHN0LCB0dl9zZWMsIHR2X25zZWMpCQkJCQlcCi0gZG8gewkJCQkJCQkJCQkJXAotIAl0dl9z
ZWMgPSBzcmMtPmlfICMjIHh0aW1lIDsJCQkJCQkJXAotLQlpZiAoaW5vZGVfaW5jbHVkZXMoaW5v
ZGVfc2l6ZSwgaV8gIyMgeHRpbWUgIyMgX2V4dHJhKSkgewkJCVwKLSsJaWYgKGV4dDJmc19pbm9k
ZV9pbmNsdWRlcyhpbm9kZV9zaXplLCBpXyAjIyB4dGltZSAjIyBfZXh0cmEpKSB7CQkJXAotIAkJ
dHZfc2VjID0gc3JjLT5pXyAjIyB4dGltZSA7CQkJCQkJXAotIAkJZXh0NF9kZWNvZGVfZXh0cmFf
dGltZSgmdHZfc2VjLCAmdHZfbnNlYywgc3JjLT5pXyAjIyB4dGltZSAjIyBfZXh0cmEpOwlcCi0g
CQlidHJmc19zZXRfc3RhY2tfdGltZXNwZWNfc2VjKCZkc3QtPnh0aW1lICwgdHZfc2VjKTsJCQlc
Ci1AQCAtNzcxLDcgKzc3OCw3IEBAIHN0YXRpYyBpbnQgZXh0NF9jb3B5X2lub2RlX3RpbWVzcGVj
X2V4dHJhKHN0cnVjdCBidHJmc19pbm9kZV9pdGVtICpkc3QsCi0gCUVYVDRfQ09QWV9YVElNRShj
dGltZSwgZHN0LCB0dl9zZWMsIHR2X25zZWMpOwotIAotIAl0dl9zZWMgPSBzcmMtPmlfY3J0aW1l
OwotLQlpZiAoaW5vZGVfaW5jbHVkZXMoaW5vZGVfc2l6ZSwgaV9jcnRpbWVfZXh0cmEpKSB7Ci0r
CWlmIChleHQyZnNfaW5vZGVfaW5jbHVkZXMoaW5vZGVfc2l6ZSwgaV9jcnRpbWVfZXh0cmEpKSB7
Ci0gCQl0dl9zZWMgPSBzcmMtPmlfY3J0aW1lOwotIAkJZXh0NF9kZWNvZGVfZXh0cmFfdGltZSgm
dHZfc2VjLCAmdHZfbnNlYywgc3JjLT5pX2NydGltZV9leHRyYSk7Ci0gCQlidHJmc19zZXRfc3Rh
Y2tfdGltZXNwZWNfc2VjKCZkc3QtPm90aW1lLCB0dl9zZWMpOwotLS0gCi0yLjM0LjEKLQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYu
OC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYu
OS4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjguMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuOS4yLmJiCmluZGV4IGQ2MWQ5
NTZhNzAuLjlmNTU4NjQ5MGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJm
cy10b29scy9idHJmcy10b29sc182LjguMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
YnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi45LjIuYmIKQEAgLTE3LDkgKzE3LDggQEAgREVQRU5E
UyA9ICJ1dGlsLWxpbnV4IHpsaWIiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2tkYXZlL2J0cmZzLXByb2dzLmdpdDticmFuY2g9bWFz
dGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtQWRkLWEtcG9zc2li
aWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCBcCi0gICAgICAg
ICAgIGZpbGU6Ly8wMDAxLWNvbnZlcnQtaGFuZGxlLXJlbmFtZS1vZi1pbm9kZV9pbmNsdWRlcy1m
cm9tLWUyZnNwcm8ucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiNWQ5N2MzMmQ2Zjk0
Y2Y2ZjQ3M2E1ZjgyOTY0ZTNlZGFlYjFiMTQ2ZSIKK1NSQ1JFViA9ICJiMGU1ZWY0Y2Y3YzhiNDcz
MTE5ZTBkNDg3YTI2Yjk2MDU4ZThmODBkIgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogUEFDS0FH
RUNPTkZJRyA/Pz0gIiBcCi0tIAoyLjQ0LjAKCg==

--===============4263118442891028428==--

