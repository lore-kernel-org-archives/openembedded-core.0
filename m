Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28C8CD1293
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:23 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2351.1762384574631610807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=H5pZKJA/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=TiB2zlG5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019a564e76bf-89e2029f-b6e3-4385-a28a-062409c0e406-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MIBWnm1PN48G5F+jhsqAICOiddZgIEr6uW3APNil/+c=;
	b=H5pZKJA/wYclmFhZfzlD62UzcRG16aIeSBbXrbsvu1Uip0jjweDsFxHjEr9E4l1N
	K1IDogYjO6LCPRlM0xii9GEZIaKE6ElZKoOOWsFyTVuk392JryOhNxQGcTpyIc7iGK8
	DJ7dox3e7eWc/TN9k9+TYUYR6srUqW0IY354KzAY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MIBWnm1PN48G5F+jhsqAICOiddZgIEr6uW3APNil/+c=;
	b=TiB2zlG5Bp9xMBVIm+0214ygPGTM7gl0D2pz8pUSz+tvfiyWbD7w+1rkv+cNx0au
	AsnoznbCl4CcnYlAmBWxdDgJjznm7myZtFsT+Gsewhdkq1oVFd4aKMBiZmxQPsEQieK
	aQotLvPqO+E8kC78UGyLzB0ad7+tH7D0eLGF4Kpg=
Content-Type: multipart/mixed; boundary="===============7232573060298992288=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] usbutils: upgrading to 019 SUCCEEDED
Message-ID: <0101019a564e76bf-89e2029f-b6e3-4385-a28a-062409c0e406-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225789

--===============7232573060298992288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *usbutils* to *019* has Succeeded.

Next steps:
    - apply the patch: git am 0001-usbutils-upgrade-018-019.patch
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
From a36bb3f118f8ff7aaf89a510586036b05b05ac42 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 14:22:30 +0000
Subject: [PATCH] usbutils: upgrade 018 -> 019

---
 meta/recipes-bsp/usbutils/{usbutils_018.bb => usbutils_019.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/usbutils/{usbutils_018.bb => usbutils_019.bb} (93%)

diff --git a/meta/recipes-bsp/usbutils/usbutils_018.bb b/meta/recipes-bsp/usbutils/usbutils_019.bb
similarity index 93%
rename from meta/recipes-bsp/usbutils/usbutils_018.bb
rename to meta/recipes-bsp/usbutils/usbutils_019.bb
index b96a1b4f19..6aa5c5f5c2 100644
--- a/meta/recipes-bsp/usbutils/usbutils_018.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_019.bb
@@ -15,7 +15,7 @@ DEPENDS = "libusb1 virtual/libiconv udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
           "
-SRC_URI[sha256sum] = "0048d2d8518fb0cc7c0516e16e52af023e52b55ddb3b2068a77041b5ef285768"
+SRC_URI[sha256sum] = "347c52b65a6aeb22cfe3af8382192004f99725850e1dc5f705336e54cf6d59fc"
 
 inherit meson pkgconfig update-alternatives
 
-- 
2.47.1


--===============7232573060298992288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/usbutils: PV changed from "018" to "019"
packages/x86-64-v3-poky-linux/usbutils: PKGV changed from 018 [default] to 019 [default]
packages/x86-64-v3-poky-linux/usbutils: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/usb/usbutils/usbutils-018.tar.gz" to "https://cdn.kernel.org/pub/linux/utils/usb/usbutils/usbutils-019.tar.gz"
packages/x86-64-v3-poky-linux/usbutils/usbutils-dbg: PV changed from "018" to "019"
packages/x86-64-v3-poky-linux/usbutils/usbutils-dbg: PKGV changed from 018 [default] to 019 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-dbg: PKGSIZE changed from 444120 to 445648 (+0%)
packages/x86-64-v3-poky-linux/usbutils/usbutils-dev: PV changed from "018" to "019"
packages/x86-64-v3-poky-linux/usbutils/usbutils-dev: PKGV changed from 018 [default] to 019 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-doc: PV changed from "018" to "019"
packages/x86-64-v3-poky-linux/usbutils/usbutils-doc: PKGV changed from 018 [default] to 019 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-locale: PV changed from "018" to "019"
packages/x86-64-v3-poky-linux/usbutils/usbutils-locale: PKGV changed from 018 [default] to 019 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-python: PV changed from "018" to "019"
packages/x86-64-v3-poky-linux/usbutils/usbutils-python: PKGV changed from 018 [default] to 019 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-python: PKGSIZE changed from 14501 to 14534 (+0%)
packages/x86-64-v3-poky-linux/usbutils/usbutils-src: PV changed from "018" to "019"
packages/x86-64-v3-poky-linux/usbutils/usbutils-src: PKGV changed from 018 [default] to 019 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-staticdev: PV changed from "018" to "019"
packages/x86-64-v3-poky-linux/usbutils/usbutils-staticdev: PKGV changed from 018 [default] to 019 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils: PV changed from "018" to "019"
packages/x86-64-v3-poky-linux/usbutils/usbutils: PKGV changed from 018 [default] to 019 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils: PKGSIZE changed from 283761 to 283787 (+0%)

--===============7232573060298992288==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-usbutils-upgrade-018-019.patch"

RnJvbSBhMzZiYjNmMTE4ZjhmZjdhYWY4OWE1MTA1ODYwMzZiMDViMDVhYzQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNDoyMjozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHVz
YnV0aWxzOiB1cGdyYWRlIDAxOCAtPiAwMTkKCi0tLQogbWV0YS9yZWNpcGVzLWJzcC91c2J1dGls
cy97dXNidXRpbHNfMDE4LmJiID0+IHVzYnV0aWxzXzAxOS5iYn0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
YnNwL3VzYnV0aWxzL3t1c2J1dGlsc18wMTguYmIgPT4gdXNidXRpbHNfMDE5LmJifSAoOTMlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvdXNidXRpbHMvdXNidXRpbHNfMDE4LmJiIGIv
bWV0YS9yZWNpcGVzLWJzcC91c2J1dGlscy91c2J1dGlsc18wMTkuYmIKc2ltaWxhcml0eSBpbmRl
eCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWJzcC91c2J1dGlscy91c2J1dGlsc18wMTgu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ic3AvdXNidXRpbHMvdXNidXRpbHNfMDE5LmJiCmlu
ZGV4IGI5NmExYjRmMTkuLjZhYTVjNWY1YzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ic3Av
dXNidXRpbHMvdXNidXRpbHNfMDE4LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ic3AvdXNidXRpbHMv
dXNidXRpbHNfMDE5LmJiCkBAIC0xNSw3ICsxNSw3IEBAIERFUEVORFMgPSAibGlidXNiMSB2aXJ0
dWFsL2xpYmljb252IHVkZXYiCiAKIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51
eC91dGlscy91c2IvdXNidXRpbHMvdXNidXRpbHMtJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAi
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDA0OGQyZDg1MThmYjBjYzdjMDUxNmUxNmU1MmFmMDIz
ZTUyYjU1ZGRiM2IyMDY4YTc3MDQxYjVlZjI4NTc2OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIz
NDdjNTJiNjVhNmFlYjIyY2ZlM2FmODM4MjE5MjAwNGY5OTcyNTg1MGUxZGM1ZjcwNTMzNmU1NGNm
NmQ1OWZjIgogCiBpbmhlcml0IG1lc29uIHBrZ2NvbmZpZyB1cGRhdGUtYWx0ZXJuYXRpdmVzCiAK
LS0gCjIuNDcuMQoK

--===============7232573060298992288==--

