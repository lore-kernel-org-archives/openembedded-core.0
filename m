Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46128C6FD21
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:41 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web09.854.1667349632132217010
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Y0nhgSnH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018435c8640c-18588d0e-95e6-40ca-bdb7-4de041b503de-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lJX/jKXgjdGmEeL9ZgyE/oJbGEtqMuV1w+RRHNUNc1U=;
	b=Y0nhgSnHTetZCRbAtRsogmp+k4THBbg+O02/Gk3IsAusywu8eEa44z+2HVcEVoEL
	tFHnCF+K2L3HmqIFkmsQeJ0oE2YtKeGrmpCvDVwA/LXQP2IcPPCfSiKlsH+pH+znWUL
	GTUTdcdNWIaUK15CpYqn3z38a5hjekJBCHjU+j1c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lJX/jKXgjdGmEeL9ZgyE/oJbGEtqMuV1w+RRHNUNc1U=;
	b=TK4kgHO6gWQrr+9BPK4cJ4pJ0LJSts4p8wFGDAYFjM17a+rCs3g+79OPBpwQQ7us
	Gs71HOplGcJ4PEFEr8dQdXZPnaqScp1k07RR0gvMNQ00SF0T8Tx4m3R8dTMqG+M9gsr
	kwIg0ngBkzRP7i35Im5EBj6bQBG/vXjXpvLkS2WE=
Content-Type: multipart/mixed; boundary="===============7468774591409626364=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-omx: upgrading to 1.20.4 SUCCEEDED
Message-ID: <0101018435c8640c-18588d0e-95e6-40ca-bdb7-4de041b503de-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172513

--===============7468774591409626364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-omx* to *1.20.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-omx-upgrade-1.20.3-1.20.4.patch
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
--===============7468774591409626364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-omx: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.20.3.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.20.4.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-omx: PKGV changed from 1.20.3 [default] to 1.20.4 [default]

--===============7468774591409626364==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-omx-upgrade-1.20.3-1.20.4.patch"

RnJvbSAxZTM5OWMwMjUyYTNhYTE4MmE3ZDE3ZDVmODkzOGU5NWVkNDk5NDA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAyMDoxMDoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1vbXg6IHVwZ3JhZGUgMS4yMC4zIC0+IDEuMjAuNAoKLS0tCiAuLi4ve2dzdHJl
YW1lcjEuMC1vbXhfMS4yMC4zLmJiID0+IGdzdHJlYW1lcjEuMC1vbXhfMS4yMC40LmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1vbXhfMS4y
MC4zLmJiID0+IGdzdHJlYW1lcjEuMC1vbXhfMS4yMC40LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214XzEuMjAu
My5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214
XzEuMjAuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9teF8xLjIwLjMuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214XzEuMjAu
NC5iYgppbmRleCBmYjQ4NTYyYTJiLi40ZDYzZGI4OWE3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9teF8xLjIwLjMuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1vbXhfMS4yMC40
LmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIFwKIAogU1JDX1VSSSA9ICJodHRw
czovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1vbXgvZ3N0LW9teC0ke1BWfS50
YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4ZGI0ODA0MGJiNDFmMDllZGY4ZDE3ZmY2
ZDE2YzU0ODg4ZDc3NzdiYTQ1MDFjMmM2OWYwMDgzMzUwZWE5YTE1IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjcwZGRkNDg1ZTJkY2FiNzkwNzAxNjRkNjFhZDJmZjNhNjNlMTVhMWQ3YWJmOTA3NWQ4
NmViNzc3NjJiMGVkZmQiCiAKIFMgPSAiJHtXT1JLRElSfS9nc3Qtb214LSR7UFZ9IgogCi0tIAoy
LjMxLjEKCg==

