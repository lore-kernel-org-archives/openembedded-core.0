Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933DEC54E75
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:21 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1361.1721071146299283167
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QdBubNJy;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Z3iw/2mc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010190b7d5920d-10ac8194-424d-4f3f-8e8a-d69cf5595852-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kD/Qkprh3jRY6jL5YQljDrFEDzJ6uwpCXcv/dX2SCgk=;
	b=QdBubNJyGlq+0aDYvtYuOMO3Nx7YyMn1m+CrvU+hrqHvzOinDIlAGkpwFNlajKR0
	Kw9Z+iqQgnX8EUimcjP+JoDkEqKbpmVkGkSi/HNfDMPQ/U5MiP+tGa4RBGnYkRS8MdQ
	CtHDwretOUAMfSVuaBbYw6CnaxOYaEkGVSTztHDA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kD/Qkprh3jRY6jL5YQljDrFEDzJ6uwpCXcv/dX2SCgk=;
	b=Z3iw/2mcPrPxUYTZsZzTW0s7jkLRJhWZ6856UQJLQqZcJFBtZPfASmk34ovUOKJ9
	c0V3s2HXs0djiLyLFMlHG8kUW3a1eQPSM8NGl6W8bJX7cLe5YnQ7hPcoL0rTyOK8gZQ
	i/IDv5Q5Yrh1eFVkOYV0MURtO5gC2/fYRHe0c+VM=
Content-Type: multipart/mixed; boundary="===============8985367404428386995=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.9.2 SUCCEEDED
Message-ID: <01010190b7d5920d-10ac8194-424d-4f3f-8e8a-d69cf5595852-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201960

--===============8985367404428386995==
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
From 5f6831284fd24b89cdddbcde972c67c7ca005cb7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 08:42:12 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.8.1 -> 6.9.2

---
 ...y-to-specify-where-python-modules-ar.patch |  6 +-
 ...ename-of-inode_includes-from-e2fspro.patch | 64 -------------------
 ...fs-tools_6.8.1.bb => btrfs-tools_6.9.2.bb} |  3 +-
 3 files changed, 4 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-convert-handle-rename-of-inode_includes-from-e2fspro.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.8.1.bb => btrfs-tools_6.9.2.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 4b1797b65f..2984a6a1ad 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 980f6edc269fa3ef8d4d4b9cd1aada2328131c19 Mon Sep 17 00:00:00 2001
+From 68203da88f59d78e539710a76d4eaa30d3a31817 Mon Sep 17 00:00:00 2001
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


--===============8985367404428386995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: FILELIST: directory renamed /usr/lib/python3.12/site-packages/btrfsutil-6.8.1-py3.12.egg-info -> /usr/lib/python3.12/site-packages/btrfsutil-6.9.2-py3.12.egg-info, removed "/usr/lib/libbtrfsutil.so.1.3.0", added "/usr/lib/libbtrfs.so.0.1.3 /usr/lib/libbtrfsutil.so.1.3 /usr/lib/libbtrfsutil.so.1.3.2"
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

--===============8985367404428386995==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.8.1-6.9.2.patch"

