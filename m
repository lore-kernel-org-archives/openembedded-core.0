Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA01EEEEC34
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:02 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.29483.1694804396105084019
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UC9LECe4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VNwF3IMl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018a9a36c5b9-0d775b60-b614-488b-a187-531cc98b715d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3k/fuo3zyoCwxC5M69o6tIGpk8jkNOZ3B3GmohP7DPk=;
	b=UC9LECe44+SyO0NtD6TFul5CHllPhdcABRDxE5pYNLcLcMucV5tJLQY2y8Tx6M/1
	S0VlFMps8et1U5Y6TDHsk6hy4V8X+Ip2jDtuBBJ2fGRomIt5QkwdIyOeVOyUSzsiCU/
	bzyzjs5w+P6VXQQAMr9Epoue3wR4wjUeAyfob92U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3k/fuo3zyoCwxC5M69o6tIGpk8jkNOZ3B3GmohP7DPk=;
	b=VNwF3IMlmOAohpsycRnD0izgbiTwjtZUmQPEaffv+GMnI+0V2B3g7R+LcCg1CQ2U
	OzbMYV4cSPm0hawFCytzRgXvLC0guQoHuUWh2qloA7Lswlz6uPrSYpyyHFSK6GLhD8B
	eMAJL3KXFgxLxXt7OIMxRb3OUjDsW7fPpH94SdsE=
Content-Type: multipart/mixed; boundary="===============5580864844222860770=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-utils: upgrading to 1.2.10 FAILED
Message-ID: <0101018a9a36c5b9-0d775b60-b614-488b-a187-531cc98b715d-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187758

--===============5580864844222860770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-utils* to *1.2.10* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-alsa-utils-upgrade-1.2.9-1.2.10.patch
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
From 97be7a6d064513de30a1afcba4726b0fc1638462 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 16:58:21 +0000
Subject: [PATCH] alsa-utils: upgrade 1.2.9 -> 1.2.10

