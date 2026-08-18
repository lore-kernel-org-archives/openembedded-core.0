Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE808C5DF7F
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:28:51 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2595.1787030925851031558
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Z2eMwD6R;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tbZAVKsM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a01357ecb8-3848a893-1207-435d-975f-78ddfad850c0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787030925;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=sofG8/8y/iAXBXAFmqsa4904ekQhKZ7I5xbYWnr0B4s=;
	b=Z2eMwD6ReFnBq8gPTXIClUgi6x3GF5m4phscPlCSyUA28iby7yZu7GwiO1j/FS1Z
	jQ9Z1FhtdB6rm/bgC/EoixA6luq9VQXyp/AEdqVKn0bRhbHXVPxllMIEp1e/xktZ9Bb
	MeR1/XZ0MpBv3AdW1HzHr1BagF8iLNCGvvpCflGM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787030925;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=sofG8/8y/iAXBXAFmqsa4904ekQhKZ7I5xbYWnr0B4s=;
	b=tbZAVKsMupLCofZnUcmxe7iDjrxmkPVsrl/v3xIOQ3wN/X7hNkWXeEcmOcwdi0D6
	fOuLIAb+krogW1PCE9xg+JG1uZ8ryj21aWyLaX1pBe2UmpuPMJ0yj40A3S0nLa+xJMn
	FhDNNqVXF9XCL6q1Mymeew6JxHUBFAlCnQiGAzkw=
Content-Type: multipart/mixed; boundary="===============4352024710595268566=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libevdev: upgrading to 1.13.7 SUCCEEDED
Message-ID: <010101a01357ecb8-3848a893-1207-435d-975f-78ddfad850c0-000000@us-west-2.amazonses.com>
Date: Tue, 18 Aug 2026 05:28:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 05:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243647

--===============4352024710595268566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libevdev* to *1.13.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libevdev-upgrade-1.13.6-1.13.7.patch
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
From 95a6884cd62c4dc620dc4972365f7789f3936522 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 18 Aug 2026 05:28:38 +0000
Subject: [PATCH] libevdev: upgrade 1.13.6 -> 1.13.7