--===============7468774591409626364==
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
meta-yocto-bsp       = "tmp-auh-upgrades:9c5d2a50dfd6b97126d135cf899b06c3191bb6f5"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 73 Local 23 Mirrors 0 Missed 50 Current 617 (31% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 649 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_packagedata_setscene)
NOTE: Running task 1782 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_fetch)
NOTE: Running task 1876 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1947 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_write_config)
NOTE: Running task 2074 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 2149 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_fetch)
NOTE: Running task 2150 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2151 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2155 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_compile)
NOTE: Running task 2161 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: Running task 2205 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_fetch)
NOTE: Running task 2230 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_compile)
NOTE: Running task 2263 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_packagedata)
NOTE: Running task 2264 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_fetch)
NOTE: Running task 2265 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2290 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_write_config)
NOTE: Running task 2311 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_write_config)
NOTE: recipe pango-1.50.10-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Started
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 2314 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Succeeded
NOTE: Running task 2315 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2316 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2317 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Started
NOTE: Running task 2318 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: Running task 2319 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_unpack)
NOTE: Running task 2320 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2321 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2322 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_unpack)
NOTE: Running task 2323 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2324 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: Running task 2325 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2326 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Started
NOTE: recipe pango-1.50.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: Running task 2328 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2329 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2330 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Started
NOTE: Running task 2331 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 2332 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 2333 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_patch)
NOTE: Running task 2334 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2335 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_patch)
NOTE: Running task 2336 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: Running task 2337 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2338 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2339 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2340 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2341 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_populate_lic unihash changed to 52fc9b8978ec90ab8618d17801366157935e728e1e8c61a87a305318660da278
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 2342 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2343 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Succeeded
NOTE: Running task 2344 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2345 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: Running task 2346 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 2347 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2348 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: Running task 2349 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2350 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2351 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: Running task 2352 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2353 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2354 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Succeeded
NOTE: Running task 2355 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2356 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2357 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2358 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2359 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe flac-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2360 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe flac-1.4.0-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2361 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 2362 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_package)
NOTE: recipe flac-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.0-r0: task do_package: Started
NOTE: recipe flac-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2363 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2364 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_compile)
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2365 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: Running task 2366 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2367 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2368 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile_ptest_base)
NOTE: Running task 2369 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2370 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install)
NOTE: Running task 2371 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2372 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2373 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 2374 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2375 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: Running task 2376 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Started
NOTE: recipe flac-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2377 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2378 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_populate_sysroot)
NOTE: recipe flac-1.4.0-r0: task do_packagedata: Started
NOTE: Running task 2379 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2380 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe flac-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2381 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: Running task 2382 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2383 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2384 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2385 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2386 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2387 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2388 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2389 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: Running task 2390 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2391 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_install)
NOTE: recipe libwebp-1.2.4-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 2392 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2393 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2394 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_package)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2395 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.4-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2396 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_packagedata)
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Succeeded
NOTE: Running task 2397 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2398 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2398 tasks of which 2298 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 127 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-src went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-dbg went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-xlib went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-ptest went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-staticdev went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-dev went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-doc went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-bin went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ab went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-af went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ang went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ar went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-as went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ast went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-az went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-be went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-be+latin went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bg went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bn-in went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-br went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bs went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ca went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ca+valencia went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-crh went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-cs went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-csb went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-cy went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-da went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-de went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-dz went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-el went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-en+shaw went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-en-ca went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-en-gb went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-eo went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-es went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-et went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-eu went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fa went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fur went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ga went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-gl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-gu went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-he went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hu went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hy went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ia went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-id went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-io went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-is went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-it went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ja went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ka went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-kk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-km went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-kn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ko went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ku went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-li went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-lt went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-lv went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mai went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ml went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ms went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-my went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nb went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nds went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ne went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nso went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-oc went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-or went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pa went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ps went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pt went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pt-br went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ro went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ru went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-si went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sq went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sr+ije went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sr+latin went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sv went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ta went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-te went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tg went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-th went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tt went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ug went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-uk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-uz went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-vi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-wa went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-xh went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-yi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-zh-cn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-zh-hk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-zh-tw went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-ani went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-bmp went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-gif went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-icns went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-ico went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-pnm went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-qtif went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-tga went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-xbm went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-xpm went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gdk-pixbuf/2.42.9-r0/temp/log.do_packagedata.897702
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata) failed with exit code '1'

