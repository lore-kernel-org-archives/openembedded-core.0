Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A6EC27C56
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.808.1686887483060848858
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ri7ruUI6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010188c254431c-7f4fe1ca-0e99-4cb6-bf1a-b2fa1d81946e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4jC7VZJfB5r3gYNwLNrmIOBwmaPKI9JQNvPTChbjfnQ=;
	b=Ri7ruUI6h3JUTq03LQecLKtaW+FBdrkXcDTeqRupOrwFYusEGzG8U/6Gf8XMBj+/
	/bhacaVYFHinU6EYVLkR5BHDPMQvAgqcqEmBgnQ7uBPtIHYXScsNFHu/8FBQoPB7+tk
	8dz9A+9NCK1TFk8NKqaLLmuFCVDBsb7xZAcsRLks=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4jC7VZJfB5r3gYNwLNrmIOBwmaPKI9JQNvPTChbjfnQ=;
	b=gvrBaeKBfKYqDVgF3HMI0SChoyU2DflZ7NuQIrgryvmxZWnh6RYHgfQX/2rSUj0E
	0IDJ3WG+n297o7E2LpVLYYT5AkXFAKtWi9JkJIkY6bkuTQ8pbsEulqlcXFsRZ2VuImj
	5K8f9QpeS0il0DyzCpNuny0JWcO2TiHQH0d0AwG4=
Content-Type: multipart/mixed; boundary="===============8404211432876391243=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libmodulemd: upgrading to 2.15.0 SUCCEEDED
Message-ID: <01010188c254431c-7f4fe1ca-0e99-4cb6-bf1a-b2fa1d81946e-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182913

--===============8404211432876391243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libmodulemd* to *2.15.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmodulemd-upgrade-2.14.0-2.15.0.patch
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
From 562014cde90b77403aec24c85d4019347f5d37f6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 09:21:56 +0000
Subject: [PATCH] libmodulemd: upgrade 2.14.0 -> 2.15.0

---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index 9e32134628..d3bef83306 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
 
 SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=main"
 
-PV = "2.14.0"
-SRCREV = "ee80309bc766d781a144e6879419b29f444d94eb"
+PV = "2.15.0"
+SRCREV = "bfde7f2d04fbb22e26c9eb843e4ccc478762dd8d"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============8404211432876391243==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmodulemd-upgrade-2.14.0-2.15.0.patch"

RnJvbSA1NjIwMTRjZGU5MGI3NzQwM2FlYzI0Yzg1ZDQwMTkzNDdmNWQzN2Y2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMDk6MjE6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJtb2R1bGVtZDogdXBncmFkZSAyLjE0LjAgLT4gMi4xNS4wCgotLS0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9saWJtb2R1bGVtZC9saWJtb2R1bGVtZF9naXQuYmIgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2xpYm1vZHVsZW1kL2xpYm1vZHVsZW1kX2dpdC5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9saWJtb2R1bGVtZC9saWJtb2R1bGVtZF9naXQuYmIKaW5kZXggOWUz
MjEzNDYyOC4uZDNiZWY4MzMwNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xp
Ym1vZHVsZW1kL2xpYm1vZHVsZW1kX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bGlibW9kdWxlbWQvbGlibW9kdWxlbWRfZ2l0LmJiCkBAIC02LDggKzYsOCBAQCBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0yNWEzOTI3YmZmM2VlNGY1YjIxYmNiMGVkM2Zj
ZDZiYiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2ZlZG9yYS1tb2R1bGFyaXR5L2xp
Ym1vZHVsZW1kO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIgogCi1QViA9ICIyLjE0LjAiCi1T
UkNSRVYgPSAiZWU4MDMwOWJjNzY2ZDc4MWExNDRlNjg3OTQxOWIyOWY0NDRkOTRlYiIKK1BWID0g
IjIuMTUuMCIKK1NSQ1JFViA9ICJiZmRlN2YyZDA0ZmJiMjJlMjZjOWViODQzZTRjY2M0Nzg3NjJk
ZDhkIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM5LjIKCg==

--===============8404211432876391243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libmodulemd: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libmodulemd: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PKGSIZE changed from 1316844 to 1321708 (+0%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: FILELIST: removed "/usr/lib/.debug/libmodulemd.so.2.14.0", added "/usr/lib/.debug/libmodulemd.so.2.15.0"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: PKGSIZE changed from 991847 to 994291 (+0%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PKGSIZE changed from 1210796 to 1223091 (+1%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libmodulemd/libmodulemd: PKGSIZE changed from 666837 to 671021 (+1%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libmodulemd/libmodulemd: FILELIST: removed "/usr/lib/libmodulemd.so.2.14.0", added "/usr/lib/libmodulemd.so.2.15.0"
Changes to packages/core2-32-poky-linux/libmodulemd (sysroot):
  /usr/lib/libmodulemd.so.2 changed symlink target from libmodulemd.so.2.14.0 to libmodulemd.so.2.15.0
  /usr/lib/libmodulemd.so.2.14.0 moved to /usr/lib/libmodulemd.so.2.15.0

--===============8404211432876391243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libmodulemd/libmodulemd: FILELIST: removed "/usr/lib/libmodulemd.so.2.14.0", added "/usr/lib/libmodulemd.so.2.15.0"
Changes to packages/core2-32-poky-linux/libmodulemd (sysroot):
  /usr/lib/libmodulemd.so.2 changed symlink target from libmodulemd.so.2.14.0 to libmodulemd.so.2.15.0
  /usr/lib/libmodulemd.so.2.14.0 moved to /usr/lib/libmodulemd.so.2.15.0

--===============8404211432876391243==--