---
 ...dd-define-to-compile-with-glibc-2.38.patch | 39 -------------------
 ...ompilation-when-building-in-a-subdir.patch | 35 -----------------
 ...sa-utils_1.2.9.bb => alsa-utils_1.2.10.bb} |  7 +---
 3 files changed, 2 insertions(+), 79 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-add-define-to-compile-with-glibc-2.38.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-fix-compilation-when-building-in-a-subdir.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.9.bb => alsa-utils_1.2.10.bb} (95%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-add-define-to-compile-with-glibc-2.38.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-add-define-to-compile-with-glibc-2.38.patch
deleted file mode 100644
index 8c23fb2cec..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-add-define-to-compile-with-glibc-2.38.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From a610f4c21b083c0f9cf62ad2251dfadc98abb50e Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Sat, 22 Jul 2023 15:36:09 +0000
-Subject: [PATCH] alsactl: add define to compile with glibc 2.38
-
-strlcat and strlcpy have been added to glibc 2.38.
-update the defines to use the glibc versions, and not conflict with
-string.h.
-
-ref:
-- https://sourceware.org/git/?p=glibc.git;a=commit;h=454a20c8756c9c1d55419153255fc7692b3d2199
-
-Fixes: https://github.com/alsa-project/alsa-utils/pull/225
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Upstream-Status: Backport [https://github.com/alsa-project/alsa-utils/commit/d6a71bfbde9e1710743d3a446c6ea3b41c45234e]
----
- alsactl/init_sysdeps.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/alsactl/init_sysdeps.c b/alsactl/init_sysdeps.c
-index 3aca1b4..f09b1ae 100644
---- a/alsactl/init_sysdeps.c
-+++ b/alsactl/init_sysdeps.c
-@@ -18,6 +18,7 @@
-  */
- 
- #if defined(__GLIBC__) && !(defined(__UCLIBC__) && defined(__USE_BSD))
-+#if !(__GLIBC_PREREQ(2, 38))
- static size_t strlcpy(char *dst, const char *src, size_t size)
- {
- 	size_t bytes = 0;
-@@ -60,4 +61,5 @@ static size_t strlcat(char *dst, const char *src, size_t size)
- 	*q = '\0';
- 	return bytes;
- }
-+#endif /* !(__GLIBC_PREREQ(2, 38)) */
- #endif /* __GLIBC__ */
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-fix-compilation-when-building-in-a-subdir.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-fix-compilation-when-building-in-a-subdir.patch
deleted file mode 100644
index 3b3fe5345a..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-fix-compilation-when-building-in-a-subdir.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 44636a7c5862538def0d2fac074772cc39a22a15 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Tue, 16 May 2023 02:27:59 +1000
-Subject: [PATCH] alsactl: fix compilation when building in a subdir
-
-Fixes: 613372d
-Fixes: cff2d1c
-
-Compile errors when building in a subdir:
-alsactl/alsactl.c:33:10: fatal error: os_compat.h: No such file or directory
-   33 | #include "os_compat.h"
-      |          ^~~~~~~~~~~~~
-alsactl/lock.c:34:10: fatal error: os_compat.h: No such file or directory
-   34 | #include "os_compat.h"
-      |          ^~~~~~~~~~~~~
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Upstream-Status: Submitted [https://github.com/alsa-project/alsa-utils/pull/213]
----
- alsactl/Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/alsactl/Makefile.am b/alsactl/Makefile.am
-index 80dba69d..fb32c4f3 100644
---- a/alsactl/Makefile.am
-+++ b/alsactl/Makefile.am
-@@ -9,6 +9,8 @@ EXTRA_DIST=alsactl.1 alsactl_init.xml
- 
- AM_CFLAGS = -D_GNU_SOURCE
- 
-+AM_CPPFLAGS = -I$(top_srcdir)/include
-+
- alsactl_SOURCES=alsactl.c state.c lock.c utils.c init_parse.c init_ucm.c \
- 		daemon.c monitor.c clean.c info.c
- 
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb
similarity index 95%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb
index af28f5468f..4f14967170 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb
@@ -24,11 +24,8 @@ PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev
 PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
-SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2 \
-           file://0001-alsactl-fix-compilation-when-building-in-a-subdir.patch \
-           file://0001-alsactl-add-define-to-compile-with-glibc-2.38.patch \
-          "
-SRC_URI[sha256sum] = "e7623d4525595f92e11ce25ee9a97f2040a14c6e4dcd027aa96e06cbce7817bd"
+SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "104b62ec7f02a7ce16ca779f4815616df1cc21933503783a9107b5944f83063a"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.39.2


--===============5580864844222860770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1806 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-ff941a53d8678f4043ec15fc51b690e26c56b77f"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ff941a53d8678f4043ec15fc51b690e26c56b77f"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 208 Local 196 Mirrors 0 Missed 12 Current 535 (94% match, 98% complete)
Removing 1 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1674 of 2059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb:do_recipe_qa)
NOTE: recipe alsa-utils-1.2.10-r0: task do_recipe_qa: Started
NOTE: recipe alsa-utils-1.2.10-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2041 of 2059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb:do_fetch)
NOTE: recipe alsa-utils-1.2.10-r0: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.10-r0: task do_fetch: Succeeded
NOTE: Running task 2042 of 2059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb:do_unpack)
NOTE: Running task 2043 of 2059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.10-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.10-r0: task do_unpack: Succeeded
NOTE: Running task 2044 of 2059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb:do_patch)
NOTE: Running task 2045 of 2059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb:do_collect_spdx_deps)
NOTE: recipe alsa-utils-1.2.10-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-utils-1.2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe alsa-utils-1.2.10-r0: task do_patch: Succeeded
NOTE: Running task 2046 of 2059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2047 of 2059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb:do_populate_lic)
NOTE: recipe alsa-utils-1.2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.10-r0: task do_populate_lic: Started
NOTE: recipe alsa-utils-1.2.10-r0: task do_populate_lic: Succeeded
NOTE: recipe alsa-utils-1.2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2048 of 2059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb:do_configure)
NOTE: recipe alsa-utils-1.2.10-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.10-r0: task do_configure: Succeeded
NOTE: Running task 2049 of 2059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb:do_compile)
NOTE: recipe alsa-utils-1.2.10-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.10-r0: task do_compile: Succeeded
NOTE: Running task 2050 of 2059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb:do_install)
NOTE: recipe alsa-utils-1.2.10-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.10-r0: task do_install: Succeeded
NOTE: Running task 2051 of 2059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb:do_package)
NOTE: Running task 2052 of 2059 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb:do_populate_sysroot)
NOTE: recipe alsa-utils-1.2.10-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-utils-1.2.10-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.10-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 2052 tasks of which 2039 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb:do_package
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: alsa-utils-1.2.10-r0 do_package: QA Issue: alsa-utils: Files/directories were installed but not shipped in any package:
  /usr/bin/nhlt-dmic-info
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
alsa-utils: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: alsa-utils-1.2.10-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.10/temp/log.do_package.3491831
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb:do_package) failed with exit code '1'

