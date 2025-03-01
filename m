Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623E4C36004
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.7046.1740828318095220928
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Swaafrha;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=q6+5Ao2z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019551745098-ed759d3c-6613-43d1-ae07-afb6ca29cf0d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ALTmIAb3TseNsbDI51IxI5axNH1wriRq17kVNjkumsw=;
	b=SwaafrhaGmV1dlQhGeX1nAYNsrc4gXIjmfanZocEznW09fh8wy/pkkgSB+wDhnI9
	Rz3OHtWDcf5efNMPDnHydHjXyIQBZqFJOcebBEyueHLF2osbhG3qwvxng6qPvi/DJGr
	O7iaLcsMPSTLuJy8vmQs5jvPDzut9nR9JpmIlubY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ALTmIAb3TseNsbDI51IxI5axNH1wriRq17kVNjkumsw=;
	b=q6+5Ao2zCZ17wC30DSSzDF3gD82sRS7nT2TeAPGKl7CrDncQCQATy4s1lhzcP6Pd
	ADqnLFuRLgmzpChRcE5lextY7QG5YeBFCYJSCusyaFKNKpdfytWT+Zqqdf2pplMoMx2
	RFwgnLBrkPbnmjViiicGf6oTuicEt8H2Hl2cdWD8=
Content-Type: multipart/mixed; boundary="===============0656166312404369613=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gi-docgen: upgrading to 2025.3 SUCCEEDED
Message-ID: <0101019551745098-ed759d3c-6613-43d1-ae07-afb6ca29cf0d-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212147

--===============0656166312404369613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gi-docgen* to *2025.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gi-docgen-upgrade-2024.1-2025.3.patch
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
From 87b953fb3ce85785e8d72662728ac051dc6290b5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 09:28:26 +0000
Subject: [PATCH] gi-docgen: upgrade 2024.1 -> 2025.3

