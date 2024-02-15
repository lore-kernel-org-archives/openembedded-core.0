Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC92C54EC9
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:37 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.20166.1708018345567949155
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=f6xXq6LK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=D7Gn7BT9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018dadd3a412-851973fb-9c0a-4b4a-afbd-23e300648670-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+bgZCxdnWSFqAK2S7i0e2w0/+nPlevjBmCS716kGNI8=;
	b=f6xXq6LKPME7jAqKnxn9AXv+elbfFtQXMwceXqhxSzDbdNEx69nxw6qfj/ZkkcPF
	qyZOpIZNZu2VDr/uyYcmglmwqeTSRBeZ1s3e+Ppk6Khj/5y5lNnr/x+UWdz/k3X5H9N
	pKuTWZZ/nCQdhfV7H4+WrTk/4X4V9/PsSbzWg1fE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+bgZCxdnWSFqAK2S7i0e2w0/+nPlevjBmCS716kGNI8=;
	b=D7Gn7BT9Er4EKhkk1CrsDkBuIbsVyH5///tymm8MVLprFa6eNAyrlGxnH4i7WVc1
	GgZdGyu/R0uj4Uno1iO6U/ZtKj3Dnti8T6JM/HHMHte/5paWZ18RnvBzSxMWn0IPswm
	CUgNP6TQ3VFXSXPUnbM6xgdNYNtwAzoJylYMNjnE=
Content-Type: multipart/mixed; boundary="===============3720191551890751903=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 2.2.0 SUCCEEDED
Message-ID: <0101018dadd3a412-851973fb-9c0a-4b4a-afbd-23e300648670-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195600

--===============3720191551890751903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-urllib3* to *2.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-2.1.0-2.2.0.patch
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
From 03bb0b8fd3ebe4556e324f4aa5300a11db5dfc61 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 08:37:56 +0000
Subject: [PATCH] python3-urllib3: upgrade 2.1.0 -> 2.2.0

