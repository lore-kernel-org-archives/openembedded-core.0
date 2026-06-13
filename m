Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301FACD98E2
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 07:50:35 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87191.1781337024871419158
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 00:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=flZ5fUcZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PAnX7ZoC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019ebff5e62e-516567d0-4dd1-404e-a773-b19b0aee3b8e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781337024;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WSWJ8PHVTY5+cWaWpp2Vl5tp0vOQdF1NTK0HOOBQhOU=;
	b=flZ5fUcZHs6JD3vpQP1tvo4eR3Bbz40NqabMkYJscNdqzC1SQSM7vZz6NDb82QRN
	VK1vYrRPVP0yoBQvYZBadHUQjiGOFQHd/tEdlJPk+0Kk0pat7gxDMePaXXRbdld3wsa
	k3oStVCC32OvNTpETaDK9D/7Uk3R/I2P4pCLBFVY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781337024;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WSWJ8PHVTY5+cWaWpp2Vl5tp0vOQdF1NTK0HOOBQhOU=;
	b=PAnX7ZoCQRwECtrLPvfsbj8jZARA3QqWH8Mnb2QtDJGzMGTuvyrUr2J4YpOEbWbz
	R6NRlaY8MllsVkAAJw18EbvCpZnrb5pzXCYY3oGBk2N2iFwmkJA9gG3DdMs8VFczDXp
	5kS3ONlZaB9Cxnu+OXLrUZbsj+o/yaE9pxLsaYIA=
Content-Type: multipart/mixed; boundary="===============5448343157874160456=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libmodulemd: upgrading to 2.15.3 SUCCEEDED
Message-ID: <0101019ebff5e62e-516567d0-4dd1-404e-a773-b19b0aee3b8e-000000@us-west-2.amazonses.com>
Date: Sat, 13 Jun 2026 07:50:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.13-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 07:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238655

--===============5448343157874160456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libmodulemd* to *2.15.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmodulemd-upgrade-2.15.2-2.15.3.patch
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
From cb6dbeebdf96f7c5dbedd2f33afb9d803b6d460a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 13 Jun 2026 07:14:17 +0000
Subject: [PATCH] libmodulemd: upgrade 2.15.2 -> 2.15.3

