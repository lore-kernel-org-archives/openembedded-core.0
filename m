Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5EAD0EE00
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:05 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.53350.1728588940637321485
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Hs3tbfjH;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=BZ55fIBu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019277ee5299-f2075dd8-3a22-4edc-9e12-9cf3b01c422b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588961;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ay6Tb1jePtFwJbgi8HYafjfmtqwWNLn2vg8HAYHmRP0=;
	b=Hs3tbfjHNDqcrczCQrB8eE05kmQRbldMHyz5Po8iVRjh+DNmhXDsHth4SF1OFu6g
	vMuj7xqQ/wrbFJRy2l8no95DMC3MfGP6YdTNAd1GAhPW9WOq2W0LI6WedBpLODmNaEY
	uOMk7a2fI5bIDPvr2fqkxQHj6a3I184MAhyOjD84=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588961;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ay6Tb1jePtFwJbgi8HYafjfmtqwWNLn2vg8HAYHmRP0=;
	b=BZ55fIBuULhpWZ4xlOFxMHGKg26zBPA8DgcSgWuy5898Vj0LxUapXQO7PidU3aau
	RpQNj0oJVgkt+P1SsWZnyQvbGudLWr5woysO1Fe/QBsICaCyg9H9xNAh1nar+aeL3Am
	YeSvDOXPyfGqhJhDugMx9tpRxMf6wN+L2aCBYHrc=
Content-Type: multipart/mixed; boundary="===============3817288974739234796=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <mrybczynska@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-spdx-tools: upgrading to 0.8.3 SUCCEEDED
Message-ID: <0101019277ee5299-f2075dd8-3a22-4edc-9e12-9cf3b01c422b-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205499

--===============3817288974739234796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-spdx-tools* to *0.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-spdx-tools-upgrade-0.8.2-0.8.3.patch
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
From 8d8a7fe3aebbb5051e08a9ae2a48e70b5bad3cf7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 13:49:46 +0000
Subject: [PATCH] python3-spdx-tools: upgrade 0.8.2 -> 0.8.3

---
 ...{python3-spdx-tools_0.8.2.bb => python3-spdx-tools_0.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-spdx-tools_0.8.2.bb => python3-spdx-tools_0.8.3.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb b/meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb
rename to meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb
index 6573ae9eee..0f05679322 100644
--- a/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb
+++ b/meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/spdx/tools-python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dc7f21ccff0f672f2a7cd6f412ae627d"
 
-SRC_URI[sha256sum] = "aea4ac9c2c375e7f439b1cef5ff32ef34914c083de0f61e08ed67cd3d9deb2a9"
+SRC_URI[sha256sum] = "68b8f9ce2893b5216bd90b2e63f1c821c2884e4ebc4fd295ebbf1fa8b8a94b93"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.44.1


--===============3817288974739234796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1872 targets, 51 skipped, 0 masked, 0 errors.
Removing 31 recipes from the core2-64 sysroot...done.
Removing 71 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c7f98aa6ed69b45745ef36fbdcc6bf7c77bc8501"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 571 Local 571 Mirrors 0 Missed 0 Current 219 (100% match, 100% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 225 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.18.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 226 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.18.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 227 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.18.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 229 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 230 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-license-expression_30.3.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 232 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-license-expression_30.3.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 233 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-license-expression_30.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-ply_3.11.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 235 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-ply_3.11.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 236 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-ply_3.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 238 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 239 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-beartype-0.18.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-beartype-0.18.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-beartype-0.18.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-license-expression-30.3.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-license-expression-30.3.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-ply-3.11-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-license-expression-30.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-ply-3.11-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-ply-3.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pyyaml-6.0.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pyyaml-6.0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pyyaml-6.0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-beartype-0.18.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-beartype-0.18.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-beartype-0.18.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 241 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 242 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-license-expression-30.3.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-license-expression-30.3.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-license-expression-30.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 244 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 245 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb:do_create_package_spdx_setscene)
NOTE: Running setscene task 247 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb:do_package_qa_setscene)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 248 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 250 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 251 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb:do_populate_lic_setscene)
NOTE: recipe python3-pyyaml-6.0.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pyyaml-6.0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 253 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-uritools_4.0.3.bb:do_package_write_deb_setscene)
NOTE: recipe python3-pyyaml-6.0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 254 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-uritools_4.0.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 255 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-uritools_4.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_create_package_spdx_setscene: Started
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-uritools-4.0.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-uritools-4.0.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-uritools-4.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 257 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 258 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 259 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_packagedata_setscene)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 260 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyparsing_3.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 262 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 263 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-uritools-4.0.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-uritools-4.0.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 264 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-uritools-4.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 269 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pyparsing-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 340 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.3.bb:do_packagedata_setscene)
NOTE: recipe python3-pyparsing-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_create_package_spdx_setscene: Succeeded
NOTE: Running setscene task 345 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.18.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-license-expression_30.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-ply_3.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyyaml_6.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 370 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-uritools_4.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-setuptools/72.1.0/temp/log.do_packagedata_setscene.641015
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 374 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_package_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-beartype-0.18.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-click-8.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-license-expression-30.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyyaml-6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-uritools-4.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-ply-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-beartype-0.18.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-license-expression-30.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pyyaml-6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-uritools-4.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 378 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 422 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-spdx-tools-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_package_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_packagedata_setscene)
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 657 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 678 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 687 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 689 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 716 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 717 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 721 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 730 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 736 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 740 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 742 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 743 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 745 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 760 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 774 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 781 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 786 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 790 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2105 of 2183 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata: Succeeded
NOTE: Running noexec task 2183 of 2183 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2183 tasks of which 2181 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:75.1.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:75.1.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:75.1.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:75.1.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:75.1.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:75.1.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:75.1.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:75.1.0-r0 to 0:72.1.0-r0) [version-going-backwards]
ERROR: python3-setuptools-72.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3817288974739234796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-spdx-tools (sysroot):
  /usr/lib/python3.12/site-packages/spdx_tools-0.8.2.dist-info moved to /usr/lib/python3.12/site-packages/spdx_tools-0.8.3.dist-info