RnJvbSA1ZjY4MzEyODRmZDI0Yjg5Y2RkZGJjZGU5NzJjNjdjN2NhMDA1Y2I3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMDg6NDI6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA2LjguMSAtPiA2LjkuMgoKLS0tCiAuLi55LXRvLXNwZWNpZnkt
d2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2ggfCAgNiArLQogLi4uZW5hbWUtb2YtaW5vZGVf
aW5jbHVkZXMtZnJvbS1lMmZzcHJvLnBhdGNoIHwgNjQgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4u
ZnMtdG9vbHNfNi44LjEuYmIgPT4gYnRyZnMtdG9vbHNfNi45LjIuYmJ9IHwgIDMgKy0KIDMgZmls
ZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2OSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAw
MS1jb252ZXJ0LWhhbmRsZS1yZW5hbWUtb2YtaW5vZGVfaW5jbHVkZXMtZnJvbS1lMmZzcHJvLnBh
dGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL3tidHJmcy10b29s
c182LjguMS5iYiA9PiBidHJmcy10b29sc182LjkuMi5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1w
b3NzaWJpbGl0eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9z
c2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaAppbmRleCA0
YjE3OTdiNjVmLi4yOTg0YTZhMWFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
YnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVjaWZ5
LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNp
Znktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDk4
MGY2ZWRjMjY5ZmEzZWY4ZDRkNGI5Y2QxYWFkYTIzMjgxMzFjMTkgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDY4MjAzZGE4OGY1OWQ3OGU1Mzk3MTBhNzZkNGVhYTMwZDNhMzE4MTcgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5h
dmluQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMjMgTWF5IDIwMTggMjE6MjA6MzUgKzAzMDAKIFN1
YmplY3Q6IFtQQVRDSF0gQWRkIGEgcG9zc2liaWxpdHkgdG8gc3BlY2lmeSB3aGVyZSBweXRob24g
bW9kdWxlcyBhcmUKQEAgLTExLDEwICsxMSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZp
bGUKLWluZGV4IDM3NGY1OWI5Li5lZDA4M2Y2YiAxMDA2NDQKK2luZGV4IDgyZGZiMWI0Li40OTY4
OTg5YSAxMDA2NDQKIC0tLSBhL01ha2VmaWxlCiArKysgYi9NYWtlZmlsZQotQEAgLTk1OSw3ICs5
NTksNyBAQCBlbmRpZgorQEAgLTk4NCw3ICs5ODQsNyBAQCBlbmRpZgogIGlmZXEgKCQoUFlUSE9O
X0JJTkRJTkdTKSwxKQogIGluc3RhbGxfcHl0aG9uOiBsaWJidHJmc3V0aWxfcHl0aG9uCiAgCSQo
USljZCBsaWJidHJmc3V0aWwvcHl0aG9uOyBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1jb252ZXJ0LWhhbmRsZS1yZW5hbWUt
b2YtaW5vZGVfaW5jbHVkZXMtZnJvbS1lMmZzcHJvLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtY29udmVydC1oYW5kbGUtcmVuYW1lLW9m
LWlub2RlX2luY2x1ZGVzLWZyb20tZTJmc3Byby5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggNmZlZmJiMmJjYS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1jb252ZXJ0LWhhbmRsZS1yZW5hbWUtb2Yt
aW5vZGVfaW5jbHVkZXMtZnJvbS1lMmZzcHJvLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNjQg
KzAsMCBAQAotRnJvbSBmOWJhOTc1MmJhNWZkNzI0NDFiYzIwMThiMjQ1Mzk2N2U3NTQ2MGQ0IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1
LmNvbT4KLURhdGU6IE1vbiwgMjQgSnVuIDIwMjQgMDI6MDA6MTEgKzAwMDAKLVN1YmplY3Q6IFtQ
QVRDSF0gY29udmVydDogaGFuZGxlIHJlbmFtZSBvZiBpbm9kZV9pbmNsdWRlcygpIGZyb20gZTJm
c3Byb2dzCi0gMS40Ny4xCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQKLVtodHRwczovL2tl
cm5lbC5nb29nbGVzb3VyY2UuY29tL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rZGF2ZS9idHJm
cy1wcm9ncy8rL2JjYjg4N2E0ZGUyYzU2NDI2YTdhN2RlOGQ0NDBiNmFkNzU1NzlmMTAlNUUlMjEv
I0YwXQotCi1TaWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPgot
LS0tCi0gY29uZmlndXJlLmFjICAgICAgICAgIHwgIDMgKystCi0gY29udmVydC9zb3VyY2UtZXh0
Mi5jIHwgMTEgKysrKysrKysrLS0KLSAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUu
YWMKLWluZGV4IDAwN2QyOWIuLjgxNmRkMzYgMTAwNjQ0Ci0tLS0gYS9jb25maWd1cmUuYWMKLSsr
KyBiL2NvbmZpZ3VyZS5hYwotQEAgLTMxMiw3ICszMTIsOCBAQCBBU19JRihbdGVzdCAieCRoYXZl
X2V4dDRfZXBvY2hfbWFza19kZWZpbmUiID0geG5vXSwgWwotICAgICAgICAgICAgIEFDX0RFRklO
RShbRVhUNF9FUE9DSF9CSVRTXSwgWzJdLFtmb3IgZW5jb2RlIGFuZCBkZWNvZGUgdHZfbnNlYyBp
biBleHQyIGlub2RlXSkKLSAgICAgICAgICAgICBBQ19ERUZJTkUoW0VYVDRfRVBPQ0hfTUFTS10s
IFsoKDFVIDw8IEVYVDRfRVBPQ0hfQklUUykgLSAxKV0sIFtGb3IgZW5jb2RlIGFuZCBkZWNvZGUg
dHZfbnNlYyBpbmZvIGluIGV4dDIgaW5vZGVdKQotICAgICAgICAgICAgIEFDX0RFRklORShbRVhU
NF9OU0VDX01BU0tdLCAgWyh+MFVMIDw8IEVYVDRfRVBPQ0hfQklUUyldLCBbRm9yIGVuY29kZSBh
bmQgZGVjb2RlIHR2X25zZWMgaW5mbyBpbiBleHQyIGlub2RlXSkKLS0gICAgICAgICAgICBBQ19E
RUZJTkUoW2lub2RlX2luY2x1ZGVzKHNpemUsIGZpZWxkKV0sW200X25vcm1hbGl6ZVsoc2l6ZSA+
PSAoc2l6ZW9mKCgoc3RydWN0IGV4dDJfaW5vZGVfbGFyZ2UgKikwKS0+ZmllbGQpICsgb2Zmc2V0
b2Yoc3RydWN0IGV4dDJfaW5vZGVfbGFyZ2UsIGZpZWxkKSkpXV0sCi0rICAgICAgICAgICAgIyBV
c2UgbmFtZSBmcm9tIDEuNDcuMSwgYmFja3dhcmQgY29tcGF0aWJpbGl0eSBpcyBoYW5kbGVkIGlu
IGNvbnZlcnQvc291cmNlLWV4dDIuYwotKyAgICAgICAgICAgIEFDX0RFRklORShbZXh0MmZzX2lu
b2RlX2luY2x1ZGVzKHNpemUsIGZpZWxkKV0sW200X25vcm1hbGl6ZVsoc2l6ZSA+PSAoc2l6ZW9m
KCgoc3RydWN0IGV4dDJfaW5vZGVfbGFyZ2UgKikwKS0+ZmllbGQpICsgb2Zmc2V0b2Yoc3RydWN0
IGV4dDJfaW5vZGVfbGFyZ2UsIGZpZWxkKSkpXV0sCi0gICAgICAgICAgICAgICAgIFtGb3IgZW5j
b2RlIGFuZCBkZWNvZGUgdHZfbnNlYyBpbmZvIGluIGV4dDIgaW5vZGVdKQotICAgICAgICAgXSwK
LSAgICAgICAgIFtBQ19NU0dfV0FSTihbSXQgc2VlbXMgdGhhdCBleHQyX2lub2RlX2xhcmdlIGRv
bid0IGluY2x1ZGVzIHR2X25zZWMgcmVsYXRlZCBpbmZvLCBwcm9iYWJseSBvbGQgZTJmc3Byb2dz
LCBubyA2NGJpdCB0aW1lIHByZWNpc2lvbiBvZiBjb252ZXJ0ZWQgaW1hZ2VzXSldLAotZGlmZiAt
LWdpdCBhL2NvbnZlcnQvc291cmNlLWV4dDIuYyBiL2NvbnZlcnQvc291cmNlLWV4dDIuYwotaW5k
ZXggMjE4NmIyNS4uYmJhODFlNCAxMDA2NDQKLS0tLSBhL2NvbnZlcnQvc291cmNlLWV4dDIuYwot
KysrIGIvY29udmVydC9zb3VyY2UtZXh0Mi5jCi1AQCAtNzI3LDEwICs3MjcsMTcgQEAgc3RhdGlj
IGlubGluZSB2b2lkIGV4dDRfZGVjb2RlX2V4dHJhX3RpbWUoX19sZTMyICogdHZfc2VjLCBfX2xl
MzIgKiB0dl9uc2VjLAotICAgICAgICAgKnR2X25zZWMgPSAobGUzMl90b19jcHUoZXh0cmEpICYg
RVhUNF9OU0VDX01BU0spID4+IEVYVDRfRVBPQ0hfQklUUzsKLSB9Ci0gCi0rLyoKLSsgKiBJbiBl
MmZzcHJvZ3MgPCAxLjQ3LjEgaXQncyBpbm9kZV9pbmNsdWRlcywgZnJvbSA+PSBvbiBpdCdzIHdp
dGggZXh0MmZzXyBwcmVmaXguCi0rICovCi0rI2lmbmRlZiBleHQyZnNfaW5vZGVfaW5jbHVkZXMK
LSsjZGVmaW5lIGV4dDJmc19pbm9kZV9pbmNsdWRlcyhzaXplLCBmaWVsZCkJaW5vZGVfaW5jbHVk
ZXMoc2l6ZSwgZmllbGQpCi0rI2VuZGlmCi0rCi0gI2RlZmluZSBFWFQ0X0NPUFlfWFRJTUUoeHRp
bWUsIGRzdCwgdHZfc2VjLCB0dl9uc2VjKQkJCQkJXAotIGRvIHsJCQkJCQkJCQkJCVwKLSAJdHZf
c2VjID0gc3JjLT5pXyAjIyB4dGltZSA7CQkJCQkJCVwKLS0JaWYgKGlub2RlX2luY2x1ZGVzKGlu
b2RlX3NpemUsIGlfICMjIHh0aW1lICMjIF9leHRyYSkpIHsJCQlcCi0rCWlmIChleHQyZnNfaW5v
ZGVfaW5jbHVkZXMoaW5vZGVfc2l6ZSwgaV8gIyMgeHRpbWUgIyMgX2V4dHJhKSkgewkJCVwKLSAJ
CXR2X3NlYyA9IHNyYy0+aV8gIyMgeHRpbWUgOwkJCQkJCVwKLSAJCWV4dDRfZGVjb2RlX2V4dHJh
X3RpbWUoJnR2X3NlYywgJnR2X25zZWMsIHNyYy0+aV8gIyMgeHRpbWUgIyMgX2V4dHJhKTsJXAot
IAkJYnRyZnNfc2V0X3N0YWNrX3RpbWVzcGVjX3NlYygmZHN0LT54dGltZSAsIHR2X3NlYyk7CQkJ
XAotQEAgLTc3MSw3ICs3NzgsNyBAQCBzdGF0aWMgaW50IGV4dDRfY29weV9pbm9kZV90aW1lc3Bl
Y19leHRyYShzdHJ1Y3QgYnRyZnNfaW5vZGVfaXRlbSAqZHN0LAotIAlFWFQ0X0NPUFlfWFRJTUUo
Y3RpbWUsIGRzdCwgdHZfc2VjLCB0dl9uc2VjKTsKLSAKLSAJdHZfc2VjID0gc3JjLT5pX2NydGlt
ZTsKLS0JaWYgKGlub2RlX2luY2x1ZGVzKGlub2RlX3NpemUsIGlfY3J0aW1lX2V4dHJhKSkgewot
KwlpZiAoZXh0MmZzX2lub2RlX2luY2x1ZGVzKGlub2RlX3NpemUsIGlfY3J0aW1lX2V4dHJhKSkg
ewotIAkJdHZfc2VjID0gc3JjLT5pX2NydGltZTsKLSAJCWV4dDRfZGVjb2RlX2V4dHJhX3RpbWUo
JnR2X3NlYywgJnR2X25zZWMsIHNyYy0+aV9jcnRpbWVfZXh0cmEpOwotIAkJYnRyZnNfc2V0X3N0
YWNrX3RpbWVzcGVjX3NlYygmZHN0LT5vdGltZSwgdHZfc2VjKTsKLS0tIAotMi4zNC4xCi0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182
LjguMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182
LjkuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi44LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjkuMi5iYgppbmRleCBkNjFk
OTU2YTcwLi45ZjU1ODY0OTBkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRy
ZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi44LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuOS4yLmJiCkBAIC0xNyw5ICsxNyw4IEBAIERFUEVO
RFMgPSAidXRpbC1saW51eCB6bGliIgogCiBTUkNfVVJJID0gImdpdDovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rZGF2ZS9idHJmcy1wcm9ncy5naXQ7YnJhbmNoPW1h
c3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUFkZC1hLXBvc3Np
YmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2ggXAotICAgICAg
ICAgICBmaWxlOi8vMDAwMS1jb252ZXJ0LWhhbmRsZS1yZW5hbWUtb2YtaW5vZGVfaW5jbHVkZXMt
ZnJvbS1lMmZzcHJvLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjVkOTdjMzJkNmY5
NGNmNmY0NzNhNWY4Mjk2NGUzZWRhZWIxYjE0NmUiCitTUkNSRVYgPSAiYjBlNWVmNGNmN2M4YjQ3
MzExOWUwZDQ4N2EyNmI5NjA1OGU4ZjgwZCIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIFBBQ0tB
R0VDT05GSUcgPz89ICIgXAotLSAKMi40NC4wCgo=

