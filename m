Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EB4C54EDA
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:31:49 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.11023.1747312302710782673
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Iy8nZL+6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mSagljEJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010196d3edd689-b9824483-c14d-4a39-82e1-2d6b15a3a16b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312301;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DbteMAqFcsD4NxmeROgyZNpX3bzDvbqCdPnCwV8G160=;
	b=Iy8nZL+6x+hKD/vbk3eL1M5A8H1sipQ2xIXJihHtK0c3Uv+ovkvEs/nI1V6O3OAI
	Db5NPe9CsaJEpLkD5nrRR4QsZncdqfMPPvJlmniI7zEe/H8ANNfEKZJ1KkHIN/Tqgx/
	Ty3Y9XzglVCTlWtbroPVPBZZJtGF4qYG0HzTHBQI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312301;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DbteMAqFcsD4NxmeROgyZNpX3bzDvbqCdPnCwV8G160=;
	b=mSagljEJDceS9ZfLSIdZbM8UBFfpu5rbYct47jEERB0y9Uonsre1XRzQCa+s0gz3
	/BTdRoAdTHAUw38a1OpKPiAh8W1sI/uDQS99Lwo/PdPuHLr3aOTlOu/4eSPgzoMAvb6
	aLQA8WktBDVT8B27ODsnkgCVijWRkF9Ixgk6GLzg=
Content-Type: multipart/mixed; boundary="===============1557262657042765735=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux,util-linux-libuuid: upgrading to 2.41,2.41 SUCCEEDED
Message-ID: <01010196d3edd689-b9824483-c14d-4a39-82e1-2d6b15a3a16b-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216576

--===============1557262657042765735==
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
From 679833ebc4487b62de93986b86b42ecda86e2bed Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 05:36:35 +0000
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
index 8ea00dbb95..2e498fe677 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From da58b4150f6932de36c962ea657713bcf4ea44be Mon Sep 17 00:00:00 2001
+From 8766a6cd41e3c0adaadb63d905474412b1944b8a Mon Sep 17 00:00:00 2001
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
index 74abdc2038..108bab6484 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From 0387d71516c978899cfd556ca512f530a212b4a9 Mon Sep 17 00:00:00 2001
+From 61d7d1e3a99d4f0d0c1d84cfc7336a9c44543e9b Mon Sep 17 00:00:00 2001
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
index 871b0b2d30..03435fb6a4 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,4 @@
-From 45450d0339cd7ee27f53c0f2fac1cc74ed9bbfb8 Mon Sep 17 00:00:00 2001
+From dacd31965dfb491c56a50eb2f5ce4bf4daacd79e Mon Sep 17 00:00:00 2001
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
index 7345926b88..b37314f761 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From f9be73c3e2b0a4f0923950dcb058be85d3ee8ed7 Mon Sep 17 00:00:00 2001
+From e9fe0ca47cfaa5fc160c20cf3afe2c912da3df0d Mon Sep 17 00:00:00 2001
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


--===============1557262657042765735==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-util-linux-libuuid-upgrade-2.40.4-2.41-2..patch"