--===============3817288974739234796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-spdx-tools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/spdx-tools/spdx-tools-0.8.2.tar.gz;downloadfilename=spdx-tools-0.8.2.tar.gz" to "https://files.pythonhosted.org/packages/source/s/spdx-tools/spdx-tools-0.8.3.tar.gz;downloadfilename=spdx-tools-0.8.3.tar.gz"
packages/core2-64-poky-linux/python3-spdx-tools: PV changed from "0.8.2" to "0.8.3"
packages/core2-64-poky-linux/python3-spdx-tools: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-dbg: PV changed from "0.8.2" to "0.8.3"
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-dbg: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-dev: PV changed from "0.8.2" to "0.8.3"
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-dev: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-doc: PV changed from "0.8.2" to "0.8.3"
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-doc: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-locale: PV changed from "0.8.2" to "0.8.3"
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-locale: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-src: PV changed from "0.8.2" to "0.8.3"
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-src: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-staticdev: PV changed from "0.8.2" to "0.8.3"
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-staticdev: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools: PV changed from "0.8.2" to "0.8.3"
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools: PKGV changed from 0.8.2 [default] to 0.8.3 [default]
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools: PKGSIZE changed from 1575901 to 1579648 (+0%)
Changes to packages/core2-64-poky-linux/python3-spdx-tools (sysroot):
  /usr/lib/python3.12/site-packages/spdx_tools-0.8.2.dist-info moved to /usr/lib/python3.12/site-packages/spdx_tools-0.8.3.dist-info

--===============3817288974739234796==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-spdx-tools-upgrade-0.8.2-0.8.3.patch"

RnJvbSA4ZDhhN2ZlM2FlYmJiNTA1MWUwOGE5YWUyYTQ4ZTcwYjViYWQzY2Y3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTM6NDk6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwZHgtdG9vbHM6IHVwZ3JhZGUgMC44LjIgLT4gMC44LjMKCi0tLQogLi4ue3B5dGhv
bjMtc3BkeC10b29sc18wLjguMi5iYiA9PiBweXRob24zLXNwZHgtdG9vbHNfMC44LjMuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zcGR4LXRvb2xzXzAuOC4y
LmJiID0+IHB5dGhvbjMtc3BkeC10b29sc18wLjguMy5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BkeC10b29sc18wLjguMi5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGR4LXRvb2xzXzAuOC4zLmJi
CnNpbWlsYXJpdHkgaW5kZXggODklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1zcGR4LXRvb2xzXzAuOC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BkeC10b29sc18wLjguMy5iYgppbmRleCA2NTczYWU5
ZWVlLi4wZjA1Njc5MzIyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtc3BkeC10b29sc18wLjguMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtc3BkeC10b29sc18wLjguMy5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBB
R0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3NwZHgvdG9vbHMtcHl0aG9uIgogTElDRU5TRSA9ICJB
cGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZGM3ZjIx
Y2NmZjBmNjcyZjJhN2NkNmY0MTJhZTYyN2QiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhZWE0
YWM5YzJjMzc1ZTdmNDM5YjFjZWY1ZmYzMmVmMzQ5MTRjMDgzZGUwZjYxZTA4ZWQ2N2NkM2Q5ZGVi
MmE5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY4YjhmOWNlMjg5M2I1MjE2YmQ5MGIyZTYzZjFj
ODIxYzI4ODRlNGViYzRmZDI5NWViYmYxZmE4YjhhOTRiOTMiCiAKIEJCQ0xBU1NFWFRFTkQgPSAi
bmF0aXZlIG5hdGl2ZXNkayIKIAotLSAKMi40NC4xCgo=

--===============3817288974739234796==--

