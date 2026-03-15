Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64900F013F6
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:12 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28964.1773582111701495761
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fTt6t52K;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JlmPfAV/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019cf1bb7ea8-957baf16-d58f-4190-be1f-4fe8e35619c8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582122;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HF3F79fXUV9yPnvxftNvwHtyadyr7CpNAqL5cogEMk4=;
	b=fTt6t52Kjd7KsDZ9P6OG2AiG9+BDp65xMbg3ElE+nJJmdBOBLdTYHz8WopFpoEdT
	yrxCI5aVLc3hzhGHJzVF0mq8hELIMM5/m2z49fa+d0EfJ8ArwP1qb7KO/nWnsgIARdG
	i7i9vQrcY2qUYmEI7xec5oGNQVa7JZyqtLf/1jDc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582122;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HF3F79fXUV9yPnvxftNvwHtyadyr7CpNAqL5cogEMk4=;
	b=JlmPfAV/eVRFpAFDX2T+Us72h6c4MtB1UqzQvWwsBWDNTbyj+x0EtLTzghXc1AZ6
	7hHtKBt/2hZwllt5ViR2AE+VELPlVb4BQUt6bDyHJqcTK/qp1GzvHy/PfMdUZf4qDHs
	fz5MrZfY2b0OSA6wrE/rP+j8ensYUEYSlelTG5dc=
Content-Type: multipart/mixed; boundary="===============1188562747806334817=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libpam: upgrading to 1.7.2 FAILED
Message-ID: <0101019cf1bb7ea8-957baf16-d58f-4190-be1f-4fe8e35619c8-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233163

--===============1188562747806334817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpam* to *1.7.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libpam-upgrade-1.7.1-1.7.2.patch
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
From 57d51be4687549fbccc6a4a3b4e037ea5a04ed20 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 09:31:13 +0000
Subject: [PATCH] libpam: upgrade 1.7.1 -> 1.7.2

