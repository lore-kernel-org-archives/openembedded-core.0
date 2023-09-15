Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD7CEED625
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 18:59:59 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.29463.1694804393273817215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=L54UaePP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dBCQR6jT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a9a36c773-9f02d099-e1ae-4f34-a5fe-2fe0bb889697-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mEbbhVxjbCIQxScOAWxlResHzL+OQNNI+MSBCiD/U2c=;
	b=L54UaePPBCHJVokx5l4bsnQOOzyJzxE8LQfAGrOPHp7LMcG+vfkniF5Gjbcvt27x
	crLIM1K3O98joQEx9vdhypNcat/ckQHR0SdjPmc4hqKcPF+V0s7QoHXSwVskgw6qtNb
	XHAulmiFq43laLv6KwJPV8lSrNfO08mUlh3CKDuA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mEbbhVxjbCIQxScOAWxlResHzL+OQNNI+MSBCiD/U2c=;
	b=dBCQR6jTwFiBgCyQ41Rx4WDWw/f5G4SjbU3B6zqIbEwo8tHnL8tFXnkwnzoztKna
	BOp0UQJgOR82wxtvuhyv9Wv8k53t6VdMz8LT/2SwE7V6cJjBjZfLfQkbeavdW/g1nv5
	ZkXqu390Slns3HzWZZItGXBxdRcnb1o3QdZU+3Ps=
Content-Type: multipart/mixed; boundary="===============6099784844075610467=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sqlite3: upgrading to 3.43.1 SUCCEEDED
Message-ID: <0101018a9a36c773-9f02d099-e1ae-4f34-a5fe-2fe0bb889697-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 18:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187765

--===============6099784844075610467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sqlite3* to *3.43.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.43.0-3.43.1.patch
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
From 38710a1d127f091d537ac155afd1936cd315afb7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 18:54:42 +0000
Subject: [PATCH] sqlite3: upgrade 3.43.0 -> 3.43.1

---
 .../sqlite/{sqlite3_3.43.0.bb => sqlite3_3.43.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.43.0.bb => sqlite3_3.43.1.bb} (78%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.43.0.bb b/meta/recipes-support/sqlite/sqlite3_3.43.1.bb
similarity index 78%
rename from meta/recipes-support/sqlite/sqlite3_3.43.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.43.1.bb
index 84644a09e6..93146358c7 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.43.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.43.1.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "49008dbf3afc04d4edc8ecfc34e4ead196973034293c997adad2f63f01762ae1"
+SRC_URI[sha256sum] = "39116c94e76630f22d54cd82c3cea308565f1715f716d1b2527f1c9c969ba4d9"
 
 CVE_STATUS[CVE-2023-36191] = "disputed: The error is a bug. It has been fixed upstream. But it is not a vulnerability"
 
-- 
2.39.2


--===============6099784844075610467==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.43.0-3.43.1.patch"

RnJvbSAzODcxMGExZDEyN2YwOTFkNTM3YWMxNTVhZmQxOTM2Y2QzMTVhZmI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTg6NTQ6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cWxpdGUzOiB1cGdyYWRlIDMuNDMuMCAtPiAzLjQzLjEKCi0tLQogLi4uL3NxbGl0ZS97c3FsaXRl
M18zLjQzLjAuYmIgPT4gc3FsaXRlM18zLjQzLjEuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3tzcWxpdGUzXzMuNDMuMC5iYiA9PiBzcWxpdGUzXzMuNDMu
MS5iYn0gKDc4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3Fs
aXRlM18zLjQzLjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjQz
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA3OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBv
cnQvc3FsaXRlL3NxbGl0ZTNfMy40My4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9zcWxpdGUvc3FsaXRlM18zLjQzLjEuYmIKaW5kZXggODQ2NDRhMDllNi4uOTMxNDYzNThjNyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy40My4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNDMuMS5iYgpAQCAt
NCw3ICs0LDcgQEAgTElDRU5TRSA9ICJQRCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3Nx
bGl0ZTMuaDtlbmRsaW5lPTExO21kNT03ODZkM2RjNTgxZWZmMDNmNGZkOWU0YTc3ZWQwMGM2NiIK
IAogU1JDX1VSSSA9ICJodHRwOi8vd3d3LnNxbGl0ZS5vcmcvMjAyMy9zcWxpdGUtYXV0b2NvbmYt
JHtTUUxJVEVfUFZ9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0OTAwOGRiZjNhZmMw
NGQ0ZWRjOGVjZmMzNGU0ZWFkMTk2OTczMDM0MjkzYzk5N2FkYWQyZjYzZjAxNzYyYWUxIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjM5MTE2Yzk0ZTc2NjMwZjIyZDU0Y2Q4MmMzY2VhMzA4NTY1ZjE3
MTVmNzE2ZDFiMjUyN2YxYzljOTY5YmE0ZDkiCiAKIENWRV9TVEFUVVNbQ1ZFLTIwMjMtMzYxOTFd
ID0gImRpc3B1dGVkOiBUaGUgZXJyb3IgaXMgYSBidWcuIEl0IGhhcyBiZWVuIGZpeGVkIHVwc3Ry
ZWFtLiBCdXQgaXQgaXMgbm90IGEgdnVsbmVyYWJpbGl0eSIKIAotLSAKMi4zOS4yCgo=

--===============6099784844075610467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sqlite3: PV changed from "3.43.0" to "3.43.1"
packages/core2-32-poky-linux/sqlite3: SRC_URI changed from "http://www.sqlite.org/2023/sqlite-autoconf-3430000.tar.gz" to "http://www.sqlite.org/2023/sqlite-autoconf-3430100.tar.gz"
packages/core2-32-poky-linux/sqlite3: PKGV changed from 3.43.0 [default] to 3.43.1 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-dev: PV changed from "3.43.0" to "3.43.1"
packages/core2-32-poky-linux/sqlite3/libsqlite3-dev: PKGV changed from 3.43.0 [default] to 3.43.1 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-doc: PV changed from "3.43.0" to "3.43.1"
packages/core2-32-poky-linux/sqlite3/libsqlite3-doc: PKGV changed from 3.43.0 [default] to 3.43.1 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-staticdev: PV changed from "3.43.0" to "3.43.1"
packages/core2-32-poky-linux/sqlite3/libsqlite3-staticdev: PKGV changed from 3.43.0 [default] to 3.43.1 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3: PV changed from "3.43.0" to "3.43.1"
packages/core2-32-poky-linux/sqlite3/libsqlite3: PKGV changed from 3.43.0 [default] to 3.43.1 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PV changed from "3.43.0" to "3.43.1"
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PKGV changed from 3.43.0 [default] to 3.43.1 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PKGSIZE changed from 5207880 to 5208540 (+0%)
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PV changed from "3.43.0" to "3.43.1"
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PKGV changed from 3.43.0 [default] to 3.43.1 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PKGSIZE changed from 10359197 to 10359457 (+0%)
packages/core2-32-poky-linux/sqlite3/sqlite3: PV changed from "3.43.0" to "3.43.1"
packages/core2-32-poky-linux/sqlite3/sqlite3: PKGV changed from 3.43.0 [default] to 3.43.1 [default]

--===============6099784844075610467==--

