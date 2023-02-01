Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34AE1C6FD1C
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.30019.1675272858440097731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EmSz80Gi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101860e0b23c4-35f5305b-a8da-40be-89c9-8a6b99c23bfd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Q3Ki8oJC6hCCvZQhMqQugAPI/5qW+WhcMc+Et6pvmo4=;
	b=EmSz80Gi/2rNbxBIPQVKhB/P+slTz0BbtbByooN3/fkWl8y9P34ZDDbAuJRVyIR7
	p042OAD6AQeyvKdG4aRTa9eeMfBYBTdqHvt7DK4bZXAOciG3zVOtqir/Cn4dTfLElE4
	oTZvqWQoMUmXWjwvkAIIncpGnQGUH5hvc9fDM2Zo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Q3Ki8oJC6hCCvZQhMqQugAPI/5qW+WhcMc+Et6pvmo4=;
	b=gaySaoeUmtlK3inJpLVzD4tYaWUDdY5CiUKmS0bnIJewdrNVFJ8peOK6BQ5/9NTd
	gny0V5bqq3HdRLsKKtCgsLa96M2joTqH4jajWSENAQArWCUF/93rALBWMhBchnUwQyp
	z0ACYKAd3iOnqt3MR/qc9wWZ1PnxIU/B9hN0SMhE=
Content-Type: multipart/mixed; boundary="===============3397708541226664024=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.239.0 SUCCEEDED
Message-ID: <010101860e0b23c4-35f5305b-a8da-40be-89c9-8a6b99c23bfd-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176633

--===============3397708541226664024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.239.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.236.0-1.3.239.0.patch
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
--===============3397708541226664024==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.236.0-1.3.239.0.patch"

RnJvbSA3NThmYTBjNmMzZjliMDMwNzI5YzQwMGIzOGRiYWM2YmQzNDZmNDQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNTowMDowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
c2xhbmc6IHVwZ3JhZGUgMS4zLjIzNi4wIC0+IDEuMy4yMzkuMAoKLS0tCiAuLi4vZ2xzbGFuZy97
Z2xzbGFuZ18xLjMuMjM2LjAuYmIgPT4gZ2xzbGFuZ18xLjMuMjM5LjAuYmJ9IHwgNyArKysrLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL3tnbHNsYW5nXzEuMy4yMzYuMC5iYiA9PiBn
bHNsYW5nXzEuMy4yMzkuMC5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yMzYuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9nbHNsYW5nL2dsc2xhbmdfMS4zLjIzOS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjIzNi4wLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yMzku
MC5iYgppbmRleCA5OWVjYTZhNmMxLi42YmNkZTUyMWUyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yMzYuMC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yMzkuMC5iYgpAQCAtOCw5ICs4LDEwIEBA
IEhPTUVQQUdFID0gImh0dHBzOi8vd3d3Lmtocm9ub3Mub3JnL29wZW5nbGVzL3Nkay90b29scy9S
ZWZlcmVuY2UtQ29tcGlsZXIiCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSAmIEJTRC0yLUNsYXVz
ZSAmIE1JVCAmIEFwYWNoZS0yLjAgJiBHUEwtMy13aXRoLWJpc29uLWV4Y2VwdGlvbiIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT0yYTJiNWFjZDdiYzQ4NDQ5NjRj
ZmRhNDVmZTgwN2RjMyIKIAotU1JDUkVWID0gIjc3NTUxYzQyOWY4NmMwZTA3N2YyNjU1MmI3YzFj
MGYxMmE5ZjIzNWUiCi1TUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL2ds
c2xhbmcuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIgXAotICAgICAgICAgICBmaWxl
Oi8vMDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2giCitTUkNSRVYgPSAiY2E4
ZDA3ZDBiYzFjNjM5MGI4MzkxNTcwMDQzOWZhNzcxOWRlNmEyYSIKK1NSQ19VUkkgPSAiZ2l0Oi8v
Z2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvZ2xzbGFuZy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNo
PW1haW4gXAorICAgICAgICAgICBmaWxlOi8vMDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25m
aWcucGF0Y2ggXAorICAgICAgICAgICAiCiBQRSA9ICIxIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFH
UkVHRVggPSAic2RrLSg/UDxwdmVyPlxkKyhcLlxkKykrKSIKIFMgPSAiJHtXT1JLRElSfS9naXQi
Ci0tIAoyLjM3LjMKCg==