--===============7468774591409626364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1665 targets, 49 skipped, 0 masked, 0 errors.
Removing 108 recipes from the core2-32 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:9c5d2a50dfd6b97126d135cf899b06c3191bb6f5"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 459 Local 405 Mirrors 0 Missed 54 Current 226 (88% match, 92% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 227 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 228 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 238 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_packagedata_setscene)
NOTE: Running setscene task 243 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.64.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_package_setscene)
NOTE: Running setscene task 251 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 255 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.64.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 261 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 265 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 272 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 276 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_package_setscene)
NOTE: Running setscene task 277 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 283 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 298 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 299 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 910 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_fetch)
NOTE: Running task 945 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 986 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_write_config)
NOTE: Running task 1018 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 1030 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 1031 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_fetch)
NOTE: Running task 1032 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 1035 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: Running task 1058 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_fetch)
NOTE: Running task 1062 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_write_config)
NOTE: Running task 1070 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_fetch)
NOTE: Running task 1071 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 1072 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_write_config)
NOTE: Running task 1087 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_write_config)
NOTE: Running task 1090 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_write_config)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running task 1091 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_fetch)
NOTE: recipe bluez5-5.65-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.64.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.65-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.64.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.85.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.64.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 328 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: Running task 1092 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 1093 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Started
NOTE: Running task 1094 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_fetch)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1099 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.65-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_write_config: Started
NOTE: Running task 1100 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_write_config: Started
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 332 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.15.bb:do_packagedata_setscene)
NOTE: Running task 1101 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 1102 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 1103 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Started
NOTE: Running task 1104 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_unpack)
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_fetch: Started
NOTE: recipe bluez5-5.65-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 337 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 338 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_write_config: Succeeded
NOTE: Running task 1109 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_unpack)
NOTE: Running task 1110 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_write_config: Succeeded
NOTE: Running setscene task 347 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running task 1129 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_unpack)
NOTE: Running task 1130 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe flac-1.4.0-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: recipe flac-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: Running setscene task 356 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Started
NOTE: Running setscene task 357 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1140 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.15-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 361 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 1149 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: Running task 1150 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_unpack)
NOTE: recipe libxft-1_2.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Started
NOTE: recipe harfbuzz-5.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-5.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_unpack: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 365 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1151 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_unpack: Started
NOTE: Running task 1152 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 1153 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 1154 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_patch)
NOTE: Running task 1155 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 368 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_unpack: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 372 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 374 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running task 1160 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-5.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 376 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.3.bb:do_packagedata_setscene)
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.64.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: Running task 1166 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_patch)
NOTE: recipe xkeyboard-config-2.37-r0: task do_package_setscene: Started
NOTE: recipe libxft-1_2.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 383 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 385 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package_setscene: Started
NOTE: recipe harfbuzz-5.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 388 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 393 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_patch: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1195 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 396 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 399 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1200 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_patch)
NOTE: Running task 1201 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: Running task 1202 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: Running task 1203 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1204 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_patch)
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_patch: Started
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1205 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 404 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1210 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1211 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_populate_lic)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Started
NOTE: Running task 1216 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_patch)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.0-r0: task do_patch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 413 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_populate_lic: Started
NOTE: Running setscene task 419 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1239 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_package_setscene: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 433 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_populate_lic unihash changed to 52fc9b8978ec90ab8618d17801366157935e728e1e8c61a87a305318660da278
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1296 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 450 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 454 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 472 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 482 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 485 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 490 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 492 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 502 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1359 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1360 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1361 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 506 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 509 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 513 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 519 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 521 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 528 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 533 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 538 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1411 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1412 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 551 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 564 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 565 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 568 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 572 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 574 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 611 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 614 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 636 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 640 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 650 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2073 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2143 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2217 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2239 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2259 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_packagedata)
NOTE: Running task 2261 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2262 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2263 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2274 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2306 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2313 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2314 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe flac-1.4.0-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2315 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: Running task 2316 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2317 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2318 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure)
NOTE: recipe xkeyboard-config-2.37-r0: task do_packagedata: Succeeded
NOTE: Running task 2319 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Started
NOTE: Running task 2320 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 2321 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2322 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Succeeded
NOTE: Running task 2323 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2324 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 2325 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 2326 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot)
NOTE: Running task 2327 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_package)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2328 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2329 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2330 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2331 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 2332 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2333 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Succeeded
NOTE: Running task 2334 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2335 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Succeeded
NOTE: Running task 2336 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2337 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_populate_sysroot)
NOTE: Running task 2338 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Started
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2339 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_compile)
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2340 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2341 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2342 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2343 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2344 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: Running task 2345 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2346 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2347 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2348 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2349 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2350 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2351 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: Running task 2352 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe flac-1.4.0-r0: task do_configure: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: Running task 2353 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_compile)
NOTE: recipe flac-1.4.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2355 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2356 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_install)
NOTE: recipe libwebp-1.2.4-r0: task do_install: Started
NOTE: recipe libwebp-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2357 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2358 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_package)
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.4-r0: task do_package: Started
NOTE: Running task 2359 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2360 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2361 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: Running task 2362 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_compile)
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Started
NOTE: recipe flac-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2363 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_install)
NOTE: recipe libwebp-1.2.4-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Failed
NOTE: recipe flac-1.4.0-r0: task do_install: Started
NOTE: recipe flac-1.4.0-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2363 tasks of which 2246 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 127 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-src went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-dbg went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-xlib went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-ptest went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-staticdev went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-dev went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-doc went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-bin went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ab went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-af went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ang went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ar went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-as went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ast went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-az went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-be went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-be+latin went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bg went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bn-in went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-br went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bs went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ca went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ca+valencia went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-crh went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-cs went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-csb went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-cy went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-da went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-de went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-dz went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-el went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-en+shaw went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-en-ca went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-en-gb went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-eo went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-es went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-et went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-eu went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fa went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fur went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ga went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-gl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-gu went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-he went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hu went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hy went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ia went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-id went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-io went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-is went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-it went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ja went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ka went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-kk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-km went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-kn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ko went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ku went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-li went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-lt went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-lv went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mai went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ml went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ms went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-my went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nb went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nds went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ne went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nso went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-oc went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-or went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pa went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ps went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pt went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pt-br went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ro went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ru went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-si went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sq went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sr+ije went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sr+latin went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sv went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ta went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-te went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tg went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-th went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tt went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ug went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-uk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-uz went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-vi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-wa went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-xh went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-yi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-zh-cn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-zh-hk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-zh-tw went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-ani went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-bmp went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-gif went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-icns went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-ico went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-pnm went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-qtif went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-tga went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-xbm went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-xpm went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gdk-pixbuf/2.42.9-r0/temp/log.do_packagedata.1547839
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata) failed with exit code '1'