---
 .../gi-docgen/{gi-docgen_2024.1.bb => gi-docgen_2025.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gi-docgen/{gi-docgen_2024.1.bb => gi-docgen_2025.3.bb} (94%)

diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
similarity index 94%
rename from meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb
rename to meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
index 12c2b8ed21..5dea1cdaee 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f0120247
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
 
-SRCREV = "eff4ec3d21df38c9d857bcf58aa98437c6610489"
+SRCREV = "9ab2ab8fa3f4a04f5d2cc24b0c8e91e73bc57b51"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============0656166312404369613==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gi-docgen-upgrade-2024.1-2025.3.patch"

RnJvbSA4N2I5NTNmYjNjZTg1Nzg1ZThkNzI2NjI3MjhhYzA1MWRjNjI5MGI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwOToyODoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdp
LWRvY2dlbjogdXBncmFkZSAyMDI0LjEgLT4gMjAyNS4zCgotLS0KIC4uLi9naS1kb2NnZW4ve2dp
LWRvY2dlbl8yMDI0LjEuYmIgPT4gZ2ktZG9jZ2VuXzIwMjUuMy5iYn0gICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1nbm9tZS9naS1kb2NnZW4ve2dpLWRvY2dlbl8yMDI0LjEuYmIgPT4gZ2ktZG9jZ2Vu
XzIwMjUuMy5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ2ktZG9j
Z2VuL2dpLWRvY2dlbl8yMDI0LjEuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ2ktZG9jZ2VuL2dp
LWRvY2dlbl8yMDI1LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWdub21lL2dpLWRvY2dlbi9naS1kb2NnZW5fMjAyNC4xLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZ25vbWUvZ2ktZG9jZ2VuL2dpLWRvY2dlbl8yMDI1LjMuYmIKaW5kZXggMTJjMmI4
ZWQyMS4uNWRlYTFjZGFlZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2dpLWRvY2dl
bi9naS1kb2NnZW5fMjAyNC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9naS1kb2NnZW4v
Z2ktZG9jZ2VuXzIwMjUuMy5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9naS1kb2NnZW4ucHk7YmVnaW5saW5lPTE7ZW5kbGluZT01O21kNT0yZGMwZjFmMDEy
MDI0NwogCiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvZ2ktZG9jZ2Vu
LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbiIKIAotU1JDUkVWID0gImVmZjRlYzNkMjFk
ZjM4YzlkODU3YmNmNThhYTk4NDM3YzY2MTA0ODkiCitTUkNSRVYgPSAiOWFiMmFiOGZhM2Y0YTA0
ZjVkMmNjMjRiMGM4ZTkxZTczYmM1N2I1MSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAK
Mi40NC4xCgo=

--===============0656166312404369613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gi-docgen/gi-docgen-dbg: PV changed from "2024.1" to "2025.3"
packages/core2-64-poky-linux/gi-docgen/gi-docgen-dbg: PKGV changed from 2024.1 [default] to 2025.3 [default]
packages/core2-64-poky-linux/gi-docgen/gi-docgen-dev: PV changed from "2024.1" to "2025.3"
packages/core2-64-poky-linux/gi-docgen/gi-docgen-dev: PKGV changed from 2024.1 [default] to 2025.3 [default]
packages/core2-64-poky-linux/gi-docgen/gi-docgen-doc: PV changed from "2024.1" to "2025.3"
packages/core2-64-poky-linux/gi-docgen/gi-docgen-doc: PKGV changed from 2024.1 [default] to 2025.3 [default]
packages/core2-64-poky-linux/gi-docgen/gi-docgen-locale: PV changed from "2024.1" to "2025.3"
packages/core2-64-poky-linux/gi-docgen/gi-docgen-locale: PKGV changed from 2024.1 [default] to 2025.3 [default]
packages/core2-64-poky-linux/gi-docgen/gi-docgen-src: PV changed from "2024.1" to "2025.3"
packages/core2-64-poky-linux/gi-docgen/gi-docgen-src: PKGV changed from 2024.1 [default] to 2025.3 [default]
packages/core2-64-poky-linux/gi-docgen/gi-docgen-staticdev: PV changed from "2024.1" to "2025.3"
packages/core2-64-poky-linux/gi-docgen/gi-docgen-staticdev: PKGV changed from 2024.1 [default] to 2025.3 [default]
packages/core2-64-poky-linux/gi-docgen/gi-docgen: PV changed from "2024.1" to "2025.3"
packages/core2-64-poky-linux/gi-docgen/gi-docgen: PKGSIZE changed from 2295594 to 2310158 (+1%)
packages/core2-64-poky-linux/gi-docgen/gi-docgen: PKGV changed from 2024.1 [default] to 2025.3 [default]
packages/core2-64-poky-linux/gi-docgen: PV changed from "2024.1" to "2025.3"
packages/core2-64-poky-linux/gi-docgen: PKGV changed from 2024.1 [default] to 2025.3 [default]
Changes to packages/core2-64-poky-linux/gi-docgen (sysroot):
  /usr/lib/python3.13/site-packages/gi_docgen-2024.1.dist-info moved to /usr/lib/python3.13/site-packages/gi_docgen-2025.3.dist-info

--===============0656166312404369613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1882 targets, 50 skipped, 0 masked, 0 errors.
Removing 27 recipes from the core2-64 sysroot...done.
Removing 64 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:c753fed27b161b9f35ef7f9ebf9e0f171f910051"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 499 Local 488 Mirrors 0 Missed 11 Current 269 (97% match, 98% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 271 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 272 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 274 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 277 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 279 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 286 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 293 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 299 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 300 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 301 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 306 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 328 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.1.bb:do_package_qa_setscene)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-markdown-3.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pygments-2.19.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jinja2-3.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_package_qa_setscene: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygments-2.19.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 336 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.7.bb:do_package_write_deb_setscene)
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 338 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-markdown-3.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 342 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 343 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 344 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.1.bb:do_package_write_ipk_setscene)
NOTE: recipe gi-docgen-2025.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 347 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 353 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_package_write_deb_setscene)
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 360 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 368 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 369 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb:do_package_write_deb_setscene)
NOTE: recipe python3-jinja2-3.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 376 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 379 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.7.bb:do_create_spdx_setscene)
NOTE: recipe python3-markdown-3.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-markdown-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygments-2.19.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jinja2-3.1.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jinja2-3.1.5-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pygments-2.19.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygments-2.19.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-markdown-3.7-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jinja2-3.1.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-markdown-3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-markdown-3.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 381 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.5-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 385 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-markdown-3.7-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-markdown-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 389 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.1.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 392 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.1.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.1.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 396 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-markdown-3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 400 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.7.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 401 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-75.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markdown-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 408 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 409 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-typogrify-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 410 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-75.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-pytest-8.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typogrify_2.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 426 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markdown-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 437 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.7.bb:do_recipe_qa_setscene)
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typogrify-2.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-markdown-3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygments-2.19.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 447 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typogrify-2.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.19.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-markdown-3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 469 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 479 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 495 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 801 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_recipe_qa)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 515 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 542 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gi-docgen-2025.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1003 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_fetch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 576 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 584 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 587 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 598 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 601 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 615 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 616 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 622 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.73-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/zstd/1.5.6/temp/log.do_packagedata_setscene.284972
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 626 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 642 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 643 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 655 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 659 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 664 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_package_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 678 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 685 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 692 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 702 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 705 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 709 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1309 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_unpack)
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_package_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gi-docgen-2025.3-r0: task do_unpack: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 728 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 731 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe gi-docgen-2025.3-r0: task do_unpack: Succeeded
NOTE: Running task 1446 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_patch)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_patch: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gi-docgen-2025.3-r0: task do_patch: Succeeded
NOTE: Running task 1452 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1453 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_check_backend)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe gi-docgen-2025.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_check_backend: Started
WARNING: gi-docgen-2025.3-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_check_backend: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 737 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 740 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 742 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 745 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 760 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 767 of 768 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1914 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1936 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata)
NOTE: Running task 2081 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2025.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata: Succeeded
NOTE: recipe gi-docgen-2025.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2025.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2133 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_configure)
NOTE: recipe gi-docgen-2025.3-r0: task do_configure: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_configure: Succeeded
NOTE: Running task 2134 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_compile)
NOTE: recipe gi-docgen-2025.3-r0: task do_compile: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_compile: Succeeded
NOTE: Running task 2135 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_install)
NOTE: recipe gi-docgen-2025.3-r0: task do_install: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_install: Succeeded
NOTE: Running task 2136 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_package)
NOTE: Running task 2137 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_populate_sysroot)
NOTE: recipe gi-docgen-2025.3-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_package: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gi-docgen-2025.3-r0: task do_package: Succeeded
NOTE: Running task 2138 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_packagedata)
NOTE: recipe gi-docgen-2025.3-r0: task do_packagedata: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2139 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_create_spdx)
NOTE: Running task 2140 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_package_write_ipk)
NOTE: Running task 2141 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_package_write_deb)
NOTE: Running task 2142 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_package_write_rpm)
NOTE: Running task 2143 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_package_qa)
NOTE: recipe gi-docgen-2025.3-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_package_write_ipk: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_package_write_deb: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_package_qa: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2144 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_create_package_spdx)
NOTE: recipe gi-docgen-2025.3-r0: task do_create_package_spdx: Started
NOTE: recipe gi-docgen-2025.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gi-docgen-2025.3-r0: task do_package_qa: Succeeded
NOTE: recipe gi-docgen-2025.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gi-docgen-2025.3-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gi-docgen-2025.3-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2145 of 2145 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2145 tasks of which 2123 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: zstd-1.5.6-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-src went backwards which would break package feeds (from 0:1.5.7-r0 to 0:1.5.6-r0) [version-going-backwards]
ERROR: zstd-1.5.6-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-dbg went backwards which would break package feeds (from 0:1.5.7-r0 to 0:1.5.6-r0) [version-going-backwards]
ERROR: zstd-1.5.6-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-staticdev went backwards which would break package feeds (from 0:1.5.7-r0 to 0:1.5.6-r0) [version-going-backwards]
ERROR: zstd-1.5.6-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-dev went backwards which would break package feeds (from 0:1.5.7-r0 to 0:1.5.6-r0) [version-going-backwards]
ERROR: zstd-1.5.6-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-doc went backwards which would break package feeds (from 0:1.5.7-r0 to 0:1.5.6-r0) [version-going-backwards]
ERROR: zstd-1.5.6-r0 do_packagedata_setscene: QA Issue: Package version for package zstd-locale went backwards which would break package feeds (from 0:1.5.7-r0 to 0:1.5.6-r0) [version-going-backwards]
ERROR: zstd-1.5.6-r0 do_packagedata_setscene: QA Issue: Package version for package libzstd went backwards which would break package feeds (from 0:1.5.7-r0 to 0:1.5.6-r0) [version-going-backwards]
ERROR: zstd-1.5.6-r0 do_packagedata_setscene: QA Issue: Package version for package zstd went backwards which would break package feeds (from 0:1.5.7-r0 to 0:1.5.6-r0) [version-going-backwards]
ERROR: zstd-1.5.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0656166312404369613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/gi-docgen (sysroot):
  /usr/lib/python3.13/site-packages/gi_docgen-2024.1.dist-info moved to /usr/lib/python3.13/site-packages/gi_docgen-2025.3.dist-info

--===============0656166312404369613==--

