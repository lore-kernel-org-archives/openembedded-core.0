Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F708C27C5F
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.821.1686887482979820851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RExcC69c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010188c254437e-6ae0e3bc-d6a1-4811-a6cc-49a7a64dd243-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Bl0ZTR1RSrhqBW8ZHZAOiIueTEGLziCUuH7JLUBY3GE=;
	b=RExcC69cHxJDjej4ZqAL9W0g8/noBqXfcarXqqI+wf/KcFLSITZBNDA1yP8fCU/1
	b0yr5rqWLL/MAM1R2bnCXyIpwXWGyFHtq0WB9RWgm7fcnY1EehDMD0qrvMxeGbBoV/e
	kJw59gaieEEEqjvDgvXOPrNz6/oj7E1VR2BcrZFQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Bl0ZTR1RSrhqBW8ZHZAOiIueTEGLziCUuH7JLUBY3GE=;
	b=Qad3J22rCrreiOAtI37kaOfSU2QF0YRcTB25A7wi48oaP6UTGvStIiMAgqaXiT06
	ZU69KAW7/3/BQoJsZA7smeqqRL99S2oIZ/rMZ143RnKtLy3WXkTWcOXmPfbGfOYn5vQ
	/MRaKIgSODN27uem+vkrOz19hUAeswqvOtrzqq3g=
Content-Type: multipart/mixed; boundary="===============3339115091468976301=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 16.0.6 SUCCEEDED
Message-ID: <01010188c254437e-6ae0e3bc-d6a1-4811-a6cc-49a7a64dd243-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182911

--===============3339115091468976301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *16.0.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-llvm-upgrade-16.0.5-16.0.6.patch
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
From 824c7cc4c83816c57dd0ec70838ad40d2616eb70 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 11:48:41 +0000
Subject: [PATCH] llvm: upgrade 16.0.5 -> 16.0.6

---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 8b0ab11b61..f3d6f24bd2 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -14,14 +14,14 @@ RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
 
-PV = "16.0.5"
+PV = "16.0.6"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "185b81e034ba60081023b6e59504dfffb560f3e3"
+SRCREV = "7cbf1a2591520c2491aa35339f227775f4d3adf6"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.39.2


--===============3339115091468976301==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-llvm-upgrade-16.0.5-16.0.6.patch"

RnJvbSA4MjRjN2NjNGM4MzgxNmM1N2RkMGVjNzA4MzhhZDQwZDI2MTZlYjcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTE6NDg6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
bHZtOiB1cGdyYWRlIDE2LjAuNSAtPiAxNi4wLjYKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2xsdm0vbGx2bV9naXQuYmIgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xs
dm0vbGx2bV9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9sbHZtX2dpdC5iYgpp
bmRleCA4YjBhYjExYjYxLi5mM2Q2ZjI0YmQyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbGx2bS9sbHZtX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9s
bHZtX2dpdC5iYgpAQCAtMTQsMTQgKzE0LDE0IEBAIFJERVBFTkRTOiR7UE59OmFwcGVuZDpjbGFz
cy10YXJnZXQgPSAiIG5jdXJzZXMtdGVybWluZm8iCiAKIGluaGVyaXQgY21ha2UgcGtnY29uZmln
CiAKLVBWID0gIjE2LjAuNSIKK1BWID0gIjE2LjAuNiIKIAogTUFKT1JfVkVSU0lPTiA9ICIke0Bv
ZS51dGlscy50cmltX3ZlcnNpb24oIiR7UFZ9IiwgMSl9IgogCiBMTFZNX1JFTEVBU0UgPSAiJHtQ
Vn0iCiAKIEJSQU5DSCA9ICJyZWxlYXNlLyR7TUFKT1JfVkVSU0lPTn0ueCIKLVNSQ1JFViA9ICIx
ODViODFlMDM0YmE2MDA4MTAyM2I2ZTU5NTA0ZGZmZmI1NjBmM2UzIgorU1JDUkVWID0gIjdjYmYx
YTI1OTE1MjBjMjQ5MWFhMzUzMzlmMjI3Nzc1ZjRkM2FkZjYiCiBTUkNfVVJJID0gImdpdDovL2dp
dGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QuZ2l0O2JyYW5jaD0ke0JSQU5DSH07cHJvdG9jb2w9
aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwNy1sbHZtLWFsbG93LWVudi1vdmVycmlkZS1v
Zi1leGUtcGF0aC5wYXRjaDtzdHJpcGxldmVsPTIgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1B
c21NYXRjaGVyRW1pdHRlci1zb3J0LUNsYXNzSW5mby1saXN0cy1ieS1uYW1lLWFzLXdlLnBhdGNo
O3N0cmlwbGV2ZWw9MiBcCi0tIAoyLjM5LjIKCg==

