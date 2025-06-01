Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BC5C5B552
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:44 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.27798.1748786134729313030
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=11siQ0ic;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bNAM+4Z5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101972bc6bc7a-cbc119bf-a012-445f-9fc2-295ea975f58a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SesPzq2mMQsZVMH2JgvNnvnGOlLMGzrDFi3zdqfMCK8=;
	b=11siQ0icXJK4K9h43u2TbAVPFmyKxqOWwsra5bqRSP1nooFPbpnh85EUAfXp+Jd/
	vKUQA/+Jaq5bcZrWiGk2okKg2/zvgW534j0sn/+UCbheAaixn4feV13s+mXLS05/fTs
	3ufketIcphUmWjCB5XJav88IpWqIp6gh7nVXfNTM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SesPzq2mMQsZVMH2JgvNnvnGOlLMGzrDFi3zdqfMCK8=;
	b=bNAM+4Z5uxpxGVbsTbrZu8DykszX7nxGj7uZRreARHdrTCjJYK8zoxYfk7rbTFoN
	i55yGP1CBU9qPXfE7lA0K8cFamt0QtKrKmpkgGGCg9IhWsG2ls+ghGkjunFXIaCDu4H
	tDFg3wQbg90fu3D2d+d0tgn7SVF7FyfOP8tX/HNs=
Content-Type: multipart/mixed; boundary="===============3040940704921513564=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.24.0 SUCCEEDED
Message-ID: <010101972bc6bc7a-cbc119bf-a012-445f-9fc2-295ea975f58a-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217600

--===============3040940704921513564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonschema* to *4.24.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.23.0-4.24.0.patch
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
From 3fc31ad6cd0bf25ba0044a979f3113cb31518ac8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 09:26:31 +0000
Subject: [PATCH] python3-jsonschema: upgrade 4.23.0 -> 4.24.0

