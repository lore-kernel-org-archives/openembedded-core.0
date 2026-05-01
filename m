Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED4EACD4840
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:56 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15617.1777645535643143513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KRiISBsm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wMA7tCK9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019de3ee5e92-634a401f-f04c-4551-8e68-085a4ea008b5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=48PCYOU0rMewKH4fKrBN+o+i/pyzHoU6OeYyye5tZzU=;
	b=KRiISBsmXEj2je75OIF3B04m2eRRzViOriWeFgsU76ql5wbz41KCjD0rt/HhMzuE
	BZJn/fRtT3u831+p8iNOxFEBlLQ5OwOFGj34kH7dHujychbhRj9h/hSmRbjInUJ3J5l
	SubgGTGe4uPsEmTudNiXyDzpR8FGNSHdPCuND2L8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=48PCYOU0rMewKH4fKrBN+o+i/pyzHoU6OeYyye5tZzU=;
	b=wMA7tCK9QI8tQeopaEFJYnx9tiYjeGxLccK4XGCk0ai4uA9DLtv57f6T/3jGLr4e
	nMkJ6Uhxfkkd6rScdvB9YxPCDvQtWvZ8bYhxbTmNooXuRKDd7kWJpTqLSb+ugt+1JK1
	uhuIj+6r7V+NUCUQ9NH5u8GNrr4mSl9OBwX9ig3A=
Content-Type: multipart/mixed; boundary="===============1877502713425808802=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-requests: upgrading to 2.33.1 SUCCEEDED
Message-ID: <0101019de3ee5e92-634a401f-f04c-4551-8e68-085a4ea008b5-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236246

--===============1877502713425808802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-requests* to *2.33.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-requests-upgrade-2.32.5-2.33.1.patch
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
From 7efe3e68368571b3025f2d2bb2e99fc01195c9ab Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 09:15:03 +0000
Subject: [PATCH] python3-requests: upgrade 2.32.5 -> 2.33.1

