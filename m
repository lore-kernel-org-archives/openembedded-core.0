Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E71CCA461
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.7631.1685693432372498291
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Q6HrLdXX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101887b287eb8-9f0b211f-6cbb-430c-ac74-2f858137e16e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693431;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/aCqeaon3gGSpg3HGXqTqy1pazS6IRwt9/aooVmOqeI=;
	b=Q6HrLdXXwtpCLL2jtmtlCaRoxqBv+uc0TOwTZOQolbujfNcR5N30buKxkUCnalu+
	Tzr8HBJOC4ztdIiBimT8sGUlCl5zYP7pQa6VQDbRprGtGpg0PymWRzP52lDbgqgz0LN
	YKf2KpyjPsuiEvWDBcdgIczCE/iIFNT5CAqoz6c8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693431;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/aCqeaon3gGSpg3HGXqTqy1pazS6IRwt9/aooVmOqeI=;
	b=GBfAio34Dq5AXNdVgB7tu5pqe05yMFLOVIzYNv+B6Ml9rtbPdFOsbSjibNdtE8u9
	bDcmWofcq4ewGAeJQ99Scfkbi6+mlAw5URZVeYRZoM65Ydrw5qjHXpo2LbiL2H491R/
	RMmYhIJKXu26kPdr0xUBtQ2zYavN+zeymnmNtbXs=
Content-Type: multipart/mixed; boundary="===============8609580482570625891=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 16.0.4 SUCCEEDED
Message-ID: <010101887b287eb8-9f0b211f-6cbb-430c-ac74-2f858137e16e-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182179

--===============8609580482570625891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *16.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-llvm-upgrade-16.0.3-16.0.4.patch
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
--===============8609580482570625891==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-llvm-upgrade-16.0.3-16.0.4.patch"

RnJvbSBkYjY3MTZhZTRlZmIxOGFjYmNiMjRkNDkyNWZlNmY3NTM0Y2QzNTc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxMzowMTowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxs
dm06IHVwZ3JhZGUgMTYuMC4zIC0+IDE2LjAuNAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bGx2bS9sbHZtX2dpdC5iYiB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2
bS9sbHZtX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm1fZ2l0LmJiCmlu
ZGV4IGE0OTk2NTY2OGYuLjYwZTIyMjMyZjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9sbHZtL2xsdm1fZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xs
dm1fZ2l0LmJiCkBAIC0xNCwxNCArMTQsMTQgQEAgUkRFUEVORFM6JHtQTn06YXBwZW5kOmNsYXNz
LXRhcmdldCA9ICIgbmN1cnNlcy10ZXJtaW5mbyIKIAogaW5oZXJpdCBjbWFrZSBwa2djb25maWcK
IAotUFYgPSAiMTYuMC4zIgorUFYgPSAiMTYuMC40IgogCiBNQUpPUl9WRVJTSU9OID0gIiR7QG9l
LnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0iLCAxKX0iCiAKIExMVk1fUkVMRUFTRSA9ICIke1BW
fSIKIAogQlJBTkNIID0gInJlbGVhc2UvJHtNQUpPUl9WRVJTSU9OfS54IgotU1JDUkVWID0gImRh
M2NkMzMzYmVhNTcyZmIxMDQ3MGY2MTBhMjdmMjJiY2I4NGIwOGMiCitTUkNSRVYgPSAiYWU0MjE5
NmJjNDkzZmZlODc3YTdlM2RmZjhiZTMyMDM1ZGVhNGQwNyIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0
aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC5naXQ7YnJhbmNoPSR7QlJBTkNIfTtwcm90b2NvbD1o
dHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDA3LWxsdm0tYWxsb3ctZW52LW92ZXJyaWRlLW9m
LWV4ZS1wYXRoLnBhdGNoO3N0cmlwbGV2ZWw9MiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUFz
bU1hdGNoZXJFbWl0dGVyLXNvcnQtQ2xhc3NJbmZvLWxpc3RzLWJ5LW5hbWUtYXMtd2UucGF0Y2g7
c3RyaXBsZXZlbD0yIFwKLS0gCjIuMzkuMgoK

--===============8609580482570625891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/llvm/llvm-dev: FILELIST: removed "/usr/lib/libLLVM-16.0.3.so", added "/usr/lib/libLLVM-16.0.4.so"
Changes to packages/core2-32-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config16.0.3 moved to /usr/bin/crossscripts/llvm-config16.0.4
  /usr/lib/libLLVM-16.0.3.so moved to /usr/lib/libLLVM-16.0.4.so
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config16.0.3 to llvm-config16.0.4
  /usr/bin/llvm-config16.0.3 moved to /usr/bin/llvm-config16.0.4
  /usr/bin/llvm-tblgen16.0.3 moved to /usr/bin/llvm-tblgen16.0.4
  /usr/lib/libLLVM-16.0.3.so moved to /usr/lib/libLLVM-16.0.4.so