---
 ...96a6523875c9694fcdf468c9f458323d07f2.patch | 44 -------------------
 ...4.23.0.bb => python3-jsonschema_4.24.0.bb} |  4 +-
 2 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-jsonschema/d71f96a6523875c9694fcdf468c9f458323d07f2.patch
 rename meta/recipes-devtools/python/{python3-jsonschema_4.23.0.bb => python3-jsonschema_4.24.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema/d71f96a6523875c9694fcdf468c9f458323d07f2.patch b/meta/recipes-devtools/python/python3-jsonschema/d71f96a6523875c9694fcdf468c9f458323d07f2.patch
deleted file mode 100644
index 65cc2b4cf0..0000000000
--- a/meta/recipes-devtools/python/python3-jsonschema/d71f96a6523875c9694fcdf468c9f458323d07f2.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From d71f96a6523875c9694fcdf468c9f458323d07f2 Mon Sep 17 00:00:00 2001
-From: Julian Berman <Julian@GrayVines.com>
-Date: Thu, 17 Oct 2024 09:36:35 -0400
-Subject: [PATCH] Fix the annotation for validator_for's default.
-
-This still doesn't seem to satisfy mypy, so tell it to be quiet.
-
-Upstream-Status: Backport [https://github.com/python-jsonschema/jsonschema/commit/d71f96a6523875c9694fcdf468c9f458323d07f2]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- jsonschema/validators.py | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/jsonschema/validators.py b/jsonschema/validators.py
-index 85c39160..b8ca3bd4 100644
---- a/jsonschema/validators.py
-+++ b/jsonschema/validators.py
-@@ -857,7 +857,7 @@ def extend(
-     version="draft2020-12",
- )
- 
--_LATEST_VERSION = Draft202012Validator
-+_LATEST_VERSION: type[Validator] = Draft202012Validator
- 
- 
- class _RefResolver:
-@@ -1334,7 +1334,7 @@ def validate(instance, schema, cls=None, *args, **kwargs):  # noqa: D417
- 
- def validator_for(
-     schema,
--    default: Validator | _utils.Unset = _UNSET,
-+    default: type[Validator] | _utils.Unset = _UNSET,
- ) -> type[Validator]:
-     """
-     Retrieve the validator class appropriate for validating the given schema.
-@@ -1396,7 +1396,7 @@ class is returned:
-     DefaultValidator = _LATEST_VERSION if default is _UNSET else default
- 
-     if schema is True or schema is False or "$schema" not in schema:
--        return DefaultValidator
-+        return DefaultValidator  # type: ignore[return-value]
-     if schema["$schema"] not in _META_SCHEMAS and default is _UNSET:
-         warn(
-             (
diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb
index 82b7bb23ed..9f8aa88ceb 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb
@@ -4,9 +4,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI += "file://d71f96a6523875c9694fcdf468c9f458323d07f2.patch"
+SRC_URI += "${PYPI_SRC_URI}"
 
-SRC_URI[sha256sum] = "d71497fef26351a33265337fa77ffeb82423f3ea21283cd9467bb03999266bc4"
+SRC_URI[sha256sum] = "0b4e8069eb12aedfa881333004bccaec24ecef5a8a6a4b6df142b2cc9599d196"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============3040940704921513564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 936 .bb files complete (0 cached, 936 parsed). 1916 targets, 48 skipped, 0 masked, 0 errors.
Removing 35 recipes from the core2-64 sysroot...done.
Removing 71 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5f9bb9cd890e184842fa871465775d63c3c49549"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 623 Local 612 Mirrors 0 Missed 11 Current 261 (98% match, 98% complete)
Removing 7 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 262 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 264 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 265 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 266 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 267 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_qa_setscene)
NOTE: Running setscene task 269 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 272 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 285 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 287 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 293 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 298 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 299 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 303 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 305 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_package_write_deb_setscene)
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 306 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 307 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 313 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 316 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 320 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 321 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 323 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 327 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 331 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 335 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 341 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 344 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.21.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 345 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 350 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.21.0.bb:do_package_qa_setscene)
NOTE: recipe python3-idna-3.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.3-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-zipp-3.21.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-zipp-3.21.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 351 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.21.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-idna-3.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 352 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_package_qa_setscene)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 354 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 359 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-attrs-25.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 365 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 366 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 372 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 373 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 374 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_package_qa_setscene)
NOTE: recipe python3-3.13.3-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-zipp-3.21.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 375 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.21.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-zipp-3.21.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 381 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 384 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-zipp-3.21.0-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 388 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-zipp-3.21.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-zipp-3.21.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-referencing-0.36.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 394 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_qa_setscene)
NOTE: Running setscene task 399 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 410 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 412 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_create_spdx_setscene)
NOTE: recipe python3-attrs-25.3.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 416 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 417 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-3.13.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.13.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-webcolors-24.11.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 420 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.21.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 423 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-zipp-3.21.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 426 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 429 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 430 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 432 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 433 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-zipp-3.21.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 434 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 436 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 439 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 443 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 445 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-zipp-3.21.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-referencing-0.36.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 454 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 458 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 460 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 461 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 464 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.21.0.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-webcolors-24.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-25.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 469 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_packagedata_setscene)
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-zipp-3.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 478 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rpds-py_0.24.0.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 483 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.3.5-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-hypothesis/6.131.14/temp/log.do_packagedata_setscene.567045
NOTE: recipe shadow-4.17.4-r0: task do_packagedata_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-webcolors-24.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 486 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe python3-zipp-3.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb:do_package_setscene)
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rpds-py-0.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rpds-py-0.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.17.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 551 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 557 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 578 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.36.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 579 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.21.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 581 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 585 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_25.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 587 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 588 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2025.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 594 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.85.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-referencing-0.36.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-zipp-3.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-attrs-25.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-referencing-0.36.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-zipp-3.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 598 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2025.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-attrs-25.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.85.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 612 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 626 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_package_setscene: Started
NOTE: recipe libunwind-1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 634 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 689 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 710 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 719 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 731 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 754 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 770 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 775 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 779 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 782 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 802 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 810 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 816 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 820 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 821 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 826 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 827 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 830 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 832 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 835 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 837 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 841 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 844 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 845 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 847 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 849 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1469 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_recipe_qa)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 851 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_recipe_qa: Started
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 856 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 857 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 858 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running task 1664 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_fetch)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 860 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_fetch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_fetch: Succeeded
NOTE: Running task 1665 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_unpack)
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 865 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 866 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 870 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_unpack: Succeeded
NOTE: Running task 1670 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_patch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 873 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 874 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 876 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_patch: Succeeded
NOTE: Running task 1676 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 879 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 882 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 883 of 884 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2180 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2368 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb:do_packagedata)
NOTE: Running task 2376 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2451 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_configure)
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_configure: Succeeded
NOTE: Running task 2452 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_compile)
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_compile: Started
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_compile: Succeeded
NOTE: Running task 2453 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_install)
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_install: Succeeded
NOTE: Running task 2454 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_package)
NOTE: Running task 2455 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_populate_sysroot)
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_package: Succeeded
NOTE: Running task 2456 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2457 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_create_spdx)
NOTE: Running task 2458 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_package_write_ipk)
NOTE: Running task 2459 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_package_write_deb)
NOTE: Running task 2460 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_package_write_rpm)
NOTE: Running task 2461 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_package_qa)
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_package_qa: Started
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2462 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_create_package_spdx)
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_create_package_spdx: Started
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.24.0-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2463 of 2463 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2463 tasks of which 2442 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.131.14-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.132.0-r0 to 0:6.131.14-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.131.14-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.132.0-r0 to 0:6.131.14-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.131.14-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.132.0-r0 to 0:6.131.14-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.131.14-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.132.0-r0 to 0:6.131.14-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.131.14-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.132.0-r0 to 0:6.131.14-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.131.14-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.132.0-r0 to 0:6.131.14-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.131.14-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.132.0-r0 to 0:6.131.14-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.131.14-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.132.0-r0 to 0:6.131.14-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.131.14-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3040940704921513564==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.23.0-4.24.0.patch"

RnJvbSAzZmMzMWFkNmNkMGJmMjViYTAwNDRhOTc5ZjMxMTNjYjMxNTE4YWM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwOToyNjozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtanNvbnNjaGVtYTogdXBncmFkZSA0LjIzLjAgLT4gNC4yNC4wCgotLS0KIC4uLjk2YTY1
MjM4NzVjOTY5NGZjZGY0NjhjOWY0NTgzMjNkMDdmMi5wYXRjaCB8IDQ0IC0tLS0tLS0tLS0tLS0t
LS0tLS0KIC4uLjQuMjMuMC5iYiA9PiBweXRob24zLWpzb25zY2hlbWFfNC4yNC4wLmJifSB8ICA0
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNDYgZGVsZXRpb25zKC0pCiBk
ZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpz
b25zY2hlbWEvZDcxZjk2YTY1MjM4NzVjOTY5NGZjZGY0NjhjOWY0NTgzMjNkMDdmMi5wYXRjaAog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtanNvbnNjaGVtYV80
LjIzLjAuYmIgPT4gcHl0aG9uMy1qc29uc2NoZW1hXzQuMjQuMC5iYn0gKDg4JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYS9kNzFm
OTZhNjUyMzg3NWM5Njk0ZmNkZjQ2OGM5ZjQ1ODMyM2QwN2YyLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWEvZDcxZjk2YTY1MjM4NzVjOTY5NGZj
ZGY0NjhjOWY0NTgzMjNkMDdmMi5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
NjVjYzJiNGNmMC4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtanNvbnNjaGVtYS9kNzFmOTZhNjUyMzg3NWM5Njk0ZmNkZjQ2OGM5ZjQ1ODMyM2Qw
N2YyLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNDQgKzAsMCBAQAotRnJvbSBkNzFmOTZhNjUy
Mzg3NWM5Njk0ZmNkZjQ2OGM5ZjQ1ODMyM2QwN2YyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQot
RnJvbTogSnVsaWFuIEJlcm1hbiA8SnVsaWFuQEdyYXlWaW5lcy5jb20+Ci1EYXRlOiBUaHUsIDE3
IE9jdCAyMDI0IDA5OjM2OjM1IC0wNDAwCi1TdWJqZWN0OiBbUEFUQ0hdIEZpeCB0aGUgYW5ub3Rh
dGlvbiBmb3IgdmFsaWRhdG9yX2ZvcidzIGRlZmF1bHQuCi0KLVRoaXMgc3RpbGwgZG9lc24ndCBz
ZWVtIHRvIHNhdGlzZnkgbXlweSwgc28gdGVsbCBpdCB0byBiZSBxdWlldC4KLQotVXBzdHJlYW0t
U3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi1qc29uc2NoZW1hL2pz
b25zY2hlbWEvY29tbWl0L2Q3MWY5NmE2NTIzODc1Yzk2OTRmY2RmNDY4YzlmNDU4MzIzZDA3ZjJd
Ci1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0ganNv
bnNjaGVtYS92YWxpZGF0b3JzLnB5IHwgNiArKystLS0KLSAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvanNvbnNjaGVtYS92YWxp
ZGF0b3JzLnB5IGIvanNvbnNjaGVtYS92YWxpZGF0b3JzLnB5Ci1pbmRleCA4NWMzOTE2MC4uYjhj
YTNiZDQgMTAwNjQ0Ci0tLS0gYS9qc29uc2NoZW1hL3ZhbGlkYXRvcnMucHkKLSsrKyBiL2pzb25z
Y2hlbWEvdmFsaWRhdG9ycy5weQotQEAgLTg1Nyw3ICs4NTcsNyBAQCBkZWYgZXh0ZW5kKAotICAg
ICB2ZXJzaW9uPSJkcmFmdDIwMjAtMTIiLAotICkKLSAKLS1fTEFURVNUX1ZFUlNJT04gPSBEcmFm
dDIwMjAxMlZhbGlkYXRvcgotK19MQVRFU1RfVkVSU0lPTjogdHlwZVtWYWxpZGF0b3JdID0gRHJh
ZnQyMDIwMTJWYWxpZGF0b3IKLSAKLSAKLSBjbGFzcyBfUmVmUmVzb2x2ZXI6Ci1AQCAtMTMzNCw3
ICsxMzM0LDcgQEAgZGVmIHZhbGlkYXRlKGluc3RhbmNlLCBzY2hlbWEsIGNscz1Ob25lLCAqYXJn
cywgKiprd2FyZ3MpOiAgIyBub3FhOiBENDE3Ci0gCi0gZGVmIHZhbGlkYXRvcl9mb3IoCi0gICAg
IHNjaGVtYSwKLS0gICAgZGVmYXVsdDogVmFsaWRhdG9yIHwgX3V0aWxzLlVuc2V0ID0gX1VOU0VU
LAotKyAgICBkZWZhdWx0OiB0eXBlW1ZhbGlkYXRvcl0gfCBfdXRpbHMuVW5zZXQgPSBfVU5TRVQs
Ci0gKSAtPiB0eXBlW1ZhbGlkYXRvcl06Ci0gICAgICIiIgotICAgICBSZXRyaWV2ZSB0aGUgdmFs
aWRhdG9yIGNsYXNzIGFwcHJvcHJpYXRlIGZvciB2YWxpZGF0aW5nIHRoZSBnaXZlbiBzY2hlbWEu
Ci1AQCAtMTM5Niw3ICsxMzk2LDcgQEAgY2xhc3MgaXMgcmV0dXJuZWQ6Ci0gICAgIERlZmF1bHRW
YWxpZGF0b3IgPSBfTEFURVNUX1ZFUlNJT04gaWYgZGVmYXVsdCBpcyBfVU5TRVQgZWxzZSBkZWZh
dWx0Ci0gCi0gICAgIGlmIHNjaGVtYSBpcyBUcnVlIG9yIHNjaGVtYSBpcyBGYWxzZSBvciAiJHNj
aGVtYSIgbm90IGluIHNjaGVtYToKLS0gICAgICAgIHJldHVybiBEZWZhdWx0VmFsaWRhdG9yCi0r
ICAgICAgICByZXR1cm4gRGVmYXVsdFZhbGlkYXRvciAgIyB0eXBlOiBpZ25vcmVbcmV0dXJuLXZh
bHVlXQotICAgICBpZiBzY2hlbWFbIiRzY2hlbWEiXSBub3QgaW4gX01FVEFfU0NIRU1BUyBhbmQg
ZGVmYXVsdCBpcyBfVU5TRVQ6Ci0gICAgICAgICB3YXJuKAotICAgICAgICAgICAgICgKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQu
MjMuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1h
XzQuMjQuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjIzLjAuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuMjQuMC5iYgpp
bmRleCA4MmI3YmIyM2VkLi45ZjhhYTg4Y2ViIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjIzLjAuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4yNC4wLmJiCkBAIC00LDkg
KzQsOSBAQCBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJ
Tkc7bWQ1PTdhNjBhODFjMTQ2ZWMyNTU5OWEzZTFkYWJiODYxMGE4IFwKICAgICAgICAgICAgICAg
ICAgICAgZmlsZTovL2pzb24vTElDRU5TRTttZDU9OWQ0ZGU0MzExMWQzMzU3MGM4ZmU0OWI0Y2Iw
ZTAxYWYiCiAKLVNSQ19VUkkgKz0gImZpbGU6Ly9kNzFmOTZhNjUyMzg3NWM5Njk0ZmNkZjQ2OGM5
ZjQ1ODMyM2QwN2YyLnBhdGNoIgorU1JDX1VSSSArPSAiJHtQWVBJX1NSQ19VUkl9IgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZDcxNDk3ZmVmMjYzNTFhMzMyNjUzMzdmYTc3ZmZlYjgyNDIzZjNl
YTIxMjgzY2Q5NDY3YmIwMzk5OTI2NmJjNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwYjRlODA2
OWViMTJhZWRmYTg4MTMzMzAwNGJjY2FlYzI0ZWNlZjVhOGE2YTRiNmRmMTQyYjJjYzk1OTlkMTk2
IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjQ3LjEKCg==

--===============3040940704921513564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-jsonschema: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/core2-64-poky-linux/python3-jsonschema: PV changed from "4.23.0" to "4.24.0"
packages/core2-64-poky-linux/python3-jsonschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.23.0.tar.gz;downloadfilename=jsonschema-4.23.0.tar.gz file://d71f96a6523875c9694fcdf468c9f458323d07f2.patch" to "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.24.0.tar.gz;downloadfilename=jsonschema-4.24.0.tar.gz https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.24.0.tar.gz;downloadfilename=jsonschema-4.24.0.tar.gz"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PV changed from "4.23.0" to "4.24.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dev: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dev: PV changed from "4.23.0" to "4.24.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-doc: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-doc: PV changed from "4.23.0" to "4.24.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-locale: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-locale: PV changed from "4.23.0" to "4.24.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-src: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-src: PV changed from "4.23.0" to "4.24.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PV changed from "4.23.0" to "4.24.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: PV changed from "4.23.0" to "4.24.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGSIZE changed from 458247 to 457929 (-0%)
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: PV changed from "4.23.0" to "4.24.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: PKGSIZE changed from 471493 to 471960 (+0%)
Changes to packages/core2-64-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.13/site-packages/jsonschema-4.23.0.dist-info moved to /usr/lib/python3.13/site-packages/jsonschema-4.24.0.dist-info

--===============3040940704921513564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.13/site-packages/jsonschema-4.23.0.dist-info moved to /usr/lib/python3.13/site-packages/jsonschema-4.24.0.dist-info

--===============3040940704921513564==--

