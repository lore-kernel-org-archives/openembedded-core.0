Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29BCC87FD2
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:39 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.12173.1752594939144685491
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yFHzbjDi;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bfi8lTXx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101980ecc7a6b-ff1567ce-8dce-4259-a745-7b6cc0c8f1c5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594938;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qkKmeFG89sCno7tfAMLTy82E/2bUt6klvr7oc4BlcXE=;
	b=yFHzbjDig8y0I19yFiD/qR1Vn5bKPrsu5J/HZ3LDE9q3dq++VUTsuQbr0SPaw9Ef
	ukxEPxie5B9uJKFfcf8vrcozKzxhVgYKu8b+DOECuLCcqilBszDSnqISkFxtk9sbtX2
	LpuSx/ay5YdjSqXmfgnw+RL0vIY535ZbZvq37xaU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594938;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qkKmeFG89sCno7tfAMLTy82E/2bUt6klvr7oc4BlcXE=;
	b=bfi8lTXxoiTSApBG/6jTVNmnlOc4uxwoiEOZiaR2+ILN7tKS0m3yYYjTLJgu+O8B
	7zrvAxw0qz4VAGSkzCERIRxoJ+UctkjSgozklWJGwMuiw4hjZm/SezzOF5ylGgpdJCV
	ZxnshSIqbd582Qz5m4zyGc9q5KSJzN4siJI+mUQw=
Content-Type: multipart/mixed; boundary="===============6059666756709750481=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ninja: upgrading to 1.13.1 SUCCEEDED
Message-ID: <010101980ecc7a6b-ff1567ce-8dce-4259-a745-7b6cc0c8f1c5-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220337

--===============6059666756709750481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ninja* to *1.13.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ninja-upgrade-1.13.0-1.13.1.patch
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
From 7ec78b83ac4f1db37de1ba2c168550b221d1fb12 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 09:49:14 +0000
Subject: [PATCH] ninja: upgrade 1.13.0 -> 1.13.1

---
 .../recipes-devtools/ninja/{ninja_1.13.0.bb => ninja_1.13.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ninja/{ninja_1.13.0.bb => ninja_1.13.1.bb} (94%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.13.0.bb b/meta/recipes-devtools/ninja/ninja_1.13.1.bb
similarity index 94%
rename from meta/recipes-devtools/ninja/ninja_1.13.0.bb
rename to meta/recipes-devtools/ninja/ninja_1.13.1.bb
index a5fa8f1c9e..dcaa889c04 100644
--- a/meta/recipes-devtools/ninja/ninja_1.13.0.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.13.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "b4d51f6ed5bed09dd2b70324df0d9cb4ecad2638"
+SRCREV = "79feac0f3e3bc9da9effc586cd5fea41e7550051"
 
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.47.1


--===============6059666756709750481==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ninja-upgrade-1.13.0-1.13.1.patch"

RnJvbSA3ZWM3OGI4M2FjNGYxZGIzN2RlMWJhMmMxNjg1NTBiMjIxZDFmYjEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMDk6NDk6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
aW5qYTogdXBncmFkZSAxLjEzLjAgLT4gMS4xMy4xCgotLS0KIC4uLi9yZWNpcGVzLWRldnRvb2xz
L25pbmphL3tuaW5qYV8xLjEzLjAuYmIgPT4gbmluamFfMS4xMy4xLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9uaW5qYS97bmluamFfMS4xMy4wLmJiID0+IG5pbmphXzEuMTMuMS5iYn0g
KDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmluamEvbmluamFfMS4x
My4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL25pbmphL25pbmphXzEuMTMuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmluamEv
bmluamFfMS4xMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmluamEvbmlu
amFfMS4xMy4xLmJiCmluZGV4IGE1ZmE4ZjFjOWUuLmRjYWE4ODljMDQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9uaW5qYS9uaW5qYV8xLjEzLjAuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL25pbmphL25pbmphXzEuMTMuMS5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1hODE1ODZhNjRhZDRlNDc2Yzc5MWNk
YTdlMmYyYzUyZSIKIAogREVQRU5EUyA9ICJyZTJjLW5hdGl2ZSBuaW5qYS1uYXRpdmUiCiAKLVNS
Q1JFViA9ICJiNGQ1MWY2ZWQ1YmVkMDlkZDJiNzAzMjRkZjBkOWNiNGVjYWQyNjM4IgorU1JDUkVW
ID0gIjc5ZmVhYzBmM2UzYmM5ZGE5ZWZmYzU4NmNkNWZlYTQxZTc1NTAwNTEiCiAKIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0aHViLmNvbS9uaW5qYS1idWlsZC9uaW5qYS5naXQ7YnJhbmNoPXJlbGVhc2U7
cHJvdG9jb2w9aHR0cHM7dGFnPXYke1BWfSIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0g
InYoP1A8cHZlcj4uKikiCi0tIAoyLjQ3LjEKCg==

--===============6059666756709750481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ninja: PKGV changed from 1.13.0 [default] to 1.13.1 [default]
packages/core2-64-poky-linux/ninja: SRC_URI changed from "git://github.com/ninja-build/ninja.git;branch=release;protocol=https;tag=v1.13.0" to "git://github.com/ninja-build/ninja.git;branch=release;protocol=https;tag=v1.13.1"
packages/core2-64-poky-linux/ninja: PV changed from "1.13.0" to "1.13.1"
packages/core2-64-poky-linux/ninja/ninja-dbg: PKGSIZE changed from 8674336 to 8674688 (+0%)
packages/core2-64-poky-linux/ninja/ninja-dbg: PKGV changed from 1.13.0 [default] to 1.13.1 [default]
packages/core2-64-poky-linux/ninja/ninja-dbg: PV changed from "1.13.0" to "1.13.1"
packages/core2-64-poky-linux/ninja/ninja-dev: PKGV changed from 1.13.0 [default] to 1.13.1 [default]
packages/core2-64-poky-linux/ninja/ninja-dev: PV changed from "1.13.0" to "1.13.1"
packages/core2-64-poky-linux/ninja/ninja-doc: PKGV changed from 1.13.0 [default] to 1.13.1 [default]
packages/core2-64-poky-linux/ninja/ninja-doc: PV changed from "1.13.0" to "1.13.1"
packages/core2-64-poky-linux/ninja/ninja-locale: PKGV changed from 1.13.0 [default] to 1.13.1 [default]
packages/core2-64-poky-linux/ninja/ninja-locale: PV changed from "1.13.0" to "1.13.1"
packages/core2-64-poky-linux/ninja/ninja-src: PKGSIZE changed from 556073 to 557086 (+0%)
packages/core2-64-poky-linux/ninja/ninja-src: PKGV changed from 1.13.0 [default] to 1.13.1 [default]
packages/core2-64-poky-linux/ninja/ninja-src: PV changed from "1.13.0" to "1.13.1"
packages/core2-64-poky-linux/ninja/ninja-staticdev: PKGV changed from 1.13.0 [default] to 1.13.1 [default]
packages/core2-64-poky-linux/ninja/ninja-staticdev: PV changed from "1.13.0" to "1.13.1"
packages/core2-64-poky-linux/ninja/ninja: PKGV changed from 1.13.0 [default] to 1.13.1 [default]
packages/core2-64-poky-linux/ninja/ninja: PV changed from "1.13.0" to "1.13.1"

--===============6059666756709750481==--

