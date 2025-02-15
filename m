Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1E2C021A6
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:10 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.8048.1739623329317375018
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UK1TS+aE;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=w/OdfJ4J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019509a16a98-0f523ccd-03a5-4bfb-89cd-e084f7b7a612-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623328;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bQv1DZLRqQIrQsljgkboHXHxNWiB9wa7XFqjxpY3Z0c=;
	b=UK1TS+aEgdF1fNDp22pzgKZmPhRNvVW+/2E+DcHBfnmEcbz9DRdqifei7taZVrtx
	CMqNbv8zjmghJGubkxWZFtv4ZibcBcibUXmpvXiBLwFKUSKfqbb2HO4K8RIIv48IJ/B
	hj1exXfU1U6ROHVSQbJeBfuif3stTWlyYa7e1WeM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623328;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bQv1DZLRqQIrQsljgkboHXHxNWiB9wa7XFqjxpY3Z0c=;
	b=w/OdfJ4J8vwQc92807k01dtebIf+l/S/uQBpUC0+PfLblr6BwSnWE2jqlHFM1Gqm
	IpCjLCr7EZ5AjUZyKRA0va66/stZIpWs/fWQ95sz43K4pOZH5j7Ca/ewP+l4x+TcLaV
	CRAy/K/ypPCT6anl8PEE9pvPCnwI0HosKxX41tm4=
Content-Type: multipart/mixed; boundary="===============4853870825611159790=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid,util-linux: upgrading to 2.40.4,2.40.4
 FAILED
Message-ID: <0101019509a16a98-0f523ccd-03a5-4bfb-89cd-e084f7b7a612-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211396

--===============4853870825611159790==
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
From 6b24ea7dd175a3a64157b9bff2f1c6f3748115c8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 05:21:31 +0000
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
index 580ff488e4..15c2771d83 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -38,10 +38,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            file://fcntl-lock.c \
-           file://0001-autotools-fix-securedir-and-pam_lastlog2-install.patch \
            file://libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch \
+           file://0005-cfdisk-add-sector-size-commanand-line-option.patch \
            "
 
-SRC_URI[sha256sum] = "d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3"
+SRC_URI[sha256sum] = "5c1daf733b04e9859afdc3bd87cc481180ee0f88b5c0946b16fdec931975fb79"
 
 CVE_PRODUCT = "util-linux"
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
index 0000000000..215f86ef64
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0005-cfdisk-add-sector-size-commanand-line-option.patch
@@ -0,0 +1,83 @@
+From 7002e8e2f14a7f0fb7ec77e79a978e8eb74076d2 Mon Sep 17 00:00:00 2001
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
index 8ea00dbb95..ac4fa365f7 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From da58b4150f6932de36c962ea657713bcf4ea44be Mon Sep 17 00:00:00 2001
+From 1c5b34d1e1196fa2b35a7daae5dd7e0bcfb8aa6d Mon Sep 17 00:00:00 2001
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
index 74abdc2038..54775bc4e2 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From 0387d71516c978899cfd556ca512f530a212b4a9 Mon Sep 17 00:00:00 2001
+From 73a6b35b26f04ad451221dcd553049b83a5fc787 Mon Sep 17 00:00:00 2001
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
index 871b0b2d30..aab442bc9b 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,4 @@
-From 45450d0339cd7ee27f53c0f2fac1cc74ed9bbfb8 Mon Sep 17 00:00:00 2001
+From 7be45309fafa2315c9753766c45732497d4d53a7 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
diff --git a/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch b/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch
index 356194a8ba..a48377bcf4 100644
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
+From c6e72064018a29948f615a676898e2accab50cbe Mon Sep 17 00:00:00 2001
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
index 7345926b88..ab56839254 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From f9be73c3e2b0a4f0923950dcb058be85d3ee8ed7 Mon Sep 17 00:00:00 2001
+From 063360b451f78f7790708ae692425f454dfc52ef Mon Sep 17 00:00:00 2001
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


