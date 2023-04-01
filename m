Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE49C7EE2C
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:02 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.32133.1680384535534334145
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ditCeta0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101873eb92d45-53d88c8c-422c-4005-8f9b-f4efaca09782-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384536;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=sJ9JlzJMa8ujpZPb1UaEDW6P4oRbc9ySRgN8rqlo20k=;
	b=ditCeta0JitHj33TbNZq8at7TgUu+LCu4wbF9qsroSKDQs1tlJjz7Hwl45lQd09i
	+pQGSGfizDE4qauzNkmjC/Gf7GO8Mdl3qNXqnKfZ+9mk1+RDLEpP9zXULUo5ZpFiE4F
	0FoVHTCtLVGvqcEbl1V72rKIAMKBM/NTA4JzIqHk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384536;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=sJ9JlzJMa8ujpZPb1UaEDW6P4oRbc9ySRgN8rqlo20k=;
	b=HuVvJOJgXDJLZPNjaxk/uyzOeQC+SNYgx+zXEgQ/b9xBrKqEF34PDfMIBXDjz/Nj
	Wk3JYZA3ddOCybRtCMxowzWjtB7BkuL035mHTContarRDCMjwW6Y2I2EvGwWNFTer3o
	AWPqKJuihnLhFW7caiCTOjvI4mLuF9ZCMPWGPIZA=
Content-Type: multipart/mixed; boundary="===============5108447738234464606=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xwayland: upgrading to 23.1.1 SUCCEEDED
Message-ID: <010101873eb92d45-53d88c8c-422c-4005-8f9b-f4efaca09782-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179543

--===============5108447738234464606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xwayland* to *23.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-22.1.8-23.1.1.patch
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
--===============5108447738234464606==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-22.1.8-23.1.1.patch"

RnJvbSA0NTBiN2NmNWE1MTc5YzljYjBlODM1NTJhNzU2MGEyZTBiNzliNTFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxODowODo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHh3
YXlsYW5kOiB1cGdyYWRlIDIyLjEuOCAtPiAyMy4xLjEKCi0tLQogLi4uL3h3YXlsYW5kL3t4d2F5
bGFuZF8yMi4xLjguYmIgPT4geHdheWxhbmRfMjMuMS4xLmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5kL3t4d2F5bGFuZF8yMi4xLjguYmIgPT4geHdheWxhbmRf
MjMuMS4xLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94d2F5
bGFuZC94d2F5bGFuZF8yMi4xLjguYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQv
eHdheWxhbmRfMjMuMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yMi4xLjguYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yMy4xLjEuYmIKaW5kZXggNjkx
OWJhNDIxYi4uYTA2NWU5MmYwMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3
YXlsYW5kL3h3YXlsYW5kXzIyLjEuOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdh
eWxhbmQveHdheWxhbmRfMjMuMS4xLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ0VOU0UgPSAiTUlU
IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NWRmODc5NTBhZjUxYWMy
YzU4MjIwOTQ1NTNlYTE4ODAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cueC5vcmcvYXJjaGl2
ZS9pbmRpdmlkdWFsL3hzZXJ2ZXIveHdheWxhbmQtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImQxMWVlZWU3MzI5MGI4OGVhOGRhNDJhN2Q5MzUwZGVkZmFiYTg1NmNlNGFlNDRl
NThjMDQ1YWQ5ZWNhYTJmNzMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmI5NDYxZjVjYjlmZWE1
ZTA3ZTkxODgyMzExYjBjODhiNDNlODg0M2IwMTdlYmFjMDVlYjVhZjY5YWEzNGMxNSIKIAogVVBT
VFJFQU1fQ0hFQ0tfUkVHRVggPSAieHdheWxhbmQtKD9QPHB2ZXI+XGQrKFwuKD8hOTBcZClcZCsp
KylcLnRhciIKIAotLSAKMi4zOS4yCgo=

