Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF11C021A3
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:20:50 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.42711.1738416044240252461
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GaeNc3m3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=rSGgDFwq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010194c1abb852-68abb36a-e382-4160-ac99-3b12efc57bd6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BN273rTN2h1t7qd9P1IkRfy1RVlvoIQ7/NR2BYEoszw=;
	b=GaeNc3m33lSXPYTQWMz1qQAKfk53II410YVHHA1uOH/rRYhnaZvco46yP67PgqMG
	xaABPD/HSS1vNkoGew7xXmf32lA60e8IgR5RI08QLnrOVWlyXzgxz3uwc3EJ8PZDkJN
	IAShGFW8IdgfZdYhxpMUAP3nmN2Tc8emIx+WOqr8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BN273rTN2h1t7qd9P1IkRfy1RVlvoIQ7/NR2BYEoszw=;
	b=rSGgDFwqvN7UFuk+NcYH3/YOmMIsrQC3fBXI7uaBa1BT8ru3DMEp22Jds1EKugrQ
	YalWakc5wqlAz4kQw8thzBtHRy3mBcDp8gzeUKXMflr3TkJoHCcCu7dGqxdFWGn61rG
	mYfY+qyR+2apn4+hgtgiTSD7/r5l4/ezhy9arcXU=
Content-Type: multipart/mixed; boundary="===============4643261948903194041=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux,util-linux-libuuid: upgrading to 2.40.4,2.40.4
 FAILED
Message-ID: <01010194c1abb852-68abb36a-e382-4160-ac99-3b12efc57bd6-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210510

--===============4643261948903194041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *util-linux,util-linux-libuuid* to *2.40.4,2.40.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-util-linux-libuuid-upgrade-2.40.2-2.40.4-.patch
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
From a754105040c2246799b2613640ad25cfed3b537a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 05:19:23 +0000
Subject: [PATCH] util-linux,util-linux-libuuid: upgrade 2.40.2 ->
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
index 56162ab147..e36476a184 100644
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
index 0000000000..d5e47a91f5
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0005-cfdisk-add-sector-size-commanand-line-option.patch
@@ -0,0 +1,83 @@
+From 868fecf80cb50683335c753fc853506172f41b1d Mon Sep 17 00:00:00 2001
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
index 8ea00dbb95..8a7415e39a 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From da58b4150f6932de36c962ea657713bcf4ea44be Mon Sep 17 00:00:00 2001
+From 8359fde2fe20ddea39d3342105959d77e7795ceb Mon Sep 17 00:00:00 2001
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
index 74abdc2038..cac438820d 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From 0387d71516c978899cfd556ca512f530a212b4a9 Mon Sep 17 00:00:00 2001
+From 802e39639d21d139e10963c2c8d5dcf669025314 Mon Sep 17 00:00:00 2001
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
index 871b0b2d30..30239d4269 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,4 @@
-From 45450d0339cd7ee27f53c0f2fac1cc74ed9bbfb8 Mon Sep 17 00:00:00 2001
+From f07519b427c6fc2101b7c9870998cf7ef217aa1f Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
diff --git a/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch b/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch
index 356194a8ba..15fea1505a 100644
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
+From 2f2bc1c6be9476cdfc7659fd3306e6b9c45dbf8d Mon Sep 17 00:00:00 2001
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
index 7345926b88..733970695f 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From f9be73c3e2b0a4f0923950dcb058be85d3ee8ed7 Mon Sep 17 00:00:00 2001
+From cf88c71a658a8bca9fd812091d6281e9f33d4d7c Mon Sep 17 00:00:00 2001
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


--===============4643261948903194041==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-util-linux-libuuid-upgrade-2.40.2-2.40.4-.patch"