--===============4853870825611159790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1876 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (914 cached, 2 parsed). 1869 targets, 38 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:b1abc741b4ae6ab20fed76295a019884790b5fd1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 739 Local 272 Mirrors 0 Missed 467 Current 329 (36% match, 56% complete)
Removing 99 stale sstate objects for arch qemux86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
Removing 187 stale sstate objects for arch core2-64...done.
Removing 38 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 341 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 349 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 392 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 396 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 452 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb:do_create_spdx_setscene)
NOTE: Running setscene task 476 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 480 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pigz/pigz_2.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 493 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 503 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe which-2.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cwautomacros-native-20110201-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bc-1.08.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-native-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe pigz-native-2.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bc-native-1.08.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-native-1.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-native-3.10.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-native-8.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 516 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 522 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_create_spdx_setscene)
NOTE: recipe cwautomacros-native-20110201-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bc-native-1.08.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 526 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 532 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 535 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-native-1.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 544 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe nettle-native-3.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 549 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-native-8.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 567 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe diffutils-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 579 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe grep-3.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe socat-1.8.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bc-1.08.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 609 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pigz-native-2.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 627 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-native-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe cross-localedef-native-2.41+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 633 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb:do_populate_sysroot_setscene)
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 639 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-native-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 646 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_populate_sysroot_setscene)
NOTE: recipe socat-1.8.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_create_spdx_setscene)
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 649 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 654 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 655 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_recipe_qa_setscene)
NOTE: recipe gawk-5.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 670 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 674 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 676 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 679 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 693 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pigz/pigz_2.8.bb:do_recipe_qa_setscene)
NOTE: recipe cwautomacros-native-20110201-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cross-localedef-native-2.41+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 701 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 704 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 710 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-native-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-native-5.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe bc-native-1.08.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-native-33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pigz-native-2.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.12.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-native-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe perlcross-native-1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 712 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 714 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 715 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.7.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cwautomacros-native-20110201-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-native-5.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 721 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 733 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 743 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_257.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 748 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx_setscene)
NOTE: recipe kmod-native-33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pigz-native-2.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 751 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 757 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 758 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-6.12.13+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.12.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 764 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 768 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bc-native-1.08.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_257.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 780 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-native-10.44-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 781 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 785 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 789 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 790 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.46-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 791 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 792 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 797 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 804 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 805 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 807 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 808 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bc-native-1.08.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 809 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-native-10.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 813 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 816 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 817 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kern-tools-native-0.3+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cross-localedef-native-2.41+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bc-native-1.08.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 821 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cwautomacros-native-20110201-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-native-1.1.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 822 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 823 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.41+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 826 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 827 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 828 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cwautomacros-native-20110201-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 829 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 830 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 831 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxslt-native-1.1.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 835 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 838 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kern-tools-native-0.3+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 841 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 842 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 845 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 850 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-protocols-1.40-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 854 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_create_spdx_setscene)
NOTE: recipe wayland-native-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 855 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 857 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.48.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-protocols-1.40-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 858 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-native-3_3.47.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 867 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 868 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-native-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-native-20250104-3.1-r1: task do_create_spdx_setscene: Started
NOTE: Running setscene task 869 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx_setscene)
NOTE: recipe wayland-native-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 870 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 873 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 874 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 875 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 878 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 883 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-native-3_3.47.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 884 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_create_spdx_setscene)
NOTE: recipe libffi-native-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-native-20250104-3.1-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 885 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 889 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe git-native-2.48.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 892 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-native-1.24-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-native-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 894 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kern-tools-native-0.3+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 895 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 901 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-native-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 905 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.4.1.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 907 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe gdbm-native-1.24-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 910 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 911 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 912 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-native-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kern-tools-native-0.3+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 921 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 922 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.5.bb:do_create_spdx_setscene)
NOTE: recipe qemu-native-9.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 924 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-native-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 925 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 933 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 939 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 947 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rsync-native-3.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe cmake-native-3.31.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemu-native-9.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 950 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-native-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-75.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 952 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 955 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-native-2.13.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-3.31.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rsync-native-3.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 957 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 958 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 959 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-75.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 960 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_create_spdx_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtirpc-native-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 963 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 965 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 966 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 967 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-native-2.13.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 968 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe meson-native-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 970 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 974 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 975 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 977 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-native-75.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-native-5.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe meson-native-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 979 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 984 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-native-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 985 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 987 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 989 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 990 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 991 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-native-75.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 997 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-native-3.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-native-5.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 998 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-native-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1000 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-native-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1002 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1006 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1008 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-native-3.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1014 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-native-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1016 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1017 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_stash_locale_setscene)
NOTE: recipe python3-packaging-native-24.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1021 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1022 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1024 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1026 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1028 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1031 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1034 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1037 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1038 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1040 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-native-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1041 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1044 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1046 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rpm-native-1_4.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-native-0.192-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1048 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-native-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-native-3.7.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1049 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1051 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.23.1.bb:do_create_spdx_setscene)
NOTE: recipe rpm-native-1_4.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-native-3.8.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-native-0.192-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-native-3.7.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gettext-minimal-native-0.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1052 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rsync-native-3.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1054 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1056 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-native-3.8.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-native-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-native-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe git-native-2.48.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1057 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1059 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.48.1.bb:do_recipe_qa_setscene)
NOTE: recipe gettext-minimal-native-0.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-native-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 186 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_fetch)
NOTE: recipe util-linux-native-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rsync-native-3.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 1061 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-native-20241223-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe git-native-2.48.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 302 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_fetch)
NOTE: recipe rsync-native-3.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Started
NOTE: Running task 350 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_fetch)
NOTE: Running task 366 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_fetch)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe git-native-2.48.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 455 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb:do_fetch)
NOTE: Running task 459 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_fetch)
NOTE: Running noexec task 461 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_fetch)
NOTE: Running task 469 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_fetch)
NOTE: Running noexec task 471 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_fetch)
NOTE: Running task 473 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: Running task 475 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_fetch)
NOTE: Running task 477 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_fetch)
NOTE: Running task 479 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 489 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_fetch)
NOTE: Running task 493 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 497 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_fetch: Started
NOTE: recipe ca-certificates-native-20241223-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: Running setscene task 1063 of 1068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: Running task 498 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_unpack)
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_fetch: Started
NOTE: recipe expat-2.6.4-r0: task do_fetch: Started
NOTE: Running setscene task 1065 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe python3-build-native-1.2.2-r0: task do_fetch: Started
NOTE: recipe python3-native-3.13.2-r0: task do_fetch: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_fetch: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_fetch: Started
NOTE: recipe ca-certificates-native-20241223-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_unpack: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1066 of 1068 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-build-native-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_fetch: Succeeded
NOTE: Running task 499 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 500 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb:do_unpack)
NOTE: recipe python3-packaging-native-24.2-r0: task do_fetch: Succeeded
NOTE: recipe ca-certificates-native-20241223-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 501 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_unpack)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 502 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_unpack)
NOTE: Running task 503 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_unpack)
NOTE: Running task 504 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_unpack)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_unpack: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_unpack: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 508 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_fetch)
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-build-native-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 509 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_patch)
NOTE: Running task 510 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_patch)
NOTE: Running task 511 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb:do_patch)
NOTE: recipe python3-packaging-native-24.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 512 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_patch)
NOTE: Running task 513 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_patch)
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 514 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_unpack)
NOTE: recipe python3-setuptools-native-75.8.0-r0: task do_fetch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_patch: Started
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_patch: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_patch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-build-native-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_patch: Succeeded
NOTE: Running task 517 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 523 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_fetch)
NOTE: Running task 531 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_fetch)
NOTE: recipe python3-packaging-native-24.2-r0: task do_patch: Succeeded
NOTE: Running task 534 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_unpack: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_unpack: Succeeded
NOTE: Running task 535 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.4.0-r0: task do_fetch: Started
NOTE: recipe xz-5.6.3-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-75.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_unpack: Succeeded
NOTE: Running task 546 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_unpack)
NOTE: Running task 547 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch)
NOTE: Running task 558 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_fetch)
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_patch: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_patch: Succeeded
NOTE: Running task 560 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_fetch)
NOTE: recipe python3-setuptools-native-75.8.0-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_patch: Started
NOTE: recipe util-linux-native-2.40.4-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.40.4-r0: task do_fetch: Succeeded
NOTE: Running task 568 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-native-75.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 569 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 570 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.7.7-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-75.8.0-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_fetch: Succeeded
NOTE: Running task 581 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.0.bb:do_fetch)
NOTE: recipe meson-native-1.7.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-75.8.0-r0: task do_patch: Succeeded
NOTE: Running task 584 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_unpack)
NOTE: recipe util-linux-native-2.40.4-r0: task do_unpack: Started
NOTE: recipe expat-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 585 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 586 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe libarchive-native-3.7.7-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_unpack: Started
NOTE: Running task 587 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe expat-2.6.4-r0: task do_unpack: Succeeded
NOTE: Running task 588 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_patch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 593 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: recipe expat-2.6.4-r0: task do_patch: Started
NOTE: recipe expat-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Started
NOTE: Running task 594 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 595 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_14.2.bb:do_fetch)
NOTE: recipe util-linux-native-2.40.4-r0: task do_unpack: Succeeded
NOTE: Running task 597 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_patch)
NOTE: recipe libidn2-native-2.3.7-r0: task do_fetch: Started
NOTE: recipe python3-native-3.13.2-r0: task do_fetch: Succeeded
NOTE: Running task 598 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_unpack)
NOTE: recipe gcc-source-14.2.0-14.2.0-r0: task do_fetch: Started
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 599 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_unpack)
NOTE: Running task 600 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_unpack)
NOTE: recipe util-linux-native-2.40.4-r0: task do_patch: Started
NOTE: recipe python3-native-3.13.2-r0: task do_unpack: Started
NOTE: recipe xz-5.6.3-r0: task do_unpack: Started
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Started
NOTE: recipe xz-5.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 601 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_patch)
NOTE: recipe xz-5.6.3-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_unpack: Succeeded
NOTE: Running task 602 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_patch)
NOTE: recipe xz-5.6.3-r0: task do_patch: Succeeded
NOTE: Running task 605 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_patch: Started
NOTE: recipe gnutls-native-3.8.8-r0: task do_fetch: Started
NOTE: recipe meson-native-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 607 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 611 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_fetch)
NOTE: recipe elfutils-native-0.192-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.192-r0: task do_fetch: Succeeded
NOTE: Running task 618 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_patch: Succeeded
NOTE: Running task 622 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.0.bb:do_unpack)
NOTE: recipe openssl-3.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-native-3.7.7-r0: task do_unpack: Started
NOTE: Running task 623 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_unpack)
NOTE: recipe meson-native-1.7.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 624 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe openssl-3.4.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.7.7-r0: task do_unpack: Succeeded
NOTE: Running task 625 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 642 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe libarchive-native-3.7.7-r0: task do_patch: Started
NOTE: recipe python3-native-3.13.2-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-native-3.7.7-r0: task do_patch: Succeeded
NOTE: Running task 643 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_patch)
NOTE: Running task 644 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_unpack)
NOTE: recipe gnutls-native-3.8.8-r0: task do_fetch: Succeeded
NOTE: Running task 645 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_unpack)
NOTE: recipe meson-native-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_unpack: Started
NOTE: Running task 646 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.0.bb:do_patch)
NOTE: recipe elfutils-native-0.192-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.8-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 647 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: recipe python3-native-3.13.2-r0: task do_patch: Started
NOTE: recipe meson-native-1.7.0-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 649 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_fetch)
NOTE: recipe openssl-3.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 650 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_patch)
NOTE: recipe rpm-native-1_4.20.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.4.0-r0: task do_patch: Started
NOTE: recipe meson-native-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 659 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_generate_toolchain_file)
NOTE: recipe expat-2.6.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.6.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 661 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.37-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: Running task 662 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: recipe gnutls-native-3.8.8-r0: task do_unpack: Succeeded
NOTE: Running task 663 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_patch)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.37-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_patch: Succeeded
NOTE: Running task 665 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: Running task 702 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: recipe gnutls-native-3.8.8-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: Running task 703 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 705 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_fetch)
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.192-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-native-3.8.8-r0: task do_patch: Succeeded
NOTE: Running task 706 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_patch)
NOTE: Running task 710 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: Running task 711 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_patch)
NOTE: Running task 713 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb:do_unpack)
NOTE: recipe elfutils-native-0.192-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.37-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_fetch: Started
NOTE: recipe glibc-2.41+git-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_fetch: Succeeded
NOTE: Running task 716 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_fetch)
NOTE: recipe python3-native-3.13.2-r0: task do_patch: Succeeded
NOTE: Running task 719 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_fetch)
NOTE: recipe qemu-native-9.2.0-r0: task do_fetch: Started
NOTE: recipe libxml2-native-2.13.5-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.37-r0: task do_unpack: Succeeded
NOTE: Running task 720 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb:do_patch)
NOTE: recipe libxcrypt-4.4.37-r0: task do_patch: Started
NOTE: recipe elfutils-native-0.192-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.4.37-r0: task do_patch: Succeeded
NOTE: Running task 722 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: Running task 747 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 748 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: Running task 749 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 750 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_unpack)
NOTE: Running task 751 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.41+git-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_unpack: Started
NOTE: Running task 753 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe libxml2-native-2.13.5-r0: task do_fetch: Succeeded
NOTE: Running task 755 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 757 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_unpack: Succeeded
NOTE: Running task 758 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 759 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 762 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Succeeded
NOTE: Running task 765 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 766 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_fetch)
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_patch: Succeeded
NOTE: Running task 768 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_fetch)
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 769 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_unpack)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 770 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe python3-3.13.2-r0: task do_fetch: Started
NOTE: recipe python3-3.13.2-r0: task do_fetch: Succeeded
NOTE: Running task 771 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Succeeded
NOTE: Running task 772 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_unpack)
NOTE: recipe libxml2-native-2.13.5-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 773 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 775 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_unpack)
NOTE: Running task 776 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_patch)
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Started
NOTE: Running task 777 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_patch)
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Started
NOTE: recipe libpam-1.7.0-r0: task do_patch: Started
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 778 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_patch)
NOTE: Running task 780 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_unpack)
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Succeeded
NOTE: Running task 807 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_unpack)
NOTE: recipe libffi-3.4.6-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 808 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_unpack)
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Succeeded
NOTE: Running task 809 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_patch)
NOTE: recipe libxml2-native-2.13.5-r0: task do_unpack: Succeeded
NOTE: Running task 810 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_patch)
NOTE: recipe python3-3.13.2-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.6-r0: task do_patch: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Started
NOTE: Running task 812 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe libxml2-native-2.13.5-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe libxml2-native-2.13.5-r0: task do_patch: Succeeded
NOTE: Running task 814 of 2815 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_write_config)
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Succeeded
NOTE: Running task 817 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_write_config)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_write_config: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Succeeded
NOTE: Running task 818 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_write_config: Succeeded
NOTE: Running task 824 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_fetch)
NOTE: Running task 826 of 2815 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_patch: Failed
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.40.4-r0: task do_patch: Failed
NOTE: recipe sqlite3-3_3.47.2-r0: task do_fetch: Succeeded
NOTE: recipe qemu-native-9.2.0-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Failed
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: recipe rpm-native-1_4.20.0-r0: task do_fetch: Succeeded
NOTE: recipe gcc-source-14.2.0-14.2.0-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 827 tasks of which 704 didn't need to be rerun and 3 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215051648.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215051648.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 3 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/util-linux-libuuid-native/2.40.4/temp/log.do_patch.151859
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/util-linux-native/2.40.4/temp/log.do_patch.152792
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/util-linux-libuuid/2.40.4/temp/log.do_patch.159219
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
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/util-linux-libuuid-native/2.40.4/temp/log.do_patch.151859
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch) failed with exit code '1'
ERROR: util-linux-libuuid-2.40.4-r0 do_patch: QA Issue: Missing Upstream-Status in patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch
Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
ERROR: util-linux-libuuid-2.40.4-r0 do_patch: QA Issue: Missing Upstream-Status in patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux/0005-cfdisk-add-sector-size-commanand-line-option.patch
Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
ERROR: util-linux-libuuid-2.40.4-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/util-linux-native/2.40.4/temp/log.do_patch.152792
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/util-linux-libuuid/2.40.4/temp/log.do_patch.159219
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch) failed with exit code '1'

--===============4853870825611159790==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-libuuid-util-linux-upgrade-2.40.2-2.40.4-.patch"

