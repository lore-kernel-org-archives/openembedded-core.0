Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213E7C3276A
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.3934.1659679406814789988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TfM6Vt0r;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101826c99fffd-b3b9d5e8-6a95-48b9-a477-47d7112e86c1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jr24/9Wm1JHx6mXiZ3mzQ8rZzvGJLtG6byVqfQ/rcN8=;
	b=TfM6Vt0r7DOe3Z9rQ9tRb1cxpYgMhkA1vKHE7k12HQKJWQO8jljtj8JbmMRevUq7
	KrS0bpYUqv/9HSAhGFwsbZ5W4XWOQaAOgczCZu2kDGw6qvFz5KEeiy7mCVCJ6R4pg7i
	NlI911VdknnPgYwS4kzmmWQjUmPOfuxczhUSobbE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jr24/9Wm1JHx6mXiZ3mzQ8rZzvGJLtG6byVqfQ/rcN8=;
	b=cu9ozqY6f/KdpE178pE8QftRH0bXxQAbOH3TaoZlon+ON73Cx9aA+O33u6sh0rjz
	HaX3UKCt7XdJQUdl2zw2SL8uAIzxl9j8ndRbTt2SU+9Bbg6T1T9AsWh6yXpXd5+pY+u
	Iz3O+jFc81MJRbLos99nHAF2QAgeb7Xq5/A7J4X4=
Content-Type: multipart/mixed; boundary="===============9098923305076568625=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 22.1.5 SUCCEEDED
Message-ID: 
 <010101826c99fffd-b3b9d5e8-6a95-48b9-a477-47d7112e86c1-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:28 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168905

--===============9098923305076568625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mesa* to *22.1.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-upgrade-22.1.3-22.1.5.patch
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
--===============9098923305076568625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mesa: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa: SRC_URI changed from "https://mesa.freedesktop.org/archive/mesa-22.1.3.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0002-meson.build-make-TLS-ELF-optional.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch file://0001-util-format-Check-for-NEON-before-using-it.patch file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch" to "https://mesa.freedesktop.org/archive/mesa-22.1.5.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0002-meson.build-make-TLS-ELF-optional.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch file://0001-util-format-Check-for-NEON-before-using
 -it.patch file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
packages/core2-32-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libegl-mesa-dev: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libegl-mesa: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libegl-mesa: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libgbm-dev: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libgbm-dev: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libgbm: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libgbm: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libgl-mesa-dev: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libgl-mesa: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libgl-mesa: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libglapi-dev: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libglapi-dev: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libglapi: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libglapi: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libgles1-mesa-dev: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libgles1-mesa: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libgles1-mesa: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libgles2-mesa-dev: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libgles2-mesa: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libgles2-mesa: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libgles3-mesa-dev: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libgles3-mesa-dev: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libgles3-mesa: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libgles3-mesa: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libopencl-mesa-dev: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libopencl-mesa-dev: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libopencl-mesa: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libopencl-mesa: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libosmesa-dev: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libosmesa-dev: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libosmesa: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libosmesa: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libxatracker-dev: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libxatracker-dev: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/libxatracker: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/libxatracker: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/mesa-dbg: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/mesa-dbg: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 123389896 to 123396708 (+0%)
packages/core2-32-poky-linux/mesa/mesa-dev: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/mesa-dev: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/mesa-doc: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/mesa-doc: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/mesa-locale: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/mesa-locale: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/mesa-megadriver: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/mesa-megadriver: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 15773687 to 15777783 (+0%)
packages/core2-32-poky-linux/mesa/mesa-src: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/mesa-src: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/mesa-src: PKGSIZE changed from 87181019 to 87187495 (+0%)
packages/core2-32-poky-linux/mesa/mesa-staticdev: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/mesa-staticdev: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/mesa-vdpau-drivers: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/mesa-vdpau-drivers: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "22.1.3" to "22.1.5"
packages/core2-32-poky-linux/mesa/mesa: PKGV changed from 22.1.3 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/mesa/mesa: PV changed from "22.1.3" to "22.1.5"

--===============9098923305076568625==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-upgrade-22.1.3-22.1.5.patch"

RnJvbSBiZDE5NGI5NTY3ZDMyOTBkZDhlMWI1YTgxMDI4M2YxZTJjNTI5YjVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNSBBdWcgMjAyMiAwMToxNTo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c2E6IHVwZ3JhZGUgMjIuMS4zIC0+IDIyLjEuNQoKLS0tCiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
bWVzYS9tZXNhLmluYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL21lc2Eve21lc2FfMjIuMS4zLmJiID0+IG1lc2FfMjIuMS41LmJifSB8IDAK
IDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS97bWVzYV8yMi4xLjMuYmIgPT4gbWVzYV8yMi4xLjUu
YmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2Eu
aW5jIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMKaW5kZXggZjAyZWYyZGMy
Yi4uODM4YjIwZDk0ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVz
YS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMKQEAgLTI1LDcg
KzI1LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL21lc2EuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmUv
bWVzYS0ke1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1uaXItbmlyX29wdF9t
b3ZlLWZpeC1BTFdBWVNfSU5MSU5FLWNvbXBpbGVyLWVycm9yLnBhdGNoIFwKICAgICAgICAgICAg
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjk4ZjMyYmE3YWEyYTFmZjU3MjVmYjM2ZWI5OTlj
NjkzMDc5ZjBjYTE2ZjcwYWEyZjEwM2UyYjZjM2YwOTNlMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI2ZmQ2MGQzOGVmZGQyNTMxNzk0OGM2MTQ5NGI1MTE3ZTAxZDQyZGE2OTUyNzg3MjhiMWZhZWY5
ZjVmOWE0N2JhIgogCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJtZXNhLSg/UDxwdmVy
PlxkKyhcLlxkKykrKSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2Ev
bWVzYV8yMi4xLjMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhXzIyLjEuNS5i
YgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L21lc2EvbWVzYV8yMi4xLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNh
L21lc2FfMjIuMS41LmJiCi0tIAoyLjMxLjEKCg==

--===============9098923305076568625==--

