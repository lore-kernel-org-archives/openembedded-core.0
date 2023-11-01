Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13CDC25B50
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:16 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.8482.1698848703723649755
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OntXJdcC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PoFKPsgM;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.31, mailfrom: 0101018b8b460264-aebb824e-e78e-4556-a0be-641f062675d5-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B4AC+2SU1+QLSKf0h6EN8oPWMZqw/P3V3ievw7eCHq8=;
	b=OntXJdcCSODHVElq+tHiFnVK3HD23sYgNpwyVzxohfw2mhdWoImhHNSaAoylQpVZ
	HqIRwmnU+yB/opl7x7ygjp60yGT/f4qwao3a3dURjcjbUcSbJtt2j1vpByscsjjTLDI
	MvtPP17VvHoKiLaTRtE4YWIHwRKFOk4FuAGSLT5E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B4AC+2SU1+QLSKf0h6EN8oPWMZqw/P3V3ievw7eCHq8=;
	b=PoFKPsgMrnOojt39izclYMF9TT3lBHwaJnc2MIgqAbBu2wiD5swQQhPVvsiCAhcl
	9JeM1tcEChwfZ/2++MX0mWXJ+uyB54c/pYMPLKYLlSaAqVCM8ACAH24nr4P5smbynG/
	91+SJltdZi3XlB7+Wj78xDzutQKq/mHyRBxX/UVM=
Content-Type: multipart/mixed; boundary="===============4635906815253198788=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 17.0.4 SUCCEEDED
Message-ID: <0101018b8b460264-aebb824e-e78e-4556-a0be-641f062675d5-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189940

--===============4635906815253198788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *17.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-llvm-upgrade-17.0.3-17.0.4.patch
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
From 1968efd39bf6b3b38d79f09c3a9c38e90334fdaa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 08:00:59 +0000
Subject: [PATCH] llvm: upgrade 17.0.3 -> 17.0.4

---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index bd2ef0ebec..0f811624a4 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -14,14 +14,14 @@ RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
 
-PV = "17.0.3"
+PV = "17.0.4"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "888437e1b60011b8a375dd30928ec925b448da57"
+SRCREV = "309d55140c46384b6de7a7573206cbeba3f7077f"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.39.2


--===============4635906815253198788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/llvm: PKGV changed from 17.0.3 [default] to 17.0.4 [default]
packages/core2-64-poky-linux/llvm: PV changed from "17.0.3" to "17.0.4"
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PKGV changed from 17.0.3 [default] to 17.0.4 [default]
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PV changed from "17.0.3" to "17.0.4"
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGV changed from 17.0.3 [default] to 17.0.4 [default]
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGSIZE changed from 3691848720 to 3691858840 (+0%)
packages/core2-64-poky-linux/llvm/llvm-dbg: PV changed from "17.0.3" to "17.0.4"
packages/core2-64-poky-linux/llvm/llvm-dev: PKGV changed from 17.0.3 [default] to 17.0.4 [default]
packages/core2-64-poky-linux/llvm/llvm-dev: FILELIST: removed "/usr/lib/libLLVM-17.0.3.so", added "/usr/lib/libLLVM-17.0.4.so"
packages/core2-64-poky-linux/llvm/llvm-dev: FILES: removed "/usr/lib/libLLVM-17.0.3.so", added "/usr/lib/libLLVM-17.0.4.so"
packages/core2-64-poky-linux/llvm/llvm-dev: PV changed from "17.0.3" to "17.0.4"
packages/core2-64-poky-linux/llvm/llvm-doc: PKGV changed from 17.0.3 [default] to 17.0.4 [default]
packages/core2-64-poky-linux/llvm/llvm-doc: PV changed from "17.0.3" to "17.0.4"
packages/core2-64-poky-linux/llvm/llvm-libllvm: PKGV changed from 17.0.3 [default] to 17.0.4 [default]
packages/core2-64-poky-linux/llvm/llvm-libllvm: PV changed from "17.0.3" to "17.0.4"
packages/core2-64-poky-linux/llvm/llvm-liblto: PKGV changed from 17.0.3 [default] to 17.0.4 [default]
packages/core2-64-poky-linux/llvm/llvm-liblto: PV changed from "17.0.3" to "17.0.4"
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PKGV changed from 17.0.3 [default] to 17.0.4 [default]
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PV changed from "17.0.3" to "17.0.4"
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PKGV changed from 17.0.3 [default] to 17.0.4 [default]
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PV changed from "17.0.3" to "17.0.4"
packages/core2-64-poky-linux/llvm/llvm-locale: PKGV changed from 17.0.3 [default] to 17.0.4 [default]
packages/core2-64-poky-linux/llvm/llvm-locale: PV changed from "17.0.3" to "17.0.4"
packages/core2-64-poky-linux/llvm/llvm-src: PKGV changed from 17.0.3 [default] to 17.0.4 [default]
packages/core2-64-poky-linux/llvm/llvm-src: PKGSIZE changed from 336109815 to 336109713 (-0%)
packages/core2-64-poky-linux/llvm/llvm-src: PV changed from "17.0.3" to "17.0.4"
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGV changed from 17.0.3 [default] to 17.0.4 [default]
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGSIZE changed from 3723633530 to 3723647914 (+0%)
packages/core2-64-poky-linux/llvm/llvm-staticdev: PV changed from "17.0.3" to "17.0.4"
packages/core2-64-poky-linux/llvm/llvm: PKGV changed from 17.0.3 [default] to 17.0.4 [default]
packages/core2-64-poky-linux/llvm/llvm: PV changed from "17.0.3" to "17.0.4"
Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config17.0.3 moved to /usr/bin/crossscripts/llvm-config17.0.4
  /usr/lib/libLLVM-17.0.3.so moved to /usr/lib/libLLVM-17.0.4.so
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config17.0.3 to llvm-config17.0.4
  /usr/bin/llvm-config17.0.3 moved to /usr/bin/llvm-config17.0.4
  /usr/bin/llvm-tblgen17.0.3 moved to /usr/bin/llvm-tblgen17.0.4
  /usr/lib/libLLVM-17.0.3.so moved to /usr/lib/libLLVM-17.0.4.so