---
 .../{python3-urllib3_2.1.0.bb => python3-urllib3_2.2.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.1.0.bb => python3-urllib3_2.2.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.1.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_2.1.0.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.2.0.bb
index b5b37e2924..294ad8026f 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.1.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "df7aa8afb0148fa78488e7899b2c59b5f4ffcfa82e6c54ccb9dd37c1d7b52d54"
+SRC_URI[sha256sum] = "051d961ad0c62a94e50ecf1af379c3aba230c66c710493493560c0c223c49f20"
 
 inherit pypi python_hatchling
 
-- 
2.42.0


--===============3720191551890751903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-urllib3: PKGV changed from 2.1.0 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-urllib3: PV changed from "2.1.0" to "2.2.0"
packages/core2-64-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.1.0.tar.gz;downloadfilename=urllib3-2.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.2.0.tar.gz;downloadfilename=urllib3-2.2.0.tar.gz"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 2.1.0 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "2.1.0" to "2.2.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 2.1.0 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "2.1.0" to "2.2.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 2.1.0 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "2.1.0" to "2.2.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 2.1.0 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "2.1.0" to "2.2.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 2.1.0 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "2.1.0" to "2.2.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 2.1.0 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "2.1.0" to "2.2.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 2.1.0 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: PV changed from "2.1.0" to "2.2.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: FILELIST: directory renamed /usr/lib/python3.12/site-packages/urllib3-2.1.0.dist-info -> /usr/lib/python3.12/site-packages/urllib3-2.2.0.dist-info, directory renamed /usr/lib/python3.12/site-packages/urllib3-2.1.0.dist-info/licenses -> /usr/lib/python3.12/site-packages/urllib3-2.2.0.dist-info/licenses, added "/usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/fetch.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/connection.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/http2.py /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/request.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/__pycache__/http2.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/emscripten_fetch_worker.js /usr/lib/python3.12/
 site-packages/urllib3/contrib/emscripten/response.py /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/request.py /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__init__.py /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/connection.py /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/response.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/fetch.py"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 695041 to 811735 (+17%)
Changes to packages/core2-64-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.12/site-packages/urllib3-2.1.0.dist-info moved to /usr/lib/python3.12/site-packages/urllib3-2.2.0.dist-info
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/connection.py was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/emscripten_fetch_worker.js was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/fetch.py was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__init__.py was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__ was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/connection.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/fetch.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/request.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/response.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/request.py was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/response.py was added
  /usr/lib/python3.12/site-packages/urllib3/http2.py was added
  /usr/lib/python3.12/site-packages/urllib3/__pycache__/http2.cpython-312.pyc was added

--===============3720191551890751903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (0 cached, 914 parsed). 1858 targets, 46 skipped, 0 masked, 0 errors.
Removing 28 recipes from the core2-64 sysroot...done.
Removing 73 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-cd63594f30cd5c986539cf31dd19b8c764dd92f7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cd63594f30cd5c986539cf31dd19b8c764dd92f7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 615 Local 603 Mirrors 0 Missed 12 Current 265 (98% match, 98% complete)
Removing 8 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 271 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 272 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 273 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 275 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 276 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 278 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.6.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 279 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 281 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 282 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 285 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 286 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 294 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_populate_lic_setscene)
NOTE: recipe python3-certifi-2023.11.17-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-certifi-2023.11.17-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-certifi-2023.11.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-idna-3.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-idna-3.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-idna-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-idna-3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-certifi-2023.11.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-idna-3.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-idna-3.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-idna-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 296 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 297 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 298 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-idna-3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 299 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.6.bb:do_packagedata_setscene)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 300 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-certifi-2023.11.17-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-certifi-2023.11.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-certifi-2023.11.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-certifi-2023.11.17-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 394 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 406 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-urllib3-2.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-idna-3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 434 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-41.0.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-certifi-2023.11.17-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 436 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.97.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_5.9.8.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-41.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 443 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_packagedata_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 447 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-vectors-41.0.7-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-certifi/2023.11.17/temp/log.do_packagedata_setscene.2723514
NOTE: recipe python3-cffi-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 448 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb:do_package_setscene)
NOTE: recipe python3-psutil-5.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.97.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cffi-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-5.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.97.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 459 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 483 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2023.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 489 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 497 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytz-2023.4-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 506 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-unittest-automake-output/0.1/temp/log.do_packagedata_setscene.2723915
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 510 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_package_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-pytz/2023.4/temp/log.do_packagedata_setscene.2723914
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2023.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 523 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2023.4.bb:do_package_setscene)
NOTE: recipe python3-cryptography-41.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 546 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.74.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 559 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 572 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2023.11.17-r0: task do_package_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytz-2023.4-r0: task do_package_setscene: Started
NOTE: recipe libstd-rs-1.74.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 588 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 850 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 594 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-urllib3-2.2.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 622 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 1098 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_unpack)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 624 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-certifi-2023.11.17-r0: task do_package_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 626 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 628 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1105 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1116 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_patch)
NOTE: recipe python3-certifi-2023.11.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 652 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 659 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2023.11.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-urllib3-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-pytz-2023.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 675 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2023.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 676 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1431 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe python3-pytz-2023.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1488 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 687 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 692 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2023.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 704 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 707 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: Running task 1574 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 724 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1591 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 738 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 746 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 747 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 755 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 770 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 778 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 782 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 784 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 794 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 795 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 797 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1658 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 807 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 809 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 812 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 814 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1669 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 825 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 830 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 831 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1720 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 838 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 841 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 843 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 845 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 846 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 848 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 850 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 851 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 852 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 853 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 855 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 860 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 862 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 867 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 869 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 870 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 873 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 875 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 876 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 878 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 880 of 880 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2205 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2274 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2023.11.17.bb:do_packagedata)
NOTE: Running task 2440 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2023.4.bb:do_packagedata)
NOTE: Running task 2441 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata)
NOTE: Running task 2460 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2023.11.17-r0: task do_packagedata: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.4-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2472 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2473 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_configure)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2474 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_compile)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2475 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_install)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_install: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2476 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_package)
NOTE: Running task 2477 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package: Started
NOTE: recipe python3-certifi-2023.11.17-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2023.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: recipe python3-urllib3-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 2490 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_packagedata)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_packagedata unihash changed to e54c8cdbeacf51cd8a9c1447f1acffbe34938244e5962ddb428134063fd53319
NOTE: Setscene tasks completed
NOTE: Running task 2491 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_create_spdx)
NOTE: Running task 2492 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_package_write_ipk)
NOTE: Running task 2493 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_package_write_deb)
NOTE: Running task 2494 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_package_write_rpm)
NOTE: Running task 2495 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_package_qa)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_create_spdx: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package_qa: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2496 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_create_runtime_spdx)
NOTE: recipe python3-urllib3-2.2.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_package_qa unihash changed to 02e8a6593e97491464238f877dc117e475769f88bf0436bb3ddf5474fdb6d712
NOTE: recipe python3-urllib3-2.2.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-urllib3-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2497 of 2497 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2497 tasks of which 2467 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 25 ERROR messages, returning a non-zero exit code.
ERROR: python3-certifi-2023.11.17-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2024.2.2-r0 to 0:2023.11.17-r0) [version-going-backwards]
ERROR: python3-certifi-2023.11.17-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2024.2.2-r0 to 0:2023.11.17-r0) [version-going-backwards]
ERROR: python3-certifi-2023.11.17-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2024.2.2-r0 to 0:2023.11.17-r0) [version-going-backwards]
ERROR: python3-certifi-2023.11.17-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2024.2.2-r0 to 0:2023.11.17-r0) [version-going-backwards]
ERROR: python3-certifi-2023.11.17-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2024.2.2-r0 to 0:2023.11.17-r0) [version-going-backwards]
ERROR: python3-certifi-2023.11.17-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2024.2.2-r0 to 0:2023.11.17-r0) [version-going-backwards]
ERROR: python3-certifi-2023.11.17-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2024.2.2-r0 to 0:2023.11.17-r0) [version-going-backwards]
ERROR: python3-certifi-2023.11.17-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-unittest-automake-output-0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest-automake-output-src went backwards which would break package feeds (from 0:0.2-r0 to 0:0.1-r0) [version-going-backwards]
ERROR: python3-unittest-automake-output-0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest-automake-output-dbg went backwards which would break package feeds (from 0:0.2-r0 to 0:0.1-r0) [version-going-backwards]
ERROR: python3-unittest-automake-output-0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest-automake-output-staticdev went backwards which would break package feeds (from 0:0.2-r0 to 0:0.1-r0) [version-going-backwards]
ERROR: python3-unittest-automake-output-0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest-automake-output-dev went backwards which would break package feeds (from 0:0.2-r0 to 0:0.1-r0) [version-going-backwards]
ERROR: python3-unittest-automake-output-0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest-automake-output-doc went backwards which would break package feeds (from 0:0.2-r0 to 0:0.1-r0) [version-going-backwards]
ERROR: python3-unittest-automake-output-0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest-automake-output-locale went backwards which would break package feeds (from 0:0.2-r0 to 0:0.1-r0) [version-going-backwards]
ERROR: python3-pytz-2023.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-src went backwards which would break package feeds (from 0:2024.1-r0 to 0:2023.4-r0) [version-going-backwards]
ERROR: python3-unittest-automake-output-0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest-automake-output went backwards which would break package feeds (from 0:0.2-r0 to 0:0.1-r0) [version-going-backwards]
ERROR: python3-unittest-automake-output-0.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-pytz-2023.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-dbg went backwards which would break package feeds (from 0:2024.1-r0 to 0:2023.4-r0) [version-going-backwards]
ERROR: python3-pytz-2023.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-ptest went backwards which would break package feeds (from 0:2024.1-r0 to 0:2023.4-r0) [version-going-backwards]
ERROR: python3-pytz-2023.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-staticdev went backwards which would break package feeds (from 0:2024.1-r0 to 0:2023.4-r0) [version-going-backwards]
ERROR: python3-pytz-2023.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-dev went backwards which would break package feeds (from 0:2024.1-r0 to 0:2023.4-r0) [version-going-backwards]
ERROR: python3-pytz-2023.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-doc went backwards which would break package feeds (from 0:2024.1-r0 to 0:2023.4-r0) [version-going-backwards]
ERROR: python3-pytz-2023.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-locale went backwards which would break package feeds (from 0:2024.1-r0 to 0:2023.4-r0) [version-going-backwards]
ERROR: python3-pytz-2023.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz went backwards which would break package feeds (from 0:2024.1-r0 to 0:2023.4-r0) [version-going-backwards]
ERROR: python3-pytz-2023.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3720191551890751903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 695041 to 811735 (+17%)
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: FILELIST: directory renamed /usr/lib/python3.12/site-packages/urllib3-2.1.0.dist-info -> /usr/lib/python3.12/site-packages/urllib3-2.2.0.dist-info, directory renamed /usr/lib/python3.12/site-packages/urllib3-2.1.0.dist-info/licenses -> /usr/lib/python3.12/site-packages/urllib3-2.2.0.dist-info/licenses, added "/usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/fetch.py /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/response.py /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/emscripten_fetch_worker.js /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/connection.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/fetch.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/response.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/connection.py /usr/lib/python3.12/site-p
 ackages/urllib3/contrib/emscripten/__init__.py /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/request.py /usr/lib/python3.12/site-packages/urllib3/http2.py /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/request.cpython-312.pyc /usr/lib/python3.12/site-packages/urllib3/__pycache__/http2.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.12/site-packages/urllib3-2.1.0.dist-info moved to /usr/lib/python3.12/site-packages/urllib3-2.2.0.dist-info
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/connection.py was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/emscripten_fetch_worker.js was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/fetch.py was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__init__.py was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__ was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/connection.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/fetch.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/request.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/__pycache__/response.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/request.py was added
  /usr/lib/python3.12/site-packages/urllib3/contrib/emscripten/response.py was added
  /usr/lib/python3.12/site-packages/urllib3/http2.py was added
  /usr/lib/python3.12/site-packages/urllib3/__pycache__/http2.cpython-312.pyc was added