--===============5108447738234464606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xwayland: PV changed from "22.1.8" to "23.1.1"
packages/core2-32-poky-linux/xwayland: PKGV changed from 22.1.8 [default] to 23.1.1 [default]
packages/core2-32-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-22.1.8.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-23.1.1.tar.xz"
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PV changed from "22.1.8" to "23.1.1"
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGV changed from 22.1.8 [default] to 23.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 10282140 to 10376940 (+1%)
packages/core2-32-poky-linux/xwayland/xwayland-dev: PV changed from "22.1.8" to "23.1.1"
packages/core2-32-poky-linux/xwayland/xwayland-dev: PKGV changed from 22.1.8 [default] to 23.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dev: PKGSIZE changed from 282 to 478 (+70%)
packages/core2-32-poky-linux/xwayland/xwayland-doc: PV changed from "22.1.8" to "23.1.1"
packages/core2-32-poky-linux/xwayland/xwayland-doc: PKGV changed from 22.1.8 [default] to 23.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland-doc: PKGSIZE changed from 28835 to 30269 (+5%)
packages/core2-32-poky-linux/xwayland/xwayland-locale: PV changed from "22.1.8" to "23.1.1"
packages/core2-32-poky-linux/xwayland/xwayland-locale: PKGV changed from 22.1.8 [default] to 23.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland-src: PV changed from "22.1.8" to "23.1.1"
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGV changed from 22.1.8 [default] to 23.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8604658 to 8710479 (+1%)
packages/core2-32-poky-linux/xwayland/xwayland-src: FILELIST: directory renamed /usr/src/debug/xwayland/22.1.8-r0/xfixes -> /usr/src/debug/xwayland/23.1.1-r0/xfixes, directory renamed /usr/src/debug/xwayland/22.1.8-r0/damageext -> /usr/src/debug/xwayland/23.1.1-r0/damageext, directory renamed /usr/src/debug/xwayland/22.1.8-r0/include -> /usr/src/debug/xwayland/23.1.1-r0/include, directory renamed /usr/src/debug/xwayland/22.1.8-r0/glx -> /usr/src/debug/xwayland/23.1.1-r0/glx, directory renamed /usr/src/debug/xwayland/22.1.8-r0/miext/sync -> /usr/src/debug/xwayland/23.1.1-r0/miext/sync, directory renamed /usr/src/debug/xwayland/22.1.8-r0/os -> /usr/src/debug/xwayland/23.1.1-r0/os, directory renamed /usr/src/debug/xwayland/22.1.8-r0/present -> /usr/src/debug/xwayland/23.1.1-r0/present, directory renamed /usr/src/debug/xwayland/22.1.8-r0/miext/damage -> /usr/src/debug/xwayland/23.1.1-r0/miext/damage, directory renamed /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland -> /usr/src/debug/xwayla
 nd/23.1.1-r0/hw/xwayland, directory renamed /usr/src/debug/xwayland/22.1.8-r0/dix -> /usr/src/debug/xwayland/23.1.1-r0/dix, directory renamed /usr/src/debug/xwayland/22.1.8-r0/mi -> /usr/src/debug/xwayland/23.1.1-r0/mi, directory renamed /usr/src/debug/xwayland/22.1.8-r0/randr -> /usr/src/debug/xwayland/23.1.1-r0/randr, directory renamed /usr/src/debug/xwayland/22.1.8-r0/glamor -> /usr/src/debug/xwayland/23.1.1-r0/glamor, directory renamed /usr/src/debug/xwayland/22.1.8-r0/dri3 -> /usr/src/debug/xwayland/23.1.1-r0/dri3, directory renamed /usr/src/debug/xwayland/22.1.8-r0/fb -> /usr/src/debug/xwayland/23.1.1-r0/fb, directory renamed /usr/src/debug/xwayland/22.1.8-r0/dbe -> /usr/src/debug/xwayland/23.1.1-r0/dbe, directory renamed /usr/src/debug/xwayland/22.1.8-r0/record -> /usr/src/debug/xwayland/23.1.1-r0/record, directory renamed /usr/src/debug/xwayland/22.1.8-r0/Xi -> /usr/src/debug/xwayland/23.1.1-r0/Xi, directory renamed /usr/src/debug/xwayland/22.1.8-r0/render -> /usr/src/debug/
 xwayland/23.1.1-r0/render, directory renamed /usr/src/debug/xwayland/22.1.8-r0/Xext -> /usr/src/debug/xwayland/23.1.1-r0/Xext, directory renamed /usr/src/debug/xwayland/22.1.8-r0/composite -> /usr/src/debug/xwayland/23.1.1-r0/composite, removed "/usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/tablet-unstable-v2-protocol.c /usr/src/debug/xwayland/22.1.8-r0/xkb/xkbUtils.c /usr/src/debug/xwayland/22.1.8-r0/xkb/xkb.h /usr/src/debug/xwayland/22.1.8-r0/xkb/xkbgeom.h /usr/src/debug/xwayland/22.1.8-r0/xkb/xkb.c /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/xwayland-keyboard-grab-unstable-v1-client-protocol.h /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/xwayland-keyboard-grab-unstable-v1-protocol.c /usr/src/debug/xwayland/22.1.8-r0/xkb/xkbAccessX.c /usr/src/debug/xwayland/22.1.8-r0/xkb/xkbActions.c /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/linux-dmabuf-unstable-v1-client-protocol.h /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/viewpor
 ter-protocol.c /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/xdg-shell-client-protocol.h /usr/src/debug/xwayland/22.1.8-r0/xkb/xkbPrKeyEv.c /usr/src/debug/xwayland/22.1.8-r0/xkb/maprules.c /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/drm-protocol.c /usr/src/debug/xwayland/22.1.8-r0/xkb/XKBMisc.c /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/drm-client-protocol.h /usr/src/debug/xwayland/22.1.8-r0/xkb/ddxKillSrv.c /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/drm-lease-v1-protocol.c /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/tablet-unstable-v2-client-protocol.h /usr/src/debug/xwayland/22.1.8-r0/xkb/ddxPrivate.c /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/viewporter-client-protocol.h /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/pointer-constraints-unstable-v1-client-protocol.h /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/drm-lease-v1-client-protocol.h /usr/src/debug/xwayland/22.1.8-r0/xkb/xk
 mread.c /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/relative-pointer-unstable-v1-client-protocol.h /usr/src/debug/xwayland/22.1.8-r0/xkb/XKBAlloc.c /usr/src/debug/xwayland/22.1.8-r0/xkb/ddxVT.c /usr/src/debug/xwayland/22.1.8-r0/xkb/xkbEvents.c /usr/src/debug/xwayland/22.1.8-r0/xkb/xkbout.c /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/relative-pointer-unstable-v1-protocol.c /usr/src/debug/xwayland/22.1.8-r0/xkb/ddxCtrls.c /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/xdg-shell-protocol.c /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/linux-dmabuf-unstable-v1-protocol.c /usr/src/debug/xwayland/22.1.8-r0/xkb/xkbDflts.h /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/pointer-gestures-unstable-v1-client-protocol.h /usr/src/debug/xwayland/22.1.8-r0/xkb/XKBGAlloc.c /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/xdg-output-unstable-v1-protocol.c /usr/src/debug/xwayland/22.1.8-r0/xkb/XKBMAlloc.c /usr/src/debug/xwayland/22.1.8-r
 0/xkb/xkbfmisc.c /usr/src/debug/xwayland/22.1.8-r0/xkb/ddxLEDs.c /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/pointer-gestures-unstable-v1-protocol.c /usr/src/debug/xwayland/22.1.8-r0/xkb/xkbLEDs.c /usr/src/debug/xwayland/22.1.8-r0/xkb/xkbSwap.c /usr/src/debug/xwayland/22.1.8-r0/xkb/ddxBeep.c /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/xdg-output-unstable-v1-client-protocol.h /usr/src/debug/xwayland/22.1.8-r0/xkb/ddxLoad.c /usr/src/debug/xwayland/22.1.8-r0/xkb/xkbInit.c /usr/src/debug/xwayland/22.1.8-r0/xkb/xkbtext.c /usr/src/debug/xwayland/22.1.8-r0/hw/xwayland/Xwayland.p/pointer-constraints-unstable-v1-protocol.c", added "/usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/tablet-unstable-v2-protocol.c /usr/src/debug/xwayland/23.1.1-r0/xkb/xkbUtils.c /usr/src/debug/xwayland/23.1.1-r0/xkb/xkbgeom.h /usr/src/debug/xwayland/23.1.1-r0/xkb/xkb.c /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/xwayland-keyboard-grab-unstable-v1-client-protocol.h /u
 sr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/xwayland-keyboard-grab-unstable-v1-protocol.c /usr/src/debug/xwayland/23.1.1-r0/xkb/xkbAccessX.c /usr/src/debug/xwayland/23.1.1-r0/xkb/xkbActions.c /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/linux-dmabuf-unstable-v1-client-protocol.h /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/viewporter-protocol.c /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/xdg-shell-client-protocol.h /usr/src/debug/xwayland/23.1.1-r0/xkb/xkbPrKeyEv.c /usr/src/debug/xwayland/23.1.1-r0/xkb/maprules.c /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/drm-protocol.c /usr/src/debug/xwayland/23.1.1-r0/xkb/XKBMisc.c /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/drm-client-protocol.h /usr/src/debug/xwayland/23.1.1-r0/xkb/ddxKillSrv.c /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/drm-lease-v1-protocol.c /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/tablet-unstable-v2-client-protocol.h /usr/
 src/debug/xwayland/23.1.1-r0/xkb/ddxPrivate.c /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/viewporter-client-protocol.h /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/pointer-constraints-unstable-v1-client-protocol.h /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/drm-lease-v1-client-protocol.h /usr/src/debug/xwayland/23.1.1-r0/xkb/xkb-procs.h /usr/src/debug/xwayland/23.1.1-r0/xkb/xkmread.c /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/relative-pointer-unstable-v1-client-protocol.h /usr/src/debug/xwayland/23.1.1-r0/xkb/XKBAlloc.c /usr/src/debug/xwayland/23.1.1-r0/xkb/ddxVT.c /usr/src/debug/xwayland/23.1.1-r0/xkb/xkbEvents.c /usr/src/debug/xwayland/23.1.1-r0/xkb/xkbout.c /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/relative-pointer-unstable-v1-protocol.c /usr/src/debug/xwayland/23.1.1-r0/xkb/ddxCtrls.c /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/keyboard-shortcuts-inhibit-unstable-v1-client-protocol.h /usr/src/debug/x
 wayland/23.1.1-r0/hw/xwayland/Xwayland.p/xdg-shell-protocol.c /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/linux-dmabuf-unstable-v1-protocol.c /usr/src/debug/xwayland/23.1.1-r0/xkb/xkbDflts.h /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/pointer-gestures-unstable-v1-client-protocol.h /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/keyboard-shortcuts-inhibit-unstable-v1-protocol.c /usr/src/debug/xwayland/23.1.1-r0/xkb/XKBGAlloc.c /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/xdg-output-unstable-v1-protocol.c /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/xwayland-shell-v1-client-protocol.h /usr/src/debug/xwayland/23.1.1-r0/xkb/XKBMAlloc.c /usr/src/debug/xwayland/23.1.1-r0/xkb/xkbfmisc.c /usr/src/debug/xwayland/23.1.1-r0/xkb/ddxLEDs.c /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/pointer-gestures-unstable-v1-protocol.c /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/xwayland-shell-v1-protocol.c /usr/src/debug/xwa
 yland/23.1.1-r0/xkb/xkbLEDs.c /usr/src/debug/xwayland/23.1.1-r0/xkb/xkbSwap.c /usr/src/debug/xwayland/23.1.1-r0/xkb/ddxBeep.c /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/xdg-output-unstable-v1-client-protocol.h /usr/src/debug/xwayland/23.1.1-r0/xkb/ddxLoad.c /usr/src/debug/xwayland/23.1.1-r0/xkb/xkbInit.c /usr/src/debug/xwayland/23.1.1-r0/xkb/xkbtext.c /usr/src/debug/xwayland/23.1.1-r0/hw/xwayland/Xwayland.p/pointer-constraints-unstable-v1-protocol.c"
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PV changed from "22.1.8" to "23.1.1"
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 22.1.8 [default] to 23.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland: PV changed from "22.1.8" to "23.1.1"
packages/core2-32-poky-linux/xwayland/xwayland: PKGV changed from 22.1.8 [default] to 23.1.1 [default]
packages/core2-32-poky-linux/xwayland/xwayland: PKGSIZE changed from 2417276 to 2437938 (+1%)
packages/core2-32-poky-linux/xwayland/xwayland: FILELIST: added "/usr/share/applications/org.freedesktop.Xwayland.desktop"

--===============5108447738234464606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/xwayland/xwayland-dev: PKGSIZE changed from 282 to 478 (+70%)
packages/core2-32-poky-linux/xwayland/xwayland: FILELIST: added "/usr/share/applications/org.freedesktop.Xwayland.desktop"

--===============5108447738234464606==--