--===============4635906815253198788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/llvm/llvm-dev: FILELIST: removed "/usr/lib/libLLVM-17.0.3.so", added "/usr/lib/libLLVM-17.0.4.so"
Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config17.0.3 moved to /usr/bin/crossscripts/llvm-config17.0.4
  /usr/lib/libLLVM-17.0.3.so moved to /usr/lib/libLLVM-17.0.4.so
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config17.0.3 to llvm-config17.0.4
  /usr/bin/llvm-config17.0.3 moved to /usr/bin/llvm-config17.0.4
  /usr/bin/llvm-tblgen17.0.3 moved to /usr/bin/llvm-tblgen17.0.4
  /usr/lib/libLLVM-17.0.3.so moved to /usr/lib/libLLVM-17.0.4.so

--===============4635906815253198788==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-llvm-upgrade-17.0.3-17.0.4.patch"

RnJvbSAxOTY4ZWZkMzliZjZiM2IzOGQ3OWYwOWMzYTljMzhlOTAzMzRmZGFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwODowMDo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxs
dm06IHVwZ3JhZGUgMTcuMC4zIC0+IDE3LjAuNAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bGx2bS9sbHZtX2dpdC5iYiB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2
bS9sbHZtX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm1fZ2l0LmJiCmlu
ZGV4IGJkMmVmMGViZWMuLjBmODExNjI0YTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9sbHZtL2xsdm1fZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xs
dm1fZ2l0LmJiCkBAIC0xNCwxNCArMTQsMTQgQEAgUkRFUEVORFM6JHtQTn06YXBwZW5kOmNsYXNz
LXRhcmdldCA9ICIgbmN1cnNlcy10ZXJtaW5mbyIKIAogaW5oZXJpdCBjbWFrZSBwa2djb25maWcK
IAotUFYgPSAiMTcuMC4zIgorUFYgPSAiMTcuMC40IgogCiBNQUpPUl9WRVJTSU9OID0gIiR7QG9l
LnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0iLCAxKX0iCiAKIExMVk1fUkVMRUFTRSA9ICIke1BW
fSIKIAogQlJBTkNIID0gInJlbGVhc2UvJHtNQUpPUl9WRVJTSU9OfS54IgotU1JDUkVWID0gIjg4
ODQzN2UxYjYwMDExYjhhMzc1ZGQzMDkyOGVjOTI1YjQ0OGRhNTciCitTUkNSRVYgPSAiMzA5ZDU1
MTQwYzQ2Mzg0YjZkZTdhNzU3MzIwNmNiZWJhM2Y3MDc3ZiIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0
aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC5naXQ7YnJhbmNoPSR7QlJBTkNIfTtwcm90b2NvbD1o
dHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDA3LWxsdm0tYWxsb3ctZW52LW92ZXJyaWRlLW9m
LWV4ZS1wYXRoLnBhdGNoO3N0cmlwbGV2ZWw9MiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUFz
bU1hdGNoZXJFbWl0dGVyLXNvcnQtQ2xhc3NJbmZvLWxpc3RzLWJ5LW5hbWUtYXMtd2UucGF0Y2g7
c3RyaXBsZXZlbD0yIFwKLS0gCjIuMzkuMgoK

--===============4635906815253198788==--

