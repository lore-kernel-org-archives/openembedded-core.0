Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2F9CEB2EB
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:39 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11931.1763224714352186146
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=qBXEFlJp;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=KSsF6Kd5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019a8861f9fc-a6eb09bb-e5ea-420e-8dc4-ff7cc3949c57-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224713;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eydt93Ku9U2+mq+/mW1m9Y4bnQ0LszepOiW49ecE3D8=;
	b=qBXEFlJpGHO1g73qIp9KcfjYpnMnyCZ20HkCOQ/Q+yc2EG53L4t3sEYuuXOtO1ic
	1bDbTJ15dW7uvzIlnaE85ku8JRauz4SawMHL1hA6i6fNJALU5ZV87xDRD8Zz6LOuH8j
	H/ExFT9T0+sKhwQRhWa0NiX2SFeJ7FoNfseod/ZE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224713;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eydt93Ku9U2+mq+/mW1m9Y4bnQ0LszepOiW49ecE3D8=;
	b=KSsF6Kd5O8I4OjO+U9OpFZqHjZH6DHy0XMIC4JnIWq6X/HACWgCXuDkbb8SLx8jK
	ChIjNjpgtaQ2IgPqKkBKj4c69pZhu2HQFunDd51Vo9FKwtaEkrLKEvhd9eItBGyPW6c
	DQfkjolfh2Mf1knPMtbiG67i5/zkKyz3mW9am8WM=
Content-Type: multipart/mixed; boundary="===============0783864208031616572=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] usbutils: upgrading to 019 SUCCEEDED
Message-ID: <0101019a8861f9fc-a6eb09bb-e5ea-420e-8dc4-ff7cc3949c57-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226316

--===============0783864208031616572==
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
From 6d724cc25e67c0fed3220e8378f063588b167810 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 07:42:35 +0000
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


--===============0783864208031616572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/usbutils: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/usb/usbutils/usbutils-018.tar.gz" to "https://cdn.kernel.org/pub/linux/utils/usb/usbutils/usbutils-019.tar.gz"
packages/x86-64-v3-poky-linux/usbutils: PKGV changed from 018 [default] to 019 [default]
packages/x86-64-v3-poky-linux/usbutils: PV changed from "018" to "019"
packages/x86-64-v3-poky-linux/usbutils/usbutils-dbg: PKGSIZE changed from 444120 to 445648 (+0%)
packages/x86-64-v3-poky-linux/usbutils/usbutils-dbg: PKGV changed from 018 [default] to 019 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-dbg: PV changed from "018" to "019"
packages/x86-64-v3-poky-linux/usbutils/usbutils-dev: PKGV changed from 018 [default] to 019 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-dev: PV changed from "018" to "019"
packages/x86-64-v3-poky-linux/usbutils/usbutils-doc: PKGV changed from 018 [default] to 019 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-doc: PV changed from "018" to "019"
packages/x86-64-v3-poky-linux/usbutils/usbutils-locale: PKGV changed from 018 [default] to 019 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-locale: PV changed from "018" to "019"
packages/x86-64-v3-poky-linux/usbutils/usbutils-python: PKGSIZE changed from 14501 to 14534 (+0%)
packages/x86-64-v3-poky-linux/usbutils/usbutils-python: PKGV changed from 018 [default] to 019 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-python: PV changed from "018" to "019"
packages/x86-64-v3-poky-linux/usbutils/usbutils-src: PKGV changed from 018 [default] to 019 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-src: PV changed from "018" to "019"
packages/x86-64-v3-poky-linux/usbutils/usbutils-staticdev: PKGV changed from 018 [default] to 019 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils-staticdev: PV changed from "018" to "019"
packages/x86-64-v3-poky-linux/usbutils/usbutils: PKGSIZE changed from 283761 to 283787 (+0%)
packages/x86-64-v3-poky-linux/usbutils/usbutils: PKGV changed from 018 [default] to 019 [default]
packages/x86-64-v3-poky-linux/usbutils/usbutils: PV changed from "018" to "019"

--===============0783864208031616572==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-usbutils-upgrade-018-019.patch"

RnJvbSA2ZDcyNGNjMjVlNjdjMGZlZDMyMjBlODM3OGYwNjM1ODhiMTY3ODEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDc6NDI6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
c2J1dGlsczogdXBncmFkZSAwMTggLT4gMDE5CgotLS0KIG1ldGEvcmVjaXBlcy1ic3AvdXNidXRp
bHMve3VzYnV0aWxzXzAxOC5iYiA9PiB1c2J1dGlsc18wMTkuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWJzcC91c2J1dGlscy97dXNidXRpbHNfMDE4LmJiID0+IHVzYnV0aWxzXzAxOS5iYn0gKDkzJSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtYnNwL3VzYnV0aWxzL3VzYnV0aWxzXzAxOC5iYiBi
L21ldGEvcmVjaXBlcy1ic3AvdXNidXRpbHMvdXNidXRpbHNfMDE5LmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ic3AvdXNidXRpbHMvdXNidXRpbHNfMDE4
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtYnNwL3VzYnV0aWxzL3VzYnV0aWxzXzAxOS5iYgpp
bmRleCBiOTZhMWI0ZjE5Li42YWE1YzVmNWMyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNw
L3VzYnV0aWxzL3VzYnV0aWxzXzAxOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtYnNwL3VzYnV0aWxz
L3VzYnV0aWxzXzAxOS5iYgpAQCAtMTUsNyArMTUsNyBAQCBERVBFTkRTID0gImxpYnVzYjEgdmly
dHVhbC9saWJpY29udiB1ZGV2IgogCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGlu
dXgvdXRpbHMvdXNiL3VzYnV0aWxzL3VzYnV0aWxzLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAg
IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAwNDhkMmQ4NTE4ZmIwY2M3YzA1MTZlMTZlNTJhZjAy
M2U1MmI1NWRkYjNiMjA2OGE3NzA0MWI1ZWYyODU3NjgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MzQ3YzUyYjY1YTZhZWIyMmNmZTNhZjgzODIxOTIwMDRmOTk3MjU4NTBlMWRjNWY3MDUzMzZlNTRj
ZjZkNTlmYyIKIAogaW5oZXJpdCBtZXNvbiBwa2djb25maWcgdXBkYXRlLWFsdGVybmF0aXZlcwog
Ci0tIAoyLjQ3LjEKCg==

--===============0783864208031616572==--

