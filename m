Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2740C6FA9D
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:40 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.886.1667349637115575209
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IihM1+jU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018435c86549-d855e4db-dbb9-454d-924b-8e09ec22cad0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7ZnSGfYhymguYzFYVV2Fco4Tj5temdtxGzXosINiKvU=;
	b=IihM1+jU4u9HFbu25MKpxyasL9eq67Ex7ygsNcZZaEr33muSojXq7FC3P1Yw/bHR
	UFhU+Bj5eqrjSgg0muMxXa6dc52I3bOPQqqPLbIUJShhDb+E53hanLupkscKk5iSnGp
	XGYaat5Xo6RzcDOGXLFAwMNG0DaYowopOCg1XJYg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7ZnSGfYhymguYzFYVV2Fco4Tj5temdtxGzXosINiKvU=;
	b=QtJ5CovHLddHIeqLuUuKbwbzEGpcoBaD3Evymln72AkeNbwGiQ4Go5PfOFeSiXMR
	II8pItCEjGegjNilZ8Wm3nHRm2/fkYn3+egk7OcqpcqzdnQib2rqOKMU9G1CUahqtyg
	o8SIFfgR5Q8F1ZYcGXWeK8xn+AADtt7XGebsgCkU=
Content-Type: multipart/mixed; boundary="===============1425190695641851364=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.20.4 SUCCEEDED
Message-ID: <0101018435c86549-d855e4db-dbb9-454d-924b-8e09ec22cad0-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172525

--===============1425190695641851364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-vaapi* to *1.20.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.20.3-1.20.4.patch
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
--===============1425190695641851364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGSIZE changed from 2982564 to 2983000 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGSIZE changed from 2826790 to 2827107 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-vaapi: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.3.tar.xz" to "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.4.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-vaapi: PV changed from "1.20.3" to "1.20.4"

--===============1425190695641851364==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.20.3-1.20.4.patch"

RnJvbSBjMTQwOGM4ZWEyODAwOTIzZjFlM2EwNDIwOTMyNWE3MDgzYjVjZTNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAyMTo0NjoxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC12YWFwaTogdXBncmFkZSAxLjIwLjMgLT4gMS4yMC40CgotLS0KIC4uLnN0cmVh
bWVyMS4wLXZhYXBpXzEuMjAuMy5iYiA9PiBnc3RyZWFtZXIxLjAtdmFhcGlfMS4yMC40LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXZhYXBp
XzEuMjAuMy5iYiA9PiBnc3RyZWFtZXIxLjAtdmFhcGlfMS4yMC40LmJifSAoOTUlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFh
cGlfMS4yMC4zLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC12YWFwaV8xLjIwLjQuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC12YWFwaV8xLjIwLjMu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtdmFhcGlfMS4yMC40LmJiCmluZGV4IDZlNTgwZjlmNzkuLjgxZWMyM2QyNmUgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFhcGlf
MS4yMC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtdmFhcGlfMS4yMC40LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkcuTElCO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2
YyIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjLyR7
UkVBTFBOfS8ke1JFQUxQTn0tJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NmVlOTllYjMxNmFiZGRlOWFkMzcwMDI5MTViZDhjMzg2NzkxOGY2ZmRjNzRiN2NmMmFjNGMxYWUw
ZDY5MGI0NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhYjEyNTk2MTQ0YzA1NTA2ZTk3ODIzNzRj
NWQyY2RmYjMwNjlmY2E4OTkwOGQ2ZGUzNjBkOTQ3YmI3N2ZkMDZhIgogCiBTID0gIiR7V09SS0RJ
Un0vJHtSRUFMUE59LSR7UFZ9IgogREVQRU5EUyA9ICJsaWJ2YSBnc3RyZWFtZXIxLjAgZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtYmFzZSBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQiCi0tIAoyLjMxLjEK
Cg==