RnJvbSA2Nzk4MzNlYmM0NDg3YjYyZGU5Mzk4NmI4NmI0MmVjZGE4NmUyYmVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDU6MzY6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGlsLWxpbnV4LHV0aWwtbGludXgtbGlidXVpZDogdXBncmFkZSAyLjQwLjQgLT4gMi40MSwyLjQw
LjQKIC0+IDIuNDEKCi0tLQogLi4uZF8yLjQwLjQuYmIgPT4gdXRpbC1saW51eC1saWJ1dWlkXzIu
NDEuYmJ9IHwgIDIyICsrKysKIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51
eC5pbmMgICB8ICAgNiArLQogLi4uZGQtc2VjdG9yLXNpemUtY29tbWFuYW5kLWxpbmUtb3B0aW9u
LnBhdGNoIHwgIDkwIC0tLS0tLS0tLS0tLS0tLQogLi4uZGQtc2VjdG9yLXNpemUtY29tbWFuYW5k
LWxpbmUtb3B0aW9uLnBhdGNoIHwgMTA1IC0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL3V0aWwtbGlu
dXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggICAgIHwgICA0ICstCiAuLi4vdXRpbC1saW51
eC9jb25maWd1cmUtc2JpbmRpci5wYXRjaCAgICAgICAgfCAgIDQgKy0KIC4uLi9kaXNwbGF5X3Rl
c3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoICAgICAgICB8ICAgNiArLQogLi4uL3V0aWwtbGludXgv
dXRpbC1saW51eC9wdGVzdC5wYXRjaCAgICAgICAgIHwgICA2ICstCiAuLi50aWwtbGludXhfMi40
MC40LmJiID0+IHV0aWwtbGludXhfMi40MS5iYn0gfCAgMjIgKysrKwogOSBmaWxlcyBjaGFuZ2Vk
LCA1NiBpbnNlcnRpb25zKCspLCAyMDkgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWNvcmUvdXRpbC1saW51eC97dXRpbC1saW51eC1saWJ1dWlkXzIuNDAuNC5iYiA9PiB1dGlsLWxp
bnV4LWxpYnV1aWRfMi40MS5iYn0gKDQzJSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lw
ZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1jZmRpc2stYWRkLXNlY3Rvci1zaXpl
LWNvbW1hbmFuZC1saW5lLW9wdGlvbi5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVj
aXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAyLXNmZGlzay1hZGQtc2VjdG9yLXNp
emUtY29tbWFuYW5kLWxpbmUtb3B0aW9uLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUv
dXRpbC1saW51eC97dXRpbC1saW51eF8yLjQwLjQuYmIgPT4gdXRpbC1saW51eF8yLjQxLmJifSAo
OTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51
eC1saWJ1dWlkXzIuNDAuNC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC1saWJ1dWlkXzIuNDEuYmIKc2ltaWxhcml0eSBpbmRleCA0MyUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWRfMi40MC40LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8y
LjQxLmJiCmluZGV4IGVjMDRjMWQzODQuLjhmYTA3OTM4OWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIuNDAuNC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8yLjQxLmJiCkBA
IC0xLDMgKzEsMjUgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZl
IGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0Lgor
IyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6
ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0
ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVw
ZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBSRUFETUUubGljZW5zaW5nCisj
ICsrKyBSRUFETUUubGljZW5zaW5nCisjIEBAIC0yMCw2ICsyMCw4IEBACisjICAKKyMgICAgICog
QlNELTQtQ2xhdXNlLVVDICAgIC0gQlNEIDQtQ2xhdXNlIFVuaXZlcnNpdHkgb2YgQ2FsaWZvcm5p
YS1TcGVjaWZpYworIyAgCisjICsgICAqIEVVUEwtMS4yICAgICAgICAgICAtIEV1cm9wZWFuIFVu
aW9uIFB1YmxpYyBMaWNlbmNlIHZlcnNpb24gMS4yCisjICsKKyMgICAgICogUHVibGljIERvbWFp
bgorIyAgCisjICBQbGVhc2UsIGNoZWNrIHRoZSBzb3VyY2UgY29kZSBmb3IgbW9yZSBkZXRhaWxz
LiBBIGxpY2Vuc2UgaXMgdXN1YWxseSBhdCB0aGUgc3RhcnQKKyMgCisjCisKICMgVG8gYWxsb3cg
dXRpbC1saW51eCB0byBvcHRpb25hbGx5IGJ1aWxkLWRlcGVuZCBvbiBjcnlwdHNldHVwLCBsaWJ1
dWlkIGlzCiAjIHNwbGl0IG91dCBvZiB0aGUgbWFpbiByZWNpcGUsIGFzIGl0J3MgbmVlZGVkIGJ5
IGNyeXB0c2V0dXAKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4LmluYyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5p
bmMKaW5kZXggNGU4NzAxZmZkZi4uMDI1MmJkZWRiNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYworKysgYi9tZXRhL3JlY2lwZXMtY29yZS91
dGlsLWxpbnV4L3V0aWwtbGludXguaW5jCkBAIC0xNCw3ICsxNCw3IEBAIExJQ0VOU0U6JHtQTn0t
bGliZmRpc2sgPSAiTEdQTC0yLjEtb3ItbGF0ZXIiCiBMSUNFTlNFOiR7UE59LWxpYm1vdW50ID0g
IkxHUEwtMi4xLW9yLWxhdGVyIgogTElDRU5TRToke1BOfS1saWJzbWFydGNvbHMgPSAiTEdQTC0y
LjEtb3ItbGF0ZXIiCiAKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL1JFQURNRS5saWNlbnNp
bmc7bWQ1PWRkZDU4YjZjOTRkYTg2ZmY0ZjAzZTkxMjA4ZWI5Y2ZjIFwKK0xJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL1JFQURNRS5saWNlbnNpbmc7bWQ1PTU1ZTg5NWE4MGJkZDRmZmM2NWUxNjdh
NzZkMmU3NTY5IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRl
ZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTov
L0RvY3VtZW50YXRpb24vbGljZW5zZXMvQ09QWUlORy5HUEwtMi4wLW9yLWxhdGVyO21kNT1iMjM0
ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9Eb2N1bWVudGF0aW9uL2xpY2Vuc2VzL0NPUFlJTkcuTEdQTC0yLjEtb3ItbGF0ZXI7bWQ1PTRm
YmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIFwKQEAgLTM4LDEwICszOCw4IEBAIFNSQ19V
UkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC91dGlscy91dGlsLWxpbnV4L3Yke01BSk9S
X1ZFUlNJT059L3V0aWwtbGluCiAgICAgICAgICAgIGZpbGU6Ly9kaXNwbGF5X3Rlc3RuYW1lX2Zv
cl9zdWJ0ZXN0LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2F2b2lkX3BhcmFsbGVsX3Rlc3Rz
LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2ZjbnRsLWxvY2suYyBcCi0gICAgICAgICAgIGZp
bGU6Ly8wMDAxLWNmZGlzay1hZGQtc2VjdG9yLXNpemUtY29tbWFuYW5kLWxpbmUtb3B0aW9uLnBh
dGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDItc2ZkaXNrLWFkZC1zZWN0b3Itc2l6ZS1jb21t
YW5hbmQtbGluZS1vcHRpb24ucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI1YzFkYWY3MzNiMDRlOTg1OWFmZGMzYmQ4N2NjNDgxMTgwZWUwZjg4YjVjMDk0NmIx
NmZkZWM5MzE5NzVmYjc5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgxZWU5M2IzY2ZkZmViN2Q3
YzQwOTBjZWRlYmExZDdiYmNlOTE0MWZkMGI1MDFiNjg2YjNmZTQ3NWRkY2E0YzYiCiAKIENWRV9Q
Uk9EVUNUID0gInV0aWwtbGludXgiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGls
LWxpbnV4L3V0aWwtbGludXgvMDAwMS1jZmRpc2stYWRkLXNlY3Rvci1zaXplLWNvbW1hbmFuZC1s
aW5lLW9wdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51
eC8wMDAxLWNmZGlzay1hZGQtc2VjdG9yLXNpemUtY29tbWFuYW5kLWxpbmUtb3B0aW9uLnBhdGNo
CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA3MzAzMTMxOGQyLi4wMDAwMDAwMDAwCi0t
LSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWNmZGlzay1h
ZGQtc2VjdG9yLXNpemUtY29tbWFuYW5kLWxpbmUtb3B0aW9uLnBhdGNoCisrKyAvZGV2L251bGwK
QEAgLTEsOTAgKzAsMCBAQAotRnJvbSA3MjRiOTVlZTY4NDc2MTNlMjNjYTE4ZjQ5MThkNGU2NWZm
NWIyNzBlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogS2FyZWwgWmFrIDxremFrQHJl
ZGhhdC5jb20+Ci1EYXRlOiBNb24sIDE0IE9jdCAyMDI0IDE1OjQ4OjQ2ICswMjAwCi1TdWJqZWN0
OiBbUEFUQ0ggMS8yXSBjZmRpc2s6IGFkZCAtLXNlY3Rvci1zaXplIGNvbW1hbmFuZCBsaW5lIG9w
dGlvbgotCi0qIGltcHJvdmVzIGNvbXBhdGliaWxpdHkgd2l0aCBmZGlzawotKiBhZGQgYWJpbGl0
eSB0byB3b3JrIHdpdGggZGlzayBpbWFnZXMgd2hlcmUgbGliZmRpc2sgZGVmYXVsdHMgdG8gNTEy
Ci0KLVNpZ25lZC1vZmYtYnk6IEthcmVsIFphayA8a3pha0ByZWRoYXQuY29tPgotCi1VcHN0cmVh
bS1TdGF0dXM6IEJhY2twb3J0IFtmZDM4ZWUyMjc0ZjdhMzAzOTNkMzgzOWRmY2U1NTYyNjAzNTVj
M2ZhXQotCi1TaWduZWQtb2ZmLWJ5OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+Ci0t
LS0KLSBkaXNrLXV0aWxzL2NmZGlzay44LmFkb2MgfCAgMyArKysKLSBkaXNrLXV0aWxzL2NmZGlz
ay5jICAgICAgfCAxNSArKysrKysrKysrKysrKy0KLSAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL2Rpc2stdXRpbHMvY2ZkaXNr
LjguYWRvYyBiL2Rpc2stdXRpbHMvY2ZkaXNrLjguYWRvYwotaW5kZXggOTdmYWQ2MjFkLi43NTlm
MzlmMGUgMTAwNjQ0Ci0tLS0gYS9kaXNrLXV0aWxzL2NmZGlzay44LmFkb2MKLSsrKyBiL2Rpc2st
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
LmMKLWluZGV4IDE4M2I3NjcxZS4uZjM3ZTJkNzJhIDEwMDY0NAotLS0tIGEvZGlzay11dGlscy9j
ZmRpc2suYwotKysrIGIvZGlzay11dGlscy9jZmRpc2suYwotQEAgLTI3MzksNiArMjczOSw4IEBA
IHN0YXRpYyB2b2lkIF9fYXR0cmlidXRlX18oKF9fbm9yZXR1cm5fXykpIHVzYWdlKHZvaWQpCi0g
CSAgICAgIF8oIiAgICAgLS1sb2NrWz08bW9kZT5dICAgICAgdXNlIGV4Y2x1c2l2ZSBkZXZpY2Ug
bG9jayAoJXMsICVzIG9yICVzKVxuIiksICJ5ZXMiLCAibm8iLCAibm9uYmxvY2siKTsKLSAJZnB1
dHMoXygiIC1yLCAtLXJlYWQtb25seSAgICAgICAgICBmb3JjZWQgb3BlbiBjZmRpc2sgaW4gcmVh
ZC1vbmx5IG1vZGVcbiIpLCBvdXQpOwotIAotKwlmcHV0cyhfKCIgLWIsIC0tc2VjdG9yLXNpemUg
PHNpemU+IHBoeXNpY2FsIGFuZCBsb2dpY2FsIHNlY3RvciBzaXplXG4iKSwgb3V0KTsKLSsKLSAJ
ZnB1dHMoVVNBR0VfU0VQQVJBVE9SLCBvdXQpOwotIAlmcHJpbnRmKG91dCwgVVNBR0VfSEVMUF9P
UFRJT05TKDI2KSk7Ci0gCi1AQCAtMjc1MSw2ICsyNzUzLDcgQEAgaW50IG1haW4oaW50IGFyZ2Ms
IGNoYXIgKmFyZ3ZbXSkKLSAJY29uc3QgY2hhciAqZGlza3BhdGggPSBOVUxMLCAqbG9ja21vZGUg
PSBOVUxMOwotIAlpbnQgcmMsIGMsIGNvbG9ybW9kZSA9IFVMX0NPTE9STU9ERV9VTkRFRjsKLSAJ
aW50IHJlYWRfb25seSA9IDA7Ci0rCXNpemVfdCB1c2VyX3NzID0gMDsKLSAJc3RydWN0IGNmZGlz
ayBfY2YgPSB7IC5saW5lc19pZHggPSAwIH0sCi0gCQkgICAgICAqY2YgPSAmX2NmOwotIAllbnVt
IHsKLUBAIC0yNzYwLDYgKzI3NjMsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltd
KQotIAkJeyAiY29sb3IiLCAgIG9wdGlvbmFsX2FyZ3VtZW50LCBOVUxMLCAnTCcgfSwKLSAJCXsg
ImxvY2siLCAgICBvcHRpb25hbF9hcmd1bWVudCwgTlVMTCwgT1BUX0xPQ0sgfSwKLSAJCXsgImhl
bHAiLCAgICBub19hcmd1bWVudCwgICAgICAgTlVMTCwgJ2gnIH0sCi0rCQl7ICJzZWN0b3Itc2l6
ZSIsIHJlcXVpcmVkX2FyZ3VtZW50LCBOVUxMLCAnYicgfSwKLSAJCXsgInZlcnNpb24iLCBub19h
cmd1bWVudCwgICAgICAgTlVMTCwgJ1YnIH0sCi0gCQl7ICJ6ZXJvIiwgICAgbm9fYXJndW1lbnQs
CU5VTEwsICd6JyB9LAotIAkJeyAicmVhZC1vbmx5Iiwgbm9fYXJndW1lbnQsICAgICBOVUxMLCAn
cicgfSwKLUBAIC0yNzcxLDggKzI3NzUsMTUgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFy
Z3ZbXSkKLSAJdGV4dGRvbWFpbihQQUNLQUdFKTsKLSAJY2xvc2Vfc3Rkb3V0X2F0ZXhpdCgpOwot
IAotLQl3aGlsZSgoYyA9IGdldG9wdF9sb25nKGFyZ2MsIGFyZ3YsICJMOjpoVnpyIiwgbG9uZ29w
dHMsIE5VTEwpKSAhPSAtMSkgewotKwl3aGlsZSgoYyA9IGdldG9wdF9sb25nKGFyZ2MsIGFyZ3Ys
ICJiOkw6OmhWenIiLCBsb25nb3B0cywgTlVMTCkpICE9IC0xKSB7Ci0gCQlzd2l0Y2goYykgewot
KwkJY2FzZSAnYic6Ci0rCQkJdXNlcl9zcyA9IHN0cnRvdTMyX29yX2VycihvcHRhcmcsCi0rCQkJ
CQlfKCJpbnZhbGlkIHNlY3RvciBzaXplIGFyZ3VtZW50IikpOwotKwkJCWlmICh1c2VyX3NzICE9
IDUxMiAmJiB1c2VyX3NzICE9IDEwMjQgJiYKLSsJCQkgICAgdXNlcl9zcyAhPSAyMDQ4ICYmIHVz
ZXJfc3MgIT0gNDA5NikKLSsJCQkJZXJyeChFWElUX0ZBSUxVUkUsIF8oImludmFsaWQgc2VjdG9y
IHNpemUgYXJndW1lbnQiKSk7Ci0rCQkJYnJlYWs7Ci0gCQljYXNlICdoJzoKLSAJCQl1c2FnZSgp
OwotIAkJCWJyZWFrOwotQEAgLTI4MTEsNiArMjgyMiw4IEBAIGludCBtYWluKGludCBhcmdjLCBj
aGFyICphcmd2W10pCi0gCWNmLT5jeHQgPSBmZGlza19uZXdfY29udGV4dCgpOwotIAlpZiAoIWNm
LT5jeHQpCi0gCQllcnIoRVhJVF9GQUlMVVJFLCBfKCJmYWlsZWQgdG8gYWxsb2NhdGUgbGliZmRp
c2sgY29udGV4dCIpKTsKLSsJaWYgKHVzZXJfc3MpCi0rCQlmZGlza19zYXZlX3VzZXJfc2VjdG9y
X3NpemUoY2YtPmN4dCwgdXNlcl9zcywgdXNlcl9zcyk7Ci0gCi0gCWZkaXNrX3NldF9hc2soY2Yt
PmN4dCwgYXNrX2NhbGxiYWNrLCAodm9pZCAqKSBjZik7Ci0gCi0tLSAKLTIuMjUuMQotCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMi1zZmRp
c2stYWRkLXNlY3Rvci1zaXplLWNvbW1hbmFuZC1saW5lLW9wdGlvbi5wYXRjaCBiL21ldGEvcmVj
aXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAyLXNmZGlzay1hZGQtc2VjdG9yLXNp
emUtY29tbWFuYW5kLWxpbmUtb3B0aW9uLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCA4ZDQ3ZDhkZTcxLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC8wMDAyLXNmZGlzay1hZGQtc2VjdG9yLXNpemUtY29tbWFuYW5kLWxp
bmUtb3B0aW9uLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMTA1ICswLDAgQEAKLUZyb20gOTY1
NzBjMDNmNDZlMGE1YzE3ZTcyMTczN2EzOGM3MTdjNjdlMzU4YiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKLUZyb206IEthcmVsIFphayA8a3pha0ByZWRoYXQuY29tPgotRGF0ZTogTW9uLCAxNCBP
Y3QgMjAyNCAxNTo1MDo0MCArMDIwMAotU3ViamVjdDogW1BBVENIIDIvMl0gc2ZkaXNrOiBhZGQg
LS1zZWN0b3Itc2l6ZSBjb21tYW5hbmQgbGluZSBvcHRpb24KLQotKiBpbXByb3ZlcyBjb21wYXRp
YmlsaXR5IHdpdGggZmRpc2sKLSogYWRkIGFiaWxpdHkgdG8gd29yayB3aXRoIGRpc2sgaW1hZ2Vz
IHdoZXJlIGxpYmZkaXNrIGRlZmF1bHRzIHRvIDUxMgotCi1BZGRyZXNzZXM6IGh0dHBzOi8vZ2l0
aHViLmNvbS91dGlsLWxpbnV4L3V0aWwtbGludXgvcHVsbC8zMjM1Ci1TaWduZWQtb2ZmLWJ5OiBL
YXJlbCBaYWsgPGt6YWtAcmVkaGF0LmNvbT4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBb
ZWY3Yjc2YmFhMTdkZGI1NDE0NjkxZmE4ZjQ5ZDYxNDE1YzMwODcxY10KLQotU2lnbmVkLW9mZi1i
eTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgotLS0tCi0gZGlzay11dGlscy9zZmRp
c2suOC5hZG9jIHwgIDUgKysrKy0KLSBkaXNrLXV0aWxzL3NmZGlzay5jICAgICAgfCAxNCArKysr
KysrKysrKysrKwotIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQotCi1kaWZmIC0tZ2l0IGEvZGlzay11dGlscy9zZmRpc2suOC5hZG9jIGIvZGlzay11dGls
cy9zZmRpc2suOC5hZG9jCi1pbmRleCBiYzNmZjliYjguLmQxZWFhMzcxMiAxMDA2NDQKLS0tLSBh
L2Rpc2stdXRpbHMvc2ZkaXNrLjguYWRvYwotKysrIGIvZGlzay11dGlscy9zZmRpc2suOC5hZG9j
Ci1AQCAtMjAxLDYgKzIwMSw5IEBAIFRoZSBkZWZhdWx0IGxpc3Qgb2YgY29sdW1ucyBtYXkgYmUg
ZXh0ZW5kZWQgaWYgX2xpc3RfIGlzIHNwZWNpZmllZCBpbiB0aGUgZm9ybWF0Ci0gKi1xKiwgKi0t
cXVpZXQqOjoKLSBTdXBwcmVzcyBleHRyYSBpbmZvIG1lc3NhZ2VzLgotIAotKyotLXNlY3Rvci1z
aXplKiBfc2VjdG9yc2l6ZV86OgotK1NwZWNpZnkgdGhlIHNlY3RvciBzaXplIG9mIHRoZSBkaXNr
LiBWYWxpZCB2YWx1ZXMgYXJlIDUxMiwgMTAyNCwgMjA0OCwgYW5kIDQwOTYuIFRoZSBrZXJuZWwg
aXMgYXdhcmUgb2YgdGhlIHNlY3RvciBzaXplIGZvciByZWd1bGFyIGJsb2NrIGRldmljZXMuIFVz
ZSB0aGlzIG9wdGlvbiBvbmx5IG9uIHZlcnkgb2xkIGtlcm5lbHMsIHdoZW4gd29ya2luZyB3aXRo
IGRpc2sgaW1hZ2VzLCBvciB0byBvdmVycmlkZSB0aGUga2VybmVsJ3MgZGVmYXVsdCBzZWN0b3Ig
c2l6ZS4gU2luY2UgdXRpbC1saW51eC0yLjE3LCAqZmRpc2sqIGRpc3Rpbmd1aXNoZXMgYmV0d2Vl
biBsb2dpY2FsIGFuZCBwaHlzaWNhbCBzZWN0b3Igc2l6ZS4gVGhpcyBvcHRpb24gY2hhbmdlcyBi
b3RoIHNlY3RvciBzaXplcyB0byB0aGUgc3BlY2lmaWVkIF9zZWN0b3JzaXplXy4KLSsKLSAqLXUq
LCAqLS11bml0IFMqOjoKLSBEZXByZWNhdGVkIG9wdGlvbi4gT25seSB0aGUgc2VjdG9yIHVuaXQg
aXMgc3VwcG9ydGVkLiBUaGlzIG9wdGlvbiBpcyBub3Qgc3VwcG9ydGVkIHdoZW4gdXNpbmcgdGhl
ICotLXNob3ctc2l6ZSogY29tbWFuZC4KLSAKLUBAIC0yNDksNyArMjUyLDcgQEAgU3BlY2lmeSB0
aGUgbWF4aW1hbCBudW1iZXIgb2YgR1BUIHBhcnRpdGlvbnMuCi0gKmdyYWluKjo6Ci0gU3BlY2lm
eSBtaW5pbWFsIHNpemUgaW4gYnl0ZXMgdXNlZCB0byBjYWxjdWxhdGUgcGFydGl0aW9ucyBhbGln
bm1lbnQuIFRoZSBkZWZhdWx0IGlzIDFNaUIgYW5kIGl0J3Mgc3Ryb25nbHkgcmVjb21tZW5kZWQg
dG8gdXNlIHRoZSBkZWZhdWx0LiBEbyBub3QgbW9kaWZ5IHRoaXMgdmFyaWFibGUgaWYgeW91J3Jl
IG5vdCBzdXJlLgotICpzZWN0b3Itc2l6ZSo6OgotLVNwZWNpZnkgc2VjdG9yIHNpemUuICpzZmRp
c2sqIGFsd2F5cyB1c2VzIGRldmljZSBzZWN0b3Igc2l6ZS4gU2luY2UgdmVyc2lvbiAyLjM5ICpz
ZmRpc2sqIHJlY2FsY3VsYXRlcyBzaXplcyBmcm9tIGR1bXAgaWYgdGhlIHNjcmlwdCBhbmQgZGV2
aWNlIHNlY3RvciBzaXplIGRpZmZlci4KLStTcGVjaWZpZXMgdGhlIHNlY3RvciBzaXplIHVzZWQg
aW4gdGhlIGlucHV0LiAqc2ZkaXNrKiBhbHdheXMgaW50ZXJuYWxseSB1c2VzIHRoZSBkZXZpY2Ug
c2VjdG9yIHNpemUgcHJvdmlkZWQgYnkgdGhlIGtlcm5lbCBmb3IgdGhlIGJsb2NrIGRldmljZSwg
b3IgYXMgc3BlY2lmaWVkIGJ5IHRoZSB1c2VyIG9uIHRoZSBjb21tYW5kIGxpbmUgKHNlZSAqLS1z
ZWN0b3Itc2l6ZSopLiBTdGFydGluZyB3aXRoIHZlcnNpb24gMi4zOSwgKnNmZGlzayogcmVjYWxj
dWxhdGVzIHNpemVzIGZyb20gdGhlIGlucHV0IGlmIHRoZSAqc2VjdG9yLXNpemUqIGhlYWRlciBh
bmQgZGV2aWNlIHNlY3RvciBzaXplIGFyZSBkaWZmZXJlbnQuCi0gCi0gTm90ZSB0aGF0IGl0IGlz
IG9ubHkgcG9zc2libGUgdG8gdXNlIGhlYWRlciBsaW5lcyBiZWZvcmUgdGhlIGZpcnN0IHBhcnRp
dGlvbiBpcyBzcGVjaWZpZWQgaW4gdGhlIGlucHV0LgotIAotZGlmZiAtLWdpdCBhL2Rpc2stdXRp
bHMvc2ZkaXNrLmMgYi9kaXNrLXV0aWxzL3NmZGlzay5jCi1pbmRleCBkOGRkOGQyOTYuLjk3ZDQy
NjU1OSAxMDA2NDQKLS0tLSBhL2Rpc2stdXRpbHMvc2ZkaXNrLmMKLSsrKyBiL2Rpc2stdXRpbHMv
c2ZkaXNrLmMKLUBAIC0yMDg0LDYgKzIwODQsOCBAQCBzdGF0aWMgdm9pZCBfX2F0dHJpYnV0ZV9f
KChfX25vcmV0dXJuX18pKSB1c2FnZSh2b2lkKQotIAkgICAgICBfKCIgICAgIC0tY29sb3JbPTx3
aGVuPl0gICAgICBjb2xvcml6ZSBvdXRwdXQgKCVzLCAlcyBvciAlcylcbiIpLCAiYXV0byIsICJh
bHdheXMiLCAibmV2ZXIiKTsKLSAJZnByaW50ZihvdXQsCi0gCSAgICAgICAgIiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgJXNcbiIsIFVTQUdFX0NPTE9SU19ERUZBVUxUKTsKLSsJZnB1dHMo
XygiICAgICAtLXNlY3Rvci1zaXplIDxzaXplPiAgcGh5c2ljYWwgYW5kIGxvZ2ljYWwgc2VjdG9y
IHNpemVcbiIpLCBvdXQpOwotKwotIAlmcHJpbnRmKG91dCwKLSAJICAgICAgXygiICAgICAtLWxv
Y2tbPTxtb2RlPl0gICAgICAgdXNlIGV4Y2x1c2l2ZSBkZXZpY2UgbG9jayAoJXMsICVzIG9yICVz
KVxuIiksICJ5ZXMiLCAibm8iLCAibm9uYmxvY2siKTsKLSAJZnB1dHMoXygiIC1OLCAtLXBhcnRu
byA8bnVtPiAgICAgICAgc3BlY2lmeSBwYXJ0aXRpb24gbnVtYmVyXG4iKSwgb3V0KTsKLUBAIC0y
MTIwLDYgKzIxMjIsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQotIAljb25z
dCBjaGFyICpvdXRhcmcgPSBOVUxMOwotIAlpbnQgcmMgPSAtRUlOVkFMLCBjLCBsb25naWR4ID0g
LTEsIGJ5dGVzID0gMDsKLSAJaW50IGNvbG9ybW9kZSA9IFVMX0NPTE9STU9ERV9VTkRFRjsKLSsJ
c2l6ZV90IHVzZXJfc3MgPSAwOwotIAlzdHJ1Y3Qgc2ZkaXNrIF9zZiA9IHsKLSAJCS5wYXJ0bm8g
PSAtMSwKLSAJCS53aXBlbW9kZSA9IFdJUEVNT0RFX0FVVE8sCi1AQCAtMjE0NSw2ICsyMTQ4LDcg
QEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKLSAJCU9QVF9OT1RFTEwsCi0gCQlP
UFRfUkVMT0NBVEUsCi0gCQlPUFRfTE9DSywKLSsJCU9QVF9TRUNUT1JTSVpFCi0gCX07Ci0gCi0g
CXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb3B0aW9uIGxvbmdvcHRzW10gPSB7Ci1AQCAtMjE3NCw2ICsy
MTc4LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKLSAJCXsgIm91dHB1dCIs
ICByZXF1aXJlZF9hcmd1bWVudCwgTlVMTCwgJ28nIH0sCi0gCQl7ICJwYXJ0bm8iLCAgcmVxdWly
ZWRfYXJndW1lbnQsIE5VTEwsICdOJyB9LAotIAkJeyAicmVvcmRlciIsIG5vX2FyZ3VtZW50LCAg
ICAgICBOVUxMLCAncicgfSwKLSsJCXsgInNlY3Rvci1zaXplIiwgcmVxdWlyZWRfYXJndW1lbnQs
IE5VTEwsIE9QVF9TRUNUT1JTSVpFIH0sCi0gCQl7ICJzaG93LWdlb21ldHJ5Iiwgbm9fYXJndW1l
bnQsIE5VTEwsICdnJyB9LAotIAkJeyAicXVpZXQiLCAgIG5vX2FyZ3VtZW50LCAgICAgICBOVUxM
LCAncScgfSwKLSAJCXsgInZlcmlmeSIsICBub19hcmd1bWVudCwgICAgICAgTlVMTCwgJ1YnIH0s
Ci1AQCAtMjM3Myw2ICsyMzc4LDEzIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10p
Ci0gCQkJCXNmLT5sb2NrbW9kZSA9IG9wdGFyZzsKLSAJCQl9Ci0gCQkJYnJlYWs7Ci0rCQljYXNl
IE9QVF9TRUNUT1JTSVpFOgotKwkJCXVzZXJfc3MgPSBzdHJ0b3UzMl9vcl9lcnIob3B0YXJnLAot
KwkJCQkJXygiaW52YWxpZCBzZWN0b3Igc2l6ZSBhcmd1bWVudCIpKTsKLSsJCQlpZiAodXNlcl9z
cyAhPSA1MTIgJiYgdXNlcl9zcyAhPSAxMDI0ICYmCi0rCQkJICAgIHVzZXJfc3MgIT0gMjA0OCAm
JiB1c2VyX3NzICE9IDQwOTYpCi0rCQkJCWVycngoRVhJVF9GQUlMVVJFLCBfKCJpbnZhbGlkIHNl
Y3RvciBzaXplIGFyZ3VtZW50IikpOwotKwkJCWJyZWFrOwotIAkJZGVmYXVsdDoKLSAJCQllcnJ0
cnloZWxwKEVYSVRfRkFJTFVSRSk7Ci0gCQl9Ci1AQCAtMjM4Myw2ICsyMzk1LDggQEAgaW50IG1h
aW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKLSAJc2ZkaXNrX2luaXQoc2YpOwotIAlpZiAoYnl0
ZXMpCi0gCQlmZGlza19zZXRfc2l6ZV91bml0KHNmLT5jeHQsIEZESVNLX1NJWkVVTklUX0JZVEVT
KTsKLSsJaWYgKHVzZXJfc3MpCi0rCQlmZGlza19zYXZlX3VzZXJfc2VjdG9yX3NpemUoc2YtPmN4
dCwgdXNlcl9zcywgdXNlcl9zcyk7Ci0gCi0gCWlmIChvdXRhcmcpCi0gCQlpbml0X2ZpZWxkcyhO
VUxMLCBvdXRhcmcsIE5VTEwpOwotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2F2b2lkX3BhcmFsbGVs
X3Rlc3RzLnBhdGNoCmluZGV4IDhlYTAwZGJiOTUuLjJlNDk4ZmU2NzcgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9hdm9pZF9wYXJhbGxlbF90ZXN0
cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvYXZv
aWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGRhNThiNDE1MGY2
OTMyZGUzNmM5NjJlYTY1NzcxM2JjZjRlYTQ0YmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDg3NjZhNmNkNDFlM2MwYWRhYWRiNjNkOTA1NDc0NDEyYjE5NDRiOGEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBUdWRvciBGbG9yZWEgPHR1ZG9yLmZsb3JlYUBlbmVhLmNvbT4K
IERhdGU6IE1vbiwgMTQgSnVuIDIwMjEgMTQ6MDA6MzEgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0g
dXRpbC1saW51eDogQWRkIHB0ZXN0CkBAIC0xNCw3ICsxNCw3IEBAIFVwc3RyZWFtLVN0YXR1czog
SW5hcHByb3ByaWF0ZQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCA2
NTFlZjJiLi4yYTgwMTJlIDEwMDY0NAoraW5kZXggNDNhMjNhNS4uNGE4NDUzMSAxMDA2NDQKIC0t
LSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtMTEsNyArMTEsNyBAQCBB
Q19DT05GSUdfTUFDUk9fRElSKFttNF0pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91
dGlsLWxpbnV4L3V0aWwtbGludXgvY29uZmlndXJlLXNiaW5kaXIucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvY29uZmlndXJlLXNiaW5kaXIucGF0Y2gKaW5k
ZXggNzRhYmRjMjAzOC4uMTA4YmFiNjQ4NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
dXRpbC1saW51eC91dGlsLWxpbnV4L2NvbmZpZ3VyZS1zYmluZGlyLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9jb25maWd1cmUtc2JpbmRpci5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDM4N2Q3MTUxNmM5Nzg4OTljZmQ1NTZjYTUxMmY1MzBh
MjEyYjRhOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjFkN2QxZTNhOTlkNGYwZDBj
MWQ4NGNmYzczMzZhOWM0NDU0M2U5YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBo
aWwgQmx1bmRlbGwgPHBiQHBiY2wubmV0PgogRGF0ZTogTW9uLCAyNCBTZXAgMjAxMiAwNzoyNDo1
MSArMDEwMAogU3ViamVjdDogW1BBVENIXSB1dGlsLWxpbnV4OiBFbnN1cmUgdGhhdCAke3NiaW5k
aXJ9IGlzIHJlc3BlY3RlZApAQCAtMTQsNyArMTQsNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBw
cm9wcmlhdGUgW2NvbmZpZ3VyYXRpb25dCiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJl
LmFjCi1pbmRleCAyMzU5NGZmLi42NTFlZjJiIDEwMDY0NAoraW5kZXggYTVkOTEwMi4uNDNhMjNh
NSAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtMTEw
LDcgKzExMCwxMCBAQCBBQ19TVUJTVChbcnVuc3RhdGVkaXJdKQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5hbWVfZm9yX3N1
YnRlc3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvZGlz
cGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaAppbmRleCA4NzFiMGIyZDMwLi4wMzQzNWZi
NmE0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgv
ZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS91dGlsLWxpbnV4L3V0aWwtbGludXgvZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDU0NTBkMDMzOWNkN2VlMjdmNTNjMGYyZmFjMWNjNzRl
ZDliYmZiOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZGFjZDMxOTY1ZGZiNDkxYzU2
YTUwZWIyZjVjZTRiZjRkYWFjZDc5ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFR1
ZG9yIEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogRGF0ZTogVGh1LCAzIERlYyAyMDE1
IDA0OjA4OjAwICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIERpc3BsYXkgdGVzdG5hbWUgZm9yIHN1
YnRlc3QKQEAgLTEwLDEwICsxMCwxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBh
L3Rlc3RzL2Z1bmN0aW9ucy5zaCBiL3Rlc3RzL2Z1bmN0aW9ucy5zaAotaW5kZXggNWZlNWJhMC4u
YTZjNzAzZSAxMDA2NDQKK2luZGV4IDFkN2E0MjUuLmIxZjA5ODYgMTAwNjQ0CiAtLS0gYS90ZXN0
cy9mdW5jdGlvbnMuc2gKICsrKyBiL3Rlc3RzL2Z1bmN0aW9ucy5zaAotQEAgLTQ1MCw3ICs0NTAs
NyBAQCBmdW5jdGlvbiB0c19pbml0X3N1YnRlc3QgeworQEAgLTQ1NSw3ICs0NTUsNyBAQCBmdW5j
dGlvbiB0c19pbml0X3N1YnRlc3QgewogIAogIAlpZiBbICIkVFNfUEFSU0FCTEUiICE9ICJ5ZXMi
IF07IHRoZW4KICAJCVsgJFRTX05TVUJURVNUUyAtZXEgMSBdICYmIGVjaG8KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaAppbmRleCA3
MzQ1OTI2Yjg4Li5iMzczMTRmNzYxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGls
LWxpbnV4L3V0aWwtbGludXgvcHRlc3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRp
bC1saW51eC91dGlsLWxpbnV4L3B0ZXN0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmOWJl
NzNjM2UyYjBhNGYwOTIzOTUwZGNiMDU4YmU4NWQzZWU4ZWQ3IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBlOWZlMGNhNDdjZmFhNWZjMTYwYzIwY2YzYWZlMmM5MTJkYTNkZjBkIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVHVkb3IgRmxvcmVhIDx0dWRvci5mbG9yZWFAZW5l
YS5jb20+CiBEYXRlOiBUaHUsIDMgRGVjIDIwMTUgMDQ6MDg6MDAgKzAxMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gRGVmaW5lIFRFU1RTIHZhcmlhYmxlCkBAIC0xMCwxMCArMTAsMTAgQEAgVXBzdHJlYW0t
U3RhdHVzOiBQZW5kaW5nCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYg
LS1naXQgYS9NYWtlZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1pbmRleCA1MGFiOGQwLi43ZTIzNDBk
IDEwMDY0NAoraW5kZXggMDFlOTk3MC4uYzMzMTNmZiAxMDA2NDQKIC0tLSBhL01ha2VmaWxlLmFt
CiArKysgYi9NYWtlZmlsZS5hbQotQEAgLTY0LDYgKzY0LDcgQEAgdG1wZmlsZXNfREFUQSA9CitA
QCAtNjYsNiArNjYsNyBAQCBzeXN1c2Vyc19EQVRBID0KICBkaXN0X2Jhc2hjb21wbGV0aW9uX0RB
VEEgPQogIGNoZWNrX1BST0dSQU1TID0KICBkaXN0X2NoZWNrX1NDUklQVFMgPQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4XzIuNDAuNC5iYiBiL21l
dGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjQxLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eF8yLjQwLjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRp
bC1saW51eF8yLjQxLmJiCmluZGV4IDgxYmQyOThkZDkuLjYwNDRkNGFlMWMgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjQwLjQuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4XzIuNDEuYmIKQEAgLTEsMyAr
MSwyNSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1
cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZm
ZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFz
ZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBj
aGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFn
LgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4n
KQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIFJFQURNRS5saWNlbnNpbmcKKyMgKysrIFJF
QURNRS5saWNlbnNpbmcKKyMgQEAgLTIwLDYgKzIwLDggQEAKKyMgIAorIyAgICAgKiBCU0QtNC1D
bGF1c2UtVUMgICAgLSBCU0QgNC1DbGF1c2UgVW5pdmVyc2l0eSBvZiBDYWxpZm9ybmlhLVNwZWNp
ZmljCisjICAKKyMgKyAgICogRVVQTC0xLjIgICAgICAgICAgIC0gRXVyb3BlYW4gVW5pb24gUHVi
bGljIExpY2VuY2UgdmVyc2lvbiAxLjIKKyMgKworIyAgICAgKiBQdWJsaWMgRG9tYWluCisjICAK
KyMgIFBsZWFzZSwgY2hlY2sgdGhlIHNvdXJjZSBjb2RlIGZvciBtb3JlIGRldGFpbHMuIEEgbGlj
ZW5zZSBpcyB1c3VhbGx5IGF0IHRoZSBzdGFydAorIyAKKyMKKwogcmVxdWlyZSB1dGlsLWxpbnV4
LmluYwogCiBpbmhlcml0IGF1dG90b29scyBnZXR0ZXh0IG1hbnBhZ2VzIHBrZ2NvbmZpZyBzeXN0
ZW1kIHVwZGF0ZS1hbHRlcm5hdGl2ZXMgcHl0aG9uMy1kaXIgYmFzaC1jb21wbGV0aW9uIHB0ZXN0
IGd0ay1kb2MKLS0gCjIuNDcuMQoK

