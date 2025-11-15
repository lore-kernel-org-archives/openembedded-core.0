Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00325CED60E
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:05 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12116.1763224715612138635
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aBr9ApWF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=pG4CDwoa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019a88625284-e21f4866-9820-4eec-9357-483ffb2d82a0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224737;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QW9K+Vr3/C89mW5iNpF6kvHUY4T4zgL1LuhMxUofQJo=;
	b=aBr9ApWFEbMVXhtdzkchz97I4OHCAJRuWW4xu8FY3VcQVgpDOUA/xD5WXb271tb2
	DMR2uOnLRQjwbyZEyfwzorOt21zuB7h07P9ggOfVE5Hb/iFp10uIH9tUGwZIDjzp6cV
	a43xWhGCpNS7EVAUdUIhZAn0/dokeaXqlWa1d284=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224737;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QW9K+Vr3/C89mW5iNpF6kvHUY4T4zgL1LuhMxUofQJo=;
	b=pG4CDwoavbOXlN5Mj5hnF9Sx2N7uzLnkjonDou/7QK3qDMWUAtFXSDVsYiNtGmFI
	fO/dmLVQkD6gPT57jej3/B1U1OKfm5BV7D+MTy1EC436HFlzlejTsejbRE8/JC6kz06
	s7+iUBdfqqEjzzC1SBwKNLbeJoxrf/9Z88pgLh30=
Content-Type: multipart/mixed; boundary="===============7763905442492882758=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 8.3.0 SUCCEEDED
Message-ID: <0101019a88625284-e21f4866-9820-4eec-9357-483ffb2d82a0-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226383

--===============7763905442492882758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinx* to *8.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-8.2.1-8.3.0.patch
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
From 16774a08af41248f75eb5d173049a673cff04452 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 11:25:26 +0000
Subject: [PATCH] python3-sphinx: upgrade 8.2.1 -> 8.3.0