---
 .../python3-requests/CVE-2026-25645.patch     | 46 -------------------
 ...s_2.32.5.bb => python3-requests_2.33.1.bb} |  5 +-
 2 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch
 rename meta/recipes-devtools/python/{python3-requests_2.32.5.bb => python3-requests_2.33.1.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch b/meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch
deleted file mode 100644
index 3bebba6572..0000000000
--- a/meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 66d21cb07bd6255b1280291c4fafb71803cdb3b7 Mon Sep 17 00:00:00 2001
-From: Nate Prewitt <nate.prewitt@gmail.com>
-Date: Wed, 25 Mar 2026 08:57:56 -0600
-Subject: [PATCH] Merge commit from fork
-
-Prior to version 2.33.0, the `requests.utils.extract_zipped_paths()` utility function
-uses a predictable filename when extracting files from zip archives into the system
-temporary directory. If the target file already exists, it is reused without validation.
-A local attacker with write access to the temp directory could pre-create a malicious
-file that would be loaded in place of the legitimate one. Standard usage of the Requests
-library is not affected by this vulnerability. Only applications that call
-`extract_zipped_paths()` directly are impacted. Starting in version 2.33.0, the library
-extracts files to a non-deterministic location. If developers are unable to upgrade,
-they can set `TMPDIR` in their environment to a directory with restricted write access.
-
-CVE: CVE-2026-25645
-Upstream-Status: Backport [https://github.com/psf/requests/commit/66d21cb07bd6255b1280291c4fafb71803cdb3b7]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/requests/utils.py | 13 +++++++------
- 1 file changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/src/requests/utils.py b/src/requests/utils.py
-index d8803e6e91..54959bb8ab 100644
---- a/src/requests/utils.py
-+++ b/src/requests/utils.py
-@@ -282,12 +282,13 @@ def extract_zipped_paths(path):
-         return path
- 
-     # we have a valid zip archive and a valid member of that archive
--    tmp = tempfile.gettempdir()
--    extracted_path = os.path.join(tmp, member.split("/")[-1])
--    if not os.path.exists(extracted_path):
--        # use read + write to avoid the creating nested folders, we only want the file, avoids mkdir racing condition
--        with atomic_open(extracted_path) as file_handler:
--            file_handler.write(zip_file.read(member))
-+    suffix = os.path.splitext(member.split("/")[-1])[-1]
-+    fd, extracted_path = tempfile.mkstemp(suffix=suffix)
-+    try:
-+        os.write(fd, zip_file.read(member))
-+    finally:
-+        os.close(fd)
-+
-     return extracted_path
- 
- 
diff --git a/meta/recipes-devtools/python/python3-requests_2.32.5.bb b/meta/recipes-devtools/python/python3-requests_2.33.1.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-requests_2.32.5.bb
rename to meta/recipes-devtools/python/python3-requests_2.33.1.bb
index 3477a5d83e..f9c1f1f8ee 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.5.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.33.1.bb
@@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
+SRC_URI[sha256sum] = "18817f8c57c6263968bc123d237e3b8b08ac046f5456bd1e307ee8f4250d3517"
 
-SRC_URI += "file://CVE-2026-25645.patch"
-SRC_URI:append:class-nativesdk = " file://environment.d-python3-requests.sh"
+SRC_URI += "file://environment.d-python3-requests.sh"
 
 do_install:append:class-nativesdk() {
 	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-- 
2.47.1


--===============1877502713425808802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-requests/python3-requests: FILELIST: directory renamed /usr/lib/python3.14/site-packages/requests-2.32.5.dist-info -> /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info, removed "/usr/lib/python3.14/site-packages/requests-2.32.5.dist-info/licenses/LICENSE", added "/usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses/NOTICE /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses/LICENSE"
Changes to packages/x86-64-v3-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.14/site-packages/requests-2.32.5.dist-info moved to /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info
  /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses/NOTICE was added

--===============1877502713425808802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-dd802b2c4d62be52922c3a35439b2f6eafa9cd12"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:dd802b2c4d62be52922c3a35439b2f6eafa9cd12"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 521 Local 457 Mirrors 0 Missed 64 Current 312 (87% match, 92% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 328 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 334 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 339 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 378 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 410 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 471 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 473 of 833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 475 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 479 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 480 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 482 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_recipe_qa_setscene)
NOTE: recipe python3-requests-2.33.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 485 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.4-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 492 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 493 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 508 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 509 of 833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.29.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-requests-2.33.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 897 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_fetch)
NOTE: Running task 943 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 948 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_fetch)
NOTE: Running task 949 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_fetch)
NOTE: Running task 950 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_fetch)
NOTE: recipe python3-3.14.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 982 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_fetch)
NOTE: recipe python3-hatchling-native-1.29.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 510 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.11-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_fetch: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_fetch: Succeeded
NOTE: Running setscene task 516 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_fetch: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 518 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 535 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 1035 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hatchling-native-1.29.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 536 of 833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 537 of 833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.1.14.14.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_unpack: Started
NOTE: Running setscene task 538 of 833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-idna-3.11-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: recipe python3-pathspec-native-1.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 559 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 561 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-trove-classifiers-native-2026.1.14.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-editables-native-0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1036 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_patch)
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 567 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1041 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathspec-native-1.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.0.bb:do_packagedata_setscene)
NOTE: Running task 1046 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_unpack)
NOTE: Running setscene task 579 of 833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.0.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-trove-classifiers-native-2026.1.14.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 580 of 833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_patch: Started
NOTE: Running task 1055 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_unpack)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-editables-native-0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 602 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 608 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.33.1-r0: task do_unpack: Started
NOTE: recipe python3-pathspec-native-1.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 609 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-idna-3.11-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_unpack: Started
NOTE: Running setscene task 611 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 612 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathspec-native-1.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 613 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1093 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1114 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: Running setscene task 623 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 625 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 626 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 629 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 634 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 636 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 638 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 648 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 652 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 654 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 662 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1158 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 667 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_deploy_source_date_epoch unihash changed to 591dde05ef9a1e8bec07a1915686ce7e76ffa1398d97120ed6cb4e0fbc1b95b8
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 656 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1219 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_patch)
NOTE: Running task 1220 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_unpack)
NOTE: Running task 1221 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_unpack)
NOTE: Running task 1222 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_patch)
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Started
NOTE: Running task 1223 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 697 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running task 1253 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1260 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1265 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_check_backend)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1321 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_create_recipe_spdx)
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_patch: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_unpack: Started
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_unpack: Started
NOTE: Running setscene task 699 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_patch: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_check_backend: Started
NOTE: Running setscene task 700 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_check_backend: Succeeded
NOTE: Running setscene task 701 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 702 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 703 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 710 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 713 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.33.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 714 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_patch: Succeeded
NOTE: Running setscene task 722 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 726 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch unihash changed to 6297db971db6fce87553fa432abd290d0793628a8382c103283480e86ffe5fec
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 729 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 739 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 747 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 750 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1372 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_patch)
NOTE: Running task 1373 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_patch)
NOTE: Running task 1374 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1375 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 761 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 767 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_patch: Started
NOTE: Running setscene task 769 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1386 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1392 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running task 1414 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1415 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_create_recipe_spdx)
NOTE: Running task 1416 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_create_recipe_spdx)
NOTE: Running task 1417 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_create_recipe_spdx)
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1418 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1419 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_create_recipe_spdx)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_patch: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-idna-3.11-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1431 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1437 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_deploy_source_date_epoch unihash changed to 2fd7b4234fcfbe992a6741ae9fcec94aeca178c074be5944070bfd9ff1d2bdd4
NOTE: recipe python3-urllib3-2.6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_deploy_source_date_epoch unihash changed to e7d7a582a82428fcff1cfc811d14c16c8f810f9f9a2a8379002589148b5ea9a7
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1458 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_deploy_source_date_epoch unihash changed to 674570e17fc08cf93da7c1c165b578f9305965a409d0f67e1e0fe48d1b168324
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_deploy_source_date_epoch unihash changed to ab2f13d42271edd294eaf117cc842c669c4ade94464f3f4277d7deea46cf2ffe
NOTE: Running setscene task 801 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 804 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1466 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 809 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 812 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 815 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 816 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 821 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 822 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 825 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 829 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 831 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 833 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1790 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1878 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1879 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1880 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1881 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1882 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-idna-3.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2010 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_configure)
NOTE: recipe python3-requests-2.33.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2011 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_configure)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2012 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: Running task 2013 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_configure)
NOTE: recipe python3-idna-3.11-r0: task do_configure: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_configure: Started
NOTE: Running task 2014 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: Running task 2015 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_configure)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_configure: Started
NOTE: recipe python3-idna-3.11-r0: task do_configure: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_configure: Started
NOTE: Running task 2016 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_configure_ptest_base)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_configure: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_configure: Succeeded
NOTE: Running task 2017 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_configure: Succeeded
NOTE: Running task 2018 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: Running task 2019 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_compile)
NOTE: recipe python3-idna-3.11-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_compile: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_configure: Succeeded
NOTE: Running task 2020 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_compile)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_configure: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: Running task 2021 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_compile)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2022 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_compile)
NOTE: Running task 2023 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_compile: Started
NOTE: recipe python3-idna-3.11-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe python3-idna-3.11-r0: task do_compile: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2030 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_compile_ptest_base)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_compile: Succeeded
NOTE: Running task 2031 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 2032 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_install)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_compile: Succeeded
NOTE: Running task 2033 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_install)
NOTE: recipe python3-idna-3.11-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_install: Started
NOTE: recipe python3-idna-3.11-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_install: Started
NOTE: Running task 2034 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_install)
NOTE: recipe python3-idna-3.11-r0: task do_install: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_compile: Succeeded
NOTE: Running task 2035 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_install)
NOTE: recipe python3-requests-2.33.1-r0: task do_compile: Succeeded
NOTE: Running task 2036 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_install)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 2037 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: Running task 2038 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_populate_sysroot)
NOTE: recipe python3-requests-2.33.1-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_install: Succeeded
NOTE: Running task 2039 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_package)
NOTE: Running task 2040 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package: Started
NOTE: recipe python3-idna-3.11-r0: task do_install: Succeeded
NOTE: Running task 2041 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_install_ptest_base)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_install: Succeeded
NOTE: Running task 2042 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_package)
NOTE: Running task 2043 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_populate_sysroot)
NOTE: recipe python3-idna-3.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_populate_sysroot: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package: Started
NOTE: Running task 2044 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_package)
NOTE: Running task 2045 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_populate_sysroot)
NOTE: recipe python3-idna-3.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2046 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package)
NOTE: Running task 2047 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_populate_sysroot)
NOTE: recipe python3-requests-2.33.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_package: Started
NOTE: recipe python3-idna-3.11-r0: task do_populate_sysroot: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 2048 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2026.2.25-r0: task do_package: Succeeded
NOTE: Running task 2049 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_packagedata)
NOTE: Running task 2050 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_packagedata)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_install: Succeeded
NOTE: Running task 2051 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_package)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_packagedata: Started
NOTE: Running task 2052 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_populate_sysroot)
NOTE: recipe python3-certifi-2026.2.25-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_package: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-idna-3.11-r0: task do_package: Succeeded
NOTE: Running task 2053 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_packagedata)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2054 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_create_spdx)
NOTE: recipe python3-idna-3.11-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_create_spdx: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_package: Succeeded
NOTE: Running task 2055 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_packagedata)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata unihash changed to e1a0cd46ec8995017f7e614380b045a85731ac9bc2f674b5a0f5a1a2943ca377
NOTE: Running task 2056 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_create_spdx)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2057 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_ipk)
NOTE: Running task 2058 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_deb)
NOTE: Running task 2059 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: Running task 2060 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_qa)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_create_spdx: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_qa: Started
NOTE: recipe python3-requests-2.33.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_packagedata unihash changed to afec0b7d5596745c5f07bb96e6d9776d695093b91f70cb5b94bf312647417f7d
NOTE: Running task 2061 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.33.1.bb:do_create_spdx)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-requests-2.33.1-r0: task do_create_spdx: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_qa unihash changed to db0a5b130c3ed87d3a49312151f4367a355ff99df1dad8822ce50b129b1e9c90
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_ipk unihash changed to 9acd4b5fc9dd845fa9b2a59bdd9b69e4d2a9cb1b28b682e42dfc8a7210a23e16
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_deb unihash changed to 539a2f766bdfe9753bb7c6db2b86c52c148b992f7fe4cecc11b15ba68334b1ec
NOTE: recipe python3-requests-2.33.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm unihash changed to e2b25c221675f060ff82b681051b5fdece095c2ab927ae0a6abdf2e1f2c8d933
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_package: Succeeded
NOTE: Running task 2062 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_packagedata)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2026.2.25-r0: task do_packagedata: Failed
NOTE: recipe python3-idna-3.11-r0: task do_packagedata: Failed
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2062 tasks of which 1970 didn't need to be rerun and 3 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501091441.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501091441.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 3 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-certifi/2026.2.25/temp/log.do_packagedata.3639382
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-idna/3.11/temp/log.do_packagedata.3639604
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-chardet/6.0.0.post1/temp/log.do_packagedata.3640658
Summary: There were 26 ERROR messages, returning a non-zero exit code.
ERROR: python3-certifi-2026.2.25-r0 do_packagedata: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2026.4.22-r0 to 0:2026.2.25-r0) [version-going-backwards]
ERROR: python3-certifi-2026.2.25-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2026.4.22-r0 to 0:2026.2.25-r0) [version-going-backwards]
ERROR: python3-certifi-2026.2.25-r0 do_packagedata: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2026.4.22-r0 to 0:2026.2.25-r0) [version-going-backwards]
ERROR: python3-certifi-2026.2.25-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2026.4.22-r0 to 0:2026.2.25-r0) [version-going-backwards]
ERROR: python3-certifi-2026.2.25-r0 do_packagedata: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2026.4.22-r0 to 0:2026.2.25-r0) [version-going-backwards]
ERROR: python3-certifi-2026.2.25-r0 do_packagedata: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2026.4.22-r0 to 0:2026.2.25-r0) [version-going-backwards]
ERROR: python3-certifi-2026.2.25-r0 do_packagedata: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2026.4.22-r0 to 0:2026.2.25-r0) [version-going-backwards]
ERROR: python3-certifi-2026.2.25-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: python3-idna-3.11-r0 do_packagedata: QA Issue: Package version for package python3-idna-src went backwards which would break package feeds (from 0:3.13-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: python3-idna-3.11-r0 do_packagedata: QA Issue: Package version for package python3-idna-dbg went backwards which would break package feeds (from 0:3.13-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: python3-idna-3.11-r0 do_packagedata: QA Issue: Package version for package python3-idna-ptest went backwards which would break package feeds (from 0:3.13-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: python3-idna-3.11-r0 do_packagedata: QA Issue: Package version for package python3-idna-staticdev went backwards which would break package feeds (from 0:3.13-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: python3-idna-3.11-r0 do_packagedata: QA Issue: Package version for package python3-idna-dev went backwards which would break package feeds (from 0:3.13-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: python3-idna-3.11-r0 do_packagedata: QA Issue: Package version for package python3-idna-doc went backwards which would break package feeds (from 0:3.13-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: python3-idna-3.11-r0 do_packagedata: QA Issue: Package version for package python3-idna-locale went backwards which would break package feeds (from 0:3.13-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: python3-idna-3.11-r0 do_packagedata: QA Issue: Package version for package python3-idna went backwards which would break package feeds (from 0:3.13-r0 to 0:3.11-r0) [version-going-backwards]
ERROR: python3-idna-3.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-src went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-dbg went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-cli went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-staticdev went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-dev went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-doc went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-locale went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-certifi/2026.2.25/temp/log.do_packagedata.3639382
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb:do_packagedata) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-idna/3.11/temp/log.do_packagedata.3639604
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_packagedata) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-chardet/6.0.0.post1/temp/log.do_packagedata.3640658
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_packagedata) failed with exit code '1'

--===============1877502713425808802==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-requests-upgrade-2.32.5-2.33.1.patch"

RnJvbSA3ZWZlM2U2ODM2ODU3MWIzMDI1ZjJkMmJiMmU5OWZjMDExOTVjOWFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwOToxNTowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcmVxdWVzdHM6IHVwZ3JhZGUgMi4zMi41IC0+IDIuMzMuMQoKLS0tCiAuLi4vcHl0aG9u
My1yZXF1ZXN0cy9DVkUtMjAyNi0yNTY0NS5wYXRjaCAgICAgfCA0NiAtLS0tLS0tLS0tLS0tLS0t
LS0tCiAuLi5zXzIuMzIuNS5iYiA9PiBweXRob24zLXJlcXVlc3RzXzIuMzMuMS5iYn0gfCAgNSAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQ5IGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1yZXF1
ZXN0cy9DVkUtMjAyNi0yNTY0NS5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24ve3B5dGhvbjMtcmVxdWVzdHNfMi4zMi41LmJiID0+IHB5dGhvbjMtcmVxdWVzdHNfMi4z
My4xLmJifSAoODIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1yZXF1ZXN0cy9DVkUtMjAyNi0yNTY0NS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1yZXF1ZXN0cy9DVkUtMjAyNi0yNTY0NS5wYXRjaApkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggM2JlYmJhNjU3Mi4uMDAwMDAwMDAwMAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmVxdWVzdHMvQ1ZFLTIwMjYtMjU2NDUu
cGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0NiArMCwwIEBACi1Gcm9tIDY2ZDIxY2IwN2JkNjI1
NWIxMjgwMjkxYzRmYWZiNzE4MDNjZGIzYjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9t
OiBOYXRlIFByZXdpdHQgPG5hdGUucHJld2l0dEBnbWFpbC5jb20+Ci1EYXRlOiBXZWQsIDI1IE1h
ciAyMDI2IDA4OjU3OjU2IC0wNjAwCi1TdWJqZWN0OiBbUEFUQ0hdIE1lcmdlIGNvbW1pdCBmcm9t
IGZvcmsKLQotUHJpb3IgdG8gdmVyc2lvbiAyLjMzLjAsIHRoZSBgcmVxdWVzdHMudXRpbHMuZXh0
cmFjdF96aXBwZWRfcGF0aHMoKWAgdXRpbGl0eSBmdW5jdGlvbgotdXNlcyBhIHByZWRpY3RhYmxl
IGZpbGVuYW1lIHdoZW4gZXh0cmFjdGluZyBmaWxlcyBmcm9tIHppcCBhcmNoaXZlcyBpbnRvIHRo
ZSBzeXN0ZW0KLXRlbXBvcmFyeSBkaXJlY3RvcnkuIElmIHRoZSB0YXJnZXQgZmlsZSBhbHJlYWR5
IGV4aXN0cywgaXQgaXMgcmV1c2VkIHdpdGhvdXQgdmFsaWRhdGlvbi4KLUEgbG9jYWwgYXR0YWNr
ZXIgd2l0aCB3cml0ZSBhY2Nlc3MgdG8gdGhlIHRlbXAgZGlyZWN0b3J5IGNvdWxkIHByZS1jcmVh
dGUgYSBtYWxpY2lvdXMKLWZpbGUgdGhhdCB3b3VsZCBiZSBsb2FkZWQgaW4gcGxhY2Ugb2YgdGhl
IGxlZ2l0aW1hdGUgb25lLiBTdGFuZGFyZCB1c2FnZSBvZiB0aGUgUmVxdWVzdHMKLWxpYnJhcnkg
aXMgbm90IGFmZmVjdGVkIGJ5IHRoaXMgdnVsbmVyYWJpbGl0eS4gT25seSBhcHBsaWNhdGlvbnMg
dGhhdCBjYWxsCi1gZXh0cmFjdF96aXBwZWRfcGF0aHMoKWAgZGlyZWN0bHkgYXJlIGltcGFjdGVk
LiBTdGFydGluZyBpbiB2ZXJzaW9uIDIuMzMuMCwgdGhlIGxpYnJhcnkKLWV4dHJhY3RzIGZpbGVz
IHRvIGEgbm9uLWRldGVybWluaXN0aWMgbG9jYXRpb24uIElmIGRldmVsb3BlcnMgYXJlIHVuYWJs
ZSB0byB1cGdyYWRlLAotdGhleSBjYW4gc2V0IGBUTVBESVJgIGluIHRoZWlyIGVudmlyb25tZW50
IHRvIGEgZGlyZWN0b3J5IHdpdGggcmVzdHJpY3RlZCB3cml0ZSBhY2Nlc3MuCi0KLUNWRTogQ1ZF
LTIwMjYtMjU2NDUKLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNv
bS9wc2YvcmVxdWVzdHMvY29tbWl0LzY2ZDIxY2IwN2JkNjI1NWIxMjgwMjkxYzRmYWZiNzE4MDNj
ZGIzYjddCi1TaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4K
LS0tLQotIHNyYy9yZXF1ZXN0cy91dGlscy5weSB8IDEzICsrKysrKystLS0tLS0KLSAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEv
c3JjL3JlcXVlc3RzL3V0aWxzLnB5IGIvc3JjL3JlcXVlc3RzL3V0aWxzLnB5Ci1pbmRleCBkODgw
M2U2ZTkxLi41NDk1OWJiOGFiIDEwMDY0NAotLS0tIGEvc3JjL3JlcXVlc3RzL3V0aWxzLnB5Ci0r
KysgYi9zcmMvcmVxdWVzdHMvdXRpbHMucHkKLUBAIC0yODIsMTIgKzI4MiwxMyBAQCBkZWYgZXh0
cmFjdF96aXBwZWRfcGF0aHMocGF0aCk6Ci0gICAgICAgICByZXR1cm4gcGF0aAotIAotICAgICAj
IHdlIGhhdmUgYSB2YWxpZCB6aXAgYXJjaGl2ZSBhbmQgYSB2YWxpZCBtZW1iZXIgb2YgdGhhdCBh
cmNoaXZlCi0tICAgIHRtcCA9IHRlbXBmaWxlLmdldHRlbXBkaXIoKQotLSAgICBleHRyYWN0ZWRf
cGF0aCA9IG9zLnBhdGguam9pbih0bXAsIG1lbWJlci5zcGxpdCgiLyIpWy0xXSkKLS0gICAgaWYg
bm90IG9zLnBhdGguZXhpc3RzKGV4dHJhY3RlZF9wYXRoKToKLS0gICAgICAgICMgdXNlIHJlYWQg
KyB3cml0ZSB0byBhdm9pZCB0aGUgY3JlYXRpbmcgbmVzdGVkIGZvbGRlcnMsIHdlIG9ubHkgd2Fu
dCB0aGUgZmlsZSwgYXZvaWRzIG1rZGlyIHJhY2luZyBjb25kaXRpb24KLS0gICAgICAgIHdpdGgg
YXRvbWljX29wZW4oZXh0cmFjdGVkX3BhdGgpIGFzIGZpbGVfaGFuZGxlcjoKLS0gICAgICAgICAg
ICBmaWxlX2hhbmRsZXIud3JpdGUoemlwX2ZpbGUucmVhZChtZW1iZXIpKQotKyAgICBzdWZmaXgg
PSBvcy5wYXRoLnNwbGl0ZXh0KG1lbWJlci5zcGxpdCgiLyIpWy0xXSlbLTFdCi0rICAgIGZkLCBl
eHRyYWN0ZWRfcGF0aCA9IHRlbXBmaWxlLm1rc3RlbXAoc3VmZml4PXN1ZmZpeCkKLSsgICAgdHJ5
OgotKyAgICAgICAgb3Mud3JpdGUoZmQsIHppcF9maWxlLnJlYWQobWVtYmVyKSkKLSsgICAgZmlu
YWxseToKLSsgICAgICAgIG9zLmNsb3NlKGZkKQotKwotICAgICByZXR1cm4gZXh0cmFjdGVkX3Bh
dGgKLSAKLSAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1yZXF1ZXN0c18yLjMyLjUuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcmVxdWVzdHNfMi4zMy4xLmJiCnNpbWlsYXJpdHkgaW5kZXggODIlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1yZXF1ZXN0c18yLjMyLjUuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1yZXF1ZXN0c18yLjMz
LjEuYmIKaW5kZXggMzQ3N2E1ZDgzZS4uZjljMWYxZjhlZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlcXVlc3RzXzIuMzIuNS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmVxdWVzdHNfMi4zMy4xLmJiCkBAIC01
LDEwICs1LDkgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzQ0MDBi
NjgwNzJkNzEwZmVjZDBhMjk0MGEwZDE2NTgiCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0
b29sc19idWlsZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkYmJhMGJhYzU2ZTEwMDg1
M2RiMGVhNzFiODJiNGRmZDVmZTJiZjZkMzc1NGE4ODkzYzNhZjUwMGNlYzdkN2NmIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjE4ODE3ZjhjNTdjNjI2Mzk2OGJjMTIzZDIzN2UzYjhiMDhhYzA0NmY1
NDU2YmQxZTMwN2VlOGY0MjUwZDM1MTciCiAKLVNSQ19VUkkgKz0gImZpbGU6Ly9DVkUtMjAyNi0y
NTY0NS5wYXRjaCIKLVNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZXNkayA9ICIgZmlsZTovL2Vu
dmlyb25tZW50LmQtcHl0aG9uMy1yZXF1ZXN0cy5zaCIKK1NSQ19VUkkgKz0gImZpbGU6Ly9lbnZp
cm9ubWVudC5kLXB5dGhvbjMtcmVxdWVzdHMuc2giCiAKIGRvX2luc3RhbGw6YXBwZW5kOmNsYXNz
LW5hdGl2ZXNkaygpIHsKIAlta2RpciAtcCAke0R9JHtTREtQQVRITkFUSVZFfS9lbnZpcm9ubWVu
dC1zZXR1cC5kCi0tIAoyLjQ3LjEKCg==

--===============1877502713425808802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-requests: PV changed from "2.32.5" to "2.33.1"
packages/x86-64-v3-poky-linux/python3-requests: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/requests/requests-2.32.5.tar.gz;downloadfilename=requests-2.32.5.tar.gz file://CVE-2026-25645.patch" to "https://files.pythonhosted.org/packages/source/r/requests/requests-2.33.1.tar.gz;downloadfilename=requests-2.33.1.tar.gz file://environment.d-python3-requests.sh"
packages/x86-64-v3-poky-linux/python3-requests: PKGV changed from 2.32.5 [default] to 2.33.1 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-dbg: PV changed from "2.32.5" to "2.33.1"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-dbg: PKGV changed from 2.32.5 [default] to 2.33.1 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-dev: PV changed from "2.32.5" to "2.33.1"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-dev: PKGV changed from 2.32.5 [default] to 2.33.1 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-doc: PV changed from "2.32.5" to "2.33.1"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-doc: PKGV changed from 2.32.5 [default] to 2.33.1 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-locale: PV changed from "2.32.5" to "2.33.1"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-locale: PKGV changed from 2.32.5 [default] to 2.33.1 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-src: PV changed from "2.32.5" to "2.33.1"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-src: PKGV changed from 2.32.5 [default] to 2.33.1 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-staticdev: PV changed from "2.32.5" to "2.33.1"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-staticdev: PKGV changed from 2.32.5 [default] to 2.33.1 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests: FILELIST: directory renamed /usr/lib/python3.14/site-packages/requests-2.32.5.dist-info -> /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info, removed "/usr/lib/python3.14/site-packages/requests-2.32.5.dist-info/licenses/LICENSE", added "/usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses/NOTICE /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses/LICENSE"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests: PKGSIZE changed from 414739 to 414081 (-0%)
packages/x86-64-v3-poky-linux/python3-requests/python3-requests: PV changed from "2.32.5" to "2.33.1"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests: PKGV changed from 2.32.5 [default] to 2.33.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.14/site-packages/requests-2.32.5.dist-info moved to /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info
  /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses/NOTICE was added

--===============1877502713425808802==--