--===============8609580482570625891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/llvm: PKGV changed from 16.0.3 [default] to 16.0.4 [default]
packages/core2-32-poky-linux/llvm: PV changed from "16.0.3" to "16.0.4"
packages/core2-32-poky-linux/llvm/llvm-bugpointpasses: PKGV changed from 16.0.3 [default] to 16.0.4 [default]
packages/core2-32-poky-linux/llvm/llvm-bugpointpasses: PV changed from "16.0.3" to "16.0.4"
packages/core2-32-poky-linux/llvm/llvm-dbg: PKGV changed from 16.0.3 [default] to 16.0.4 [default]
packages/core2-32-poky-linux/llvm/llvm-dbg: PV changed from "16.0.3" to "16.0.4"
packages/core2-32-poky-linux/llvm/llvm-dbg: PKGSIZE changed from 3438479040 to 3435274692 (-0%)
packages/core2-32-poky-linux/llvm/llvm-dev: FILES: removed "/usr/lib/libLLVM-16.0.3.so", added "/usr/lib/libLLVM-16.0.4.so"
packages/core2-32-poky-linux/llvm/llvm-dev: PKGV changed from 16.0.3 [default] to 16.0.4 [default]
packages/core2-32-poky-linux/llvm/llvm-dev: FILELIST: removed "/usr/lib/libLLVM-16.0.3.so", added "/usr/lib/libLLVM-16.0.4.so"
packages/core2-32-poky-linux/llvm/llvm-dev: PV changed from "16.0.3" to "16.0.4"
packages/core2-32-poky-linux/llvm/llvm-dev: PKGSIZE changed from 23360489 to 23361010 (+0%)
packages/core2-32-poky-linux/llvm/llvm-doc: PKGV changed from 16.0.3 [default] to 16.0.4 [default]
packages/core2-32-poky-linux/llvm/llvm-doc: PV changed from "16.0.3" to "16.0.4"
packages/core2-32-poky-linux/llvm/llvm-libllvm: PKGV changed from 16.0.3 [default] to 16.0.4 [default]
packages/core2-32-poky-linux/llvm/llvm-libllvm: PV changed from "16.0.3" to "16.0.4"
packages/core2-32-poky-linux/llvm/llvm-libllvm: PKGSIZE changed from 91974352 to 92097232 (+0%)
packages/core2-32-poky-linux/llvm/llvm-liblto: PKGV changed from 16.0.3 [default] to 16.0.4 [default]
packages/core2-32-poky-linux/llvm/llvm-liblto: PV changed from "16.0.3" to "16.0.4"
packages/core2-32-poky-linux/llvm/llvm-liboptremarks: PKGV changed from 16.0.3 [default] to 16.0.4 [default]
packages/core2-32-poky-linux/llvm/llvm-liboptremarks: PV changed from "16.0.3" to "16.0.4"
packages/core2-32-poky-linux/llvm/llvm-llvmhello: PKGV changed from 16.0.3 [default] to 16.0.4 [default]
packages/core2-32-poky-linux/llvm/llvm-llvmhello: PV changed from "16.0.3" to "16.0.4"
packages/core2-32-poky-linux/llvm/llvm-locale: PKGV changed from 16.0.3 [default] to 16.0.4 [default]
packages/core2-32-poky-linux/llvm/llvm-locale: PV changed from "16.0.3" to "16.0.4"
packages/core2-32-poky-linux/llvm/llvm-src: PKGV changed from 16.0.3 [default] to 16.0.4 [default]
packages/core2-32-poky-linux/llvm/llvm-src: PV changed from "16.0.3" to "16.0.4"
packages/core2-32-poky-linux/llvm/llvm-src: PKGSIZE changed from 287200982 to 287201538 (+0%)
packages/core2-32-poky-linux/llvm/llvm-staticdev: PKGV changed from 16.0.3 [default] to 16.0.4 [default]
packages/core2-32-poky-linux/llvm/llvm-staticdev: PV changed from "16.0.3" to "16.0.4"
packages/core2-32-poky-linux/llvm/llvm-staticdev: PKGSIZE changed from 2198188032 to 2197603144 (-0%)
packages/core2-32-poky-linux/llvm/llvm: PKGV changed from 16.0.3 [default] to 16.0.4 [default]
packages/core2-32-poky-linux/llvm/llvm: PV changed from "16.0.3" to "16.0.4"
packages/core2-32-poky-linux/llvm/llvm: PKGSIZE changed from 76372871 to 76516231 (+0%)
Changes to packages/core2-32-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config16.0.3 moved to /usr/bin/crossscripts/llvm-config16.0.4
  /usr/lib/libLLVM-16.0.3.so moved to /usr/lib/libLLVM-16.0.4.so
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config16.0.3 to llvm-config16.0.4
  /usr/bin/llvm-config16.0.3 moved to /usr/bin/llvm-config16.0.4
  /usr/bin/llvm-tblgen16.0.3 moved to /usr/bin/llvm-tblgen16.0.4
  /usr/lib/libLLVM-16.0.3.so moved to /usr/lib/libLLVM-16.0.4.so

--===============8609580482570625891==--