--===============8985367404428386995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.8.1" to "6.9.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.8.1 [default] to 6.9.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: FILELIST: removed "/usr/lib/.debug/libbtrfsutil.so.1.3.0 /usr/lib/.debug/libbtrfs.so.0.1", added "/usr/lib/.debug/libbtrfs.so.0.1.3 /usr/lib/.debug/libbtrfsutil.so.1.3.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 25043400 to 25109456 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.8.1" to "6.9.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.8.1 [default] to 6.9.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 218990 to 219002 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.8.1" to "6.9.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.8.1 [default] to 6.9.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.8.1" to "6.9.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.8.1 [default] to 6.9.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.8.1" to "6.9.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.8.1 [default] to 6.9.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4179972 to 4192255 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.8.1" to "6.9.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.8.1 [default] to 6.9.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.8.1" to "6.9.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.8.1 [default] to 6.9.2 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: FILELIST: directory renamed /usr/lib/python3.12/site-packages/btrfsutil-6.8.1-py3.12.egg-info -> /usr/lib/python3.12/site-packages/btrfsutil-6.9.2-py3.12.egg-info, removed "/usr/lib/libbtrfsutil.so.1.3.0", added "/usr/lib/libbtrfsutil.so.1.3 /usr/lib/libbtrfs.so.0.1.3 /usr/lib/libbtrfsutil.so.1.3.2"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5824852 to 5829244 (+0%)
packages/core2-64-poky-linux/btrfs-tools: PV changed from "6.8.1" to "6.9.2"
packages/core2-64-poky-linux/btrfs-tools: SRC_URI changed from "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch file://0001-convert-handle-rename-of-inode_includes-from-e2fspro.patch" to "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch"
packages/core2-64-poky-linux/btrfs-tools: PKGV changed from 6.8.1 [default] to 6.9.2 [default]
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

--===============8985367404428386995==--

