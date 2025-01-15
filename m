Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3828EC0218D
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:08 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.17864.1736936764377756682
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YMNxAiOP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ke6C+oTD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010194697fb06c-c40a8332-45a1-4792-81cb-cf089de2ed0b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936763;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4nXcihqQT7WCC5i54wBy+sNXgrJJpDkUe0NImLZjlkA=;
	b=YMNxAiOPx0GLFkGFbpbWpk8/7SBBL5PwdZVPJg8Xq/RtOF1b0Pk8zAnGIvXYklgr
	87XfTnwWIE0xnF6W27ZkkyEl+TJtCt2gUFklHonY3fUYM0NL0qAi9lDv7jnJrhEdC/N
	iMcyLDRBIxKadpMWY4/0c2fRwqQOVhji5sgo5cVs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936763;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4nXcihqQT7WCC5i54wBy+sNXgrJJpDkUe0NImLZjlkA=;
	b=ke6C+oTDq8HmL8ZXS2l/Obe0nLOQRRf3GMPWxLJQxazLQN3mWk/MLSyRBFLQZTB6
	LMJrVz/C5DUO8c1dwKhMyRteAuknLiMJaBGJGpgohIFAvrc91hFKOPU/+BE2gbhpa70
	KHnKn5nF8unKG2xEiaJioB/7jDIcyjodagm2ktKU=
Content-Type: multipart/mixed; boundary="===============3937166526027588784=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid,util-linux: upgrading to 2.40.4,2.40.4
 FAILED
Message-ID: <01010194697fb06c-c40a8332-45a1-4792-81cb-cf089de2ed0b-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209831

--===============3937166526027588784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *util-linux-libuuid,util-linux* to *2.40.4,2.40.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-libuuid-util-linux-upgrade-2.40.2-2.40.4-.patch
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
From 7339f7ad49751ea3dbd7139818075938986395d8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 05:19:00 +0000
Subject: [PATCH] util-linux-libuuid,util-linux: upgrade 2.40.2 ->
 2.40.4,2.40.2 -> 2.40.4

