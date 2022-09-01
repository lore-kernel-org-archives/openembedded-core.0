Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1F9C6FA9E
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:56 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.12460.1662040786906537459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VYy4WcA4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010182f959c52d-204314c2-c3b3-497c-a319-637647ed7d04-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Q11x5Jb+C9I3yLZK1FcakWUIi93eoqk5Ex/TEWHrue0=;
	b=VYy4WcA4qabFKEpZYTXG30S1Q8zLc2SF1oTmxWw4AT1i7RZxRdHCBNeAkceYKu6J
	XlxHNA65yIS3fg1i3HTXICtdmfIU1sF92SWNfM1xybQ/4iln25qat34HiUjoL0QHHdn
	LcqUfVtMjcHcDUEa1XqYO3iTS68c287P4cWtGD1k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Q11x5Jb+C9I3yLZK1FcakWUIi93eoqk5Ex/TEWHrue0=;
	b=Hro828ZRTWXTebwwnsr3YzV9wF5vfdQjbZ9pwHHe499kDOt8tp80BrjiXYEt9VC2
	27UjP9YUvjGEiHkvlXS4LDehEzjSWKczpgUhpu3qh4ZTGCRXia0zL0d2gAqP8TTtzRH
	IP7Tp8KvbGGaXKgO7vyNc9T1VDFYQEyAc0mMRJX4=
Content-Type: multipart/mixed; boundary="===============1265249706119486512=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 22.1.7 SUCCEEDED
Message-ID: 
 <01010182f959c52d-204314c2-c3b3-497c-a319-637647ed7d04-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170184

--===============1265249706119486512==
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
--===============1265249706119486512==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-upgrade-22.1.6-22.1.7.patch"

RnJvbSBmZTlmMDdjMzZhODkzYmJlMDIzYWY3OTM5ZGIwYzc2MTQzNmM5YTMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAwOTozNDo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c2E6IHVwZ3JhZGUgMjIuMS42IC0+IDIyLjEuNwoKLS0tCiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
bWVzYS9tZXNhLmluYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL21lc2Eve21lc2FfMjIuMS42LmJiID0+IG1lc2FfMjIuMS43LmJifSB8IDAK
IDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS97bWVzYV8yMi4xLjYuYmIgPT4gbWVzYV8yMi4xLjcu
YmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2Eu
aW5jIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMKaW5kZXggZDg1MDI0Njcy
NC4uYzE0YmQ5MGU4MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVz
YS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMKQEAgLTI1LDcg
KzI1LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL21lc2EuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmUv
bWVzYS0ke1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1uaXItbmlyX29wdF9t
b3ZlLWZpeC1BTFdBWVNfSU5MSU5FLWNvbXBpbGVyLWVycm9yLnBhdGNoIFwKICAgICAgICAgICAg
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjJjZWQwNjFlYjlhZGFiOGVhMzUzNjgyNDZjMTk5
NWMwOTcyM2YzZjcxNjUzY2Q1MDUwYzVjZWMzNzZlNjcxYSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICJkYTgzOGViMmNmMTFkMGUwOGQwZTk5NDRmNmJkNGQ5Njk4N2ZkYzU5ZWEyODU2ZjhjNzBhMzFh
ODJiMzU1ZDg5IgogCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJtZXNhLSg/UDxwdmVy
PlxkKyhcLlxkKykrKSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2Ev
bWVzYV8yMi4xLjYuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhXzIyLjEuNy5i
YgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L21lc2EvbWVzYV8yMi4xLjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNh
L21lc2FfMjIuMS43LmJiCi0tIAoyLjMxLjEKCg==

--===============1265249706119486512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mesa: SRC_URI changed from "https://mesa.freedesktop.org/archive/mesa-22.1.6.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0002-meson.build-make-TLS-ELF-optional.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch file://0001-util-format-Check-for-NEON-before-using-it.patch file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch" to "https://mesa.freedesktop.org/archive/mesa-22.1.7.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0002-meson.build-make-TLS-ELF-optional.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch file://0001-util-format-Check-for-NEON-before-using
 -it.patch file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
packages/core2-32-poky-linux/mesa: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libegl-mesa-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libegl-mesa: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libegl-mesa: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgbm-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgbm-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgbm: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgbm: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgl-mesa-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgl-mesa: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgl-mesa: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libglapi-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libglapi-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libglapi: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libglapi: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgles1-mesa-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgles1-mesa: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgles1-mesa: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgles2-mesa-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgles2-mesa: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgles2-mesa: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgles3-mesa-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgles3-mesa-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libgles3-mesa: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libgles3-mesa: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libopencl-mesa-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libopencl-mesa-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libopencl-mesa: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libopencl-mesa: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libosmesa-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libosmesa-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libosmesa: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libosmesa: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libxatracker-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libxatracker-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/libxatracker: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/libxatracker: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 123463988 to 123484684 (+0%)
packages/core2-32-poky-linux/mesa/mesa-dbg: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa-dbg: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa-dev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa-dev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa-doc: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa-doc: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa-locale: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa-locale: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa-megadriver: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa-megadriver: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa-src: PKGSIZE changed from 87181988 to 87187458 (+0%)
packages/core2-32-poky-linux/mesa/mesa-src: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa-src: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa-staticdev: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa-staticdev: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa-vdpau-drivers: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa-vdpau-drivers: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 22.1.6 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/mesa/mesa: PV changed from "22.1.6" to "22.1.7"
packages/core2-32-poky-linux/mesa/mesa: PKGV changed from 22.1.6 [default] to 22.1.7 [default]

--===============1265249706119486512==--

