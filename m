Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B49FC7EE22
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.30003.1675272854780596862
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MX2lBGAP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101860e0b1971-471967d2-ca2d-483a-825f-c6353770f917-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GpeLeWWGiwdg0efDyhfwdTbNwjHsPi0gStNHiH1ubLA=;
	b=MX2lBGAPOgrqSbM9Sgs+Tci7UiRYsopw+yMxPbM+U0w7VHs2cmXhpwwl+nJCIS12
	xX1GIQn7EjPwH8Bn5048LMoqBUl9O/VvwkcPR8lkU7rng6evKYDdRUCUqr6W2qTXQhW
	+eteHxXuUHamNqHRyiU34FCB1WDlwQ/C4UuLEn60=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GpeLeWWGiwdg0efDyhfwdTbNwjHsPi0gStNHiH1ubLA=;
	b=PetL+EXrhbaeqVpq2WxOLtQbaCSpZgjhXsq2t+ZImCAicXxb+L/vPDYYmpV1hr4B
	8dXvavEJytqPw2tiQkhJ3UsNvBKPirm0mmVByvHkFOiIkj9VQtxSv6WuUC/pkmOijrN
	RX78nCcej2+iY3MLXCyXv5yd8XdYJ2AXmhzlubeM=
Content-Type: multipart/mixed; boundary="===============8210269608852843013=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 15.0.7 SUCCEEDED
Message-ID: <010101860e0b1971-471967d2-ca2d-483a-825f-c6353770f917-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176583

--===============8210269608852843013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *15.0.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-llvm-upgrade-15.0.6-15.0.7.patch
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
--===============8210269608852843013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/llvm: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-bugpointpasses: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-bugpointpasses: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-dbg: PKGSIZE changed from 2914252660 to 2914253180 (+0%)
packages/core2-32-poky-linux/llvm/llvm-dbg: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-dbg: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-dev: FILES: removed "/usr/lib/libLLVM-15.0.6.so", added "/usr/lib/libLLVM-15.0.7.so"
packages/core2-32-poky-linux/llvm/llvm-dev: FILELIST: removed "/usr/lib/libLLVM-15.0.6.so", added "/usr/lib/libLLVM-15.0.7.so"
packages/core2-32-poky-linux/llvm/llvm-dev: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-dev: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-doc: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-doc: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-libllvm: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-libllvm: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-liblto: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-liblto: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-liboptremarks: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-liboptremarks: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-llvmhello: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-llvmhello: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-locale: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-locale: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-src: PKGSIZE changed from 200176717 to 200176811 (+0%)
packages/core2-32-poky-linux/llvm/llvm-src: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-src: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-staticdev: PKGSIZE changed from 2044165538 to 2044165746 (+0%)
packages/core2-32-poky-linux/llvm/llvm-staticdev: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-staticdev: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm: PV changed from "15.0.6" to "15.0.7"
Changes to packages/core2-32-poky-linux/llvm (sysroot):
  /sysroot-providers/llvm15.0.6 moved to /sysroot-providers/llvm15.0.7
  /usr/bin/crossscripts/llvm-config15.0.6 moved to /usr/bin/crossscripts/llvm-config15.0.7
  /usr/lib/libLLVM-15.0.6.so moved to /usr/lib/libLLVM-15.0.7.so
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config15.0.6 to llvm-config15.0.7
  /sysroot-providers/llvm15.0.6-native moved to /sysroot-providers/llvm15.0.7-native
  /usr/bin/llvm-config15.0.6 moved to /usr/bin/llvm-config15.0.7
  /usr/bin/llvm-tblgen15.0.6 moved to /usr/bin/llvm-tblgen15.0.7

--===============8210269608852843013==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-llvm-upgrade-15.0.6-15.0.7.patch"

RnJvbSBhZmRiNmU5ZTYwZTU4NTRmMDIwNjI5MTcxZGY0M2Q4NGVkOWVmMWU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMDo1NjowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxs
dm06IHVwZ3JhZGUgMTUuMC42IC0+IDE1LjAuNwoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bGx2bS9sbHZtX2dpdC5iYiB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2
bS9sbHZtX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm1fZ2l0LmJiCmlu
ZGV4IDc3ZmNjYmNjYzIuLmI0ZTk4M2QyZDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9sbHZtL2xsdm1fZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xs
dm1fZ2l0LmJiCkBAIC0xOSwxNCArMTksMTQgQEAgaW5oZXJpdCBjbWFrZSBwa2djb25maWcKIAog
UFJPVklERVMgKz0gImxsdm0ke1BWfSIKIAotUFYgPSAiMTUuMC42IgorUFYgPSAiMTUuMC43Igog
CiBNQUpPUl9WRVJTSU9OID0gIiR7QG9lLnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0iLCAxKX0i
CiAKIExMVk1fUkVMRUFTRSA9ICIke1BWfSIKIAogQlJBTkNIID0gInJlbGVhc2UvJHtNQUpPUl9W
RVJTSU9OfS54IgotU1JDUkVWID0gIjA4OGYzMzYwNWQ4YTYxZmY1MTljNTgwYTcxYjFkZDU3ZDE2
YTAzZjgiCitTUkNSRVYgPSAiOGRmZGNjN2I3YmY2NjgzNGE3NjFiZDhkZTQ0NTg0MGVmNjhlNGQx
YSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC5naXQ7YnJh
bmNoPSR7QlJBTkNIfTtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDA3LWxs
dm0tYWxsb3ctZW52LW92ZXJyaWRlLW9mLWV4ZS1wYXRoLnBhdGNoO3N0cmlwbGV2ZWw9MiBcCiAg
ICAgICAgICAgIGZpbGU6Ly8wMDAxLUFzbU1hdGNoZXJFbWl0dGVyLXNvcnQtQ2xhc3NJbmZvLWxp
c3RzLWJ5LW5hbWUtYXMtd2UucGF0Y2g7c3RyaXBsZXZlbD0yIFwKLS0gCjIuMzcuMwoK

--===============8210269608852843013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/llvm/llvm-dev: FILELIST: removed "/usr/lib/libLLVM-15.0.6.so", added "/usr/lib/libLLVM-15.0.7.so"
Changes to packages/core2-32-poky-linux/llvm (sysroot):
  /sysroot-providers/llvm15.0.6 moved to /sysroot-providers/llvm15.0.7
  /usr/bin/crossscripts/llvm-config15.0.6 moved to /usr/bin/crossscripts/llvm-config15.0.7
  /usr/lib/libLLVM-15.0.6.so moved to /usr/lib/libLLVM-15.0.7.so
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config15.0.6 to llvm-config15.0.7
  /sysroot-providers/llvm15.0.6-native moved to /sysroot-providers/llvm15.0.7-native
  /usr/bin/llvm-config15.0.6 moved to /usr/bin/llvm-config15.0.7
  /usr/bin/llvm-tblgen15.0.6 moved to /usr/bin/llvm-tblgen15.0.7

--===============8210269608852843013==--

