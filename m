Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3846AC3ABAA
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:33 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1774.1746113609447995714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dAjVgiX8;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=A4fpEiHx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101968c7b3b15-b106497d-4952-4d1a-bdaf-7590c0f6ed11-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113608;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4N+RmmmZbKiK20+0NvpQVsFbhC4CRw9Zgrrk1thxt9Y=;
	b=dAjVgiX8CngyRK6THQvavUj2jseJ6BIel+mIl/bYMfofyAZuoctlpvqe3PSwpfge
	YmS1XWT5B3I880l/ZploW5RlgWhTHPqX0Nl+GQlmaZLYCZ3mn1fzWIDFVAyLmdUeji4
	43UBEte/ROMtId9PEyNv4eyEAk+kJ5l/e4Pplmp4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113608;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4N+RmmmZbKiK20+0NvpQVsFbhC4CRw9Zgrrk1thxt9Y=;
	b=A4fpEiHxv+Ng1/CbW77oDNuayc4Mr3RujAcHFcWLdk1C4hUm5gZ/TzZr8e6uiHlN
	YGM4l3dw4wycf9ZU6Otn1alwGm/5h0BvPl4eQPEmgL6eplsG15NBppr+5B7B+biKp2H
	QxDXK4RXxByUStV0baZBbYgdsqoAkSFnVh6yRszw=
Content-Type: multipart/mixed; boundary="===============7680730796056585164=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux,util-linux-libuuid: upgrading to 2.41,2.41 SUCCEEDED
Message-ID: <010101968c7b3b15-b106497d-4952-4d1a-bdaf-7590c0f6ed11-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215780

--===============7680730796056585164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *util-linux,util-linux-libuuid* to *2.41,2.41* has Succeeded.

Next steps:
    - apply the patch: git am 0001-util-linux-util-linux-libuuid-upgrade-2.40.4-2.41-2..patch
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
From a0f498ec21056470b490540b403b04baeb3897d6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 05:38:55 +0000
Subject: [PATCH] util-linux,util-linux-libuuid: upgrade 2.40.4 -> 2.41,2.40.4
 -> 2.41

---
 ...d_2.40.4.bb => util-linux-libuuid_2.41.bb} |  22 ++++
 meta/recipes-core/util-linux/util-linux.inc   |   6 +-
 ...dd-sector-size-commanand-line-option.patch |  90 ---------------
 ...dd-sector-size-commanand-line-option.patch | 105 ------------------
 .../util-linux/avoid_parallel_tests.patch     |   4 +-
 .../util-linux/configure-sbindir.patch        |   4 +-
 .../display_testname_for_subtest.patch        |   6 +-
 .../util-linux/util-linux/ptest.patch         |   6 +-
 ...til-linux_2.40.4.bb => util-linux_2.41.bb} |  22 ++++
 9 files changed, 56 insertions(+), 209 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.40.4.bb => util-linux-libuuid_2.41.bb} (43%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-cfdisk-add-sector-size-commanand-line-option.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0002-sfdisk-add-sector-size-commanand-line-option.patch
 rename meta/recipes-core/util-linux/{util-linux_2.40.4.bb => util-linux_2.41.bb} (96%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb
similarity index 43%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb
index ec04c1d384..8fa079389b 100644
--- a/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb
+++ b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- README.licensing
+# +++ README.licensing
+# @@ -20,6 +20,8 @@
+#  
+#     * BSD-4-Clause-UC    - BSD 4-Clause University of California-Specific
+#  
+# +   * EUPL-1.2           - European Union Public Licence version 1.2
+# +
+#     * Public Domain
+#  
+#  Please, check the source code for more details. A license is usually at the start
+# 
+#
+
 # To allow util-linux to optionally build-depend on cryptsetup, libuuid is
 # split out of the main recipe, as it's needed by cryptsetup
 
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4e8701ffdf..0252bdedb6 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -14,7 +14,7 @@ LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
 LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
 LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=ddd58b6c94da86ff4f03e91208eb9cfc \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=55e895a80bdd4ffc65e167a76d2e7569 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
@@ -38,10 +38,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            file://fcntl-lock.c \
-           file://0001-cfdisk-add-sector-size-commanand-line-option.patch \
-           file://0002-sfdisk-add-sector-size-commanand-line-option.patch \
            "
 
-SRC_URI[sha256sum] = "5c1daf733b04e9859afdc3bd87cc481180ee0f88b5c0946b16fdec931975fb79"
+SRC_URI[sha256sum] = "81ee93b3cfdfeb7d7c4090cedeba1d7bbce9141fd0b501b686b3fe475ddca4c6"
 
 CVE_PRODUCT = "util-linux"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-cfdisk-add-sector-size-commanand-line-option.patch b/meta/recipes-core/util-linux/util-linux/0001-cfdisk-add-sector-size-commanand-line-option.patch
deleted file mode 100644
index 73031318d2..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-cfdisk-add-sector-size-commanand-line-option.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 724b95ee6847613e23ca18f4918d4e65ff5b270e Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 14 Oct 2024 15:48:46 +0200
-Subject: [PATCH 1/2] cfdisk: add --sector-size commanand line option
-
-* improves compatibility with fdisk
-* add ability to work with disk images where libfdisk defaults to 512
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
-
-Upstream-Status: Backport [fd38ee2274f7a30393d3839dfce556260355c3fa]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- disk-utils/cfdisk.8.adoc |  3 +++
- disk-utils/cfdisk.c      | 15 ++++++++++++++-
- 2 files changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/disk-utils/cfdisk.8.adoc b/disk-utils/cfdisk.8.adoc
-index 97fad621d..759f39f0e 100644
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
-index 183b7671e..f37e2d72a 100644
---- a/disk-utils/cfdisk.c
-+++ b/disk-utils/cfdisk.c
-@@ -2739,6 +2739,8 @@ static void __attribute__((__noreturn__)) usage(void)
- 	      _("     --lock[=<mode>]      use exclusive device lock (%s, %s or %s)\n"), "yes", "no", "nonblock");
- 	fputs(_(" -r, --read-only          forced open cfdisk in read-only mode\n"), out);
- 
-+	fputs(_(" -b, --sector-size <size> physical and logical sector size\n"), out);
-+
- 	fputs(USAGE_SEPARATOR, out);
- 	fprintf(out, USAGE_HELP_OPTIONS(26));
- 
-@@ -2751,6 +2753,7 @@ int main(int argc, char *argv[])
- 	const char *diskpath = NULL, *lockmode = NULL;
- 	int rc, c, colormode = UL_COLORMODE_UNDEF;
- 	int read_only = 0;
-+	size_t user_ss = 0;
- 	struct cfdisk _cf = { .lines_idx = 0 },
- 		      *cf = &_cf;
- 	enum {
-@@ -2760,6 +2763,7 @@ int main(int argc, char *argv[])
- 		{ "color",   optional_argument, NULL, 'L' },
- 		{ "lock",    optional_argument, NULL, OPT_LOCK },
- 		{ "help",    no_argument,       NULL, 'h' },
-+		{ "sector-size", required_argument, NULL, 'b' },
- 		{ "version", no_argument,       NULL, 'V' },
- 		{ "zero",    no_argument,	NULL, 'z' },
- 		{ "read-only", no_argument,     NULL, 'r' },
-@@ -2771,8 +2775,15 @@ int main(int argc, char *argv[])
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
-@@ -2811,6 +2822,8 @@ int main(int argc, char *argv[])
- 	cf->cxt = fdisk_new_context();
- 	if (!cf->cxt)
- 		err(EXIT_FAILURE, _("failed to allocate libfdisk context"));
-+	if (user_ss)
-+		fdisk_save_user_sector_size(cf->cxt, user_ss, user_ss);
- 
- 	fdisk_set_ask(cf->cxt, ask_callback, (void *) cf);
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0002-sfdisk-add-sector-size-commanand-line-option.patch b/meta/recipes-core/util-linux/util-linux/0002-sfdisk-add-sector-size-commanand-line-option.patch
deleted file mode 100644
index 8d47d8de71..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0002-sfdisk-add-sector-size-commanand-line-option.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 96570c03f46e0a5c17e721737a38c717c67e358b Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 14 Oct 2024 15:50:40 +0200
-Subject: [PATCH 2/2] sfdisk: add --sector-size commanand line option
-
-* improves compatibility with fdisk
-* add ability to work with disk images where libfdisk defaults to 512
-
-Addresses: https://github.com/util-linux/util-linux/pull/3235
-Signed-off-by: Karel Zak <kzak@redhat.com>
-
-Upstream-Status: Backport [ef7b76baa17ddb5414691fa8f49d61415c30871c]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- disk-utils/sfdisk.8.adoc |  5 ++++-
- disk-utils/sfdisk.c      | 14 ++++++++++++++
- 2 files changed, 18 insertions(+), 1 deletion(-)
-
-diff --git a/disk-utils/sfdisk.8.adoc b/disk-utils/sfdisk.8.adoc
-index bc3ff9bb8..d1eaa3712 100644
---- a/disk-utils/sfdisk.8.adoc
-+++ b/disk-utils/sfdisk.8.adoc
-@@ -201,6 +201,9 @@ The default list of columns may be extended if _list_ is specified in the format
- *-q*, *--quiet*::
- Suppress extra info messages.
- 
-+*--sector-size* _sectorsize_::
-+Specify the sector size of the disk. Valid values are 512, 1024, 2048, and 4096. The kernel is aware of the sector size for regular block devices. Use this option only on very old kernels, when working with disk images, or to override the kernel's default sector size. Since util-linux-2.17, *fdisk* distinguishes between logical and physical sector size. This option changes both sector sizes to the specified _sectorsize_.
-+
- *-u*, *--unit S*::
- Deprecated option. Only the sector unit is supported. This option is not supported when using the *--show-size* command.
- 
-@@ -249,7 +252,7 @@ Specify the maximal number of GPT partitions.
- *grain*::
- Specify minimal size in bytes used to calculate partitions alignment. The default is 1MiB and it's strongly recommended to use the default. Do not modify this variable if you're not sure.
- *sector-size*::
--Specify sector size. *sfdisk* always uses device sector size. Since version 2.39 *sfdisk* recalculates sizes from dump if the script and device sector size differ.
-+Specifies the sector size used in the input. *sfdisk* always internally uses the device sector size provided by the kernel for the block device, or as specified by the user on the command line (see *--sector-size*). Starting with version 2.39, *sfdisk* recalculates sizes from the input if the *sector-size* header and device sector size are different.
- 
- Note that it is only possible to use header lines before the first partition is specified in the input.
- 
-diff --git a/disk-utils/sfdisk.c b/disk-utils/sfdisk.c
-index d8dd8d296..97d426559 100644
---- a/disk-utils/sfdisk.c
-+++ b/disk-utils/sfdisk.c
-@@ -2084,6 +2084,8 @@ static void __attribute__((__noreturn__)) usage(void)
- 	      _("     --color[=<when>]      colorize output (%s, %s or %s)\n"), "auto", "always", "never");
- 	fprintf(out,
- 	        "                             %s\n", USAGE_COLORS_DEFAULT);
-+	fputs(_("     --sector-size <size>  physical and logical sector size\n"), out);
-+
- 	fprintf(out,
- 	      _("     --lock[=<mode>]       use exclusive device lock (%s, %s or %s)\n"), "yes", "no", "nonblock");
- 	fputs(_(" -N, --partno <num>        specify partition number\n"), out);
-@@ -2120,6 +2122,7 @@ int main(int argc, char *argv[])
- 	const char *outarg = NULL;
- 	int rc = -EINVAL, c, longidx = -1, bytes = 0;
- 	int colormode = UL_COLORMODE_UNDEF;
-+	size_t user_ss = 0;
- 	struct sfdisk _sf = {
- 		.partno = -1,
- 		.wipemode = WIPEMODE_AUTO,
-@@ -2145,6 +2148,7 @@ int main(int argc, char *argv[])
- 		OPT_NOTELL,
- 		OPT_RELOCATE,
- 		OPT_LOCK,
-+		OPT_SECTORSIZE
- 	};
- 
- 	static const struct option longopts[] = {
-@@ -2174,6 +2178,7 @@ int main(int argc, char *argv[])
- 		{ "output",  required_argument, NULL, 'o' },
- 		{ "partno",  required_argument, NULL, 'N' },
- 		{ "reorder", no_argument,       NULL, 'r' },
-+		{ "sector-size", required_argument, NULL, OPT_SECTORSIZE },
- 		{ "show-geometry", no_argument, NULL, 'g' },
- 		{ "quiet",   no_argument,       NULL, 'q' },
- 		{ "verify",  no_argument,       NULL, 'V' },
-@@ -2373,6 +2378,13 @@ int main(int argc, char *argv[])
- 				sf->lockmode = optarg;
- 			}
- 			break;
-+		case OPT_SECTORSIZE:
-+			user_ss = strtou32_or_err(optarg,
-+					_("invalid sector size argument"));
-+			if (user_ss != 512 && user_ss != 1024 &&
-+			    user_ss != 2048 && user_ss != 4096)
-+				errx(EXIT_FAILURE, _("invalid sector size argument"));
-+			break;
- 		default:
- 			errtryhelp(EXIT_FAILURE);
- 		}
-@@ -2383,6 +2395,8 @@ int main(int argc, char *argv[])
- 	sfdisk_init(sf);
- 	if (bytes)
- 		fdisk_set_size_unit(sf->cxt, FDISK_SIZEUNIT_BYTES);
-+	if (user_ss)
-+		fdisk_save_user_sector_size(sf->cxt, user_ss, user_ss);
- 
- 	if (outarg)
- 		init_fields(NULL, outarg, NULL);
--- 
-2.25.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index 8ea00dbb95..2828a3c085 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From da58b4150f6932de36c962ea657713bcf4ea44be Mon Sep 17 00:00:00 2001
+From dd0f697afb643776e03e3710e910f53deb3d5306 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 651ef2b..2a8012e 100644
+index 43a23a5..4a84531 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index 74abdc2038..8859ed0523 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From 0387d71516c978899cfd556ca512f530a212b4a9 Mon Sep 17 00:00:00 2001
+From bd94b4b6af97e527b46e71a400e02855d3b3d1f7 Mon Sep 17 00:00:00 2001
 From: Phil Blundell <pb@pbcl.net>
 Date: Mon, 24 Sep 2012 07:24:51 +0100
 Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 23594ff..651ef2b 100644