---
 ...2.40.2.bb => util-linux-libuuid_2.40.4.bb} |   0
 meta/recipes-core/util-linux/util-linux.inc   |   4 +-
 ...x-securedir-and-pam_lastlog2-install.patch |  82 --------
 ...dd-sector-size-commanand-line-option.patch |  83 ++++++++
 .../util-linux/avoid_parallel_tests.patch     |   4 +-
 .../util-linux/configure-sbindir.patch        |   4 +-
 .../display_testname_for_subtest.patch        |   2 +-
 ...-and-sfdisk-sector-size-improvements.patch | 178 ++----------------
 .../util-linux/util-linux/ptest.patch         |   6 +-
 ...l-linux_2.40.2.bb => util-linux_2.40.4.bb} |   0
 10 files changed, 105 insertions(+), 258 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.40.2.bb => util-linux-libuuid_2.40.4.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-autotools-fix-securedir-and-pam_lastlog2-install.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0005-cfdisk-add-sector-size-commanand-line-option.patch
 rename meta/recipes-core/util-linux/{util-linux_2.40.2.bb => util-linux_2.40.4.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1dc30c0535..c8591270ea 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -38,8 +38,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            file://fcntl-lock.c \
-           file://0001-autotools-fix-securedir-and-pam_lastlog2-install.patch \
            file://libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch \
+           file://0005-cfdisk-add-sector-size-commanand-line-option.patch \
            "
 
-SRC_URI[sha256sum] = "d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3"
+SRC_URI[sha256sum] = "5c1daf733b04e9859afdc3bd87cc481180ee0f88b5c0946b16fdec931975fb79"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-autotools-fix-securedir-and-pam_lastlog2-install.patch b/meta/recipes-core/util-linux/util-linux/0001-autotools-fix-securedir-and-pam_lastlog2-install.patch
deleted file mode 100644
index 272e574a77..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-autotools-fix-securedir-and-pam_lastlog2-install.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From f912fb1bbb0ff5af2736d154347a3b9fc40476eb Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Tue, 27 Aug 2024 12:00:21 +0200
-Subject: [PATCH] autotools: fix securedir and pam_lastlog2 install
-
-Addresses: https://github.com/util-linux/util-linux/pull/3173
-Signed-off-by: Karel Zak <kzak@redhat.com>
-
-Upstream-Status: Backport
-[https://github.com/util-linux/util-linux/commit/9c787eaac43f5f01146f792b0239f587e4b81202]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- Makefile.am                    | 6 +++---
- configure.ac                   | 6 +++---
- pam_lastlog2/src/Makemodule.am | 2 +-
- 3 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index ee2d553..a5dcaea 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -56,7 +56,7 @@ usrsbin_exec_PROGRAMS =
- man_MANS =
- pkgconfig_DATA =
- usrlib_exec_LTLIBRARIES =
--usrsecurelib_exec_LTLIBRARIES =
-+securelib_exec_LTLIBRARIES =
- bin_PROGRAMS =
- sbin_PROGRAMS =
- dist_usrbin_exec_SCRIPTS =
-@@ -155,11 +155,11 @@ EXTRA_DIST += \
- # pylibmountexec module must be installed after usrlib_exec libraries,
- # otherwise the libtool relink step will fail to find libmount.la and
- # will try -lmount which is possibly not available.
--# The same for usrsecurelib_exec and liblastlog2.la
-+# The same for securelib_exec and liblastlog2.la
- #
- # So introduce this dependency rule:
- # install-pylibmountexecLTLIBRARIES: install-usrlib_execLTLIBRARIES
--# install-usrsecurelib_execLTLIBRARIES: install-usrlib_execLTLIBRARIES
-+# install-securelib_execLTLIBRARIES: install-usrlib_execLTLIBRARIES
- @verbatim_extra_dependency@
- 
- #
-diff --git a/configure.ac b/configure.ac
-index 0375d29..134cf38 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -123,8 +123,8 @@ AS_CASE([$libdir],
- )
- AC_SUBST([usrlib_execdir])
- 
--usrsecurelib_execdir='${usrlib_execdir}/security'
--AC_SUBST([usrsecurelib_execdir])
-+securelib_execdir='${libdir}/security'
-+AC_SUBST([securelib_execdir])
- 
- # static configuration maintaned by packages (e.g. /usr/lib)
- AC_ARG_VAR([SYSCONFSTATICDIR],
-@@ -2767,7 +2767,7 @@ verbatim_extra_dependency='
- # otherwise the libtool relink step will fail to find libmount.la and
- # will try -lmount which is possibly not available.
- install-pylibmountexecLTLIBRARIES: install-usrlib_execLTLIBRARIES
--install-usrsecurelib_execLTLIBRARIES: install-usrlib_execLTLIBRARIES
-+install-securelib_execLTLIBRARIES: install-usrlib_execLTLIBRARIES
- 
- '
- AC_SUBST([verbatim_extra_dependency])
-diff --git a/pam_lastlog2/src/Makemodule.am b/pam_lastlog2/src/Makemodule.am
-index 6d23653..a2becac 100644
---- a/pam_lastlog2/src/Makemodule.am
-+++ b/pam_lastlog2/src/Makemodule.am
-@@ -1,4 +1,4 @@
--usrsecurelib_exec_LTLIBRARIES += pam_lastlog2.la
-+securelib_exec_LTLIBRARIES += pam_lastlog2.la
- 
- pam_lastlog2_la_SOURCES = \
- 	pam_lastlog2/src/pam_lastlog2.c
--- 
-2.25.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0005-cfdisk-add-sector-size-commanand-line-option.patch b/meta/recipes-core/util-linux/util-linux/0005-cfdisk-add-sector-size-commanand-line-option.patch
new file mode 100644
index 0000000000..13187a85db
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0005-cfdisk-add-sector-size-commanand-line-option.patch
@@ -0,0 +1,83 @@
+From 5e814bebf8d6ba39fcd2ef6ca63c197b6f6ac83e Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 14 Oct 2024 15:48:46 +0200
+Subject: [PATCH] cfdisk: add --sector-size commanand line option
+
+* improves compatibility with fdisk
+* add ability to work with disk images where libfdisk defaults to 512
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ disk-utils/cfdisk.8.adoc |  3 +++
+ disk-utils/cfdisk.c      | 15 ++++++++++++++-
+ 2 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/disk-utils/cfdisk.8.adoc b/disk-utils/cfdisk.8.adoc
+index 97fad62..759f39f 100644
+--- a/disk-utils/cfdisk.8.adoc
++++ b/disk-utils/cfdisk.8.adoc
+@@ -55,6 +55,9 @@ Use exclusive BSD lock for device or file it operates. The optional argument _mo
+ *-r*, *--read-only*::
+ Forced open in read-only mode.
+ 
++*-b*, *--sector-size* _sectorsize_::
++Specify the sector size of the disk. Valid values are 512, 1024, 2048, and 4096. The kernel is aware of the sector size for regular block devices. Use this option only on very old kernels, when working with disk images, or to override the kernel's default sector size. Since util-linux-2.17, *fdisk* distinguishes between logical and physical sector size. This option changes both sector sizes to the specified _sectorsize_.
++
+ *-z*, *--zero*::
+ Start with an in-memory zeroed partition table. This option does not zero the partition table on the disk; rather, it simply starts the program without reading the existing partition table. This option allows you to create a new partition table from scratch or from an *sfdisk*(8)-compatible script.
+ 
+diff --git a/disk-utils/cfdisk.c b/disk-utils/cfdisk.c
+index 183b767..f37e2d7 100644
+--- a/disk-utils/cfdisk.c
++++ b/disk-utils/cfdisk.c
+@@ -2739,6 +2739,8 @@ static void __attribute__((__noreturn__)) usage(void)
+ 	      _("     --lock[=<mode>]      use exclusive device lock (%s, %s or %s)\n"), "yes", "no", "nonblock");
+ 	fputs(_(" -r, --read-only          forced open cfdisk in read-only mode\n"), out);
+ 
++	fputs(_(" -b, --sector-size <size> physical and logical sector size\n"), out);
++
+ 	fputs(USAGE_SEPARATOR, out);
+ 	fprintf(out, USAGE_HELP_OPTIONS(26));
+ 
+@@ -2751,6 +2753,7 @@ int main(int argc, char *argv[])
+ 	const char *diskpath = NULL, *lockmode = NULL;
+ 	int rc, c, colormode = UL_COLORMODE_UNDEF;
+ 	int read_only = 0;
++	size_t user_ss = 0;
+ 	struct cfdisk _cf = { .lines_idx = 0 },
+ 		      *cf = &_cf;
+ 	enum {
+@@ -2760,6 +2763,7 @@ int main(int argc, char *argv[])
+ 		{ "color",   optional_argument, NULL, 'L' },
+ 		{ "lock",    optional_argument, NULL, OPT_LOCK },
+ 		{ "help",    no_argument,       NULL, 'h' },
++		{ "sector-size", required_argument, NULL, 'b' },
+ 		{ "version", no_argument,       NULL, 'V' },
+ 		{ "zero",    no_argument,	NULL, 'z' },
+ 		{ "read-only", no_argument,     NULL, 'r' },
+@@ -2771,8 +2775,15 @@ int main(int argc, char *argv[])
+ 	textdomain(PACKAGE);
+ 	close_stdout_atexit();
+ 
+-	while((c = getopt_long(argc, argv, "L::hVzr", longopts, NULL)) != -1) {
++	while((c = getopt_long(argc, argv, "b:L::hVzr", longopts, NULL)) != -1) {
+ 		switch(c) {
++		case 'b':
++			user_ss = strtou32_or_err(optarg,
++					_("invalid sector size argument"));
++			if (user_ss != 512 && user_ss != 1024 &&
++			    user_ss != 2048 && user_ss != 4096)
++				errx(EXIT_FAILURE, _("invalid sector size argument"));
++			break;
+ 		case 'h':
+ 			usage();
+ 			break;
+@@ -2811,6 +2822,8 @@ int main(int argc, char *argv[])
+ 	cf->cxt = fdisk_new_context();
+ 	if (!cf->cxt)
+ 		err(EXIT_FAILURE, _("failed to allocate libfdisk context"));
++	if (user_ss)
++		fdisk_save_user_sector_size(cf->cxt, user_ss, user_ss);
+ 
+ 	fdisk_set_ask(cf->cxt, ask_callback, (void *) cf);
+ 
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index 8ea00dbb95..f6989cab86 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From da58b4150f6932de36c962ea657713bcf4ea44be Mon Sep 17 00:00:00 2001
+From b4a350a7716364ef7adc81573fc3ef2a4f727c1a Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 651ef2b..2a8012e 100644
+index f849e9e..c3adc50 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index 74abdc2038..9aa028abd4 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From 0387d71516c978899cfd556ca512f530a212b4a9 Mon Sep 17 00:00:00 2001
+From 1ce2433b988db5a89f43c97a94f248e75239b109 Mon Sep 17 00:00:00 2001
 From: Phil Blundell <pb@pbcl.net>
 Date: Mon, 24 Sep 2012 07:24:51 +0100
 Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 23594ff..651ef2b 100644
+index 07369a5..f849e9e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
index 871b0b2d30..0ddc858557 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,4 @@
-From 45450d0339cd7ee27f53c0f2fac1cc74ed9bbfb8 Mon Sep 17 00:00:00 2001
+From 294401860936a4d4cc96c4469b8255e055026178 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
diff --git a/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch b/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch
index 356194a8ba..697fd6791c 100644
--- a/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch
+++ b/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch
@@ -1,161 +1,7 @@
-From 7ada6547fcd1f649fadaa8021ff21e3e0f431459 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 14 Oct 2024 11:45:32 +0200
-Subject: [PATCH 1/4] libfdisk: make sure libblkid uses the same sector size
-
-Libfdisk uses libblkid to check for filesystems on the device. It
-makes sense for both libraries to share the logical sector size
-setting, as this setting can be modified by using the fdisk command
-line.
-
-We do not see this as an issue, as filesystem detection rarely depends
-on sector size (with the exception of some RAIDs). Additionally,
-libblkid is usually intelligent enough to check multiple locations
-independently of the current device's sector size setting.
-
-Addresses: https://github.com/util-linux/util-linux/pull/3235
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/3237]
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- libfdisk/src/wipe.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/libfdisk/src/wipe.c b/libfdisk/src/wipe.c
-index bb5f1bb38bf..f389ed4194a 100644
---- a/libfdisk/src/wipe.c
-+++ b/libfdisk/src/wipe.c
-@@ -133,6 +133,7 @@ int fdisk_do_wipe(struct fdisk_context *cxt)
- 			DBG(WIPE, ul_debugobj(wp, "blkid_probe_set_device() failed [rc=%d]", rc));
- 			return rc;
- 		}
-+		blkid_probe_set_sectorsize(pr, cxt->sector_size);
- 
- 		DBG(WIPE, ul_debugobj(wp, " wiping..."));
- 		blkid_wipe_all(pr);
-@@ -176,6 +177,8 @@ int fdisk_check_collisions(struct fdisk_context *cxt)
- 	free(cxt->collision);
- 	cxt->collision = NULL;
- 
-+	blkid_probe_set_sectorsize(pr, cxt->sector_size);
-+
- 	blkid_probe_enable_superblocks(pr, 1);
- 	blkid_probe_set_superblocks_flags(pr, BLKID_SUBLKS_TYPE |
- 			                      BLKID_SUBLKS_BADCSUM);
-
-From 54f9a79301dcf492cab8e07134f96a921d367aa0 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 14 Oct 2024 15:47:03 +0200
-Subject: [PATCH 2/4] fdisk: (man) improve --sector-size description
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- disk-utils/fdisk.8.adoc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/disk-utils/fdisk.8.adoc b/disk-utils/fdisk.8.adoc
-index cb72b4a3ea5..5941aa34968 100644
---- a/disk-utils/fdisk.8.adoc
-+++ b/disk-utils/fdisk.8.adoc
-@@ -40,7 +40,7 @@ Note that *partx*(8) provides a rich interface for scripts to print disk layouts
- == OPTIONS
- 
- *-b*, *--sector-size* _sectorsize_::
--Specify the sector size of the disk. Valid values are 512, 1024, 2048, and 4096. (Recent kernels know the sector size. Use this option only on old kernels or to override the kernel's ideas.) Since util-linux-2.17, *fdisk* differentiates between logical and physical sector size. This option changes both sector sizes to _sectorsize_.
-+Specify the sector size of the disk. Valid values are 512, 1024, 2048, and 4096. The kernel is aware of the sector size for regular block devices. Use this option only on very old kernels, when working with disk images, or to override the kernel's default sector size. Since util-linux-2.17, *fdisk* distinguishes between logical and physical sector size. This option changes both sector sizes to the specified _sectorsize_.
- 
- *-B*, *--protect-boot*::
- Don't erase the beginning of the first disk sector when creating a new disk label. This feature is supported for GPT and MBR.
-
-From fd38ee2274f7a30393d3839dfce556260355c3fa Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 14 Oct 2024 15:48:46 +0200
-Subject: [PATCH 3/4] cfdisk: add --sector-size commanand line option
-
-* improves compatibility with fdisk
-* add ability to work with disk images where libfdisk defaults to 512
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- disk-utils/cfdisk.8.adoc |  3 +++
- disk-utils/cfdisk.c      | 15 ++++++++++++++-
- 2 files changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/disk-utils/cfdisk.8.adoc b/disk-utils/cfdisk.8.adoc
-index 97fad621d12..759f39f0e1a 100644
---- a/disk-utils/cfdisk.8.adoc
-+++ b/disk-utils/cfdisk.8.adoc
-@@ -55,6 +55,9 @@ Use exclusive BSD lock for device or file it operates. The optional argument _mo
- *-r*, *--read-only*::
- Forced open in read-only mode.
- 
-+*-b*, *--sector-size* _sectorsize_::
-+Specify the sector size of the disk. Valid values are 512, 1024, 2048, and 4096. The kernel is aware of the sector size for regular block devices. Use this option only on very old kernels, when working with disk images, or to override the kernel's default sector size. Since util-linux-2.17, *fdisk* distinguishes between logical and physical sector size. This option changes both sector sizes to the specified _sectorsize_.
-+
- *-z*, *--zero*::
- Start with an in-memory zeroed partition table. This option does not zero the partition table on the disk; rather, it simply starts the program without reading the existing partition table. This option allows you to create a new partition table from scratch or from an *sfdisk*(8)-compatible script.
- 
-diff --git a/disk-utils/cfdisk.c b/disk-utils/cfdisk.c
-index 2e0aada474a..bc1c87d83e4 100644
---- a/disk-utils/cfdisk.c
-+++ b/disk-utils/cfdisk.c
-@@ -2731,6 +2731,8 @@ static void __attribute__((__noreturn__)) usage(void)
- 	      _("     --lock[=<mode>]      use exclusive device lock (%s, %s or %s)\n"), "yes", "no", "nonblock");
- 	fputs(_(" -r, --read-only          forced open cfdisk in read-only mode\n"), out);
- 
-+	fputs(_(" -b, --sector-size <size> physical and logical sector size\n"), out);
-+
- 	fputs(USAGE_SEPARATOR, out);
- 	fprintf(out, USAGE_HELP_OPTIONS(26));
- 
-@@ -2743,6 +2745,7 @@ int main(int argc, char *argv[])
- 	const char *diskpath = NULL, *lockmode = NULL;
- 	int rc, c, colormode = UL_COLORMODE_UNDEF;
- 	int read_only = 0;
-+	size_t user_ss = 0;
- 	struct cfdisk _cf = { .lines_idx = 0 },
- 		      *cf = &_cf;
- 	enum {
-@@ -2752,6 +2755,7 @@ int main(int argc, char *argv[])
- 		{ "color",   optional_argument, NULL, 'L' },
- 		{ "lock",    optional_argument, NULL, OPT_LOCK },
- 		{ "help",    no_argument,       NULL, 'h' },
-+		{ "sector-size", required_argument, NULL, 'b' },
- 		{ "version", no_argument,       NULL, 'V' },
- 		{ "zero",    no_argument,	NULL, 'z' },
- 		{ "read-only", no_argument,     NULL, 'r' },
-@@ -2763,8 +2767,15 @@ int main(int argc, char *argv[])
- 	textdomain(PACKAGE);
- 	close_stdout_atexit();
- 
--	while((c = getopt_long(argc, argv, "L::hVzr", longopts, NULL)) != -1) {
-+	while((c = getopt_long(argc, argv, "b:L::hVzr", longopts, NULL)) != -1) {
- 		switch(c) {
-+		case 'b':
-+			user_ss = strtou32_or_err(optarg,
-+					_("invalid sector size argument"));
-+			if (user_ss != 512 && user_ss != 1024 &&
-+			    user_ss != 2048 && user_ss != 4096)
-+				errx(EXIT_FAILURE, _("invalid sector size argument"));
-+			break;
- 		case 'h':
- 			usage();
- 			break;
-@@ -2803,6 +2814,8 @@ int main(int argc, char *argv[])
- 	cf->cxt = fdisk_new_context();
- 	if (!cf->cxt)
- 		err(EXIT_FAILURE, _("failed to allocate libfdisk context"));
-+	if (user_ss)
-+		fdisk_save_user_sector_size(cf->cxt, user_ss, user_ss);
- 
- 	fdisk_set_ask(cf->cxt, ask_callback, (void *) cf);
- 
-
-From ef7b76baa17ddb5414691fa8f49d61415c30871c Mon Sep 17 00:00:00 2001
+From 01c6f63f61f8ce835350b6848f10ea7ded52c05c Mon Sep 17 00:00:00 2001
 From: Karel Zak <kzak@redhat.com>
 Date: Mon, 14 Oct 2024 15:50:40 +0200
-Subject: [PATCH 4/4] sfdisk: add --sector-size commanand line option
+Subject: [PATCH] sfdisk: add --sector-size commanand line option
 
 * improves compatibility with fdisk
 * add ability to work with disk images where libfdisk defaults to 512
@@ -168,10 +14,10 @@ Signed-off-by: Karel Zak <kzak@redhat.com>
  2 files changed, 18 insertions(+), 1 deletion(-)
 
 diff --git a/disk-utils/sfdisk.8.adoc b/disk-utils/sfdisk.8.adoc
-index 26ccad5a3b2..ce9e97b7682 100644
+index bc3ff9b..d1eaa37 100644
 --- a/disk-utils/sfdisk.8.adoc
 +++ b/disk-utils/sfdisk.8.adoc
-@@ -208,6 +208,9 @@ The default list of columns may be extended if _list_ is specified in the format
+@@ -201,6 +201,9 @@ The default list of columns may be extended if _list_ is specified in the format
  *-q*, *--quiet*::
  Suppress extra info messages.
  
@@ -181,7 +27,7 @@ index 26ccad5a3b2..ce9e97b7682 100644
  *-u*, *--unit S*::
  Deprecated option. Only the sector unit is supported. This option is not supported when using the *--show-size* command.
  
-@@ -256,7 +259,7 @@ Specify the maximal number of GPT partitions.
+@@ -249,7 +252,7 @@ Specify the maximal number of GPT partitions.
  *grain*::
  Specify minimal size in bytes used to calculate partitions alignment. The default is 1MiB and it's strongly recommended to use the default. Do not modify this variable if you're not sure.
  *sector-size*::
@@ -191,10 +37,10 @@ index 26ccad5a3b2..ce9e97b7682 100644
  Note that it is only possible to use header lines before the first partition is specified in the input.
  
 diff --git a/disk-utils/sfdisk.c b/disk-utils/sfdisk.c
-index cf402007b51..5e7c1d926e4 100644
+index d8dd8d2..97d4265 100644
 --- a/disk-utils/sfdisk.c
 +++ b/disk-utils/sfdisk.c
-@@ -2155,6 +2155,8 @@ static void __attribute__((__noreturn__)) usage(void)
+@@ -2084,6 +2084,8 @@ static void __attribute__((__noreturn__)) usage(void)
  	      _("     --color[=<when>]      colorize output (%s, %s or %s)\n"), "auto", "always", "never");
  	fprintf(out,
  	        "                             %s\n", USAGE_COLORS_DEFAULT);
@@ -203,7 +49,7 @@ index cf402007b51..5e7c1d926e4 100644
  	fprintf(out,
  	      _("     --lock[=<mode>]       use exclusive device lock (%s, %s or %s)\n"), "yes", "no", "nonblock");
  	fputs(_(" -N, --partno <num>        specify partition number\n"), out);
-@@ -2191,6 +2193,7 @@ int main(int argc, char *argv[])
+@@ -2120,6 +2122,7 @@ int main(int argc, char *argv[])
  	const char *outarg = NULL;
  	int rc = -EINVAL, c, longidx = -1, bytes = 0;
  	int colormode = UL_COLORMODE_UNDEF;
@@ -211,7 +57,7 @@ index cf402007b51..5e7c1d926e4 100644
  	struct sfdisk _sf = {
  		.partno = -1,
  		.wipemode = WIPEMODE_AUTO,
-@@ -2217,6 +2220,7 @@ int main(int argc, char *argv[])
+@@ -2145,6 +2148,7 @@ int main(int argc, char *argv[])
  		OPT_NOTELL,
  		OPT_RELOCATE,
  		OPT_LOCK,
@@ -219,7 +65,7 @@ index cf402007b51..5e7c1d926e4 100644
  	};
  
  	static const struct option longopts[] = {
-@@ -2246,6 +2250,7 @@ int main(int argc, char *argv[])
+@@ -2174,6 +2178,7 @@ int main(int argc, char *argv[])
  		{ "output",  required_argument, NULL, 'o' },
  		{ "partno",  required_argument, NULL, 'N' },
  		{ "reorder", no_argument,       NULL, 'r' },
@@ -227,7 +73,7 @@ index cf402007b51..5e7c1d926e4 100644
  		{ "show-geometry", no_argument, NULL, 'g' },
  		{ "quiet",   no_argument,       NULL, 'q' },
  		{ "verify",  no_argument,       NULL, 'V' },
-@@ -2450,6 +2455,13 @@ int main(int argc, char *argv[])
+@@ -2373,6 +2378,13 @@ int main(int argc, char *argv[])
  				sf->lockmode = optarg;
  			}
  			break;
@@ -241,7 +87,7 @@ index cf402007b51..5e7c1d926e4 100644
  		default:
  			errtryhelp(EXIT_FAILURE);
  		}
-@@ -2460,6 +2472,8 @@ int main(int argc, char *argv[])
+@@ -2383,6 +2395,8 @@ int main(int argc, char *argv[])
  	sfdisk_init(sf);
  	if (bytes)
  		fdisk_set_size_unit(sf->cxt, FDISK_SIZEUNIT_BYTES);
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index 7345926b88..8e566e1a2c 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From f9be73c3e2b0a4f0923950dcb058be85d3ee8ed7 Mon Sep 17 00:00:00 2001
+From 92cd7605698b20f14cb8ac5e0a2ecfac54147ba4 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
@@ -10,10 +10,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 50ab8d0..7e2340d 100644
+index 8204bc0..10be2f1 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -64,6 +64,7 @@ tmpfiles_DATA =
+@@ -65,6 +65,7 @@ tmpfiles_DATA =
  dist_bashcompletion_DATA =
  check_PROGRAMS =
  dist_check_SCRIPTS =
diff --git a/meta/recipes-core/util-linux/util-linux_2.40.2.bb b/meta/recipes-core/util-linux/util-linux_2.40.4.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.40.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.40.4.bb
-- 
2.44.1


--===============3937166526027588784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (917 cached, 2 parsed). 1874 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b2fcf9f503bb67a2a1582c324ce079a3340cc522"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 745 Local 277 Mirrors 0 Missed 468 Current 318 (37% match, 55% complete)
Removing 38 stale sstate objects for arch x86_64...done.
Removing 97 stale sstate objects for arch qemux86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
Removing 158 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 374 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 381 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 407 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 425 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pigz/pigz_2.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb:do_create_spdx_setscene)
NOTE: Running setscene task 477 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 485 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 498 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 511 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 514 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 515 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_populate_sysroot_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe which-2.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe socat-1.8.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe grep-3.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bc-1.08.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pigz-native-2.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cwautomacros-native-20110201-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-native-1.08.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-native-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-native-1.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 517 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 519 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cwautomacros-native-20110201-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 523 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 528 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 531 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe bc-native-1.08.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 535 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-native-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-native-1.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 541 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.1.bb:do_create_spdx_setscene)
NOTE: recipe socat-1.8.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 544 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 547 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 551 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb:do_populate_sysroot_setscene)
NOTE: recipe bc-1.08.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 553 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 571 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pigz-native-2.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 581 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 587 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 590 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gawk-5.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 595 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cwautomacros-native-20110201-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-native-8.11.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-native-3.10.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-native-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-native-33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 600 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 607 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-locale-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 613 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 615 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_create_spdx_setscene)
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_create_spdx_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 636 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe curl-native-8.11.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 648 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bc-native-1.08.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 651 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-native-33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-native-3.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 657 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-native-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 662 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 664 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pigz/pigz_2.8.bb:do_recipe_qa_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cwautomacros-native-20110201-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 670 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 673 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-native-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-native-5.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 675 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pigz-native-2.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 677 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 691 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 697 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 702 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bc-native-1.08.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 707 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-native-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 713 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-native-5.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 718 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 723 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 727 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 728 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pigz-native-2.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe systemd-1_257.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 729 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx_setscene)
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 730 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kern-tools-native-0.3+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cwautomacros-native-20110201-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_257.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 733 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.17.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 745 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 747 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-native-10.44-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 748 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cwautomacros-native-20110201-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 749 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 756 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 760 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-jinja2-native-3.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 772 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 776 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 779 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 787 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 791 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kern-tools-native-0.3+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 796 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-native-10.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 797 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 799 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 801 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-protocols-1.39-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.46-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 804 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bc-native-1.08.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 808 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 813 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 818 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perlcross-native-1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 819 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.13.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 820 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 822 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-protocols-1.39-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 823 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 824 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-native-1.08.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 828 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 830 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perlcross-native-1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 832 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 835 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-native-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 836 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.7.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 840 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-native-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 843 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.73-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 847 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_create_spdx_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 849 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 850 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.3.0.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 853 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.47.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 857 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 858 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 859 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kern-tools-native-0.3+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 865 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 866 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 868 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.73-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 869 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 872 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 874 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 875 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kern-tools-native-0.3+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 876 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe rsync-native-3.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 878 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe git-native-2.47.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 880 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 882 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rsync-native-3.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 889 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 890 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 891 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 892 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 893 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 898 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 901 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 912 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-native-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 915 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 921 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 922 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxslt-native-1.1.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe qemu-native-9.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 923 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_create_spdx_setscene)
NOTE: recipe wayland-native-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 927 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxslt-native-1.1.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 931 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe qemu-native-9.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 932 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 934 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 937 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe gdbm-native-1.24-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-native-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 938 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 939 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 940 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 942 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 946 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 947 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 948 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-native-1.24-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-native-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 951 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 952 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-native-3_3.47.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-native-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-native-20250104-3.1-r1: task do_create_spdx_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 956 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 960 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 961 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 962 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-native-3_3.47.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-native-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-native-2.13.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 967 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 972 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe expat-native-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 973 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-native-20250104-3.1-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 974 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 975 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 977 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 984 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe meson-native-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 985 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-native-2.13.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 987 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 988 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-native-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-native-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 991 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 993 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.3.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-native-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe meson-native-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 996 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 997 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-native-75.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-native-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 998 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_stash_locale_setscene)
NOTE: recipe python3-packaging-native-24.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-3.31.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1001 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1004 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1005 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-build-native-1.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1007 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-native-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1010 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-native-75.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1012 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1013 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1016 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cmake-native-3.31.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-build-native-1.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1018 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1020 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1021 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1022 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1024 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1025 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: recipe rpm-native-1_4.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-native-3.7.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1027 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-native-0.192-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1028 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-native-5.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-native-3.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe rpm-native-1_4.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-native-3.7.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1030 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1033 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1038 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-native-3.8.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-native-0.192-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rsync-native-3.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1039 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1042 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-native-5.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-native-3.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-native-3.8.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1044 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1048 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.23.1.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-native-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rsync-native-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 113 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_fetch)
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gettext-minimal-native-0.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-native-3.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-native-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe git-native-2.47.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1052 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1053 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.47.1.bb:do_recipe_qa_setscene)
NOTE: Running task 200 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa)
NOTE: recipe glibc-2.40+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe rsync-native-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1054 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1055 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gettext-minimal-native-0.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Started
NOTE: recipe python3-native-3.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-native-20241223-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 380 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_fetch)
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_recipe_qa: Started
NOTE: recipe git-native-2.47.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 453 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb:do_fetch)
NOTE: Running task 457 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_fetch)
NOTE: Running noexec task 459 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_fetch)
NOTE: Running task 467 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_fetch)
NOTE: Running noexec task 469 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_fetch)
NOTE: Running task 471 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: Running task 473 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_fetch)
NOTE: Running task 475 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_fetch)
NOTE: Running task 477 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 487 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_fetch)
NOTE: Running task 491 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: recipe git-native-2.47.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 495 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_fetch)
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 496 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_fetch)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: Running setscene task 1057 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_fetch: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_fetch: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_fetch: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_fetch: Started
NOTE: recipe python3-native-3.13.1-r0: task do_fetch: Started
NOTE: recipe ca-certificates-native-20241223-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_fetch: Started
NOTE: Running setscene task 1058 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 1061 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_fetch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: Running task 497 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_fetch)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-native-24.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_fetch: Succeeded
NOTE: Running task 498 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_unpack)
NOTE: Running task 499 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_unpack)
NOTE: Running task 500 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_unpack)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ca-certificates-native-20241223-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Started
NOTE: Running task 504 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_fetch)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_unpack: Started
NOTE: recipe ca-certificates-native-20241223-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-native-24.2-r0: task do_unpack: Started
NOTE: Running task 505 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_unpack)
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_fetch: Succeeded
NOTE: Running task 506 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_unpack)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 507 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-build-native-1.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 508 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb:do_unpack)
NOTE: Running task 509 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_patch)
NOTE: recipe python3-packaging-native-24.2-r0: task do_unpack: Succeeded
NOTE: Running task 510 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_patch)
NOTE: Running task 511 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_patch)
NOTE: recipe python3-setuptools-native-75.6.0-r0: task do_fetch: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_unpack: Started
NOTE: Running task 512 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_unpack)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_patch: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_patch: Started
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 513 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb:do_patch)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 515 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_patch)
NOTE: recipe python3-packaging-native-24.2-r0: task do_patch: Succeeded
NOTE: Running task 518 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe python3-setuptools-native-75.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 522 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_fetch)
NOTE: recipe python3-build-native-1.2.2-r0: task do_unpack: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 523 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_patch)
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_patch: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 532 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_fetch)
NOTE: Running task 534 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_fetch: Started
NOTE: Running task 546 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_unpack)
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_patch: Succeeded
NOTE: Running task 555 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa)
NOTE: recipe python3-build-native-1.2.2-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: recipe xz-5.6.3-r0: task do_fetch: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 558 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_fetch)
NOTE: recipe python3-setuptools-native-75.6.0-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.40.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-native-75.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 559 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_patch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_fetch: Started
NOTE: recipe python3-native-3.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 560 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 561 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_unpack: Succeeded
NOTE: Running task 562 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch)
NOTE: recipe python3-setuptools-native-75.6.0-r0: task do_patch: Started
NOTE: recipe glibc-2.40+git-r0: task do_fetch: Succeeded
NOTE: Running task 563 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.40.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 567 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_fetch)
NOTE: Running task 572 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_fetch)
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_patch: Started
NOTE: recipe python3-native-3.13.1-r0: task do_unpack: Started
NOTE: recipe glibc-2.40+git-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-75.6.0-r0: task do_patch: Succeeded
NOTE: Running task 583 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.6.1.bb:do_fetch)
NOTE: recipe libarchive-native-3.7.7-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.40.4-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.40.4-r0: task do_fetch: Succeeded
NOTE: Running task 586 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_unpack)
NOTE: recipe meson-native-1.6.1-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.40.4-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 587 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe expat-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 588 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe libarchive-native-3.7.7-r0: task do_fetch: Succeeded
NOTE: Running task 589 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_unpack)
NOTE: recipe expat-2.6.4-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_unpack: Started
NOTE: recipe expat-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 590 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_patch)
NOTE: Running task 595 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: recipe expat-2.6.4-r0: task do_patch: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 596 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_14.2.bb:do_fetch)
NOTE: recipe util-linux-native-2.40.4-r0: task do_unpack: Succeeded
NOTE: recipe gcc-source-14.2.0-14.2.0-r0: task do_fetch: Started
NOTE: recipe expat-2.6.4-r0: task do_patch: Succeeded
NOTE: Running task 598 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_patch)
NOTE: Running task 600 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 601 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.40.4-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe xz-5.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 602 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 606 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_fetch)
NOTE: recipe xz-5.6.3-r0: task do_unpack: Started
NOTE: recipe python3-native-3.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 607 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_patch)
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: Running task 608 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: recipe gnutls-native-3.8.8-r0: task do_fetch: Started
NOTE: recipe xz-5.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 609 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_patch)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_unpack: Succeeded
NOTE: Running task 610 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_patch)
NOTE: recipe python3-native-3.13.1-r0: task do_patch: Started
NOTE: recipe xz-5.6.3-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: Running task 611 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: recipe xz-5.6.3-r0: task do_patch: Succeeded
NOTE: Running task 613 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe meson-native-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 617 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_fetch)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 624 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_unpack)
NOTE: Running task 625 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe elfutils-native-0.192-r0: task do_fetch: Started
NOTE: recipe openssl-3.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 626 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_unpack)
NOTE: recipe elfutils-native-0.192-r0: task do_fetch: Succeeded
NOTE: Running task 630 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.6.1.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: Running task 645 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe libarchive-native-3.7.7-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_unpack: Started
NOTE: Running task 646 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe meson-native-1.6.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_patch: Succeeded
NOTE: Running task 647 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_unpack)
NOTE: recipe libarchive-native-3.7.7-r0: task do_unpack: Succeeded
NOTE: Running task 648 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_patch)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 649 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: recipe elfutils-native-0.192-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.7.7-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_patch: Started
NOTE: Running task 652 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_fetch)
NOTE: recipe libarchive-native-3.7.7-r0: task do_patch: Succeeded
NOTE: Running task 661 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_generate_toolchain_file)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 664 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb:do_fetch)
NOTE: recipe gnutls-native-3.8.8-r0: task do_fetch: Succeeded
NOTE: Running task 665 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_unpack)
NOTE: recipe rpm-native-1_4.20.0-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.37-r0: task do_fetch: Started
NOTE: recipe expat-2.6.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe meson-native-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 666 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.6.1.bb:do_patch)
NOTE: recipe expat-2.6.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 668 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe gnutls-native-3.8.8-r0: task do_unpack: Started
NOTE: recipe meson-native-1.6.1-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.37-r0: task do_fetch: Succeeded
NOTE: Running task 704 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: recipe openssl-3.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 705 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_patch)
NOTE: recipe glibc-2.40+git-r0: task do_unpack: Succeeded
NOTE: Running task 706 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_patch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 708 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_fetch)
NOTE: recipe openssl-3.4.0-r0: task do_patch: Started
NOTE: recipe glibc-2.40+git-r0: task do_patch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 709 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Started
NOTE: recipe meson-native-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 713 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_fetch)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Started
NOTE: recipe python3-native-3.13.1-r0: task do_patch: Succeeded
NOTE: Running task 715 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_fetch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 716 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_fetch: Succeeded
NOTE: Running task 719 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.37-r0: task do_unpack: Started
NOTE: recipe qemu-native-9.2.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.4.0-r0: task do_patch: Succeeded
NOTE: Running task 722 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_fetch)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Started
NOTE: recipe gnutls-native-3.8.8-r0: task do_unpack: Succeeded
NOTE: Running task 723 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_patch)
NOTE: recipe libxml2-native-2.13.5-r0: task do_fetch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 725 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: recipe elfutils-native-0.192-r0: task do_unpack: Succeeded
NOTE: Running task 726 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_patch)
NOTE: recipe gnutls-native-3.8.8-r0: task do_patch: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 727 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.192-r0: task do_patch: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.37-r0: task do_unpack: Succeeded
NOTE: Running task 728 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb:do_patch)
NOTE: recipe gnutls-native-3.8.8-r0: task do_patch: Succeeded
NOTE: Running task 753 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.37-r0: task do_patch: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 754 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 755 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: recipe libidn2-native-2.3.7-r0: task do_patch: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.4.37-r0: task do_patch: Succeeded
NOTE: Running task 757 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_unpack)
NOTE: Running task 759 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_fetch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Started
NOTE: Running task 761 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_fetch: Started
NOTE: recipe glibc-2.40+git-r0: task do_patch: Succeeded
NOTE: Running task 763 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa: Started
NOTE: recipe elfutils-native-0.192-r0: task do_patch: Succeeded
NOTE: Running task 767 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_fetch)
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Started
NOTE: recipe libxml2-native-2.13.5-r0: task do_fetch: Succeeded
NOTE: Running task 768 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 769 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_fetch)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_unpack: Succeeded
NOTE: Running task 770 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Succeeded
NOTE: Running task 771 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Succeeded
NOTE: Running task 773 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Started
NOTE: recipe python3-3.13.1-r0: task do_fetch: Started
NOTE: recipe python3-3.13.1-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 774 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_unpack)
NOTE: Running task 775 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_patch)
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Started
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 776 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: recipe libxml2-native-2.13.5-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Succeeded
NOTE: Running task 778 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_unpack)
NOTE: Running task 805 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Succeeded
NOTE: Running task 806 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_patch)
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 807 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_patch)
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Started
NOTE: recipe libpam-1.7.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 808 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_unpack)
NOTE: Running task 809 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_unpack)
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Succeeded
NOTE: Running task 811 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 813 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_write_config)
NOTE: recipe libxml2-native-2.13.5-r0: task do_unpack: Succeeded
NOTE: Running task 814 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_patch)
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Started
NOTE: recipe python3-3.13.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 815 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_write_config: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-native-2.13.5-r0: task do_patch: Started
NOTE: Running task 816 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_write_config: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_patch: Started
NOTE: Running task 818 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_write_config)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Started
NOTE: recipe libxml2-native-2.13.5-r0: task do_patch: Succeeded
NOTE: Running task 824 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Started
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Started
NOTE: Running task 826 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe libffi-3.4.6-r0: task do_patch: Succeeded
NOTE: Running task 829 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Succeeded
NOTE: Running task 830 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 831 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 832 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 833 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-3.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 834 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 838 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_fetch)
NOTE: recipe nettle-3.10.1-r0: task do_fetch: Started
NOTE: recipe python3-3.13.1-r0: task do_patch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 839 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_fetch)
NOTE: recipe libgpg-error-1.51-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 840 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_unpack)
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 841 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_patch)
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 842 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Succeeded
NOTE: Running task 847 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_unpack)
NOTE: recipe libgpg-error-1.51-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: Running task 848 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_unpack)
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.51-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.51-r0: task do_unpack: Succeeded
NOTE: Running task 849 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_patch)
NOTE: recipe libgpg-error-1.51-r0: task do_patch: Started
NOTE: recipe python3-3.13.1-r0: task do_patch: Succeeded
NOTE: Running task 852 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_fetch)
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 853 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_fetch: Started
NOTE: Running task 854 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_patch: Failed
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.51-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe qemu-native-9.2.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.40.4-r0: task do_patch: Failed
NOTE: recipe libpcre2-10.44-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Failed
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: recipe rpm-native-1_4.20.0-r0: task do_fetch: Succeeded
NOTE: recipe gcc-source-14.2.0-14.2.0-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 855 tasks of which 712 didn't need to be rerun and 3 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250115051742.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250115051742.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 3 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/util-linux-libuuid-native/2.40.4/temp/log.do_patch.826094
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/util-linux-native/2.40.4/temp/log.do_patch.827339
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/util-linux-libuuid/2.40.4/temp/log.do_patch.834499
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-libuuid-native-2.40.4-r0 do_patch: QA Issue: Missing Upstream-Status in patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch
Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
ERROR: util-linux-libuuid-native-2.40.4-r0 do_patch: QA Issue: Missing Upstream-Status in patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux/0005-cfdisk-add-sector-size-commanand-line-option.patch
Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
ERROR: util-linux-libuuid-native-2.40.4-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: util-linux-native-2.40.4-r0 do_patch: QA Issue: Missing Upstream-Status in patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch
Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
ERROR: util-linux-native-2.40.4-r0 do_patch: QA Issue: Missing Upstream-Status in patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux/0005-cfdisk-add-sector-size-commanand-line-option.patch
Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
ERROR: util-linux-native-2.40.4-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: util-linux-libuuid-2.40.4-r0 do_patch: QA Issue: Missing Upstream-Status in patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch
Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
ERROR: util-linux-libuuid-2.40.4-r0 do_patch: QA Issue: Missing Upstream-Status in patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux/0005-cfdisk-add-sector-size-commanand-line-option.patch
Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
ERROR: util-linux-libuuid-2.40.4-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/util-linux-libuuid-native/2.40.4/temp/log.do_patch.826094
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/util-linux-native/2.40.4/temp/log.do_patch.827339
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/util-linux-libuuid/2.40.4/temp/log.do_patch.834499
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch) failed with exit code '1'