RnJvbSBhNzU0MTA1MDQwYzIyNDY3OTliMjYxMzY0MGFkMjVjZmVkM2I1MzdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwNToxOToyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHV0
aWwtbGludXgsdXRpbC1saW51eC1saWJ1dWlkOiB1cGdyYWRlIDIuNDAuMiAtPgogMi40MC40LDIu
NDAuMiAtPiAyLjQwLjQKCi0tLQogLi4uMi40MC4yLmJiID0+IHV0aWwtbGludXgtbGlidXVpZF8y
LjQwLjQuYmJ9IHwgICAwCiBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgu
aW5jICAgfCAgIDQgKy0KIC4uLngtc2VjdXJlZGlyLWFuZC1wYW1fbGFzdGxvZzItaW5zdGFsbC5w
YXRjaCB8ICA4MiAtLS0tLS0tLQogLi4uZGQtc2VjdG9yLXNpemUtY29tbWFuYW5kLWxpbmUtb3B0
aW9uLnBhdGNoIHwgIDgzICsrKysrKysrCiAuLi4vdXRpbC1saW51eC9hdm9pZF9wYXJhbGxlbF90
ZXN0cy5wYXRjaCAgICAgfCAgIDQgKy0KIC4uLi91dGlsLWxpbnV4L2NvbmZpZ3VyZS1zYmluZGly
LnBhdGNoICAgICAgICB8ICAgNCArLQogLi4uL2Rpc3BsYXlfdGVzdG5hbWVfZm9yX3N1YnRlc3Qu
cGF0Y2ggICAgICAgIHwgICAyICstCiAuLi4tYW5kLXNmZGlzay1zZWN0b3Itc2l6ZS1pbXByb3Zl
bWVudHMucGF0Y2ggfCAxNzggKystLS0tLS0tLS0tLS0tLS0tCiAuLi4vdXRpbC1saW51eC91dGls
LWxpbnV4L3B0ZXN0LnBhdGNoICAgICAgICAgfCAgIDYgKy0KIC4uLmwtbGludXhfMi40MC4yLmJi
ID0+IHV0aWwtbGludXhfMi40MC40LmJifSB8ICAgMAogMTAgZmlsZXMgY2hhbmdlZCwgMTA1IGlu
c2VydGlvbnMoKyksIDI1OCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS91
dGlsLWxpbnV4L3t1dGlsLWxpbnV4LWxpYnV1aWRfMi40MC4yLmJiID0+IHV0aWwtbGludXgtbGli
dXVpZF8yLjQwLjQuYmJ9ICgxMDAlKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1j
b3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWF1dG90b29scy1maXgtc2VjdXJlZGlyLWFu
ZC1wYW1fbGFzdGxvZzItaW5zdGFsbC5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVj
aXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDA1LWNmZGlzay1hZGQtc2VjdG9yLXNp
emUtY29tbWFuYW5kLWxpbmUtb3B0aW9uLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUv
dXRpbC1saW51eC97dXRpbC1saW51eF8yLjQwLjIuYmIgPT4gdXRpbC1saW51eF8yLjQwLjQuYmJ9
ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC1saWJ1dWlkXzIuNDAuMi5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRp
bC1saW51eC1saWJ1dWlkXzIuNDAuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWRfMi40MC4y
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGli
dXVpZF8yLjQwLjQuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC5pbmMgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgu
aW5jCmluZGV4IDU2MTYyYWIxNDcuLmUzNjQ3NmExODQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
dXRpbC1saW51eC91dGlsLWxpbnV4LmluYwpAQCAtMzgsOCArMzgsOCBAQCBTUkNfVVJJID0gIiR7
S0VSTkVMT1JHX01JUlJPUn0vbGludXgvdXRpbHMvdXRpbC1saW51eC92JHtNQUpPUl9WRVJTSU9O
fS91dGlsLWxpbgogICAgICAgICAgICBmaWxlOi8vZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3VidGVz
dC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBc
CiAgICAgICAgICAgIGZpbGU6Ly9mY250bC1sb2NrLmMgXAotICAgICAgICAgICBmaWxlOi8vMDAw
MS1hdXRvdG9vbHMtZml4LXNlY3VyZWRpci1hbmQtcGFtX2xhc3Rsb2cyLWluc3RhbGwucGF0Y2gg
XAogICAgICAgICAgICBmaWxlOi8vbGliZmRpc2stY2ZkaXNrLWFuZC1zZmRpc2stc2VjdG9yLXNp
emUtaW1wcm92ZW1lbnRzLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDUtY2ZkaXNrLWFk
ZC1zZWN0b3Itc2l6ZS1jb21tYW5hbmQtbGluZS1vcHRpb24ucGF0Y2ggXAogICAgICAgICAgICAi
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkNzhiMzdhNjZmNTkyMmQ3MGVkZjNiZGZiMDFhNmIz
M2QzNGVkM2MzY2FmZDY2MjgyMDNiMmEyYjY3YzhlOGIzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjVjMWRhZjczM2IwNGU5ODU5YWZkYzNiZDg3Y2M0ODExODBlZTBmODhiNWMwOTQ2YjE2ZmRlYzkz
MTk3NWZiNzkiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXgvMDAwMS1hdXRvdG9vbHMtZml4LXNlY3VyZWRpci1hbmQtcGFtX2xhc3Rsb2cyLWluc3Rh
bGwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1h
dXRvdG9vbHMtZml4LXNlY3VyZWRpci1hbmQtcGFtX2xhc3Rsb2cyLWluc3RhbGwucGF0Y2gKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDI3MmU1NzRhNzcuLjAwMDAwMDAwMDAKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtYXV0b3Rvb2xzLWZp
eC1zZWN1cmVkaXItYW5kLXBhbV9sYXN0bG9nMi1pbnN0YWxsLnBhdGNoCisrKyAvZGV2L251bGwK
QEAgLTEsODIgKzAsMCBAQAotRnJvbSBmOTEyZmIxYmJiMGZmNWFmMjczNmQxNTQzNDdhM2I5ZmM0
MDQ3NmViIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogS2FyZWwgWmFrIDxremFrQHJl
ZGhhdC5jb20+Ci1EYXRlOiBUdWUsIDI3IEF1ZyAyMDI0IDEyOjAwOjIxICswMjAwCi1TdWJqZWN0
OiBbUEFUQ0hdIGF1dG90b29sczogZml4IHNlY3VyZWRpciBhbmQgcGFtX2xhc3Rsb2cyIGluc3Rh
bGwKLQotQWRkcmVzc2VzOiBodHRwczovL2dpdGh1Yi5jb20vdXRpbC1saW51eC91dGlsLWxpbnV4
L3B1bGwvMzE3MwotU2lnbmVkLW9mZi1ieTogS2FyZWwgWmFrIDxremFrQHJlZGhhdC5jb20+Ci0K
LVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQKLVtodHRwczovL2dpdGh1Yi5jb20vdXRpbC1saW51
eC91dGlsLWxpbnV4L2NvbW1pdC85Yzc4N2VhYWM0M2Y1ZjAxMTQ2Zjc5MmIwMjM5ZjU4N2U0Yjgx
MjAyXQotCi1TaWduZWQtb2ZmLWJ5OiBZaSBaaGFvIDx5aS56aGFvQHdpbmRyaXZlci5jb20+Ci0t
LS0KLSBNYWtlZmlsZS5hbSAgICAgICAgICAgICAgICAgICAgfCA2ICsrKy0tLQotIGNvbmZpZ3Vy
ZS5hYyAgICAgICAgICAgICAgICAgICB8IDYgKysrLS0tCi0gcGFtX2xhc3Rsb2cyL3NyYy9NYWtl
bW9kdWxlLmFtIHwgMiArLQotIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRl
bGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvTWFrZWZpbGUuYW0gYi9NYWtlZmlsZS5hbQotaW5k
ZXggZWUyZDU1My4uYTVkY2FlYSAxMDA2NDQKLS0tLSBhL01ha2VmaWxlLmFtCi0rKysgYi9NYWtl
ZmlsZS5hbQotQEAgLTU2LDcgKzU2LDcgQEAgdXNyc2Jpbl9leGVjX1BST0dSQU1TID0KLSBtYW5f
TUFOUyA9Ci0gcGtnY29uZmlnX0RBVEEgPQotIHVzcmxpYl9leGVjX0xUTElCUkFSSUVTID0KLS11
c3JzZWN1cmVsaWJfZXhlY19MVExJQlJBUklFUyA9Ci0rc2VjdXJlbGliX2V4ZWNfTFRMSUJSQVJJ
RVMgPQotIGJpbl9QUk9HUkFNUyA9Ci0gc2Jpbl9QUk9HUkFNUyA9Ci0gZGlzdF91c3JiaW5fZXhl
Y19TQ1JJUFRTID0KLUBAIC0xNTUsMTEgKzE1NSwxMSBAQCBFWFRSQV9ESVNUICs9IFwKLSAjIHB5
bGlibW91bnRleGVjIG1vZHVsZSBtdXN0IGJlIGluc3RhbGxlZCBhZnRlciB1c3JsaWJfZXhlYyBs
aWJyYXJpZXMsCi0gIyBvdGhlcndpc2UgdGhlIGxpYnRvb2wgcmVsaW5rIHN0ZXAgd2lsbCBmYWls
IHRvIGZpbmQgbGlibW91bnQubGEgYW5kCi0gIyB3aWxsIHRyeSAtbG1vdW50IHdoaWNoIGlzIHBv
c3NpYmx5IG5vdCBhdmFpbGFibGUuCi0tIyBUaGUgc2FtZSBmb3IgdXNyc2VjdXJlbGliX2V4ZWMg
YW5kIGxpYmxhc3Rsb2cyLmxhCi0rIyBUaGUgc2FtZSBmb3Igc2VjdXJlbGliX2V4ZWMgYW5kIGxp
Ymxhc3Rsb2cyLmxhCi0gIwotICMgU28gaW50cm9kdWNlIHRoaXMgZGVwZW5kZW5jeSBydWxlOgot
ICMgaW5zdGFsbC1weWxpYm1vdW50ZXhlY0xUTElCUkFSSUVTOiBpbnN0YWxsLXVzcmxpYl9leGVj
TFRMSUJSQVJJRVMKLS0jIGluc3RhbGwtdXNyc2VjdXJlbGliX2V4ZWNMVExJQlJBUklFUzogaW5z
dGFsbC11c3JsaWJfZXhlY0xUTElCUkFSSUVTCi0rIyBpbnN0YWxsLXNlY3VyZWxpYl9leGVjTFRM
SUJSQVJJRVM6IGluc3RhbGwtdXNybGliX2V4ZWNMVExJQlJBUklFUwotIEB2ZXJiYXRpbV9leHRy
YV9kZXBlbmRlbmN5QAotIAotICMKLWRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1
cmUuYWMKLWluZGV4IDAzNzVkMjkuLjEzNGNmMzggMTAwNjQ0Ci0tLS0gYS9jb25maWd1cmUuYWMK
LSsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTEyMyw4ICsxMjMsOCBAQCBBU19DQVNFKFskbGliZGly
XSwKLSApCi0gQUNfU1VCU1QoW3VzcmxpYl9leGVjZGlyXSkKLSAKLS11c3JzZWN1cmVsaWJfZXhl
Y2Rpcj0nJHt1c3JsaWJfZXhlY2Rpcn0vc2VjdXJpdHknCi0tQUNfU1VCU1QoW3VzcnNlY3VyZWxp
Yl9leGVjZGlyXSkKLStzZWN1cmVsaWJfZXhlY2Rpcj0nJHtsaWJkaXJ9L3NlY3VyaXR5JwotK0FD
X1NVQlNUKFtzZWN1cmVsaWJfZXhlY2Rpcl0pCi0gCi0gIyBzdGF0aWMgY29uZmlndXJhdGlvbiBt
YWludGFuZWQgYnkgcGFja2FnZXMgKGUuZy4gL3Vzci9saWIpCi0gQUNfQVJHX1ZBUihbU1lTQ09O
RlNUQVRJQ0RJUl0sCi1AQCAtMjc2Nyw3ICsyNzY3LDcgQEAgdmVyYmF0aW1fZXh0cmFfZGVwZW5k
ZW5jeT0nCi0gIyBvdGhlcndpc2UgdGhlIGxpYnRvb2wgcmVsaW5rIHN0ZXAgd2lsbCBmYWlsIHRv
IGZpbmQgbGlibW91bnQubGEgYW5kCi0gIyB3aWxsIHRyeSAtbG1vdW50IHdoaWNoIGlzIHBvc3Np
Ymx5IG5vdCBhdmFpbGFibGUuCi0gaW5zdGFsbC1weWxpYm1vdW50ZXhlY0xUTElCUkFSSUVTOiBp
bnN0YWxsLXVzcmxpYl9leGVjTFRMSUJSQVJJRVMKLS1pbnN0YWxsLXVzcnNlY3VyZWxpYl9leGVj
TFRMSUJSQVJJRVM6IGluc3RhbGwtdXNybGliX2V4ZWNMVExJQlJBUklFUwotK2luc3RhbGwtc2Vj
dXJlbGliX2V4ZWNMVExJQlJBUklFUzogaW5zdGFsbC11c3JsaWJfZXhlY0xUTElCUkFSSUVTCi0g
Ci0gJwotIEFDX1NVQlNUKFt2ZXJiYXRpbV9leHRyYV9kZXBlbmRlbmN5XSkKLWRpZmYgLS1naXQg
YS9wYW1fbGFzdGxvZzIvc3JjL01ha2Vtb2R1bGUuYW0gYi9wYW1fbGFzdGxvZzIvc3JjL01ha2Vt
b2R1bGUuYW0KLWluZGV4IDZkMjM2NTMuLmEyYmVjYWMgMTAwNjQ0Ci0tLS0gYS9wYW1fbGFzdGxv
ZzIvc3JjL01ha2Vtb2R1bGUuYW0KLSsrKyBiL3BhbV9sYXN0bG9nMi9zcmMvTWFrZW1vZHVsZS5h
bQotQEAgLTEsNCArMSw0IEBACi0tdXNyc2VjdXJlbGliX2V4ZWNfTFRMSUJSQVJJRVMgKz0gcGFt
X2xhc3Rsb2cyLmxhCi0rc2VjdXJlbGliX2V4ZWNfTFRMSUJSQVJJRVMgKz0gcGFtX2xhc3Rsb2cy
LmxhCi0gCi0gcGFtX2xhc3Rsb2cyX2xhX1NPVVJDRVMgPSBcCi0gCXBhbV9sYXN0bG9nMi9zcmMv
cGFtX2xhc3Rsb2cyLmMKLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDA1LWNmZGlzay1hZGQtc2VjdG9yLXNpemUtY29t
bWFuYW5kLWxpbmUtb3B0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4LzAwMDUtY2ZkaXNrLWFkZC1zZWN0b3Itc2l6ZS1jb21tYW5hbmQtbGluZS1vcHRp
b24ucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZDVlNDdhOTFm
NQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC8wMDA1LWNmZGlzay1hZGQtc2VjdG9yLXNpemUtY29tbWFuYW5kLWxpbmUtb3B0aW9uLnBh
dGNoCkBAIC0wLDAgKzEsODMgQEAKK0Zyb20gODY4ZmVjZjgwY2I1MDY4MzMzNWM3NTNmYzg1MzUw
NjE3MmY0MWIxZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IEthcmVsIFphayA8a3ph
a0ByZWRoYXQuY29tPgorRGF0ZTogTW9uLCAxNCBPY3QgMjAyNCAxNTo0ODo0NiArMDIwMAorU3Vi
amVjdDogW1BBVENIXSBjZmRpc2s6IGFkZCAtLXNlY3Rvci1zaXplIGNvbW1hbmFuZCBsaW5lIG9w
dGlvbgorCisqIGltcHJvdmVzIGNvbXBhdGliaWxpdHkgd2l0aCBmZGlzaworKiBhZGQgYWJpbGl0
eSB0byB3b3JrIHdpdGggZGlzayBpbWFnZXMgd2hlcmUgbGliZmRpc2sgZGVmYXVsdHMgdG8gNTEy
CisKK1NpZ25lZC1vZmYtYnk6IEthcmVsIFphayA8a3pha0ByZWRoYXQuY29tPgorLS0tCisgZGlz
ay11dGlscy9jZmRpc2suOC5hZG9jIHwgIDMgKysrCisgZGlzay11dGlscy9jZmRpc2suYyAgICAg
IHwgMTUgKysrKysrKysrKysrKystCisgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9kaXNrLXV0aWxzL2NmZGlzay44LmFkb2Mg
Yi9kaXNrLXV0aWxzL2NmZGlzay44LmFkb2MKK2luZGV4IDk3ZmFkNjIuLjc1OWYzOWYgMTAwNjQ0
CistLS0gYS9kaXNrLXV0aWxzL2NmZGlzay44LmFkb2MKKysrKyBiL2Rpc2stdXRpbHMvY2ZkaXNr
LjguYWRvYworQEAgLTU1LDYgKzU1LDkgQEAgVXNlIGV4Y2x1c2l2ZSBCU0QgbG9jayBmb3IgZGV2
aWNlIG9yIGZpbGUgaXQgb3BlcmF0ZXMuIFRoZSBvcHRpb25hbCBhcmd1bWVudCBfbW8KKyAqLXIq
LCAqLS1yZWFkLW9ubHkqOjoKKyBGb3JjZWQgb3BlbiBpbiByZWFkLW9ubHkgbW9kZS4KKyAKKysq
LWIqLCAqLS1zZWN0b3Itc2l6ZSogX3NlY3RvcnNpemVfOjoKKytTcGVjaWZ5IHRoZSBzZWN0b3Ig
c2l6ZSBvZiB0aGUgZGlzay4gVmFsaWQgdmFsdWVzIGFyZSA1MTIsIDEwMjQsIDIwNDgsIGFuZCA0
MDk2LiBUaGUga2VybmVsIGlzIGF3YXJlIG9mIHRoZSBzZWN0b3Igc2l6ZSBmb3IgcmVndWxhciBi
bG9jayBkZXZpY2VzLiBVc2UgdGhpcyBvcHRpb24gb25seSBvbiB2ZXJ5IG9sZCBrZXJuZWxzLCB3
aGVuIHdvcmtpbmcgd2l0aCBkaXNrIGltYWdlcywgb3IgdG8gb3ZlcnJpZGUgdGhlIGtlcm5lbCdz
IGRlZmF1bHQgc2VjdG9yIHNpemUuIFNpbmNlIHV0aWwtbGludXgtMi4xNywgKmZkaXNrKiBkaXN0
aW5ndWlzaGVzIGJldHdlZW4gbG9naWNhbCBhbmQgcGh5c2ljYWwgc2VjdG9yIHNpemUuIFRoaXMg
b3B0aW9uIGNoYW5nZXMgYm90aCBzZWN0b3Igc2l6ZXMgdG8gdGhlIHNwZWNpZmllZCBfc2VjdG9y
c2l6ZV8uCisrCisgKi16KiwgKi0temVybyo6OgorIFN0YXJ0IHdpdGggYW4gaW4tbWVtb3J5IHpl
cm9lZCBwYXJ0aXRpb24gdGFibGUuIFRoaXMgb3B0aW9uIGRvZXMgbm90IHplcm8gdGhlIHBhcnRp
dGlvbiB0YWJsZSBvbiB0aGUgZGlzazsgcmF0aGVyLCBpdCBzaW1wbHkgc3RhcnRzIHRoZSBwcm9n
cmFtIHdpdGhvdXQgcmVhZGluZyB0aGUgZXhpc3RpbmcgcGFydGl0aW9uIHRhYmxlLiBUaGlzIG9w
dGlvbiBhbGxvd3MgeW91IHRvIGNyZWF0ZSBhIG5ldyBwYXJ0aXRpb24gdGFibGUgZnJvbSBzY3Jh
dGNoIG9yIGZyb20gYW4gKnNmZGlzayooOCktY29tcGF0aWJsZSBzY3JpcHQuCisgCitkaWZmIC0t
Z2l0IGEvZGlzay11dGlscy9jZmRpc2suYyBiL2Rpc2stdXRpbHMvY2ZkaXNrLmMKK2luZGV4IDE4
M2I3NjcuLmYzN2UyZDcgMTAwNjQ0CistLS0gYS9kaXNrLXV0aWxzL2NmZGlzay5jCisrKysgYi9k
aXNrLXV0aWxzL2NmZGlzay5jCitAQCAtMjczOSw2ICsyNzM5LDggQEAgc3RhdGljIHZvaWQgX19h
dHRyaWJ1dGVfXygoX19ub3JldHVybl9fKSkgdXNhZ2Uodm9pZCkKKyAJICAgICAgXygiICAgICAt
LWxvY2tbPTxtb2RlPl0gICAgICB1c2UgZXhjbHVzaXZlIGRldmljZSBsb2NrICglcywgJXMgb3Ig
JXMpXG4iKSwgInllcyIsICJubyIsICJub25ibG9jayIpOworIAlmcHV0cyhfKCIgLXIsIC0tcmVh
ZC1vbmx5ICAgICAgICAgIGZvcmNlZCBvcGVuIGNmZGlzayBpbiByZWFkLW9ubHkgbW9kZVxuIiks
IG91dCk7CisgCisrCWZwdXRzKF8oIiAtYiwgLS1zZWN0b3Itc2l6ZSA8c2l6ZT4gcGh5c2ljYWwg
YW5kIGxvZ2ljYWwgc2VjdG9yIHNpemVcbiIpLCBvdXQpOworKworIAlmcHV0cyhVU0FHRV9TRVBB
UkFUT1IsIG91dCk7CisgCWZwcmludGYob3V0LCBVU0FHRV9IRUxQX09QVElPTlMoMjYpKTsKKyAK
K0BAIC0yNzUxLDYgKzI3NTMsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQor
IAljb25zdCBjaGFyICpkaXNrcGF0aCA9IE5VTEwsICpsb2NrbW9kZSA9IE5VTEw7CisgCWludCBy
YywgYywgY29sb3Jtb2RlID0gVUxfQ09MT1JNT0RFX1VOREVGOworIAlpbnQgcmVhZF9vbmx5ID0g
MDsKKysJc2l6ZV90IHVzZXJfc3MgPSAwOworIAlzdHJ1Y3QgY2ZkaXNrIF9jZiA9IHsgLmxpbmVz
X2lkeCA9IDAgfSwKKyAJCSAgICAgICpjZiA9ICZfY2Y7CisgCWVudW0geworQEAgLTI3NjAsNiAr
Mjc2Myw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCisgCQl7ICJjb2xvciIs
ICAgb3B0aW9uYWxfYXJndW1lbnQsIE5VTEwsICdMJyB9LAorIAkJeyAibG9jayIsICAgIG9wdGlv
bmFsX2FyZ3VtZW50LCBOVUxMLCBPUFRfTE9DSyB9LAorIAkJeyAiaGVscCIsICAgIG5vX2FyZ3Vt
ZW50LCAgICAgICBOVUxMLCAnaCcgfSwKKysJCXsgInNlY3Rvci1zaXplIiwgcmVxdWlyZWRfYXJn
dW1lbnQsIE5VTEwsICdiJyB9LAorIAkJeyAidmVyc2lvbiIsIG5vX2FyZ3VtZW50LCAgICAgICBO
VUxMLCAnVicgfSwKKyAJCXsgInplcm8iLCAgICBub19hcmd1bWVudCwJTlVMTCwgJ3onIH0sCisg
CQl7ICJyZWFkLW9ubHkiLCBub19hcmd1bWVudCwgICAgIE5VTEwsICdyJyB9LAorQEAgLTI3NzEs
OCArMjc3NSwxNSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQorIAl0ZXh0ZG9t
YWluKFBBQ0tBR0UpOworIAljbG9zZV9zdGRvdXRfYXRleGl0KCk7CisgCistCXdoaWxlKChjID0g
Z2V0b3B0X2xvbmcoYXJnYywgYXJndiwgIkw6OmhWenIiLCBsb25nb3B0cywgTlVMTCkpICE9IC0x
KSB7CisrCXdoaWxlKChjID0gZ2V0b3B0X2xvbmcoYXJnYywgYXJndiwgImI6TDo6aFZ6ciIsIGxv
bmdvcHRzLCBOVUxMKSkgIT0gLTEpIHsKKyAJCXN3aXRjaChjKSB7CisrCQljYXNlICdiJzoKKysJ
CQl1c2VyX3NzID0gc3RydG91MzJfb3JfZXJyKG9wdGFyZywKKysJCQkJCV8oImludmFsaWQgc2Vj
dG9yIHNpemUgYXJndW1lbnQiKSk7CisrCQkJaWYgKHVzZXJfc3MgIT0gNTEyICYmIHVzZXJfc3Mg
IT0gMTAyNCAmJgorKwkJCSAgICB1c2VyX3NzICE9IDIwNDggJiYgdXNlcl9zcyAhPSA0MDk2KQor
KwkJCQllcnJ4KEVYSVRfRkFJTFVSRSwgXygiaW52YWxpZCBzZWN0b3Igc2l6ZSBhcmd1bWVudCIp
KTsKKysJCQlicmVhazsKKyAJCWNhc2UgJ2gnOgorIAkJCXVzYWdlKCk7CisgCQkJYnJlYWs7CitA
QCAtMjgxMSw2ICsyODIyLDggQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKKyAJ
Y2YtPmN4dCA9IGZkaXNrX25ld19jb250ZXh0KCk7CisgCWlmICghY2YtPmN4dCkKKyAJCWVycihF
WElUX0ZBSUxVUkUsIF8oImZhaWxlZCB0byBhbGxvY2F0ZSBsaWJmZGlzayBjb250ZXh0IikpOwor
KwlpZiAodXNlcl9zcykKKysJCWZkaXNrX3NhdmVfdXNlcl9zZWN0b3Jfc2l6ZShjZi0+Y3h0LCB1
c2VyX3NzLCB1c2VyX3NzKTsKKyAKKyAJZmRpc2tfc2V0X2FzayhjZi0+Y3h0LCBhc2tfY2FsbGJh
Y2ssICh2b2lkICopIGNmKTsKKyAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBl
cy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaApp
bmRleCA4ZWEwMGRiYjk1Li44YTc0MTVlMzlhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS91dGlsLWxpbnV4L3V0aWwtbGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2F2b2lkX3BhcmFsbGVsX3Rl
c3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkYTU4YjQxNTBmNjkzMmRlMzZjOTYyZWE2
NTc3MTNiY2Y0ZWE0NGJlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4MzU5ZmRlMmZl
MjBkZGVhMzlkMzM0MjEwNTk1OWQ3N2U3Nzk1Y2ViIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogVHVkb3IgRmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBEYXRlOiBNb24sIDE0
IEp1biAyMDIxIDE0OjAwOjMxICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHV0aWwtbGludXg6IEFk
ZCBwdGVzdApAQCAtMTQsNyArMTQsNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUK
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggNjUxZWYyYi4uMmE4MDEy
ZSAxMDA2NDQKK2luZGV4IGY4NDllOWUuLmMzYWRjNTAgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUu
YWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTExLDcgKzExLDcgQEAgQUNfQ09ORklHX01BQ1JP
X0RJUihbbTRdKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGls
LWxpbnV4L2NvbmZpZ3VyZS1zYmluZGlyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4L2NvbmZpZ3VyZS1zYmluZGlyLnBhdGNoCmluZGV4IDc0YWJkYzIwMzgu
LmNhYzQzODgyMGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRp
bC1saW51eC9jb25maWd1cmUtc2JpbmRpci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91
dGlsLWxpbnV4L3V0aWwtbGludXgvY29uZmlndXJlLXNiaW5kaXIucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDAzODdkNzE1MTZjOTc4ODk5Y2ZkNTU2Y2E1MTJmNTMwYTIxMmI0YTkgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDgwMmUzOTYzOWQyMWQxMzllMTA5NjNjMmM4ZDVkY2Y2
NjkwMjUzMTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQaGlsIEJsdW5kZWxsIDxw
YkBwYmNsLm5ldD4KIERhdGU6IE1vbiwgMjQgU2VwIDIwMTIgMDc6MjQ6NTEgKzAxMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gdXRpbC1saW51eDogRW5zdXJlIHRoYXQgJHtzYmluZGlyfSBpcyByZXNwZWN0
ZWQKQEAgLTE0LDcgKzE0LDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtjb25m
aWd1cmF0aW9uXQogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggMjM1
OTRmZi4uNjUxZWYyYiAxMDA2NDQKK2luZGV4IDA3MzY5YTUuLmY4NDllOWUgMTAwNjQ0CiAtLS0g
YS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTExMCw3ICsxMTAsMTAgQEAg
QUNfU1VCU1QoW3J1bnN0YXRlZGlyXSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0
aWwtbGludXgvdXRpbC1saW51eC9kaXNwbGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5hbWVf
Zm9yX3N1YnRlc3QucGF0Y2gKaW5kZXggODcxYjBiMmQzMC4uMzAyMzlkNDI2OSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5h
bWVfZm9yX3N1YnRlc3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5hbWVfZm9yX3N1YnRlc3QucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDQ1NDUwZDAzMzljZDdlZTI3ZjUzYzBmMmZhYzFjYzc0ZWQ5YmJmYjggTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGYwNzUxOWI0MjdjNmZjMjEwMWI3Yzk4NzA5OThjZjdl
ZjIxN2FhMWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRvciBGbG9yZWEgPHR1
ZG9yLmZsb3JlYUBlbmVhLmNvbT4KIERhdGU6IFRodSwgMyBEZWMgMjAxNSAwNDowODowMCArMDEw
MAogU3ViamVjdDogW1BBVENIXSBEaXNwbGF5IHRlc3RuYW1lIGZvciBzdWJ0ZXN0CmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvbGliZmRpc2stY2Zk
aXNrLWFuZC1zZmRpc2stc2VjdG9yLXNpemUtaW1wcm92ZW1lbnRzLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2xpYmZkaXNrLWNmZGlzay1hbmQtc2ZkaXNr
LXNlY3Rvci1zaXplLWltcHJvdmVtZW50cy5wYXRjaAppbmRleCAzNTYxOTRhOGJhLi4xNWZlYTE1
MDVhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgv
bGliZmRpc2stY2ZkaXNrLWFuZC1zZmRpc2stc2VjdG9yLXNpemUtaW1wcm92ZW1lbnRzLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9saWJmZGlzay1j
ZmRpc2stYW5kLXNmZGlzay1zZWN0b3Itc2l6ZS1pbXByb3ZlbWVudHMucGF0Y2gKQEAgLTEsMTYx
ICsxLDcgQEAKLUZyb20gN2FkYTY1NDdmY2QxZjY0OWZhZGFhODAyMWZmMjFlM2UwZjQzMTQ1OSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEthcmVsIFphayA8a3pha0ByZWRoYXQuY29t
PgotRGF0ZTogTW9uLCAxNCBPY3QgMjAyNCAxMTo0NTozMiArMDIwMAotU3ViamVjdDogW1BBVENI
IDEvNF0gbGliZmRpc2s6IG1ha2Ugc3VyZSBsaWJibGtpZCB1c2VzIHRoZSBzYW1lIHNlY3RvciBz
aXplCi0KLUxpYmZkaXNrIHVzZXMgbGliYmxraWQgdG8gY2hlY2sgZm9yIGZpbGVzeXN0ZW1zIG9u
IHRoZSBkZXZpY2UuIEl0Ci1tYWtlcyBzZW5zZSBmb3IgYm90aCBsaWJyYXJpZXMgdG8gc2hhcmUg
dGhlIGxvZ2ljYWwgc2VjdG9yIHNpemUKLXNldHRpbmcsIGFzIHRoaXMgc2V0dGluZyBjYW4gYmUg
bW9kaWZpZWQgYnkgdXNpbmcgdGhlIGZkaXNrIGNvbW1hbmQKLWxpbmUuCi0KLVdlIGRvIG5vdCBz
ZWUgdGhpcyBhcyBhbiBpc3N1ZSwgYXMgZmlsZXN5c3RlbSBkZXRlY3Rpb24gcmFyZWx5IGRlcGVu
ZHMKLW9uIHNlY3RvciBzaXplICh3aXRoIHRoZSBleGNlcHRpb24gb2Ygc29tZSBSQUlEcykuIEFk
ZGl0aW9uYWxseSwKLWxpYmJsa2lkIGlzIHVzdWFsbHkgaW50ZWxsaWdlbnQgZW5vdWdoIHRvIGNo
ZWNrIG11bHRpcGxlIGxvY2F0aW9ucwotaW5kZXBlbmRlbnRseSBvZiB0aGUgY3VycmVudCBkZXZp
Y2UncyBzZWN0b3Igc2l6ZSBzZXR0aW5nLgotCi1BZGRyZXNzZXM6IGh0dHBzOi8vZ2l0aHViLmNv
bS91dGlsLWxpbnV4L3V0aWwtbGludXgvcHVsbC8zMjM1Ci0KLVVwc3RyZWFtLVN0YXR1czogU3Vi
bWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vdXRpbC1saW51eC91dGlsLWxpbnV4L3B1bGwvMzIz
N10KLQotU2lnbmVkLW9mZi1ieTogS2FyZWwgWmFrIDxremFrQHJlZGhhdC5jb20+Ci0tLS0KLSBs
aWJmZGlzay9zcmMvd2lwZS5jIHwgMyArKysKLSAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCi0KLWRpZmYgLS1naXQgYS9saWJmZGlzay9zcmMvd2lwZS5jIGIvbGliZmRpc2svc3JjL3dp
cGUuYwotaW5kZXggYmI1ZjFiYjM4YmYuLmYzODllZDQxOTRhIDEwMDY0NAotLS0tIGEvbGliZmRp
c2svc3JjL3dpcGUuYwotKysrIGIvbGliZmRpc2svc3JjL3dpcGUuYwotQEAgLTEzMyw2ICsxMzMs
NyBAQCBpbnQgZmRpc2tfZG9fd2lwZShzdHJ1Y3QgZmRpc2tfY29udGV4dCAqY3h0KQotIAkJCURC
RyhXSVBFLCB1bF9kZWJ1Z29iaih3cCwgImJsa2lkX3Byb2JlX3NldF9kZXZpY2UoKSBmYWlsZWQg
W3JjPSVkXSIsIHJjKSk7Ci0gCQkJcmV0dXJuIHJjOwotIAkJfQotKwkJYmxraWRfcHJvYmVfc2V0
X3NlY3RvcnNpemUocHIsIGN4dC0+c2VjdG9yX3NpemUpOwotIAotIAkJREJHKFdJUEUsIHVsX2Rl
YnVnb2JqKHdwLCAiIHdpcGluZy4uLiIpKTsKLSAJCWJsa2lkX3dpcGVfYWxsKHByKTsKLUBAIC0x
NzYsNiArMTc3LDggQEAgaW50IGZkaXNrX2NoZWNrX2NvbGxpc2lvbnMoc3RydWN0IGZkaXNrX2Nv
bnRleHQgKmN4dCkKLSAJZnJlZShjeHQtPmNvbGxpc2lvbik7Ci0gCWN4dC0+Y29sbGlzaW9uID0g
TlVMTDsKLSAKLSsJYmxraWRfcHJvYmVfc2V0X3NlY3RvcnNpemUocHIsIGN4dC0+c2VjdG9yX3Np
emUpOwotKwotIAlibGtpZF9wcm9iZV9lbmFibGVfc3VwZXJibG9ja3MocHIsIDEpOwotIAlibGtp
ZF9wcm9iZV9zZXRfc3VwZXJibG9ja3NfZmxhZ3MocHIsIEJMS0lEX1NVQkxLU19UWVBFIHwKLSAJ
CQkgICAgICAgICAgICAgICAgICAgICAgQkxLSURfU1VCTEtTX0JBRENTVU0pOwotCi1Gcm9tIDU0
ZjlhNzkzMDFkY2Y0OTJjYWI4ZTA3MTM0Zjk2YTkyMWQzNjdhYTAgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCi1Gcm9tOiBLYXJlbCBaYWsgPGt6YWtAcmVkaGF0LmNvbT4KLURhdGU6IE1vbiwgMTQg
T2N0IDIwMjQgMTU6NDc6MDMgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSCAyLzRdIGZkaXNrOiAobWFu
KSBpbXByb3ZlIC0tc2VjdG9yLXNpemUgZGVzY3JpcHRpb24KLQotU2lnbmVkLW9mZi1ieTogS2Fy
ZWwgWmFrIDxremFrQHJlZGhhdC5jb20+Ci0tLS0KLSBkaXNrLXV0aWxzL2ZkaXNrLjguYWRvYyB8
IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQot
ZGlmZiAtLWdpdCBhL2Rpc2stdXRpbHMvZmRpc2suOC5hZG9jIGIvZGlzay11dGlscy9mZGlzay44
LmFkb2MKLWluZGV4IGNiNzJiNGEzZWE1Li41OTQxYWEzNDk2OCAxMDA2NDQKLS0tLSBhL2Rpc2st
dXRpbHMvZmRpc2suOC5hZG9jCi0rKysgYi9kaXNrLXV0aWxzL2ZkaXNrLjguYWRvYwotQEAgLTQw
LDcgKzQwLDcgQEAgTm90ZSB0aGF0ICpwYXJ0eCooOCkgcHJvdmlkZXMgYSByaWNoIGludGVyZmFj
ZSBmb3Igc2NyaXB0cyB0byBwcmludCBkaXNrIGxheW91dHMKLSA9PSBPUFRJT05TCi0gCi0gKi1i
KiwgKi0tc2VjdG9yLXNpemUqIF9zZWN0b3JzaXplXzo6Ci0tU3BlY2lmeSB0aGUgc2VjdG9yIHNp
emUgb2YgdGhlIGRpc2suIFZhbGlkIHZhbHVlcyBhcmUgNTEyLCAxMDI0LCAyMDQ4LCBhbmQgNDA5
Ni4gKFJlY2VudCBrZXJuZWxzIGtub3cgdGhlIHNlY3RvciBzaXplLiBVc2UgdGhpcyBvcHRpb24g
b25seSBvbiBvbGQga2VybmVscyBvciB0byBvdmVycmlkZSB0aGUga2VybmVsJ3MgaWRlYXMuKSBT
aW5jZSB1dGlsLWxpbnV4LTIuMTcsICpmZGlzayogZGlmZmVyZW50aWF0ZXMgYmV0d2VlbiBsb2dp
Y2FsIGFuZCBwaHlzaWNhbCBzZWN0b3Igc2l6ZS4gVGhpcyBvcHRpb24gY2hhbmdlcyBib3RoIHNl
Y3RvciBzaXplcyB0byBfc2VjdG9yc2l6ZV8uCi0rU3BlY2lmeSB0aGUgc2VjdG9yIHNpemUgb2Yg
dGhlIGRpc2suIFZhbGlkIHZhbHVlcyBhcmUgNTEyLCAxMDI0LCAyMDQ4LCBhbmQgNDA5Ni4gVGhl
IGtlcm5lbCBpcyBhd2FyZSBvZiB0aGUgc2VjdG9yIHNpemUgZm9yIHJlZ3VsYXIgYmxvY2sgZGV2
aWNlcy4gVXNlIHRoaXMgb3B0aW9uIG9ubHkgb24gdmVyeSBvbGQga2VybmVscywgd2hlbiB3b3Jr
aW5nIHdpdGggZGlzayBpbWFnZXMsIG9yIHRvIG92ZXJyaWRlIHRoZSBrZXJuZWwncyBkZWZhdWx0
IHNlY3RvciBzaXplLiBTaW5jZSB1dGlsLWxpbnV4LTIuMTcsICpmZGlzayogZGlzdGluZ3Vpc2hl
cyBiZXR3ZWVuIGxvZ2ljYWwgYW5kIHBoeXNpY2FsIHNlY3RvciBzaXplLiBUaGlzIG9wdGlvbiBj
aGFuZ2VzIGJvdGggc2VjdG9yIHNpemVzIHRvIHRoZSBzcGVjaWZpZWQgX3NlY3RvcnNpemVfLgot
IAotICotQiosICotLXByb3RlY3QtYm9vdCo6OgotIERvbid0IGVyYXNlIHRoZSBiZWdpbm5pbmcg
b2YgdGhlIGZpcnN0IGRpc2sgc2VjdG9yIHdoZW4gY3JlYXRpbmcgYSBuZXcgZGlzayBsYWJlbC4g
VGhpcyBmZWF0dXJlIGlzIHN1cHBvcnRlZCBmb3IgR1BUIGFuZCBNQlIuCi0KLUZyb20gZmQzOGVl
MjI3NGY3YTMwMzkzZDM4MzlkZmNlNTU2MjYwMzU1YzNmYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKLUZyb206IEthcmVsIFphayA8a3pha0ByZWRoYXQuY29tPgotRGF0ZTogTW9uLCAxNCBPY3Qg
MjAyNCAxNTo0ODo0NiArMDIwMAotU3ViamVjdDogW1BBVENIIDMvNF0gY2ZkaXNrOiBhZGQgLS1z
ZWN0b3Itc2l6ZSBjb21tYW5hbmQgbGluZSBvcHRpb24KLQotKiBpbXByb3ZlcyBjb21wYXRpYmls
aXR5IHdpdGggZmRpc2sKLSogYWRkIGFiaWxpdHkgdG8gd29yayB3aXRoIGRpc2sgaW1hZ2VzIHdo
ZXJlIGxpYmZkaXNrIGRlZmF1bHRzIHRvIDUxMgotCi1TaWduZWQtb2ZmLWJ5OiBLYXJlbCBaYWsg
PGt6YWtAcmVkaGF0LmNvbT4KLS0tLQotIGRpc2stdXRpbHMvY2ZkaXNrLjguYWRvYyB8ICAzICsr
KwotIGRpc2stdXRpbHMvY2ZkaXNrLmMgICAgICB8IDE1ICsrKysrKysrKysrKysrLQotIDIgZmls
ZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0
IGEvZGlzay11dGlscy9jZmRpc2suOC5hZG9jIGIvZGlzay11dGlscy9jZmRpc2suOC5hZG9jCi1p
bmRleCA5N2ZhZDYyMWQxMi4uNzU5ZjM5ZjBlMWEgMTAwNjQ0Ci0tLS0gYS9kaXNrLXV0aWxzL2Nm
ZGlzay44LmFkb2MKLSsrKyBiL2Rpc2stdXRpbHMvY2ZkaXNrLjguYWRvYwotQEAgLTU1LDYgKzU1
LDkgQEAgVXNlIGV4Y2x1c2l2ZSBCU0QgbG9jayBmb3IgZGV2aWNlIG9yIGZpbGUgaXQgb3BlcmF0
ZXMuIFRoZSBvcHRpb25hbCBhcmd1bWVudCBfbW8KLSAqLXIqLCAqLS1yZWFkLW9ubHkqOjoKLSBG
b3JjZWQgb3BlbiBpbiByZWFkLW9ubHkgbW9kZS4KLSAKLSsqLWIqLCAqLS1zZWN0b3Itc2l6ZSog
X3NlY3RvcnNpemVfOjoKLStTcGVjaWZ5IHRoZSBzZWN0b3Igc2l6ZSBvZiB0aGUgZGlzay4gVmFs
aWQgdmFsdWVzIGFyZSA1MTIsIDEwMjQsIDIwNDgsIGFuZCA0MDk2LiBUaGUga2VybmVsIGlzIGF3
YXJlIG9mIHRoZSBzZWN0b3Igc2l6ZSBmb3IgcmVndWxhciBibG9jayBkZXZpY2VzLiBVc2UgdGhp
cyBvcHRpb24gb25seSBvbiB2ZXJ5IG9sZCBrZXJuZWxzLCB3aGVuIHdvcmtpbmcgd2l0aCBkaXNr
IGltYWdlcywgb3IgdG8gb3ZlcnJpZGUgdGhlIGtlcm5lbCdzIGRlZmF1bHQgc2VjdG9yIHNpemUu
IFNpbmNlIHV0aWwtbGludXgtMi4xNywgKmZkaXNrKiBkaXN0aW5ndWlzaGVzIGJldHdlZW4gbG9n
aWNhbCBhbmQgcGh5c2ljYWwgc2VjdG9yIHNpemUuIFRoaXMgb3B0aW9uIGNoYW5nZXMgYm90aCBz
ZWN0b3Igc2l6ZXMgdG8gdGhlIHNwZWNpZmllZCBfc2VjdG9yc2l6ZV8uCi0rCi0gKi16KiwgKi0t
emVybyo6OgotIFN0YXJ0IHdpdGggYW4gaW4tbWVtb3J5IHplcm9lZCBwYXJ0aXRpb24gdGFibGUu
IFRoaXMgb3B0aW9uIGRvZXMgbm90IHplcm8gdGhlIHBhcnRpdGlvbiB0YWJsZSBvbiB0aGUgZGlz
azsgcmF0aGVyLCBpdCBzaW1wbHkgc3RhcnRzIHRoZSBwcm9ncmFtIHdpdGhvdXQgcmVhZGluZyB0
aGUgZXhpc3RpbmcgcGFydGl0aW9uIHRhYmxlLiBUaGlzIG9wdGlvbiBhbGxvd3MgeW91IHRvIGNy
ZWF0ZSBhIG5ldyBwYXJ0aXRpb24gdGFibGUgZnJvbSBzY3JhdGNoIG9yIGZyb20gYW4gKnNmZGlz
ayooOCktY29tcGF0aWJsZSBzY3JpcHQuCi0gCi1kaWZmIC0tZ2l0IGEvZGlzay11dGlscy9jZmRp
c2suYyBiL2Rpc2stdXRpbHMvY2ZkaXNrLmMKLWluZGV4IDJlMGFhZGE0NzRhLi5iYzFjODdkODNl
NCAxMDA2NDQKLS0tLSBhL2Rpc2stdXRpbHMvY2ZkaXNrLmMKLSsrKyBiL2Rpc2stdXRpbHMvY2Zk
aXNrLmMKLUBAIC0yNzMxLDYgKzI3MzEsOCBAQCBzdGF0aWMgdm9pZCBfX2F0dHJpYnV0ZV9fKChf
X25vcmV0dXJuX18pKSB1c2FnZSh2b2lkKQotIAkgICAgICBfKCIgICAgIC0tbG9ja1s9PG1vZGU+
XSAgICAgIHVzZSBleGNsdXNpdmUgZGV2aWNlIGxvY2sgKCVzLCAlcyBvciAlcylcbiIpLCAieWVz
IiwgIm5vIiwgIm5vbmJsb2NrIik7Ci0gCWZwdXRzKF8oIiAtciwgLS1yZWFkLW9ubHkgICAgICAg
ICAgZm9yY2VkIG9wZW4gY2ZkaXNrIGluIHJlYWQtb25seSBtb2RlXG4iKSwgb3V0KTsKLSAKLSsJ
ZnB1dHMoXygiIC1iLCAtLXNlY3Rvci1zaXplIDxzaXplPiBwaHlzaWNhbCBhbmQgbG9naWNhbCBz
ZWN0b3Igc2l6ZVxuIiksIG91dCk7Ci0rCi0gCWZwdXRzKFVTQUdFX1NFUEFSQVRPUiwgb3V0KTsK
LSAJZnByaW50ZihvdXQsIFVTQUdFX0hFTFBfT1BUSU9OUygyNikpOwotIAotQEAgLTI3NDMsNiAr
Mjc0NSw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCi0gCWNvbnN0IGNoYXIg
KmRpc2twYXRoID0gTlVMTCwgKmxvY2ttb2RlID0gTlVMTDsKLSAJaW50IHJjLCBjLCBjb2xvcm1v
ZGUgPSBVTF9DT0xPUk1PREVfVU5ERUY7Ci0gCWludCByZWFkX29ubHkgPSAwOwotKwlzaXplX3Qg
dXNlcl9zcyA9IDA7Ci0gCXN0cnVjdCBjZmRpc2sgX2NmID0geyAubGluZXNfaWR4ID0gMCB9LAot
IAkJICAgICAgKmNmID0gJl9jZjsKLSAJZW51bSB7Ci1AQCAtMjc1Miw2ICsyNzU1LDcgQEAgaW50
IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKLSAJCXsgImNvbG9yIiwgICBvcHRpb25hbF9h
cmd1bWVudCwgTlVMTCwgJ0wnIH0sCi0gCQl7ICJsb2NrIiwgICAgb3B0aW9uYWxfYXJndW1lbnQs
IE5VTEwsIE9QVF9MT0NLIH0sCi0gCQl7ICJoZWxwIiwgICAgbm9fYXJndW1lbnQsICAgICAgIE5V
TEwsICdoJyB9LAotKwkJeyAic2VjdG9yLXNpemUiLCByZXF1aXJlZF9hcmd1bWVudCwgTlVMTCwg
J2InIH0sCi0gCQl7ICJ2ZXJzaW9uIiwgbm9fYXJndW1lbnQsICAgICAgIE5VTEwsICdWJyB9LAot
IAkJeyAiemVybyIsICAgIG5vX2FyZ3VtZW50LAlOVUxMLCAneicgfSwKLSAJCXsgInJlYWQtb25s
eSIsIG5vX2FyZ3VtZW50LCAgICAgTlVMTCwgJ3InIH0sCi1AQCAtMjc2Myw4ICsyNzY3LDE1IEBA
IGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCi0gCXRleHRkb21haW4oUEFDS0FHRSk7
Ci0gCWNsb3NlX3N0ZG91dF9hdGV4aXQoKTsKLSAKLS0Jd2hpbGUoKGMgPSBnZXRvcHRfbG9uZyhh
cmdjLCBhcmd2LCAiTDo6aFZ6ciIsIGxvbmdvcHRzLCBOVUxMKSkgIT0gLTEpIHsKLSsJd2hpbGUo
KGMgPSBnZXRvcHRfbG9uZyhhcmdjLCBhcmd2LCAiYjpMOjpoVnpyIiwgbG9uZ29wdHMsIE5VTEwp
KSAhPSAtMSkgewotIAkJc3dpdGNoKGMpIHsKLSsJCWNhc2UgJ2InOgotKwkJCXVzZXJfc3MgPSBz
dHJ0b3UzMl9vcl9lcnIob3B0YXJnLAotKwkJCQkJXygiaW52YWxpZCBzZWN0b3Igc2l6ZSBhcmd1
bWVudCIpKTsKLSsJCQlpZiAodXNlcl9zcyAhPSA1MTIgJiYgdXNlcl9zcyAhPSAxMDI0ICYmCi0r
CQkJICAgIHVzZXJfc3MgIT0gMjA0OCAmJiB1c2VyX3NzICE9IDQwOTYpCi0rCQkJCWVycngoRVhJ
VF9GQUlMVVJFLCBfKCJpbnZhbGlkIHNlY3RvciBzaXplIGFyZ3VtZW50IikpOwotKwkJCWJyZWFr
OwotIAkJY2FzZSAnaCc6Ci0gCQkJdXNhZ2UoKTsKLSAJCQlicmVhazsKLUBAIC0yODAzLDYgKzI4
MTQsOCBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQotIAljZi0+Y3h0ID0gZmRp
c2tfbmV3X2NvbnRleHQoKTsKLSAJaWYgKCFjZi0+Y3h0KQotIAkJZXJyKEVYSVRfRkFJTFVSRSwg
XygiZmFpbGVkIHRvIGFsbG9jYXRlIGxpYmZkaXNrIGNvbnRleHQiKSk7Ci0rCWlmICh1c2VyX3Nz
KQotKwkJZmRpc2tfc2F2ZV91c2VyX3NlY3Rvcl9zaXplKGNmLT5jeHQsIHVzZXJfc3MsIHVzZXJf
c3MpOwotIAotIAlmZGlza19zZXRfYXNrKGNmLT5jeHQsIGFza19jYWxsYmFjaywgKHZvaWQgKikg
Y2YpOwotIAotCi1Gcm9tIGVmN2I3NmJhYTE3ZGRiNTQxNDY5MWZhOGY0OWQ2MTQxNWMzMDg3MWMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJmMmJjMWM2YmU5NDc2Y2RmYzc2NTlmZDMz
MDZlNmI5YzQ1ZGJmOGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLYXJlbCBaYWsg
PGt6YWtAcmVkaGF0LmNvbT4KIERhdGU6IE1vbiwgMTQgT2N0IDIwMjQgMTU6NTA6NDAgKzAyMDAK
LVN1YmplY3Q6IFtQQVRDSCA0LzRdIHNmZGlzazogYWRkIC0tc2VjdG9yLXNpemUgY29tbWFuYW5k
IGxpbmUgb3B0aW9uCitTdWJqZWN0OiBbUEFUQ0hdIHNmZGlzazogYWRkIC0tc2VjdG9yLXNpemUg
Y29tbWFuYW5kIGxpbmUgb3B0aW9uCiAKICogaW1wcm92ZXMgY29tcGF0aWJpbGl0eSB3aXRoIGZk
aXNrCiAqIGFkZCBhYmlsaXR5IHRvIHdvcmsgd2l0aCBkaXNrIGltYWdlcyB3aGVyZSBsaWJmZGlz
ayBkZWZhdWx0cyB0byA1MTIKQEAgLTE2OCwxMCArMTQsMTAgQEAgU2lnbmVkLW9mZi1ieTogS2Fy
ZWwgWmFrIDxremFrQHJlZGhhdC5jb20+CiAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9kaXNrLXV0aWxzL3NmZGlzay44LmFk
b2MgYi9kaXNrLXV0aWxzL3NmZGlzay44LmFkb2MKLWluZGV4IDI2Y2NhZDVhM2IyLi5jZTllOTdi
NzY4MiAxMDA2NDQKK2luZGV4IGJjM2ZmOWIuLmQxZWFhMzcgMTAwNjQ0CiAtLS0gYS9kaXNrLXV0
aWxzL3NmZGlzay44LmFkb2MKICsrKyBiL2Rpc2stdXRpbHMvc2ZkaXNrLjguYWRvYwotQEAgLTIw
OCw2ICsyMDgsOSBAQCBUaGUgZGVmYXVsdCBsaXN0IG9mIGNvbHVtbnMgbWF5IGJlIGV4dGVuZGVk
IGlmIF9saXN0XyBpcyBzcGVjaWZpZWQgaW4gdGhlIGZvcm1hdAorQEAgLTIwMSw2ICsyMDEsOSBA
QCBUaGUgZGVmYXVsdCBsaXN0IG9mIGNvbHVtbnMgbWF5IGJlIGV4dGVuZGVkIGlmIF9saXN0XyBp
cyBzcGVjaWZpZWQgaW4gdGhlIGZvcm1hdAogICotcSosICotLXF1aWV0Kjo6CiAgU3VwcHJlc3Mg
ZXh0cmEgaW5mbyBtZXNzYWdlcy4KICAKQEAgLTE4MSw3ICsyNyw3IEBAIGluZGV4IDI2Y2NhZDVh
M2IyLi5jZTllOTdiNzY4MiAxMDA2NDQKICAqLXUqLCAqLS11bml0IFMqOjoKICBEZXByZWNhdGVk
IG9wdGlvbi4gT25seSB0aGUgc2VjdG9yIHVuaXQgaXMgc3VwcG9ydGVkLiBUaGlzIG9wdGlvbiBp
cyBub3Qgc3VwcG9ydGVkIHdoZW4gdXNpbmcgdGhlICotLXNob3ctc2l6ZSogY29tbWFuZC4KICAK
LUBAIC0yNTYsNyArMjU5LDcgQEAgU3BlY2lmeSB0aGUgbWF4aW1hbCBudW1iZXIgb2YgR1BUIHBh
cnRpdGlvbnMuCitAQCAtMjQ5LDcgKzI1Miw3IEBAIFNwZWNpZnkgdGhlIG1heGltYWwgbnVtYmVy
IG9mIEdQVCBwYXJ0aXRpb25zLgogICpncmFpbio6OgogIFNwZWNpZnkgbWluaW1hbCBzaXplIGlu
IGJ5dGVzIHVzZWQgdG8gY2FsY3VsYXRlIHBhcnRpdGlvbnMgYWxpZ25tZW50LiBUaGUgZGVmYXVs
dCBpcyAxTWlCIGFuZCBpdCdzIHN0cm9uZ2x5IHJlY29tbWVuZGVkIHRvIHVzZSB0aGUgZGVmYXVs
dC4gRG8gbm90IG1vZGlmeSB0aGlzIHZhcmlhYmxlIGlmIHlvdSdyZSBub3Qgc3VyZS4KICAqc2Vj
dG9yLXNpemUqOjoKQEAgLTE5MSwxMCArMzcsMTAgQEAgaW5kZXggMjZjY2FkNWEzYjIuLmNlOWU5
N2I3NjgyIDEwMDY0NAogIE5vdGUgdGhhdCBpdCBpcyBvbmx5IHBvc3NpYmxlIHRvIHVzZSBoZWFk
ZXIgbGluZXMgYmVmb3JlIHRoZSBmaXJzdCBwYXJ0aXRpb24gaXMgc3BlY2lmaWVkIGluIHRoZSBp
bnB1dC4KICAKIGRpZmYgLS1naXQgYS9kaXNrLXV0aWxzL3NmZGlzay5jIGIvZGlzay11dGlscy9z
ZmRpc2suYwotaW5kZXggY2Y0MDIwMDdiNTEuLjVlN2MxZDkyNmU0IDEwMDY0NAoraW5kZXggZDhk
ZDhkMi4uOTdkNDI2NSAxMDA2NDQKIC0tLSBhL2Rpc2stdXRpbHMvc2ZkaXNrLmMKICsrKyBiL2Rp
c2stdXRpbHMvc2ZkaXNrLmMKLUBAIC0yMTU1LDYgKzIxNTUsOCBAQCBzdGF0aWMgdm9pZCBfX2F0
dHJpYnV0ZV9fKChfX25vcmV0dXJuX18pKSB1c2FnZSh2b2lkKQorQEAgLTIwODQsNiArMjA4NCw4
IEBAIHN0YXRpYyB2b2lkIF9fYXR0cmlidXRlX18oKF9fbm9yZXR1cm5fXykpIHVzYWdlKHZvaWQp
CiAgCSAgICAgIF8oIiAgICAgLS1jb2xvcls9PHdoZW4+XSAgICAgIGNvbG9yaXplIG91dHB1dCAo
JXMsICVzIG9yICVzKVxuIiksICJhdXRvIiwgImFsd2F5cyIsICJuZXZlciIpOwogIAlmcHJpbnRm
KG91dCwKICAJICAgICAgICAiICAgICAgICAgICAgICAgICAgICAgICAgICAgICAlc1xuIiwgVVNB
R0VfQ09MT1JTX0RFRkFVTFQpOwpAQCAtMjAzLDcgKzQ5LDcgQEAgaW5kZXggY2Y0MDIwMDdiNTEu
LjVlN2MxZDkyNmU0IDEwMDY0NAogIAlmcHJpbnRmKG91dCwKICAJICAgICAgXygiICAgICAtLWxv
Y2tbPTxtb2RlPl0gICAgICAgdXNlIGV4Y2x1c2l2ZSBkZXZpY2UgbG9jayAoJXMsICVzIG9yICVz
KVxuIiksICJ5ZXMiLCAibm8iLCAibm9uYmxvY2siKTsKICAJZnB1dHMoXygiIC1OLCAtLXBhcnRu
byA8bnVtPiAgICAgICAgc3BlY2lmeSBwYXJ0aXRpb24gbnVtYmVyXG4iKSwgb3V0KTsKLUBAIC0y
MTkxLDYgKzIxOTMsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQorQEAgLTIx
MjAsNiArMjEyMiw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAgCWNvbnN0
IGNoYXIgKm91dGFyZyA9IE5VTEw7CiAgCWludCByYyA9IC1FSU5WQUwsIGMsIGxvbmdpZHggPSAt
MSwgYnl0ZXMgPSAwOwogIAlpbnQgY29sb3Jtb2RlID0gVUxfQ09MT1JNT0RFX1VOREVGOwpAQCAt
MjExLDcgKzU3LDcgQEAgaW5kZXggY2Y0MDIwMDdiNTEuLjVlN2MxZDkyNmU0IDEwMDY0NAogIAlz
dHJ1Y3Qgc2ZkaXNrIF9zZiA9IHsKICAJCS5wYXJ0bm8gPSAtMSwKICAJCS53aXBlbW9kZSA9IFdJ
UEVNT0RFX0FVVE8sCi1AQCAtMjIxNyw2ICsyMjIwLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNo
YXIgKmFyZ3ZbXSkKK0BAIC0yMTQ1LDYgKzIxNDgsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hh
ciAqYXJndltdKQogIAkJT1BUX05PVEVMTCwKICAJCU9QVF9SRUxPQ0FURSwKICAJCU9QVF9MT0NL
LApAQCAtMjE5LDcgKzY1LDcgQEAgaW5kZXggY2Y0MDIwMDdiNTEuLjVlN2MxZDkyNmU0IDEwMDY0
NAogIAl9OwogIAogIAlzdGF0aWMgY29uc3Qgc3RydWN0IG9wdGlvbiBsb25nb3B0c1tdID0gewot
QEAgLTIyNDYsNiArMjI1MCw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCitA
QCAtMjE3NCw2ICsyMTc4LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAJ
CXsgIm91dHB1dCIsICByZXF1aXJlZF9hcmd1bWVudCwgTlVMTCwgJ28nIH0sCiAgCQl7ICJwYXJ0
bm8iLCAgcmVxdWlyZWRfYXJndW1lbnQsIE5VTEwsICdOJyB9LAogIAkJeyAicmVvcmRlciIsIG5v
X2FyZ3VtZW50LCAgICAgICBOVUxMLCAncicgfSwKQEAgLTIyNyw3ICs3Myw3IEBAIGluZGV4IGNm
NDAyMDA3YjUxLi41ZTdjMWQ5MjZlNCAxMDA2NDQKICAJCXsgInNob3ctZ2VvbWV0cnkiLCBub19h
cmd1bWVudCwgTlVMTCwgJ2cnIH0sCiAgCQl7ICJxdWlldCIsICAgbm9fYXJndW1lbnQsICAgICAg
IE5VTEwsICdxJyB9LAogIAkJeyAidmVyaWZ5IiwgIG5vX2FyZ3VtZW50LCAgICAgICBOVUxMLCAn
VicgfSwKLUBAIC0yNDUwLDYgKzI0NTUsMTMgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFy
Z3ZbXSkKK0BAIC0yMzczLDYgKzIzNzgsMTMgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFy
Z3ZbXSkKICAJCQkJc2YtPmxvY2ttb2RlID0gb3B0YXJnOwogIAkJCX0KICAJCQlicmVhazsKQEAg
LTI0MSw3ICs4Nyw3IEBAIGluZGV4IGNmNDAyMDA3YjUxLi41ZTdjMWQ5MjZlNCAxMDA2NDQKICAJ
CWRlZmF1bHQ6CiAgCQkJZXJydHJ5aGVscChFWElUX0ZBSUxVUkUpOwogIAkJfQotQEAgLTI0NjAs
NiArMjQ3Miw4IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCitAQCAtMjM4Myw2
ICsyMzk1LDggQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAJc2ZkaXNrX2lu
aXQoc2YpOwogIAlpZiAoYnl0ZXMpCiAgCQlmZGlza19zZXRfc2l6ZV91bml0KHNmLT5jeHQsIEZE
SVNLX1NJWkVVTklUX0JZVEVTKTsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGlu
dXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaAppbmRleCA3MzQ1OTI2Yjg4Li43MzM5NzA2OTVmIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvcHRlc3Qu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L3B0ZXN0
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmOWJlNzNjM2UyYjBhNGYwOTIzOTUwZGNiMDU4
YmU4NWQzZWU4ZWQ3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjZjg4YzcxYTY1OGE4
YmNhOWZkODEyMDkxZDYyODFlOWYzM2Q0ZDdjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogVHVkb3IgRmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBEYXRlOiBUaHUsIDMgRGVj
IDIwMTUgMDQ6MDg6MDAgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gRGVmaW5lIFRFU1RTIHZhcmlh
YmxlCkBAIC0xMCwxMCArMTAsMTAgQEAgVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5hbSBiL01h
a2VmaWxlLmFtCi1pbmRleCA1MGFiOGQwLi43ZTIzNDBkIDEwMDY0NAoraW5kZXggODIwNGJjMC4u
MTBiZTJmMSAxMDA2NDQKIC0tLSBhL01ha2VmaWxlLmFtCiArKysgYi9NYWtlZmlsZS5hbQotQEAg
LTY0LDYgKzY0LDcgQEAgdG1wZmlsZXNfREFUQSA9CitAQCAtNjUsNiArNjUsNyBAQCB0bXBmaWxl
c19EQVRBID0KICBkaXN0X2Jhc2hjb21wbGV0aW9uX0RBVEEgPQogIGNoZWNrX1BST0dSQU1TID0K
ICBkaXN0X2NoZWNrX1NDUklQVFMgPQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRp
bC1saW51eC91dGlsLWxpbnV4XzIuNDAuMi5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGlu
dXgvdXRpbC1saW51eF8yLjQwLjQuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjQwLjIuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjQwLjQuYmIKLS0g
CjIuNDQuMQoK