--===============7468774591409626364==
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
meta-yocto-bsp       = "tmp-auh-upgrades:9c5d2a50dfd6b97126d135cf899b06c3191bb6f5"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 68 Local 22 Mirrors 0 Missed 46 Current 612 (32% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1770 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_fetch)
NOTE: Running task 1866 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1935 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_write_config)
NOTE: Running task 2058 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 2125 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_fetch)
NOTE: Running task 2126 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2127 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2132 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_install)
NOTE: Running task 2138 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: Running task 2174 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_fetch)
NOTE: Running task 2233 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_fetch)
NOTE: Running task 2234 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2258 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_write_config)
NOTE: Running task 2281 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Started
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Started
NOTE: Running task 2284 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_unpack)
NOTE: Running task 2285 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_fetch: Started
NOTE: Running task 2286 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2287 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_write_config: Started
NOTE: Running task 2288 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: Running task 2289 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_unpack)
NOTE: Running task 2290 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2291 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2292 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Succeeded
NOTE: Running task 2293 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2294 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_unpack)
NOTE: Running task 2295 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_write_config: Succeeded
NOTE: Running task 2296 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2297 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2298 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_patch)
NOTE: Running task 2299 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 2300 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 2301 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 2302 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: Running task 2303 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2304 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_patch)
NOTE: Running task 2305 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2306 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 2307 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2308 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 2309 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Started
NOTE: Running task 2310 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_populate_lic unihash changed to 52fc9b8978ec90ab8618d17801366157935e728e1e8c61a87a305318660da278
NOTE: Running task 2311 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2312 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Succeeded
NOTE: Running task 2313 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2314 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2315 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2316 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2317 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2318 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2319 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: Running task 2320 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: Running task 2321 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2322 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2323 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 2324 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_package)
NOTE: recipe flac-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.0-r0: task do_package: Started
NOTE: recipe flac-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2325 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2326 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2327 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Succeeded
NOTE: Running task 2328 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2329 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Started
NOTE: recipe flac-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2330 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_packagedata)
NOTE: recipe flac-1.4.0-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2331 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2332 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2333 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2334 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Succeeded
NOTE: Running task 2335 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2336 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Started
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2337 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_compile)
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2338 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: Running task 2339 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2340 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2341 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2342 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_populate_sysroot)
NOTE: Running task 2343 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2344 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2345 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2346 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2347 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: Running task 2348 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2349 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2350 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2351 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2352 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2353 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2355 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2356 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_install)
NOTE: recipe libwebp-1.2.4-r0: task do_install: Started
NOTE: recipe libwebp-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2357 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2358 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_package)
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_package: Started
NOTE: Running task 2359 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2360 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2361 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_packagedata)
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Succeeded
NOTE: Running task 2362 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2363 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: Running task 2364 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_compile)
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Failed
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2364 tasks of which 2269 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 127 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-src went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-dbg went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-xlib went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-ptest went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-staticdev went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-dev went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-doc went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-bin went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ab went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-af went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ang went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ar went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-as went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ast went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-az went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-be went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-be+latin went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bg went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bn-in went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-br went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bs went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ca went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ca+valencia went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-crh went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-cs went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-csb went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-cy went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-da went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-de went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-dz went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-el went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-en+shaw went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-en-ca went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-en-gb went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-eo went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-es went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-et went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-eu went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fa went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fur went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ga went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-gl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-gu went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-he went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hu went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hy went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ia went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-id went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-io went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-is went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-it went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ja went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ka went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-kk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-km went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-kn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ko went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ku went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-li went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-lt went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-lv went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mai went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ml went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ms went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-my went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nb went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nds went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ne went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nso went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-oc went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-or went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pa went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ps went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pt went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pt-br went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ro went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ru went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-si went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sq went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sr+ije went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sr+latin went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sv went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ta went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-te went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tg went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-th went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tt went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ug went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-uk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-uz went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-vi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-wa went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-xh went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-yi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-zh-cn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-zh-hk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-zh-tw went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-ani went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-bmp went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-gif went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-icns went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-ico went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-pnm went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-qtif went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-tga went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-xbm went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-xpm went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gdk-pixbuf/2.42.9-r0/temp/log.do_packagedata.1060276
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata) failed with exit code '1'