--===============1425190695641851364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ae4ae99467e112b6f43e791ef7a9eee050f47c49"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 23 Mirrors 0 Missed 14 Current 652 (62% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 672 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2242 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_fetch)
NOTE: Running task 2301 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_fetch)
NOTE: Running task 2355 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_write_config)
NOTE: Running task 2356 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_write_config)
NOTE: Running task 2390 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_write_config)
NOTE: recipe libva-2.16.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Started
NOTE: recipe libva-2.16.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Started
NOTE: recipe libva-2.16.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Started
NOTE: Running task 2398 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_unpack)
NOTE: Running task 2399 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_unpack)
NOTE: Running task 2400 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2401 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_fetch)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Started
NOTE: recipe libva-2.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Succeeded
NOTE: Running task 2402 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_unpack)
NOTE: Running task 2403 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2404 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Started
NOTE: Running task 2405 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.16.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 2406 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2407 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe libva-2.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2408 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic unihash changed to a47913a715f8fabd61d45c67c18c227e488621c091d73260878a92ebec68871e
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 2409 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Started
NOTE: recipe libva-2.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2410 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_configure)
NOTE: recipe libva-2.16.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2412 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_configure: Started
NOTE: recipe libva-2.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2413 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_compile)
NOTE: recipe libva-2.16.0-r0: task do_compile: Started
NOTE: recipe libva-2.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2414 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_install)
NOTE: recipe libva-2.16.0-r0: task do_install: Started
NOTE: recipe libva-2.16.0-r0: task do_install: Succeeded
NOTE: Running task 2415 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_populate_sysroot)
NOTE: Running task 2416 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_package)
NOTE: recipe libva-2.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.16.0-r0: task do_package: Started
NOTE: recipe libva-2.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2417 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_compile: Started
NOTE: recipe libva-2.16.0-r0: task do_package: Succeeded
NOTE: Running task 2418 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_packagedata)
NOTE: recipe libva-2.16.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2419 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2420 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 2421 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2422 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2423 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Succeeded
NOTE: Running task 2424 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_compile: Succeeded
NOTE: Running task 2425 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_install: Succeeded
NOTE: Running task 2426 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2427 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2427 tasks of which 2393 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gstreamer1.0-plugins-bad/1.20.3-r0/temp/log.do_packagedata.3873623
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata) failed with exit code '1'

--===============1425190695641851364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1665 targets, 49 skipped, 0 masked, 0 errors.
Removing 107 recipes from the core2-32 sysroot...done.
Removing 107 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ae4ae99467e112b6f43e791ef7a9eee050f47c49"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 458 Local 444 Mirrors 0 Missed 14 Current 226 (96% match, 97% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 227 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 228 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene)
NOTE: Running setscene task 239 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 240 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 241 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 247 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 248 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 249 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 250 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 251 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 252 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 254 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 256 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 258 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot_setscene)
NOTE: Running task 1050 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_fetch)
NOTE: Running task 1061 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_fetch)
NOTE: Running task 1076 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_write_config)
NOTE: Running task 1077 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_write_config)
NOTE: Running task 1080 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_write_config)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.65-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.65-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.85.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Started
NOTE: recipe libva-2.16.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.16.0-r0: task do_fetch: Started
NOTE: Running task 1081 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_fetch)
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1082 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.65-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 278 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Succeeded
NOTE: Running setscene task 280 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.64.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.15.bb:do_packagedata_setscene)
NOTE: Running task 1087 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_unpack)
NOTE: recipe bluez5-5.65-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Succeeded
NOTE: Running setscene task 287 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 288 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 290 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 295 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-7.85.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 298 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.64.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 303 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.16.0-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.64.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1119 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_unpack)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 307 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.64.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 1124 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_patch)
NOTE: recipe libva-2.16.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1125 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_patch)
NOTE: Running setscene task 310 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.64.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 311 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 316 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Started
NOTE: Running setscene task 340 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 341 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.10-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 342 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 344 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1152 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1153 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe libva-2.16.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1159 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 356 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.64.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 361 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 364 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 373 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 382 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-5.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-5.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 386 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: recipe shadow-4.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic unihash changed to a47913a715f8fabd61d45c67c18c227e488621c091d73260878a92ebec68871e
NOTE: recipe libxft-1_2.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 398 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-5.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1240 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_patch)
NOTE: Running setscene task 404 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 406 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 407 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-5.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 412 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 417 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 437 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 450 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_22.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 465 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 476 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 478 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 506 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 517 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 518 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 521 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 522 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 527 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 539 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 540 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 564 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 566 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 568 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 572 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 573 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 580 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 583 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 585 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 592 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 595 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 597 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2329 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2330 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2385 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_configure)
NOTE: recipe libva-2.16.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2386 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_configure: Started
NOTE: recipe libva-2.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2387 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_compile)
NOTE: recipe libva-2.16.0-r0: task do_compile: Started
NOTE: recipe libva-2.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2388 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_install)
NOTE: recipe libva-2.16.0-r0: task do_install: Started
NOTE: recipe libva-2.16.0-r0: task do_install: Succeeded
NOTE: Running task 2389 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_populate_sysroot)
NOTE: Running task 2390 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_package)
NOTE: recipe libva-2.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.16.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2391 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_compile: Started
NOTE: recipe libva-2.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_package: Succeeded
NOTE: Running task 2392 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_packagedata)
NOTE: recipe libva-2.16.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2393 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2394 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 2395 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2396 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2397 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Succeeded
NOTE: Running task 2398 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_compile: Succeeded
NOTE: Running task 2399 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_install: Succeeded
NOTE: Running task 2400 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2401 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2401 tasks of which 2367 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gstreamer1.0-plugins-bad/1.20.3-r0/temp/log.do_packagedata.4059734
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata) failed with exit code '1'

