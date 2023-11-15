Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB10C54F61
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:11 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.14616.1700059029003989944
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IKeE7Pnb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ry8kuRtV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018bd36a1b3b-5635ea91-4db0-425b-bb17-deffa9df1f39-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9lsxTlp/cXzVssMwPK2h9eJx42Y8OOEewTQOJ97tzdE=;
	b=IKeE7Pnb4sbr9LZ5BIPiI/JyRjz7HI7taNXN42hlQbp5711Y9xSfU1rPCsx8+RGT
	Rr0W8Q10hHkbhi4+BzjsrJq6tWq3X2BY6mtneJTeu3X9zDfcR3dLtPnpeEWlmpGuLQZ
	RoYDIRrw40lxh4bUa0y2JcENUs0D52Uv5db8emAI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9lsxTlp/cXzVssMwPK2h9eJx42Y8OOEewTQOJ97tzdE=;
	b=Ry8kuRtVInrM4Uz4aj3zJ39Y0I3zyi5FqFLD2UtEqqjE+B+tWjhpQ2SLQH+KHsAC
	Dl8bolOHmlrIyrNlCJ6qcphZDxI/pjzsFjcEaWAehBvxvmujrRwAyPODWGXVAR/HDxA
	XMUpSEMpAqd5GeCR+A/D4fJaWVnxcpcbyvXBCNYA=
Content-Type: multipart/mixed; boundary="===============1093689799838310747=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gettext: upgrading to 0.22.3 FAILED
Message-ID: <0101018bd36a1b3b-5635ea91-4db0-425b-bb17-deffa9df1f39-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190604

--===============1093689799838310747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gettext* to *0.22.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gettext-upgrade-0.22-0.22.3.patch
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
From 8b61f1f2b03595ad32d1788d4a7b143ac29829a8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 05:24:41 +0000
Subject: [PATCH] gettext: upgrade 0.22 -> 0.22.3