--===============7468774591409626364==
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
meta-yocto-bsp       = "tmp-auh-upgrades:9c5d2a50dfd6b97126d135cf899b06c3191bb6f5"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 73 Local 23 Mirrors 0 Missed 50 Current 617 (31% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 649 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_packagedata_setscene)
NOTE: Running task 1782 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_fetch)
NOTE: Running task 1877 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1947 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_write_config)
NOTE: Running task 2074 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 2149 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_fetch)
NOTE: Running task 2150 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2151 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2156 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_install)
NOTE: recipe pango-1.50.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Started
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Succeeded
NOTE: Running task 2160 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_unpack)
NOTE: Running task 2161 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2162 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2163 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2164 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: Running task 2167 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: Running task 2209 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_unpack)
NOTE: Running task 2210 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2211 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2214 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_fetch)
NOTE: Running task 2239 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_compile)
NOTE: Running task 2273 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_packagedata)
NOTE: recipe flac-1.4.0-r0: task do_install: Started
NOTE: Running task 2274 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_fetch)
NOTE: Running task 2275 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2276 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2277 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: Running task 2302 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_write_config)
NOTE: Running task 2323 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_write_config)
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Started
NOTE: Running task 2326 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2327 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: Running task 2328 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2329 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_patch)
NOTE: Running task 2330 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_unpack)
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_write_config: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2331 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Started
NOTE: Running task 2332 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 2333 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 2334 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: Running task 2335 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: Running task 2336 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_patch)
NOTE: Running task 2337 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: Running task 2338 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 2339 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2340 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 2341 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2342 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_populate_lic unihash changed to 52fc9b8978ec90ab8618d17801366157935e728e1e8c61a87a305318660da278
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: Running task 2343 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 2344 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Succeeded
NOTE: Running task 2345 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 2346 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2347 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2348 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: Running task 2349 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2350 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2351 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: Running task 2352 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2353 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2354 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2355 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe flac-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2356 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 2357 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_package)
NOTE: recipe flac-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.0-r0: task do_package: Started
NOTE: recipe flac-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2358 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2359 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Succeeded
NOTE: Running task 2360 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2361 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2362 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2363 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2364 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe flac-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_packagedata)
NOTE: recipe flac-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Succeeded
NOTE: Running task 2366 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Started
NOTE: Running task 2367 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2368 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2369 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2370 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 2371 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2372 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_compile)
NOTE: Running task 2373 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install_ptest_base)
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2374 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_populate_sysroot)
NOTE: Running task 2375 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2376 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2377 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2378 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2379 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2380 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2381 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2383 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: Running task 2384 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2385 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2386 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2387 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2388 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2389 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2390 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2391 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_install)
NOTE: recipe libwebp-1.2.4-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2392 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2393 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_package)
NOTE: recipe libwebp-1.2.4-r0: task do_package: Started
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 2394 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2395 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2396 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2397 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_packagedata)
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Succeeded
NOTE: Running task 2398 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2399 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_package: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2399 tasks of which 2299 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 127 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-src went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-dbg went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-xlib went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-ptest went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-staticdev went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-dev went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-doc went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-bin went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ab went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-af went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ang went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ar went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-as went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ast went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-az went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-be went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-be+latin went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bg went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bn-in went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-br went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bs went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ca went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ca+valencia went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-crh went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-cs went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-csb went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-cy went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-da went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-de went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-dz went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-el went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-en+shaw went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-en-ca went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-en-gb went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-eo went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-es went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-et went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-eu went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fa went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fur went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ga went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-gl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-gu went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-he went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hu went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hy went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ia went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-id went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-io went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-is went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-it went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ja went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ka went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-kk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-km went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-kn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ko went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ku went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-li went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-lt went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-lv went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mai went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ml went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ms went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-my went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nb went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nds went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ne went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nso went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-oc went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-or went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pa went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ps went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pt went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pt-br went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ro went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ru went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-si went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sq went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sr+ije went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sr+latin went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sv went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ta went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-te went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tg went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-th went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tt went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ug went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-uk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-uz went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-vi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-wa went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-xh went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-yi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-zh-cn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-zh-hk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-zh-tw went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-ani went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-bmp went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-gif went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-icns went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-ico went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-pnm went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-qtif went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-tga went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-xbm went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-xpm went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gdk-pixbuf/2.42.9-r0/temp/log.do_packagedata.1347473
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata) failed with exit code '1'