+index a5d9102..43a23a5 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
index 871b0b2d30..541c1eb84f 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,4 @@
-From 45450d0339cd7ee27f53c0f2fac1cc74ed9bbfb8 Mon Sep 17 00:00:00 2001
+From 89c72294b062017f991ba4993748609eeff0b3bb Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
@@ -10,10 +10,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/functions.sh b/tests/functions.sh
-index 5fe5ba0..a6c703e 100644
+index 1d7a425..b1f0986 100644
 --- a/tests/functions.sh
 +++ b/tests/functions.sh
-@@ -450,7 +450,7 @@ function ts_init_subtest {
+@@ -455,7 +455,7 @@ function ts_init_subtest {
  
  	if [ "$TS_PARSABLE" != "yes" ]; then
  		[ $TS_NSUBTESTS -eq 1 ] && echo
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index 7345926b88..e1d9123abb 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From f9be73c3e2b0a4f0923950dcb058be85d3ee8ed7 Mon Sep 17 00:00:00 2001
+From 73e565a761cf6839476abc73959ae734024c3cdd Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
@@ -10,10 +10,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 50ab8d0..7e2340d 100644
+index 01e9970..c3313ff 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -64,6 +64,7 @@ tmpfiles_DATA =
+@@ -66,6 +66,7 @@ sysusers_DATA =
  dist_bashcompletion_DATA =
  check_PROGRAMS =
  dist_check_SCRIPTS =
diff --git a/meta/recipes-core/util-linux/util-linux_2.40.4.bb b/meta/recipes-core/util-linux/util-linux_2.41.bb
similarity index 96%
rename from meta/recipes-core/util-linux/util-linux_2.40.4.bb
rename to meta/recipes-core/util-linux/util-linux_2.41.bb
index 81bd298dd9..6044d4ae1c 100644
--- a/meta/recipes-core/util-linux/util-linux_2.40.4.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.41.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- README.licensing
+# +++ README.licensing
+# @@ -20,6 +20,8 @@
+#  
+#     * BSD-4-Clause-UC    - BSD 4-Clause University of California-Specific
+#  
+# +   * EUPL-1.2           - European Union Public Licence version 1.2
+# +
+#     * Public Domain
+#  
+#  Please, check the source code for more details. A license is usually at the start
+# 
+#
+
 require util-linux.inc
 
 inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest gtk-doc
-- 
2.47.1


--===============7680730796056585164==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-util-linux-libuuid-upgrade-2.40.4-2.41-2..patch"

RnJvbSBhMGY0OThlYzIxMDU2NDcwYjQ5MDU0MGI0MDNiMDRiYWViMzg5N2Q2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwNTozODo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHV0
aWwtbGludXgsdXRpbC1saW51eC1saWJ1dWlkOiB1cGdyYWRlIDIuNDAuNCAtPiAyLjQxLDIuNDAu
NAogLT4gMi40MQoKLS0tCiAuLi5kXzIuNDAuNC5iYiA9PiB1dGlsLWxpbnV4LWxpYnV1aWRfMi40
MS5iYn0gfCAgMjIgKysrKwogbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4
LmluYyAgIHwgICA2ICstCiAuLi5kZC1zZWN0b3Itc2l6ZS1jb21tYW5hbmQtbGluZS1vcHRpb24u
cGF0Y2ggfCAgOTAgLS0tLS0tLS0tLS0tLS0tCiAuLi5kZC1zZWN0b3Itc2l6ZS1jb21tYW5hbmQt
bGluZS1vcHRpb24ucGF0Y2ggfCAxMDUgLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4vdXRpbC1saW51
eC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCAgICAgfCAgIDQgKy0KIC4uLi91dGlsLWxpbnV4
L2NvbmZpZ3VyZS1zYmluZGlyLnBhdGNoICAgICAgICB8ICAgNCArLQogLi4uL2Rpc3BsYXlfdGVz
dG5hbWVfZm9yX3N1YnRlc3QucGF0Y2ggICAgICAgIHwgICA2ICstCiAuLi4vdXRpbC1saW51eC91
dGlsLWxpbnV4L3B0ZXN0LnBhdGNoICAgICAgICAgfCAgIDYgKy0KIC4uLnRpbC1saW51eF8yLjQw
LjQuYmIgPT4gdXRpbC1saW51eF8yLjQxLmJifSB8ICAyMiArKysrCiA5IGZpbGVzIGNoYW5nZWQs
IDU2IGluc2VydGlvbnMoKyksIDIwOSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
Y29yZS91dGlsLWxpbnV4L3t1dGlsLWxpbnV4LWxpYnV1aWRfMi40MC40LmJiID0+IHV0aWwtbGlu
dXgtbGlidXVpZF8yLjQxLmJifSAoNDMlKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBl
cy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWNmZGlzay1hZGQtc2VjdG9yLXNpemUt
Y29tbWFuYW5kLWxpbmUtb3B0aW9uLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNp
cGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDItc2ZkaXNrLWFkZC1zZWN0b3Itc2l6
ZS1jb21tYW5hbmQtbGluZS1vcHRpb24ucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS91
dGlsLWxpbnV4L3t1dGlsLWxpbnV4XzIuNDAuNC5iYiA9PiB1dGlsLWxpbnV4XzIuNDEuYmJ9ICg5
NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4
LWxpYnV1aWRfMi40MC40LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4LWxpYnV1aWRfMi40MS5iYgpzaW1pbGFyaXR5IGluZGV4IDQzJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8yLjQwLjQuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIu
NDEuYmIKaW5kZXggZWMwNGMxZDM4NC4uOGZhMDc5Mzg5YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWRfMi40MC40LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIuNDEuYmIKQEAg
LTEsMyArMSwyNSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUg
YmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRo
ZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisj
IFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXpl
IHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRl
OicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBk
YXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIFJFQURNRS5saWNlbnNpbmcKKyMg
KysrIFJFQURNRS5saWNlbnNpbmcKKyMgQEAgLTIwLDYgKzIwLDggQEAKKyMgIAorIyAgICAgKiBC
U0QtNC1DbGF1c2UtVUMgICAgLSBCU0QgNC1DbGF1c2UgVW5pdmVyc2l0eSBvZiBDYWxpZm9ybmlh
LVNwZWNpZmljCisjICAKKyMgKyAgICogRVVQTC0xLjIgICAgICAgICAgIC0gRXVyb3BlYW4gVW5p
b24gUHVibGljIExpY2VuY2UgdmVyc2lvbiAxLjIKKyMgKworIyAgICAgKiBQdWJsaWMgRG9tYWlu
CisjICAKKyMgIFBsZWFzZSwgY2hlY2sgdGhlIHNvdXJjZSBjb2RlIGZvciBtb3JlIGRldGFpbHMu
IEEgbGljZW5zZSBpcyB1c3VhbGx5IGF0IHRoZSBzdGFydAorIyAKKyMKKwogIyBUbyBhbGxvdyB1
dGlsLWxpbnV4IHRvIG9wdGlvbmFsbHkgYnVpbGQtZGVwZW5kIG9uIGNyeXB0c2V0dXAsIGxpYnV1
aWQgaXMKICMgc3BsaXQgb3V0IG9mIHRoZSBtYWluIHJlY2lwZSwgYXMgaXQncyBuZWVkZWQgYnkg
Y3J5cHRzZXR1cAogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0
aWwtbGludXguaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4Lmlu
YwppbmRleCA0ZTg3MDFmZmRmLi4wMjUyYmRlZGI2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0
aWwtbGludXgvdXRpbC1saW51eC5pbmMKQEAgLTE0LDcgKzE0LDcgQEAgTElDRU5TRToke1BOfS1s
aWJmZGlzayA9ICJMR1BMLTIuMS1vci1sYXRlciIKIExJQ0VOU0U6JHtQTn0tbGlibW91bnQgPSAi
TEdQTC0yLjEtb3ItbGF0ZXIiCiBMSUNFTlNFOiR7UE59LWxpYnNtYXJ0Y29scyA9ICJMR1BMLTIu
MS1vci1sYXRlciIKIAotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FLmxpY2Vuc2lu
ZzttZDU9ZGRkNThiNmM5NGRhODZmZjRmMDNlOTEyMDhlYjljZmMgXAorTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vUkVBRE1FLmxpY2Vuc2luZzttZDU9NTVlODk1YTgwYmRkNGZmYzY1ZTE2N2E3
NmQyZTc1NjkgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVl
NGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
RG9jdW1lbnRhdGlvbi9saWNlbnNlcy9DT1BZSU5HLkdQTC0yLjAtb3ItbGF0ZXI7bWQ1PWIyMzRl
ZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTov
L0RvY3VtZW50YXRpb24vbGljZW5zZXMvQ09QWUlORy5MR1BMLTIuMS1vci1sYXRlcjttZDU9NGZi
ZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMgXApAQCAtMzgsMTAgKzM4LDggQEAgU1JDX1VS
SSA9ICIke0tFUk5FTE9SR19NSVJST1J9L2xpbnV4L3V0aWxzL3V0aWwtbGludXgvdiR7TUFKT1Jf
VkVSU0lPTn0vdXRpbC1saW4KICAgICAgICAgICAgZmlsZTovL2Rpc3BsYXlfdGVzdG5hbWVfZm9y
X3N1YnRlc3QucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vYXZvaWRfcGFyYWxsZWxfdGVzdHMu
cGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vZmNudGwtbG9jay5jIFwKLSAgICAgICAgICAgZmls
ZTovLzAwMDEtY2ZkaXNrLWFkZC1zZWN0b3Itc2l6ZS1jb21tYW5hbmQtbGluZS1vcHRpb24ucGF0
Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMi1zZmRpc2stYWRkLXNlY3Rvci1zaXplLWNvbW1h
bmFuZC1saW5lLW9wdGlvbi5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjVjMWRhZjczM2IwNGU5ODU5YWZkYzNiZDg3Y2M0ODExODBlZTBmODhiNWMwOTQ2YjE2
ZmRlYzkzMTk3NWZiNzkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODFlZTkzYjNjZmRmZWI3ZDdj
NDA5MGNlZGViYTFkN2JiY2U5MTQxZmQwYjUwMWI2ODZiM2ZlNDc1ZGRjYTRjNiIKIAogQ1ZFX1BS
T0RVQ1QgPSAidXRpbC1saW51eCIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC8wMDAxLWNmZGlzay1hZGQtc2VjdG9yLXNpemUtY29tbWFuYW5kLWxp
bmUtb3B0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4
LzAwMDEtY2ZkaXNrLWFkZC1zZWN0b3Itc2l6ZS1jb21tYW5hbmQtbGluZS1vcHRpb24ucGF0Y2gK
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDczMDMxMzE4ZDIuLjAwMDAwMDAwMDAKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtY2ZkaXNrLWFk
ZC1zZWN0b3Itc2l6ZS1jb21tYW5hbmQtbGluZS1vcHRpb24ucGF0Y2gKKysrIC9kZXYvbnVsbApA
QCAtMSw5MCArMCwwIEBACi1Gcm9tIDcyNGI5NWVlNjg0NzYxM2UyM2NhMThmNDkxOGQ0ZTY1ZmY1
YjI3MGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLYXJlbCBaYWsgPGt6YWtAcmVk
aGF0LmNvbT4KLURhdGU6IE1vbiwgMTQgT2N0IDIwMjQgMTU6NDg6NDYgKzAyMDAKLVN1YmplY3Q6
IFtQQVRDSCAxLzJdIGNmZGlzazogYWRkIC0tc2VjdG9yLXNpemUgY29tbWFuYW5kIGxpbmUgb3B0
aW9uCi0KLSogaW1wcm92ZXMgY29tcGF0aWJpbGl0eSB3aXRoIGZkaXNrCi0qIGFkZCBhYmlsaXR5
IHRvIHdvcmsgd2l0aCBkaXNrIGltYWdlcyB3aGVyZSBsaWJmZGlzayBkZWZhdWx0cyB0byA1MTIK
LQotU2lnbmVkLW9mZi1ieTogS2FyZWwgWmFrIDxremFrQHJlZGhhdC5jb20+Ci0KLVVwc3RyZWFt
LVN0YXR1czogQmFja3BvcnQgW2ZkMzhlZTIyNzRmN2EzMDM5M2QzODM5ZGZjZTU1NjI2MDM1NWMz
ZmFdCi0KLVNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KLS0t
LQotIGRpc2stdXRpbHMvY2ZkaXNrLjguYWRvYyB8ICAzICsrKwotIGRpc2stdXRpbHMvY2ZkaXNr
LmMgICAgICB8IDE1ICsrKysrKysrKysrKysrLQotIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvZGlzay11dGlscy9jZmRpc2su
OC5hZG9jIGIvZGlzay11dGlscy9jZmRpc2suOC5hZG9jCi1pbmRleCA5N2ZhZDYyMWQuLjc1OWYz
OWYwZSAxMDA2NDQKLS0tLSBhL2Rpc2stdXRpbHMvY2ZkaXNrLjguYWRvYwotKysrIGIvZGlzay11
dGlscy9jZmRpc2suOC5hZG9jCi1AQCAtNTUsNiArNTUsOSBAQCBVc2UgZXhjbHVzaXZlIEJTRCBs
b2NrIGZvciBkZXZpY2Ugb3IgZmlsZSBpdCBvcGVyYXRlcy4gVGhlIG9wdGlvbmFsIGFyZ3VtZW50
IF9tbwotICotciosICotLXJlYWQtb25seSo6OgotIEZvcmNlZCBvcGVuIGluIHJlYWQtb25seSBt
b2RlLgotIAotKyotYiosICotLXNlY3Rvci1zaXplKiBfc2VjdG9yc2l6ZV86OgotK1NwZWNpZnkg
dGhlIHNlY3RvciBzaXplIG9mIHRoZSBkaXNrLiBWYWxpZCB2YWx1ZXMgYXJlIDUxMiwgMTAyNCwg
MjA0OCwgYW5kIDQwOTYuIFRoZSBrZXJuZWwgaXMgYXdhcmUgb2YgdGhlIHNlY3RvciBzaXplIGZv
ciByZWd1bGFyIGJsb2NrIGRldmljZXMuIFVzZSB0aGlzIG9wdGlvbiBvbmx5IG9uIHZlcnkgb2xk
IGtlcm5lbHMsIHdoZW4gd29ya2luZyB3aXRoIGRpc2sgaW1hZ2VzLCBvciB0byBvdmVycmlkZSB0
aGUga2VybmVsJ3MgZGVmYXVsdCBzZWN0b3Igc2l6ZS4gU2luY2UgdXRpbC1saW51eC0yLjE3LCAq
ZmRpc2sqIGRpc3Rpbmd1aXNoZXMgYmV0d2VlbiBsb2dpY2FsIGFuZCBwaHlzaWNhbCBzZWN0b3Ig
c2l6ZS4gVGhpcyBvcHRpb24gY2hhbmdlcyBib3RoIHNlY3RvciBzaXplcyB0byB0aGUgc3BlY2lm
aWVkIF9zZWN0b3JzaXplXy4KLSsKLSAqLXoqLCAqLS16ZXJvKjo6Ci0gU3RhcnQgd2l0aCBhbiBp
bi1tZW1vcnkgemVyb2VkIHBhcnRpdGlvbiB0YWJsZS4gVGhpcyBvcHRpb24gZG9lcyBub3QgemVy
byB0aGUgcGFydGl0aW9uIHRhYmxlIG9uIHRoZSBkaXNrOyByYXRoZXIsIGl0IHNpbXBseSBzdGFy
dHMgdGhlIHByb2dyYW0gd2l0aG91dCByZWFkaW5nIHRoZSBleGlzdGluZyBwYXJ0aXRpb24gdGFi
bGUuIFRoaXMgb3B0aW9uIGFsbG93cyB5b3UgdG8gY3JlYXRlIGEgbmV3IHBhcnRpdGlvbiB0YWJs
ZSBmcm9tIHNjcmF0Y2ggb3IgZnJvbSBhbiAqc2ZkaXNrKig4KS1jb21wYXRpYmxlIHNjcmlwdC4K
LSAKLWRpZmYgLS1naXQgYS9kaXNrLXV0aWxzL2NmZGlzay5jIGIvZGlzay11dGlscy9jZmRpc2su
YwotaW5kZXggMTgzYjc2NzFlLi5mMzdlMmQ3MmEgMTAwNjQ0Ci0tLS0gYS9kaXNrLXV0aWxzL2Nm
ZGlzay5jCi0rKysgYi9kaXNrLXV0aWxzL2NmZGlzay5jCi1AQCAtMjczOSw2ICsyNzM5LDggQEAg
c3RhdGljIHZvaWQgX19hdHRyaWJ1dGVfXygoX19ub3JldHVybl9fKSkgdXNhZ2Uodm9pZCkKLSAJ
ICAgICAgXygiICAgICAtLWxvY2tbPTxtb2RlPl0gICAgICB1c2UgZXhjbHVzaXZlIGRldmljZSBs
b2NrICglcywgJXMgb3IgJXMpXG4iKSwgInllcyIsICJubyIsICJub25ibG9jayIpOwotIAlmcHV0
cyhfKCIgLXIsIC0tcmVhZC1vbmx5ICAgICAgICAgIGZvcmNlZCBvcGVuIGNmZGlzayBpbiByZWFk
LW9ubHkgbW9kZVxuIiksIG91dCk7Ci0gCi0rCWZwdXRzKF8oIiAtYiwgLS1zZWN0b3Itc2l6ZSA8
c2l6ZT4gcGh5c2ljYWwgYW5kIGxvZ2ljYWwgc2VjdG9yIHNpemVcbiIpLCBvdXQpOwotKwotIAlm
cHV0cyhVU0FHRV9TRVBBUkFUT1IsIG91dCk7Ci0gCWZwcmludGYob3V0LCBVU0FHRV9IRUxQX09Q
VElPTlMoMjYpKTsKLSAKLUBAIC0yNzUxLDYgKzI3NTMsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywg
Y2hhciAqYXJndltdKQotIAljb25zdCBjaGFyICpkaXNrcGF0aCA9IE5VTEwsICpsb2NrbW9kZSA9
IE5VTEw7Ci0gCWludCByYywgYywgY29sb3Jtb2RlID0gVUxfQ09MT1JNT0RFX1VOREVGOwotIAlp
bnQgcmVhZF9vbmx5ID0gMDsKLSsJc2l6ZV90IHVzZXJfc3MgPSAwOwotIAlzdHJ1Y3QgY2ZkaXNr
IF9jZiA9IHsgLmxpbmVzX2lkeCA9IDAgfSwKLSAJCSAgICAgICpjZiA9ICZfY2Y7Ci0gCWVudW0g
ewotQEAgLTI3NjAsNiArMjc2Myw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10p
Ci0gCQl7ICJjb2xvciIsICAgb3B0aW9uYWxfYXJndW1lbnQsIE5VTEwsICdMJyB9LAotIAkJeyAi
bG9jayIsICAgIG9wdGlvbmFsX2FyZ3VtZW50LCBOVUxMLCBPUFRfTE9DSyB9LAotIAkJeyAiaGVs
cCIsICAgIG5vX2FyZ3VtZW50LCAgICAgICBOVUxMLCAnaCcgfSwKLSsJCXsgInNlY3Rvci1zaXpl
IiwgcmVxdWlyZWRfYXJndW1lbnQsIE5VTEwsICdiJyB9LAotIAkJeyAidmVyc2lvbiIsIG5vX2Fy
Z3VtZW50LCAgICAgICBOVUxMLCAnVicgfSwKLSAJCXsgInplcm8iLCAgICBub19hcmd1bWVudCwJ
TlVMTCwgJ3onIH0sCi0gCQl7ICJyZWFkLW9ubHkiLCBub19hcmd1bWVudCwgICAgIE5VTEwsICdy
JyB9LAotQEAgLTI3NzEsOCArMjc3NSwxNSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJn
dltdKQotIAl0ZXh0ZG9tYWluKFBBQ0tBR0UpOwotIAljbG9zZV9zdGRvdXRfYXRleGl0KCk7Ci0g
Ci0tCXdoaWxlKChjID0gZ2V0b3B0X2xvbmcoYXJnYywgYXJndiwgIkw6OmhWenIiLCBsb25nb3B0
cywgTlVMTCkpICE9IC0xKSB7Ci0rCXdoaWxlKChjID0gZ2V0b3B0X2xvbmcoYXJnYywgYXJndiwg
ImI6TDo6aFZ6ciIsIGxvbmdvcHRzLCBOVUxMKSkgIT0gLTEpIHsKLSAJCXN3aXRjaChjKSB7Ci0r
CQljYXNlICdiJzoKLSsJCQl1c2VyX3NzID0gc3RydG91MzJfb3JfZXJyKG9wdGFyZywKLSsJCQkJ
CV8oImludmFsaWQgc2VjdG9yIHNpemUgYXJndW1lbnQiKSk7Ci0rCQkJaWYgKHVzZXJfc3MgIT0g
NTEyICYmIHVzZXJfc3MgIT0gMTAyNCAmJgotKwkJCSAgICB1c2VyX3NzICE9IDIwNDggJiYgdXNl
cl9zcyAhPSA0MDk2KQotKwkJCQllcnJ4KEVYSVRfRkFJTFVSRSwgXygiaW52YWxpZCBzZWN0b3Ig
c2l6ZSBhcmd1bWVudCIpKTsKLSsJCQlicmVhazsKLSAJCWNhc2UgJ2gnOgotIAkJCXVzYWdlKCk7
Ci0gCQkJYnJlYWs7Ci1AQCAtMjgxMSw2ICsyODIyLDggQEAgaW50IG1haW4oaW50IGFyZ2MsIGNo
YXIgKmFyZ3ZbXSkKLSAJY2YtPmN4dCA9IGZkaXNrX25ld19jb250ZXh0KCk7Ci0gCWlmICghY2Yt
PmN4dCkKLSAJCWVycihFWElUX0ZBSUxVUkUsIF8oImZhaWxlZCB0byBhbGxvY2F0ZSBsaWJmZGlz
ayBjb250ZXh0IikpOwotKwlpZiAodXNlcl9zcykKLSsJCWZkaXNrX3NhdmVfdXNlcl9zZWN0b3Jf
c2l6ZShjZi0+Y3h0LCB1c2VyX3NzLCB1c2VyX3NzKTsKLSAKLSAJZmRpc2tfc2V0X2FzayhjZi0+
Y3h0LCBhc2tfY2FsbGJhY2ssICh2b2lkICopIGNmKTsKLSAKLS0tIAotMi4yNS4xCi0KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAyLXNmZGlz
ay1hZGQtc2VjdG9yLXNpemUtY29tbWFuYW5kLWxpbmUtb3B0aW9uLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDItc2ZkaXNrLWFkZC1zZWN0b3Itc2l6
ZS1jb21tYW5hbmQtbGluZS1vcHRpb24ucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDhkNDdkOGRlNzEuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4LzAwMDItc2ZkaXNrLWFkZC1zZWN0b3Itc2l6ZS1jb21tYW5hbmQtbGlu
ZS1vcHRpb24ucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwxMDUgKzAsMCBAQAotRnJvbSA5NjU3
MGMwM2Y0NmUwYTVjMTdlNzIxNzM3YTM4YzcxN2M2N2UzNThiIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQotRnJvbTogS2FyZWwgWmFrIDxremFrQHJlZGhhdC5jb20+Ci1EYXRlOiBNb24sIDE0IE9j
dCAyMDI0IDE1OjUwOjQwICswMjAwCi1TdWJqZWN0OiBbUEFUQ0ggMi8yXSBzZmRpc2s6IGFkZCAt
LXNlY3Rvci1zaXplIGNvbW1hbmFuZCBsaW5lIG9wdGlvbgotCi0qIGltcHJvdmVzIGNvbXBhdGli
aWxpdHkgd2l0aCBmZGlzawotKiBhZGQgYWJpbGl0eSB0byB3b3JrIHdpdGggZGlzayBpbWFnZXMg
d2hlcmUgbGliZmRpc2sgZGVmYXVsdHMgdG8gNTEyCi0KLUFkZHJlc3NlczogaHR0cHM6Ly9naXRo
dWIuY29tL3V0aWwtbGludXgvdXRpbC1saW51eC9wdWxsLzMyMzUKLVNpZ25lZC1vZmYtYnk6IEth
cmVsIFphayA8a3pha0ByZWRoYXQuY29tPgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtl
ZjdiNzZiYWExN2RkYjU0MTQ2OTFmYThmNDlkNjE0MTVjMzA4NzFjXQotCi1TaWduZWQtb2ZmLWJ5
OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+Ci0tLS0KLSBkaXNrLXV0aWxzL3NmZGlz
ay44LmFkb2MgfCAgNSArKysrLQotIGRpc2stdXRpbHMvc2ZkaXNrLmMgICAgICB8IDE0ICsrKysr
KysrKysrKysrCi0gMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCi0KLWRpZmYgLS1naXQgYS9kaXNrLXV0aWxzL3NmZGlzay44LmFkb2MgYi9kaXNrLXV0aWxz
L3NmZGlzay44LmFkb2MKLWluZGV4IGJjM2ZmOWJiOC4uZDFlYWEzNzEyIDEwMDY0NAotLS0tIGEv
ZGlzay11dGlscy9zZmRpc2suOC5hZG9jCi0rKysgYi9kaXNrLXV0aWxzL3NmZGlzay44LmFkb2MK
LUBAIC0yMDEsNiArMjAxLDkgQEAgVGhlIGRlZmF1bHQgbGlzdCBvZiBjb2x1bW5zIG1heSBiZSBl
eHRlbmRlZCBpZiBfbGlzdF8gaXMgc3BlY2lmaWVkIGluIHRoZSBmb3JtYXQKLSAqLXEqLCAqLS1x
dWlldCo6OgotIFN1cHByZXNzIGV4dHJhIGluZm8gbWVzc2FnZXMuCi0gCi0rKi0tc2VjdG9yLXNp
emUqIF9zZWN0b3JzaXplXzo6Ci0rU3BlY2lmeSB0aGUgc2VjdG9yIHNpemUgb2YgdGhlIGRpc2su
IFZhbGlkIHZhbHVlcyBhcmUgNTEyLCAxMDI0LCAyMDQ4LCBhbmQgNDA5Ni4gVGhlIGtlcm5lbCBp
cyBhd2FyZSBvZiB0aGUgc2VjdG9yIHNpemUgZm9yIHJlZ3VsYXIgYmxvY2sgZGV2aWNlcy4gVXNl
IHRoaXMgb3B0aW9uIG9ubHkgb24gdmVyeSBvbGQga2VybmVscywgd2hlbiB3b3JraW5nIHdpdGgg
ZGlzayBpbWFnZXMsIG9yIHRvIG92ZXJyaWRlIHRoZSBrZXJuZWwncyBkZWZhdWx0IHNlY3RvciBz
aXplLiBTaW5jZSB1dGlsLWxpbnV4LTIuMTcsICpmZGlzayogZGlzdGluZ3Vpc2hlcyBiZXR3ZWVu
IGxvZ2ljYWwgYW5kIHBoeXNpY2FsIHNlY3RvciBzaXplLiBUaGlzIG9wdGlvbiBjaGFuZ2VzIGJv
dGggc2VjdG9yIHNpemVzIHRvIHRoZSBzcGVjaWZpZWQgX3NlY3RvcnNpemVfLgotKwotICotdSos
ICotLXVuaXQgUyo6OgotIERlcHJlY2F0ZWQgb3B0aW9uLiBPbmx5IHRoZSBzZWN0b3IgdW5pdCBp
cyBzdXBwb3J0ZWQuIFRoaXMgb3B0aW9uIGlzIG5vdCBzdXBwb3J0ZWQgd2hlbiB1c2luZyB0aGUg
Ki0tc2hvdy1zaXplKiBjb21tYW5kLgotIAotQEAgLTI0OSw3ICsyNTIsNyBAQCBTcGVjaWZ5IHRo
ZSBtYXhpbWFsIG51bWJlciBvZiBHUFQgcGFydGl0aW9ucy4KLSAqZ3JhaW4qOjoKLSBTcGVjaWZ5
IG1pbmltYWwgc2l6ZSBpbiBieXRlcyB1c2VkIHRvIGNhbGN1bGF0ZSBwYXJ0aXRpb25zIGFsaWdu
bWVudC4gVGhlIGRlZmF1bHQgaXMgMU1pQiBhbmQgaXQncyBzdHJvbmdseSByZWNvbW1lbmRlZCB0
byB1c2UgdGhlIGRlZmF1bHQuIERvIG5vdCBtb2RpZnkgdGhpcyB2YXJpYWJsZSBpZiB5b3UncmUg
bm90IHN1cmUuCi0gKnNlY3Rvci1zaXplKjo6Ci0tU3BlY2lmeSBzZWN0b3Igc2l6ZS4gKnNmZGlz
ayogYWx3YXlzIHVzZXMgZGV2aWNlIHNlY3RvciBzaXplLiBTaW5jZSB2ZXJzaW9uIDIuMzkgKnNm
ZGlzayogcmVjYWxjdWxhdGVzIHNpemVzIGZyb20gZHVtcCBpZiB0aGUgc2NyaXB0IGFuZCBkZXZp
Y2Ugc2VjdG9yIHNpemUgZGlmZmVyLgotK1NwZWNpZmllcyB0aGUgc2VjdG9yIHNpemUgdXNlZCBp
biB0aGUgaW5wdXQuICpzZmRpc2sqIGFsd2F5cyBpbnRlcm5hbGx5IHVzZXMgdGhlIGRldmljZSBz
ZWN0b3Igc2l6ZSBwcm92aWRlZCBieSB0aGUga2VybmVsIGZvciB0aGUgYmxvY2sgZGV2aWNlLCBv
ciBhcyBzcGVjaWZpZWQgYnkgdGhlIHVzZXIgb24gdGhlIGNvbW1hbmQgbGluZSAoc2VlICotLXNl
Y3Rvci1zaXplKikuIFN0YXJ0aW5nIHdpdGggdmVyc2lvbiAyLjM5LCAqc2ZkaXNrKiByZWNhbGN1
bGF0ZXMgc2l6ZXMgZnJvbSB0aGUgaW5wdXQgaWYgdGhlICpzZWN0b3Itc2l6ZSogaGVhZGVyIGFu
ZCBkZXZpY2Ugc2VjdG9yIHNpemUgYXJlIGRpZmZlcmVudC4KLSAKLSBOb3RlIHRoYXQgaXQgaXMg
b25seSBwb3NzaWJsZSB0byB1c2UgaGVhZGVyIGxpbmVzIGJlZm9yZSB0aGUgZmlyc3QgcGFydGl0
aW9uIGlzIHNwZWNpZmllZCBpbiB0aGUgaW5wdXQuCi0gCi1kaWZmIC0tZ2l0IGEvZGlzay11dGls
cy9zZmRpc2suYyBiL2Rpc2stdXRpbHMvc2ZkaXNrLmMKLWluZGV4IGQ4ZGQ4ZDI5Ni4uOTdkNDI2
NTU5IDEwMDY0NAotLS0tIGEvZGlzay11dGlscy9zZmRpc2suYwotKysrIGIvZGlzay11dGlscy9z
ZmRpc2suYwotQEAgLTIwODQsNiArMjA4NCw4IEBAIHN0YXRpYyB2b2lkIF9fYXR0cmlidXRlX18o
KF9fbm9yZXR1cm5fXykpIHVzYWdlKHZvaWQpCi0gCSAgICAgIF8oIiAgICAgLS1jb2xvcls9PHdo
ZW4+XSAgICAgIGNvbG9yaXplIG91dHB1dCAoJXMsICVzIG9yICVzKVxuIiksICJhdXRvIiwgImFs
d2F5cyIsICJuZXZlciIpOwotIAlmcHJpbnRmKG91dCwKLSAJICAgICAgICAiICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAlc1xuIiwgVVNBR0VfQ09MT1JTX0RFRkFVTFQpOwotKwlmcHV0cyhf
KCIgICAgIC0tc2VjdG9yLXNpemUgPHNpemU+ICBwaHlzaWNhbCBhbmQgbG9naWNhbCBzZWN0b3Ig
c2l6ZVxuIiksIG91dCk7Ci0rCi0gCWZwcmludGYob3V0LAotIAkgICAgICBfKCIgICAgIC0tbG9j
a1s9PG1vZGU+XSAgICAgICB1c2UgZXhjbHVzaXZlIGRldmljZSBsb2NrICglcywgJXMgb3IgJXMp
XG4iKSwgInllcyIsICJubyIsICJub25ibG9jayIpOwotIAlmcHV0cyhfKCIgLU4sIC0tcGFydG5v
IDxudW0+ICAgICAgICBzcGVjaWZ5IHBhcnRpdGlvbiBudW1iZXJcbiIpLCBvdXQpOwotQEAgLTIx
MjAsNiArMjEyMiw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCi0gCWNvbnN0
IGNoYXIgKm91dGFyZyA9IE5VTEw7Ci0gCWludCByYyA9IC1FSU5WQUwsIGMsIGxvbmdpZHggPSAt
MSwgYnl0ZXMgPSAwOwotIAlpbnQgY29sb3Jtb2RlID0gVUxfQ09MT1JNT0RFX1VOREVGOwotKwlz
aXplX3QgdXNlcl9zcyA9IDA7Ci0gCXN0cnVjdCBzZmRpc2sgX3NmID0gewotIAkJLnBhcnRubyA9
IC0xLAotIAkJLndpcGVtb2RlID0gV0lQRU1PREVfQVVUTywKLUBAIC0yMTQ1LDYgKzIxNDgsNyBA
QCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQotIAkJT1BUX05PVEVMTCwKLSAJCU9Q
VF9SRUxPQ0FURSwKLSAJCU9QVF9MT0NLLAotKwkJT1BUX1NFQ1RPUlNJWkUKLSAJfTsKLSAKLSAJ
c3RhdGljIGNvbnN0IHN0cnVjdCBvcHRpb24gbG9uZ29wdHNbXSA9IHsKLUBAIC0yMTc0LDYgKzIx
NzgsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQotIAkJeyAib3V0cHV0Iiwg
IHJlcXVpcmVkX2FyZ3VtZW50LCBOVUxMLCAnbycgfSwKLSAJCXsgInBhcnRubyIsICByZXF1aXJl
ZF9hcmd1bWVudCwgTlVMTCwgJ04nIH0sCi0gCQl7ICJyZW9yZGVyIiwgbm9fYXJndW1lbnQsICAg
ICAgIE5VTEwsICdyJyB9LAotKwkJeyAic2VjdG9yLXNpemUiLCByZXF1aXJlZF9hcmd1bWVudCwg
TlVMTCwgT1BUX1NFQ1RPUlNJWkUgfSwKLSAJCXsgInNob3ctZ2VvbWV0cnkiLCBub19hcmd1bWVu
dCwgTlVMTCwgJ2cnIH0sCi0gCQl7ICJxdWlldCIsICAgbm9fYXJndW1lbnQsICAgICAgIE5VTEws
ICdxJyB9LAotIAkJeyAidmVyaWZ5IiwgIG5vX2FyZ3VtZW50LCAgICAgICBOVUxMLCAnVicgfSwK
LUBAIC0yMzczLDYgKzIzNzgsMTMgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkK
LSAJCQkJc2YtPmxvY2ttb2RlID0gb3B0YXJnOwotIAkJCX0KLSAJCQlicmVhazsKLSsJCWNhc2Ug
T1BUX1NFQ1RPUlNJWkU6Ci0rCQkJdXNlcl9zcyA9IHN0cnRvdTMyX29yX2VycihvcHRhcmcsCi0r
CQkJCQlfKCJpbnZhbGlkIHNlY3RvciBzaXplIGFyZ3VtZW50IikpOwotKwkJCWlmICh1c2VyX3Nz
ICE9IDUxMiAmJiB1c2VyX3NzICE9IDEwMjQgJiYKLSsJCQkgICAgdXNlcl9zcyAhPSAyMDQ4ICYm
IHVzZXJfc3MgIT0gNDA5NikKLSsJCQkJZXJyeChFWElUX0ZBSUxVUkUsIF8oImludmFsaWQgc2Vj
dG9yIHNpemUgYXJndW1lbnQiKSk7Ci0rCQkJYnJlYWs7Ci0gCQlkZWZhdWx0OgotIAkJCWVycnRy
eWhlbHAoRVhJVF9GQUlMVVJFKTsKLSAJCX0KLUBAIC0yMzgzLDYgKzIzOTUsOCBAQCBpbnQgbWFp
bihpbnQgYXJnYywgY2hhciAqYXJndltdKQotIAlzZmRpc2tfaW5pdChzZik7Ci0gCWlmIChieXRl
cykKLSAJCWZkaXNrX3NldF9zaXplX3VuaXQoc2YtPmN4dCwgRkRJU0tfU0laRVVOSVRfQllURVMp
OwotKwlpZiAodXNlcl9zcykKLSsJCWZkaXNrX3NhdmVfdXNlcl9zZWN0b3Jfc2l6ZShzZi0+Y3h0
LCB1c2VyX3NzLCB1c2VyX3NzKTsKLSAKLSAJaWYgKG91dGFyZykKLSAJCWluaXRfZmllbGRzKE5V
TEwsIG91dGFyZywgTlVMTCk7Ci0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvYXZvaWRfcGFyYWxsZWxf
dGVzdHMucGF0Y2gKaW5kZXggOGVhMDBkYmI5NS4uMjgyOGEzYzA4NSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3Rz
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9hdm9p
ZF9wYXJhbGxlbF90ZXN0cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZGE1OGI0MTUwZjY5
MzJkZTM2Yzk2MmVhNjU3NzEzYmNmNGVhNDRiZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gZGQwZjY5N2FmYjY0Mzc3NmUwM2UzNzEwZTkxMGY1M2RlYjNkNTMwNiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IFR1ZG9yIEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgog
RGF0ZTogTW9uLCAxNCBKdW4gMjAyMSAxNDowMDozMSArMDIwMAogU3ViamVjdDogW1BBVENIXSB1
dGlsLWxpbnV4OiBBZGQgcHRlc3QKQEAgLTE0LDcgKzE0LDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBJ
bmFwcHJvcHJpYXRlCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDY1
MWVmMmIuLjJhODAxMmUgMTAwNjQ0CitpbmRleCA0M2EyM2E1Li40YTg0NTMxIDEwMDY0NAogLS0t
IGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC0xMSw3ICsxMSw3IEBAIEFD
X0NPTkZJR19NQUNST19ESVIoW200XSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0
aWwtbGludXgvdXRpbC1saW51eC9jb25maWd1cmUtc2JpbmRpci5wYXRjaCBiL21ldGEvcmVjaXBl
cy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9jb25maWd1cmUtc2JpbmRpci5wYXRjaAppbmRl
eCA3NGFiZGMyMDM4Li44ODU5ZWQwNTIzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91
dGlsLWxpbnV4L3V0aWwtbGludXgvY29uZmlndXJlLXNiaW5kaXIucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbmZpZ3VyZS1zYmluZGlyLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMzg3ZDcxNTE2Yzk3ODg5OWNmZDU1NmNhNTEyZjUzMGEy
MTJiNGE5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiZDk0YjRiNmFmOTdlNTI3YjQ2
ZTcxYTQwMGUwMjg1NWQzYjNkMWY3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGhp
bCBCbHVuZGVsbCA8cGJAcGJjbC5uZXQ+CiBEYXRlOiBNb24sIDI0IFNlcCAyMDEyIDA3OjI0OjUx
ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHV0aWwtbGludXg6IEVuc3VyZSB0aGF0ICR7c2JpbmRp
cn0gaXMgcmVzcGVjdGVkCkBAIC0xNCw3ICsxNCw3IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHBy
b3ByaWF0ZSBbY29uZmlndXJhdGlvbl0KICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUu
YWMKLWluZGV4IDIzNTk0ZmYuLjY1MWVmMmIgMTAwNjQ0CitpbmRleCBhNWQ5MTAyLi40M2EyM2E1
IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC0xMTAs
NyArMTEwLDEwIEBAIEFDX1NVQlNUKFtydW5zdGF0ZWRpcl0pCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3Vi
dGVzdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9kaXNw
bGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoCmluZGV4IDg3MWIwYjJkMzAuLjU0MWMxZWI4
NGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9k
aXNwbGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3Jl
L3V0aWwtbGludXgvdXRpbC1saW51eC9kaXNwbGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NTQ1MGQwMzM5Y2Q3ZWUyN2Y1M2MwZjJmYWMxY2M3NGVk
OWJiZmI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4OWM3MjI5NGIwNjIwMTdmOTkx
YmE0OTkzNzQ4NjA5ZWVmZjBiM2JiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVHVk
b3IgRmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBEYXRlOiBUaHUsIDMgRGVjIDIwMTUg
MDQ6MDg6MDAgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gRGlzcGxheSB0ZXN0bmFtZSBmb3Igc3Vi
dGVzdApAQCAtMTAsMTAgKzEwLDEwIEBAIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
dGVzdHMvZnVuY3Rpb25zLnNoIGIvdGVzdHMvZnVuY3Rpb25zLnNoCi1pbmRleCA1ZmU1YmEwLi5h
NmM3MDNlIDEwMDY0NAoraW5kZXggMWQ3YTQyNS4uYjFmMDk4NiAxMDA2NDQKIC0tLSBhL3Rlc3Rz
L2Z1bmN0aW9ucy5zaAogKysrIGIvdGVzdHMvZnVuY3Rpb25zLnNoCi1AQCAtNDUwLDcgKzQ1MCw3
IEBAIGZ1bmN0aW9uIHRzX2luaXRfc3VidGVzdCB7CitAQCAtNDU1LDcgKzQ1NSw3IEBAIGZ1bmN0
aW9uIHRzX2luaXRfc3VidGVzdCB7CiAgCiAgCWlmIFsgIiRUU19QQVJTQUJMRSIgIT0gInllcyIg
XTsgdGhlbgogIAkJWyAkVFNfTlNVQlRFU1RTIC1lcSAxIF0gJiYgZWNobwpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L3B0ZXN0LnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L3B0ZXN0LnBhdGNoCmluZGV4IDcz
NDU5MjZiODguLmUxZDkxMjNhYmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGls
LWxpbnV4L3V0aWwtbGludXgvcHRlc3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY5YmU3
M2MzZTJiMGE0ZjA5MjM5NTBkY2IwNThiZTg1ZDNlZThlZDcgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDczZTU2NWE3NjFjZjY4Mzk0NzZhYmM3Mzk1OWFlNzM0MDI0YzNjZGQgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRvciBGbG9yZWEgPHR1ZG9yLmZsb3JlYUBlbmVh
LmNvbT4KIERhdGU6IFRodSwgMyBEZWMgMjAxNSAwNDowODowMCArMDEwMAogU3ViamVjdDogW1BB
VENIXSBEZWZpbmUgVEVTVFMgdmFyaWFibGUKQEAgLTEwLDEwICsxMCwxMCBAQCBVcHN0cmVhbS1T
dGF0dXM6IFBlbmRpbmcKICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAt
LWdpdCBhL01ha2VmaWxlLmFtIGIvTWFrZWZpbGUuYW0KLWluZGV4IDUwYWI4ZDAuLjdlMjM0MGQg
MTAwNjQ0CitpbmRleCAwMWU5OTcwLi5jMzMxM2ZmIDEwMDY0NAogLS0tIGEvTWFrZWZpbGUuYW0K
ICsrKyBiL01ha2VmaWxlLmFtCi1AQCAtNjQsNiArNjQsNyBAQCB0bXBmaWxlc19EQVRBID0KK0BA
IC02Niw2ICs2Niw3IEBAIHN5c3VzZXJzX0RBVEEgPQogIGRpc3RfYmFzaGNvbXBsZXRpb25fREFU
QSA9CiAgY2hlY2tfUFJPR1JBTVMgPQogIGRpc3RfY2hlY2tfU0NSSVBUUyA9CmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXhfMi40MC40LmJiIGIvbWV0
YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4XzIuNDEuYmIKc2ltaWxhcml0eSBp
bmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4XzIuNDAuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGls
LWxpbnV4XzIuNDEuYmIKaW5kZXggODFiZDI5OGRkOS4uNjA0NGQ0YWUxYyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4XzIuNDAuNC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXhfMi40MS5iYgpAQCAtMSwzICsx
LDI1IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVw
ZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNl
IHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNo
YW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcu
CisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicp
CisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gUkVBRE1FLmxpY2Vuc2luZworIyArKysgUkVB
RE1FLmxpY2Vuc2luZworIyBAQCAtMjAsNiArMjAsOCBAQAorIyAgCisjICAgICAqIEJTRC00LUNs
YXVzZS1VQyAgICAtIEJTRCA0LUNsYXVzZSBVbml2ZXJzaXR5IG9mIENhbGlmb3JuaWEtU3BlY2lm
aWMKKyMgIAorIyArICAgKiBFVVBMLTEuMiAgICAgICAgICAgLSBFdXJvcGVhbiBVbmlvbiBQdWJs
aWMgTGljZW5jZSB2ZXJzaW9uIDEuMgorIyArCisjICAgICAqIFB1YmxpYyBEb21haW4KKyMgIAor
IyAgUGxlYXNlLCBjaGVjayB0aGUgc291cmNlIGNvZGUgZm9yIG1vcmUgZGV0YWlscy4gQSBsaWNl
bnNlIGlzIHVzdWFsbHkgYXQgdGhlIHN0YXJ0CisjIAorIworCiByZXF1aXJlIHV0aWwtbGludXgu
aW5jCiAKIGluaGVyaXQgYXV0b3Rvb2xzIGdldHRleHQgbWFucGFnZXMgcGtnY29uZmlnIHN5c3Rl
bWQgdXBkYXRlLWFsdGVybmF0aXZlcyBweXRob24zLWRpciBiYXNoLWNvbXBsZXRpb24gcHRlc3Qg
Z3RrLWRvYwotLSAKMi40Ny4xCgo=

--===============7680730796056585164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/e2fsprogs/e2fsprogs-dbg: PKGSIZE changed from 5786896 to 5786872 (-0%)
packages/core2-64-poky-linux/systemd/systemd-dbg: PKGSIZE changed from 122966896 to 122966904 (+0%)
packages/core2-64-poky-linux/util-linux-libuuid: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux-libuuid: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.4.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c file://0001-cfdisk-add-sector-size-commanand-line-option.patch file://0002-sfdisk-add-sector-size-commanand-line-option.patch" to "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c"
packages/core2-64-poky-linux/util-linux-libuuid: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PKGSIZE changed from 66592 to 69240 (+4%)
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PKGSIZE changed from 4367 to 4566 (+5%)
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-doc: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-doc: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-locale: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-locale: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-staticdev: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-staticdev: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid: PKGSIZE changed from 34952 to 39048 (+12%)
packages/core2-64-poky-linux/util-linux: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.4.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c file://0001-cfdisk-add-sector-size-commanand-line-option.patch file://0002-sfdisk-add-sector-size-commanand-line-option.patch" to "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c"
packages/core2-64-poky-linux/util-linux: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux: PACKAGES: added "util-linux-coresched util-linux-bits"
packages/core2-64-poky-linux/util-linux/util-linux-addpart: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-addpart: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-agetty: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-agetty: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-bash-completion: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-bash-completion: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-bash-completion: PKGSIZE changed from 108898 to 110951 (+2%)
packages/core2-64-poky-linux/util-linux/util-linux-blkdiscard: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-blkdiscard: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkid: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-blkid: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkid: PKGSIZE changed from 137376 to 141472 (+3%)
packages/core2-64-poky-linux/util-linux/util-linux-blkpr: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-blkpr: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkzone: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-blkzone: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkzone: PKGSIZE changed from 88184 to 92280 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-blockdev: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-blockdev: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blockdev: PKGSIZE changed from 88192 to 92288 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-cal: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-cal: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-cfdisk: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-cfdisk: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chcpu: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-chcpu: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chfn: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-chfn: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chfn: PKGSIZE changed from 39032 to 55424 (+42%)
packages/core2-64-poky-linux/util-linux/util-linux-chmem: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-chmem: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-choom: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-choom: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chrt: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-chrt: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chsh: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-chsh: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chsh: PKGSIZE changed from 34936 to 51328 (+47%)
packages/core2-64-poky-linux/util-linux/util-linux-col: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-col: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-colcrt: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-colcrt: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-colrm: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-colrm: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-column: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-column: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-column: PKGSIZE changed from 59512 to 63608 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-ctrlaltdel: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-ctrlaltdel: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dbg: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-dbg: FILELIST: added "/usr/lib/util-linux/ptest/.debug/sample-mount-statmount /usr/lib/util-linux/ptest/.debug/test_uuid_time /usr/bin/.debug/bits /usr/lib/util-linux/ptest/.debug/sample-scols-wrap-repeat /usr/bin/.debug/coresched /usr/lib/util-linux/ptest/.debug/sample-mount-listmount /usr/lib/util-linux/ptest/.debug/test_sigstate"
packages/core2-64-poky-linux/util-linux/util-linux-dbg: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dbg: PKGSIZE changed from 28526048 to 30100400 (+6%)
packages/core2-64-poky-linux/util-linux/util-linux-delpart: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-delpart: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dev: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-dev: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dev: PKGSIZE changed from 111878 to 115388 (+3%)
packages/core2-64-poky-linux/util-linux/util-linux-dmesg: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-dmesg: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-doc: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-doc: FILELIST: added "/usr/share/man/man1/bits.1 /usr/share/man/man1/coresched.1"
packages/core2-64-poky-linux/util-linux/util-linux-doc: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-doc: PKGSIZE changed from 927021 to 965804 (+4%)
packages/core2-64-poky-linux/util-linux/util-linux-eject: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-eject: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-enosys: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-enosys: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-enosys: PKGSIZE changed from 51320 to 59512 (+16%)
packages/core2-64-poky-linux/util-linux/util-linux-exch: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-exch: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fadvise: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-fadvise: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fallocate: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-fallocate: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fcntl-lock: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-fcntl-lock: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fdisk: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-fdisk: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fdisk: PKGSIZE changed from 170160 to 174256 (+2%)
packages/core2-64-poky-linux/util-linux/util-linux-fincore: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-fincore: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-findfs: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-findfs: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-findmnt: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-findmnt: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-findmnt: PKGSIZE changed from 89688 to 97928 (+9%)
packages/core2-64-poky-linux/util-linux/util-linux-flock: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-flock: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fsck.cramfs: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-fsck.cramfs: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fsck: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-fsck: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fsck: PKGSIZE changed from 59568 to 59520 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-fsfreeze: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-fsfreeze: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fstrim: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-fstrim: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-getopt: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-getopt: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-hardlink: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-hardlink: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-hardlink: PKGSIZE changed from 59624 to 63712 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-hexdump: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-hexdump: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-hwclock: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-hwclock: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ionice: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-ionice: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ipcmk: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-ipcmk: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ipcrm: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-ipcrm: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ipcrm: PKGSIZE changed from 34944 to 75904 (+117%)
packages/core2-64-poky-linux/util-linux/util-linux-ipcs: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-ipcs: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ipcs: PKGSIZE changed from 80000 to 84096 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-irqtop: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-irqtop: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-irqtop: PKGSIZE changed from 59688 to 63784 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-isosize: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-isosize: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-kill: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-kill: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-kill: PKGSIZE changed from 71808 to 75904 (+6%)
packages/core2-64-poky-linux/util-linux/util-linux-last: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-last: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lastlog2: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lastlog2: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ldattach: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-ldattach: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libblkid: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-libblkid: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libblkid: PKGSIZE changed from 384025 to 388057 (+1%)
packages/core2-64-poky-linux/util-linux/util-linux-libfdisk: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-libfdisk: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libfdisk: PKGSIZE changed from 518321 to 522417 (+1%)
packages/core2-64-poky-linux/util-linux/util-linux-liblastlog2: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-liblastlog2: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libmount: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-libmount: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libmount: PKGSIZE changed from 461481 to 482001 (+4%)
packages/core2-64-poky-linux/util-linux/util-linux-libsmartcols: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-libsmartcols: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libsmartcols: PKGSIZE changed from 301205 to 309397 (+3%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ca: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ca: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-cs: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-cs: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-cs: PKGSIZE changed from 588560 to 573925 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-da: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-da: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-da: PKGSIZE changed from 399757 to 391984 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-de: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-de: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-de: PKGSIZE changed from 587327 to 574034 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PKGSIZE changed from 562594 to 556097 (-1%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-et: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-et: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-eu: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-eu: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-fi: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-fi: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-fi: PKGSIZE changed from 80506 to 79928 (-1%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-fr: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-fr: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-fr: PKGSIZE changed from 601690 to 629848 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-gl: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-gl: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-hr: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-hr: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-hr: PKGSIZE changed from 577068 to 603531 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-hu: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-hu: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-id: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-id: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-it: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-it: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ja: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ja: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ja: PKGSIZE changed from 652723 to 637195 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ka: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ka: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ka: PKGSIZE changed from 56609 to 56303 (-1%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ko: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ko: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ko: PKGSIZE changed from 589630 to 618010 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PKGSIZE changed from 330471 to 496173 (+50%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pl: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-pl: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-pl: PKGSIZE changed from 582098 to 609556 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt-br: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt-br: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt-br: PKGSIZE changed from 517533 to 507272 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PKGSIZE changed from 476352 to 466733 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ro: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ro: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ro: PKGSIZE changed from 612239 to 641092 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ru: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ru: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ru: PKGSIZE changed from 198243 to 197168 (-1%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-sk: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sk: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sl: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sl: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sr: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sr: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sr: PKGSIZE changed from 716920 to 699887 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-sv: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sv: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sv: PKGSIZE changed from 444868 to 435493 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-tr: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-tr: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-tr: PKGSIZE changed from 348477 to 342109 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-uk: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-uk: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-uk: PKGSIZE changed from 750185 to 784402 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-vi: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-vi: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-vi: PKGSIZE changed from 315396 to 310865 (-1%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-cn: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-cn: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-cn: PKGSIZE changed from 392150 to 385216 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-tw: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-tw: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-logger: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-logger: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-look: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-look: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-losetup: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-losetup: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsblk: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lsblk: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsblk: PKGSIZE changed from 235640 to 239736 (+2%)
packages/core2-64-poky-linux/util-linux/util-linux-lsclocks: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lsclocks: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lscpu: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lscpu: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lscpu: PKGSIZE changed from 161912 to 166008 (+3%)
packages/core2-64-poky-linux/util-linux/util-linux-lsfd: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lsfd: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsfd: PKGSIZE changed from 216296 to 232744 (+8%)
packages/core2-64-poky-linux/util-linux/util-linux-lsipc: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lsipc: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsipc: PKGSIZE changed from 100472 to 112760 (+12%)
packages/core2-64-poky-linux/util-linux/util-linux-lsirq: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lsirq: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsirq: PKGSIZE changed from 39208 to 47400 (+21%)
packages/core2-64-poky-linux/util-linux/util-linux-lslocks: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lslocks: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lslogins: RDEPENDS: added "util-linux-liblastlog2 (['>= 2.41'])"
packages/core2-64-poky-linux/util-linux/util-linux-lslogins: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lslogins: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lslogins: PKGSIZE changed from 100472 to 104568 (+4%)
packages/core2-64-poky-linux/util-linux/util-linux-lsmem: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lsmem: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsns: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lsns: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsns: PKGSIZE changed from 84088 to 92280 (+10%)
packages/core2-64-poky-linux/util-linux/util-linux-mcookie: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-mcookie: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mesg: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-mesg: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mkfs.cramfs: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-mkfs.cramfs: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mkfs: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-mkfs: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mkswap: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-mkswap: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-more: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-more: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mount: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-mount: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mount: PKGSIZE changed from 63652 to 67748 (+6%)
packages/core2-64-poky-linux/util-linux/util-linux-mountpoint: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-mountpoint: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-namei: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-namei: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-nologin: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-nologin: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-nsenter: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-nsenter: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-nsenter: PKGSIZE changed from 80272 to 84368 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-partx: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-partx: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-pipesz: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-pipesz: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-pivot-root: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-pivot-root: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-prlimit: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-prlimit: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ptest: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-ptest: FILELIST: added "/usr/lib/util-linux/ptest/tests/ts/lsfd/error-eperm /usr/lib/util-linux/ptest/tests/expected/misc/bits-parse-range /usr/lib/util-linux/ptest/tests/ts/lsns/netns-from-sock /usr/lib/util-linux/ptest/tests/expected/lscpu/lscpu-rv64-milkvpioneer /usr/lib/util-linux/ptest/tests/expected/blkid/output-value-cache /usr/lib/util-linux/ptest/tests/expected/blkid/output-value-probe /usr/lib/util-linux/ptest/tests/expected/misc/bits-binary /usr/lib/util-linux/ptest/tests/expected/lsfd/option-hyperlink-deleted-file /usr/lib/util-linux/ptest/tests/ts/lsfd/mkfds-foreign-sockets /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-nameval-neg /usr/lib/util-linux/ptest/tests/expected/misc/bits-and /usr/lib/util-linux/ptest/tests/ts/schedutils/coresched /usr/lib/util-linux/ptest/tests/expected/kill/decode /usr/lib/util-linux/ptest/tests/expected/lsns/filter /usr/lib/util-linux/ptest/tests/ts/lsfd/mkfds-vsock /usr/li
 b/util-linux/ptest/tests/expected/misc/flock-fcntl-exclusive /usr/lib/util-linux/ptest/tests/expected/misc/bits-parse-grouped-mask /usr/lib/util-linux/ptest/tests/expected/schedutils/set-cookie-parent-pid /usr/lib/util-linux/ptest/tests/expected/misc/bits-truncate /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-nameval /usr/lib/util-linux/ptest/tests/expected/lsfd/error-eperm /usr/lib/util-linux/ptest/tests/expected/colcrt/regressions-crash2.err /usr/lib/util-linux/ptest/test_sigstate /usr/lib/util-linux/ptest/tests/expected/blkid/output-udev-probe /usr/lib/util-linux/ptest/tests/expected/misc/bits-not /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-set-cookie-parent-pid.err /usr/lib/util-linux/ptest/tests/expected/misc/bits-width /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-copy-from-child-to-parent /usr/lib/util-linux/ptest/tests/ts/findmnt/listmount /usr/lib/util-linux/ptest/tests/ts/blkid/blkid-output.img.xz /usr/lib/util-linux/pte
 st/tests/expected/blkid/output-export-cache /usr/lib/util-linux/ptest/tests/ts/setpriv/seccomp /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-types-multi /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-get-cookie-parent-pid /usr/lib/util-linux/ptest/tests/expected/lsfd/mkfds-vsock /usr/lib/util-linux/ptest/tests/ts/lsfd/option-hyperlink /usr/lib/util-linux/ptest/tests/ts/lsfd/error-eaccess /usr/lib/util-linux/ptest/sample-mount-listmount /usr/lib/util-linux/ptest/tests/ts/column/files/ansiescape /usr/lib/util-linux/ptest/tests/ts/lsns/filter /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-timeout /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-no-fork /usr/lib/util-linux/ptest/sample-scols-wrap-repeat /usr/lib/util-linux/ptest/tests/ts/lslogins/checkuser /usr/lib/util-linux/ptest/tests/ts/uuid/time /usr/lib/util-linux/ptest/tests/ts/column/ansiescape /usr/lib/util-linux/ptest
 /tests/expected/schedutils/coresched-get-cookie-own-pid /usr/lib/util-linux/ptest/tests/expected/lsfd/mkfds-foreign-sockets /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl /usr/lib/util-linux/ptest/tests/ts/su/environ /usr/lib/util-linux/ptest/tests/expected/liblastlog2/write_read_user.err /usr/lib/util-linux/ptest/tests/expected/misc/optstr /usr/lib/util-linux/ptest/tests/expected/schedutils/chrt-other-custom-slice /usr/lib/util-linux/ptest/tests/expected/blkid/output-json-probe /usr/lib/util-linux/ptest/tests/expected/colcrt/regressions-crash1.err /usr/lib/util-linux/ptest/tests/ts/nsenter/enter-via-socket /usr/lib/util-linux/ptest/tests/ts/cal/terminal-colors.d/cal.scheme /usr/lib/util-linux/ptest/tests/expected/blkid/output-export-probe /usr/lib/util-linux/ptest/tests/ts/misc/bits /usr/lib/util-linux/ptest/tests/expected/misc/bits /usr/lib/util-linux/ptest/tests/expected/lsfd/option-hyperlink-regular-file /usr/lib/util-linux/ptest/tests/expected/blkid/output-json-cache
  /usr/lib/util-linux/ptest/tests/expected/misc/bits-default /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-time-check /usr/lib/util-linux/ptest/tests/expected/misc/bits-stdin /usr/lib/util-linux/ptest/tests/expected/colcrt/regressions-hang1.err /usr/lib/util-linux/ptest/tests/expected/lscpu/lscpu-arm-A510-A710-A715-X3 /usr/lib/util-linux/ptest/tests/expected/blkid/output-device-probe /usr/lib/util-linux/ptest/tests/expected/misc/bits-mask /usr/lib/util-linux/ptest/tests/ts/lslogins/create_db.sql /usr/lib/util-linux/ptest/tests/expected/lsns/netns-from-sock /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-non-block /usr/lib/util-linux/ptest/tests/expected/blkid/output-full-cache /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-shared /usr/lib/util-linux/ptest/tests/ts/blkid/output /usr/lib/util-linux/ptest/tests/expected/mount/xnocanon-file-over-symlink /usr/lib/util-linux/ptest/tests/ts/lsfd/column-source-btrfs /usr/lib/util-linux/ptest/tests/expected/co
 lumn/ansiescape /usr/lib/util-linux/ptest/test_uuid_time /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-fd /usr/lib/util-linux/ptest/tests/expected/uuid/time /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-new-child-with-new-cookie /usr/lib/util-linux/ptest/tests/expected/misc/bits-xor /usr/lib/util-linux/ptest/tests/ts/findmnt/filterQ /usr/lib/util-linux/ptest/tests/ts/lsns/filedesc /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-types-neg /usr/lib/util-linux/ptest/tests/expected/mount/xnocanon-symlink-over-symlink /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-no /usr/lib/util-linux/ptest/tests/expected/misc/bits-parse-mask /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-neg /usr/lib/util-linux/ptest/tests/expected/misc/bits-width-truncate /usr/lib/util-linux/ptest/tests/expected/blkid/output-device-cache /usr/lib/util-linux/ptest/tests/expected/misc/bits-grouped-mask /usr/lib/util-linux/ptest/tests/expected/find
 mnt/filterQ-types /usr/lib/util-linux/ptest/sample-mount-statmount /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-no-multi /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-name /usr/lib/util-linux/ptest/tests/expected/setpriv/seccomp /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-copy-from-parent-to-nested-child /usr/lib/util-linux/ptest/tests/expected/nsenter/enter-via-socket /usr/lib/util-linux/ptest/tests/expected/lsfd/error-eaccess /usr/lib/util-linux/ptest/tests/expected/su/environ /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-nameval-multi /usr/lib/util-linux/ptest/tests/ts/mount/xnocanon /usr/lib/util-linux/ptest/tests/ts/kill/decode /usr/lib/util-linux/ptest/tests/expected/blkid/output-full-probe /usr/lib/util-linux/ptest/tests/expected/lslogins/checkuser /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-vs-flock /usr/lib/util-linux/ptest/tests/expected/misc/bits-or /usr/lib/util-linux/ptest/tests/ex
 pected/lsfd/column-source-btrfs /usr/lib/util-linux/ptest/tests/expected/lsfd/option-hyperlink-character-device /usr/lib/util-linux/ptest/tests/ts/lscpu/dumps/rv64-milkvpioneer.tar.gz /usr/lib/util-linux/ptest/tests/expected/schedutils/chrt-batch-custom-slice /usr/lib/util-linux/ptest/tests/ts/lscpu/dumps/arm-A510-A710-A715-X3.tar.gz /usr/lib/util-linux/ptest/tests/ts/misc/optstr /usr/lib/util-linux/ptest/tests/expected/mount/xnocanon-symlink-over-file /usr/lib/util-linux/ptest/tests/expected/blkid/output-udev-cache /usr/lib/util-linux/ptest/tests/expected/misc/bits-list"
packages/core2-64-poky-linux/util-linux/util-linux-ptest: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ptest: PKGSIZE changed from 6132742 to 6497339 (+6%)
packages/core2-64-poky-linux/util-linux/util-linux-readprofile: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-readprofile: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rename: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-rename: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-renice: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-renice: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-resizepart: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-resizepart: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-resizepart: PKGSIZE changed from 79992 to 84088 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-rev: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-rev: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rfkill: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-rfkill: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rtcwake: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-rtcwake: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-runuser: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-runuser: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-script: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-script: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-scriptlive: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-scriptlive: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-scriptlive: PKGSIZE changed from 63608 to 67704 (+6%)
packages/core2-64-poky-linux/util-linux/util-linux-scriptreplay: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-scriptreplay: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setarch: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-setarch: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setpgid: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-setpgid: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setpriv: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-setpriv: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setpriv: PKGSIZE changed from 88200 to 92296 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-setsid: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-setsid: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setterm: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-setterm: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-sfdisk: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-sfdisk: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-sfdisk: PKGSIZE changed from 157816 to 161912 (+3%)
packages/core2-64-poky-linux/util-linux/util-linux-src: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-src: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-src: PKGSIZE changed from 253547 to 259639 (+2%)
packages/core2-64-poky-linux/util-linux/util-linux-staticdev: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-staticdev: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-su: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-su: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-sulogin: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-sulogin: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swaplabel: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-swaplabel: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swapoff: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-swapoff: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swapoff: PKGSIZE changed from 22656 to 51328 (+127%)
packages/core2-64-poky-linux/util-linux/util-linux-swapon: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-swapon: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swapon: PKGSIZE changed from 55424 to 59520 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-swaponoff: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-swaponoff: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-switch-root: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-switch-root: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-taskset: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-taskset: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uclampset: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-uclampset: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uclampset: PKGSIZE changed from 67704 to 71800 (+6%)
packages/core2-64-poky-linux/util-linux/util-linux-ul: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-ul: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-umount: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-umount: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-umount: PKGSIZE changed from 34944 to 55424 (+59%)
packages/core2-64-poky-linux/util-linux/util-linux-unshare: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-unshare: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-utmpdump: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-utmpdump: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uuidd: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-uuidd: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uuidgen: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-uuidgen: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uuidparse: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-uuidparse: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-waitpid: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-waitpid: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-wall: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-wall: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-wall: PKGSIZE changed from 39040 to 47232 (+21%)
packages/core2-64-poky-linux/util-linux/util-linux-wdctl: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-wdctl: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-wdctl: PKGSIZE changed from 71824 to 75896 (+6%)
packages/core2-64-poky-linux/util-linux/util-linux-whereis: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-whereis: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-whereis: PKGSIZE changed from 31280 to 30832 (-1%)
packages/core2-64-poky-linux/util-linux/util-linux-wipefs: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-wipefs: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-write: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-write: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-zramctl: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-zramctl: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-zramctl: PKGSIZE changed from 133352 to 133360 (+0%)
packages/core2-64-poky-linux/util-linux/util-linux: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux: RRECOMMENDS: added "util-linux-coresched util-linux-bits"
packages/qemux86_64-poky-linux/linux-yocto/kernel-image-bzimage: PKGSIZE changed from 13046784 to 13063168 (+0%)
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.0-gdb.py was removed
Changes to packages/x86_64-linux/util-linux-native (sysroot):
  /usr/bin/bits was added
  /usr/bin/coresched was added

--===============7680730796056585164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid: PKGSIZE changed from 34952 to 39048 (+12%)
packages/core2-64-poky-linux/util-linux: PACKAGES: added "util-linux-coresched util-linux-bits"
packages/core2-64-poky-linux/util-linux/util-linux-chfn: PKGSIZE changed from 39032 to 55424 (+42%)
packages/core2-64-poky-linux/util-linux/util-linux-chsh: PKGSIZE changed from 34936 to 51328 (+47%)
packages/core2-64-poky-linux/util-linux/util-linux-doc: FILELIST: added "/usr/share/man/man1/coresched.1 /usr/share/man/man1/bits.1"
packages/core2-64-poky-linux/util-linux/util-linux-enosys: PKGSIZE changed from 51320 to 59512 (+16%)
packages/core2-64-poky-linux/util-linux/util-linux-ipcrm: PKGSIZE changed from 34944 to 75904 (+117%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PKGSIZE changed from 330471 to 496173 (+50%)
packages/core2-64-poky-linux/util-linux/util-linux-lsipc: PKGSIZE changed from 100472 to 112760 (+12%)
packages/core2-64-poky-linux/util-linux/util-linux-lsirq: PKGSIZE changed from 39208 to 47400 (+21%)
packages/core2-64-poky-linux/util-linux/util-linux-lslogins: RDEPENDS: added "util-linux-liblastlog2 (['>= 2.41'])"
packages/core2-64-poky-linux/util-linux/util-linux-ptest: FILELIST: added "/usr/lib/util-linux/ptest/tests/expected/colcrt/regressions-crash2.err /usr/lib/util-linux/ptest/tests/expected/lscpu/lscpu-arm-A510-A710-A715-X3 /usr/lib/util-linux/ptest/tests/expected/misc/bits-and /usr/lib/util-linux/ptest/tests/ts/su/environ /usr/lib/util-linux/ptest/tests/expected/column/ansiescape /usr/lib/util-linux/ptest/tests/ts/lsfd/mkfds-foreign-sockets /usr/lib/util-linux/ptest/tests/expected/lsfd/option-hyperlink-character-device /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-types-multi /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-shared /usr/lib/util-linux/ptest/tests/expected/uuid/time /usr/lib/util-linux/ptest/tests/expected/mount/xnocanon-file-over-symlink /usr/lib/util-linux/ptest/tests/ts/findmnt/filterQ /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-non-block /usr/lib/util-linux/ptest/tests/ts/nsenter/enter-via-socket /usr/lib/util-linux/ptest/tests/expec
 ted/schedutils/coresched-copy-from-parent-to-nested-child /usr/lib/util-linux/ptest/tests/ts/lsns/filter /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-nameval-neg /usr/lib/util-linux/ptest/tests/expected/blkid/output-json-probe /usr/lib/util-linux/ptest/tests/ts/lscpu/dumps/rv64-milkvpioneer.tar.gz /usr/lib/util-linux/ptest/tests/ts/blkid/output /usr/lib/util-linux/ptest/tests/expected/misc/bits-parse-grouped-mask /usr/lib/util-linux/ptest/tests/ts/findmnt/listmount /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options /usr/lib/util-linux/ptest/tests/expected/lsfd/option-hyperlink-deleted-file /usr/lib/util-linux/ptest/tests/ts/lsfd/column-source-btrfs /usr/lib/util-linux/ptest/tests/expected/blkid/output-export-probe /usr/lib/util-linux/ptest/tests/expected/misc/bits-default /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-types-neg /usr/lib/util-linux/ptest/tests/expected/misc/bits-not /usr/lib/util-linux/ptest/tests/expected/liblastlog2/write
 _read_user.err /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-nameval-multi /usr/lib/util-linux/ptest/tests/expected/lsns/netns-from-sock /usr/lib/util-linux/ptest/tests/ts/lsns/filedesc /usr/lib/util-linux/ptest/tests/ts/lsfd/error-eaccess /usr/lib/util-linux/ptest/tests/expected/kill/decode /usr/lib/util-linux/ptest/tests/expected/schedutils/chrt-batch-custom-slice /usr/lib/util-linux/ptest/tests/expected/nsenter/enter-via-socket /usr/lib/util-linux/ptest/tests/ts/uuid/time /usr/lib/util-linux/ptest/tests/expected/mount/xnocanon-symlink-over-symlink /usr/lib/util-linux/ptest/tests/ts/column/ansiescape /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-no-multi /usr/lib/util-linux/ptest/tests/expected/misc/bits-list /usr/lib/util-linux/ptest/tests/ts/lsfd/error-eperm /usr/lib/util-linux/ptest/tests/expected/blkid/output-udev-probe /usr/lib/util-linux/ptest/tests/ts/setpriv/seccomp /usr/lib/util-linux/ptest/tests/expected/schedutils/set-cookie-parent-
 pid /usr/lib/util-linux/ptest/tests/expected/misc/bits-binary /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-name /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl /usr/lib/util-linux/ptest/tests/ts/mount/xnocanon /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-neg /usr/lib/util-linux/ptest/tests/expected/misc/bits-mask /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-get-cookie-own-pid /usr/lib/util-linux/ptest/tests/expected/misc/bits-width /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-fd /usr/lib/util-linux/ptest/tests/expected/lslogins/checkuser /usr/lib/util-linux/ptest/tests/expected/lscpu/lscpu-rv64-milkvpioneer /usr/lib/util-linux/ptest/tests/expected/colcrt/regressions-crash1.err /usr/lib/util-linux/ptest/tests/expected/blkid/output-udev-cache /usr/lib/util-linux/ptest/tests/ts/blkid/blkid-output.img.xz /usr/lib/util-linux/ptest/tests/expected/lsfd/mkfds-vsock /usr/lib/util-linux/ptest/tests/expected/misc/f
 lock-fcntl-exclusive /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-copy-from-child-to-parent /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-timeout /usr/lib/util-linux/ptest/tests/expected/lsfd/error-eperm /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-no-fork /usr/lib/util-linux/ptest/tests/expected/blkid/output-export-cache /usr/lib/util-linux/ptest/tests/expected/misc/bits-parse-range /usr/lib/util-linux/ptest/sample-mount-listmount /usr/lib/util-linux/ptest/sample-scols-wrap-repeat /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-new-child-with-new-cookie /usr/lib/util-linux/ptest/tests/expected/misc/optstr /usr/lib/util-linux/ptest/tests/expected/blkid/output-json-cache /usr/lib/util-linux/ptest/tests/expected/blkid/output-full-probe /usr/lib/util-linux/ptest/tests/expected/misc/bits-stdin /usr/lib/util-linux/ptest/tests/ts/column/files/ansiescape /usr/lib/util-linux/ptest/tests/ts/lsfd/option-hyperlink /usr/lib/util-linux/ptes
 t/tests/expected/misc/bits-or /usr/lib/util-linux/ptest/tests/expected/lsfd/column-source-btrfs /usr/lib/util-linux/ptest/tests/expected/misc/bits-width-truncate /usr/lib/util-linux/ptest/tests/ts/lsns/netns-from-sock /usr/lib/util-linux/ptest/tests/expected/misc/bits-grouped-mask /usr/lib/util-linux/ptest/tests/expected/lsfd/mkfds-foreign-sockets /usr/lib/util-linux/ptest/tests/ts/schedutils/coresched /usr/lib/util-linux/ptest/test_uuid_time /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-vs-flock /usr/lib/util-linux/ptest/tests/ts/misc/optstr /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-types /usr/lib/util-linux/ptest/tests/expected/lsfd/option-hyperlink-regular-file /usr/lib/util-linux/ptest/tests/expected/misc/bits-parse-mask /usr/lib/util-linux/ptest/tests/expected/blkid/output-device-cache /usr/lib/util-linux/ptest/tests/expected/lsns/filter /usr/lib/util-linux/ptest/tests/ts/lslogins/checkuser /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched
 -get-cookie-parent-pid /usr/lib/util-linux/ptest/tests/ts/cal/terminal-colors.d/cal.scheme /usr/lib/util-linux/ptest/tests/expected/schedutils/chrt-other-custom-slice /usr/lib/util-linux/ptest/tests/ts/kill/decode /usr/lib/util-linux/ptest/tests/expected/setpriv/seccomp /usr/lib/util-linux/ptest/tests/ts/misc/bits /usr/lib/util-linux/ptest/tests/expected/misc/bits-truncate /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-set-cookie-parent-pid.err /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-no /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-nameval /usr/lib/util-linux/ptest/tests/ts/lslogins/create_db.sql /usr/lib/util-linux/ptest/tests/expected/blkid/output-full-cache /usr/lib/util-linux/ptest/tests/expected/misc/bits /usr/lib/util-linux/ptest/tests/expected/mount/xnocanon-symlink-over-file /usr/lib/util-linux/ptest/tests/ts/lsfd/mkfds-vsock /usr/lib/util-linux/ptest/sample-mount-statmount /usr/lib/util-linux/ptest/tests/expected/bl
 kid/output-value-cache /usr/lib/util-linux/ptest/tests/expected/blkid/output-value-probe /usr/lib/util-linux/ptest/tests/ts/lscpu/dumps/arm-A510-A710-A715-X3.tar.gz /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-time-check /usr/lib/util-linux/ptest/tests/expected/blkid/output-device-probe /usr/lib/util-linux/ptest/tests/expected/colcrt/regressions-hang1.err /usr/lib/util-linux/ptest/tests/expected/lsfd/error-eaccess /usr/lib/util-linux/ptest/tests/expected/misc/bits-xor /usr/lib/util-linux/ptest/test_sigstate /usr/lib/util-linux/ptest/tests/expected/su/environ"
packages/core2-64-poky-linux/util-linux/util-linux-swapoff: PKGSIZE changed from 22656 to 51328 (+127%)
packages/core2-64-poky-linux/util-linux/util-linux-umount: PKGSIZE changed from 34944 to 55424 (+59%)
packages/core2-64-poky-linux/util-linux/util-linux-wall: PKGSIZE changed from 39040 to 47232 (+21%)
packages/core2-64-poky-linux/util-linux/util-linux: RRECOMMENDS: added "util-linux-coresched util-linux-bits"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.0-gdb.py was removed
Changes to packages/x86_64-linux/util-linux-native (sysroot):
  /usr/bin/bits was added
  /usr/bin/coresched was added

--===============7680730796056585164==--