--===============3720191551890751903==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-2.1.0-2.2.0.patch"

RnJvbSAwM2JiMGI4ZmQzZWJlNDU1NmUzMjRmNGFhNTMwMGExMWRiNWRmYzYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDg6Mzc6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVybGxpYjM6IHVwZ3JhZGUgMi4xLjAgLT4gMi4yLjAKCi0tLQogLi4uL3tweXRob24z
LXVybGxpYjNfMi4xLjAuYmIgPT4gcHl0aG9uMy11cmxsaWIzXzIuMi4wLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cmxsaWIzXzIuMS4wLmJiID0+
IHB5dGhvbjMtdXJsbGliM18yLjIuMC5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18yLjEuMC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIuMi4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11
cmxsaWIzXzIuMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdXJsbGliM18yLjIuMC5iYgppbmRleCBiNWIzN2UyOTI0Li4yOTRhZDgwMjZmIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18yLjEu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18y
LjIuMC5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3No
YXpvdy91cmxsaWIzIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFLnR4dDttZDU9NTJkMjczYTMwNTRjZWQ1NjEyNzVkNGQxNTI2MGVjZGEiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJkZjdhYThhZmIwMTQ4ZmE3ODQ4OGU3ODk5YjJjNTliNWY0ZmZj
ZmE4MmU2YzU0Y2NiOWRkMzdjMWQ3YjUyZDU0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA1MWQ5
NjFhZDBjNjJhOTRlNTBlY2YxYWYzNzljM2FiYTIzMGM2NmM3MTA0OTM0OTM1NjBjMGMyMjNjNDlm
MjAiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKLS0gCjIuNDIuMAoK

--===============3720191551890751903==--