---
 .../{libmodulemd_2.15.2.bb => libmodulemd_2.15.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libmodulemd/{libmodulemd_2.15.2.bb => libmodulemd_2.15.3.bb} (94%)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.3.bb
similarity index 94%
rename from meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb
rename to meta/recipes-devtools/libmodulemd/libmodulemd_2.15.3.bb
index 32d2a39c41..4627e53428 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
 
 SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=main;tag=${PV}"
 
-SRCREV = "b8b11b4dafaa2c4d73883152bfa7e5bd81cd7395"
+SRCREV = "a8f1c5b1243a8e844a276094007a2bbf8a13b40f"
 
 inherit meson gobject-introspection pkgconfig manpages
 
-- 
2.47.1


--===============5448343157874160456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libmodulemd: PV changed from "2.15.2" to "2.15.3"
packages/x86-64-v3-poky-linux/libmodulemd: PKGV changed from 2.15.2 [default] to 2.15.3 [default]
packages/x86-64-v3-poky-linux/libmodulemd: SRC_URI changed from "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=main;tag=2.15.2" to "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=main;tag=2.15.3"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-dbg: PV changed from "2.15.2" to "2.15.3"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-dbg: FILELIST: removed "/usr/lib/.debug/libmodulemd.so.2.15.2", added "/usr/lib/.debug/libmodulemd.so.2.15.3"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-dbg: PKGV changed from 2.15.2 [default] to 2.15.3 [default]
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-dbg: PKGSIZE changed from 1837272 to 1839744 (+0%)
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-dev: PV changed from "2.15.2" to "2.15.3"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-dev: PKGV changed from 2.15.2 [default] to 2.15.3 [default]
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-dev: PKGSIZE changed from 996841 to 996849 (+0%)
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-doc: PV changed from "2.15.2" to "2.15.3"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-doc: PKGV changed from 2.15.2 [default] to 2.15.3 [default]
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-locale: PV changed from "2.15.2" to "2.15.3"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-locale: PKGV changed from 2.15.2 [default] to 2.15.3 [default]
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-src: PV changed from "2.15.2" to "2.15.3"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-src: FILELIST: directory renamed /usr/src/debug/libmodulemd/2.15.2/modulemd/include/modulemd-2.0 -> /usr/src/debug/libmodulemd/2.15.3/modulemd/include/modulemd-2.0, directory renamed /usr/src/debug/libmodulemd/2.15.2/modulemd -> /usr/src/debug/libmodulemd/2.15.3/modulemd, directory renamed /usr/src/debug/libmodulemd/2.15.2/modulemd/include/private -> /usr/src/debug/libmodulemd/2.15.3/modulemd/include/private
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-src: PKGV changed from 2.15.2 [default] to 2.15.3 [default]
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-src: PKGSIZE changed from 1223867 to 1225411 (+0%)
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-staticdev: PV changed from "2.15.2" to "2.15.3"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-staticdev: PKGV changed from 2.15.2 [default] to 2.15.3 [default]
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd: PV changed from "2.15.2" to "2.15.3"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd: FILELIST: removed "/usr/lib/libmodulemd.so.2.15.2", added "/usr/lib/libmodulemd.so.2.15.3"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd: PKGV changed from 2.15.2 [default] to 2.15.3 [default]
Changes to packages/x86-64-v3-poky-linux/libmodulemd (sysroot):
  /usr/lib/libmodulemd.so.2 changed symlink target from libmodulemd.so.2.15.2 to libmodulemd.so.2.15.3
  /usr/lib/libmodulemd.so.2.15.2 moved to /usr/lib/libmodulemd.so.2.15.3

--===============5448343157874160456==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmodulemd-upgrade-2.15.2-2.15.3.patch"

RnJvbSBjYjZkYmVlYmRmOTZmN2M1ZGJlZGQyZjMzYWZiOWQ4MDNiNmQ0NjBhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTMgSnVuIDIwMjYgMDc6MTQ6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJtb2R1bGVtZDogdXBncmFkZSAyLjE1LjIgLT4gMi4xNS4zCgotLS0KIC4uLi97bGlibW9kdWxl
bWRfMi4xNS4yLmJiID0+IGxpYm1vZHVsZW1kXzIuMTUuMy5iYn0gICAgICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9saWJtb2R1bGVtZC97bGlibW9kdWxlbWRfMi4xNS4yLmJiID0+
IGxpYm1vZHVsZW1kXzIuMTUuMy5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbGlibW9kdWxlbWQvbGlibW9kdWxlbWRfMi4xNS4yLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2xpYm1vZHVsZW1kL2xpYm1vZHVsZW1kXzIuMTUuMy5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGlibW9kdWxlbWQvbGli
bW9kdWxlbWRfMi4xNS4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGlibW9k
dWxlbWQvbGlibW9kdWxlbWRfMi4xNS4zLmJiCmluZGV4IDMyZDJhMzljNDEuLjQ2MjdlNTM0Mjgg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJtb2R1bGVtZC9saWJtb2R1bGVt
ZF8yLjE1LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYm1vZHVsZW1kL2xpYm1v
ZHVsZW1kXzIuMTUuMy5iYgpAQCAtNiw3ICs2LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vQ09QWUlORzttZDU9MjVhMzkyN2JmZjNlZTRmNWIyMWJjYjBlZDNmY2Q2YmIiCiAKIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9mZWRvcmEtbW9kdWxhcml0eS9saWJtb2R1bGVtZDtwcm90
b2NvbD1odHRwczticmFuY2g9bWFpbjt0YWc9JHtQVn0iCiAKLVNSQ1JFViA9ICJiOGIxMWI0ZGFm
YWEyYzRkNzM4ODMxNTJiZmE3ZTViZDgxY2Q3Mzk1IgorU1JDUkVWID0gImE4ZjFjNWIxMjQzYThl
ODQ0YTI3NjA5NDAwN2EyYmJmOGExM2I0MGYiCiAKIGluaGVyaXQgbWVzb24gZ29iamVjdC1pbnRy
b3NwZWN0aW9uIHBrZ2NvbmZpZyBtYW5wYWdlcwogCi0tIAoyLjQ3LjEKCg==

--===============5448343157874160456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd: FILELIST: removed "/usr/lib/libmodulemd.so.2.15.2", added "/usr/lib/libmodulemd.so.2.15.3"
Changes to packages/x86-64-v3-poky-linux/libmodulemd (sysroot):
  /usr/lib/libmodulemd.so.2 changed symlink target from libmodulemd.so.2.15.2 to libmodulemd.so.2.15.3
  /usr/lib/libmodulemd.so.2.15.2 moved to /usr/lib/libmodulemd.so.2.15.3

--===============5448343157874160456==--

