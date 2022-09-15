Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F28C6FA91
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:42 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.10764.1663251513793820246
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RSJ51TwJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101018341840438-abb96bf9-50ce-492b-8b4d-50dda5eabbf7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FpOmdtcvqqtjGQz2t7c3Uq2+w7WZz6485B4w1m3hAQM=;
	b=RSJ51TwJ3N33doNdLtLnofSDZOLXp9+6PbqmpIqw8dEzfrUzzeGQSQEbnWaa6OBp
	e/cYJfTAKxu0SPOBNJ8Y3zROvyBtEm52i/UiW4eVPdvfNr4FjMBXQz1tPIZGwd7jN2+
	1+fQ38m1dYu3+yj4CEHT/Gm+CFbLBbZfLnRNvbq4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FpOmdtcvqqtjGQz2t7c3Uq2+w7WZz6485B4w1m3hAQM=;
	b=AiRw8BzVQwcnFHawl3gfvGXSSxHSabGU0udvbt6hgU0DOe+bwxkjGaxVrEWtvAui
	NTYGp0se3xauSfM9rvghweCjGWuomVvQDZvA8M8CLCn23dD+L6iwH73hC2a9XJCYbjP
	iH/bB4zPBfgXw3S2zcu9srW55ZmwWw3pGR63nBDI=
Content-Type: multipart/mixed; boundary="===============4847299628782546129=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sqlite3: upgrading to 3.39.3 SUCCEEDED
Message-ID: 
 <0101018341840438-abb96bf9-50ce-492b-8b4d-50dda5eabbf7-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:34 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170764

--===============4847299628782546129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sqlite3* to *3.39.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.39.2-3.39.3.patch
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
--===============4847299628782546129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sqlite3: SRC_URI changed from "http://www.sqlite.org/2022/sqlite-autoconf-3390200.tar.gz" to "http://www.sqlite.org/2022/sqlite-autoconf-3390300.tar.gz"
packages/core2-32-poky-linux/sqlite3: PV changed from "3.39.2" to "3.39.3"
packages/core2-32-poky-linux/sqlite3: PKGV changed from 3.39.2 [default] to 3.39.3 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-dev: PV changed from "3.39.2" to "3.39.3"
packages/core2-32-poky-linux/sqlite3/libsqlite3-dev: PKGV changed from 3.39.2 [default] to 3.39.3 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-doc: PV changed from "3.39.2" to "3.39.3"
packages/core2-32-poky-linux/sqlite3/libsqlite3-doc: PKGV changed from 3.39.2 [default] to 3.39.3 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-staticdev: PV changed from "3.39.2" to "3.39.3"
packages/core2-32-poky-linux/sqlite3/libsqlite3-staticdev: PKGV changed from 3.39.2 [default] to 3.39.3 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3: PV changed from "3.39.2" to "3.39.3"
packages/core2-32-poky-linux/sqlite3/libsqlite3: PKGV changed from 3.39.2 [default] to 3.39.3 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PV changed from "3.39.2" to "3.39.3"
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PKGV changed from 3.39.2 [default] to 3.39.3 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PKGSIZE changed from 4809584 to 4815156 (+0%)
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PV changed from "3.39.2" to "3.39.3"
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PKGV changed from 3.39.2 [default] to 3.39.3 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PKGSIZE changed from 9893943 to 9896548 (+0%)
packages/core2-32-poky-linux/sqlite3/sqlite3: PV changed from "3.39.2" to "3.39.3"
packages/core2-32-poky-linux/sqlite3/sqlite3: PKGV changed from 3.39.2 [default] to 3.39.3 [default]

--===============4847299628782546129==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.39.2-3.39.3.patch"

RnJvbSAzMGVhYzFmNDQ4MmE2ODcwZWY2M2VlMTY4YmY5YjBjN2Y4NThhMjk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMTQ6MTY6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cWxpdGUzOiB1cGdyYWRlIDMuMzkuMiAtPiAzLjM5LjMKCi0tLQogLi4uL3NxbGl0ZS97c3FsaXRl
M18zLjM5LjIuYmIgPT4gc3FsaXRlM18zLjM5LjMuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3tzcWxpdGUzXzMuMzkuMi5iYiA9PiBzcWxpdGUzXzMuMzku
My5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3Fs
aXRlM18zLjM5LjIuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjM5
LjMuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBv
cnQvc3FsaXRlL3NxbGl0ZTNfMy4zOS4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9zcWxpdGUvc3FsaXRlM18zLjM5LjMuYmIKaW5kZXggZGZlZjQ4MDg5NS4uZmNlNDk3ZTBlMSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy4zOS4yLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuMzkuMy5iYgpAQCAt
NCw3ICs0LDcgQEAgTElDRU5TRSA9ICJQRCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3Nx
bGl0ZTMuaDtlbmRsaW5lPTExO21kNT03ODZkM2RjNTgxZWZmMDNmNGZkOWU0YTc3ZWQwMGM2NiIK
IAogU1JDX1VSSSA9ICJodHRwOi8vd3d3LnNxbGl0ZS5vcmcvMjAyMi9zcWxpdGUtYXV0b2NvbmYt
JHtTUUxJVEVfUFZ9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4NTJiZThhNjE4M2Ex
N2JhNDdjZWUwYmJmZjc0MDBiN2FhNWFmZmQyODNiZjNiZWVmYzM0ZmNkMDg4YTIzOWRlIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjc4NjhmYjMwODJiZTNmMmNmNDQ5MWM2ZmJhNmRlMmJkZGNiYzI5
M2EzNWZlZmIwNjI0ZWUzYzEzZjAxNDIyYjkiCiAKICMgLTE5MjQyIGlzIG9ubHkgYW4gaXNzdWUg
aW4gc3BlY2lmaWMgZGV2ZWxvcG1lbnQgYnJhbmNoIGNvbW1pdHMKIENWRV9DSEVDS19JR05PUkUg
Kz0gIkNWRS0yMDE5LTE5MjQyIgotLSAKMi4zMS4xCgo=

--===============4847299628782546129==--

