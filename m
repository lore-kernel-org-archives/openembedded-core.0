Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B0EC41535
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:13:01 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.24456.1665871975840566875
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WmO64lqs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010183ddb51372-c33dcad3-1f20-4a09-ae8d-81ebf325b18e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871975;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6jygL4T/lUORPOTujBSBa2IRAqiUFrc/wlRppHejJk4=;
	b=WmO64lqsZrkvGiixt0n5jWbkTFU3ZYmE1QVVtwWN4AV3oS9ukwyDmYeKCWAD6TJP
	nY5eutYbNHuw8dT0pRnBp7Zbv4I4OrUIF9VzSuLPVOSQa0pMOW5gzzpx816e/GvjKCD
	brOtU3leUFsHKi9Ah7YwCLwlylV33LfVorh2WuHk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871975;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6jygL4T/lUORPOTujBSBa2IRAqiUFrc/wlRppHejJk4=;
	b=ADorm87171cJinMfXdJVy4FZrIOVGlmOb55sgg9cxNZVtDmubDlPbCN0vD9PyJel
	6rSqt2X2mRXbLHtjI5HmC92szHCi+QG3xRlF05wMjo7jgyrTvUQAF2WI9RYRDN/MPZp
	xAt/e6PTK8NNcXn9oP5gXPeCmH/o7pXgOct87FMo=
Content-Type: multipart/mixed; boundary="===============5842476761744354756=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sqlite3: upgrading to 3.39.4 SUCCEEDED
Message-ID: <01010183ddb51372-c33dcad3-1f20-4a09-ae8d-81ebf325b18e-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:12:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171877

--===============5842476761744354756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sqlite3* to *3.39.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.39.3-3.39.4.patch
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
--===============5842476761744354756==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.39.3-3.39.4.patch"

RnJvbSAyNzI2YTFhZTE4ZTY3MzVhMTgzNTdmMGQyZWFjYjQ5ZmQ3MTkwZjc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMjI6MDE6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cWxpdGUzOiB1cGdyYWRlIDMuMzkuMyAtPiAzLjM5LjQKCi0tLQogLi4uL3NxbGl0ZS97c3FsaXRl
M18zLjM5LjMuYmIgPT4gc3FsaXRlM18zLjM5LjQuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3tzcWxpdGUzXzMuMzkuMy5iYiA9PiBzcWxpdGUzXzMuMzku
NC5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3Fs
aXRlM18zLjM5LjMuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjM5
LjQuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBv
cnQvc3FsaXRlL3NxbGl0ZTNfMy4zOS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9zcWxpdGUvc3FsaXRlM18zLjM5LjQuYmIKaW5kZXggZmNlNDk3ZTBlMS4uZmVmYWIxNmU2NCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy4zOS4zLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuMzkuNC5iYgpAQCAt
NCw3ICs0LDcgQEAgTElDRU5TRSA9ICJQRCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3Nx
bGl0ZTMuaDtlbmRsaW5lPTExO21kNT03ODZkM2RjNTgxZWZmMDNmNGZkOWU0YTc3ZWQwMGM2NiIK
IAogU1JDX1VSSSA9ICJodHRwOi8vd3d3LnNxbGl0ZS5vcmcvMjAyMi9zcWxpdGUtYXV0b2NvbmYt
JHtTUUxJVEVfUFZ9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3ODY4ZmIzMDgyYmUz
ZjJjZjQ0OTFjNmZiYTZkZTJiZGRjYmMyOTNhMzVmZWZiMDYyNGVlM2MxM2YwMTQyMmI5IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gImYzMWQ0NDViNDhlNjdlMjg0Y2YyMDY3MTdjYzE3MGFiNjNjYmU0
ZmQ3Zjc5YTgyNzkzYjc3MjI4NWU3OGZkYmIiCiAKICMgLTE5MjQyIGlzIG9ubHkgYW4gaXNzdWUg
aW4gc3BlY2lmaWMgZGV2ZWxvcG1lbnQgYnJhbmNoIGNvbW1pdHMKIENWRV9DSEVDS19JR05PUkUg
Kz0gIkNWRS0yMDE5LTE5MjQyIgotLSAKMi4zMS4xCgo=

--===============5842476761744354756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sqlite3: SRC_URI changed from "http://www.sqlite.org/2022/sqlite-autoconf-3390300.tar.gz" to "http://www.sqlite.org/2022/sqlite-autoconf-3390400.tar.gz"
packages/core2-32-poky-linux/sqlite3: PV changed from "3.39.3" to "3.39.4"
packages/core2-32-poky-linux/sqlite3: PKGV changed from 3.39.3 [default] to 3.39.4 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-dev: PV changed from "3.39.3" to "3.39.4"
packages/core2-32-poky-linux/sqlite3/libsqlite3-dev: PKGV changed from 3.39.3 [default] to 3.39.4 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-doc: PV changed from "3.39.3" to "3.39.4"
packages/core2-32-poky-linux/sqlite3/libsqlite3-doc: PKGV changed from 3.39.3 [default] to 3.39.4 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-staticdev: PV changed from "3.39.3" to "3.39.4"
packages/core2-32-poky-linux/sqlite3/libsqlite3-staticdev: PKGV changed from 3.39.3 [default] to 3.39.4 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3: PV changed from "3.39.3" to "3.39.4"
packages/core2-32-poky-linux/sqlite3/libsqlite3: PKGV changed from 3.39.3 [default] to 3.39.4 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3: PKGSIZE changed from 1463483 to 1467579 (+0%)
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PV changed from "3.39.3" to "3.39.4"
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PKGV changed from 3.39.3 [default] to 3.39.4 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PKGSIZE changed from 4815156 to 4815720 (+0%)
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PV changed from "3.39.3" to "3.39.4"
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PKGV changed from 3.39.3 [default] to 3.39.4 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PKGSIZE changed from 9896548 to 9897644 (+0%)
packages/core2-32-poky-linux/sqlite3/sqlite3: PV changed from "3.39.3" to "3.39.4"
packages/core2-32-poky-linux/sqlite3/sqlite3: PKGV changed from 3.39.3 [default] to 3.39.4 [default]

--===============5842476761744354756==--