--===============4643261948903194041==
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
workspace            = "tmp-auh-upgrades:a4bc760e98c6a89cea32b945351493705317b856"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 732 Local 267 Mirrors 0 Missed 465 Current 331 (36% match, 56% complete)
Removing 98 stale sstate objects for arch qemux86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
Removing 187 stale sstate objects for arch core2-64...done.
Removing 38 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 381 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pigz/pigz_2.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 470 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 484 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb:do_create_spdx_setscene)
NOTE: Running setscene task 499 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 505 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 510 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 516 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 527 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe which-2.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pigz-native-2.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe socat-1.8.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cwautomacros-native-20110201-r0: task do_create_spdx_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-native-1.08.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 535 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_populate_sysroot_setscene)
NOTE: recipe cwautomacros-native-20110201-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 536 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 537 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 545 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_create_spdx_setscene)
NOTE: recipe bc-native-1.08.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 549 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_create_spdx_setscene)
NOTE: Running setscene task 550 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-native-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 551 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe which-2.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bc-1.08.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 561 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe socat-1.8.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: recipe pigz-native-2.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 569 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe grep-3.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 573 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 591 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 605 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 611 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_create_spdx_setscene)
NOTE: recipe glibc-locale-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-native-1.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-native-5.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-native-8.11.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-native-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 613 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pigz/pigz_2.8.bb:do_recipe_qa_setscene)
NOTE: recipe cwautomacros-native-20110201-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe bc-1.08.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-native-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 630 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-native-3.10.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 636 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-native-5.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-native-8.11.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-native-1.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 642 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 663 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 666 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 669 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 677 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 684 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-native-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 685 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 694 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-native-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 695 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pigz-native-2.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-native-3.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 697 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cwautomacros-native-20110201-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 710 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pigz-native-2.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 712 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.46-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-native-1.08.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 718 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_257.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 726 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 730 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-jinja2-native-3.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 741 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.46-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 751 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 752 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 764 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 769 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_257.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 770 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 774 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-native-1.08.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-6.12.9+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 783 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 787 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 789 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-native-33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 793 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 797 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 801 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-native-33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 803 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 804 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 807 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 808 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cwautomacros-native-20110201-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 810 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 812 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 816 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 818 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot_setscene)
NOTE: recipe cwautomacros-native-20110201-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 819 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 821 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 826 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 828 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 829 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-protocols-1.39-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 832 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kern-tools-native-0.3+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 835 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 837 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 840 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 843 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-protocols-1.39-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 846 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.08.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 849 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxslt-native-1.1.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 850 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 855 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 856 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 862 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 864 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxslt-native-1.1.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-native-10.44-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 869 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kern-tools-native-0.3+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.13.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 874 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.47.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 876 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 877 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 879 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_recipe_qa_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bc-native-1.08.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-native-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 882 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-native-10.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.13.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 885 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 887 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 890 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 892 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 893 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.4.1.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kern-tools-native-0.3+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 894 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bc-native-1.08.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 896 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe git-native-2.47.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-native-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 899 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 903 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe kern-tools-native-0.3+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 906 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 907 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 908 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe qemu-native-9.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 909 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-native-2.13.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-native-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 910 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_create_spdx_setscene)
NOTE: recipe qemu-native-9.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 912 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 914 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 919 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-75.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-native-2.13.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 920 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 929 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_create_spdx_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 931 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-native-75.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-native-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-native-1.24-r0: task do_create_spdx_setscene: Started
NOTE: recipe rsync-native-3.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe meson-native-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 936 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 938 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 941 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-native-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-75.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-native-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe meson-native-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 944 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 946 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-native-20250104-3.1-r1: task do_create_spdx_setscene: Started
NOTE: Running setscene task 949 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 952 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-native-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-native-1.24-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 953 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-native-3_3.47.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-native-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-native-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 955 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 960 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-native-20250104-3.1-r1: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-native-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 963 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 965 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 970 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-native-3_3.47.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 971 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 973 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 977 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 978 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-native-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 979 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe cmake-native-3.31.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcrypt-4.4.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 981 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 984 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 986 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 988 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 990 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cmake-native-3.31.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 993 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-packaging-native-24.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 994 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 995 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libtirpc-native-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 996 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 999 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-native-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1001 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1002 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1003 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe libtirpc-native-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1007 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_stash_locale_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1010 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1012 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-native-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1013 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1014 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1016 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1020 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-native-5.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-native-3.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1021 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1023 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-native-6.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1028 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1030 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-native-5.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rsync-native-3.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1031 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1037 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-native-3.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rpm-native-1_4.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1038 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.23.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1039 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-native-0.192-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-native-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1041 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-native-3.7.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1045 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gettext-minimal-native-0.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe rpm-native-1_4.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-native-0.192-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-native-3.8.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rsync-native-3.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-native-3.7.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1048 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1049 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-native-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gettext-minimal-native-0.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1051 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-native-3.8.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-native-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-native-3.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-native-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 186 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_fetch)
NOTE: recipe rsync-native-3.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe git-native-2.47.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1053 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-native-3.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1054 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.47.1.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1055 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1056 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe rsync-native-3.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Started
NOTE: Running task 349 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 365 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_fetch)
NOTE: recipe ca-certificates-native-20241223-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe git-native-2.47.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 454 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb:do_fetch)
NOTE: Running task 458 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_fetch)
NOTE: Running noexec task 460 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_fetch)
NOTE: Running task 468 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_fetch)
NOTE: Running noexec task 470 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_fetch)
NOTE: Running task 472 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: Running task 474 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_fetch)
NOTE: Running task 476 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_fetch)
NOTE: Running task 478 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 488 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_fetch)
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 492 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: recipe git-native-2.47.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_fetch: Started
NOTE: Running task 496 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_fetch: Succeeded
NOTE: Running task 497 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_unpack)
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: Running task 498 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_fetch: Started
NOTE: recipe python3-native-3.13.1-r0: task do_fetch: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_fetch: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_fetch: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_fetch: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ca-certificates-native-20241223-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1058 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_fetch: Started
NOTE: Running setscene task 1059 of 1063 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1061 of 1063 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_unpack: Started
NOTE: recipe glibc-2.40+git-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 499 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: Running task 500 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_unpack)
NOTE: recipe python3-build-native-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 501 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb:do_unpack)
NOTE: Running task 502 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_unpack)
NOTE: recipe ca-certificates-native-20241223-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 505 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_unpack)
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_unpack: Started
NOTE: recipe ca-certificates-native-20241223-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_unpack: Started
NOTE: Running task 507 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_fetch)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 508 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_patch)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 509 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_patch)
NOTE: Running task 510 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb:do_patch)
NOTE: recipe python3-build-native-1.2.2-r0: task do_unpack: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 511 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_patch)
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 512 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_unpack)
NOTE: recipe python3-setuptools-native-75.6.0-r0: task do_fetch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_patch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Started
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_patch: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_fetch: Succeeded
NOTE: Running task 513 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_unpack)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-flit-core-native-3.10.1-r0: task do_patch: Succeeded
NOTE: Running task 516 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe python3-build-native-1.2.2-r0: task do_patch: Started
NOTE: Running task 521 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_fetch)
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_unpack: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_unpack: Succeeded
NOTE: Running task 530 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_fetch)
NOTE: Running task 531 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_patch)
NOTE: recipe python3-setuptools-native-75.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 533 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_unpack: Started
NOTE: recipe openssl-3.4.0-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-native-24.2-r0: task do_unpack: Succeeded
NOTE: Running task 545 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_unpack)
NOTE: Running task 546 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_patch)
NOTE: recipe xz-5.6.3-r0: task do_fetch: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: Running task 547 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch)
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_patch: Succeeded
NOTE: Running task 557 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_fetch)
NOTE: recipe python3-setuptools-native-75.6.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_patch: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_patch: Succeeded
NOTE: Running task 560 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_fetch)
NOTE: recipe python3-setuptools-native-75.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 561 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_patch)
NOTE: recipe util-linux-native-2.40.4-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.40.4-r0: task do_fetch: Succeeded
NOTE: Running task 569 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-75.6.0-r0: task do_patch: Started
NOTE: recipe python3-native-3.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 570 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_unpack)
NOTE: recipe libarchive-native-3.7.7-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_fetch: Succeeded
NOTE: Running task 581 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.0.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-native-75.6.0-r0: task do_patch: Succeeded
NOTE: Running task 582 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 585 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_unpack)
NOTE: recipe python3-native-3.13.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe meson-native-1.7.0-r0: task do_fetch: Started
NOTE: recipe expat-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 586 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_unpack)
NOTE: recipe util-linux-native-2.40.4-r0: task do_unpack: Started
NOTE: recipe expat-2.6.4-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.7.7-r0: task do_fetch: Succeeded
NOTE: Running task 587 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_unpack)
NOTE: recipe expat-2.6.4-r0: task do_unpack: Succeeded
NOTE: Running task 588 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_patch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_unpack: Started
NOTE: recipe expat-2.6.4-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 589 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe expat-2.6.4-r0: task do_patch: Succeeded
NOTE: Running task 593 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe util-linux-native-2.40.4-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Started
NOTE: Running task 594 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 596 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: recipe util-linux-native-2.40.4-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 597 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_14.2.bb:do_fetch)
NOTE: recipe libidn2-native-2.3.7-r0: task do_fetch: Started
NOTE: recipe gcc-source-14.2.0-14.2.0-r0: task do_fetch: Started
NOTE: recipe xz-5.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 599 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_unpack)
NOTE: recipe xz-5.6.3-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_unpack: Succeeded
NOTE: Running task 600 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_patch)
NOTE: recipe xz-5.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 601 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_patch)
NOTE: recipe python3-native-3.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 602 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_patch)
NOTE: recipe meson-native-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 605 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_patch: Started
NOTE: recipe xz-5.6.3-r0: task do_patch: Started
NOTE: recipe xz-5.6.3-r0: task do_patch: Succeeded
NOTE: Running task 607 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: recipe gnutls-native-3.8.8-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: Running task 608 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: recipe python3-native-3.13.1-r0: task do_patch: Started
NOTE: recipe openssl-3.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_fetch: Started
NOTE: Running task 609 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_unpack)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 613 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_fetch)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_unpack: Started
NOTE: Running task 614 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: recipe elfutils-native-0.192-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.192-r0: task do_fetch: Succeeded
NOTE: Running task 621 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_patch: Succeeded
NOTE: Running task 625 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.0.bb:do_unpack)
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe libarchive-native-3.7.7-r0: task do_unpack: Started
NOTE: recipe meson-native-1.7.0-r0: task do_unpack: Started
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: Running task 640 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe libarchive-native-3.7.7-r0: task do_unpack: Succeeded
NOTE: Running task 641 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_patch)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.7.7-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 642 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: Running task 643 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe libarchive-native-3.7.7-r0: task do_patch: Succeeded
NOTE: Running task 644 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_unpack)
NOTE: recipe gnutls-native-3.8.8-r0: task do_fetch: Succeeded
NOTE: Running task 645 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_unpack)
NOTE: recipe meson-native-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 646 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.0.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe openssl-3.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 647 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_patch)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe elfutils-native-0.192-r0: task do_unpack: Started
NOTE: Running task 649 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.0.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 650 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe meson-native-1.7.0-r0: task do_patch: Started
NOTE: recipe gnutls-native-3.8.8-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_patch: Started
NOTE: Running task 651 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe rpm-native-1_4.20.0-r0: task do_fetch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 652 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 662 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_generate_toolchain_file)
NOTE: recipe meson-native-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 665 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb:do_fetch)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Started
NOTE: recipe expat-2.6.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxcrypt-4.4.37-r0: task do_fetch: Started
NOTE: recipe expat-2.6.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_patch: Succeeded
NOTE: Running task 667 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: Running task 704 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: recipe python3-native-3.13.1-r0: task do_patch: Succeeded
NOTE: Running task 707 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_fetch)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 711 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 714 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_fetch)
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.37-r0: task do_fetch: Succeeded
NOTE: Running task 715 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_fetch: Started
NOTE: recipe qemu-native-9.2.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 716 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_fetch: Succeeded
NOTE: Running task 718 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.37-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.8-r0: task do_unpack: Succeeded
NOTE: Running task 719 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe libxml2-native-2.13.5-r0: task do_fetch: Started
NOTE: recipe gnutls-native-3.8.8-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 723 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.192-r0: task do_unpack: Succeeded
NOTE: Running task 724 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_patch)
NOTE: recipe gnutls-native-3.8.8-r0: task do_patch: Succeeded
NOTE: Running task 749 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.37-r0: task do_unpack: Succeeded
NOTE: Running task 750 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb:do_patch)
NOTE: recipe elfutils-native-0.192-r0: task do_patch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.37-r0: task do_patch: Started
NOTE: Running task 751 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: Running task 752 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.37-r0: task do_patch: Succeeded
NOTE: Running task 754 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_fetch)
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Succeeded
NOTE: Running task 755 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_unpack)
NOTE: recipe libxml2-native-2.13.5-r0: task do_fetch: Succeeded
NOTE: Running task 756 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.192-r0: task do_patch: Succeeded
NOTE: Running task 759 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_fetch: Started
NOTE: Running task 761 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 762 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_unpack: Succeeded
NOTE: Running task 763 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 766 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 767 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_fetch)
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Succeeded
NOTE: Running task 768 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_unpack)
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 769 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_patch)
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 770 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 772 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_fetch)
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Succeeded
NOTE: Running task 773 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe python3-3.13.1-r0: task do_fetch: Started
NOTE: recipe libxml2-native-2.13.5-r0: task do_unpack: Started
NOTE: recipe python3-3.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 774 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_patch: Succeeded
NOTE: Running task 776 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 778 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_unpack)
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: Running task 805 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 806 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_patch)
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Succeeded
NOTE: Running task 807 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_patch)
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_patch: Started
NOTE: Running task 808 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_patch)
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Started
NOTE: recipe libpam-1.7.0-r0: task do_patch: Started
NOTE: recipe libffi-3.4.6-r0: task do_patch: Succeeded
NOTE: Running task 809 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 811 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Succeeded
NOTE: recipe libxml2-native-2.13.5-r0: task do_unpack: Succeeded
NOTE: Running task 813 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_write_config)
NOTE: Running task 814 of 2803 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe python3-3.13.1-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 815 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_unpack)
NOTE: recipe libxml2-native-2.13.5-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_write_config: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Succeeded
NOTE: Running task 816 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_write_config: Succeeded
NOTE: Running task 818 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_write_config)
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Started
NOTE: recipe libxml2-native-2.13.5-r0: task do_patch: Succeeded
NOTE: Running task 825 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 827 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 828 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 831 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_fetch)
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 834 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_fetch)
NOTE: recipe python3-3.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 835 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_patch)
NOTE: recipe libgpg-error-1.51-r0: task do_fetch: Started
NOTE: recipe python3-3.13.1-r0: task do_patch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 836 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_fetch)
NOTE: recipe nettle-3.10.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.51-r0: task do_fetch: Succeeded
NOTE: Running task 837 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_unpack)
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_patch: Failed
NOTE: Running task 838 of 2803 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Succeeded
NOTE: recipe qemu-native-9.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-native-2.40.4-r0: task do_patch: Failed
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Failed
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: recipe rpm-native-1_4.20.0-r0: task do_fetch: Succeeded
NOTE: recipe gcc-source-14.2.0-14.2.0-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 838 tasks of which 707 didn't need to be rerun and 3 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201051816.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201051816.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 3 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/util-linux-libuuid-native/2.40.4/temp/log.do_patch.4189411
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/util-linux-native/2.40.4/temp/log.do_patch.4190319
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/util-linux-libuuid/2.40.4/temp/log.do_patch.2670
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
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/util-linux-libuuid-native/2.40.4/temp/log.do_patch.4189411
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/util-linux-native/2.40.4/temp/log.do_patch.4190319
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/util-linux-libuuid/2.40.4/temp/log.do_patch.2670
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch) failed with exit code '1'

--===============4643261948903194041==--