--===============1425190695641851364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ae4ae99467e112b6f43e791ef7a9eee050f47c49"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 23 Mirrors 0 Missed 14 Current 642 (62% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 662 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2210 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_fetch)
NOTE: Running task 2267 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_fetch)
NOTE: Running task 2319 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_write_config)
NOTE: Running task 2320 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_write_config)
NOTE: Running task 2354 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libva-2.16.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Started
NOTE: recipe libva-2.16.0-r0: task do_fetch: Started
NOTE: recipe libva-2.16.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Succeeded
NOTE: Running task 2362 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_unpack)
NOTE: Running task 2363 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Succeeded
NOTE: Running task 2364 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_unpack)
NOTE: recipe libva-2.16.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2365 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_fetch)
NOTE: recipe libva-2.16.0-r0: task do_unpack: Started
NOTE: recipe libva-2.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Succeeded
NOTE: Running task 2366 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_unpack)
NOTE: Running task 2367 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.16.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Started
NOTE: Running task 2368 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.16.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 2369 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2370 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2371 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic)
NOTE: recipe libva-2.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2372 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe libva-2.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic unihash changed to a47913a715f8fabd61d45c67c18c227e488621c091d73260878a92ebec68871e
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2373 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_patch)
NOTE: Running task 2374 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Started
NOTE: recipe libva-2.16.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2376 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_configure: Started
NOTE: recipe libva-2.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_compile)
NOTE: recipe libva-2.16.0-r0: task do_compile: Started
NOTE: recipe libva-2.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_install)
NOTE: recipe libva-2.16.0-r0: task do_install: Started
NOTE: recipe libva-2.16.0-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_populate_sysroot)
NOTE: Running task 2380 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_package)
NOTE: recipe libva-2.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.16.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2381 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_compile: Started
NOTE: recipe libva-2.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_package: Succeeded
NOTE: Running task 2382 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_packagedata)
NOTE: recipe libva-2.16.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2383 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2384 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 2385 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2386 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2387 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Succeeded
NOTE: Running task 2388 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_compile: Succeeded
NOTE: Running task 2389 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_install: Succeeded
NOTE: Running task 2390 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2391 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2391 tasks of which 2357 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gstreamer1.0-plugins-bad/1.20.3-r0/temp/log.do_packagedata.3936524
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata) failed with exit code '1'