---
 meta/recipes-core/gettext/gettext-sources.inc                   | 2 +-
 .../recipes-core/gettext/{gettext_0.22.bb => gettext_0.22.3.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/gettext/{gettext_0.22.bb => gettext_0.22.3.bb} (100%)

diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-core/gettext/gettext-sources.inc
index b4fb647916..31dabfc543 100644
--- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,4 +1,4 @@
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab"
+SRC_URI[sha256sum] = "839a260b2314ba66274dae7d245ec19fce190a3aa67869bf31354cb558df42c7"
diff --git a/meta/recipes-core/gettext/gettext_0.22.bb b/meta/recipes-core/gettext/gettext_0.22.3.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext_0.22.bb
rename to meta/recipes-core/gettext/gettext_0.22.3.bb
-- 
2.39.2


--===============1093689799838310747==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gettext-upgrade-0.22-0.22.3.patch"

RnJvbSA4YjYxZjFmMmIwMzU5NWFkMzJkMTc4OGQ0YTdiMTQzYWMyOTgyOWE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDU6MjQ6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
ZXR0ZXh0OiB1cGdyYWRlIDAuMjIgLT4gMC4yMi4zCgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL2dl
dHRleHQvZ2V0dGV4dC1zb3VyY2VzLmluYyAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9y
ZWNpcGVzLWNvcmUvZ2V0dGV4dC97Z2V0dGV4dF8wLjIyLmJiID0+IGdldHRleHRfMC4yMi4zLmJi
fSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtY29yZS9nZXR0ZXh0L3tnZXR0ZXh0XzAuMjIuYmIgPT4gZ2V0dGV4
dF8wLjIyLjMuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dldHRl
eHQvZ2V0dGV4dC1zb3VyY2VzLmluYyBiL21ldGEvcmVjaXBlcy1jb3JlL2dldHRleHQvZ2V0dGV4
dC1zb3VyY2VzLmluYwppbmRleCBiNGZiNjQ3OTE2Li4zMWRhYmZjNTQzIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29yZS9nZXR0ZXh0L2dldHRleHQtc291cmNlcy5pbmMKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2V0dGV4dC9nZXR0ZXh0LXNvdXJjZXMuaW5jCkBAIC0xLDQgKzEsNCBAQAog
SE9NRVBBR0UgPSAiaHR0cDovL3d3dy5nbnUub3JnL3NvZnR3YXJlL2dldHRleHQvZ2V0dGV4dC5o
dG1sIgogU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L2dldHRleHQvZ2V0dGV4dC0ke1BWfS50YXIu
Z3ogXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDlmMDg5YmUxMWI0OTAx
NzBiYmYwOWVkMmY1MWU1ZjUxNzdmNTViZTRjYzY2NTA0YTU4NjE4MjBlMGZiMDZhYiIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI4MzlhMjYwYjIzMTRiYTY2Mjc0ZGFlN2QyNDVlYzE5ZmNlMTkwYTNh
YTY3ODY5YmYzMTM1NGNiNTU4ZGY0MmM3IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUv
Z2V0dGV4dC9nZXR0ZXh0XzAuMjIuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9nZXR0ZXh0L2dldHRl
eHRfMC4yMi4zLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtY29yZS9nZXR0ZXh0L2dldHRleHRfMC4yMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNv
cmUvZ2V0dGV4dC9nZXR0ZXh0XzAuMjIuMy5iYgotLSAKMi4zOS4yCgo=

--===============1093689799838310747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1846 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (909 cached, 2 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-9a1cbfb67e5cb2781b84b37460e29145c7bfdde6"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9a1cbfb67e5cb2781b84b37460e29145c7bfdde6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 526 Local 137 Mirrors 0 Missed 389 Current 120 (26% match, 39% complete)
Removing 58 stale sstate objects for arch core2-64...done.
Removing 49 stale sstate objects for arch qemux86_64...done.
Removing 90 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 180 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 211 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 229 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 235 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 288 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 296 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 297 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 306 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 312 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 315 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 317 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4_1.4.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 318 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 320 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 324 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 326 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 331 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnu-config-20230216+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe autoconf-2.72c-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe m4-1.4.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-native-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dpkg-native-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 332 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 333 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.38.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnu-config-20230216+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 337 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 339 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 341 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 342 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe m4-1.4.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-native-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 343 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4_1.4.19.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 346 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 347 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 348 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 351 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe autoconf-2.72c-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 353 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 355 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 356 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 357 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dpkg-native-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 360 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnu-config-20230216+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 364 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe m4-1.4.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe autoconf-2.72c-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnu-config-20230216+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 367 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 373 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 376 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 377 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 380 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 381 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe m4-1.4.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 386 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 388 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 391 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 394 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe autoconf-2.72c-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 398 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 401 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 402 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 403 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 404 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 405 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 406 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 407 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 408 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 409 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 418 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 423 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 425 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 428 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 431 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 433 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 442 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 445 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/help2man/help2man_1.49.3.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 447 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 451 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 459 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.43.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 461 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe help2man-native-1.49.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 465 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 466 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 467 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 468 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.41.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe meson-native-1.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-native-68.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 469 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-build-native-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 480 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.5.bb:do_create_spdx_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 483 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 484 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 486 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe help2man-native-1.49.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 489 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 490 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 492 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-native-23.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-native-68.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe meson-native-1.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-build-native-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 493 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 496 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 500 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-wheel-native-0.41.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-native-23.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 504 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-native-0.189-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-native-5.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 510 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-native-8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 511 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lua-native-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 516 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 517 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: recipe patch-native-2.7.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 520 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe perlcross-native-1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.41.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rsync-native-3.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 525 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 528 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rpm-native-1_4.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-native-0.189-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 532 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-native-5.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 541 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-native-8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 547 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lua-native-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 551 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe patch-native-2.7.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 553 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 554 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-native-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 559 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rpm-native-1_4.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 560 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-native-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-native-4.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-3.27.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-native-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-native-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 562 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-native-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-native-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 563 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 566 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-native-4.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 567 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 568 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-native-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 570 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe expat-native-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-native-3.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-3.27.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-native-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-native-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 572 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-native-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-native-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 573 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 577 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-native-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 581 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 582 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-native-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-native-3.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 584 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 588 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-native-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ninja-native-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 590 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-native-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 591 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perlcross-native-1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-native-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-native-5.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-native-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-native-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ninja-native-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 594 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-native-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-native-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 596 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 598 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-native-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-native-5.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rsync-native-3.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 601 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 602 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-native-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 612 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 613 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-native-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-native-1.10.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 616 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-native-1.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 621 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 629 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_create_spdx_setscene)
NOTE: recipe gdbm-native-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 633 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-native-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 646 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4-native_1.4.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-native-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 641 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-native-1.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 642 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 644 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-native-1.10.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 645 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-native-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-native-10.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gperf-native-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-native-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-native-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-native-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe popt-native-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 646 of 646 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe m4-native-1.4.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-native-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnu-config-native-20230216+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-native-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gperf-native-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-native-10.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-native-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-native-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe autoconf-native-2.72c-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe automake-native-1.16.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-native-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-native-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe popt-native-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe m4-native-1.4.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-native-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 16 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_recipe_qa)
NOTE: Running task 18 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4-native_1.4.19.bb:do_fetch)
NOTE: Running task 28 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_fetch)
NOTE: Running task 30 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_fetch)
NOTE: Running task 32 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 35 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_fetch)
NOTE: Running task 37 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_fetch)
NOTE: Running task 39 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 41 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_fetch)
NOTE: Running task 46 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_fetch)
NOTE: recipe gnu-config-native-20230216+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 57 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_fetch)
NOTE: recipe perlcross-native-1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-native-3_3.43.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 61 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf-archive/autoconf-archive_2023.02.20.bb:do_fetch)
NOTE: recipe automake-native-1.16.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 62 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_fetch)
NOTE: recipe autoconf-native-2.72c-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 63 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_fetch)
NOTE: recipe gettext-minimal-native-0.22-r0: task do_recipe_qa: Started
NOTE: recipe m4-native-1.4.19-r0: task do_fetch: Started
NOTE: recipe libtool-native-2.4.7-r0: task do_fetch: Started
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 64 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_fetch)
NOTE: recipe m4-native-1.4.19-r0: task do_fetch: Succeeded
NOTE: Running task 65 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4-native_1.4.19.bb:do_unpack)
NOTE: recipe libtool-native-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-native-3_3.43.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: Running task 66 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_fetch)
NOTE: Running task 67 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_unpack)
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_fetch: Started
NOTE: recipe xz-native-5.4.4-r0: task do_fetch: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_fetch: Started
NOTE: recipe patch-native-2.7.6-r0: task do_fetch: Started
NOTE: recipe bison-native-3.8.2-r0: task do_fetch: Started
NOTE: recipe flex-native-2.6.4-r0: task do_fetch: Started
NOTE: recipe attr-native-2.5.1-r0: task do_fetch: Started
NOTE: recipe xz-native-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe gmp-native-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 68 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_unpack)
NOTE: recipe bison-native-3.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 69 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe attr-native-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe patch-native-2.7.6-r0: task do_fetch: Succeeded
NOTE: recipe autoconf-archive-native-2023.02.20-r0: task do_fetch: Started
NOTE: Running task 71 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_fetch)
NOTE: recipe flex-native-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 72 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 73 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_unpack)
NOTE: Running task 74 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_unpack)
NOTE: recipe autoconf-archive-native-2023.02.20-r0: task do_fetch: Succeeded
NOTE: recipe automake-native-1.16.5-r0: task do_fetch: Started
NOTE: recipe m4-native-1.4.19-r0: task do_unpack: Started
NOTE: Running task 82 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: recipe autoconf-native-2.72c-r0: task do_fetch: Started
NOTE: recipe libtool-native-2.4.7-r0: task do_unpack: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_fetch: Succeeded
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 83 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_unpack)
NOTE: recipe automake-native-1.16.5-r0: task do_fetch: Succeeded
NOTE: Running task 85 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 86 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_unpack)
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_fetch: Started
NOTE: recipe gettext-minimal-native-0.22-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_recipe_qa unihash changed to 580305930cbe37f5452919f711062a7df98dffcfd3e2bcd9f01aa01e9a34065a
NOTE: recipe autoconf-native-2.72c-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-native-3_3.43.2-r0: task do_fetch: Started
NOTE: recipe xz-native-5.4.4-r0: task do_unpack: Started
NOTE: recipe mpfr-native-4.2.1-r0: task do_fetch: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_unpack: Started
NOTE: recipe sqlite3-native-3_3.43.2-r0: task do_fetch: Succeeded
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_fetch: Succeeded
NOTE: recipe patch-native-2.7.6-r0: task do_unpack: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_unpack: Started
NOTE: recipe attr-native-2.5.1-r0: task do_unpack: Started
NOTE: recipe mpfr-native-4.2.1-r0: task do_fetch: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_unpack: Started
NOTE: recipe acl-native-2.3.1-r0: task do_fetch: Started
NOTE: recipe m4-native-1.4.19-r0: task do_unpack: Succeeded
NOTE: recipe attr-native-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe popt-native-1.19-r0: task do_fetch: Started
NOTE: recipe automake-native-1.16.5-r0: task do_unpack: Started
NOTE: recipe acl-native-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe popt-native-1.19-r0: task do_fetch: Succeeded
NOTE: recipe libtool-native-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe xz-native-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe patch-native-2.7.6-r0: task do_unpack: Succeeded
NOTE: recipe automake-native-1.16.5-r0: task do_unpack: Succeeded
NOTE: recipe gmp-native-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 87 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_fetch)
NOTE: Running task 88 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4-native_1.4.19.bb:do_patch)
NOTE: Running task 89 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_unpack)
NOTE: Running task 90 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_patch)
NOTE: Running task 91 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_patch)
NOTE: Running task 92 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_patch)
NOTE: Running task 93 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: Running task 94 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_unpack)
NOTE: Running task 95 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_patch)
NOTE: Running task 96 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_patch)
NOTE: Running task 97 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Running task 98 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_unpack)
NOTE: Running task 99 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_patch)
NOTE: Running task 102 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_fetch)
NOTE: Running task 103 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_fetch)
NOTE: Running task 105 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_fetch)
NOTE: recipe gettext-minimal-native-0.22-r0: task do_fetch: Started
NOTE: recipe libtool-native-2.4.7-r0: task do_patch: Started
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.tar.gz
Cleaning and trying again.
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.tar.gz_bad-checksum_49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab
NOTE: recipe m4-native-1.4.19-r0: task do_patch: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_fetch: Started
NOTE: recipe autoconf-native-2.72c-r0: task do_unpack: Started
NOTE: recipe automake-native-1.16.5-r0: task do_patch: Started
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_unpack: Started
NOTE: recipe unifdef-native-2.12-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_fetch: Succeeded
NOTE: recipe xz-native-5.4.4-r0: task do_patch: Started
NOTE: Running task 109 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_fetch)
NOTE: recipe gmp-native-6.3.0-r0: task do_patch: Started
NOTE: recipe sqlite3-native-3_3.43.2-r0: task do_unpack: Started
NOTE: recipe patch-native-2.7.6-r0: task do_patch: Started
NOTE: recipe attr-native-2.5.1-r0: task do_patch: Started
NOTE: recipe flex-native-2.6.4-r0: task do_patch: Started
NOTE: recipe unifdef-native-2.12-r0: task do_fetch: Succeeded
NOTE: recipe rsync-native-3.2.7-r0: task do_fetch: Started
NOTE: Running task 111 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_fetch)
NOTE: recipe xz-native-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 113 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: recipe rsync-native-3.2.7-r0: task do_fetch: Succeeded
NOTE: recipe attr-native-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 114 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 116 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_unpack)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-native-3_3.43.2-r0: task do_unpack: Succeeded
NOTE: Running task 117 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_patch)
NOTE: recipe libmpc-native-1.3.1-r0: task do_fetch: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 120 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmpc-native-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe m4-native-1.4.19-r0: task do_patch: Succeeded
NOTE: Running task 121 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_unpack)
NOTE: Running noexec task 130 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_fetch)
NOTE: Running task 132 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_fetch)
NOTE: recipe rsync-native-3.2.7-r0: task do_unpack: Started
NOTE: recipe popt-native-1.19-r0: task do_unpack: Started
NOTE: recipe acl-native-2.3.1-r0: task do_unpack: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 137 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_fetch)
NOTE: recipe popt-native-1.19-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-native-3_3.43.2-r0: task do_patch: Started
NOTE: Running task 138 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe rsync-native-3.2.7-r0: task do_unpack: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 139 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_patch)
NOTE: recipe acl-native-2.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 140 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: recipe unifdef-native-2.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-native-3_3.43.2-r0: task do_patch: Succeeded
NOTE: Running noexec task 142 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_fetch)
NOTE: Running task 152 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: recipe libmpc-native-1.3.1-r0: task do_unpack: Started
NOTE: Running task 155 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: recipe autoconf-native-2.72c-r0: task do_unpack: Succeeded
NOTE: recipe gperf-native-3.1-r0: task do_fetch: Started
NOTE: Running task 156 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_patch)
NOTE: recipe gperf-native-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 157 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_unpack)
NOTE: recipe flex-native-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe libmpc-native-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 162 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: Running task 163 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_patch)
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Started
NOTE: recipe popt-native-1.19-r0: task do_patch: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_patch: Started
NOTE: recipe acl-native-2.3.1-r0: task do_patch: Started
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_unpack: Succeeded
NOTE: recipe automake-native-1.16.5-r0: task do_patch: Succeeded
NOTE: recipe ncurses-native-6.4-r0: task do_fetch: Started
NOTE: recipe gdbm-native-1.23-r0: task do_fetch: Started
NOTE: recipe popt-native-1.19-r0: task do_patch: Succeeded
NOTE: recipe autoconf-native-2.72c-r0: task do_patch: Started
NOTE: Running task 165 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_patch)
NOTE: Running task 167 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_fetch)
NOTE: Running task 170 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe gdbm-native-1.23-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Succeeded
NOTE: recipe gperf-native-3.1-r0: task do_unpack: Started
NOTE: Running task 171 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: Running task 172 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_unpack)
NOTE: recipe libmpc-native-1.3.1-r0: task do_patch: Started
NOTE: recipe make-native-4.4.1-r0: task do_fetch: Started
NOTE: recipe make-native-4.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 174 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_fetch)
NOTE: recipe ncurses-native-6.4-r0: task do_fetch: Succeeded
NOTE: recipe libmpc-native-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 175 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: recipe gperf-native-3.1-r0: task do_unpack: Succeeded
NOTE: Running noexec task 178 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: Running task 180 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: Running task 181 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_patch)
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_patch: Started
NOTE: recipe perl-native-5.38.0-r0: task do_fetch: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_fetch: Started
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Started
NOTE: recipe gdbm-native-1.23-r0: task do_unpack: Started
NOTE: recipe patch-native-2.7.6-r0: task do_patch: Succeeded
NOTE: recipe rsync-native-3.2.7-r0: task do_patch: Succeeded
NOTE: recipe perl-native-5.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 184 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: Running task 188 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: Running task 189 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_unpack)
NOTE: recipe acl-native-2.3.1-r0: task do_patch: Succeeded
NOTE: Running task 192 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/re2c/re2c_3.1.bb:do_fetch)
NOTE: recipe libtirpc-native-1.3.3-r0: task do_fetch: Started
NOTE: recipe ncurses-native-6.4-r0: task do_unpack: Started
NOTE: recipe openssl-native-3.1.4-r0: task do_fetch: Started
NOTE: recipe gperf-native-3.1-r0: task do_patch: Started
NOTE: recipe gdbm-native-1.23-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-native-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-native-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 193 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: Running task 195 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 196 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: Running task 198 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_fetch)
NOTE: recipe openssl-native-3.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 199 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_unpack)
NOTE: recipe re2c-native-3.1-r0: task do_fetch: Started
NOTE: recipe expat-native-2.5.0-r0: task do_fetch: Started
NOTE: recipe perl-native-5.38.0-r0: task do_unpack: Started
NOTE: recipe re2c-native-3.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 201 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_fetch)
NOTE: Running task 203 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_fetch)
NOTE: recipe ninja-native-1.11.1-r0: task do_fetch: Started
NOTE: recipe libtirpc-native-1.3.3-r0: task do_unpack: Started
NOTE: recipe gperf-native-3.1-r0: task do_patch: Succeeded
NOTE: Running task 206 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: recipe gdbm-native-1.23-r0: task do_patch: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_unpack: Started
NOTE: recipe make-native-4.4.1-r0: task do_unpack: Started
NOTE: recipe libtool-native-2.4.7-r0: task do_patch: Succeeded
NOTE: recipe openssl-native-3.1.4-r0: task do_unpack: Started
NOTE: Running task 210 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_fetch)
NOTE: recipe cmake-native-3.27.5-r0: task do_fetch: Started
NOTE: recipe ninja-native-1.11.1-r0: task do_fetch: Succeeded
NOTE: recipe cmake-native-3.27.5-r0: task do_fetch: Succeeded
NOTE: Running task 211 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 212 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: recipe make-native-4.4.1-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-native-1.23-r0: task do_patch: Succeeded
NOTE: Running task 213 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: Running task 216 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_fetch)
NOTE: recipe libtirpc-native-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_fetch: Started
NOTE: Running task 217 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_patch)
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_fetch: Succeeded
NOTE: recipe libffi-native-3.4.4-r0: task do_fetch: Started
NOTE: Running task 224 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_unpack)
NOTE: recipe libedit-native-20230828-3.1-r0: task do_fetch: Started
NOTE: recipe libffi-native-3.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 225 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_unpack)
NOTE: recipe libedit-native-20230828-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 227 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_fetch)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_patch: Succeeded
NOTE: Running noexec task 230 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: Running task 231 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: recipe expat-native-2.5.0-r0: task do_unpack: Started
NOTE: recipe make-native-4.4.1-r0: task do_patch: Started
NOTE: recipe cmake-native-3.27.5-r0: task do_unpack: Started
NOTE: recipe libtirpc-native-1.3.3-r0: task do_patch: Started
NOTE: recipe ninja-native-1.11.1-r0: task do_unpack: Started
NOTE: recipe zlib-1.3-r0: task do_fetch: Started
NOTE: recipe libnsl2-native-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 232 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_unpack)
NOTE: recipe zlib-1.3-r0: task do_fetch: Succeeded
NOTE: Running task 233 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe python3-native-3.11.5-r0: task do_fetch: Started
NOTE: recipe expat-native-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe make-native-4.4.1-r0: task do_patch: Succeeded
NOTE: Running task 234 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: recipe libffi-native-3.4.4-r0: task do_unpack: Started
NOTE: Running task 237 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe libtirpc-native-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe python3-native-3.11.5-r0: task do_fetch: Succeeded
NOTE: Running task 239 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_unpack)
NOTE: Running task 242 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.3.bb:do_recipe_qa)
NOTE: recipe ncurses-native-6.4-r0: task do_unpack: Succeeded
NOTE: recipe libffi-native-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libedit-native-20230828-3.1-r0: task do_unpack: Started
NOTE: Running task 243 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: Running task 244 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe zlib-1.3-r0: task do_unpack: Started
NOTE: recipe libnsl2-native-2.0.1-r0: task do_unpack: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 245 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libedit-native-20230828-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 246 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.5.0-r0: task do_patch: Started
NOTE: Running task 247 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe gettext-native-0.22.3-r0: task do_recipe_qa: Started
NOTE: recipe zlib-1.3-r0: task do_unpack: Succeeded
NOTE: recipe expat-native-2.5.0-r0: task do_patch: Succeeded
NOTE: Running task 251 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_fetch)
NOTE: Running task 252 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe openssl-native-3.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 253 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_patch)
NOTE: recipe ncurses-native-6.4-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe libffi-native-3.4.4-r0: task do_patch: Started
NOTE: recipe libedit-native-20230828-3.1-r0: task do_patch: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_patch: Started
NOTE: recipe gettext-native-0.22.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe bzip2-native-1.0.8-r0: task do_patch: Succeeded
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.3.bb:do_recipe_qa unihash changed to 852fc92ca2fddea049dccf6d25b41f5b4566e542e40a81568c0bafda545b1f16
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_fetch: Started
NOTE: recipe expat-native-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe ninja-native-1.11.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_fetch: Succeeded
NOTE: recipe libedit-native-20230828-3.1-r0: task do_patch: Succeeded
NOTE: recipe openssl-native-3.1.4-r0: task do_patch: Started
NOTE: recipe expat-native-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe perl-native-5.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe libffi-native-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-native-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-native-6.4-r0: task do_patch: Succeeded
NOTE: recipe openssl-native-3.1.4-r0: task do_patch: Succeeded
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Checksum failure encountered with download of https://ftp.gnu.org/gnu/gettext/gettext-0.22.tar.gz - will attempt other sources if available
NOTE: recipe cmake-native-3.27.5-r0: task do_unpack: Succeeded
NOTE: recipe autoconf-native-2.72c-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 255 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_patch)
NOTE: Running task 259 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_patch)
NOTE: Running task 260 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_patch)
NOTE: Running task 261 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: Running task 265 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.3.bb:do_fetch)
NOTE: Running task 269 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_fetch)
NOTE: Running task 271 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_fetch)
NOTE: Running task 273 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_unpack)
NOTE: Running task 276 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 278 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_fetch)
NOTE: Running task 280 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_fetch)
NOTE: Running task 283 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_fetch)
NOTE: Running task 284 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_fetch)
NOTE: Running task 286 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_fetch)
NOTE: Running task 288 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: recipe cmake-native-3.27.5-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe ninja-native-1.11.1-r0: task do_patch: Started
NOTE: recipe libnsl2-native-2.0.1-r0: task do_patch: Started
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_unpack: Started
NOTE: recipe libunistring-native-1.1-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe libcap-native-2.69-r0: task do_fetch: Started
NOTE: recipe perl-native-5.38.0-r0: task do_patch: Started
NOTE: recipe gettext-native-0.22.3-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 290 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_fetch)
NOTE: recipe curl-native-8.4.0-r0: task do_fetch: Started
NOTE: recipe libgcrypt-native-1.10.2-r0: task do_fetch: Started
NOTE: recipe libunistring-native-1.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-native-1.47-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 291 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: recipe ninja-native-1.11.1-r0: task do_patch: Succeeded
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_fetch: Succeeded
NOTE: recipe libcap-native-2.69-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-native-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 293 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_unpack)
NOTE: Running task 301 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 303 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 305 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: recipe gettext-native-0.22.3-r0: task do_fetch: Succeeded
NOTE: recipe curl-native-8.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 308 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.3.bb:do_unpack)
NOTE: recipe libgcrypt-native-1.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 309 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_patch)
NOTE: Running task 310 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_unpack)
NOTE: Running task 311 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_fetch)
NOTE: Running task 313 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_fetch)
NOTE: recipe libgpg-error-native-1.47-r0: task do_fetch: Succeeded
NOTE: Running task 315 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_fetch)
NOTE: Running task 317 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: recipe cmake-native-3.27.5-r0: task do_patch: Succeeded
NOTE: Running task 320 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Started
NOTE: recipe libunistring-native-1.1-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_patch: Started
NOTE: recipe gettext-native-0.22.3-r0: task do_unpack: Started
NOTE: recipe libpcre2-native-10.42-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: Running task 321 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: recipe libxml2-native-2.11.5-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-native-10.42-r0: task do_fetch: Succeeded
NOTE: Running task 323 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: Running task 325 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_fetch)
NOTE: Running task 326 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_patch)
NOTE: Running task 327 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-native-2.11.5-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 328 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_unpack)
NOTE: Running task 333 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 334 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_fetch)
NOTE: Running task 335 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: recipe openssl-3.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 338 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_fetch)
NOTE: recipe cracklib-native-2.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 339 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Started
NOTE: recipe libunistring-native-1.1-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-native-1.47-r0: task do_unpack: Started
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-native-1.10.2-r0: task do_unpack: Started
NOTE: Running task 340 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: Running task 343 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_fetch)
NOTE: recipe libidn2-native-2.3.4-r0: task do_fetch: Started
NOTE: recipe nettle-native-3.9.1-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe nettle-native-3.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 344 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_fetch)
NOTE: recipe util-linux-native-2.39.2-r0: task do_fetch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Started
NOTE: Running task 346 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_fetch)
NOTE: recipe gnutls-native-3.8.1-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 347 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_unpack)
NOTE: Running task 348 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_fetch: Started
NOTE: recipe gnutls-native-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.39.2-r0: task do_fetch: Succeeded
NOTE: Running task 350 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_fetch)
NOTE: Running task 351 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 352 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_fetch: Started
NOTE: recipe libunistring-native-1.1-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_fetch: Succeeded
NOTE: Running task 353 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_unpack)
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_fetch: Succeeded
NOTE: Running task 354 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Succeeded
NOTE: recipe perl-native-5.38.0-r0: task do_patch: Succeeded
NOTE: recipe libarchive-native-3.7.2-r0: task do_fetch: Started
NOTE: recipe libunistring-native-1.1-r0: task do_patch: Succeeded
NOTE: Running task 355 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 357 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_unpack)
NOTE: Running task 358 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe elfutils-native-0.189-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Started
NOTE: recipe libgpg-error-native-1.47-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-native-3.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 359 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_patch)
NOTE: Running task 360 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_unpack)
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.189-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-native-2.9.11-r0: task do_unpack: Started
NOTE: Running task 361 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 363 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe libpcre2-native-10.42-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.4-r0: task do_unpack: Started
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: Running task 364 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_unpack)
NOTE: recipe nettle-native-3.9.1-r0: task do_unpack: Started
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 365 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_patch)
NOTE: recipe libidn2-native-2.3.4-r0: task do_unpack: Started
NOTE: recipe libgpg-error-native-1.47-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 366 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe nettle-native-3.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 367 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_patch)
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_unpack: Started
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_patch: Started
NOTE: recipe libidn2-native-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 368 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe libgpg-error-native-1.47-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_patch: Succeeded
NOTE: Running task 369 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_unpack)
NOTE: Running task 370 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_unpack)
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_unpack: Succeeded
NOTE: Running task 371 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_patch)
NOTE: recipe libgcrypt-native-1.10.2-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Started
NOTE: Running task 372 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_patch)
NOTE: recipe libpcre2-native-10.42-r0: task do_unpack: Succeeded
NOTE: recipe nettle-native-3.9.1-r0: task do_patch: Started
NOTE: Running task 373 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 375 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_unpack)
NOTE: recipe libidn2-native-2.3.4-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 377 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_fetch)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe elfutils-native-0.189-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Succeeded
NOTE: Running task 380 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: recipe libidn2-native-2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 381 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_fetch)
NOTE: Running task 383 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_patch: Started
NOTE: recipe libgcrypt-native-1.10.2-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-native-0.9.77-r0: task do_patch: Succeeded
NOTE: Running task 386 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: recipe libpcre2-native-10.42-r0: task do_patch: Started
NOTE: recipe nettle-native-3.9.1-r0: task do_patch: Succeeded
NOTE: Running task 388 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-native-10.42-r0: task do_patch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe readline-native-8.2-r0: task do_fetch: Started
NOTE: Running task 390 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_fetch)
NOTE: Running task 392 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_fetch)
NOTE: Running task 393 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_patch)
NOTE: recipe file-native-5.45-r0: task do_fetch: Started
NOTE: recipe readline-native-8.2-r0: task do_fetch: Succeeded
NOTE: recipe lua-native-5.4.6-r0: task do_fetch: Started
NOTE: Running task 396 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_unpack)
NOTE: recipe rpm-native-1_4.18.1-r0: task do_fetch: Started
NOTE: recipe lua-native-5.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 397 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_unpack)
NOTE: recipe libarchive-native-3.7.2-r0: task do_unpack: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: Running task 398 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_patch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 403 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: recipe file-native-5.45-r0: task do_fetch: Succeeded
NOTE: Running task 404 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: recipe rpm-native-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-build-native-1.0.3-r0: task do_fetch: Started
NOTE: Running task 405 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: recipe python3-packaging-native-23.2-r0: task do_fetch: Started
NOTE: recipe python3-build-native-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-native-23.2-r0: task do_fetch: Succeeded
NOTE: Running task 407 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: Running task 408 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: recipe gettext-native-0.22.3-r0: task do_unpack: Succeeded
NOTE: Running task 410 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_fetch)
NOTE: Running task 411 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.3.bb:do_patch)
NOTE: recipe readline-native-8.2-r0: task do_unpack: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 412 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_patch)
NOTE: Running task 413 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_unpack)
NOTE: recipe lua-native-5.4.6-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_patch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-native-1.10.2-r0: task do_patch: Succeeded
NOTE: Running task 414 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: recipe file-native-5.45-r0: task do_unpack: Started
NOTE: recipe lua-native-5.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 416 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_unpack)
NOTE: Running task 417 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe readline-native-8.2-r0: task do_unpack: Succeeded
NOTE: recipe rpm-native-1_4.18.1-r0: task do_unpack: Started
NOTE: Running task 418 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 421 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.41.3.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_fetch: Succeeded
NOTE: Running task 422 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: recipe gettext-native-0.22.3-r0: task do_patch: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_unpack: Succeeded
NOTE: Running task 425 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: recipe python3-build-native-1.0.3-r0: task do_unpack: Started
NOTE: Running task 426 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: recipe cracklib-native-2.9.11-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 427 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.0.3.bb:do_patch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe python3-packaging-native-23.2-r0: task do_unpack: Started
NOTE: recipe lua-native-5.4.6-r0: task do_patch: Started
NOTE: recipe python3-packaging-native-23.2-r0: task do_unpack: Succeeded
NOTE: Running task 428 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_patch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-wheel-native-0.41.3-r0: task do_fetch: Started
NOTE: Running task 431 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: recipe readline-native-8.2-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe cracklib-native-2.9.11-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: Running task 434 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: recipe python3-wheel-native-0.41.3-r0: task do_fetch: Succeeded
NOTE: recipe lua-native-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 437 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_fetch)
NOTE: Running task 441 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: Running task 442 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.0.3-r0: task do_patch: Started
NOTE: recipe readline-native-8.2-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: Running task 444 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Started
NOTE: recipe python3-packaging-native-23.2-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-build-native-1.0.3-r0: task do_patch: Succeeded
NOTE: Running task 446 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_fetch)
NOTE: recipe xz-5.4.4-r0: task do_fetch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 448 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_fetch)
NOTE: Running task 449 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.41.3.bb:do_unpack)
NOTE: Running task 451 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_fetch)
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-native-23.2-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 454 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: Running task 455 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_unpack)
NOTE: Running task 456 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_fetch: Started
NOTE: Running task 457 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe gettext-native-0.22.3-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_fetch: Succeeded
NOTE: Running task 458 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 459 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_unpack)
NOTE: recipe util-linux-2.39.2-r0: task do_fetch: Started
NOTE: recipe python3-wheel-native-0.41.3-r0: task do_unpack: Started
NOTE: recipe xz-5.4.4-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-68.2.2-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: recipe util-linux-2.39.2-r0: task do_fetch: Succeeded
NOTE: Running task 460 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_unpack)
NOTE: recipe python3-wheel-native-0.41.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-68.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 461 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.41.3.bb:do_patch)
NOTE: Running task 462 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_unpack)
NOTE: Running task 464 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.2.2.bb:do_fetch)
NOTE: recipe file-native-5.45-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: Running task 465 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.189-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 466 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_patch)
NOTE: Running task 468 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 472 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_fetch)
NOTE: Running task 474 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_patch: Succeeded
NOTE: Running task 477 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_fetch)
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Succeeded
NOTE: recipe gettext-native-0.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.43.2-r0: task do_unpack: Started
NOTE: Running task 480 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_fetch)
NOTE: Running task 481 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_fetch)
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.tar.gz
Cleaning and trying again.
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.tar.gz_bad-checksum_49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab
NOTE: recipe python3-wheel-native-0.41.3-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-68.2.2-r0: task do_unpack: Started
NOTE: recipe meson-native-1.2.2-r0: task do_fetch: Started
NOTE: recipe file-native-5.45-r0: task do_patch: Started
NOTE: recipe qemu-native-8.1.2-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: recipe meson-native-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: Running task 482 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: Running task 483 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.2.2.bb:do_unpack)
NOTE: recipe python3-wheel-native-0.41.3-r0: task do_patch: Succeeded
NOTE: Running task 487 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_write_config)
NOTE: recipe sqlite3-3_3.43.2-r0: task do_unpack: Succeeded
NOTE: Running task 488 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_write_config)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Started
NOTE: Running task 489 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: recipe qemu-native-8.1.2-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-native-0.189-r0: task do_patch: Started
NOTE: Running task 495 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Succeeded
NOTE: Running task 496 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_fetch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Succeeded
NOTE: Running task 498 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_fetch)
NOTE: recipe file-native-5.45-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-native-68.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 500 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.3.bb:do_recipe_qa)
NOTE: Running task 501 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_fetch: Succeeded
NOTE: Running task 504 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_fetch: Succeeded
NOTE: Running task 505 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_fetch)
NOTE: recipe gettext-native-0.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.3.bb:do_deploy_source_date_epoch unihash changed to 1245767cc8f758385241560266a5f5984d553731b0afc15ef9d786460c41d803
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.18.1-r0: task do_patch: Started
NOTE: recipe meson-native-1.2.2-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_write_config: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_write_config: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe gettext-0.22.3-r0: task do_recipe_qa: Started
NOTE: recipe readline-8.2-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_write_config: Succeeded
NOTE: recipe python3-setuptools-native-68.2.2-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_write_config: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: recipe gettext-0.22.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-setuptools-native-68.2.2-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.3.bb:do_recipe_qa unihash changed to b85e23db0e6c8fa6d92ca29b818a1a7003c2bc1069f2438fc93cd28907eeb27b
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Succeeded
NOTE: recipe meson-native-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-native-0.189-r0: task do_patch: Succeeded
NOTE: recipe rpm-native-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 509 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.2.2.bb:do_patch)
NOTE: Running task 510 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: Running task 511 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.3.bb:do_fetch)
NOTE: Running task 513 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_fetch)
NOTE: Running task 514 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_unpack)
NOTE: Running task 517 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: Running task 518 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_unpack)
NOTE: Running task 520 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_fetch)
NOTE: Running task 524 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_fetch)
NOTE: Running task 528 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_fetch)
NOTE: Running task 529 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 533 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4_1.4.19.bb:do_fetch)
NOTE: Running task 534 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: Running task 535 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_fetch)
NOTE: Running task 537 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_fetch)
NOTE: recipe base-passwd-3.6.2-r0: task do_fetch: Started
NOTE: recipe libcap-2.69-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_unpack: Started
NOTE: recipe gettext-0.22.3-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_fetch: Started
NOTE: recipe perl-5.38.0-r0: task do_fetch: Started
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe m4-1.4.19-r0: task do_fetch: Started
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe libcap-2.69-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.2-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_fetch: Started
NOTE: recipe meson-native-1.2.2-r0: task do_patch: Started
NOTE: Running task 539 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_fetch)
NOTE: recipe gettext-0.22.3-r0: task do_fetch: Succeeded
NOTE: Running task 542 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: Running task 543 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: Running task 544 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.3.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe m4-1.4.19-r0: task do_fetch: Succeeded
NOTE: Running task 545 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe perl-5.38.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_fetch: Succeeded
NOTE: Running task 548 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 549 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_unpack)
NOTE: Running task 550 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_unpack)
NOTE: recipe coreutils-9.4-r0: task do_fetch: Succeeded
NOTE: recipe shadow-native-4.13-r0: task do_fetch: Started
NOTE: Running task 551 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.38.bb:do_fetch)
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 552 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4_1.4.19.bb:do_unpack)
NOTE: recipe shadow-native-4.13-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 553 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_unpack)
NOTE: Running task 555 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_fetch: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: Running task 557 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/help2man/help2man_1.49.3.bb:do_fetch)
NOTE: recipe gettext-0.22.3-r0: task do_unpack: Started
NOTE: recipe opkg-utils-native-0.6.2-r0: task do_fetch: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_unpack: Started
NOTE: Running task 558 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe shadow-4.13-r0: task do_unpack: Started
NOTE: recipe m4-1.4.19-r0: task do_unpack: Started
NOTE: recipe autoconf-2.72c-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_fetch: Succeeded
NOTE: Running task 559 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: recipe opkg-utils-native-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe shadow-native-4.13-r0: task do_unpack: Started
NOTE: recipe meson-native-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 560 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_unpack)
NOTE: Running task 562 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 564 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmd/libmd_1.1.0.bb:do_fetch)
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_fetch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe autoconf-2.72c-r0: task do_fetch: Succeeded
NOTE: Running task 565 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.38.bb:do_unpack)
NOTE: Running task 566 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_unpack)
NOTE: recipe help2man-native-1.49.3-r0: task do_fetch: Started
NOTE: recipe help2man-native-1.49.3-r0: task do_fetch: Succeeded
NOTE: Running task 568 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: Running task 572 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_fetch)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_unpack: Started
NOTE: recipe m4-1.4.19-r0: task do_unpack: Succeeded
NOTE: Running task 573 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_fetch)
NOTE: recipe opkg-utils-native-0.6.2-r0: task do_unpack: Started
NOTE: recipe autoconf-2.72c-r0: task do_unpack: Started
NOTE: recipe libmd-native-1.1.0-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_unpack: Succeeded
NOTE: recipe libmd-native-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe gnu-config-20230216+git-r0: task do_fetch: Started
NOTE: recipe dpkg-native-1.22.0-r0: task do_fetch: Started
NOTE: recipe psmisc-23.6-r0: task do_fetch: Started
NOTE: recipe shadow-native-4.13-r0: task do_unpack: Succeeded
NOTE: Running task 574 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_patch)
NOTE: recipe gnu-config-20230216+git-r0: task do_fetch: Succeeded
NOTE: Running task 575 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_unpack)
NOTE: recipe psmisc-23.6-r0: task do_fetch: Succeeded
NOTE: recipe dpkg-native-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 576 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_unpack)
NOTE: Running task 577 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb:do_unpack)
NOTE: recipe gnu-config-20230216+git-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.13-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_unpack: Started
NOTE: recipe autoconf-2.72c-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_unpack: Succeeded
NOTE: recipe dpkg-native-1.22.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-native-0.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 578 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_patch)
NOTE: recipe opkg-utils-native-0.6.2-r0: task do_patch: Started
NOTE: recipe perl-5.38.0-r0: task do_unpack: Succeeded
NOTE: recipe shadow-native-4.13-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-native-0.6.2-r0: task do_patch: Succeeded
NOTE: recipe gnu-config-20230216+git-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_unpack: Succeeded
NOTE: recipe gettext-0.22.3-r0: task do_unpack: Succeeded
NOTE: recipe dpkg-native-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 581 of 1799 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb:do_patch)
NOTE: recipe dpkg-native-1.22.0-r0: task do_patch: Started
NOTE: recipe dpkg-native-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_unpack: Succeeded
NOTE: Running task 583 of 1799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.38.bb:do_patch)
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_patch: Started
NOTE: recipe gettext-minimal-native-0.22-r0: task do_fetch: Failed
NOTE: recipe cross-localedef-native-2.38+git-r0: task do_patch: Succeeded
NOTE: Tasks Summary: Attempted 583 tasks of which 286 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115052409.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115052409.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gettext-minimal-native-0.22-r0 do_fetch: Checksum failure fetching https://ftp.gnu.org/gnu/gettext/gettext-0.22.tar.gz
ERROR: gettext-minimal-native-0.22-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/gettext-0.22.tar.gz\' has sha256 checksum \'49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab\' when \'839a260b2314ba66274dae7d245ec19fce190a3aa67869bf31354cb558df42c7\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://ftp.gnu.org/gnu/gettext/gettext-0.22.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gettext-minimal-native/0.22/temp/log.do_fetch.3497795
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_fetch) failed with exit code '1'

--===============1093689799838310747==--