--===============5580864844222860770==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-utils-upgrade-1.2.9-1.2.10.patch"

RnJvbSA5N2JlN2E2ZDA2NDUxM2RlMzBhMWFmY2JhNDcyNmIwZmMxNjM4NDYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTY6NTg6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
bHNhLXV0aWxzOiB1cGdyYWRlIDEuMi45IC0+IDEuMi4xMAoKLS0tCiAuLi5kZC1kZWZpbmUtdG8t
Y29tcGlsZS13aXRoLWdsaWJjLTIuMzgucGF0Y2ggfCAzOSAtLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li5vbXBpbGF0aW9uLXdoZW4tYnVpbGRpbmctaW4tYS1zdWJkaXIucGF0Y2ggfCAzNSAtLS0tLS0t
LS0tLS0tLS0tLQogLi4uc2EtdXRpbHNfMS4yLjkuYmIgPT4gYWxzYS11dGlsc18xLjIuMTAuYmJ9
IHwgIDcgKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDc5IGRlbGV0aW9u
cygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxz
YS11dGlscy8wMDAxLWFsc2FjdGwtYWRkLWRlZmluZS10by1jb21waWxlLXdpdGgtZ2xpYmMtMi4z
OC5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2Ev
YWxzYS11dGlscy8wMDAxLWFsc2FjdGwtZml4LWNvbXBpbGF0aW9uLXdoZW4tYnVpbGRpbmctaW4t
YS1zdWJkaXIucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL3thbHNh
LXV0aWxzXzEuMi45LmJiID0+IGFsc2EtdXRpbHNfMS4yLjEwLmJifSAoOTUlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlscy8wMDAxLWFsc2FjdGwt
YWRkLWRlZmluZS10by1jb21waWxlLXdpdGgtZ2xpYmMtMi4zOC5wYXRjaCBiL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlscy8wMDAxLWFsc2FjdGwtYWRkLWRlZmluZS10by1j
b21waWxlLXdpdGgtZ2xpYmMtMi4zOC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggOGMyM2ZiMmNlYy4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9h
bHNhL2Fsc2EtdXRpbHMvMDAwMS1hbHNhY3RsLWFkZC1kZWZpbmUtdG8tY29tcGlsZS13aXRoLWds
aWJjLTIuMzgucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzOSArMCwwIEBACi1Gcm9tIGE2MTBm
NGMyMWIwODNjMGY5Y2Y2MmFkMjI1MWRmYWRjOThhYmI1MGUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCi1Gcm9tOiBSdWRpIEhlaXRiYXVtIDxydWRpQGhlaXRiYXVtLmNvbT4KLURhdGU6IFNhdCwg
MjIgSnVsIDIwMjMgMTU6MzY6MDkgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSF0gYWxzYWN0bDogYWRk
IGRlZmluZSB0byBjb21waWxlIHdpdGggZ2xpYmMgMi4zOAotCi1zdHJsY2F0IGFuZCBzdHJsY3B5
IGhhdmUgYmVlbiBhZGRlZCB0byBnbGliYyAyLjM4LgotdXBkYXRlIHRoZSBkZWZpbmVzIHRvIHVz
ZSB0aGUgZ2xpYmMgdmVyc2lvbnMsIGFuZCBub3QgY29uZmxpY3Qgd2l0aAotc3RyaW5nLmguCi0K
LXJlZjoKLS0gaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvP3A9Z2xpYmMuZ2l0O2E9Y29tbWl0
O2g9NDU0YTIwYzg3NTZjOWMxZDU1NDE5MTUzMjU1ZmM3NjkyYjNkMjE5OQotCi1GaXhlczogaHR0
cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXV0aWxzL3B1bGwvMjI1Ci1TaWduZWQt
b2ZmLWJ5OiBKYXJvc2xhdiBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6PgotU2lnbmVkLW9mZi1ieTog
TWFydGluIEphbnNhIDxNYXJ0aW4uSmFuc2FAZ21haWwuY29tPgotCi1VcHN0cmVhbS1TdGF0dXM6
IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdXRpbHMvY29t
bWl0L2Q2YTcxYmZiZGU5ZTE3MTA3NDNkM2E0NDZjNmVhM2I0MWM0NTIzNGVdCi0tLS0KLSBhbHNh
Y3RsL2luaXRfc3lzZGVwcy5jIHwgMiArKwotIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKLQotZGlmZiAtLWdpdCBhL2Fsc2FjdGwvaW5pdF9zeXNkZXBzLmMgYi9hbHNhY3RsL2luaXRf
c3lzZGVwcy5jCi1pbmRleCAzYWNhMWI0Li5mMDliMWFlIDEwMDY0NAotLS0tIGEvYWxzYWN0bC9p
bml0X3N5c2RlcHMuYwotKysrIGIvYWxzYWN0bC9pbml0X3N5c2RlcHMuYwotQEAgLTE4LDYgKzE4
LDcgQEAKLSAgKi8KLSAKLSAjaWYgZGVmaW5lZChfX0dMSUJDX18pICYmICEoZGVmaW5lZChfX1VD
TElCQ19fKSAmJiBkZWZpbmVkKF9fVVNFX0JTRCkpCi0rI2lmICEoX19HTElCQ19QUkVSRVEoMiwg
MzgpKQotIHN0YXRpYyBzaXplX3Qgc3RybGNweShjaGFyICpkc3QsIGNvbnN0IGNoYXIgKnNyYywg
c2l6ZV90IHNpemUpCi0gewotIAlzaXplX3QgYnl0ZXMgPSAwOwotQEAgLTYwLDQgKzYxLDUgQEAg
c3RhdGljIHNpemVfdCBzdHJsY2F0KGNoYXIgKmRzdCwgY29uc3QgY2hhciAqc3JjLCBzaXplX3Qg
c2l6ZSkKLSAJKnEgPSAnXDAnOwotIAlyZXR1cm4gYnl0ZXM7Ci0gfQotKyNlbmRpZiAvKiAhKF9f
R0xJQkNfUFJFUkVRKDIsIDM4KSkgKi8KLSAjZW5kaWYgLyogX19HTElCQ19fICovCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHMvMDAwMS1hbHNhY3Rs
LWZpeC1jb21waWxhdGlvbi13aGVuLWJ1aWxkaW5nLWluLWEtc3ViZGlyLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzLzAwMDEtYWxzYWN0bC1maXgtY29tcGls
YXRpb24td2hlbi1idWlsZGluZy1pbi1hLXN1YmRpci5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggM2IzZmU1MzQ1YS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9hbHNhL2Fsc2EtdXRpbHMvMDAwMS1hbHNhY3RsLWZpeC1jb21waWxhdGlvbi13aGVu
LWJ1aWxkaW5nLWluLWEtc3ViZGlyLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzUgKzAsMCBA
QAotRnJvbSA0NDYzNmE3YzU4NjI1MzhkZWYwZDJmYWMwNzQ3NzJjYzM5YTIyYTE1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQotRnJvbTogUnVkaSBIZWl0YmF1bSA8cnVkaUBoZWl0YmF1bS5jb20+
Ci1EYXRlOiBUdWUsIDE2IE1heSAyMDIzIDAyOjI3OjU5ICsxMDAwCi1TdWJqZWN0OiBbUEFUQ0hd
IGFsc2FjdGw6IGZpeCBjb21waWxhdGlvbiB3aGVuIGJ1aWxkaW5nIGluIGEgc3ViZGlyCi0KLUZp
eGVzOiA2MTMzNzJkCi1GaXhlczogY2ZmMmQxYwotCi1Db21waWxlIGVycm9ycyB3aGVuIGJ1aWxk
aW5nIGluIGEgc3ViZGlyOgotYWxzYWN0bC9hbHNhY3RsLmM6MzM6MTA6IGZhdGFsIGVycm9yOiBv
c19jb21wYXQuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQotICAgMzMgfCAjaW5jbHVkZSAi
b3NfY29tcGF0LmgiCi0gICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fn4KLWFsc2FjdGwvbG9j
ay5jOjM0OjEwOiBmYXRhbCBlcnJvcjogb3NfY29tcGF0Lmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkKLSAgIDM0IHwgI2luY2x1ZGUgIm9zX2NvbXBhdC5oIgotICAgICAgfCAgICAgICAgICBe
fn5+fn5+fn5+fn5+Ci0KLVNpZ25lZC1vZmYtYnk6IFJ1ZGkgSGVpdGJhdW0gPHJ1ZGlAaGVpdGJh
dW0uY29tPgotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS9h
bHNhLXByb2plY3QvYWxzYS11dGlscy9wdWxsLzIxM10KLS0tLQotIGFsc2FjdGwvTWFrZWZpbGUu
YW0gfCAyICsrCi0gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0
IGEvYWxzYWN0bC9NYWtlZmlsZS5hbSBiL2Fsc2FjdGwvTWFrZWZpbGUuYW0KLWluZGV4IDgwZGJh
NjlkLi5mYjMyYzRmMyAxMDA2NDQKLS0tLSBhL2Fsc2FjdGwvTWFrZWZpbGUuYW0KLSsrKyBiL2Fs
c2FjdGwvTWFrZWZpbGUuYW0KLUBAIC05LDYgKzksOCBAQCBFWFRSQV9ESVNUPWFsc2FjdGwuMSBh
bHNhY3RsX2luaXQueG1sCi0gCi0gQU1fQ0ZMQUdTID0gLURfR05VX1NPVVJDRQotIAotK0FNX0NQ
UEZMQUdTID0gLUkkKHRvcF9zcmNkaXIpL2luY2x1ZGUKLSsKLSBhbHNhY3RsX1NPVVJDRVM9YWxz
YWN0bC5jIHN0YXRlLmMgbG9jay5jIHV0aWxzLmMgaW5pdF9wYXJzZS5jIGluaXRfdWNtLmMgXAot
IAkJZGFlbW9uLmMgbW9uaXRvci5jIGNsZWFuLmMgaW5mby5jCi0gCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjkuYmIgYi9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjEwLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlsc18x
LjIuOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxz
XzEuMi4xMC5iYgppbmRleCBhZjI4ZjU0NjhmLi40ZjE0OTY3MTcwIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjkuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzXzEuMi4xMC5iYgpAQCAtMjQsMTEgKzI0
LDggQEAgUEFDS0FHRUNPTkZJR1t1ZGV2XSA9ICItLXdpdGgtdWRldi1ydWxlcy1kaXI9YHBrZy1j
b25maWcgLS12YXJpYWJsZT11ZGV2ZGlyIHVkZXYKIFBBQ0tBR0VDT05GSUdbbWFucGFnZXNdID0g
Ii0tZW5hYmxlLXhtbHRvLCAtLWRpc2FibGUteG1sdG8sIHhtbHRvLW5hdGl2ZSBkb2Nib29rLXht
bC1kdGQ0LW5hdGl2ZSBkb2Nib29rLXhzbC1zdHlsZXNoZWV0cy1uYXRpdmUiCiAKICMgYWxzYS11
dGlscyBzcGVjaWZpZWQgaW4gU1JDX1VSSSBkdWUgdG8gYWxzYS11dGlscy1zY3JpcHRzIHJlY2lw
ZQotU1JDX1VSSSA9ICJodHRwczovL3d3dy5hbHNhLXByb2plY3Qub3JnL2ZpbGVzL3B1Yi91dGls
cy9hbHNhLXV0aWxzLSR7UFZ9LnRhci5iejIgXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1hbHNh
Y3RsLWZpeC1jb21waWxhdGlvbi13aGVuLWJ1aWxkaW5nLWluLWEtc3ViZGlyLnBhdGNoIFwKLSAg
ICAgICAgICAgZmlsZTovLzAwMDEtYWxzYWN0bC1hZGQtZGVmaW5lLXRvLWNvbXBpbGUtd2l0aC1n
bGliYy0yLjM4LnBhdGNoIFwKLSAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTc2
MjNkNDUyNTU5NWY5MmUxMWNlMjVlZTlhOTdmMjA0MGExNGM2ZTRkY2QwMjdhYTk2ZTA2Y2JjZTc4
MTdiZCIKK1NSQ19VUkkgPSAiaHR0cHM6Ly93d3cuYWxzYS1wcm9qZWN0Lm9yZy9maWxlcy9wdWIv
dXRpbHMvYWxzYS11dGlscy0ke1BWfS50YXIuYnoyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEw
NGI2MmVjN2YwMmE3Y2UxNmNhNzc5ZjQ4MTU2MTZkZjFjYzIxOTMzNTAzNzgzYTkxMDdiNTk0NGY4
MzA2M2EiCiAKICMgT24gYnVpbGQgbWFjaGluZXMgd2l0aCBweXRob24tZG9jdXRpbHMgKG5vdCBw
eXRob24zLWRvY3V0aWxzICEhKSBpbnN0YWxsZWQKICMgcnN0Mm1hbiAobm90IHJzdDJtYW4ucHkp
IGlzIGRldGVjdGVkIGFuZCBjb21waWxlIGZhaWxzIHdpdGgKLS0gCjIuMzkuMgoK

--===============5580864844222860770==--