---
 meta/recipes-extended/pam/{libpam_1.7.1.bb => libpam_1.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/pam/{libpam_1.7.1.bb => libpam_1.7.2.bb} (98%)

diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-extended/pam/libpam_1.7.2.bb
similarity index 98%
rename from meta/recipes-extended/pam/libpam_1.7.1.bb
rename to meta/recipes-extended/pam/libpam_1.7.2.bb
index 470aea80f6..4949001cd6 100644
--- a/meta/recipes-extended/pam/libpam_1.7.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.2.bb
@@ -24,7 +24,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://pam-volatiles.conf \
            "
 
-SRC_URI[sha256sum] = "21dbcec6e01dd578f14789eac9024a18941e6f2702a05cf91b28c232eeb26ab0"
+SRC_URI[sha256sum] = "3d86b6383fb5fd9eb9578d2cd47d92801191f4bf3f9bc61419bfefc8aa1e531a"
 
 DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 
-- 
2.47.1


--===============1188562747806334817==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpam-upgrade-1.7.1-1.7.2.patch"

RnJvbSA1N2Q1MWJlNDY4NzU0OWZiY2NjNmE0YTNiNGUwMzdlYTVhMDRlZDIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDk6MzE6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwYW06IHVwZ3JhZGUgMS43LjEgLT4gMS43LjIKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3BhbS97bGlicGFtXzEuNy4xLmJiID0+IGxpYnBhbV8xLjcuMi5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvcGFtL3tsaWJwYW1fMS43LjEuYmIgPT4gbGlicGFtXzEuNy4yLmJifSAoOTgl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wYW0vbGlicGFtXzEuNy4xLmJi
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhbS9saWJwYW1fMS43LjIuYmIKc2ltaWxhcml0eSBp
bmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhbS9saWJwYW1fMS43
LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wYW0vbGlicGFtXzEuNy4yLmJi
CmluZGV4IDQ3MGFlYTgwZjYuLjQ5NDkwMDFjZDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9wYW0vbGlicGFtXzEuNy4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9w
YW0vbGlicGFtXzEuNy4yLmJiCkBAIC0yNCw3ICsyNCw3IEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJf
QkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS9MaW51eC1QQU0tJHtQVn0udGFyLnh6IFwKICAgICAg
ICAgICAgZmlsZTovL3BhbS12b2xhdGlsZXMuY29uZiBcCiAgICAgICAgICAgICIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjIxZGJjZWM2ZTAxZGQ1NzhmMTQ3ODllYWM5MDI0YTE4OTQxZTZmMjcw
MmEwNWNmOTFiMjhjMjMyZWViMjZhYjAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2Q4NmI2Mzgz
ZmI1ZmQ5ZWI5NTc4ZDJjZDQ3ZDkyODAxMTkxZjRiZjNmOWJjNjE0MTliZmVmYzhhYTFlNTMxYSIK
IAogREVQRU5EUyA9ICJiaXNvbi1uYXRpdmUgZmxleC1uYXRpdmUgbGlieG1sMi1uYXRpdmUgdmly
dHVhbC9jcnlwdCIKIAotLSAKMi40Ny4xCgo=

--===============1188562747806334817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-903cb4be2c06470217a7e43d7866efd40b7104c6"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:903cb4be2c06470217a7e43d7866efd40b7104c6"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 131 Local 99 Mirrors 0 Missed 32 Current 458 (75% match, 94% complete)
done.
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 12 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 463 of 589 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 474 of 589 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 560 of 589 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_setscene)
NOTE: Running setscene task 575 of 589 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 587 of 589 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 589 of 589 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1021 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_write_config)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1481 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_fetch)
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1585 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_unpack)
NOTE: Running task 1586 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1587 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_patch)
NOTE: Running task 1588 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe libpam-1.7.2-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1590 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_configure)
NOTE: recipe libpam-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_configure: Started
NOTE: recipe bash-5.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1608 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.7.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1609 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_compile)
NOTE: recipe libpam-1.7.2-r0: task do_compile: Started
NOTE: recipe libpam-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 1610 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.7.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1611 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_install)
NOTE: recipe libpam-1.7.2-r0: task do_install: Started
NOTE: recipe libpam-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 1612 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_install_ptest_base)
NOTE: recipe libpam-1.7.2-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1613 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot)
NOTE: Running task 1614 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_package)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.7.2-r0: task do_package: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1615 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1616 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1617 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.77-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.19.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.41.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.77-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1618 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_configure)
NOTE: recipe shadow-4.19.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1619 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_configure)
NOTE: recipe util-linux-2.41.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1620 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_configure)
NOTE: recipe libcap-2.77-r0: task do_configure: Started
NOTE: recipe shadow-4.19.4-r0: task do_configure: Started
NOTE: recipe util-linux-2.41.3-r0: task do_configure: Started
NOTE: recipe libcap-2.77-r0: task do_configure: Succeeded
NOTE: Running task 1621 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_compile)
NOTE: recipe libcap-2.77-r0: task do_compile: Started
NOTE: recipe libcap-2.77-r0: task do_compile: Succeeded
NOTE: Running task 1622 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_install)
NOTE: recipe libcap-2.77-r0: task do_install: Started
NOTE: recipe libcap-2.77-r0: task do_install: Succeeded
NOTE: Running task 1623 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_populate_sysroot)
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1624 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1625 of 1682 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_configure)
NOTE: recipe coreutils-9.10-r0: task do_configure: Started
NOTE: recipe libpam-1.7.2-r0: task do_package: Failed
NOTE: recipe shadow-4.19.4-r0: task do_configure: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_configure: Succeeded
NOTE: recipe coreutils-9.10-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1625 tasks of which 1600 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315093001.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315093001.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libpam/1.7.2/temp/log.do_package.1187767
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libpam-1.7.2-r0 do_package: QA Issue: libpam: Files/directories were installed but not shipped in any package:
  /usr/share/pam
  /usr/share/pam/environment
  /usr/share/pam/security
  /usr/share/pam/security/pam_env.conf
  /usr/share/pam/security/namespace.conf
  /usr/share/pam/security/group.conf
  /usr/share/pam/security/faillock.conf
  /usr/share/pam/security/time.conf
  /usr/share/pam/security/pwhistory.conf
  /usr/share/pam/security/access.conf
  /usr/share/pam/security/namespace.init
  /usr/share/pam/security/limits.conf
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libpam: 12 installed and not shipped files. [installed-vs-shipped]
ERROR: libpam-1.7.2-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libpam/1.7.2/temp/log.do_package.1187767
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_package) failed with exit code '1'

--===============1188562747806334817==--

