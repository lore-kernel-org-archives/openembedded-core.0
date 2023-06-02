Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CFCC88C99
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:42 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.7642.1685693435359197134
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CYjw6e1c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101887b28916b-1a8641a7-3174-45a0-b572-805667b14076-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=i0+fzjJsXdNhCYmNJR9MlU/MmeHGwdKvvS89UC+R5O4=;
	b=CYjw6e1cW0diBBbAiEr1r2AME6cfD75gmtcyuIrW2tGOM3PxKA0HbdZudzij2LKV
	qyJ/w+Td7zJ3d41bSxHBaxbZjD/fH+BOQX4gEIh+XYp3T7LlmWzFd9j3mksNo1MJeMa
	1+WZ6RDcDQSRgIkOJVljhgryFsvDU8vMj4J8+m8I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=i0+fzjJsXdNhCYmNJR9MlU/MmeHGwdKvvS89UC+R5O4=;
	b=cnUO6/2C7muFRhmkV/bZBlg5xaIRWtRcoKZaBbfSWqx5UF9QV090JWbVwJUN5BNZ
	j3JhufRg9L0PnhV72f/qsguvuekjFxMgteRlmmbINgxTAU/Uenq4hyamD1TN7MpPrnZ
	UB4N+sUJ9h9vpxJgGNelRBoIPYrX84kv/60k5O8A=
Content-Type: multipart/mixed; boundary="===============1901119493330722523=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dos2unix: upgrading to 7.5.0 SUCCEEDED
Message-ID: <010101887b28916b-1a8641a7-3174-45a0-b572-805667b14076-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182255

--===============1901119493330722523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dos2unix* to *7.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dos2unix-upgrade-7.4.4-7.5.0.patch
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
--===============1901119493330722523==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dos2unix-upgrade-7.4.4-7.5.0.patch"

RnJvbSA3MjFhZmIxNGM5YTgyNWU5N2FiNTgxYmZlYjE0NGZkZWZkOTViNjAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwNjowMTo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRv
czJ1bml4OiB1cGdyYWRlIDcuNC40IC0+IDcuNS4wCgotLS0KIC4uLi9kb3MydW5peC97ZG9zMnVu
aXhfNy40LjQuYmIgPT4gZG9zMnVuaXhfNy41LjAuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2RvczJ1bml4L3tkb3MydW5peF83LjQuNC5iYiA9PiBkb3MydW5peF83LjUu
MC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9k
b3MydW5peF83LjQuNC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RvczJ1bml4L2RvczJ1bml4
XzcuNS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2RvczJ1bml4L2RvczJ1bml4XzcuNC40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9kb3MydW5peC9kb3MydW5peF83LjUuMC5iYgppbmRleCA1MDZmYWY1YTZkLi4xZmYx
ZmM0Zjk3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9kb3MydW5p
eF83LjQuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9kb3MydW5peF83
LjUuMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZ
SU5HLnR4dDttZDU9MzdmNzIyNDZjZTJhYTJmY2U5NDgyYzEwYjFmMmI1MDIiCiBTUkNfVVJJID0g
ImdpdDovL2dpdC5jb2RlLnNmLm5ldC9wL2RvczJ1bml4L2RvczJ1bml4O2JyYW5jaD1tYXN0ZXI7
cHJvdG9jb2w9aHR0cHMiCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJkb3MydW5peC0o
P1A8cHZlcj4oXGQrKFwuXGQrKSspKSIKIAotU1JDUkVWID0gImI1NmE1ODU4NGQzZmVmMDcyMDQy
NWFlMTU0YzJhNGQ4MGU2YWY2YzUiCitTUkNSRVYgPSAiZDY2MTNiYmIxNzU2MjRmMDY1ZGU5MDdl
YmNjOTQ0MzdmNjk5YzE0ZSIKIAogUyA9ICIke1dPUktESVJ9L2dpdC9kb3MydW5peCIKIAotLSAK
Mi4zOS4yCgo=

--===============1901119493330722523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dos2unix/dos2unix-dbg: PV changed from "7.4.4" to "7.5.0"
packages/core2-32-poky-linux/dos2unix/dos2unix-dbg: PKGV changed from 7.4.4 [default] to 7.5.0 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-dbg: PKGSIZE changed from 181188 to 188916 (+4%)
packages/core2-32-poky-linux/dos2unix/dos2unix-dev: PV changed from "7.4.4" to "7.5.0"
packages/core2-32-poky-linux/dos2unix/dos2unix-dev: PKGV changed from 7.4.4 [default] to 7.5.0 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-doc: PV changed from "7.4.4" to "7.5.0"
packages/core2-32-poky-linux/dos2unix/dos2unix-doc: PKGV changed from 7.4.4 [default] to 7.5.0 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-doc: PKGSIZE changed from 195604 to 200021 (+2%)
packages/core2-32-poky-linux/dos2unix/dos2unix-locale: PV changed from "7.4.4" to "7.5.0"
packages/core2-32-poky-linux/dos2unix/dos2unix-locale: PKGV changed from 7.4.4 [default] to 7.5.0 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-src: PV changed from "7.4.4" to "7.5.0"
packages/core2-32-poky-linux/dos2unix/dos2unix-src: PKGV changed from 7.4.4 [default] to 7.5.0 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-src: PKGSIZE changed from 192420 to 200833 (+4%)
packages/core2-32-poky-linux/dos2unix/dos2unix-staticdev: PV changed from "7.4.4" to "7.5.0"
packages/core2-32-poky-linux/dos2unix/dos2unix-staticdev: PKGV changed from 7.4.4 [default] to 7.5.0 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix: PV changed from "7.4.4" to "7.5.0"
packages/core2-32-poky-linux/dos2unix/dos2unix: PKGV changed from 7.4.4 [default] to 7.5.0 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix: PKGSIZE changed from 117576 to 125768 (+7%)
packages/core2-32-poky-linux/dos2unix: PV changed from "7.4.4" to "7.5.0"
packages/core2-32-poky-linux/dos2unix: PKGV changed from 7.4.4 [default] to 7.5.0 [default]

--===============1901119493330722523==--