---
 .../python/{python3-sphinx_8.2.1.bb => python3-sphinx_8.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_8.2.1.bb => python3-sphinx_8.3.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb b/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
rename to meta/recipes-devtools/python/python3-sphinx_8.3.0.bb
index 614566b8f4..25bbc1bff8 100644
--- a/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=e30c37a2b7fb0afa3adc0d72b85e8b04"
 
-SRC_URI[sha256sum] = "e4b932951b9c18b039f73b72e4e63afe967d90408700ec222b981ac24647c01e"
+SRC_URI[sha256sum] = "3bad4314a7fa72ce92344eaaa14c42ddf3177ee6a79c227e4ff8ae07d416f584"
 
 inherit python_flit_core pypi
 
-- 
2.47.1


--===============7763905442492882758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-8.2.1.tar.gz;downloadfilename=sphinx-8.2.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-8.3.0.tar.gz;downloadfilename=sphinx-8.3.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-sphinx: PV changed from "8.2.1" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-sphinx: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "8.2.1" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "8.2.1" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "8.2.1" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "8.2.1" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "8.2.1" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "8.2.1" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 16966169 to 16967764 (+0%)
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PV changed from "8.2.1" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 8.2.1 [default] to 8.3.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.13/site-packages/sphinx-8.2.1.dist-info moved to /usr/lib/python3.13/site-packages/sphinx-8.3.0.dist-info

--===============7763905442492882758==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-8.2.1-8.3.0.patch"

RnJvbSAxNjc3NGEwOGFmNDEyNDhmNzVlYjVkMTczMDQ5YTY3M2NmZjA0NDUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTE6MjU6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueDogdXBncmFkZSA4LjIuMSAtPiA4LjMuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXNwaGlueF84LjIuMS5iYiA9PiBweXRob24zLXNwaGlueF84LjMuMC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNwaGlueF84LjIuMS5iYiA9PiBw
eXRob24zLXNwaGlueF84LjMuMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzguMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF84LjMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkx
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54
XzguMi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c3BoaW54XzguMy4wLmJiCmluZGV4IDYxNDU2NmI4ZjQuLjI1YmJjMWJmZjggMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfOC4yLjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF84LjMuMC5iYgpA
QCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIkJTRC0y
LUNsYXVzZSAmIE1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UucnN0O21k
NT1lMzBjMzdhMmI3ZmIwYWZhM2FkYzBkNzJiODVlOGIwNCIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImU0YjkzMjk1MWI5YzE4YjAzOWY3M2I3MmU0ZTYzYWZlOTY3ZDkwNDA4NzAwZWMyMjJiOTgx
YWMyNDY0N2MwMWUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2JhZDQzMTRhN2ZhNzJjZTkyMzQ0
ZWFhYTE0YzQyZGRmMzE3N2VlNmE3OWMyMjdlNGZmOGFlMDdkNDE2ZjU4NCIKIAogaW5oZXJpdCBw
eXRob25fZmxpdF9jb3JlIHB5cGkKIAotLSAKMi40Ny4xCgo=

--===============7763905442492882758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 947 .bb files complete (0 cached, 947 parsed). 1945 targets, 54 skipped, 0 masked, 0 errors.
Removing 80 recipes from the qemux86_64 sysroot...done.
Removing 41 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-38fbc1a81d045b7de6b6c831256f637c91d81b6f"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:38fbc1a81d045b7de6b6c831256f637c91d81b6f"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 616 Local 604 Mirrors 0 Missed 12 Current 263 (98% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 264 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 265 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 269 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 272 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 273 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 276 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 277 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 279 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 280 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 288 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 291 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 293 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_qa_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 294 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 295 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 298 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 299 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 301 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 302 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 304 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 306 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_qa_setscene)
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 308 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 311 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 312 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 313 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 314 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 319 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 321 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_qa_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 323 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 324 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 325 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 336 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 337 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 342 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 343 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 344 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 345 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 347 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_qa_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 349 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 353 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_qa_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 355 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 356 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 361 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 363 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_write_deb_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 365 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 366 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 367 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 369 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 371 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 373 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 375 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 376 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-babel-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 379 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 380 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_qa_setscene)
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 382 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-docutils-0.22-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-docutils-0.22-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-docutils-0.22-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 383 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 385 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_package_qa_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 386 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 387 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 388 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_create_spdx_setscene)
NOTE: Running setscene task 390 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 396 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe python3-babel-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 398 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-docutils-0.22-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-docutils-0.22-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 400 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_qa_setscene)
NOTE: Running setscene task 401 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_qa_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 402 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-docutils-0.22-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-docutils-0.22-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 404 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 405 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 406 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 407 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-docutils-0.22-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 408 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-docutils-0.22-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 409 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 410 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 413 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 414 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: recipe python3-docutils-0.22-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 415 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 418 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 419 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 421 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 422 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 424 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2025.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 425 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 426 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 427 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_spdx_setscene)
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-urllib3-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 428 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 429 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 430 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-certifi/2025.8.3/temp/log.do_packagedata_setscene.2818804
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 438 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-urllib3-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 443 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 444 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.32.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 450 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 454 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_packagedata_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 456 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 467 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-docutils-0.22-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 468 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 469 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 471 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 473 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-markupsafe/3.0.2/temp/log.do_packagedata_setscene.2819293
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 474 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 475 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-docutils/0.22/temp/log.do_packagedata_setscene.2819405
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 477 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 501 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_package_setscene)
NOTE: Running setscene task 516 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_package_setscene)
NOTE: Running setscene task 527 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 537 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 544 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 550 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 551 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 554 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 557 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 570 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 576 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 589 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 596 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 597 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 598 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 609 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 611 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 619 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 620 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 621 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 623 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 626 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 633 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 641 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2025.8.3-r0: task do_package_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 644 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_package_setscene: Started
NOTE: recipe python3-docutils-0.22-r0: task do_package_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 683 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 703 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_package_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 709 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 711 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-certifi-2025.8.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 713 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-certifi-2025.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-docutils-0.22-r0: task do_package_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-certifi-2025.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 740 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_recipe_qa_setscene)
NOTE: Running task 1017 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1056 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-docutils-0.22-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_fetch: Started
NOTE: Running task 1211 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1222 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.22-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1251 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 763 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1401 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1408 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running setscene task 773 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running task 1409 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_patch)
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 786 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_patch: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 787 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 793 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 796 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 799 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running task 1421 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running setscene task 814 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1424 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 820 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 822 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 824 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 825 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 829 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 835 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 839 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1486 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 844 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 849 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 851 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 852 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 853 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 855 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 856 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 861 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 862 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 864 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 869 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 871 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1520 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 873 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 877 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 878 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1968 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2071 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.bb:do_packagedata)
NOTE: Running task 2215 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_packagedata)
NOTE: Running task 2221 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_packagedata)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2230 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-docutils-0.22-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2025.8.3-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-docutils-0.22-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2025.8.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2347 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_configure)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_configure: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2348 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_compile)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_compile: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2349 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_install)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_install: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_install: Succeeded
NOTE: Running task 2350 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package)
NOTE: Running task 2351 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_populate_sysroot)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package: Succeeded
NOTE: Running task 2352 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_packagedata)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_packagedata unihash changed to 1f24d8088033452bd9bfccba6cf04c39f4c6b64b95ebee93b48d5375637ee8b3
NOTE: Setscene tasks completed
NOTE: Running task 2353 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_create_spdx)
NOTE: Running task 2354 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_write_ipk)
NOTE: Running task 2355 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_write_deb)
NOTE: Running task 2356 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_write_rpm)
NOTE: Running task 2357 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_qa)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_qa: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2358 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_create_package_spdx)
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_write_ipk unihash changed to 48c80f3212551daeeedc9a4ec912c9a4ab5b0faf6de7134d2a9409d79917ba4b
NOTE: recipe python3-sphinx-8.3.0-r0: task do_create_package_spdx: Started
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_qa unihash changed to dfd6a660ae3954cb024b20ab10cc18ad5bc9677455db59c848eee44e4cab5ad9
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_write_rpm unihash changed to fc872147c682b5777b9e68b38bf514a863810d03b9ccaa7fd7a226af9a2bec56
NOTE: recipe python3-sphinx-8.3.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-sphinx-8.3.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_package_write_deb unihash changed to 453724ff7cbe853a74b1be6388d929933ea03842fc02f3876e745634ec0783be
NOTE: Running noexec task 2359 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_8.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2359 tasks of which 2329 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 25 ERROR messages, returning a non-zero exit code.
ERROR: python3-certifi-2025.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2025.11.12-r0 to 0:2025.8.3-r0) [version-going-backwards]
ERROR: python3-certifi-2025.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2025.11.12-r0 to 0:2025.8.3-r0) [version-going-backwards]
ERROR: python3-certifi-2025.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2025.11.12-r0 to 0:2025.8.3-r0) [version-going-backwards]
ERROR: python3-certifi-2025.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2025.11.12-r0 to 0:2025.8.3-r0) [version-going-backwards]
ERROR: python3-certifi-2025.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2025.11.12-r0 to 0:2025.8.3-r0) [version-going-backwards]
ERROR: python3-certifi-2025.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2025.11.12-r0 to 0:2025.8.3-r0) [version-going-backwards]
ERROR: python3-certifi-2025.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2025.11.12-r0 to 0:2025.8.3-r0) [version-going-backwards]
ERROR: python3-certifi-2025.8.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-markupsafe-3.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-markupsafe-src went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-3.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-markupsafe-dbg went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-3.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-markupsafe-ptest went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-3.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-markupsafe-staticdev went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-3.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-markupsafe-dev went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: python3-docutils-0.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-docutils-src went backwards which would break package feeds (from 0:0.22.3-r0 to 0:0.22-r0) [version-going-backwards]
ERROR: python3-markupsafe-3.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-markupsafe-doc went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: python3-docutils-0.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-docutils-dbg went backwards which would break package feeds (from 0:0.22.3-r0 to 0:0.22-r0) [version-going-backwards]
ERROR: python3-markupsafe-3.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-markupsafe-locale went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: python3-docutils-0.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-docutils-staticdev went backwards which would break package feeds (from 0:0.22.3-r0 to 0:0.22-r0) [version-going-backwards]
ERROR: python3-markupsafe-3.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-markupsafe went backwards which would break package feeds (from 0:3.0.3-r0 to 0:3.0.2-r0) [version-going-backwards]
ERROR: python3-docutils-0.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-docutils-dev went backwards which would break package feeds (from 0:0.22.3-r0 to 0:0.22-r0) [version-going-backwards]
ERROR: python3-markupsafe-3.0.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-docutils-0.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-docutils-doc went backwards which would break package feeds (from 0:0.22.3-r0 to 0:0.22-r0) [version-going-backwards]
ERROR: python3-docutils-0.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-docutils-locale went backwards which would break package feeds (from 0:0.22.3-r0 to 0:0.22-r0) [version-going-backwards]
ERROR: python3-docutils-0.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-docutils went backwards which would break package feeds (from 0:0.22.3-r0 to 0:0.22-r0) [version-going-backwards]
ERROR: python3-docutils-0.22-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7763905442492882758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.13/site-packages/sphinx-8.2.1.dist-info moved to /usr/lib/python3.13/site-packages/sphinx-8.3.0.dist-info

--===============7763905442492882758==--