--===============3339115091468976301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/llvm: PKGV changed from 16.0.5 [default] to 16.0.6 [default]
packages/core2-32-poky-linux/llvm: PV changed from "16.0.5" to "16.0.6"
packages/core2-32-poky-linux/llvm/llvm-bugpointpasses: PKGV changed from 16.0.5 [default] to 16.0.6 [default]
packages/core2-32-poky-linux/llvm/llvm-bugpointpasses: PV changed from "16.0.5" to "16.0.6"
packages/core2-32-poky-linux/llvm/llvm-dbg: PKGV changed from 16.0.5 [default] to 16.0.6 [default]
packages/core2-32-poky-linux/llvm/llvm-dbg: PV changed from "16.0.5" to "16.0.6"
packages/core2-32-poky-linux/llvm/llvm-dev: FILELIST: removed "/usr/lib/libLLVM-16.0.5.so", added "/usr/lib/libLLVM-16.0.6.so"
packages/core2-32-poky-linux/llvm/llvm-dev: PKGV changed from 16.0.5 [default] to 16.0.6 [default]
packages/core2-32-poky-linux/llvm/llvm-dev: PV changed from "16.0.5" to "16.0.6"
packages/core2-32-poky-linux/llvm/llvm-dev: FILES: removed "/usr/lib/libLLVM-16.0.5.so", added "/usr/lib/libLLVM-16.0.6.so"
packages/core2-32-poky-linux/llvm/llvm-doc: PKGV changed from 16.0.5 [default] to 16.0.6 [default]
packages/core2-32-poky-linux/llvm/llvm-doc: PV changed from "16.0.5" to "16.0.6"
packages/core2-32-poky-linux/llvm/llvm-libllvm: PKGV changed from 16.0.5 [default] to 16.0.6 [default]
packages/core2-32-poky-linux/llvm/llvm-libllvm: PV changed from "16.0.5" to "16.0.6"
packages/core2-32-poky-linux/llvm/llvm-liblto: PKGV changed from 16.0.5 [default] to 16.0.6 [default]
packages/core2-32-poky-linux/llvm/llvm-liblto: PV changed from "16.0.5" to "16.0.6"
packages/core2-32-poky-linux/llvm/llvm-liboptremarks: PKGV changed from 16.0.5 [default] to 16.0.6 [default]
packages/core2-32-poky-linux/llvm/llvm-liboptremarks: PV changed from "16.0.5" to "16.0.6"
packages/core2-32-poky-linux/llvm/llvm-llvmhello: PKGV changed from 16.0.5 [default] to 16.0.6 [default]
packages/core2-32-poky-linux/llvm/llvm-llvmhello: PV changed from "16.0.5" to "16.0.6"
packages/core2-32-poky-linux/llvm/llvm-locale: PKGV changed from 16.0.5 [default] to 16.0.6 [default]
packages/core2-32-poky-linux/llvm/llvm-locale: PV changed from "16.0.5" to "16.0.6"
packages/core2-32-poky-linux/llvm/llvm-src: PKGV changed from 16.0.5 [default] to 16.0.6 [default]
packages/core2-32-poky-linux/llvm/llvm-src: PV changed from "16.0.5" to "16.0.6"
packages/core2-32-poky-linux/llvm/llvm-staticdev: PKGV changed from 16.0.5 [default] to 16.0.6 [default]
packages/core2-32-poky-linux/llvm/llvm-staticdev: PV changed from "16.0.5" to "16.0.6"
packages/core2-32-poky-linux/llvm/llvm-staticdev: PKGSIZE changed from 2198227042 to 2198227726 (+0%)
packages/core2-32-poky-linux/llvm/llvm: PKGV changed from 16.0.5 [default] to 16.0.6 [default]
packages/core2-32-poky-linux/llvm/llvm: PV changed from "16.0.5" to "16.0.6"
Changes to packages/core2-32-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config16.0.5 moved to /usr/bin/crossscripts/llvm-config16.0.6
  /usr/lib/libLLVM-16.0.5.so moved to /usr/lib/libLLVM-16.0.6.so
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config16.0.5 to llvm-config16.0.6
  /usr/bin/llvm-config16.0.5 moved to /usr/bin/llvm-config16.0.6
  /usr/bin/llvm-tblgen16.0.5 moved to /usr/bin/llvm-tblgen16.0.6
  /usr/lib/libLLVM-16.0.5.so moved to /usr/lib/libLLVM-16.0.6.so

--===============3339115091468976301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/llvm/llvm-dev: FILELIST: removed "/usr/lib/libLLVM-16.0.5.so", added "/usr/lib/libLLVM-16.0.6.so"
Changes to packages/core2-32-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config16.0.5 moved to /usr/bin/crossscripts/llvm-config16.0.6
  /usr/lib/libLLVM-16.0.5.so moved to /usr/lib/libLLVM-16.0.6.so
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config16.0.5 to llvm-config16.0.6
  /usr/bin/llvm-config16.0.5 moved to /usr/bin/llvm-config16.0.6
  /usr/bin/llvm-tblgen16.0.5 moved to /usr/bin/llvm-tblgen16.0.6
  /usr/lib/libLLVM-16.0.5.so moved to /usr/lib/libLLVM-16.0.6.so

--===============3339115091468976301==--