--===============7468774591409626364==
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
meta-yocto-bsp       = "tmp-auh-upgrades:9c5d2a50dfd6b97126d135cf899b06c3191bb6f5"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 72 Local 22 Mirrors 0 Missed 50 Current 622 (30% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 653 of 694 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.10.bb:do_packagedata_setscene)
NOTE: Running task 1784 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_fetch)
NOTE: Running task 1884 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1965 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_write_config)
NOTE: Running task 2092 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 2167 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2168 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_fetch)
NOTE: Running task 2169 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2173 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_compile)
NOTE: Running task 2179 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: Running task 2223 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_fetch)
NOTE: Running task 2248 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_compile)
NOTE: Running task 2281 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_packagedata)
NOTE: Running task 2282 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_fetch)
NOTE: Running task 2283 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2308 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_write_config)
NOTE: Running task 2329 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_write_config)
NOTE: recipe pango-1.50.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Started
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2332 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_unpack)
NOTE: Running task 2333 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe flac-1.4.0-r0: task do_compile: Started
NOTE: Running task 2334 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2335 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2336 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: Running task 2337 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2338 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_unpack)
NOTE: Running task 2339 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Started
NOTE: Running task 2340 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2341 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Started
NOTE: Running task 2342 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2343 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2344 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_unpack)
NOTE: Running task 2345 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2347 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 2348 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 2349 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2350 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: Running task 2351 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: Running task 2352 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: Running task 2353 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Started
NOTE: Running task 2354 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 2355 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2356 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2357 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_populate_lic)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 2358 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Running task 2359 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb:do_populate_lic unihash changed to 52fc9b8978ec90ab8618d17801366157935e728e1e8c61a87a305318660da278
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 2360 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 2361 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 2362 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_patch: Succeeded
NOTE: Running task 2363 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_patch: Succeeded
NOTE: Running task 2364 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2365 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2366 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: Running task 2367 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2368 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2369 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: Running task 2370 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2371 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2372 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure: Succeeded
NOTE: Running task 2373 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2374 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2375 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe flac-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe flac-1.4.0-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2377 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2378 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 2380 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_package)
NOTE: recipe flac-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.0-r0: task do_package: Started
NOTE: recipe flac-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2381 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2383 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_compile)
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: Running task 2385 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_compile: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2386 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_install)
NOTE: Running task 2387 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_install: Started
NOTE: Running task 2388 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile: Succeeded
NOTE: Running task 2389 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2390 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2391 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_install: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: Running task 2392 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_populate_sysroot)
NOTE: Running task 2393 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_package: Started
NOTE: recipe flac-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2394 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2395 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe flac-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe flac-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2396 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install: Succeeded
NOTE: Running task 2397 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2398 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2399 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2400 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_populate_sysroot)
NOTE: Running task 2401 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2402 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2403 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: Running task 2404 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2405 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2406 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2407 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2408 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2409 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_install)
NOTE: recipe libwebp-1.2.4-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 2410 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2411 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2412 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_package)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2413 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.4-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2414 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_packagedata)
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2415 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata: Started
NOTE: Running task 2416 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata: Failed
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2416 tasks of which 2316 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 127 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-src went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-dbg went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-xlib went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-ptest went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-staticdev went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-dev went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-doc went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-bin went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ab went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-af went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ang went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ar went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-as went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ast went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-az went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-be went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-be+latin went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bg went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bn-in went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-br went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-bs went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ca went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ca+valencia went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-crh went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-cs went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-csb went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-cy went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-da went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-de went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-dz went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-el went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-en+shaw went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-en-ca went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-en-gb went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-eo went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-es went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-et went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-eu went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fa went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-fur went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ga went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-gl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-gu went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-he went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hu went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-hy went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ia went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-id went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-io went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-is went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-it went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ja went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ka went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-kk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-km went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-kn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ko went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ku went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-li went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-lt went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-lv went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mai went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ml went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-mr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ms went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-my went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nb went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nds went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ne went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-nso went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-oc went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-or went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pa went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ps went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pt went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-pt-br went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ro went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ru went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-si went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sl went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sq went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sr+ije went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sr+latin went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-sv went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ta went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-te went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tg went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-th went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tr went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-tt went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-ug went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-uk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-uz went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-vi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-wa went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-xh went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-yi went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-zh-cn went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-zh-hk went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-locale-zh-tw went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-ani went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-bmp went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-gif went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-icns went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-ico went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-pnm went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-qtif went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-tga went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-xbm went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: QA Issue: Package version for package gdk-pixbuf-loader-xpm went backwards which would break package feeds (from 0:2.42.10-r0 to 0:2.42.9-r0) [version-going-backwards]
ERROR: gdk-pixbuf-2.42.9-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gdk-pixbuf/2.42.9-r0/temp/log.do_packagedata.697346
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata) failed with exit code '1'

--===============7468774591409626364==--