--===============1425190695641851364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ae4ae99467e112b6f43e791ef7a9eee050f47c49"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 23 Mirrors 0 Missed 14 Current 652 (62% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 672 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2242 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_fetch)
NOTE: Running task 2301 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_fetch)
NOTE: Running task 2355 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_write_config)
NOTE: Running task 2356 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_write_config)
NOTE: Running task 2390 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libva-2.16.0-r0: task do_fetch: Started
NOTE: recipe libva-2.16.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Started
NOTE: Running task 2398 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_unpack)
NOTE: Running task 2399 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Started
NOTE: Setscene tasks completed
NOTE: Running task 2400 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_fetch)
NOTE: Running task 2401 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Started
NOTE: recipe libva-2.16.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Started
NOTE: recipe libva-2.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Succeeded
NOTE: Running task 2402 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_unpack)
NOTE: Running task 2403 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2404 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2405 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_patch)
NOTE: recipe libva-2.16.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 2406 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2407 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic unihash changed to a47913a715f8fabd61d45c67c18c227e488621c091d73260878a92ebec68871e
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2408 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2409 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Started
NOTE: recipe libva-2.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2410 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_configure)
NOTE: recipe libva-2.16.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2412 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_configure: Started
NOTE: recipe libva-2.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2413 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_compile)
NOTE: recipe libva-2.16.0-r0: task do_compile: Started
NOTE: recipe libva-2.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2414 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_install)
NOTE: recipe libva-2.16.0-r0: task do_install: Started
NOTE: recipe libva-2.16.0-r0: task do_install: Succeeded
NOTE: Running task 2415 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_populate_sysroot)
NOTE: Running task 2416 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_package)
NOTE: recipe libva-2.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.16.0-r0: task do_package: Started
NOTE: recipe libva-2.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2417 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_compile: Started
NOTE: recipe libva-2.16.0-r0: task do_package: Succeeded
NOTE: Running task 2418 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_packagedata)
NOTE: recipe libva-2.16.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2419 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2420 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 2421 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2422 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2423 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Succeeded
NOTE: Running task 2424 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_compile: Succeeded
NOTE: Running task 2425 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_install: Succeeded
NOTE: Running task 2426 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2427 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2427 tasks of which 2393 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gstreamer1.0-plugins-bad/1.20.3-r0/temp/log.do_packagedata.4003272
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata) failed with exit code '1'

--===============1425190695641851364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ae4ae99467e112b6f43e791ef7a9eee050f47c49"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 36 Local 22 Mirrors 0 Missed 14 Current 657 (61% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 676 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2260 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_fetch)
NOTE: Running task 2319 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_fetch)
NOTE: Running task 2373 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_write_config)
NOTE: Running task 2374 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_write_config)
NOTE: Running task 2408 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libva-2.16.0-r0: task do_fetch: Started
NOTE: recipe libva-2.16.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Started
NOTE: Running task 2416 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_unpack)
NOTE: recipe libva-2.16.0-r0: task do_write_config: Started
NOTE: Running task 2417 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Started
NOTE: Running task 2418 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2419 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Succeeded
NOTE: Running task 2420 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_unpack)
NOTE: Running task 2421 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2422 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Started
NOTE: Running task 2423 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.16.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 2424 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2425 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic unihash changed to a47913a715f8fabd61d45c67c18c227e488621c091d73260878a92ebec68871e
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2426 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libva-2.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2427 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Started
NOTE: recipe libva-2.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2428 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_configure)
NOTE: recipe libva-2.16.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Succeeded
NOTE: Running task 2430 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_configure: Started
NOTE: recipe libva-2.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2431 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_compile)
NOTE: recipe libva-2.16.0-r0: task do_compile: Started
NOTE: recipe libva-2.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2432 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_install)
NOTE: recipe libva-2.16.0-r0: task do_install: Started
NOTE: recipe libva-2.16.0-r0: task do_install: Succeeded
NOTE: Running task 2433 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_populate_sysroot)
NOTE: Running task 2434 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_package)
NOTE: recipe libva-2.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.16.0-r0: task do_package: Started
NOTE: recipe libva-2.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2435 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_compile: Started
NOTE: recipe libva-2.16.0-r0: task do_package: Succeeded
NOTE: Running task 2436 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_packagedata)
NOTE: recipe libva-2.16.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2437 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2438 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 2439 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2440 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2441 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Succeeded
NOTE: Running task 2442 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_compile: Succeeded
NOTE: Running task 2443 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_install: Succeeded
NOTE: Running task 2444 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2445 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2445 tasks of which 2411 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-bad/1.20.3-r0/temp/log.do_packagedata.3817192
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata) failed with exit code '1'

--===============1425190695641851364==--

