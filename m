Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C53C531F1
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:01 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1401.1771440112887408710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cywrzX1R;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oZnlIF1x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c720f05ca-7c385378-8f46-4e71-a768-f1d79c5a2b96-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aT5OVtGCyl6o/KDIRrW+fX9eYPq+w+QBmFE5sN9XvSY=;
	b=cywrzX1RyHDv7FBgRcAGzCd1GRrmlUFAoAX/tu2hfDZ219Y/6BYav8jWumej9MCc
	q2Qnm4wf52hQlBgdPlmVES2q7sFlviC0aQlCBC477lMs4wRIOyLn9ODQb06u3Pyu6OE
	c8S0ubr9SPWO6M+fD4hQSfylsIBNERBAu2ctweoY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aT5OVtGCyl6o/KDIRrW+fX9eYPq+w+QBmFE5sN9XvSY=;
	b=oZnlIF1xZMyEN0cyICO1gTtJof5E32e+IASr7wu42chdC2tybstnzRNKMsU5DEVP
	PHNpjMBYpJ63vrhYJ08lvwOp2LWxRqo2C05rYtVQ1IuGpIOxyTDEQGO9ckmo7gGu9Nw
	QPY1jwqkRTLI3qoh/fjkZR9idsh7GCTM3WZquGqo=
Content-Type: multipart/mixed; boundary="===============8599571614809970266=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.26.10 SUCCEEDED
Message-ID: <0101019c720f05ca-7c385378-8f46-4e71-a768-f1d79c5a2b96-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231398

--===============8599571614809970266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-vaapi* to *1.26.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.26.9-1.26.10.patch
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
From 86ac42f935c9ad54705b72b177959d030cfaa19c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 16:07:45 +0000
Subject: [PATCH] gstreamer1.0-vaapi: upgrade 1.26.9 -> 1.26.10

---
 ...treamer1.0-vaapi_1.26.9.bb => gstreamer1.0-vaapi_1.26.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.26.9.bb => gstreamer1.0-vaapi_1.26.10.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb
index dc5055bb0c..4f7dfd580c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "bf989040404515dc9b042f4fdc49ff33a6dccf49d544736150e967b42665598e"
+SRC_URI[sha256sum] = "64633e188d0b6005847fd8e3ad70c0c20c86caeeae4f211f3e383b1455fc5d09"
 
 S = "${UNPACKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.47.1


--===============8599571614809970266==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.26.9-1.26.10.patch"

RnJvbSA4NmFjNDJmOTM1YzlhZDU0NzA1YjcyYjE3Nzk1OWQwMzBjZmFhMTljIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTY6MDc6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtdmFhcGk6IHVwZ3JhZGUgMS4yNi45IC0+IDEuMjYuMTAKCi0tLQogLi4udHJl
YW1lcjEuMC12YWFwaV8xLjI2LjkuYmIgPT4gZ3N0cmVhbWVyMS4wLXZhYXBpXzEuMjYuMTAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtdmFh
cGlfMS4yNi45LmJiID0+IGdzdHJlYW1lcjEuMC12YWFwaV8xLjI2LjEwLmJifSAoOTUlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
dmFhcGlfMS4yNi45LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC12YWFwaV8xLjI2LjEwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFhcGlfMS4y
Ni45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXZhYXBpXzEuMjYuMTAuYmIKaW5kZXggZGM1MDU1YmIwYy4uNGY3ZGZkNTgwYyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC12
YWFwaV8xLjI2LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC12YWFwaV8xLjI2LjEwLmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0NPUFlJTkcuTElCO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhi
MzY0NTE2YyIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcv
c3JjLyR7UkVBTFBOfS8ke1JFQUxQTn0tJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYmY5ODkwNDA0MDQ1MTVkYzliMDQyZjRmZGM0OWZmMzNhNmRjY2Y0OWQ1NDQ3MzYxNTBl
OTY3YjQyNjY1NTk4ZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2NDYzM2UxODhkMGI2MDA1ODQ3
ZmQ4ZTNhZDcwYzBjMjBjODZjYWVlYWU0ZjIxMWYzZTM4M2IxNDU1ZmM1ZDA5IgogCiBTID0gIiR7
VU5QQUNLRElSfS8ke1JFQUxQTn0tJHtQVn0iCiBERVBFTkRTID0gImxpYnZhIGdzdHJlYW1lcjEu
MCBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZCIKLS0g
CjIuNDcuMQoK