RnJvbSA2YjI0ZWE3ZGQxNzVhM2E2NDE1N2I5YmZmMmYxYzZmMzc0ODExNWM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDU6MjE6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
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
LmluYwppbmRleCA1ODBmZjQ4OGU0Li4xNWMyNzcxZDgzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jCisrKyBiL21ldGEvcmVjaXBlcy1jb3Jl
L3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMKQEAgLTM4LDEwICszOCwxMCBAQCBTUkNfVVJJID0g
IiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvdXRpbHMvdXRpbC1saW51eC92JHtNQUpPUl9WRVJT
SU9OfS91dGlsLWxpbgogICAgICAgICAgICBmaWxlOi8vZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3Vi
dGVzdC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRj
aCBcCiAgICAgICAgICAgIGZpbGU6Ly9mY250bC1sb2NrLmMgXAotICAgICAgICAgICBmaWxlOi8v
MDAwMS1hdXRvdG9vbHMtZml4LXNlY3VyZWRpci1hbmQtcGFtX2xhc3Rsb2cyLWluc3RhbGwucGF0
Y2ggXAogICAgICAgICAgICBmaWxlOi8vbGliZmRpc2stY2ZkaXNrLWFuZC1zZmRpc2stc2VjdG9y
LXNpemUtaW1wcm92ZW1lbnRzLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDUtY2ZkaXNr
LWFkZC1zZWN0b3Itc2l6ZS1jb21tYW5hbmQtbGluZS1vcHRpb24ucGF0Y2ggXAogICAgICAgICAg
ICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkNzhiMzdhNjZmNTkyMmQ3MGVkZjNiZGZiMDFh
NmIzM2QzNGVkM2MzY2FmZDY2MjgyMDNiMmEyYjY3YzhlOGIzIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjVjMWRhZjczM2IwNGU5ODU5YWZkYzNiZDg3Y2M0ODExODBlZTBmODhiNWMwOTQ2YjE2ZmRl
YzkzMTk3NWZiNzkiCiAKIENWRV9QUk9EVUNUID0gInV0aWwtbGludXgiCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1hdXRvdG9vbHMtZml4
LXNlY3VyZWRpci1hbmQtcGFtX2xhc3Rsb2cyLWluc3RhbGwucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Y29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1hdXRvdG9vbHMtZml4LXNlY3VyZWRpci1h
bmQtcGFtX2xhc3Rsb2cyLWluc3RhbGwucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDI3MmU1NzRhNzcuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4LzAwMDEtYXV0b3Rvb2xzLWZpeC1zZWN1cmVkaXItYW5kLXBhbV9sYXN0
bG9nMi1pbnN0YWxsLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsODIgKzAsMCBAQAotRnJvbSBm
OTEyZmIxYmJiMGZmNWFmMjczNmQxNTQzNDdhM2I5ZmM0MDQ3NmViIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQotRnJvbTogS2FyZWwgWmFrIDxremFrQHJlZGhhdC5jb20+Ci1EYXRlOiBUdWUsIDI3
IEF1ZyAyMDI0IDEyOjAwOjIxICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIGF1dG90b29sczogZml4
IHNlY3VyZWRpciBhbmQgcGFtX2xhc3Rsb2cyIGluc3RhbGwKLQotQWRkcmVzc2VzOiBodHRwczov
L2dpdGh1Yi5jb20vdXRpbC1saW51eC91dGlsLWxpbnV4L3B1bGwvMzE3MwotU2lnbmVkLW9mZi1i
eTogS2FyZWwgWmFrIDxremFrQHJlZGhhdC5jb20+Ci0KLVVwc3RyZWFtLVN0YXR1czogQmFja3Bv
cnQKLVtodHRwczovL2dpdGh1Yi5jb20vdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbW1pdC85Yzc4
N2VhYWM0M2Y1ZjAxMTQ2Zjc5MmIwMjM5ZjU4N2U0YjgxMjAyXQotCi1TaWduZWQtb2ZmLWJ5OiBZ
aSBaaGFvIDx5aS56aGFvQHdpbmRyaXZlci5jb20+Ci0tLS0KLSBNYWtlZmlsZS5hbSAgICAgICAg
ICAgICAgICAgICAgfCA2ICsrKy0tLQotIGNvbmZpZ3VyZS5hYyAgICAgICAgICAgICAgICAgICB8
IDYgKysrLS0tCi0gcGFtX2xhc3Rsb2cyL3NyYy9NYWtlbW9kdWxlLmFtIHwgMiArLQotIDMgZmls
ZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0
IGEvTWFrZWZpbGUuYW0gYi9NYWtlZmlsZS5hbQotaW5kZXggZWUyZDU1My4uYTVkY2FlYSAxMDA2
NDQKLS0tLSBhL01ha2VmaWxlLmFtCi0rKysgYi9NYWtlZmlsZS5hbQotQEAgLTU2LDcgKzU2LDcg
QEAgdXNyc2Jpbl9leGVjX1BST0dSQU1TID0KLSBtYW5fTUFOUyA9Ci0gcGtnY29uZmlnX0RBVEEg
PQotIHVzcmxpYl9leGVjX0xUTElCUkFSSUVTID0KLS11c3JzZWN1cmVsaWJfZXhlY19MVExJQlJB
UklFUyA9Ci0rc2VjdXJlbGliX2V4ZWNfTFRMSUJSQVJJRVMgPQotIGJpbl9QUk9HUkFNUyA9Ci0g
c2Jpbl9QUk9HUkFNUyA9Ci0gZGlzdF91c3JiaW5fZXhlY19TQ1JJUFRTID0KLUBAIC0xNTUsMTEg
KzE1NSwxMSBAQCBFWFRSQV9ESVNUICs9IFwKLSAjIHB5bGlibW91bnRleGVjIG1vZHVsZSBtdXN0
IGJlIGluc3RhbGxlZCBhZnRlciB1c3JsaWJfZXhlYyBsaWJyYXJpZXMsCi0gIyBvdGhlcndpc2Ug
dGhlIGxpYnRvb2wgcmVsaW5rIHN0ZXAgd2lsbCBmYWlsIHRvIGZpbmQgbGlibW91bnQubGEgYW5k
Ci0gIyB3aWxsIHRyeSAtbG1vdW50IHdoaWNoIGlzIHBvc3NpYmx5IG5vdCBhdmFpbGFibGUuCi0t
IyBUaGUgc2FtZSBmb3IgdXNyc2VjdXJlbGliX2V4ZWMgYW5kIGxpYmxhc3Rsb2cyLmxhCi0rIyBU
aGUgc2FtZSBmb3Igc2VjdXJlbGliX2V4ZWMgYW5kIGxpYmxhc3Rsb2cyLmxhCi0gIwotICMgU28g
aW50cm9kdWNlIHRoaXMgZGVwZW5kZW5jeSBydWxlOgotICMgaW5zdGFsbC1weWxpYm1vdW50ZXhl
Y0xUTElCUkFSSUVTOiBpbnN0YWxsLXVzcmxpYl9leGVjTFRMSUJSQVJJRVMKLS0jIGluc3RhbGwt
dXNyc2VjdXJlbGliX2V4ZWNMVExJQlJBUklFUzogaW5zdGFsbC11c3JsaWJfZXhlY0xUTElCUkFS
SUVTCi0rIyBpbnN0YWxsLXNlY3VyZWxpYl9leGVjTFRMSUJSQVJJRVM6IGluc3RhbGwtdXNybGli
X2V4ZWNMVExJQlJBUklFUwotIEB2ZXJiYXRpbV9leHRyYV9kZXBlbmRlbmN5QAotIAotICMKLWRp
ZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDAzNzVkMjkuLjEz
NGNmMzggMTAwNjQ0Ci0tLS0gYS9jb25maWd1cmUuYWMKLSsrKyBiL2NvbmZpZ3VyZS5hYwotQEAg
LTEyMyw4ICsxMjMsOCBAQCBBU19DQVNFKFskbGliZGlyXSwKLSApCi0gQUNfU1VCU1QoW3Vzcmxp
Yl9leGVjZGlyXSkKLSAKLS11c3JzZWN1cmVsaWJfZXhlY2Rpcj0nJHt1c3JsaWJfZXhlY2Rpcn0v
c2VjdXJpdHknCi0tQUNfU1VCU1QoW3VzcnNlY3VyZWxpYl9leGVjZGlyXSkKLStzZWN1cmVsaWJf
ZXhlY2Rpcj0nJHtsaWJkaXJ9L3NlY3VyaXR5JwotK0FDX1NVQlNUKFtzZWN1cmVsaWJfZXhlY2Rp
cl0pCi0gCi0gIyBzdGF0aWMgY29uZmlndXJhdGlvbiBtYWludGFuZWQgYnkgcGFja2FnZXMgKGUu
Zy4gL3Vzci9saWIpCi0gQUNfQVJHX1ZBUihbU1lTQ09ORlNUQVRJQ0RJUl0sCi1AQCAtMjc2Nyw3
ICsyNzY3LDcgQEAgdmVyYmF0aW1fZXh0cmFfZGVwZW5kZW5jeT0nCi0gIyBvdGhlcndpc2UgdGhl
IGxpYnRvb2wgcmVsaW5rIHN0ZXAgd2lsbCBmYWlsIHRvIGZpbmQgbGlibW91bnQubGEgYW5kCi0g
IyB3aWxsIHRyeSAtbG1vdW50IHdoaWNoIGlzIHBvc3NpYmx5IG5vdCBhdmFpbGFibGUuCi0gaW5z
dGFsbC1weWxpYm1vdW50ZXhlY0xUTElCUkFSSUVTOiBpbnN0YWxsLXVzcmxpYl9leGVjTFRMSUJS
QVJJRVMKLS1pbnN0YWxsLXVzcnNlY3VyZWxpYl9leGVjTFRMSUJSQVJJRVM6IGluc3RhbGwtdXNy
bGliX2V4ZWNMVExJQlJBUklFUwotK2luc3RhbGwtc2VjdXJlbGliX2V4ZWNMVExJQlJBUklFUzog
aW5zdGFsbC11c3JsaWJfZXhlY0xUTElCUkFSSUVTCi0gCi0gJwotIEFDX1NVQlNUKFt2ZXJiYXRp
bV9leHRyYV9kZXBlbmRlbmN5XSkKLWRpZmYgLS1naXQgYS9wYW1fbGFzdGxvZzIvc3JjL01ha2Vt
b2R1bGUuYW0gYi9wYW1fbGFzdGxvZzIvc3JjL01ha2Vtb2R1bGUuYW0KLWluZGV4IDZkMjM2NTMu
LmEyYmVjYWMgMTAwNjQ0Ci0tLS0gYS9wYW1fbGFzdGxvZzIvc3JjL01ha2Vtb2R1bGUuYW0KLSsr
KyBiL3BhbV9sYXN0bG9nMi9zcmMvTWFrZW1vZHVsZS5hbQotQEAgLTEsNCArMSw0IEBACi0tdXNy
c2VjdXJlbGliX2V4ZWNfTFRMSUJSQVJJRVMgKz0gcGFtX2xhc3Rsb2cyLmxhCi0rc2VjdXJlbGli
X2V4ZWNfTFRMSUJSQVJJRVMgKz0gcGFtX2xhc3Rsb2cyLmxhCi0gCi0gcGFtX2xhc3Rsb2cyX2xh
X1NPVVJDRVMgPSBcCi0gCXBhbV9sYXN0bG9nMi9zcmMvcGFtX2xhc3Rsb2cyLmMKLS0tIAotMi4y
NS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51
eC8wMDA1LWNmZGlzay1hZGQtc2VjdG9yLXNpemUtY29tbWFuYW5kLWxpbmUtb3B0aW9uLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDUtY2ZkaXNrLWFk
ZC1zZWN0b3Itc2l6ZS1jb21tYW5hbmQtbGluZS1vcHRpb24ucGF0Y2gKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMjE1Zjg2ZWY2NAotLS0gL2Rldi9udWxsCisrKyBiL21l
dGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDA1LWNmZGlzay1hZGQtc2Vj
dG9yLXNpemUtY29tbWFuYW5kLWxpbmUtb3B0aW9uLnBhdGNoCkBAIC0wLDAgKzEsODMgQEAKK0Zy
b20gNzAwMmU4ZTJmMTRhN2YwZmI3ZWM3N2U3OWE5NzhlOGViNzQwNzZkMiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb206IEthcmVsIFphayA8a3pha0ByZWRoYXQuY29tPgorRGF0ZTogTW9u
LCAxNCBPY3QgMjAyNCAxNTo0ODo0NiArMDIwMAorU3ViamVjdDogW1BBVENIXSBjZmRpc2s6IGFk
ZCAtLXNlY3Rvci1zaXplIGNvbW1hbmFuZCBsaW5lIG9wdGlvbgorCisqIGltcHJvdmVzIGNvbXBh
dGliaWxpdHkgd2l0aCBmZGlzaworKiBhZGQgYWJpbGl0eSB0byB3b3JrIHdpdGggZGlzayBpbWFn
ZXMgd2hlcmUgbGliZmRpc2sgZGVmYXVsdHMgdG8gNTEyCisKK1NpZ25lZC1vZmYtYnk6IEthcmVs
IFphayA8a3pha0ByZWRoYXQuY29tPgorLS0tCisgZGlzay11dGlscy9jZmRpc2suOC5hZG9jIHwg
IDMgKysrCisgZGlzay11dGlscy9jZmRpc2suYyAgICAgIHwgMTUgKysrKysrKysrKysrKystCisg
MiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYg
LS1naXQgYS9kaXNrLXV0aWxzL2NmZGlzay44LmFkb2MgYi9kaXNrLXV0aWxzL2NmZGlzay44LmFk
b2MKK2luZGV4IDk3ZmFkNjIuLjc1OWYzOWYgMTAwNjQ0CistLS0gYS9kaXNrLXV0aWxzL2NmZGlz
ay44LmFkb2MKKysrKyBiL2Rpc2stdXRpbHMvY2ZkaXNrLjguYWRvYworQEAgLTU1LDYgKzU1LDkg
QEAgVXNlIGV4Y2x1c2l2ZSBCU0QgbG9jayBmb3IgZGV2aWNlIG9yIGZpbGUgaXQgb3BlcmF0ZXMu
IFRoZSBvcHRpb25hbCBhcmd1bWVudCBfbW8KKyAqLXIqLCAqLS1yZWFkLW9ubHkqOjoKKyBGb3Jj
ZWQgb3BlbiBpbiByZWFkLW9ubHkgbW9kZS4KKyAKKysqLWIqLCAqLS1zZWN0b3Itc2l6ZSogX3Nl
Y3RvcnNpemVfOjoKKytTcGVjaWZ5IHRoZSBzZWN0b3Igc2l6ZSBvZiB0aGUgZGlzay4gVmFsaWQg
dmFsdWVzIGFyZSA1MTIsIDEwMjQsIDIwNDgsIGFuZCA0MDk2LiBUaGUga2VybmVsIGlzIGF3YXJl
IG9mIHRoZSBzZWN0b3Igc2l6ZSBmb3IgcmVndWxhciBibG9jayBkZXZpY2VzLiBVc2UgdGhpcyBv
cHRpb24gb25seSBvbiB2ZXJ5IG9sZCBrZXJuZWxzLCB3aGVuIHdvcmtpbmcgd2l0aCBkaXNrIGlt
YWdlcywgb3IgdG8gb3ZlcnJpZGUgdGhlIGtlcm5lbCdzIGRlZmF1bHQgc2VjdG9yIHNpemUuIFNp
bmNlIHV0aWwtbGludXgtMi4xNywgKmZkaXNrKiBkaXN0aW5ndWlzaGVzIGJldHdlZW4gbG9naWNh
bCBhbmQgcGh5c2ljYWwgc2VjdG9yIHNpemUuIFRoaXMgb3B0aW9uIGNoYW5nZXMgYm90aCBzZWN0
b3Igc2l6ZXMgdG8gdGhlIHNwZWNpZmllZCBfc2VjdG9yc2l6ZV8uCisrCisgKi16KiwgKi0temVy
byo6OgorIFN0YXJ0IHdpdGggYW4gaW4tbWVtb3J5IHplcm9lZCBwYXJ0aXRpb24gdGFibGUuIFRo
aXMgb3B0aW9uIGRvZXMgbm90IHplcm8gdGhlIHBhcnRpdGlvbiB0YWJsZSBvbiB0aGUgZGlzazsg
cmF0aGVyLCBpdCBzaW1wbHkgc3RhcnRzIHRoZSBwcm9ncmFtIHdpdGhvdXQgcmVhZGluZyB0aGUg
ZXhpc3RpbmcgcGFydGl0aW9uIHRhYmxlLiBUaGlzIG9wdGlvbiBhbGxvd3MgeW91IHRvIGNyZWF0
ZSBhIG5ldyBwYXJ0aXRpb24gdGFibGUgZnJvbSBzY3JhdGNoIG9yIGZyb20gYW4gKnNmZGlzayoo
OCktY29tcGF0aWJsZSBzY3JpcHQuCisgCitkaWZmIC0tZ2l0IGEvZGlzay11dGlscy9jZmRpc2su
YyBiL2Rpc2stdXRpbHMvY2ZkaXNrLmMKK2luZGV4IDE4M2I3NjcuLmYzN2UyZDcgMTAwNjQ0Cist
LS0gYS9kaXNrLXV0aWxzL2NmZGlzay5jCisrKysgYi9kaXNrLXV0aWxzL2NmZGlzay5jCitAQCAt
MjczOSw2ICsyNzM5LDggQEAgc3RhdGljIHZvaWQgX19hdHRyaWJ1dGVfXygoX19ub3JldHVybl9f
KSkgdXNhZ2Uodm9pZCkKKyAJICAgICAgXygiICAgICAtLWxvY2tbPTxtb2RlPl0gICAgICB1c2Ug
ZXhjbHVzaXZlIGRldmljZSBsb2NrICglcywgJXMgb3IgJXMpXG4iKSwgInllcyIsICJubyIsICJu
b25ibG9jayIpOworIAlmcHV0cyhfKCIgLXIsIC0tcmVhZC1vbmx5ICAgICAgICAgIGZvcmNlZCBv
cGVuIGNmZGlzayBpbiByZWFkLW9ubHkgbW9kZVxuIiksIG91dCk7CisgCisrCWZwdXRzKF8oIiAt
YiwgLS1zZWN0b3Itc2l6ZSA8c2l6ZT4gcGh5c2ljYWwgYW5kIGxvZ2ljYWwgc2VjdG9yIHNpemVc
biIpLCBvdXQpOworKworIAlmcHV0cyhVU0FHRV9TRVBBUkFUT1IsIG91dCk7CisgCWZwcmludGYo
b3V0LCBVU0FHRV9IRUxQX09QVElPTlMoMjYpKTsKKyAKK0BAIC0yNzUxLDYgKzI3NTMsNyBAQCBp
bnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQorIAljb25zdCBjaGFyICpkaXNrcGF0aCA9
IE5VTEwsICpsb2NrbW9kZSA9IE5VTEw7CisgCWludCByYywgYywgY29sb3Jtb2RlID0gVUxfQ09M
T1JNT0RFX1VOREVGOworIAlpbnQgcmVhZF9vbmx5ID0gMDsKKysJc2l6ZV90IHVzZXJfc3MgPSAw
OworIAlzdHJ1Y3QgY2ZkaXNrIF9jZiA9IHsgLmxpbmVzX2lkeCA9IDAgfSwKKyAJCSAgICAgICpj
ZiA9ICZfY2Y7CisgCWVudW0geworQEAgLTI3NjAsNiArMjc2Myw3IEBAIGludCBtYWluKGludCBh
cmdjLCBjaGFyICphcmd2W10pCisgCQl7ICJjb2xvciIsICAgb3B0aW9uYWxfYXJndW1lbnQsIE5V
TEwsICdMJyB9LAorIAkJeyAibG9jayIsICAgIG9wdGlvbmFsX2FyZ3VtZW50LCBOVUxMLCBPUFRf
TE9DSyB9LAorIAkJeyAiaGVscCIsICAgIG5vX2FyZ3VtZW50LCAgICAgICBOVUxMLCAnaCcgfSwK
KysJCXsgInNlY3Rvci1zaXplIiwgcmVxdWlyZWRfYXJndW1lbnQsIE5VTEwsICdiJyB9LAorIAkJ
eyAidmVyc2lvbiIsIG5vX2FyZ3VtZW50LCAgICAgICBOVUxMLCAnVicgfSwKKyAJCXsgInplcm8i
LCAgICBub19hcmd1bWVudCwJTlVMTCwgJ3onIH0sCisgCQl7ICJyZWFkLW9ubHkiLCBub19hcmd1
bWVudCwgICAgIE5VTEwsICdyJyB9LAorQEAgLTI3NzEsOCArMjc3NSwxNSBAQCBpbnQgbWFpbihp
bnQgYXJnYywgY2hhciAqYXJndltdKQorIAl0ZXh0ZG9tYWluKFBBQ0tBR0UpOworIAljbG9zZV9z
dGRvdXRfYXRleGl0KCk7CisgCistCXdoaWxlKChjID0gZ2V0b3B0X2xvbmcoYXJnYywgYXJndiwg
Ikw6OmhWenIiLCBsb25nb3B0cywgTlVMTCkpICE9IC0xKSB7CisrCXdoaWxlKChjID0gZ2V0b3B0
X2xvbmcoYXJnYywgYXJndiwgImI6TDo6aFZ6ciIsIGxvbmdvcHRzLCBOVUxMKSkgIT0gLTEpIHsK
KyAJCXN3aXRjaChjKSB7CisrCQljYXNlICdiJzoKKysJCQl1c2VyX3NzID0gc3RydG91MzJfb3Jf
ZXJyKG9wdGFyZywKKysJCQkJCV8oImludmFsaWQgc2VjdG9yIHNpemUgYXJndW1lbnQiKSk7Cisr
CQkJaWYgKHVzZXJfc3MgIT0gNTEyICYmIHVzZXJfc3MgIT0gMTAyNCAmJgorKwkJCSAgICB1c2Vy
X3NzICE9IDIwNDggJiYgdXNlcl9zcyAhPSA0MDk2KQorKwkJCQllcnJ4KEVYSVRfRkFJTFVSRSwg
XygiaW52YWxpZCBzZWN0b3Igc2l6ZSBhcmd1bWVudCIpKTsKKysJCQlicmVhazsKKyAJCWNhc2Ug
J2gnOgorIAkJCXVzYWdlKCk7CisgCQkJYnJlYWs7CitAQCAtMjgxMSw2ICsyODIyLDggQEAgaW50
IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKKyAJY2YtPmN4dCA9IGZkaXNrX25ld19jb250
ZXh0KCk7CisgCWlmICghY2YtPmN4dCkKKyAJCWVycihFWElUX0ZBSUxVUkUsIF8oImZhaWxlZCB0
byBhbGxvY2F0ZSBsaWJmZGlzayBjb250ZXh0IikpOworKwlpZiAodXNlcl9zcykKKysJCWZkaXNr
X3NhdmVfdXNlcl9zZWN0b3Jfc2l6ZShjZi0+Y3h0LCB1c2VyX3NzLCB1c2VyX3NzKTsKKyAKKyAJ
ZmRpc2tfc2V0X2FzayhjZi0+Y3h0LCBhc2tfY2FsbGJhY2ssICh2b2lkICopIGNmKTsKKyAKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9hdm9pZF9w
YXJhbGxlbF90ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAppbmRleCA4ZWEwMGRiYjk1Li5hYzRmYTM2
NWY3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgv
YXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSBkYTU4YjQxNTBmNjkzMmRlMzZjOTYyZWE2NTc3MTNiY2Y0ZWE0NGJlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxYzViMzRkMWUxMTk2ZmEyYjM1YTdkYWFlNWRkN2UwYmNm
YjhhYTZkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVHVkb3IgRmxvcmVhIDx0dWRv
ci5mbG9yZWFAZW5lYS5jb20+CiBEYXRlOiBNb24sIDE0IEp1biAyMDIxIDE0OjAwOjMxICswMjAw
CiBTdWJqZWN0OiBbUEFUQ0hdIHV0aWwtbGludXg6IEFkZCBwdGVzdApAQCAtMTQsNyArMTQsNyBA
QCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUKICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2Nv
bmZpZ3VyZS5hYwotaW5kZXggNjUxZWYyYi4uMmE4MDEyZSAxMDA2NDQKK2luZGV4IGY4NDllOWUu
LmMzYWRjNTAgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwog
QEAgLTExLDcgKzExLDcgQEAgQUNfQ09ORklHX01BQ1JPX0RJUihbbTRdKQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbmZpZ3VyZS1zYmluZGly
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbmZpZ3Vy
ZS1zYmluZGlyLnBhdGNoCmluZGV4IDc0YWJkYzIwMzguLjU0Nzc1YmM0ZTIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9jb25maWd1cmUtc2JpbmRp
ci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvY29u
ZmlndXJlLXNiaW5kaXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDAzODdkNzE1MTZjOTc4
ODk5Y2ZkNTU2Y2E1MTJmNTMwYTIxMmI0YTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDczYTZiMzViMjZmMDRhZDQ1MTIyMWRjZDU1MzA0OWI4M2E1ZmM3ODcgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBQaGlsIEJsdW5kZWxsIDxwYkBwYmNsLm5ldD4KIERhdGU6IE1vbiwg
MjQgU2VwIDIwMTIgMDc6MjQ6NTEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdXRpbC1saW51eDog
RW5zdXJlIHRoYXQgJHtzYmluZGlyfSBpcyByZXNwZWN0ZWQKQEAgLTE0LDcgKzE0LDcgQEAgVXBz
dHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtjb25maWd1cmF0aW9uXQogIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZp
Z3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggMjM1OTRmZi4uNjUxZWYyYiAxMDA2NDQKK2lu
ZGV4IDA3MzY5YTUuLmY4NDllOWUgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2Nv
bmZpZ3VyZS5hYwogQEAgLTExMCw3ICsxMTAsMTAgQEAgQUNfU1VCU1QoW3J1bnN0YXRlZGlyXSkK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9kaXNw
bGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5hbWVfZm9yX3N1YnRlc3QucGF0Y2gKaW5kZXgg
ODcxYjBiMmQzMC4uYWFiNDQyYmM5YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRp
bC1saW51eC91dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5hbWVfZm9yX3N1YnRlc3QucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5h
bWVfZm9yX3N1YnRlc3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQ1NDUwZDAzMzljZDdl
ZTI3ZjUzYzBmMmZhYzFjYzc0ZWQ5YmJmYjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDdiZTQ1MzA5ZmFmYTIzMTVjOTc1Mzc2NmM0NTczMjQ5N2Q0ZDUzYTcgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBUdWRvciBGbG9yZWEgPHR1ZG9yLmZsb3JlYUBlbmVhLmNvbT4KIERh
dGU6IFRodSwgMyBEZWMgMjAxNSAwNDowODowMCArMDEwMAogU3ViamVjdDogW1BBVENIXSBEaXNw
bGF5IHRlc3RuYW1lIGZvciBzdWJ0ZXN0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91
dGlsLWxpbnV4L3V0aWwtbGludXgvbGliZmRpc2stY2ZkaXNrLWFuZC1zZmRpc2stc2VjdG9yLXNp
emUtaW1wcm92ZW1lbnRzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGls
LWxpbnV4L2xpYmZkaXNrLWNmZGlzay1hbmQtc2ZkaXNrLXNlY3Rvci1zaXplLWltcHJvdmVtZW50
cy5wYXRjaAppbmRleCAzNTYxOTRhOGJhLi5hNDgzNzdiY2Y0IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvbGliZmRpc2stY2ZkaXNrLWFuZC1zZmRp
c2stc2VjdG9yLXNpemUtaW1wcm92ZW1lbnRzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3Jl
L3V0aWwtbGludXgvdXRpbC1saW51eC9saWJmZGlzay1jZmRpc2stYW5kLXNmZGlzay1zZWN0b3It
c2l6ZS1pbXByb3ZlbWVudHMucGF0Y2gKQEAgLTEsMTYxICsxLDcgQEAKLUZyb20gN2FkYTY1NDdm
Y2QxZjY0OWZhZGFhODAyMWZmMjFlM2UwZjQzMTQ1OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
LUZyb206IEthcmVsIFphayA8a3pha0ByZWRoYXQuY29tPgotRGF0ZTogTW9uLCAxNCBPY3QgMjAy
NCAxMTo0NTozMiArMDIwMAotU3ViamVjdDogW1BBVENIIDEvNF0gbGliZmRpc2s6IG1ha2Ugc3Vy
ZSBsaWJibGtpZCB1c2VzIHRoZSBzYW1lIHNlY3RvciBzaXplCi0KLUxpYmZkaXNrIHVzZXMgbGli
YmxraWQgdG8gY2hlY2sgZm9yIGZpbGVzeXN0ZW1zIG9uIHRoZSBkZXZpY2UuIEl0Ci1tYWtlcyBz
ZW5zZSBmb3IgYm90aCBsaWJyYXJpZXMgdG8gc2hhcmUgdGhlIGxvZ2ljYWwgc2VjdG9yIHNpemUK
LXNldHRpbmcsIGFzIHRoaXMgc2V0dGluZyBjYW4gYmUgbW9kaWZpZWQgYnkgdXNpbmcgdGhlIGZk
aXNrIGNvbW1hbmQKLWxpbmUuCi0KLVdlIGRvIG5vdCBzZWUgdGhpcyBhcyBhbiBpc3N1ZSwgYXMg
ZmlsZXN5c3RlbSBkZXRlY3Rpb24gcmFyZWx5IGRlcGVuZHMKLW9uIHNlY3RvciBzaXplICh3aXRo
IHRoZSBleGNlcHRpb24gb2Ygc29tZSBSQUlEcykuIEFkZGl0aW9uYWxseSwKLWxpYmJsa2lkIGlz
IHVzdWFsbHkgaW50ZWxsaWdlbnQgZW5vdWdoIHRvIGNoZWNrIG11bHRpcGxlIGxvY2F0aW9ucwot
aW5kZXBlbmRlbnRseSBvZiB0aGUgY3VycmVudCBkZXZpY2UncyBzZWN0b3Igc2l6ZSBzZXR0aW5n
LgotCi1BZGRyZXNzZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS91dGlsLWxpbnV4L3V0aWwtbGludXgv
cHVsbC8zMjM1Ci0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5j
b20vdXRpbC1saW51eC91dGlsLWxpbnV4L3B1bGwvMzIzN10KLQotU2lnbmVkLW9mZi1ieTogS2Fy
ZWwgWmFrIDxremFrQHJlZGhhdC5jb20+Ci0tLS0KLSBsaWJmZGlzay9zcmMvd2lwZS5jIHwgMyAr
KysKLSAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQgYS9saWJm
ZGlzay9zcmMvd2lwZS5jIGIvbGliZmRpc2svc3JjL3dpcGUuYwotaW5kZXggYmI1ZjFiYjM4YmYu
LmYzODllZDQxOTRhIDEwMDY0NAotLS0tIGEvbGliZmRpc2svc3JjL3dpcGUuYwotKysrIGIvbGli
ZmRpc2svc3JjL3dpcGUuYwotQEAgLTEzMyw2ICsxMzMsNyBAQCBpbnQgZmRpc2tfZG9fd2lwZShz
dHJ1Y3QgZmRpc2tfY29udGV4dCAqY3h0KQotIAkJCURCRyhXSVBFLCB1bF9kZWJ1Z29iaih3cCwg
ImJsa2lkX3Byb2JlX3NldF9kZXZpY2UoKSBmYWlsZWQgW3JjPSVkXSIsIHJjKSk7Ci0gCQkJcmV0
dXJuIHJjOwotIAkJfQotKwkJYmxraWRfcHJvYmVfc2V0X3NlY3RvcnNpemUocHIsIGN4dC0+c2Vj
dG9yX3NpemUpOwotIAotIAkJREJHKFdJUEUsIHVsX2RlYnVnb2JqKHdwLCAiIHdpcGluZy4uLiIp
KTsKLSAJCWJsa2lkX3dpcGVfYWxsKHByKTsKLUBAIC0xNzYsNiArMTc3LDggQEAgaW50IGZkaXNr
X2NoZWNrX2NvbGxpc2lvbnMoc3RydWN0IGZkaXNrX2NvbnRleHQgKmN4dCkKLSAJZnJlZShjeHQt
PmNvbGxpc2lvbik7Ci0gCWN4dC0+Y29sbGlzaW9uID0gTlVMTDsKLSAKLSsJYmxraWRfcHJvYmVf
c2V0X3NlY3RvcnNpemUocHIsIGN4dC0+c2VjdG9yX3NpemUpOwotKwotIAlibGtpZF9wcm9iZV9l
bmFibGVfc3VwZXJibG9ja3MocHIsIDEpOwotIAlibGtpZF9wcm9iZV9zZXRfc3VwZXJibG9ja3Nf
ZmxhZ3MocHIsIEJMS0lEX1NVQkxLU19UWVBFIHwKLSAJCQkgICAgICAgICAgICAgICAgICAgICAg
QkxLSURfU1VCTEtTX0JBRENTVU0pOwotCi1Gcm9tIDU0ZjlhNzkzMDFkY2Y0OTJjYWI4ZTA3MTM0
Zjk2YTkyMWQzNjdhYTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLYXJlbCBaYWsg
PGt6YWtAcmVkaGF0LmNvbT4KLURhdGU6IE1vbiwgMTQgT2N0IDIwMjQgMTU6NDc6MDMgKzAyMDAK
LVN1YmplY3Q6IFtQQVRDSCAyLzRdIGZkaXNrOiAobWFuKSBpbXByb3ZlIC0tc2VjdG9yLXNpemUg
ZGVzY3JpcHRpb24KLQotU2lnbmVkLW9mZi1ieTogS2FyZWwgWmFrIDxremFrQHJlZGhhdC5jb20+
Ci0tLS0KLSBkaXNrLXV0aWxzL2ZkaXNrLjguYWRvYyB8IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL2Rpc2stdXRpbHMv
ZmRpc2suOC5hZG9jIGIvZGlzay11dGlscy9mZGlzay44LmFkb2MKLWluZGV4IGNiNzJiNGEzZWE1
Li41OTQxYWEzNDk2OCAxMDA2NDQKLS0tLSBhL2Rpc2stdXRpbHMvZmRpc2suOC5hZG9jCi0rKysg
Yi9kaXNrLXV0aWxzL2ZkaXNrLjguYWRvYwotQEAgLTQwLDcgKzQwLDcgQEAgTm90ZSB0aGF0ICpw
YXJ0eCooOCkgcHJvdmlkZXMgYSByaWNoIGludGVyZmFjZSBmb3Igc2NyaXB0cyB0byBwcmludCBk
aXNrIGxheW91dHMKLSA9PSBPUFRJT05TCi0gCi0gKi1iKiwgKi0tc2VjdG9yLXNpemUqIF9zZWN0
b3JzaXplXzo6Ci0tU3BlY2lmeSB0aGUgc2VjdG9yIHNpemUgb2YgdGhlIGRpc2suIFZhbGlkIHZh
bHVlcyBhcmUgNTEyLCAxMDI0LCAyMDQ4LCBhbmQgNDA5Ni4gKFJlY2VudCBrZXJuZWxzIGtub3cg
dGhlIHNlY3RvciBzaXplLiBVc2UgdGhpcyBvcHRpb24gb25seSBvbiBvbGQga2VybmVscyBvciB0
byBvdmVycmlkZSB0aGUga2VybmVsJ3MgaWRlYXMuKSBTaW5jZSB1dGlsLWxpbnV4LTIuMTcsICpm
ZGlzayogZGlmZmVyZW50aWF0ZXMgYmV0d2VlbiBsb2dpY2FsIGFuZCBwaHlzaWNhbCBzZWN0b3Ig
c2l6ZS4gVGhpcyBvcHRpb24gY2hhbmdlcyBib3RoIHNlY3RvciBzaXplcyB0byBfc2VjdG9yc2l6
ZV8uCi0rU3BlY2lmeSB0aGUgc2VjdG9yIHNpemUgb2YgdGhlIGRpc2suIFZhbGlkIHZhbHVlcyBh
cmUgNTEyLCAxMDI0LCAyMDQ4LCBhbmQgNDA5Ni4gVGhlIGtlcm5lbCBpcyBhd2FyZSBvZiB0aGUg
c2VjdG9yIHNpemUgZm9yIHJlZ3VsYXIgYmxvY2sgZGV2aWNlcy4gVXNlIHRoaXMgb3B0aW9uIG9u
bHkgb24gdmVyeSBvbGQga2VybmVscywgd2hlbiB3b3JraW5nIHdpdGggZGlzayBpbWFnZXMsIG9y
IHRvIG92ZXJyaWRlIHRoZSBrZXJuZWwncyBkZWZhdWx0IHNlY3RvciBzaXplLiBTaW5jZSB1dGls
LWxpbnV4LTIuMTcsICpmZGlzayogZGlzdGluZ3Vpc2hlcyBiZXR3ZWVuIGxvZ2ljYWwgYW5kIHBo
eXNpY2FsIHNlY3RvciBzaXplLiBUaGlzIG9wdGlvbiBjaGFuZ2VzIGJvdGggc2VjdG9yIHNpemVz
IHRvIHRoZSBzcGVjaWZpZWQgX3NlY3RvcnNpemVfLgotIAotICotQiosICotLXByb3RlY3QtYm9v
dCo6OgotIERvbid0IGVyYXNlIHRoZSBiZWdpbm5pbmcgb2YgdGhlIGZpcnN0IGRpc2sgc2VjdG9y
IHdoZW4gY3JlYXRpbmcgYSBuZXcgZGlzayBsYWJlbC4gVGhpcyBmZWF0dXJlIGlzIHN1cHBvcnRl
ZCBmb3IgR1BUIGFuZCBNQlIuCi0KLUZyb20gZmQzOGVlMjI3NGY3YTMwMzkzZDM4MzlkZmNlNTU2
MjYwMzU1YzNmYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEthcmVsIFphayA8a3ph
a0ByZWRoYXQuY29tPgotRGF0ZTogTW9uLCAxNCBPY3QgMjAyNCAxNTo0ODo0NiArMDIwMAotU3Vi
amVjdDogW1BBVENIIDMvNF0gY2ZkaXNrOiBhZGQgLS1zZWN0b3Itc2l6ZSBjb21tYW5hbmQgbGlu
ZSBvcHRpb24KLQotKiBpbXByb3ZlcyBjb21wYXRpYmlsaXR5IHdpdGggZmRpc2sKLSogYWRkIGFi
aWxpdHkgdG8gd29yayB3aXRoIGRpc2sgaW1hZ2VzIHdoZXJlIGxpYmZkaXNrIGRlZmF1bHRzIHRv
IDUxMgotCi1TaWduZWQtb2ZmLWJ5OiBLYXJlbCBaYWsgPGt6YWtAcmVkaGF0LmNvbT4KLS0tLQot
IGRpc2stdXRpbHMvY2ZkaXNrLjguYWRvYyB8ICAzICsrKwotIGRpc2stdXRpbHMvY2ZkaXNrLmMg
ICAgICB8IDE1ICsrKysrKysrKysrKysrLQotIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvZGlzay11dGlscy9jZmRpc2suOC5h
ZG9jIGIvZGlzay11dGlscy9jZmRpc2suOC5hZG9jCi1pbmRleCA5N2ZhZDYyMWQxMi4uNzU5ZjM5
ZjBlMWEgMTAwNjQ0Ci0tLS0gYS9kaXNrLXV0aWxzL2NmZGlzay44LmFkb2MKLSsrKyBiL2Rpc2st
dXRpbHMvY2ZkaXNrLjguYWRvYwotQEAgLTU1LDYgKzU1LDkgQEAgVXNlIGV4Y2x1c2l2ZSBCU0Qg
bG9jayBmb3IgZGV2aWNlIG9yIGZpbGUgaXQgb3BlcmF0ZXMuIFRoZSBvcHRpb25hbCBhcmd1bWVu
dCBfbW8KLSAqLXIqLCAqLS1yZWFkLW9ubHkqOjoKLSBGb3JjZWQgb3BlbiBpbiByZWFkLW9ubHkg
bW9kZS4KLSAKLSsqLWIqLCAqLS1zZWN0b3Itc2l6ZSogX3NlY3RvcnNpemVfOjoKLStTcGVjaWZ5
IHRoZSBzZWN0b3Igc2l6ZSBvZiB0aGUgZGlzay4gVmFsaWQgdmFsdWVzIGFyZSA1MTIsIDEwMjQs
IDIwNDgsIGFuZCA0MDk2LiBUaGUga2VybmVsIGlzIGF3YXJlIG9mIHRoZSBzZWN0b3Igc2l6ZSBm
b3IgcmVndWxhciBibG9jayBkZXZpY2VzLiBVc2UgdGhpcyBvcHRpb24gb25seSBvbiB2ZXJ5IG9s
ZCBrZXJuZWxzLCB3aGVuIHdvcmtpbmcgd2l0aCBkaXNrIGltYWdlcywgb3IgdG8gb3ZlcnJpZGUg
dGhlIGtlcm5lbCdzIGRlZmF1bHQgc2VjdG9yIHNpemUuIFNpbmNlIHV0aWwtbGludXgtMi4xNywg
KmZkaXNrKiBkaXN0aW5ndWlzaGVzIGJldHdlZW4gbG9naWNhbCBhbmQgcGh5c2ljYWwgc2VjdG9y
IHNpemUuIFRoaXMgb3B0aW9uIGNoYW5nZXMgYm90aCBzZWN0b3Igc2l6ZXMgdG8gdGhlIHNwZWNp
ZmllZCBfc2VjdG9yc2l6ZV8uCi0rCi0gKi16KiwgKi0temVybyo6OgotIFN0YXJ0IHdpdGggYW4g
aW4tbWVtb3J5IHplcm9lZCBwYXJ0aXRpb24gdGFibGUuIFRoaXMgb3B0aW9uIGRvZXMgbm90IHpl
cm8gdGhlIHBhcnRpdGlvbiB0YWJsZSBvbiB0aGUgZGlzazsgcmF0aGVyLCBpdCBzaW1wbHkgc3Rh
cnRzIHRoZSBwcm9ncmFtIHdpdGhvdXQgcmVhZGluZyB0aGUgZXhpc3RpbmcgcGFydGl0aW9uIHRh
YmxlLiBUaGlzIG9wdGlvbiBhbGxvd3MgeW91IHRvIGNyZWF0ZSBhIG5ldyBwYXJ0aXRpb24gdGFi
bGUgZnJvbSBzY3JhdGNoIG9yIGZyb20gYW4gKnNmZGlzayooOCktY29tcGF0aWJsZSBzY3JpcHQu
Ci0gCi1kaWZmIC0tZ2l0IGEvZGlzay11dGlscy9jZmRpc2suYyBiL2Rpc2stdXRpbHMvY2ZkaXNr
LmMKLWluZGV4IDJlMGFhZGE0NzRhLi5iYzFjODdkODNlNCAxMDA2NDQKLS0tLSBhL2Rpc2stdXRp
bHMvY2ZkaXNrLmMKLSsrKyBiL2Rpc2stdXRpbHMvY2ZkaXNrLmMKLUBAIC0yNzMxLDYgKzI3MzEs
OCBAQCBzdGF0aWMgdm9pZCBfX2F0dHJpYnV0ZV9fKChfX25vcmV0dXJuX18pKSB1c2FnZSh2b2lk
KQotIAkgICAgICBfKCIgICAgIC0tbG9ja1s9PG1vZGU+XSAgICAgIHVzZSBleGNsdXNpdmUgZGV2
aWNlIGxvY2sgKCVzLCAlcyBvciAlcylcbiIpLCAieWVzIiwgIm5vIiwgIm5vbmJsb2NrIik7Ci0g
CWZwdXRzKF8oIiAtciwgLS1yZWFkLW9ubHkgICAgICAgICAgZm9yY2VkIG9wZW4gY2ZkaXNrIGlu
IHJlYWQtb25seSBtb2RlXG4iKSwgb3V0KTsKLSAKLSsJZnB1dHMoXygiIC1iLCAtLXNlY3Rvci1z
aXplIDxzaXplPiBwaHlzaWNhbCBhbmQgbG9naWNhbCBzZWN0b3Igc2l6ZVxuIiksIG91dCk7Ci0r
Ci0gCWZwdXRzKFVTQUdFX1NFUEFSQVRPUiwgb3V0KTsKLSAJZnByaW50ZihvdXQsIFVTQUdFX0hF
TFBfT1BUSU9OUygyNikpOwotIAotQEAgLTI3NDMsNiArMjc0NSw3IEBAIGludCBtYWluKGludCBh
cmdjLCBjaGFyICphcmd2W10pCi0gCWNvbnN0IGNoYXIgKmRpc2twYXRoID0gTlVMTCwgKmxvY2tt
b2RlID0gTlVMTDsKLSAJaW50IHJjLCBjLCBjb2xvcm1vZGUgPSBVTF9DT0xPUk1PREVfVU5ERUY7
Ci0gCWludCByZWFkX29ubHkgPSAwOwotKwlzaXplX3QgdXNlcl9zcyA9IDA7Ci0gCXN0cnVjdCBj
ZmRpc2sgX2NmID0geyAubGluZXNfaWR4ID0gMCB9LAotIAkJICAgICAgKmNmID0gJl9jZjsKLSAJ
ZW51bSB7Ci1AQCAtMjc1Miw2ICsyNzU1LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFy
Z3ZbXSkKLSAJCXsgImNvbG9yIiwgICBvcHRpb25hbF9hcmd1bWVudCwgTlVMTCwgJ0wnIH0sCi0g
CQl7ICJsb2NrIiwgICAgb3B0aW9uYWxfYXJndW1lbnQsIE5VTEwsIE9QVF9MT0NLIH0sCi0gCQl7
ICJoZWxwIiwgICAgbm9fYXJndW1lbnQsICAgICAgIE5VTEwsICdoJyB9LAotKwkJeyAic2VjdG9y
LXNpemUiLCByZXF1aXJlZF9hcmd1bWVudCwgTlVMTCwgJ2InIH0sCi0gCQl7ICJ2ZXJzaW9uIiwg
bm9fYXJndW1lbnQsICAgICAgIE5VTEwsICdWJyB9LAotIAkJeyAiemVybyIsICAgIG5vX2FyZ3Vt
ZW50LAlOVUxMLCAneicgfSwKLSAJCXsgInJlYWQtb25seSIsIG5vX2FyZ3VtZW50LCAgICAgTlVM
TCwgJ3InIH0sCi1AQCAtMjc2Myw4ICsyNzY3LDE1IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFy
ICphcmd2W10pCi0gCXRleHRkb21haW4oUEFDS0FHRSk7Ci0gCWNsb3NlX3N0ZG91dF9hdGV4aXQo
KTsKLSAKLS0Jd2hpbGUoKGMgPSBnZXRvcHRfbG9uZyhhcmdjLCBhcmd2LCAiTDo6aFZ6ciIsIGxv
bmdvcHRzLCBOVUxMKSkgIT0gLTEpIHsKLSsJd2hpbGUoKGMgPSBnZXRvcHRfbG9uZyhhcmdjLCBh
cmd2LCAiYjpMOjpoVnpyIiwgbG9uZ29wdHMsIE5VTEwpKSAhPSAtMSkgewotIAkJc3dpdGNoKGMp
IHsKLSsJCWNhc2UgJ2InOgotKwkJCXVzZXJfc3MgPSBzdHJ0b3UzMl9vcl9lcnIob3B0YXJnLAot
KwkJCQkJXygiaW52YWxpZCBzZWN0b3Igc2l6ZSBhcmd1bWVudCIpKTsKLSsJCQlpZiAodXNlcl9z
cyAhPSA1MTIgJiYgdXNlcl9zcyAhPSAxMDI0ICYmCi0rCQkJICAgIHVzZXJfc3MgIT0gMjA0OCAm
JiB1c2VyX3NzICE9IDQwOTYpCi0rCQkJCWVycngoRVhJVF9GQUlMVVJFLCBfKCJpbnZhbGlkIHNl
Y3RvciBzaXplIGFyZ3VtZW50IikpOwotKwkJCWJyZWFrOwotIAkJY2FzZSAnaCc6Ci0gCQkJdXNh
Z2UoKTsKLSAJCQlicmVhazsKLUBAIC0yODAzLDYgKzI4MTQsOCBAQCBpbnQgbWFpbihpbnQgYXJn
YywgY2hhciAqYXJndltdKQotIAljZi0+Y3h0ID0gZmRpc2tfbmV3X2NvbnRleHQoKTsKLSAJaWYg
KCFjZi0+Y3h0KQotIAkJZXJyKEVYSVRfRkFJTFVSRSwgXygiZmFpbGVkIHRvIGFsbG9jYXRlIGxp
YmZkaXNrIGNvbnRleHQiKSk7Ci0rCWlmICh1c2VyX3NzKQotKwkJZmRpc2tfc2F2ZV91c2VyX3Nl
Y3Rvcl9zaXplKGNmLT5jeHQsIHVzZXJfc3MsIHVzZXJfc3MpOwotIAotIAlmZGlza19zZXRfYXNr
KGNmLT5jeHQsIGFza19jYWxsYmFjaywgKHZvaWQgKikgY2YpOwotIAotCi1Gcm9tIGVmN2I3NmJh
YTE3ZGRiNTQxNDY5MWZhOGY0OWQ2MTQxNWMzMDg3MWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGM2ZTcyMDY0MDE4YTI5OTQ4ZjYxNWE2NzY4OThlMmFjY2FiNTBjYmUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBLYXJlbCBaYWsgPGt6YWtAcmVkaGF0LmNvbT4KIERhdGU6
IE1vbiwgMTQgT2N0IDIwMjQgMTU6NTA6NDAgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSCA0LzRdIHNm
ZGlzazogYWRkIC0tc2VjdG9yLXNpemUgY29tbWFuYW5kIGxpbmUgb3B0aW9uCitTdWJqZWN0OiBb
UEFUQ0hdIHNmZGlzazogYWRkIC0tc2VjdG9yLXNpemUgY29tbWFuYW5kIGxpbmUgb3B0aW9uCiAK
ICogaW1wcm92ZXMgY29tcGF0aWJpbGl0eSB3aXRoIGZkaXNrCiAqIGFkZCBhYmlsaXR5IHRvIHdv
cmsgd2l0aCBkaXNrIGltYWdlcyB3aGVyZSBsaWJmZGlzayBkZWZhdWx0cyB0byA1MTIKQEAgLTE2
OCwxMCArMTQsMTAgQEAgU2lnbmVkLW9mZi1ieTogS2FyZWwgWmFrIDxremFrQHJlZGhhdC5jb20+
CiAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRp
ZmYgLS1naXQgYS9kaXNrLXV0aWxzL3NmZGlzay44LmFkb2MgYi9kaXNrLXV0aWxzL3NmZGlzay44
LmFkb2MKLWluZGV4IDI2Y2NhZDVhM2IyLi5jZTllOTdiNzY4MiAxMDA2NDQKK2luZGV4IGJjM2Zm
OWIuLmQxZWFhMzcgMTAwNjQ0CiAtLS0gYS9kaXNrLXV0aWxzL3NmZGlzay44LmFkb2MKICsrKyBi
L2Rpc2stdXRpbHMvc2ZkaXNrLjguYWRvYwotQEAgLTIwOCw2ICsyMDgsOSBAQCBUaGUgZGVmYXVs
dCBsaXN0IG9mIGNvbHVtbnMgbWF5IGJlIGV4dGVuZGVkIGlmIF9saXN0XyBpcyBzcGVjaWZpZWQg
aW4gdGhlIGZvcm1hdAorQEAgLTIwMSw2ICsyMDEsOSBAQCBUaGUgZGVmYXVsdCBsaXN0IG9mIGNv
bHVtbnMgbWF5IGJlIGV4dGVuZGVkIGlmIF9saXN0XyBpcyBzcGVjaWZpZWQgaW4gdGhlIGZvcm1h
dAogICotcSosICotLXF1aWV0Kjo6CiAgU3VwcHJlc3MgZXh0cmEgaW5mbyBtZXNzYWdlcy4KICAK
QEAgLTE4MSw3ICsyNyw3IEBAIGluZGV4IDI2Y2NhZDVhM2IyLi5jZTllOTdiNzY4MiAxMDA2NDQK
ICAqLXUqLCAqLS11bml0IFMqOjoKICBEZXByZWNhdGVkIG9wdGlvbi4gT25seSB0aGUgc2VjdG9y
IHVuaXQgaXMgc3VwcG9ydGVkLiBUaGlzIG9wdGlvbiBpcyBub3Qgc3VwcG9ydGVkIHdoZW4gdXNp
bmcgdGhlICotLXNob3ctc2l6ZSogY29tbWFuZC4KICAKLUBAIC0yNTYsNyArMjU5LDcgQEAgU3Bl
Y2lmeSB0aGUgbWF4aW1hbCBudW1iZXIgb2YgR1BUIHBhcnRpdGlvbnMuCitAQCAtMjQ5LDcgKzI1
Miw3IEBAIFNwZWNpZnkgdGhlIG1heGltYWwgbnVtYmVyIG9mIEdQVCBwYXJ0aXRpb25zLgogICpn
cmFpbio6OgogIFNwZWNpZnkgbWluaW1hbCBzaXplIGluIGJ5dGVzIHVzZWQgdG8gY2FsY3VsYXRl
IHBhcnRpdGlvbnMgYWxpZ25tZW50LiBUaGUgZGVmYXVsdCBpcyAxTWlCIGFuZCBpdCdzIHN0cm9u
Z2x5IHJlY29tbWVuZGVkIHRvIHVzZSB0aGUgZGVmYXVsdC4gRG8gbm90IG1vZGlmeSB0aGlzIHZh
cmlhYmxlIGlmIHlvdSdyZSBub3Qgc3VyZS4KICAqc2VjdG9yLXNpemUqOjoKQEAgLTE5MSwxMCAr
MzcsMTAgQEAgaW5kZXggMjZjY2FkNWEzYjIuLmNlOWU5N2I3NjgyIDEwMDY0NAogIE5vdGUgdGhh
dCBpdCBpcyBvbmx5IHBvc3NpYmxlIHRvIHVzZSBoZWFkZXIgbGluZXMgYmVmb3JlIHRoZSBmaXJz
dCBwYXJ0aXRpb24gaXMgc3BlY2lmaWVkIGluIHRoZSBpbnB1dC4KICAKIGRpZmYgLS1naXQgYS9k
aXNrLXV0aWxzL3NmZGlzay5jIGIvZGlzay11dGlscy9zZmRpc2suYwotaW5kZXggY2Y0MDIwMDdi
NTEuLjVlN2MxZDkyNmU0IDEwMDY0NAoraW5kZXggZDhkZDhkMi4uOTdkNDI2NSAxMDA2NDQKIC0t
LSBhL2Rpc2stdXRpbHMvc2ZkaXNrLmMKICsrKyBiL2Rpc2stdXRpbHMvc2ZkaXNrLmMKLUBAIC0y
MTU1LDYgKzIxNTUsOCBAQCBzdGF0aWMgdm9pZCBfX2F0dHJpYnV0ZV9fKChfX25vcmV0dXJuX18p
KSB1c2FnZSh2b2lkKQorQEAgLTIwODQsNiArMjA4NCw4IEBAIHN0YXRpYyB2b2lkIF9fYXR0cmli
dXRlX18oKF9fbm9yZXR1cm5fXykpIHVzYWdlKHZvaWQpCiAgCSAgICAgIF8oIiAgICAgLS1jb2xv
cls9PHdoZW4+XSAgICAgIGNvbG9yaXplIG91dHB1dCAoJXMsICVzIG9yICVzKVxuIiksICJhdXRv
IiwgImFsd2F5cyIsICJuZXZlciIpOwogIAlmcHJpbnRmKG91dCwKICAJICAgICAgICAiICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAlc1xuIiwgVVNBR0VfQ09MT1JTX0RFRkFVTFQpOwpAQCAt
MjAzLDcgKzQ5LDcgQEAgaW5kZXggY2Y0MDIwMDdiNTEuLjVlN2MxZDkyNmU0IDEwMDY0NAogIAlm
cHJpbnRmKG91dCwKICAJICAgICAgXygiICAgICAtLWxvY2tbPTxtb2RlPl0gICAgICAgdXNlIGV4
Y2x1c2l2ZSBkZXZpY2UgbG9jayAoJXMsICVzIG9yICVzKVxuIiksICJ5ZXMiLCAibm8iLCAibm9u
YmxvY2siKTsKICAJZnB1dHMoXygiIC1OLCAtLXBhcnRubyA8bnVtPiAgICAgICAgc3BlY2lmeSBw
YXJ0aXRpb24gbnVtYmVyXG4iKSwgb3V0KTsKLUBAIC0yMTkxLDYgKzIxOTMsNyBAQCBpbnQgbWFp
bihpbnQgYXJnYywgY2hhciAqYXJndltdKQorQEAgLTIxMjAsNiArMjEyMiw3IEBAIGludCBtYWlu
KGludCBhcmdjLCBjaGFyICphcmd2W10pCiAgCWNvbnN0IGNoYXIgKm91dGFyZyA9IE5VTEw7CiAg
CWludCByYyA9IC1FSU5WQUwsIGMsIGxvbmdpZHggPSAtMSwgYnl0ZXMgPSAwOwogIAlpbnQgY29s
b3Jtb2RlID0gVUxfQ09MT1JNT0RFX1VOREVGOwpAQCAtMjExLDcgKzU3LDcgQEAgaW5kZXggY2Y0
MDIwMDdiNTEuLjVlN2MxZDkyNmU0IDEwMDY0NAogIAlzdHJ1Y3Qgc2ZkaXNrIF9zZiA9IHsKICAJ
CS5wYXJ0bm8gPSAtMSwKICAJCS53aXBlbW9kZSA9IFdJUEVNT0RFX0FVVE8sCi1AQCAtMjIxNyw2
ICsyMjIwLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKK0BAIC0yMTQ1LDYg
KzIxNDgsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogIAkJT1BUX05PVEVM
TCwKICAJCU9QVF9SRUxPQ0FURSwKICAJCU9QVF9MT0NLLApAQCAtMjE5LDcgKzY1LDcgQEAgaW5k
ZXggY2Y0MDIwMDdiNTEuLjVlN2MxZDkyNmU0IDEwMDY0NAogIAl9OwogIAogIAlzdGF0aWMgY29u
c3Qgc3RydWN0IG9wdGlvbiBsb25nb3B0c1tdID0gewotQEAgLTIyNDYsNiArMjI1MCw3IEBAIGlu
dCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCitAQCAtMjE3NCw2ICsyMTc4LDcgQEAgaW50
IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAJCXsgIm91dHB1dCIsICByZXF1aXJlZF9h
cmd1bWVudCwgTlVMTCwgJ28nIH0sCiAgCQl7ICJwYXJ0bm8iLCAgcmVxdWlyZWRfYXJndW1lbnQs
IE5VTEwsICdOJyB9LAogIAkJeyAicmVvcmRlciIsIG5vX2FyZ3VtZW50LCAgICAgICBOVUxMLCAn
cicgfSwKQEAgLTIyNyw3ICs3Myw3IEBAIGluZGV4IGNmNDAyMDA3YjUxLi41ZTdjMWQ5MjZlNCAx
MDA2NDQKICAJCXsgInNob3ctZ2VvbWV0cnkiLCBub19hcmd1bWVudCwgTlVMTCwgJ2cnIH0sCiAg
CQl7ICJxdWlldCIsICAgbm9fYXJndW1lbnQsICAgICAgIE5VTEwsICdxJyB9LAogIAkJeyAidmVy
aWZ5IiwgIG5vX2FyZ3VtZW50LCAgICAgICBOVUxMLCAnVicgfSwKLUBAIC0yNDUwLDYgKzI0NTUs
MTMgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKK0BAIC0yMzczLDYgKzIzNzgs
MTMgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAJCQkJc2YtPmxvY2ttb2Rl
ID0gb3B0YXJnOwogIAkJCX0KICAJCQlicmVhazsKQEAgLTI0MSw3ICs4Nyw3IEBAIGluZGV4IGNm
NDAyMDA3YjUxLi41ZTdjMWQ5MjZlNCAxMDA2NDQKICAJCWRlZmF1bHQ6CiAgCQkJZXJydHJ5aGVs
cChFWElUX0ZBSUxVUkUpOwogIAkJfQotQEAgLTI0NjAsNiArMjQ3Miw4IEBAIGludCBtYWluKGlu
dCBhcmdjLCBjaGFyICphcmd2W10pCitAQCAtMjM4Myw2ICsyMzk1LDggQEAgaW50IG1haW4oaW50
IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAJc2ZkaXNrX2luaXQoc2YpOwogIAlpZiAoYnl0ZXMpCiAg
CQlmZGlza19zZXRfc2l6ZV91bml0KHNmLT5jeHQsIEZESVNLX1NJWkVVTklUX0JZVEVTKTsKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9wdGVzdC5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9wdGVzdC5wYXRj
aAppbmRleCA3MzQ1OTI2Yjg4Li5hYjU2ODM5MjU0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvcHRlc3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L3B0ZXN0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBmOWJlNzNjM2UyYjBhNGYwOTIzOTUwZGNiMDU4YmU4NWQzZWU4ZWQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSAwNjMzNjBiNDUxZjc4Zjc3OTA3MDhhZTY5MjQyNWY0NTRkZmM1
MmVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVHVkb3IgRmxvcmVhIDx0dWRvci5m
bG9yZWFAZW5lYS5jb20+CiBEYXRlOiBUaHUsIDMgRGVjIDIwMTUgMDQ6MDg6MDAgKzAxMDAKIFN1
YmplY3Q6IFtQQVRDSF0gRGVmaW5lIFRFU1RTIHZhcmlhYmxlCkBAIC0xMCwxMCArMTAsMTAgQEAg
VXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
CiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1pbmRleCA1MGFiOGQw
Li43ZTIzNDBkIDEwMDY0NAoraW5kZXggODIwNGJjMC4uMTBiZTJmMSAxMDA2NDQKIC0tLSBhL01h
a2VmaWxlLmFtCiArKysgYi9NYWtlZmlsZS5hbQotQEAgLTY0LDYgKzY0LDcgQEAgdG1wZmlsZXNf
REFUQSA9CitAQCAtNjUsNiArNjUsNyBAQCB0bXBmaWxlc19EQVRBID0KICBkaXN0X2Jhc2hjb21w
bGV0aW9uX0RBVEEgPQogIGNoZWNrX1BST0dSQU1TID0KICBkaXN0X2NoZWNrX1NDUklQVFMgPQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4XzIuNDAu
Mi5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjQwLjQuYmIK
c2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eF8yLjQwLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3V0
aWwtbGludXgvdXRpbC1saW51eF8yLjQwLjQuYmIKLS0gCjIuNDQuMQoK

--===============4853870825611159790==--