--===============3397708541226664024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.236.0 [default] to 1.3.239.0 [default]
packages/core2-32-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libglslang.so.11.13.0", added "/usr/lib/.debug/libglslang.so.12.0.0"
packages/core2-32-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 70462468 to 71532648 (+2%)
packages/core2-32-poky-linux/glslang/glslang-dbg: PV changed from "1.3.236.0" to "1.3.239.0"
packages/core2-32-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.236.0 [default] to 1.3.239.0 [default]
packages/core2-32-poky-linux/glslang/glslang-dev: PKGSIZE changed from 994093 to 1003539 (+1%)
packages/core2-32-poky-linux/glslang/glslang-dev: PV changed from "1.3.236.0" to "1.3.239.0"
packages/core2-32-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.236.0 [default] to 1.3.239.0 [default]
packages/core2-32-poky-linux/glslang/glslang-doc: PV changed from "1.3.236.0" to "1.3.239.0"
packages/core2-32-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.236.0 [default] to 1.3.239.0 [default]
packages/core2-32-poky-linux/glslang/glslang-locale: PV changed from "1.3.236.0" to "1.3.239.0"
packages/core2-32-poky-linux/glslang/glslang-src: PKGV changed from 1.3.236.0 [default] to 1.3.239.0 [default]
packages/core2-32-poky-linux/glslang/glslang-src: PKGSIZE changed from 4687396 to 4769462 (+2%)
packages/core2-32-poky-linux/glslang/glslang-src: PV changed from "1.3.236.0" to "1.3.239.0"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.236.0 [default] to 1.3.239.0 [default]
packages/core2-32-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.236.0" to "1.3.239.0"
packages/core2-32-poky-linux/glslang/glslang: PKGV changed from 1.3.236.0 [default] to 1.3.239.0 [default]
packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang.so.11 /usr/lib/libglslang.so.11.13.0", added "/usr/lib/libglslang.so.12 /usr/lib/libglslang.so.12.0.0"
packages/core2-32-poky-linux/glslang/glslang: PKGSIZE changed from 6362929 to 6420272 (+1%)
packages/core2-32-poky-linux/glslang/glslang: PV changed from "1.3.236.0" to "1.3.239.0"
packages/core2-32-poky-linux/glslang: PKGV changed from 1.3.236.0 [default] to 1.3.239.0 [default]
packages/core2-32-poky-linux/glslang: SRC_URI changed from "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master file://0001-generate-glslang-pkg-config.patch" to "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main file://0001-generate-glslang-pkg-config.patch"
packages/core2-32-poky-linux/glslang: PV changed from "1.3.236.0" to "1.3.239.0"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang.so changed symlink target from libglslang.so.11 to libglslang.so.12
  /usr/lib/libglslang.so.11 moved to /usr/lib/libglslang.so.12
  /usr/lib/libglslang.so.12.0.0 was added
  /usr/lib/libglslang.so.11.13.0 was removed

--===============3397708541226664024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang.so.11.13.0 /usr/lib/libglslang.so.11", added "/usr/lib/libglslang.so.12 /usr/lib/libglslang.so.12.0.0"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang.so changed symlink target from libglslang.so.11 to libglslang.so.12
  /usr/lib/libglslang.so.11 moved to /usr/lib/libglslang.so.12
  /usr/lib/libglslang.so.12.0.0 was added
  /usr/lib/libglslang.so.11.13.0 was removed

--===============3397708541226664024==--