---
 .../libevdev/{libevdev_1.13.6.bb => libevdev_1.13.7.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.13.6.bb => libevdev_1.13.7.bb} (87%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.13.6.bb b/meta/recipes-support/libevdev/libevdev_1.13.7.bb
similarity index 87%
rename from meta/recipes-support/libevdev/libevdev_1.13.6.bb
rename to meta/recipes-support/libevdev/libevdev_1.13.7.bb
index a4478b8df5..79e383c55b 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.6.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.13.7.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46"
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[sha256sum] = "73f215eccbd8233f414737ac06bca2687e67c44b97d2d7576091aa9718551110"
+SRC_URI[sha256sum] = "0caf824971108f15bb2ad356433bae198d7d3bf1e82d43f63626e069e060bfa6"
 
 inherit meson pkgconfig
 
-- 
2.47.1


--===============4352024710595268566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libevdev: PKGV changed from 1.13.6 [default] to 1.13.7 [default]
packages/x86-64-v3-poky-linux/libevdev: SRC_URI changed from "http://www.freedesktop.org/software/libevdev/libevdev-1.13.6.tar.xz" to "http://www.freedesktop.org/software/libevdev/libevdev-1.13.7.tar.xz"
packages/x86-64-v3-poky-linux/libevdev: PV changed from "1.13.6" to "1.13.7"
packages/x86-64-v3-poky-linux/libevdev/libevdev-dbg: PKGV changed from 1.13.6 [default] to 1.13.7 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev-dbg: PKGSIZE changed from 245320 to 245408 (+0%)
packages/x86-64-v3-poky-linux/libevdev/libevdev-dbg: PV changed from "1.13.6" to "1.13.7"
packages/x86-64-v3-poky-linux/libevdev/libevdev-dev: PKGV changed from 1.13.6 [default] to 1.13.7 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev-dev: PKGSIZE changed from 97609 to 97576 (-0%)
packages/x86-64-v3-poky-linux/libevdev/libevdev-dev: PV changed from "1.13.6" to "1.13.7"
packages/x86-64-v3-poky-linux/libevdev/libevdev-doc: PKGV changed from 1.13.6 [default] to 1.13.7 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev-doc: PV changed from "1.13.6" to "1.13.7"
packages/x86-64-v3-poky-linux/libevdev/libevdev-locale: PKGV changed from 1.13.6 [default] to 1.13.7 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev-locale: PV changed from "1.13.6" to "1.13.7"
packages/x86-64-v3-poky-linux/libevdev/libevdev-src: FILELIST: directory renamed /usr/src/debug/libevdev/1.13.6/libevdev -> /usr/src/debug/libevdev/1.13.7/libevdev, directory renamed /usr/src/debug/libevdev/1.13.6/tools -> /usr/src/debug/libevdev/1.13.7/tools, directory renamed /usr/src/debug/libevdev/1.13.6/include/linux/linux -> /usr/src/debug/libevdev/1.13.7/include/linux/linux, directory renamed /usr/src/debug/libevdev/1.13.6 -> /usr/src/debug/libevdev/1.13.7
packages/x86-64-v3-poky-linux/libevdev/libevdev-src: PKGV changed from 1.13.6 [default] to 1.13.7 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev-src: PKGSIZE changed from 286660 to 287187 (+0%)
packages/x86-64-v3-poky-linux/libevdev/libevdev-src: PV changed from "1.13.6" to "1.13.7"
packages/x86-64-v3-poky-linux/libevdev/libevdev-staticdev: PKGV changed from 1.13.6 [default] to 1.13.7 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev-staticdev: PV changed from "1.13.6" to "1.13.7"
packages/x86-64-v3-poky-linux/libevdev/libevdev: PKGV changed from 1.13.6 [default] to 1.13.7 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev: PV changed from "1.13.6" to "1.13.7"

--===============4352024710595268566==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libevdev-upgrade-1.13.6-1.13.7.patch"

RnJvbSA5NWE2ODg0Y2Q2MmM0ZGM2MjBkYzQ5NzIzNjVmNzc4OWYzOTM2NTIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTggQXVnIDIwMjYgMDU6Mjg6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJldmRldjogdXBncmFkZSAxLjEzLjYgLT4gMS4xMy43CgotLS0KIC4uLi9saWJldmRldi97bGli
ZXZkZXZfMS4xMy42LmJiID0+IGxpYmV2ZGV2XzEuMTMuNy5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmV2ZGV2L3tsaWJldmRldl8xLjEzLjYuYmIgPT4gbGliZXZkZXZf
MS4xMy43LmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV2
ZGV2L2xpYmV2ZGV2XzEuMTMuNi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV2ZGV2L2xp
YmV2ZGV2XzEuMTMuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJldmRldi9saWJldmRldl8xLjEzLjYuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmV2ZGV2L2xpYmV2ZGV2XzEuMTMuNy5iYgppbmRleCBhNDQ3OGI4
ZGY1Li43OWUzODNjNTViIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJldmRl
di9saWJldmRldl8xLjEzLjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZXZkZXYv
bGliZXZkZXZfMS4xMy43LmJiCkBAIC05LDcgKzksNyBAQCBMSUNFTlNFID0gIk1JVCIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTgwYzU1MGIzMTk3YmNiOGRhN2Q3NTU3
ZWJjYzNmYzQ2IgogCiBTUkNfVVJJID0gImh0dHA6Ly93d3cuZnJlZWRlc2t0b3Aub3JnL3NvZnR3
YXJlL2xpYmV2ZGV2LyR7QlB9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3M2YyMTVl
Y2NiZDgyMzNmNDE0NzM3YWMwNmJjYTI2ODdlNjdjNDRiOTdkMmQ3NTc2MDkxYWE5NzE4NTUxMTEw
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBjYWY4MjQ5NzExMDhmMTViYjJhZDM1NjQzM2JhZTE5
OGQ3ZDNiZjFlODJkNDNmNjM2MjZlMDY5ZTA2MGJmYTYiCiAKIGluaGVyaXQgbWVzb24gcGtnY29u
ZmlnCiAKLS0gCjIuNDcuMQoK

--===============4352024710595268566==--