--===============1557262657042765735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/e2fsprogs/e2fsprogs-dbg: PKGSIZE changed from 5766120 to 5766144 (+0%)
packages/core2-64-poky-linux/util-linux-libuuid: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux-libuuid: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux-libuuid: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.4.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c file://0001-cfdisk-add-sector-size-commanand-line-option.patch file://0002-sfdisk-add-sector-size-commanand-line-option.patch" to "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PKGSIZE changed from 65856 to 68448 (+4%)
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PKGSIZE changed from 4367 to 4566 (+5%)
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-doc: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-doc: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-locale: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-locale: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-staticdev: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-staticdev: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid: PKGSIZE changed from 30856 to 34952 (+13%)
packages/core2-64-poky-linux/util-linux: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.4.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c file://0001-cfdisk-add-sector-size-commanand-line-option.patch file://0002-sfdisk-add-sector-size-commanand-line-option.patch" to "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c"
packages/core2-64-poky-linux/util-linux: PACKAGES: added "util-linux-coresched util-linux-bits"
packages/core2-64-poky-linux/util-linux/util-linux-addpart: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-addpart: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-agetty: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-agetty: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-agetty: PKGSIZE changed from 105776 to 109872 (+4%)
packages/core2-64-poky-linux/util-linux/util-linux-bash-completion: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-bash-completion: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-bash-completion: PKGSIZE changed from 108898 to 110951 (+2%)
packages/core2-64-poky-linux/util-linux/util-linux-blkdiscard: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkdiscard: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-blkid: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkid: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-blkid: PKGSIZE changed from 137376 to 141472 (+3%)
packages/core2-64-poky-linux/util-linux/util-linux-blkpr: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkpr: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-blkzone: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkzone: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-blockdev: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blockdev: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-cal: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-cal: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-cal: PKGSIZE changed from 72160 to 76256 (+6%)
packages/core2-64-poky-linux/util-linux/util-linux-cfdisk: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-cfdisk: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-chcpu: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chcpu: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-chfn: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chfn: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-chfn: PKGSIZE changed from 39032 to 55424 (+42%)
packages/core2-64-poky-linux/util-linux/util-linux-chmem: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chmem: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-choom: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-choom: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-chrt: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chrt: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-chsh: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chsh: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-chsh: PKGSIZE changed from 34936 to 51328 (+47%)
packages/core2-64-poky-linux/util-linux/util-linux-col: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-col: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-colcrt: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-colcrt: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-colrm: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-colrm: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-colrm: PKGSIZE changed from 30840 to 34936 (+13%)
packages/core2-64-poky-linux/util-linux/util-linux-column: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-column: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-column: PKGSIZE changed from 59512 to 63608 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-ctrlaltdel: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ctrlaltdel: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-dbg: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dbg: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-dbg: PKGSIZE changed from 28308320 to 29874136 (+6%)
packages/core2-64-poky-linux/util-linux/util-linux-dbg: FILELIST: added "/usr/lib/util-linux/ptest/.debug/sample-mount-listmount /usr/bin/.debug/coresched /usr/lib/util-linux/ptest/.debug/test_sigstate /usr/bin/.debug/bits /usr/lib/util-linux/ptest/.debug/sample-scols-wrap-repeat /usr/lib/util-linux/ptest/.debug/sample-mount-statmount /usr/lib/util-linux/ptest/.debug/test_uuid_time"
packages/core2-64-poky-linux/util-linux/util-linux-delpart: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-delpart: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-dev: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dev: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-dev: PKGSIZE changed from 111878 to 115388 (+3%)
packages/core2-64-poky-linux/util-linux/util-linux-dmesg: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dmesg: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-doc: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-doc: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-doc: PKGSIZE changed from 927021 to 965804 (+4%)
packages/core2-64-poky-linux/util-linux/util-linux-doc: FILELIST: added "/usr/share/man/man1/coresched.1 /usr/share/man/man1/bits.1"
packages/core2-64-poky-linux/util-linux/util-linux-eject: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-eject: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-enosys: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-enosys: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-enosys: PKGSIZE changed from 51320 to 59512 (+16%)
packages/core2-64-poky-linux/util-linux/util-linux-exch: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-exch: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-fadvise: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fadvise: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-fallocate: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fallocate: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-fcntl-lock: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fcntl-lock: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-fdisk: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fdisk: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-fdisk: PKGSIZE changed from 166064 to 174256 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-fincore: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fincore: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-findfs: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-findfs: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-findmnt: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-findmnt: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-findmnt: PKGSIZE changed from 89688 to 97928 (+9%)
packages/core2-64-poky-linux/util-linux/util-linux-flock: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-flock: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-fsck.cramfs: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fsck.cramfs: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-fsck: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fsck: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-fsck: PKGSIZE changed from 59568 to 59520 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-fsfreeze: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fsfreeze: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-fstrim: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fstrim: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-getopt: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-getopt: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-hardlink: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-hardlink: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-hardlink: PKGSIZE changed from 59624 to 63712 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-hexdump: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-hexdump: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-hwclock: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-hwclock: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-ionice: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ionice: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-ipcmk: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ipcmk: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-ipcrm: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ipcrm: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-ipcrm: PKGSIZE changed from 34944 to 75904 (+117%)
packages/core2-64-poky-linux/util-linux/util-linux-ipcs: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ipcs: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-ipcs: PKGSIZE changed from 80000 to 84096 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-irqtop: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-irqtop: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-irqtop: PKGSIZE changed from 59688 to 63784 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-isosize: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-isosize: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-kill: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-kill: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-kill: PKGSIZE changed from 71808 to 75904 (+6%)
packages/core2-64-poky-linux/util-linux/util-linux-last: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-last: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lastlog2: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lastlog2: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-ldattach: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ldattach: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-libblkid: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libblkid: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-libblkid: PKGSIZE changed from 384025 to 392153 (+2%)
packages/core2-64-poky-linux/util-linux/util-linux-libfdisk: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libfdisk: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-liblastlog2: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-liblastlog2: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-libmount: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libmount: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-libmount: PKGSIZE changed from 461481 to 486097 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-libsmartcols: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libsmartcols: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-libsmartcols: PKGSIZE changed from 301205 to 309397 (+3%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ca: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ca: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-cs: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-cs: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-cs: PKGSIZE changed from 588560 to 573925 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-da: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-da: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-da: PKGSIZE changed from 399757 to 391984 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-de: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-de: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-de: PKGSIZE changed from 587327 to 574034 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PKGSIZE changed from 562594 to 556097 (-1%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-et: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-et: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-eu: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-eu: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-fi: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-fi: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-fi: PKGSIZE changed from 80506 to 79928 (-1%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-fr: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-fr: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-fr: PKGSIZE changed from 601690 to 629848 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-gl: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-gl: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-hr: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-hr: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-hr: PKGSIZE changed from 577068 to 603531 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-hu: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-hu: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-id: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-id: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-it: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-it: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ja: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ja: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ja: PKGSIZE changed from 652723 to 637195 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ka: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ka: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ka: PKGSIZE changed from 56609 to 56303 (-1%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ko: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ko: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ko: PKGSIZE changed from 589630 to 618010 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PKGSIZE changed from 330471 to 496173 (+50%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pl: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-pl: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-pl: PKGSIZE changed from 582098 to 609556 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt-br: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt-br: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt-br: PKGSIZE changed from 517533 to 507272 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PKGSIZE changed from 476352 to 466733 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ro: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ro: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ro: PKGSIZE changed from 612239 to 641092 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ru: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ru: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ru: PKGSIZE changed from 198243 to 197168 (-1%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-sk: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sk: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sl: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sl: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sr: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sr: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sr: PKGSIZE changed from 716920 to 699887 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-sv: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sv: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sv: PKGSIZE changed from 444868 to 435493 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-tr: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-tr: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-tr: PKGSIZE changed from 348477 to 342109 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-uk: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-uk: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-uk: PKGSIZE changed from 750185 to 784402 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-vi: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-vi: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-vi: PKGSIZE changed from 315396 to 310865 (-1%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-cn: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-cn: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-cn: PKGSIZE changed from 392150 to 385216 (-2%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-tw: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-tw: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-logger: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-logger: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-logger: PKGSIZE changed from 56032 to 60128 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-look: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-look: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-losetup: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-losetup: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lsblk: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsblk: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lsclocks: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsclocks: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lscpu: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lscpu: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lsfd: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsfd: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lsfd: PKGSIZE changed from 216296 to 232744 (+8%)
packages/core2-64-poky-linux/util-linux/util-linux-lsipc: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsipc: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lsipc: PKGSIZE changed from 100472 to 112760 (+12%)
packages/core2-64-poky-linux/util-linux/util-linux-lsirq: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsirq: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lsirq: PKGSIZE changed from 39208 to 47400 (+21%)
packages/core2-64-poky-linux/util-linux/util-linux-lslocks: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lslocks: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lslocks: PKGSIZE changed from 76328 to 80424 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-lslogins: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lslogins: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lslogins: RDEPENDS: added "util-linux-liblastlog2 (['>= 2.41'])"
packages/core2-64-poky-linux/util-linux/util-linux-lsmem: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsmem: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lsns: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsns: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-lsns: PKGSIZE changed from 84088 to 92280 (+10%)
packages/core2-64-poky-linux/util-linux/util-linux-mcookie: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mcookie: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-mesg: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mesg: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-mkfs.cramfs: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mkfs.cramfs: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-mkfs: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mkfs: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-mkswap: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mkswap: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-more: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-more: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-mount: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mount: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-mount: PKGSIZE changed from 63652 to 67748 (+6%)
packages/core2-64-poky-linux/util-linux/util-linux-mountpoint: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mountpoint: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-namei: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-namei: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-nologin: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-nologin: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-nsenter: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-nsenter: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-nsenter: PKGSIZE changed from 80272 to 84368 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-partx: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-partx: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-pipesz: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-pipesz: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-pivot-root: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-pivot-root: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-prlimit: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-prlimit: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-ptest: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ptest: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-ptest: PKGSIZE changed from 6136933 to 6509722 (+6%)
packages/core2-64-poky-linux/util-linux/util-linux-ptest: FILELIST: added "/usr/lib/util-linux/ptest/tests/ts/su/environ /usr/lib/util-linux/ptest/tests/expected/blkid/output-value-cache /usr/lib/util-linux/ptest/tests/expected/blkid/output-value-probe /usr/lib/util-linux/ptest/tests/ts/findmnt/filterQ /usr/lib/util-linux/ptest/tests/expected/kill/decode /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options /usr/lib/util-linux/ptest/tests/expected/misc/optstr /usr/lib/util-linux/ptest/tests/expected/colcrt/regressions-hang1.err /usr/lib/util-linux/ptest/tests/ts/lsns/netns-from-sock /usr/lib/util-linux/ptest/tests/ts/schedutils/coresched /usr/lib/util-linux/ptest/tests/expected/misc/bits-width /usr/lib/util-linux/ptest/tests/ts/misc/optstr /usr/lib/util-linux/ptest/test_sigstate /usr/lib/util-linux/ptest/tests/ts/misc/bits /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-new-child-with-new-cookie /usr/lib/util-linux/ptest/tests/ts/lsfd/error-eaccess /usr/lib/u
 til-linux/ptest/tests/ts/lsfd/option-hyperlink /usr/lib/util-linux/ptest/tests/expected/mount/xnocanon-symlink-over-symlink /usr/lib/util-linux/ptest/tests/expected/misc/bits-not /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-neg /usr/lib/util-linux/ptest/tests/ts/lslogins/checkuser /usr/lib/util-linux/ptest/tests/ts/lsns/filter /usr/lib/util-linux/ptest/tests/expected/misc/bits-truncate /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-copy-from-child-to-parent /usr/lib/util-linux/ptest/tests/ts/uuid/time /usr/lib/util-linux/ptest/tests/expected/misc/bits-and /usr/lib/util-linux/ptest/tests/expected/misc/bits-default /usr/lib/util-linux/ptest/tests/expected/lscpu/lscpu-rv64-milkvpioneer /usr/lib/util-linux/ptest/tests/expected/misc/bits-mask /usr/lib/util-linux/ptest/tests/expected/column/ansiescape /usr/lib/util-linux/ptest/tests/expected/blkid/output-udev-probe /usr/lib/util-linux/ptest/tests/expected/uuid/time /usr/lib/util-linux/ptest/tests/expecte
 d/mount/xnocanon-file-over-symlink /usr/lib/util-linux/ptest/tests/ts/findmnt/listmount /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-no /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-exclusive /usr/lib/util-linux/ptest/sample-scols-wrap-repeat /usr/lib/util-linux/ptest/tests/expected/lslogins/checkuser /usr/lib/util-linux/ptest/tests/ts/setpriv/seccomp /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-nameval-neg /usr/lib/util-linux/ptest/tests/expected/misc/bits-or /usr/lib/util-linux/ptest/tests/expected/misc/bits /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-copy-from-parent-to-nested-child /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-types /usr/lib/util-linux/ptest/tests/expected/colcrt/regressions-crash2.err /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-fd /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-types-neg /usr/lib/util-linux/ptest/tests/ts/nsenter/enter-via-socket /usr/lib/uti
 l-linux/ptest/tests/expected/lsfd/option-hyperlink-character-device /usr/lib/util-linux/ptest/tests/ts/lsns/filedesc /usr/lib/util-linux/ptest/tests/expected/blkid/output-json-probe /usr/lib/util-linux/ptest/tests/expected/schedutils/chrt-batch-custom-slice /usr/lib/util-linux/ptest/tests/ts/lscpu/dumps/arm-A510-A710-A715-X3.tar.gz /usr/lib/util-linux/ptest/tests/expected/lsns/netns-from-sock /usr/lib/util-linux/ptest/tests/ts/lsfd/mkfds-foreign-sockets /usr/lib/util-linux/ptest/tests/expected/blkid/output-device-probe /usr/lib/util-linux/ptest/tests/expected/blkid/output-export-probe /usr/lib/util-linux/ptest/tests/ts/lsfd/error-eperm /usr/lib/util-linux/ptest/tests/expected/misc/bits-grouped-mask /usr/lib/util-linux/ptest/tests/expected/lsfd/mkfds-vsock /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-get-cookie-parent-pid /usr/lib/util-linux/ptest/tests/ts/column/files/ansiescape /usr/lib/util-linux/ptest/test
 s/expected/misc/flock-fcntl-time-check /usr/lib/util-linux/ptest/sample-mount-listmount /usr/lib/util-linux/ptest/tests/expected/lsfd/option-hyperlink-regular-file /usr/lib/util-linux/ptest/tests/ts/lscpu/dumps/rv64-milkvpioneer.tar.gz /usr/lib/util-linux/ptest/tests/expected/setpriv/seccomp /usr/lib/util-linux/ptest/tests/ts/kill/decode /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-no-multi /usr/lib/util-linux/ptest/tests/expected/lsfd/error-eaccess /usr/lib/util-linux/ptest/tests/expected/su/environ /usr/lib/util-linux/ptest/tests/expected/misc/bits-parse-mask /usr/lib/util-linux/ptest/tests/ts/blkid/output /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-nameval /usr/lib/util-linux/ptest/tests/expected/blkid/output-udev-cache /usr/lib/util-linux/ptest/tests/expected/misc/bits-width-truncate /usr/lib/util-linux/ptest/tests/ts/cal/terminal-colors.d/cal.scheme /usr/lib/util-linux/ptest/tests/expected/lsfd/error-eperm /usr/lib/util-linux/ptest/tests
 /expected/lsfd/column-source-btrfs /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-shared /usr/lib/util-linux/ptest/tests/expected/liblastlog2/write_read_user.err /usr/lib/util-linux/ptest/tests/expected/mount/xnocanon-symlink-over-file /usr/lib/util-linux/ptest/tests/expected/misc/bits-parse-range /usr/lib/util-linux/ptest/tests/expected/colcrt/regressions-crash1.err /usr/lib/util-linux/ptest/tests/expected/blkid/output-full-probe /usr/lib/util-linux/ptest/tests/ts/blkid/blkid-output.img.xz /usr/lib/util-linux/ptest/tests/expected/blkid/output-export-cache /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-types-multi /usr/lib/util-linux/ptest/test_uuid_time /usr/lib/util-linux/ptest/tests/expected/blkid/output-full-cache /usr/lib/util-linux/ptest/tests/expected/blkid/output-json-cache /usr/lib/util-linux/ptest/tests/ts/column/ansiescape /usr/lib/util-linux/ptest/tests/expected/misc/bits-parse-grouped-mask /usr/lib/util-linux/ptest/tests/ts/lslogins/create_db.sql /u
 sr/lib/util-linux/ptest/tests/expected/schedutils/coresched-get-cookie-own-pid /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-timeout /usr/lib/util-linux/ptest/tests/ts/mount/xnocanon /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-name /usr/lib/util-linux/ptest/tests/expected/nsenter/enter-via-socket /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-nameval-multi /usr/lib/util-linux/ptest/tests/expected/misc/bits-binary /usr/lib/util-linux/ptest/tests/expected/lscpu/lscpu-arm-A510-A710-A715-X3 /usr/lib/util-linux/ptest/tests/expected/misc/bits-stdin /usr/lib/util-linux/ptest/tests/expected/misc/bits-xor /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-no-fork /usr/lib/util-linux/ptest/tests/expected/blkid/output-device-cache /usr/lib/util-linux/ptest/tests/expected/schedutils/chrt-other-custom-slice /usr/lib/util-linux/ptest/tests/expected/lsns/filter /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-vs-flock /usr/lib/util
 -linux/ptest/tests/expected/schedutils/set-cookie-parent-pid /usr/lib/util-linux/ptest/tests/expected/misc/bits-list /usr/lib/util-linux/ptest/tests/ts/lsfd/column-source-btrfs /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-non-block /usr/lib/util-linux/ptest/tests/ts/lsfd/mkfds-vsock /usr/lib/util-linux/ptest/sample-mount-statmount /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-set-cookie-parent-pid.err /usr/lib/util-linux/ptest/tests/expected/lsfd/option-hyperlink-deleted-file /usr/lib/util-linux/ptest/tests/expected/lsfd/mkfds-foreign-sockets"
packages/core2-64-poky-linux/util-linux/util-linux-readprofile: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-readprofile: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-rename: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rename: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-renice: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-renice: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-resizepart: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-resizepart: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-rev: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rev: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-rfkill: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rfkill: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-rtcwake: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rtcwake: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-runuser: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-runuser: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-script: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-script: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-scriptlive: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-scriptlive: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-scriptreplay: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-scriptreplay: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-setarch: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setarch: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-setpgid: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setpgid: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-setpriv: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setpriv: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-setpriv: PKGSIZE changed from 88200 to 92296 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-setsid: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setsid: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-setterm: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setterm: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-sfdisk: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-sfdisk: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-sfdisk: PKGSIZE changed from 157816 to 161912 (+3%)
packages/core2-64-poky-linux/util-linux/util-linux-src: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-src: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-src: PKGSIZE changed from 253547 to 259639 (+2%)
packages/core2-64-poky-linux/util-linux/util-linux-staticdev: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-staticdev: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-su: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-su: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-sulogin: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-sulogin: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-swaplabel: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swaplabel: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-swapoff: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swapoff: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-swapoff: PKGSIZE changed from 22656 to 51328 (+127%)
packages/core2-64-poky-linux/util-linux/util-linux-swapon: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swapon: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-swapon: PKGSIZE changed from 55424 to 59520 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-swaponoff: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swaponoff: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-switch-root: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-switch-root: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-taskset: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-taskset: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-taskset: PKGSIZE changed from 63616 to 67712 (+6%)
packages/core2-64-poky-linux/util-linux/util-linux-uclampset: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uclampset: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-ul: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ul: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-umount: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-umount: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-umount: PKGSIZE changed from 34944 to 55424 (+59%)
packages/core2-64-poky-linux/util-linux/util-linux-unshare: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-unshare: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-utmpdump: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-utmpdump: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-uuidd: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uuidd: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-uuidd: PKGSIZE changed from 39544 to 43640 (+10%)
packages/core2-64-poky-linux/util-linux/util-linux-uuidgen: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uuidgen: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-uuidparse: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uuidparse: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-waitpid: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-waitpid: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-wall: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-wall: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-wdctl: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-wdctl: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-wdctl: PKGSIZE changed from 71824 to 75896 (+6%)
packages/core2-64-poky-linux/util-linux/util-linux-whereis: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-whereis: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-whereis: PKGSIZE changed from 31280 to 30832 (-1%)
packages/core2-64-poky-linux/util-linux/util-linux-wipefs: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-wipefs: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-write: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-write: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-zramctl: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux-zramctl: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux-zramctl: PKGSIZE changed from 133352 to 133360 (+0%)
packages/core2-64-poky-linux/util-linux/util-linux: PKGV changed from 2.40.4 [default] to 2.41 [default]
packages/core2-64-poky-linux/util-linux/util-linux: PV changed from "2.40.4" to "2.41"
packages/core2-64-poky-linux/util-linux/util-linux: RRECOMMENDS: added "util-linux-coresched util-linux-bits"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.1-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.1-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.1-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.1-gdb.py was removed
Changes to packages/x86_64-linux/util-linux-native (sysroot):
  /usr/bin/bits was added
  /usr/bin/coresched was added

--===============1557262657042765735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid: PKGSIZE changed from 30856 to 34952 (+13%)
packages/core2-64-poky-linux/util-linux: PACKAGES: added "util-linux-coresched util-linux-bits"
packages/core2-64-poky-linux/util-linux/util-linux-chfn: PKGSIZE changed from 39032 to 55424 (+42%)
packages/core2-64-poky-linux/util-linux/util-linux-chsh: PKGSIZE changed from 34936 to 51328 (+47%)
packages/core2-64-poky-linux/util-linux/util-linux-colrm: PKGSIZE changed from 30840 to 34936 (+13%)
packages/core2-64-poky-linux/util-linux/util-linux-doc: FILELIST: added "/usr/share/man/man1/coresched.1 /usr/share/man/man1/bits.1"
packages/core2-64-poky-linux/util-linux/util-linux-enosys: PKGSIZE changed from 51320 to 59512 (+16%)
packages/core2-64-poky-linux/util-linux/util-linux-ipcrm: PKGSIZE changed from 34944 to 75904 (+117%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PKGSIZE changed from 330471 to 496173 (+50%)
packages/core2-64-poky-linux/util-linux/util-linux-lsipc: PKGSIZE changed from 100472 to 112760 (+12%)
packages/core2-64-poky-linux/util-linux/util-linux-lsirq: PKGSIZE changed from 39208 to 47400 (+21%)
packages/core2-64-poky-linux/util-linux/util-linux-lslogins: RDEPENDS: added "util-linux-liblastlog2 (['>= 2.41'])"
packages/core2-64-poky-linux/util-linux/util-linux-ptest: FILELIST: added "/usr/lib/util-linux/ptest/tests/expected/lsfd/mkfds-vsock /usr/lib/util-linux/ptest/sample-mount-statmount /usr/lib/util-linux/ptest/tests/ts/cal/terminal-colors.d/cal.scheme /usr/lib/util-linux/ptest/tests/expected/misc/bits-default /usr/lib/util-linux/ptest/tests/expected/blkid/output-export-cache /usr/lib/util-linux/ptest/tests/expected/lsfd/error-eperm /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl /usr/lib/util-linux/ptest/tests/expected/mount/xnocanon-symlink-over-file /usr/lib/util-linux/ptest/tests/ts/lsfd/error-eperm /usr/lib/util-linux/ptest/tests/ts/lsns/filter /usr/lib/util-linux/ptest/tests/expected/colcrt/regressions-hang1.err /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-types-multi /usr/lib/util-linux/ptest/tests/expected/misc/bits-list /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-set-cookie-parent-pid.err /usr/lib/util-linux/ptest/tests/ts/mount/xnocanon 
 /usr/lib/util-linux/ptest/tests/expected/lscpu/lscpu-rv64-milkvpioneer /usr/lib/util-linux/ptest/tests/ts/lsfd/column-source-btrfs /usr/lib/util-linux/ptest/tests/expected/column/ansiescape /usr/lib/util-linux/ptest/tests/expected/lsfd/column-source-btrfs /usr/lib/util-linux/ptest/tests/expected/misc/bits-stdin /usr/lib/util-linux/ptest/tests/ts/lslogins/checkuser /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-exclusive /usr/lib/util-linux/ptest/tests/expected/misc/bits-xor /usr/lib/util-linux/ptest/tests/ts/lsfd/mkfds-foreign-sockets /usr/lib/util-linux/ptest/tests/expected/lscpu/lscpu-arm-A510-A710-A715-X3 /usr/lib/util-linux/ptest/tests/expected/blkid/output-udev-probe /usr/lib/util-linux/ptest/tests/expected/blkid/output-value-cache /usr/lib/util-linux/ptest/tests/expected/schedutils/set-cookie-parent-pid /usr/lib/util-linux/ptest/tests/expected/blkid/output-value-probe /usr/lib/util-linux/ptest/tests/ts/lscpu/dumps/rv64-milkvpioneer.tar.gz /usr/lib/util-linux/ptest/t
 ests/expected/blkid/output-full-probe /usr/lib/util-linux/ptest/tests/expected/misc/bits-mask /usr/lib/util-linux/ptest/tests/expected/lsfd/option-hyperlink-deleted-file /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options /usr/lib/util-linux/ptest/tests/expected/su/environ /usr/lib/util-linux/ptest/tests/ts/findmnt/filterQ /usr/lib/util-linux/ptest/tests/ts/blkid/output /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-get-cookie-parent-pid /usr/lib/util-linux/ptest/tests/expected/misc/bits-truncate /usr/lib/util-linux/ptest/tests/expected/blkid/output-full-cache /usr/lib/util-linux/ptest/tests/expected/misc/bits-binary /usr/lib/util-linux/ptest/tests/ts/column/files/ansiescape /usr/lib/util-linux/ptest/tests/expected/blkid/output-json-cache /usr/lib/util-linux/ptest/tests/ts/lsns/filedesc /usr/lib/util-linux/ptest/tests/expected/colcrt/regressions-crash2.err /usr/lib/util-linux/ptest/tests/expected/misc/bits-parse-grouped-mask /usr/lib/util-linux/ptest/test
 s/expected/mount/xnocanon-symlink-over-symlink /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-new-child-with-new-cookie /usr/lib/util-linux/ptest/tests/expected/kill/decode /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-neg /usr/lib/util-linux/ptest/tests/expected/lsfd/option-hyperlink-character-device /usr/lib/util-linux/ptest/tests/expected/schedutils/chrt-batch-custom-slice /usr/lib/util-linux/ptest/tests/expected/misc/bits-width /usr/lib/util-linux/ptest/tests/ts/lsfd/error-eaccess /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-types-neg /usr/lib/util-linux/ptest/test_sigstate /usr/lib/util-linux/ptest/test_uuid_time /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-timeout /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-time-check /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-copy-from-parent-to-nested-child /usr/lib/util-linux/ptest/tests/expected/liblastlog2/write_read_user.err /usr/lib/util-linux/pt
 est/tests/expected/findmnt/filterQ-options-no /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-no-multi /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-no-fork /usr/lib/util-linux/ptest/tests/expected/lsfd/option-hyperlink-regular-file /usr/lib/util-linux/ptest/tests/expected/blkid/output-json-probe /usr/lib/util-linux/ptest/tests/ts/setpriv/seccomp /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-nameval-multi /usr/lib/util-linux/ptest/tests/ts/schedutils/coresched /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-copy-from-child-to-parent /usr/lib/util-linux/ptest/tests/expected/lsns/netns-from-sock /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-fd /usr/lib/util-linux/ptest/tests/expected/lsfd/mkfds-foreign-sockets /usr/lib/util-linux/ptest/sample-mount-listmount /usr/lib/util-linux/ptest/tests/expected/blkid/output-device-cache /usr/lib/util-linux/ptest/tests/expected/misc/bits-parse-mask /usr/lib/util-linux/ptest/t
 ests/expected/findmnt/filterQ-options-nameval-neg /usr/lib/util-linux/ptest/tests/expected/mount/xnocanon-file-over-symlink /usr/lib/util-linux/ptest/tests/ts/lsfd/option-hyperlink /usr/lib/util-linux/ptest/tests/ts/lsfd/mkfds-vsock /usr/lib/util-linux/ptest/tests/ts/blkid/blkid-output.img.xz /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-vs-flock /usr/lib/util-linux/ptest/tests/ts/su/environ /usr/lib/util-linux/ptest/tests/ts/findmnt/listmount /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-shared /usr/lib/util-linux/ptest/tests/ts/lsns/netns-from-sock /usr/lib/util-linux/ptest/tests/expected/misc/flock-fcntl-non-block /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-name /usr/lib/util-linux/ptest/tests/expected/schedutils/coresched-get-cookie-own-pid /usr/lib/util-linux/ptest/tests/ts/uuid/time /usr/lib/util-linux/ptest/tests/expected/findmnt/filterQ-options-nameval /usr/lib/util-linux/ptest/tests/expected/colcrt/regressions-crash1.err /usr/lib
 /util-linux/ptest/tests/expected/findmnt/filterQ-types /usr/lib/util-linux/ptest/tests/ts/misc/bits /usr/lib/util-linux/ptest/tests/expected/nsenter/enter-via-socket /usr/lib/util-linux/ptest/tests/ts/column/ansiescape /usr/lib/util-linux/ptest/tests/expected/misc/optstr /usr/lib/util-linux/ptest/tests/expected/misc/bits /usr/lib/util-linux/ptest/tests/expected/misc/bits-or /usr/lib/util-linux/ptest/tests/expected/misc/bits-grouped-mask /usr/lib/util-linux/ptest/tests/expected/uuid/time /usr/lib/util-linux/ptest/tests/expected/lsns/filter /usr/lib/util-linux/ptest/tests/expected/blkid/output-device-probe /usr/lib/util-linux/ptest/tests/expected/blkid/output-export-probe /usr/lib/util-linux/ptest/sample-scols-wrap-repeat /usr/lib/util-linux/ptest/tests/expected/blkid/output-udev-cache /usr/lib/util-linux/ptest/tests/ts/nsenter/enter-via-socket /usr/lib/util-linux/ptest/tests/expected/misc/bits-parse-range /usr/lib/util-linux/ptest/tests/ts/kill/decode /usr/lib/util-linux/ptest/tests/
 ts/lscpu/dumps/arm-A510-A710-A715-X3.tar.gz /usr/lib/util-linux/ptest/tests/expected/schedutils/chrt-other-custom-slice /usr/lib/util-linux/ptest/tests/expected/lslogins/checkuser /usr/lib/util-linux/ptest/tests/expected/lsfd/error-eaccess /usr/lib/util-linux/ptest/tests/ts/lslogins/create_db.sql /usr/lib/util-linux/ptest/tests/ts/misc/optstr /usr/lib/util-linux/ptest/tests/expected/setpriv/seccomp /usr/lib/util-linux/ptest/tests/expected/misc/bits-and /usr/lib/util-linux/ptest/tests/expected/misc/bits-width-truncate /usr/lib/util-linux/ptest/tests/expected/misc/bits-not"
packages/core2-64-poky-linux/util-linux/util-linux-swapoff: PKGSIZE changed from 22656 to 51328 (+127%)
packages/core2-64-poky-linux/util-linux/util-linux-umount: PKGSIZE changed from 34944 to 55424 (+59%)
packages/core2-64-poky-linux/util-linux/util-linux-uuidd: PKGSIZE changed from 39544 to 43640 (+10%)
packages/core2-64-poky-linux/util-linux/util-linux: RRECOMMENDS: added "util-linux-coresched util-linux-bits"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.1-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.1-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.1-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.1/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.1-gdb.py was removed
Changes to packages/x86_64-linux/util-linux-native (sysroot):
  /usr/bin/bits was added
  /usr/bin/coresched was added

--===============1557262657042765735==--