--===============3937166526027588784==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-libuuid-util-linux-upgrade-2.40.2-2.40.4-.patch"

RnJvbSA3MzM5ZjdhZDQ5NzUxZWEzZGJkNzEzOTgxODA3NTkzODk4NjM5NWQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDU6MTk6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGlsLWxpbnV4LWxpYnV1aWQsdXRpbC1saW51eDogdXBncmFkZSAyLjQwLjIgLT4KIDIuNDAuNCwy
LjQwLjIgLT4gMi40MC40CgotLS0KIC4uLjIuNDAuMi5iYiA9PiB1dGlsLWxpbnV4LWxpYnV1aWRf
Mi40MC40LmJifSB8ICAgMAogbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4
LmluYyAgIHwgICA0ICstCiAuLi54LXNlY3VyZWRpci1hbmQtcGFtX2xhc3Rsb2cyLWluc3RhbGwu
cGF0Y2ggfCAgODIgLS0tLS0tLS0KIC4uLmRkLXNlY3Rvci1zaXplLWNvbW1hbmFuZC1saW5lLW9w
dGlvbi5wYXRjaCB8ICA4MyArKysrKysrKwogLi4uL3V0aWwtbGludXgvYXZvaWRfcGFyYWxsZWxf
dGVzdHMucGF0Y2ggICAgIHwgICA0ICstCiAuLi4vdXRpbC1saW51eC9jb25maWd1cmUtc2JpbmRp
ci5wYXRjaCAgICAgICAgfCAgIDQgKy0KIC4uLi9kaXNwbGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0
LnBhdGNoICAgICAgICB8ICAgMiArLQogLi4uLWFuZC1zZmRpc2stc2VjdG9yLXNpemUtaW1wcm92
ZW1lbnRzLnBhdGNoIHwgMTc4ICsrLS0tLS0tLS0tLS0tLS0tLQogLi4uL3V0aWwtbGludXgvdXRp
bC1saW51eC9wdGVzdC5wYXRjaCAgICAgICAgIHwgICA2ICstCiAuLi5sLWxpbnV4XzIuNDAuMi5i
YiA9PiB1dGlsLWxpbnV4XzIuNDAuNC5iYn0gfCAgIDAKIDEwIGZpbGVzIGNoYW5nZWQsIDEwNSBp
bnNlcnRpb25zKCspLCAyNTggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUv
dXRpbC1saW51eC97dXRpbC1saW51eC1saWJ1dWlkXzIuNDAuMi5iYiA9PiB1dGlsLWxpbnV4LWxp
YnV1aWRfMi40MC40LmJifSAoMTAwJSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMt
Y29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1hdXRvdG9vbHMtZml4LXNlY3VyZWRpci1h
bmQtcGFtX2xhc3Rsb2cyLWluc3RhbGwucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3Jl
Y2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwNS1jZmRpc2stYWRkLXNlY3Rvci1z
aXplLWNvbW1hbmFuZC1saW5lLW9wdGlvbi5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3Jl
L3V0aWwtbGludXgve3V0aWwtbGludXhfMi40MC4yLmJiID0+IHV0aWwtbGludXhfMi40MC40LmJi
fSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXgtbGlidXVpZF8yLjQwLjIuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0
aWwtbGludXgtbGlidXVpZF8yLjQwLjQuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIuNDAu
Mi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxp
YnV1aWRfMi40MC40LmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4
L3V0aWwtbGludXguaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4
LmluYwppbmRleCAxZGMzMGMwNTM1Li5jODU5MTI3MGVhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jCisrKyBiL21ldGEvcmVjaXBlcy1jb3Jl
L3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMKQEAgLTM4LDggKzM4LDggQEAgU1JDX1VSSSA9ICIk
e0tFUk5FTE9SR19NSVJST1J9L2xpbnV4L3V0aWxzL3V0aWwtbGludXgvdiR7TUFKT1JfVkVSU0lP
Tn0vdXRpbC1saW4KICAgICAgICAgICAgZmlsZTovL2Rpc3BsYXlfdGVzdG5hbWVfZm9yX3N1YnRl
c3QucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gg
XAogICAgICAgICAgICBmaWxlOi8vZmNudGwtbG9jay5jIFwKLSAgICAgICAgICAgZmlsZTovLzAw
MDEtYXV0b3Rvb2xzLWZpeC1zZWN1cmVkaXItYW5kLXBhbV9sYXN0bG9nMi1pbnN0YWxsLnBhdGNo
IFwKICAgICAgICAgICAgZmlsZTovL2xpYmZkaXNrLWNmZGlzay1hbmQtc2ZkaXNrLXNlY3Rvci1z
aXplLWltcHJvdmVtZW50cy5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDA1LWNmZGlzay1h
ZGQtc2VjdG9yLXNpemUtY29tbWFuYW5kLWxpbmUtb3B0aW9uLnBhdGNoIFwKICAgICAgICAgICAg
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDc4YjM3YTY2ZjU5MjJkNzBlZGYzYmRmYjAxYTZi
MzNkMzRlZDNjM2NhZmQ2NjI4MjAzYjJhMmI2N2M4ZThiMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI1YzFkYWY3MzNiMDRlOTg1OWFmZGMzYmQ4N2NjNDgxMTgwZWUwZjg4YjVjMDk0NmIxNmZkZWM5
MzE5NzVmYjc5IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGls
LWxpbnV4LzAwMDEtYXV0b3Rvb2xzLWZpeC1zZWN1cmVkaXItYW5kLXBhbV9sYXN0bG9nMi1pbnN0
YWxsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEt
YXV0b3Rvb2xzLWZpeC1zZWN1cmVkaXItYW5kLXBhbV9sYXN0bG9nMi1pbnN0YWxsLnBhdGNoCmRl
bGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAyNzJlNTc0YTc3Li4wMDAwMDAwMDAwCi0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWF1dG90b29scy1m
aXgtc2VjdXJlZGlyLWFuZC1wYW1fbGFzdGxvZzItaW5zdGFsbC5wYXRjaAorKysgL2Rldi9udWxs
CkBAIC0xLDgyICswLDAgQEAKLUZyb20gZjkxMmZiMWJiYjBmZjVhZjI3MzZkMTU0MzQ3YTNiOWZj
NDA0NzZlYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEthcmVsIFphayA8a3pha0By
ZWRoYXQuY29tPgotRGF0ZTogVHVlLCAyNyBBdWcgMjAyNCAxMjowMDoyMSArMDIwMAotU3ViamVj
dDogW1BBVENIXSBhdXRvdG9vbHM6IGZpeCBzZWN1cmVkaXIgYW5kIHBhbV9sYXN0bG9nMiBpbnN0
YWxsCi0KLUFkZHJlc3NlczogaHR0cHM6Ly9naXRodWIuY29tL3V0aWwtbGludXgvdXRpbC1saW51
eC9wdWxsLzMxNzMKLVNpZ25lZC1vZmYtYnk6IEthcmVsIFphayA8a3pha0ByZWRoYXQuY29tPgot
Ci1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0Ci1baHR0cHM6Ly9naXRodWIuY29tL3V0aWwtbGlu
dXgvdXRpbC1saW51eC9jb21taXQvOWM3ODdlYWFjNDNmNWYwMTE0NmY3OTJiMDIzOWY1ODdlNGI4
MTIwMl0KLQotU2lnbmVkLW9mZi1ieTogWWkgWmhhbyA8eWkuemhhb0B3aW5kcml2ZXIuY29tPgot
LS0tCi0gTWFrZWZpbGUuYW0gICAgICAgICAgICAgICAgICAgIHwgNiArKystLS0KLSBjb25maWd1
cmUuYWMgICAgICAgICAgICAgICAgICAgfCA2ICsrKy0tLQotIHBhbV9sYXN0bG9nMi9zcmMvTWFr
ZW1vZHVsZS5hbSB8IDIgKy0KLSAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIvTWFrZWZpbGUuYW0KLWlu
ZGV4IGVlMmQ1NTMuLmE1ZGNhZWEgMTAwNjQ0Ci0tLS0gYS9NYWtlZmlsZS5hbQotKysrIGIvTWFr
ZWZpbGUuYW0KLUBAIC01Niw3ICs1Niw3IEBAIHVzcnNiaW5fZXhlY19QUk9HUkFNUyA9Ci0gbWFu
X01BTlMgPQotIHBrZ2NvbmZpZ19EQVRBID0KLSB1c3JsaWJfZXhlY19MVExJQlJBUklFUyA9Ci0t
dXNyc2VjdXJlbGliX2V4ZWNfTFRMSUJSQVJJRVMgPQotK3NlY3VyZWxpYl9leGVjX0xUTElCUkFS
SUVTID0KLSBiaW5fUFJPR1JBTVMgPQotIHNiaW5fUFJPR1JBTVMgPQotIGRpc3RfdXNyYmluX2V4
ZWNfU0NSSVBUUyA9Ci1AQCAtMTU1LDExICsxNTUsMTEgQEAgRVhUUkFfRElTVCArPSBcCi0gIyBw
eWxpYm1vdW50ZXhlYyBtb2R1bGUgbXVzdCBiZSBpbnN0YWxsZWQgYWZ0ZXIgdXNybGliX2V4ZWMg
bGlicmFyaWVzLAotICMgb3RoZXJ3aXNlIHRoZSBsaWJ0b29sIHJlbGluayBzdGVwIHdpbGwgZmFp
bCB0byBmaW5kIGxpYm1vdW50LmxhIGFuZAotICMgd2lsbCB0cnkgLWxtb3VudCB3aGljaCBpcyBw
b3NzaWJseSBub3QgYXZhaWxhYmxlLgotLSMgVGhlIHNhbWUgZm9yIHVzcnNlY3VyZWxpYl9leGVj
IGFuZCBsaWJsYXN0bG9nMi5sYQotKyMgVGhlIHNhbWUgZm9yIHNlY3VyZWxpYl9leGVjIGFuZCBs
aWJsYXN0bG9nMi5sYQotICMKLSAjIFNvIGludHJvZHVjZSB0aGlzIGRlcGVuZGVuY3kgcnVsZToK
LSAjIGluc3RhbGwtcHlsaWJtb3VudGV4ZWNMVExJQlJBUklFUzogaW5zdGFsbC11c3JsaWJfZXhl
Y0xUTElCUkFSSUVTCi0tIyBpbnN0YWxsLXVzcnNlY3VyZWxpYl9leGVjTFRMSUJSQVJJRVM6IGlu
c3RhbGwtdXNybGliX2V4ZWNMVExJQlJBUklFUwotKyMgaW5zdGFsbC1zZWN1cmVsaWJfZXhlY0xU
TElCUkFSSUVTOiBpbnN0YWxsLXVzcmxpYl9leGVjTFRMSUJSQVJJRVMKLSBAdmVyYmF0aW1fZXh0
cmFfZGVwZW5kZW5jeUAKLSAKLSAjCi1kaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmln
dXJlLmFjCi1pbmRleCAwMzc1ZDI5Li4xMzRjZjM4IDEwMDY0NAotLS0tIGEvY29uZmlndXJlLmFj
Ci0rKysgYi9jb25maWd1cmUuYWMKLUBAIC0xMjMsOCArMTIzLDggQEAgQVNfQ0FTRShbJGxpYmRp
cl0sCi0gKQotIEFDX1NVQlNUKFt1c3JsaWJfZXhlY2Rpcl0pCi0gCi0tdXNyc2VjdXJlbGliX2V4
ZWNkaXI9JyR7dXNybGliX2V4ZWNkaXJ9L3NlY3VyaXR5JwotLUFDX1NVQlNUKFt1c3JzZWN1cmVs
aWJfZXhlY2Rpcl0pCi0rc2VjdXJlbGliX2V4ZWNkaXI9JyR7bGliZGlyfS9zZWN1cml0eScKLStB
Q19TVUJTVChbc2VjdXJlbGliX2V4ZWNkaXJdKQotIAotICMgc3RhdGljIGNvbmZpZ3VyYXRpb24g
bWFpbnRhbmVkIGJ5IHBhY2thZ2VzIChlLmcuIC91c3IvbGliKQotIEFDX0FSR19WQVIoW1NZU0NP
TkZTVEFUSUNESVJdLAotQEAgLTI3NjcsNyArMjc2Nyw3IEBAIHZlcmJhdGltX2V4dHJhX2RlcGVu
ZGVuY3k9JwotICMgb3RoZXJ3aXNlIHRoZSBsaWJ0b29sIHJlbGluayBzdGVwIHdpbGwgZmFpbCB0
byBmaW5kIGxpYm1vdW50LmxhIGFuZAotICMgd2lsbCB0cnkgLWxtb3VudCB3aGljaCBpcyBwb3Nz
aWJseSBub3QgYXZhaWxhYmxlLgotIGluc3RhbGwtcHlsaWJtb3VudGV4ZWNMVExJQlJBUklFUzog
aW5zdGFsbC11c3JsaWJfZXhlY0xUTElCUkFSSUVTCi0taW5zdGFsbC11c3JzZWN1cmVsaWJfZXhl
Y0xUTElCUkFSSUVTOiBpbnN0YWxsLXVzcmxpYl9leGVjTFRMSUJSQVJJRVMKLStpbnN0YWxsLXNl
Y3VyZWxpYl9leGVjTFRMSUJSQVJJRVM6IGluc3RhbGwtdXNybGliX2V4ZWNMVExJQlJBUklFUwot
IAotICcKLSBBQ19TVUJTVChbdmVyYmF0aW1fZXh0cmFfZGVwZW5kZW5jeV0pCi1kaWZmIC0tZ2l0
IGEvcGFtX2xhc3Rsb2cyL3NyYy9NYWtlbW9kdWxlLmFtIGIvcGFtX2xhc3Rsb2cyL3NyYy9NYWtl
bW9kdWxlLmFtCi1pbmRleCA2ZDIzNjUzLi5hMmJlY2FjIDEwMDY0NAotLS0tIGEvcGFtX2xhc3Rs
b2cyL3NyYy9NYWtlbW9kdWxlLmFtCi0rKysgYi9wYW1fbGFzdGxvZzIvc3JjL01ha2Vtb2R1bGUu
YW0KLUBAIC0xLDQgKzEsNCBAQAotLXVzcnNlY3VyZWxpYl9leGVjX0xUTElCUkFSSUVTICs9IHBh
bV9sYXN0bG9nMi5sYQotK3NlY3VyZWxpYl9leGVjX0xUTElCUkFSSUVTICs9IHBhbV9sYXN0bG9n
Mi5sYQotIAotIHBhbV9sYXN0bG9nMl9sYV9TT1VSQ0VTID0gXAotIAlwYW1fbGFzdGxvZzIvc3Jj
L3BhbV9sYXN0bG9nMi5jCi0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwNS1jZmRpc2stYWRkLXNlY3Rvci1zaXplLWNv
bW1hbmFuZC1saW5lLW9wdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC8wMDA1LWNmZGlzay1hZGQtc2VjdG9yLXNpemUtY29tbWFuYW5kLWxpbmUtb3B0
aW9uLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjEzMTg3YTg1
ZGIKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXgvMDAwNS1jZmRpc2stYWRkLXNlY3Rvci1zaXplLWNvbW1hbmFuZC1saW5lLW9wdGlvbi5w
YXRjaApAQCAtMCwwICsxLDgzIEBACitGcm9tIDVlODE0YmViZjhkNmJhMzlmY2QyZWY2Y2E2M2Mx
OTdiNmY2YWM4M2UgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBLYXJlbCBaYWsgPGt6
YWtAcmVkaGF0LmNvbT4KK0RhdGU6IE1vbiwgMTQgT2N0IDIwMjQgMTU6NDg6NDYgKzAyMDAKK1N1
YmplY3Q6IFtQQVRDSF0gY2ZkaXNrOiBhZGQgLS1zZWN0b3Itc2l6ZSBjb21tYW5hbmQgbGluZSBv
cHRpb24KKworKiBpbXByb3ZlcyBjb21wYXRpYmlsaXR5IHdpdGggZmRpc2sKKyogYWRkIGFiaWxp
dHkgdG8gd29yayB3aXRoIGRpc2sgaW1hZ2VzIHdoZXJlIGxpYmZkaXNrIGRlZmF1bHRzIHRvIDUx
MgorCitTaWduZWQtb2ZmLWJ5OiBLYXJlbCBaYWsgPGt6YWtAcmVkaGF0LmNvbT4KKy0tLQorIGRp
c2stdXRpbHMvY2ZkaXNrLjguYWRvYyB8ICAzICsrKworIGRpc2stdXRpbHMvY2ZkaXNrLmMgICAg
ICB8IDE1ICsrKysrKysrKysrKysrLQorIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0tZ2l0IGEvZGlzay11dGlscy9jZmRpc2suOC5hZG9j
IGIvZGlzay11dGlscy9jZmRpc2suOC5hZG9jCitpbmRleCA5N2ZhZDYyLi43NTlmMzlmIDEwMDY0
NAorLS0tIGEvZGlzay11dGlscy9jZmRpc2suOC5hZG9jCisrKysgYi9kaXNrLXV0aWxzL2NmZGlz
ay44LmFkb2MKK0BAIC01NSw2ICs1NSw5IEBAIFVzZSBleGNsdXNpdmUgQlNEIGxvY2sgZm9yIGRl
dmljZSBvciBmaWxlIGl0IG9wZXJhdGVzLiBUaGUgb3B0aW9uYWwgYXJndW1lbnQgX21vCisgKi1y
KiwgKi0tcmVhZC1vbmx5Kjo6CisgRm9yY2VkIG9wZW4gaW4gcmVhZC1vbmx5IG1vZGUuCisgCisr
Ki1iKiwgKi0tc2VjdG9yLXNpemUqIF9zZWN0b3JzaXplXzo6CisrU3BlY2lmeSB0aGUgc2VjdG9y
IHNpemUgb2YgdGhlIGRpc2suIFZhbGlkIHZhbHVlcyBhcmUgNTEyLCAxMDI0LCAyMDQ4LCBhbmQg
NDA5Ni4gVGhlIGtlcm5lbCBpcyBhd2FyZSBvZiB0aGUgc2VjdG9yIHNpemUgZm9yIHJlZ3VsYXIg
YmxvY2sgZGV2aWNlcy4gVXNlIHRoaXMgb3B0aW9uIG9ubHkgb24gdmVyeSBvbGQga2VybmVscywg
d2hlbiB3b3JraW5nIHdpdGggZGlzayBpbWFnZXMsIG9yIHRvIG92ZXJyaWRlIHRoZSBrZXJuZWwn
cyBkZWZhdWx0IHNlY3RvciBzaXplLiBTaW5jZSB1dGlsLWxpbnV4LTIuMTcsICpmZGlzayogZGlz
dGluZ3Vpc2hlcyBiZXR3ZWVuIGxvZ2ljYWwgYW5kIHBoeXNpY2FsIHNlY3RvciBzaXplLiBUaGlz
IG9wdGlvbiBjaGFuZ2VzIGJvdGggc2VjdG9yIHNpemVzIHRvIHRoZSBzcGVjaWZpZWQgX3NlY3Rv
cnNpemVfLgorKworICoteiosICotLXplcm8qOjoKKyBTdGFydCB3aXRoIGFuIGluLW1lbW9yeSB6
ZXJvZWQgcGFydGl0aW9uIHRhYmxlLiBUaGlzIG9wdGlvbiBkb2VzIG5vdCB6ZXJvIHRoZSBwYXJ0
aXRpb24gdGFibGUgb24gdGhlIGRpc2s7IHJhdGhlciwgaXQgc2ltcGx5IHN0YXJ0cyB0aGUgcHJv
Z3JhbSB3aXRob3V0IHJlYWRpbmcgdGhlIGV4aXN0aW5nIHBhcnRpdGlvbiB0YWJsZS4gVGhpcyBv
cHRpb24gYWxsb3dzIHlvdSB0byBjcmVhdGUgYSBuZXcgcGFydGl0aW9uIHRhYmxlIGZyb20gc2Ny
YXRjaCBvciBmcm9tIGFuICpzZmRpc2sqKDgpLWNvbXBhdGlibGUgc2NyaXB0LgorIAorZGlmZiAt
LWdpdCBhL2Rpc2stdXRpbHMvY2ZkaXNrLmMgYi9kaXNrLXV0aWxzL2NmZGlzay5jCitpbmRleCAx
ODNiNzY3Li5mMzdlMmQ3IDEwMDY0NAorLS0tIGEvZGlzay11dGlscy9jZmRpc2suYworKysrIGIv
ZGlzay11dGlscy9jZmRpc2suYworQEAgLTI3MzksNiArMjczOSw4IEBAIHN0YXRpYyB2b2lkIF9f
YXR0cmlidXRlX18oKF9fbm9yZXR1cm5fXykpIHVzYWdlKHZvaWQpCisgCSAgICAgIF8oIiAgICAg
LS1sb2NrWz08bW9kZT5dICAgICAgdXNlIGV4Y2x1c2l2ZSBkZXZpY2UgbG9jayAoJXMsICVzIG9y
ICVzKVxuIiksICJ5ZXMiLCAibm8iLCAibm9uYmxvY2siKTsKKyAJZnB1dHMoXygiIC1yLCAtLXJl
YWQtb25seSAgICAgICAgICBmb3JjZWQgb3BlbiBjZmRpc2sgaW4gcmVhZC1vbmx5IG1vZGVcbiIp
LCBvdXQpOworIAorKwlmcHV0cyhfKCIgLWIsIC0tc2VjdG9yLXNpemUgPHNpemU+IHBoeXNpY2Fs
IGFuZCBsb2dpY2FsIHNlY3RvciBzaXplXG4iKSwgb3V0KTsKKysKKyAJZnB1dHMoVVNBR0VfU0VQ
QVJBVE9SLCBvdXQpOworIAlmcHJpbnRmKG91dCwgVVNBR0VfSEVMUF9PUFRJT05TKDI2KSk7Cisg
CitAQCAtMjc1MSw2ICsyNzUzLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkK
KyAJY29uc3QgY2hhciAqZGlza3BhdGggPSBOVUxMLCAqbG9ja21vZGUgPSBOVUxMOworIAlpbnQg
cmMsIGMsIGNvbG9ybW9kZSA9IFVMX0NPTE9STU9ERV9VTkRFRjsKKyAJaW50IHJlYWRfb25seSA9
IDA7CisrCXNpemVfdCB1c2VyX3NzID0gMDsKKyAJc3RydWN0IGNmZGlzayBfY2YgPSB7IC5saW5l
c19pZHggPSAwIH0sCisgCQkgICAgICAqY2YgPSAmX2NmOworIAllbnVtIHsKK0BAIC0yNzYwLDYg
KzI3NjMsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQorIAkJeyAiY29sb3Ii
LCAgIG9wdGlvbmFsX2FyZ3VtZW50LCBOVUxMLCAnTCcgfSwKKyAJCXsgImxvY2siLCAgICBvcHRp
b25hbF9hcmd1bWVudCwgTlVMTCwgT1BUX0xPQ0sgfSwKKyAJCXsgImhlbHAiLCAgICBub19hcmd1
bWVudCwgICAgICAgTlVMTCwgJ2gnIH0sCisrCQl7ICJzZWN0b3Itc2l6ZSIsIHJlcXVpcmVkX2Fy
Z3VtZW50LCBOVUxMLCAnYicgfSwKKyAJCXsgInZlcnNpb24iLCBub19hcmd1bWVudCwgICAgICAg
TlVMTCwgJ1YnIH0sCisgCQl7ICJ6ZXJvIiwgICAgbm9fYXJndW1lbnQsCU5VTEwsICd6JyB9LAor
IAkJeyAicmVhZC1vbmx5Iiwgbm9fYXJndW1lbnQsICAgICBOVUxMLCAncicgfSwKK0BAIC0yNzcx
LDggKzI3NzUsMTUgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKKyAJdGV4dGRv
bWFpbihQQUNLQUdFKTsKKyAJY2xvc2Vfc3Rkb3V0X2F0ZXhpdCgpOworIAorLQl3aGlsZSgoYyA9
IGdldG9wdF9sb25nKGFyZ2MsIGFyZ3YsICJMOjpoVnpyIiwgbG9uZ29wdHMsIE5VTEwpKSAhPSAt
MSkgeworKwl3aGlsZSgoYyA9IGdldG9wdF9sb25nKGFyZ2MsIGFyZ3YsICJiOkw6OmhWenIiLCBs
b25nb3B0cywgTlVMTCkpICE9IC0xKSB7CisgCQlzd2l0Y2goYykgeworKwkJY2FzZSAnYic6Cisr
CQkJdXNlcl9zcyA9IHN0cnRvdTMyX29yX2VycihvcHRhcmcsCisrCQkJCQlfKCJpbnZhbGlkIHNl
Y3RvciBzaXplIGFyZ3VtZW50IikpOworKwkJCWlmICh1c2VyX3NzICE9IDUxMiAmJiB1c2VyX3Nz
ICE9IDEwMjQgJiYKKysJCQkgICAgdXNlcl9zcyAhPSAyMDQ4ICYmIHVzZXJfc3MgIT0gNDA5NikK
KysJCQkJZXJyeChFWElUX0ZBSUxVUkUsIF8oImludmFsaWQgc2VjdG9yIHNpemUgYXJndW1lbnQi
KSk7CisrCQkJYnJlYWs7CisgCQljYXNlICdoJzoKKyAJCQl1c2FnZSgpOworIAkJCWJyZWFrOwor
QEAgLTI4MTEsNiArMjgyMiw4IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCisg
CWNmLT5jeHQgPSBmZGlza19uZXdfY29udGV4dCgpOworIAlpZiAoIWNmLT5jeHQpCisgCQllcnIo
RVhJVF9GQUlMVVJFLCBfKCJmYWlsZWQgdG8gYWxsb2NhdGUgbGliZmRpc2sgY29udGV4dCIpKTsK
KysJaWYgKHVzZXJfc3MpCisrCQlmZGlza19zYXZlX3VzZXJfc2VjdG9yX3NpemUoY2YtPmN4dCwg
dXNlcl9zcywgdXNlcl9zcyk7CisgCisgCWZkaXNrX3NldF9hc2soY2YtPmN4dCwgYXNrX2NhbGxi
YWNrLCAodm9pZCAqKSBjZik7CisgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGls
LWxpbnV4L3V0aWwtbGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gK
aW5kZXggOGVhMDBkYmI5NS4uZjY5ODljYWI4NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNv
cmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9hdm9pZF9wYXJhbGxlbF90
ZXN0cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZGE1OGI0MTUwZjY5MzJkZTM2Yzk2MmVh
NjU3NzEzYmNmNGVhNDRiZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjRhMzUwYTc3
MTYzNjRlZjdhZGM4MTU3M2ZjM2VmMmE0ZjcyN2MxYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IFR1ZG9yIEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogRGF0ZTogTW9uLCAx
NCBKdW4gMjAyMSAxNDowMDozMSArMDIwMAogU3ViamVjdDogW1BBVENIXSB1dGlsLWxpbnV4OiBB
ZGQgcHRlc3QKQEAgLTE0LDcgKzE0LDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRl
CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYg
LS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDY1MWVmMmIuLjJhODAx
MmUgMTAwNjQ0CitpbmRleCBmODQ5ZTllLi5jM2FkYzUwIDEwMDY0NAogLS0tIGEvY29uZmlndXJl
LmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC0xMSw3ICsxMSw3IEBAIEFDX0NPTkZJR19NQUNS
T19ESVIoW200XSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRp
bC1saW51eC9jb25maWd1cmUtc2JpbmRpci5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC9jb25maWd1cmUtc2JpbmRpci5wYXRjaAppbmRleCA3NGFiZGMyMDM4
Li45YWEwMjhhYmQ0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0
aWwtbGludXgvY29uZmlndXJlLXNiaW5kaXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
dXRpbC1saW51eC91dGlsLWxpbnV4L2NvbmZpZ3VyZS1zYmluZGlyLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAwMzg3ZDcxNTE2Yzk3ODg5OWNmZDU1NmNhNTEyZjUzMGEyMTJiNGE5IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxY2UyNDMzYjk4OGRiNWE4OWY0M2M5N2E5NGYyNDhl
NzUyMzliMTA5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGhpbCBCbHVuZGVsbCA8
cGJAcGJjbC5uZXQ+CiBEYXRlOiBNb24sIDI0IFNlcCAyMDEyIDA3OjI0OjUxICswMTAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIHV0aWwtbGludXg6IEVuc3VyZSB0aGF0ICR7c2JpbmRpcn0gaXMgcmVzcGVj
dGVkCkBAIC0xNCw3ICsxNCw3IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbY29u
ZmlndXJhdGlvbl0KICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDIz
NTk0ZmYuLjY1MWVmMmIgMTAwNjQ0CitpbmRleCAwNzM2OWE1Li5mODQ5ZTllIDEwMDY0NAogLS0t
IGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC0xMTAsNyArMTEwLDEwIEBA
IEFDX1NVQlNUKFtydW5zdGF0ZWRpcl0pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91
dGlsLWxpbnV4L3V0aWwtbGludXgvZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9kaXNwbGF5X3Rlc3RuYW1l
X2Zvcl9zdWJ0ZXN0LnBhdGNoCmluZGV4IDg3MWIwYjJkMzAuLjBkZGM4NTg1NTcgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9kaXNwbGF5X3Rlc3Ru
YW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC9kaXNwbGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA0NTQ1MGQwMzM5Y2Q3ZWUyN2Y1M2MwZjJmYWMxY2M3NGVkOWJiZmI4IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyOTQ0MDE4NjA5MzZhNGQ0Y2M5NmM0NDY5YjgyNTVl
MDU1MDI2MTc4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVHVkb3IgRmxvcmVhIDx0
dWRvci5mbG9yZWFAZW5lYS5jb20+CiBEYXRlOiBUaHUsIDMgRGVjIDIwMTUgMDQ6MDg6MDAgKzAx
MDAKIFN1YmplY3Q6IFtQQVRDSF0gRGlzcGxheSB0ZXN0bmFtZSBmb3Igc3VidGVzdApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2xpYmZkaXNrLWNm
ZGlzay1hbmQtc2ZkaXNrLXNlY3Rvci1zaXplLWltcHJvdmVtZW50cy5wYXRjaCBiL21ldGEvcmVj
aXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9saWJmZGlzay1jZmRpc2stYW5kLXNmZGlz
ay1zZWN0b3Itc2l6ZS1pbXByb3ZlbWVudHMucGF0Y2gKaW5kZXggMzU2MTk0YThiYS4uNjk3ZmQ2
NzkxYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4
L2xpYmZkaXNrLWNmZGlzay1hbmQtc2ZkaXNrLXNlY3Rvci1zaXplLWltcHJvdmVtZW50cy5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvbGliZmRpc2st
Y2ZkaXNrLWFuZC1zZmRpc2stc2VjdG9yLXNpemUtaW1wcm92ZW1lbnRzLnBhdGNoCkBAIC0xLDE2
MSArMSw3IEBACi1Gcm9tIDdhZGE2NTQ3ZmNkMWY2NDlmYWRhYTgwMjFmZjIxZTNlMGY0MzE0NTkg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLYXJlbCBaYWsgPGt6YWtAcmVkaGF0LmNv
bT4KLURhdGU6IE1vbiwgMTQgT2N0IDIwMjQgMTE6NDU6MzIgKzAyMDAKLVN1YmplY3Q6IFtQQVRD
SCAxLzRdIGxpYmZkaXNrOiBtYWtlIHN1cmUgbGliYmxraWQgdXNlcyB0aGUgc2FtZSBzZWN0b3Ig
c2l6ZQotCi1MaWJmZGlzayB1c2VzIGxpYmJsa2lkIHRvIGNoZWNrIGZvciBmaWxlc3lzdGVtcyBv
biB0aGUgZGV2aWNlLiBJdAotbWFrZXMgc2Vuc2UgZm9yIGJvdGggbGlicmFyaWVzIHRvIHNoYXJl
IHRoZSBsb2dpY2FsIHNlY3RvciBzaXplCi1zZXR0aW5nLCBhcyB0aGlzIHNldHRpbmcgY2FuIGJl
IG1vZGlmaWVkIGJ5IHVzaW5nIHRoZSBmZGlzayBjb21tYW5kCi1saW5lLgotCi1XZSBkbyBub3Qg
c2VlIHRoaXMgYXMgYW4gaXNzdWUsIGFzIGZpbGVzeXN0ZW0gZGV0ZWN0aW9uIHJhcmVseSBkZXBl
bmRzCi1vbiBzZWN0b3Igc2l6ZSAod2l0aCB0aGUgZXhjZXB0aW9uIG9mIHNvbWUgUkFJRHMpLiBB
ZGRpdGlvbmFsbHksCi1saWJibGtpZCBpcyB1c3VhbGx5IGludGVsbGlnZW50IGVub3VnaCB0byBj
aGVjayBtdWx0aXBsZSBsb2NhdGlvbnMKLWluZGVwZW5kZW50bHkgb2YgdGhlIGN1cnJlbnQgZGV2
aWNlJ3Mgc2VjdG9yIHNpemUgc2V0dGluZy4KLQotQWRkcmVzc2VzOiBodHRwczovL2dpdGh1Yi5j
b20vdXRpbC1saW51eC91dGlsLWxpbnV4L3B1bGwvMzIzNQotCi1VcHN0cmVhbS1TdGF0dXM6IFN1
Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL3V0aWwtbGludXgvdXRpbC1saW51eC9wdWxsLzMy
MzddCi0KLVNpZ25lZC1vZmYtYnk6IEthcmVsIFphayA8a3pha0ByZWRoYXQuY29tPgotLS0tCi0g
bGliZmRpc2svc3JjL3dpcGUuYyB8IDMgKysrCi0gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKQotCi1kaWZmIC0tZ2l0IGEvbGliZmRpc2svc3JjL3dpcGUuYyBiL2xpYmZkaXNrL3NyYy93
aXBlLmMKLWluZGV4IGJiNWYxYmIzOGJmLi5mMzg5ZWQ0MTk0YSAxMDA2NDQKLS0tLSBhL2xpYmZk
aXNrL3NyYy93aXBlLmMKLSsrKyBiL2xpYmZkaXNrL3NyYy93aXBlLmMKLUBAIC0xMzMsNiArMTMz
LDcgQEAgaW50IGZkaXNrX2RvX3dpcGUoc3RydWN0IGZkaXNrX2NvbnRleHQgKmN4dCkKLSAJCQlE
QkcoV0lQRSwgdWxfZGVidWdvYmood3AsICJibGtpZF9wcm9iZV9zZXRfZGV2aWNlKCkgZmFpbGVk
IFtyYz0lZF0iLCByYykpOwotIAkJCXJldHVybiByYzsKLSAJCX0KLSsJCWJsa2lkX3Byb2JlX3Nl
dF9zZWN0b3JzaXplKHByLCBjeHQtPnNlY3Rvcl9zaXplKTsKLSAKLSAJCURCRyhXSVBFLCB1bF9k
ZWJ1Z29iaih3cCwgIiB3aXBpbmcuLi4iKSk7Ci0gCQlibGtpZF93aXBlX2FsbChwcik7Ci1AQCAt
MTc2LDYgKzE3Nyw4IEBAIGludCBmZGlza19jaGVja19jb2xsaXNpb25zKHN0cnVjdCBmZGlza19j
b250ZXh0ICpjeHQpCi0gCWZyZWUoY3h0LT5jb2xsaXNpb24pOwotIAljeHQtPmNvbGxpc2lvbiA9
IE5VTEw7Ci0gCi0rCWJsa2lkX3Byb2JlX3NldF9zZWN0b3JzaXplKHByLCBjeHQtPnNlY3Rvcl9z
aXplKTsKLSsKLSAJYmxraWRfcHJvYmVfZW5hYmxlX3N1cGVyYmxvY2tzKHByLCAxKTsKLSAJYmxr
aWRfcHJvYmVfc2V0X3N1cGVyYmxvY2tzX2ZsYWdzKHByLCBCTEtJRF9TVUJMS1NfVFlQRSB8Ci0g
CQkJICAgICAgICAgICAgICAgICAgICAgIEJMS0lEX1NVQkxLU19CQURDU1VNKTsKLQotRnJvbSA1
NGY5YTc5MzAxZGNmNDkyY2FiOGUwNzEzNGY5NmE5MjFkMzY3YWEwIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQotRnJvbTogS2FyZWwgWmFrIDxremFrQHJlZGhhdC5jb20+Ci1EYXRlOiBNb24sIDE0
IE9jdCAyMDI0IDE1OjQ3OjAzICswMjAwCi1TdWJqZWN0OiBbUEFUQ0ggMi80XSBmZGlzazogKG1h
bikgaW1wcm92ZSAtLXNlY3Rvci1zaXplIGRlc2NyaXB0aW9uCi0KLVNpZ25lZC1vZmYtYnk6IEth
cmVsIFphayA8a3pha0ByZWRoYXQuY29tPgotLS0tCi0gZGlzay11dGlscy9mZGlzay44LmFkb2Mg
fCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0K
LWRpZmYgLS1naXQgYS9kaXNrLXV0aWxzL2ZkaXNrLjguYWRvYyBiL2Rpc2stdXRpbHMvZmRpc2su
OC5hZG9jCi1pbmRleCBjYjcyYjRhM2VhNS4uNTk0MWFhMzQ5NjggMTAwNjQ0Ci0tLS0gYS9kaXNr
LXV0aWxzL2ZkaXNrLjguYWRvYwotKysrIGIvZGlzay11dGlscy9mZGlzay44LmFkb2MKLUBAIC00
MCw3ICs0MCw3IEBAIE5vdGUgdGhhdCAqcGFydHgqKDgpIHByb3ZpZGVzIGEgcmljaCBpbnRlcmZh
Y2UgZm9yIHNjcmlwdHMgdG8gcHJpbnQgZGlzayBsYXlvdXRzCi0gPT0gT1BUSU9OUwotIAotICot
YiosICotLXNlY3Rvci1zaXplKiBfc2VjdG9yc2l6ZV86OgotLVNwZWNpZnkgdGhlIHNlY3RvciBz
aXplIG9mIHRoZSBkaXNrLiBWYWxpZCB2YWx1ZXMgYXJlIDUxMiwgMTAyNCwgMjA0OCwgYW5kIDQw
OTYuIChSZWNlbnQga2VybmVscyBrbm93IHRoZSBzZWN0b3Igc2l6ZS4gVXNlIHRoaXMgb3B0aW9u
IG9ubHkgb24gb2xkIGtlcm5lbHMgb3IgdG8gb3ZlcnJpZGUgdGhlIGtlcm5lbCdzIGlkZWFzLikg
U2luY2UgdXRpbC1saW51eC0yLjE3LCAqZmRpc2sqIGRpZmZlcmVudGlhdGVzIGJldHdlZW4gbG9n
aWNhbCBhbmQgcGh5c2ljYWwgc2VjdG9yIHNpemUuIFRoaXMgb3B0aW9uIGNoYW5nZXMgYm90aCBz
ZWN0b3Igc2l6ZXMgdG8gX3NlY3RvcnNpemVfLgotK1NwZWNpZnkgdGhlIHNlY3RvciBzaXplIG9m
IHRoZSBkaXNrLiBWYWxpZCB2YWx1ZXMgYXJlIDUxMiwgMTAyNCwgMjA0OCwgYW5kIDQwOTYuIFRo
ZSBrZXJuZWwgaXMgYXdhcmUgb2YgdGhlIHNlY3RvciBzaXplIGZvciByZWd1bGFyIGJsb2NrIGRl
dmljZXMuIFVzZSB0aGlzIG9wdGlvbiBvbmx5IG9uIHZlcnkgb2xkIGtlcm5lbHMsIHdoZW4gd29y
a2luZyB3aXRoIGRpc2sgaW1hZ2VzLCBvciB0byBvdmVycmlkZSB0aGUga2VybmVsJ3MgZGVmYXVs
dCBzZWN0b3Igc2l6ZS4gU2luY2UgdXRpbC1saW51eC0yLjE3LCAqZmRpc2sqIGRpc3Rpbmd1aXNo
ZXMgYmV0d2VlbiBsb2dpY2FsIGFuZCBwaHlzaWNhbCBzZWN0b3Igc2l6ZS4gVGhpcyBvcHRpb24g
Y2hhbmdlcyBib3RoIHNlY3RvciBzaXplcyB0byB0aGUgc3BlY2lmaWVkIF9zZWN0b3JzaXplXy4K
LSAKLSAqLUIqLCAqLS1wcm90ZWN0LWJvb3QqOjoKLSBEb24ndCBlcmFzZSB0aGUgYmVnaW5uaW5n
IG9mIHRoZSBmaXJzdCBkaXNrIHNlY3RvciB3aGVuIGNyZWF0aW5nIGEgbmV3IGRpc2sgbGFiZWwu
IFRoaXMgZmVhdHVyZSBpcyBzdXBwb3J0ZWQgZm9yIEdQVCBhbmQgTUJSLgotCi1Gcm9tIGZkMzhl
ZTIyNzRmN2EzMDM5M2QzODM5ZGZjZTU1NjI2MDM1NWMzZmEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCi1Gcm9tOiBLYXJlbCBaYWsgPGt6YWtAcmVkaGF0LmNvbT4KLURhdGU6IE1vbiwgMTQgT2N0
IDIwMjQgMTU6NDg6NDYgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSCAzLzRdIGNmZGlzazogYWRkIC0t
c2VjdG9yLXNpemUgY29tbWFuYW5kIGxpbmUgb3B0aW9uCi0KLSogaW1wcm92ZXMgY29tcGF0aWJp
bGl0eSB3aXRoIGZkaXNrCi0qIGFkZCBhYmlsaXR5IHRvIHdvcmsgd2l0aCBkaXNrIGltYWdlcyB3
aGVyZSBsaWJmZGlzayBkZWZhdWx0cyB0byA1MTIKLQotU2lnbmVkLW9mZi1ieTogS2FyZWwgWmFr
IDxremFrQHJlZGhhdC5jb20+Ci0tLS0KLSBkaXNrLXV0aWxzL2NmZGlzay44LmFkb2MgfCAgMyAr
KysKLSBkaXNrLXV0aWxzL2NmZGlzay5jICAgICAgfCAxNSArKysrKysrKysrKysrKy0KLSAyIGZp
bGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdp
dCBhL2Rpc2stdXRpbHMvY2ZkaXNrLjguYWRvYyBiL2Rpc2stdXRpbHMvY2ZkaXNrLjguYWRvYwot
aW5kZXggOTdmYWQ2MjFkMTIuLjc1OWYzOWYwZTFhIDEwMDY0NAotLS0tIGEvZGlzay11dGlscy9j
ZmRpc2suOC5hZG9jCi0rKysgYi9kaXNrLXV0aWxzL2NmZGlzay44LmFkb2MKLUBAIC01NSw2ICs1
NSw5IEBAIFVzZSBleGNsdXNpdmUgQlNEIGxvY2sgZm9yIGRldmljZSBvciBmaWxlIGl0IG9wZXJh
dGVzLiBUaGUgb3B0aW9uYWwgYXJndW1lbnQgX21vCi0gKi1yKiwgKi0tcmVhZC1vbmx5Kjo6Ci0g
Rm9yY2VkIG9wZW4gaW4gcmVhZC1vbmx5IG1vZGUuCi0gCi0rKi1iKiwgKi0tc2VjdG9yLXNpemUq
IF9zZWN0b3JzaXplXzo6Ci0rU3BlY2lmeSB0aGUgc2VjdG9yIHNpemUgb2YgdGhlIGRpc2suIFZh
bGlkIHZhbHVlcyBhcmUgNTEyLCAxMDI0LCAyMDQ4LCBhbmQgNDA5Ni4gVGhlIGtlcm5lbCBpcyBh
d2FyZSBvZiB0aGUgc2VjdG9yIHNpemUgZm9yIHJlZ3VsYXIgYmxvY2sgZGV2aWNlcy4gVXNlIHRo
aXMgb3B0aW9uIG9ubHkgb24gdmVyeSBvbGQga2VybmVscywgd2hlbiB3b3JraW5nIHdpdGggZGlz
ayBpbWFnZXMsIG9yIHRvIG92ZXJyaWRlIHRoZSBrZXJuZWwncyBkZWZhdWx0IHNlY3RvciBzaXpl
LiBTaW5jZSB1dGlsLWxpbnV4LTIuMTcsICpmZGlzayogZGlzdGluZ3Vpc2hlcyBiZXR3ZWVuIGxv
Z2ljYWwgYW5kIHBoeXNpY2FsIHNlY3RvciBzaXplLiBUaGlzIG9wdGlvbiBjaGFuZ2VzIGJvdGgg
c2VjdG9yIHNpemVzIHRvIHRoZSBzcGVjaWZpZWQgX3NlY3RvcnNpemVfLgotKwotICoteiosICot
LXplcm8qOjoKLSBTdGFydCB3aXRoIGFuIGluLW1lbW9yeSB6ZXJvZWQgcGFydGl0aW9uIHRhYmxl
LiBUaGlzIG9wdGlvbiBkb2VzIG5vdCB6ZXJvIHRoZSBwYXJ0aXRpb24gdGFibGUgb24gdGhlIGRp
c2s7IHJhdGhlciwgaXQgc2ltcGx5IHN0YXJ0cyB0aGUgcHJvZ3JhbSB3aXRob3V0IHJlYWRpbmcg
dGhlIGV4aXN0aW5nIHBhcnRpdGlvbiB0YWJsZS4gVGhpcyBvcHRpb24gYWxsb3dzIHlvdSB0byBj
cmVhdGUgYSBuZXcgcGFydGl0aW9uIHRhYmxlIGZyb20gc2NyYXRjaCBvciBmcm9tIGFuICpzZmRp
c2sqKDgpLWNvbXBhdGlibGUgc2NyaXB0LgotIAotZGlmZiAtLWdpdCBhL2Rpc2stdXRpbHMvY2Zk
aXNrLmMgYi9kaXNrLXV0aWxzL2NmZGlzay5jCi1pbmRleCAyZTBhYWRhNDc0YS4uYmMxYzg3ZDgz
ZTQgMTAwNjQ0Ci0tLS0gYS9kaXNrLXV0aWxzL2NmZGlzay5jCi0rKysgYi9kaXNrLXV0aWxzL2Nm
ZGlzay5jCi1AQCAtMjczMSw2ICsyNzMxLDggQEAgc3RhdGljIHZvaWQgX19hdHRyaWJ1dGVfXygo
X19ub3JldHVybl9fKSkgdXNhZ2Uodm9pZCkKLSAJICAgICAgXygiICAgICAtLWxvY2tbPTxtb2Rl
Pl0gICAgICB1c2UgZXhjbHVzaXZlIGRldmljZSBsb2NrICglcywgJXMgb3IgJXMpXG4iKSwgInll
cyIsICJubyIsICJub25ibG9jayIpOwotIAlmcHV0cyhfKCIgLXIsIC0tcmVhZC1vbmx5ICAgICAg
ICAgIGZvcmNlZCBvcGVuIGNmZGlzayBpbiByZWFkLW9ubHkgbW9kZVxuIiksIG91dCk7Ci0gCi0r
CWZwdXRzKF8oIiAtYiwgLS1zZWN0b3Itc2l6ZSA8c2l6ZT4gcGh5c2ljYWwgYW5kIGxvZ2ljYWwg
c2VjdG9yIHNpemVcbiIpLCBvdXQpOwotKwotIAlmcHV0cyhVU0FHRV9TRVBBUkFUT1IsIG91dCk7
Ci0gCWZwcmludGYob3V0LCBVU0FHRV9IRUxQX09QVElPTlMoMjYpKTsKLSAKLUBAIC0yNzQzLDYg
KzI3NDUsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQotIAljb25zdCBjaGFy
ICpkaXNrcGF0aCA9IE5VTEwsICpsb2NrbW9kZSA9IE5VTEw7Ci0gCWludCByYywgYywgY29sb3Jt
b2RlID0gVUxfQ09MT1JNT0RFX1VOREVGOwotIAlpbnQgcmVhZF9vbmx5ID0gMDsKLSsJc2l6ZV90
IHVzZXJfc3MgPSAwOwotIAlzdHJ1Y3QgY2ZkaXNrIF9jZiA9IHsgLmxpbmVzX2lkeCA9IDAgfSwK
LSAJCSAgICAgICpjZiA9ICZfY2Y7Ci0gCWVudW0gewotQEAgLTI3NTIsNiArMjc1NSw3IEBAIGlu
dCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCi0gCQl7ICJjb2xvciIsICAgb3B0aW9uYWxf
YXJndW1lbnQsIE5VTEwsICdMJyB9LAotIAkJeyAibG9jayIsICAgIG9wdGlvbmFsX2FyZ3VtZW50
LCBOVUxMLCBPUFRfTE9DSyB9LAotIAkJeyAiaGVscCIsICAgIG5vX2FyZ3VtZW50LCAgICAgICBO
VUxMLCAnaCcgfSwKLSsJCXsgInNlY3Rvci1zaXplIiwgcmVxdWlyZWRfYXJndW1lbnQsIE5VTEws
ICdiJyB9LAotIAkJeyAidmVyc2lvbiIsIG5vX2FyZ3VtZW50LCAgICAgICBOVUxMLCAnVicgfSwK
LSAJCXsgInplcm8iLCAgICBub19hcmd1bWVudCwJTlVMTCwgJ3onIH0sCi0gCQl7ICJyZWFkLW9u
bHkiLCBub19hcmd1bWVudCwgICAgIE5VTEwsICdyJyB9LAotQEAgLTI3NjMsOCArMjc2NywxNSBA
QCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQotIAl0ZXh0ZG9tYWluKFBBQ0tBR0Up
OwotIAljbG9zZV9zdGRvdXRfYXRleGl0KCk7Ci0gCi0tCXdoaWxlKChjID0gZ2V0b3B0X2xvbmco
YXJnYywgYXJndiwgIkw6OmhWenIiLCBsb25nb3B0cywgTlVMTCkpICE9IC0xKSB7Ci0rCXdoaWxl
KChjID0gZ2V0b3B0X2xvbmcoYXJnYywgYXJndiwgImI6TDo6aFZ6ciIsIGxvbmdvcHRzLCBOVUxM
KSkgIT0gLTEpIHsKLSAJCXN3aXRjaChjKSB7Ci0rCQljYXNlICdiJzoKLSsJCQl1c2VyX3NzID0g
c3RydG91MzJfb3JfZXJyKG9wdGFyZywKLSsJCQkJCV8oImludmFsaWQgc2VjdG9yIHNpemUgYXJn
dW1lbnQiKSk7Ci0rCQkJaWYgKHVzZXJfc3MgIT0gNTEyICYmIHVzZXJfc3MgIT0gMTAyNCAmJgot
KwkJCSAgICB1c2VyX3NzICE9IDIwNDggJiYgdXNlcl9zcyAhPSA0MDk2KQotKwkJCQllcnJ4KEVY
SVRfRkFJTFVSRSwgXygiaW52YWxpZCBzZWN0b3Igc2l6ZSBhcmd1bWVudCIpKTsKLSsJCQlicmVh
azsKLSAJCWNhc2UgJ2gnOgotIAkJCXVzYWdlKCk7Ci0gCQkJYnJlYWs7Ci1AQCAtMjgwMyw2ICsy
ODE0LDggQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKLSAJY2YtPmN4dCA9IGZk
aXNrX25ld19jb250ZXh0KCk7Ci0gCWlmICghY2YtPmN4dCkKLSAJCWVycihFWElUX0ZBSUxVUkUs
IF8oImZhaWxlZCB0byBhbGxvY2F0ZSBsaWJmZGlzayBjb250ZXh0IikpOwotKwlpZiAodXNlcl9z
cykKLSsJCWZkaXNrX3NhdmVfdXNlcl9zZWN0b3Jfc2l6ZShjZi0+Y3h0LCB1c2VyX3NzLCB1c2Vy
X3NzKTsKLSAKLSAJZmRpc2tfc2V0X2FzayhjZi0+Y3h0LCBhc2tfY2FsbGJhY2ssICh2b2lkICop
IGNmKTsKLSAKLQotRnJvbSBlZjdiNzZiYWExN2RkYjU0MTQ2OTFmYThmNDlkNjE0MTVjMzA4NzFj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwMWM2ZjYzZjYxZjhjZTgzNTM1MGI2ODQ4
ZjEwZWE3ZGVkNTJjMDVjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2FyZWwgWmFr
IDxremFrQHJlZGhhdC5jb20+CiBEYXRlOiBNb24sIDE0IE9jdCAyMDI0IDE1OjUwOjQwICswMjAw
Ci1TdWJqZWN0OiBbUEFUQ0ggNC80XSBzZmRpc2s6IGFkZCAtLXNlY3Rvci1zaXplIGNvbW1hbmFu
ZCBsaW5lIG9wdGlvbgorU3ViamVjdDogW1BBVENIXSBzZmRpc2s6IGFkZCAtLXNlY3Rvci1zaXpl
IGNvbW1hbmFuZCBsaW5lIG9wdGlvbgogCiAqIGltcHJvdmVzIGNvbXBhdGliaWxpdHkgd2l0aCBm
ZGlzawogKiBhZGQgYWJpbGl0eSB0byB3b3JrIHdpdGggZGlzayBpbWFnZXMgd2hlcmUgbGliZmRp
c2sgZGVmYXVsdHMgdG8gNTEyCkBAIC0xNjgsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEth
cmVsIFphayA8a3pha0ByZWRoYXQuY29tPgogIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZGlzay11dGlscy9zZmRpc2suOC5h
ZG9jIGIvZGlzay11dGlscy9zZmRpc2suOC5hZG9jCi1pbmRleCAyNmNjYWQ1YTNiMi4uY2U5ZTk3
Yjc2ODIgMTAwNjQ0CitpbmRleCBiYzNmZjliLi5kMWVhYTM3IDEwMDY0NAogLS0tIGEvZGlzay11
dGlscy9zZmRpc2suOC5hZG9jCiArKysgYi9kaXNrLXV0aWxzL3NmZGlzay44LmFkb2MKLUBAIC0y
MDgsNiArMjA4LDkgQEAgVGhlIGRlZmF1bHQgbGlzdCBvZiBjb2x1bW5zIG1heSBiZSBleHRlbmRl
ZCBpZiBfbGlzdF8gaXMgc3BlY2lmaWVkIGluIHRoZSBmb3JtYXQKK0BAIC0yMDEsNiArMjAxLDkg
QEAgVGhlIGRlZmF1bHQgbGlzdCBvZiBjb2x1bW5zIG1heSBiZSBleHRlbmRlZCBpZiBfbGlzdF8g
aXMgc3BlY2lmaWVkIGluIHRoZSBmb3JtYXQKICAqLXEqLCAqLS1xdWlldCo6OgogIFN1cHByZXNz
IGV4dHJhIGluZm8gbWVzc2FnZXMuCiAgCkBAIC0xODEsNyArMjcsNyBAQCBpbmRleCAyNmNjYWQ1
YTNiMi4uY2U5ZTk3Yjc2ODIgMTAwNjQ0CiAgKi11KiwgKi0tdW5pdCBTKjo6CiAgRGVwcmVjYXRl
ZCBvcHRpb24uIE9ubHkgdGhlIHNlY3RvciB1bml0IGlzIHN1cHBvcnRlZC4gVGhpcyBvcHRpb24g
aXMgbm90IHN1cHBvcnRlZCB3aGVuIHVzaW5nIHRoZSAqLS1zaG93LXNpemUqIGNvbW1hbmQuCiAg
Ci1AQCAtMjU2LDcgKzI1OSw3IEBAIFNwZWNpZnkgdGhlIG1heGltYWwgbnVtYmVyIG9mIEdQVCBw
YXJ0aXRpb25zLgorQEAgLTI0OSw3ICsyNTIsNyBAQCBTcGVjaWZ5IHRoZSBtYXhpbWFsIG51bWJl
ciBvZiBHUFQgcGFydGl0aW9ucy4KICAqZ3JhaW4qOjoKICBTcGVjaWZ5IG1pbmltYWwgc2l6ZSBp
biBieXRlcyB1c2VkIHRvIGNhbGN1bGF0ZSBwYXJ0aXRpb25zIGFsaWdubWVudC4gVGhlIGRlZmF1
bHQgaXMgMU1pQiBhbmQgaXQncyBzdHJvbmdseSByZWNvbW1lbmRlZCB0byB1c2UgdGhlIGRlZmF1
bHQuIERvIG5vdCBtb2RpZnkgdGhpcyB2YXJpYWJsZSBpZiB5b3UncmUgbm90IHN1cmUuCiAgKnNl
Y3Rvci1zaXplKjo6CkBAIC0xOTEsMTAgKzM3LDEwIEBAIGluZGV4IDI2Y2NhZDVhM2IyLi5jZTll
OTdiNzY4MiAxMDA2NDQKICBOb3RlIHRoYXQgaXQgaXMgb25seSBwb3NzaWJsZSB0byB1c2UgaGVh
ZGVyIGxpbmVzIGJlZm9yZSB0aGUgZmlyc3QgcGFydGl0aW9uIGlzIHNwZWNpZmllZCBpbiB0aGUg
aW5wdXQuCiAgCiBkaWZmIC0tZ2l0IGEvZGlzay11dGlscy9zZmRpc2suYyBiL2Rpc2stdXRpbHMv
c2ZkaXNrLmMKLWluZGV4IGNmNDAyMDA3YjUxLi41ZTdjMWQ5MjZlNCAxMDA2NDQKK2luZGV4IGQ4
ZGQ4ZDIuLjk3ZDQyNjUgMTAwNjQ0CiAtLS0gYS9kaXNrLXV0aWxzL3NmZGlzay5jCiArKysgYi9k
aXNrLXV0aWxzL3NmZGlzay5jCi1AQCAtMjE1NSw2ICsyMTU1LDggQEAgc3RhdGljIHZvaWQgX19h
dHRyaWJ1dGVfXygoX19ub3JldHVybl9fKSkgdXNhZ2Uodm9pZCkKK0BAIC0yMDg0LDYgKzIwODQs
OCBAQCBzdGF0aWMgdm9pZCBfX2F0dHJpYnV0ZV9fKChfX25vcmV0dXJuX18pKSB1c2FnZSh2b2lk
KQogIAkgICAgICBfKCIgICAgIC0tY29sb3JbPTx3aGVuPl0gICAgICBjb2xvcml6ZSBvdXRwdXQg
KCVzLCAlcyBvciAlcylcbiIpLCAiYXV0byIsICJhbHdheXMiLCAibmV2ZXIiKTsKICAJZnByaW50
ZihvdXQsCiAgCSAgICAgICAgIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJXNcbiIsIFVT
QUdFX0NPTE9SU19ERUZBVUxUKTsKQEAgLTIwMyw3ICs0OSw3IEBAIGluZGV4IGNmNDAyMDA3YjUx
Li41ZTdjMWQ5MjZlNCAxMDA2NDQKICAJZnByaW50ZihvdXQsCiAgCSAgICAgIF8oIiAgICAgLS1s
b2NrWz08bW9kZT5dICAgICAgIHVzZSBleGNsdXNpdmUgZGV2aWNlIGxvY2sgKCVzLCAlcyBvciAl
cylcbiIpLCAieWVzIiwgIm5vIiwgIm5vbmJsb2NrIik7CiAgCWZwdXRzKF8oIiAtTiwgLS1wYXJ0
bm8gPG51bT4gICAgICAgIHNwZWNpZnkgcGFydGl0aW9uIG51bWJlclxuIiksIG91dCk7Ci1AQCAt
MjE5MSw2ICsyMTkzLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKK0BAIC0y
MTIwLDYgKzIxMjIsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogIAljb25z
dCBjaGFyICpvdXRhcmcgPSBOVUxMOwogIAlpbnQgcmMgPSAtRUlOVkFMLCBjLCBsb25naWR4ID0g
LTEsIGJ5dGVzID0gMDsKICAJaW50IGNvbG9ybW9kZSA9IFVMX0NPTE9STU9ERV9VTkRFRjsKQEAg
LTIxMSw3ICs1Nyw3IEBAIGluZGV4IGNmNDAyMDA3YjUxLi41ZTdjMWQ5MjZlNCAxMDA2NDQKICAJ
c3RydWN0IHNmZGlzayBfc2YgPSB7CiAgCQkucGFydG5vID0gLTEsCiAgCQkud2lwZW1vZGUgPSBX
SVBFTU9ERV9BVVRPLAotQEAgLTIyMTcsNiArMjIyMCw3IEBAIGludCBtYWluKGludCBhcmdjLCBj
aGFyICphcmd2W10pCitAQCAtMjE0NSw2ICsyMTQ4LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNo
YXIgKmFyZ3ZbXSkKICAJCU9QVF9OT1RFTEwsCiAgCQlPUFRfUkVMT0NBVEUsCiAgCQlPUFRfTE9D
SywKQEAgLTIxOSw3ICs2NSw3IEBAIGluZGV4IGNmNDAyMDA3YjUxLi41ZTdjMWQ5MjZlNCAxMDA2
NDQKICAJfTsKICAKICAJc3RhdGljIGNvbnN0IHN0cnVjdCBvcHRpb24gbG9uZ29wdHNbXSA9IHsK
LUBAIC0yMjQ2LDYgKzIyNTAsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQor
QEAgLTIxNzQsNiArMjE3OCw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAg
CQl7ICJvdXRwdXQiLCAgcmVxdWlyZWRfYXJndW1lbnQsIE5VTEwsICdvJyB9LAogIAkJeyAicGFy
dG5vIiwgIHJlcXVpcmVkX2FyZ3VtZW50LCBOVUxMLCAnTicgfSwKICAJCXsgInJlb3JkZXIiLCBu
b19hcmd1bWVudCwgICAgICAgTlVMTCwgJ3InIH0sCkBAIC0yMjcsNyArNzMsNyBAQCBpbmRleCBj
ZjQwMjAwN2I1MS4uNWU3YzFkOTI2ZTQgMTAwNjQ0CiAgCQl7ICJzaG93LWdlb21ldHJ5Iiwgbm9f
YXJndW1lbnQsIE5VTEwsICdnJyB9LAogIAkJeyAicXVpZXQiLCAgIG5vX2FyZ3VtZW50LCAgICAg
ICBOVUxMLCAncScgfSwKICAJCXsgInZlcmlmeSIsICBub19hcmd1bWVudCwgICAgICAgTlVMTCwg
J1YnIH0sCi1AQCAtMjQ1MCw2ICsyNDU1LDEzIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICph
cmd2W10pCitAQCAtMjM3Myw2ICsyMzc4LDEzIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICph
cmd2W10pCiAgCQkJCXNmLT5sb2NrbW9kZSA9IG9wdGFyZzsKICAJCQl9CiAgCQkJYnJlYWs7CkBA
IC0yNDEsNyArODcsNyBAQCBpbmRleCBjZjQwMjAwN2I1MS4uNWU3YzFkOTI2ZTQgMTAwNjQ0CiAg
CQlkZWZhdWx0OgogIAkJCWVycnRyeWhlbHAoRVhJVF9GQUlMVVJFKTsKICAJCX0KLUBAIC0yNDYw
LDYgKzI0NzIsOCBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQorQEAgLTIzODMs
NiArMjM5NSw4IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAgCXNmZGlza19p
bml0KHNmKTsKICAJaWYgKGJ5dGVzKQogIAkJZmRpc2tfc2V0X3NpemVfdW5pdChzZi0+Y3h0LCBG
RElTS19TSVpFVU5JVF9CWVRFUyk7CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGls
LWxpbnV4L3V0aWwtbGludXgvcHRlc3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxp
bnV4L3V0aWwtbGludXgvcHRlc3QucGF0Y2gKaW5kZXggNzM0NTkyNmI4OC4uOGU1NjZlMWEyYyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L3B0ZXN0
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9wdGVz
dC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjliZTczYzNlMmIwYTRmMDkyMzk1MGRjYjA1
OGJlODVkM2VlOGVkNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTJjZDc2MDU2OThi
MjBmMTRjYjhhYzVlMGEyZWNmYWM1NDE0N2JhNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IFR1ZG9yIEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogRGF0ZTogVGh1LCAzIERl
YyAyMDE1IDA0OjA4OjAwICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIERlZmluZSBURVNUUyB2YXJp
YWJsZQpAQCAtMTAsMTAgKzEwLDEwIEBAIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUuYW0gYi9N
YWtlZmlsZS5hbQotaW5kZXggNTBhYjhkMC4uN2UyMzQwZCAxMDA2NDQKK2luZGV4IDgyMDRiYzAu
LjEwYmUyZjEgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZS5hbQogKysrIGIvTWFrZWZpbGUuYW0KLUBA
IC02NCw2ICs2NCw3IEBAIHRtcGZpbGVzX0RBVEEgPQorQEAgLTY1LDYgKzY1LDcgQEAgdG1wZmls
ZXNfREFUQSA9CiAgZGlzdF9iYXNoY29tcGxldGlvbl9EQVRBID0KICBjaGVja19QUk9HUkFNUyA9
CiAgZGlzdF9jaGVja19TQ1JJUFRTID0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0
aWwtbGludXgvdXRpbC1saW51eF8yLjQwLjIuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxp
bnV4L3V0aWwtbGludXhfMi40MC40LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXhfMi40MC4yLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXhfMi40MC40LmJiCi0t
IAoyLjQ0LjEKCg==

--===============3937166526027588784==--