--===============8599571614809970266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGSIZE changed from 3665744 to 3665840 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-vaapi/1.26.9/gst/vaapi -> /usr/src/debug/gstreamer1.0-vaapi/1.26.10/gst/vaapi, directory renamed /usr/src/debug/gstreamer1.0-vaapi/1.26.9/gst-libs/gst/vaapi -> /usr/src/debug/gstreamer1.0-vaapi/1.26.10/gst-libs/gst/vaapi
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.26.9.tar.xz" to "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.26.10.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi: PKGV changed from 1.26.9 [default] to 1.26.10 [default]

--===============8599571614809970266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1953 targets, 64 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-6e4288b9f33ebac5d3b27ab358a61995026ee213"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:6e4288b9f33ebac5d3b27ab358a61995026ee213"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 775 Local 756 Mirrors 0 Missed 19 Current 392 (97% match, 98% complete)
done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 502 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 507 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 509 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libva/libva_2.23.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libva-2.23.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libva-2.23.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 510 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libva/libva_2.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1375 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_fetch)
NOTE: Running task 1379 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libva/libva_2.23.0.bb:do_write_config)
NOTE: Running setscene task 511 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 518 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 526 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_populate_sysroot_setscene)
NOTE: Running task 1414 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_write_config)
NOTE: recipe libva-2.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_fetch: Started
NOTE: recipe libva-2.23.0-r0: task do_write_config: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_fetch: Succeeded
NOTE: Running task 1498 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_unpack)
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_write_config: Started
NOTE: recipe libva-2.23.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1500 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libva/libva_2.23.0.bb:do_fetch)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 559 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running setscene task 560 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_unpack: Started
NOTE: recipe libva-2.23.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_unpack: Succeeded
NOTE: Running task 1526 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_patch)
NOTE: recipe mesa-2_26.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 578 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_create_spdx_setscene)
NOTE: Running setscene task 581 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 583 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 586 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 587 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_patch: Succeeded
NOTE: recipe libva-2.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 1527 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1528 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_populate_lic)
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1529 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libva/libva_2.23.0.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_populate_lic: Started
NOTE: Running setscene task 609 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 610 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libva-2.23.0-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 616 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_populate_lic unihash changed to 5f52bd66254e6124ca4f9e36cd66d8ad375fc8ac29c8c0ce812ad0367f27de0a
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_deploy_source_date_epoch unihash changed to b15b42765ce5b96ac26b3c628eaf02936fb697934b4d66b517f3b2c8b8662833
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 623 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 624 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 627 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 634 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.86-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 635 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.86-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libva-2.23.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 642 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 654 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.86-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/librsvg/2.61.3/temp/log.do_packagedata_setscene.1721742
NOTE: Running setscene task 664 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_packagedata_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 667 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 668 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 669 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_package_setscene)
NOTE: recipe libical-3.0.20-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 673 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 682 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 686 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 692 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 702 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 704 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 706 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 707 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 721 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 722 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 724 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 732 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 740 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 747 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 749 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 750 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_package_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 751 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 754 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 757 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 758 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 762 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 766 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 770 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_26.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 774 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 776 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 778 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_26.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 781 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 787 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 789 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 794 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 795 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_26.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 796 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 804 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 805 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 807 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 808 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 809 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 811 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 812 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 813 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 814 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 816 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 817 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 819 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_26.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 826 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 829 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 831 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 833 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_26.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 834 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 835 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 838 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 839 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 843 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 844 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 845 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 849 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 850 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 852 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 853 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 855 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1576 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 861 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 863 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1783 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1784 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1789 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libva/libva_2.23.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 865 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 867 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 869 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libva-2.23.0-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1832 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libva-2.23.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1839 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe librsvg-2.61.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 870 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 871 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.93.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 872 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 873 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 874 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 875 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 876 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.93.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 879 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1841 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.93.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.93.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 881 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 882 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1842 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libstd-rs-1.93.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 886 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 888 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 889 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 890 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 891 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 893 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 897 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 898 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 900 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 902 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 906 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 907 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 908 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.93.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 909 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 911 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.93.0.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-78.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-78.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.93.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 914 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 915 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 916 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 917 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe icu-78.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 921 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 922 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 923 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 924 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 925 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.93.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1882 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1885 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 926 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 928 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 929 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 930 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe icu-78.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 932 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 934 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 935 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 937 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 940 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 942 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 945 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 947 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 949 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 950 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 952 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-78.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 953 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 955 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-78.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 957 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 958 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 960 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 962 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 9fa82e53a846e1e179ae1058bc016152fee7c6ecd3613259e07e6d1c4c98f5d3 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '143128359c5f76aae5fda32a3b0db237f4c488aceccb82b2dc0bac81f85645ba', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '9fa82e53a846e1e179ae1058bc016152fee7c6ecd3613259e07e6d1c4c98f5d3'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 143128359c5f76aae5fda32a3b0db237f4c488aceccb82b2dc0bac81f85645ba -> 9fa82e53a846e1e179ae1058bc016152fee7c6ecd3613259e07e6d1c4c98f5d3 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 965 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 966 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 967 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 968 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 969 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 971 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 972 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 973 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 975 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 976 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.54-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.54-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 980 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 981 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 982 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 983 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 985 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 986 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 987 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 988 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 989 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 991 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.54-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 994 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 996 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.54.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.54-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1000 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1001 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.54-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1004 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1006 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1007 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1008 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1010 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1012 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/xorgproto/2024.1/temp/log.do_packagedata_setscene.1726932
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1015 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1016 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 1017 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1018 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package_setscene)
NOTE: Running setscene task 1019 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1021 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1022 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1024 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_package_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1026 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1029 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1030 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1032 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1036 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1038 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1040 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1041 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1043 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1045 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1046 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1047 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 1048 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1049 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1050 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1052 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1054 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1055 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1056 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1057 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1058 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1059 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1060 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1061 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1062 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1063 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1064 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1069 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1070 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 2042 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1071 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1072 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1074 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1076 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1077 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1078 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1079 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1080 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1084 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1085 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1086 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1088 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1094 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1096 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1100 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1101 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1103 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1105 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1107 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1109 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1111 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1113 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1115 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1116 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 9fa82e53a846e1e179ae1058bc016152fee7c6ecd3613259e07e6d1c4c98f5d3 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'ef863e1e2def2f1380805abe331ac6cb762f4bdc3ffe271fb7abe315d8351bd0', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '9fa82e53a846e1e179ae1058bc016152fee7c6ecd3613259e07e6d1c4c98f5d3'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed ef863e1e2def2f1380805abe331ac6cb762f4bdc3ffe271fb7abe315d8351bd0 -> 9fa82e53a846e1e179ae1058bc016152fee7c6ecd3613259e07e6d1c4c98f5d3 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1119 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1121 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1123 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1124 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1128 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1131 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1132 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1134 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1136 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1138 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1140 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1141 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1143 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 1144 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1145 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1146 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1148 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1155 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1156 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1158 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1160 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1163 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1165 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1167 of 1167 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2463 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata: Started
NOTE: Running task 2979 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libva/libva_2.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3165 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_packagedata)
NOTE: Running task 3201 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libva/libva_2.23.0.bb:do_collect_spdx_deps)
NOTE: recipe libva-2.23.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.61.3-r0: task do_packagedata: Started
NOTE: recipe libva-2.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.23.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3202 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libva/libva_2.23.0.bb:do_configure)
NOTE: recipe librsvg-2.61.3-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.23.0-r0: task do_configure: Started
NOTE: recipe libva-2.23.0-r0: task do_configure: Succeeded
NOTE: Running task 3208 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libva/libva_2.23.0.bb:do_compile)
NOTE: recipe libva-2.23.0-r0: task do_compile: Started
NOTE: recipe libva-2.23.0-r0: task do_compile: Succeeded
NOTE: Running task 3209 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libva/libva_2.23.0.bb:do_install)
NOTE: recipe libva-2.23.0-r0: task do_install: Started
NOTE: recipe libva-2.23.0-r0: task do_install: Succeeded
NOTE: Running task 3210 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libva/libva_2.23.0.bb:do_package)
NOTE: Running task 3211 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libva/libva_2.23.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.23.0-r0: task do_package: Started
NOTE: recipe libva-2.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3212 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3213 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_configure: Started
NOTE: recipe libva-2.23.0-r0: task do_package: Succeeded
NOTE: Running task 3214 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libva/libva_2.23.0.bb:do_packagedata)
NOTE: recipe libva-2.23.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.23.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3215 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libva/libva_2.23.0.bb:do_create_spdx)
NOTE: recipe libva-2.23.0-r0: task do_create_spdx: Started
NOTE: recipe libva-2.23.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3216 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_configure: Succeeded
NOTE: Running task 3217 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_compile: Succeeded
NOTE: Running task 3218 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_install: Succeeded
NOTE: Running task 3219 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_package)
NOTE: Running task 3220 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_package: Succeeded
NOTE: Running task 3221 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3222 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_create_spdx)
NOTE: Running task 3223 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_package_write_ipk)
NOTE: Running task 3224 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_package_write_deb)
NOTE: Running task 3225 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_package_write_rpm)
NOTE: Running task 3226 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 3227 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_create_package_spdx)
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_create_package_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_package_qa unihash changed to a1d3597509b81aa85d5eaad5dbc900a4d6afeb9796ec4065dc492d1f0780ebbd
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.26.10-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 3228 of 3228 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.10.bb:do_build)
NOTE: Tasks Summary: Attempted 3228 tasks of which 3182 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 19 ERROR messages, returning a non-zero exit code.
ERROR: librsvg-2.61.3-r0 do_packagedata_setscene: QA Issue: Package version for package librsvg-src went backwards which would break package feeds (from 0:2.61.4-r0 to 0:2.61.3-r0) [version-going-backwards]
ERROR: librsvg-2.61.3-r0 do_packagedata_setscene: QA Issue: Package version for package librsvg-dbg went backwards which would break package feeds (from 0:2.61.4-r0 to 0:2.61.3-r0) [version-going-backwards]
ERROR: librsvg-2.61.3-r0 do_packagedata_setscene: QA Issue: Package version for package librsvg-gtk went backwards which would break package feeds (from 0:2.61.4-r0 to 0:2.61.3-r0) [version-going-backwards]
ERROR: librsvg-2.61.3-r0 do_packagedata_setscene: QA Issue: Package version for package rsvg went backwards which would break package feeds (from 0:2.61.4-r0 to 0:2.61.3-r0) [version-going-backwards]
ERROR: librsvg-2.61.3-r0 do_packagedata_setscene: QA Issue: Package version for package librsvg-ptest went backwards which would break package feeds (from 0:2.61.4-r0 to 0:2.61.3-r0) [version-going-backwards]
ERROR: librsvg-2.61.3-r0 do_packagedata_setscene: QA Issue: Package version for package librsvg-staticdev went backwards which would break package feeds (from 0:2.61.4-r0 to 0:2.61.3-r0) [version-going-backwards]
ERROR: librsvg-2.61.3-r0 do_packagedata_setscene: QA Issue: Package version for package librsvg-dev went backwards which would break package feeds (from 0:2.61.4-r0 to 0:2.61.3-r0) [version-going-backwards]
ERROR: librsvg-2.61.3-r0 do_packagedata_setscene: QA Issue: Package version for package librsvg-doc went backwards which would break package feeds (from 0:2.61.4-r0 to 0:2.61.3-r0) [version-going-backwards]
ERROR: librsvg-2.61.3-r0 do_packagedata_setscene: QA Issue: Package version for package librsvg-locale went backwards which would break package feeds (from 0:2.61.4-r0 to 0:2.61.3-r0) [version-going-backwards]
ERROR: librsvg-2.61.3-r0 do_packagedata_setscene: QA Issue: Package version for package librsvg went backwards which would break package feeds (from 0:2.61.4-r0 to 0:2.61.3-r0) [version-going-backwards]
ERROR: librsvg-2.61.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xorgproto-2024.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-src went backwards which would break package feeds (from 0:2025.1-r0 to 0:2024.1-r0) [version-going-backwards]
ERROR: xorgproto-2024.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dbg went backwards which would break package feeds (from 0:2025.1-r0 to 0:2024.1-r0) [version-going-backwards]
ERROR: xorgproto-2024.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-staticdev went backwards which would break package feeds (from 0:2025.1-r0 to 0:2024.1-r0) [version-going-backwards]
ERROR: xorgproto-2024.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dev went backwards which would break package feeds (from 0:2025.1-r0 to 0:2024.1-r0) [version-going-backwards]
ERROR: xorgproto-2024.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-doc went backwards which would break package feeds (from 0:2025.1-r0 to 0:2024.1-r0) [version-going-backwards]
ERROR: xorgproto-2024.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-locale went backwards which would break package feeds (from 0:2025.1-r0 to 0:2024.1-r0) [version-going-backwards]
ERROR: xorgproto-2024.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto went backwards which would break package feeds (from 0:2025.1-r0 to 0:2024.1-r0) [version-going-backwards]
ERROR: xorgproto-2024.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8599571614809970266==--

