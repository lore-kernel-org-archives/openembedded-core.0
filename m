Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465B2C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web12.10520.1663251512770482893
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=W2u72zkf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 0101018341840050-58404ebc-29e3-403c-9895-14a2510a8bb8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AHdkIzKvD9cQbZ+LNCytzmefNVmP7yoPSI5E1jEPNSA=;
	b=W2u72zkfPpKsUo0V3vN0xEmojTuufByME0fMAMTiGVDboN7nziotQsvP6Micn7iD
	t9SkxJnL+A8hjZ2+KCw/VQ/fHyZcEoTeZ/AAxCp4yly1mSZWnUFf3Q4iYPfxpj36rr3
	Ri2aAOUdHVaCSBse7yMaOHjMZv0OQv7TwoNrJtE8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AHdkIzKvD9cQbZ+LNCytzmefNVmP7yoPSI5E1jEPNSA=;
	b=JtMVDLmIHhOjeBEF3s4WqfmPpRcQ52vNeo7K5TMJs+8lvMT/syNGYX9CtnyIyzbR
	6wATAkkd2I5hAu7Zj89vpd8olJiQwO0VvdNdMrUsQUfdvZFmaB/d4lm73tC4OW4ZQ1A
	JnW7JaeuaRMdP2N/nCdsr4LaYqgGXolJXajcWbO8=
Content-Type: multipart/mixed; boundary="===============4712599931409969671=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 22.1.7 SUCCEEDED
Message-ID: 
 <0101018341840050-58404ebc-29e3-403c-9895-14a2510a8bb8-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:33 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170744

--===============4712599931409969671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mesa* to *22.1.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-upgrade-22.1.6-22.1.7.patch
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
--===============4712599931409969671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mesa: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa: SRC_URI changed from "https://mesa.freedesktop.org/archive/mesa-22.1.6.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0002-meson.build-make-TLS-ELF-optional.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch file://0001-util-format-Check-for-NEON-before-using-it.patch file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch" to "https://mesa.freedesktop.org/archive/mesa-22.1.7.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0002-meson.build-make-TLS-ELF-optional.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch file://0001-util-format-Check-for-NEON-before-using
 -it.patch file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
packages/core2-32-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libegl-mesa-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libegl-mesa: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libegl-mesa: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgbm-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgbm-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgbm: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgbm: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgl-mesa-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgl-mesa: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgl-mesa: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libglapi-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libglapi-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libglapi: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libglapi: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgles1-mesa-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgles1-mesa: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgles1-mesa: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgles2-mesa-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgles2-mesa: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgles2-mesa: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgles3-mesa-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgles3-mesa-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgles3-mesa: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgles3-mesa: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libopencl-mesa-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libopencl-mesa-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libopencl-mesa: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libopencl-mesa: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libosmesa-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libosmesa-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libosmesa: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libosmesa: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libxatracker-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libxatracker-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libxatracker: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libxatracker: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 123463980 to 123484676 (+0%)
packages/core2-32-poky-linux/mesa/mesa-dbg: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa-dbg: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa-doc: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa-doc: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa-locale: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa-locale: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa-megadriver: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa-megadriver: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa-src: PKGSIZE changed from 87181988 to 87187458 (+0%)
packages/core2-32-poky-linux/mesa/mesa-src: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa-src: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa-staticdev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa-staticdev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa-vdpau-drivers: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa-vdpau-drivers: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa: PV changed from "22.1.6" to "22.1.7"

--===============4712599931409969671==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-upgrade-22.1.6-22.1.7.patch"

RnJvbSA0OTIyMzllYTZlYzAxYjE5Mzg2OWZiMTg0YjUzMTIwM2JkZmQxMjdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMTE6MDk6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNhOiB1cGdyYWRlIDIyLjEuNiAtPiAyMi4xLjcKCi0tLQogbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L21lc2EvbWVzYS5pbmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy9tZXNhL3ttZXNhXzIyLjEuNi5iYiA9PiBtZXNhXzIyLjEuNy5iYn0gfCAw
CiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2Eve21lc2FfMjIuMS42LmJiID0+IG1lc2FfMjIuMS43
LmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNh
LmluYyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EuaW5jCmluZGV4IGVhN2VkNGZk
MjcuLjcyOWM0NjY1NTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21l
c2EuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EuaW5jCkBAIC0yNSw3
ICsyNSw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9tZXNhLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZl
L21lc2EtJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtbmlyLW5pcl9vcHRf
bW92ZS1maXgtQUxXQVlTX0lOTElORS1jb21waWxlci1lcnJvci5wYXRjaCBcCiAgICAgICAgICAg
ICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIyY2VkMDYxZWI5YWRhYjhlYTM1MzY4MjQ2YzE5
OTVjMDk3MjNmM2Y3MTY1M2NkNTA1MGM1Y2VjMzc2ZTY3MWEiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZGE4MzhlYjJjZjExZDBlMDhkMGU5OTQ0ZjZiZDRkOTY5ODdmZGM1OWVhMjg1NmY4YzcwYTMx
YTgyYjM1NWQ4OSIKIAogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAibWVzYS0oP1A8cHZl
cj5cZCsoXC5cZCspKykiCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNh
L21lc2FfMjIuMS42LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYV8yMi4xLjcu
YmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy9tZXNhL21lc2FfMjIuMS42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVz
YS9tZXNhXzIyLjEuNy5iYgotLSAKMi4zMS4xCgo=

--===============4712599931409969671==--

