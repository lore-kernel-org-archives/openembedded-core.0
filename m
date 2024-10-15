Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C27DD216A2
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:25 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.11860.1728994547108891899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SUe7uEkO;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JapnrENt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010192901b88ec-14af042d-971e-4765-acc8-e15b2cf664c0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994576;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qu0urncnWFFu4gASg9WvmolA9F3v0HmoFTKPZC8FFSI=;
	b=SUe7uEkOmI3N9Wat5aIO2oe8l8Y0vrUL2mOipT31c4GhWeysWcfHjJa8tqwsM0lt
	09gvPYTiFQ+nmZibKX/bkUIY/C6fMnyJqVS96yggtT9LkvWRQ/dFDnWjDqXyyyCl4SP
	sioubY21GaNaEAJdyCJqOoXl9BsxBLhrVOe2QRcA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994576;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qu0urncnWFFu4gASg9WvmolA9F3v0HmoFTKPZC8FFSI=;
	b=JapnrENtsPAWaH9atJAmmSdHtUVHqki8g6a88MPINokpj5KmZvWRW4W2yEruE/wk
	QW++NT5IhCtUb/zoKNg2jw4t14z4uvaZt7QFxOeLY3BVIapM8qXhanRISZbU4cqHGqk
	gCBpvAVdqHIMWcpqNSbscu3jwhAY3tlwfh0OqPS8=
Content-Type: multipart/mixed; boundary="===============4668559951858317747=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ptest-runner: upgrading to 2.4.5.1 SUCCEEDED
Message-ID: <01010192901b88ec-14af042d-971e-4765-acc8-e15b2cf664c0-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:16:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205906

--===============4668559951858317747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ptest-runner* to *2.4.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ptest-runner-upgrade-2.4.5-2.4.5.1.patch
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
From 039e7d2e76ccd6d9fd66770b9a8181a3f6620c34 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 12:15:38 +0000
Subject: [PATCH] ptest-runner: upgrade 2.4.5 -> 2.4.5.1

---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb
index d28ae7ca91..f8334e801c 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "aea9f42f87f2a78a973ae22cade8e45259f754e1"
+SRCREV = "c99e8c2737ff802f110612cc2d90c60233c33255"
 PV .= "+git"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
@@ -37,3 +37,5 @@ RDEPENDS:${PN}:append = " pstree"
 inherit useradd
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --no-create-home --home / --user-group ptest"
+
+PV = "2.4.5.1"
-- 
2.44.1


--===============4668559951858317747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ptest-runner/ptest-runner-dbg: PKGV changed from 2.4.5+git0+aea9f42f87 to 2.4.5.1 [default]
packages/core2-64-poky-linux/ptest-runner/ptest-runner-dev: PKGV changed from 2.4.5+git0+aea9f42f87 to 2.4.5.1 [default]
packages/core2-64-poky-linux/ptest-runner/ptest-runner-doc: PKGV changed from 2.4.5+git0+aea9f42f87 to 2.4.5.1 [default]
packages/core2-64-poky-linux/ptest-runner/ptest-runner-locale: PKGV changed from 2.4.5+git0+aea9f42f87 to 2.4.5.1 [default]
packages/core2-64-poky-linux/ptest-runner/ptest-runner-src: PKGV changed from 2.4.5+git0+aea9f42f87 to 2.4.5.1 [default]
packages/core2-64-poky-linux/ptest-runner/ptest-runner-staticdev: PKGV changed from 2.4.5+git0+aea9f42f87 to 2.4.5.1 [default]
packages/core2-64-poky-linux/ptest-runner/ptest-runner: PKGV changed from 2.4.5+git0+aea9f42f87 to 2.4.5.1 [default]

--===============4668559951858317747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ptest-runner: PKGV changed from 2.4.5+git [default] to 2.4.5.1 [default]
packages/core2-64-poky-linux/ptest-runner: PV changed from "2.4.5+git" to "2.4.5.1"
packages/core2-64-poky-linux/ptest-runner/ptest-runner-dbg: PKGV changed from 2.4.5+git0+aea9f42f87 to 2.4.5.1 [default]
packages/core2-64-poky-linux/ptest-runner/ptest-runner-dbg: PV changed from "2.4.5+git" to "2.4.5.1"
packages/core2-64-poky-linux/ptest-runner/ptest-runner-dev: PKGV changed from 2.4.5+git0+aea9f42f87 to 2.4.5.1 [default]
packages/core2-64-poky-linux/ptest-runner/ptest-runner-dev: PV changed from "2.4.5+git" to "2.4.5.1"
packages/core2-64-poky-linux/ptest-runner/ptest-runner-doc: PKGV changed from 2.4.5+git0+aea9f42f87 to 2.4.5.1 [default]
packages/core2-64-poky-linux/ptest-runner/ptest-runner-doc: PV changed from "2.4.5+git" to "2.4.5.1"
packages/core2-64-poky-linux/ptest-runner/ptest-runner-locale: PKGV changed from 2.4.5+git0+aea9f42f87 to 2.4.5.1 [default]
packages/core2-64-poky-linux/ptest-runner/ptest-runner-locale: PV changed from "2.4.5+git" to "2.4.5.1"
packages/core2-64-poky-linux/ptest-runner/ptest-runner-src: PKGV changed from 2.4.5+git0+aea9f42f87 to 2.4.5.1 [default]
packages/core2-64-poky-linux/ptest-runner/ptest-runner-src: PV changed from "2.4.5+git" to "2.4.5.1"
packages/core2-64-poky-linux/ptest-runner/ptest-runner-staticdev: PKGV changed from 2.4.5+git0+aea9f42f87 to 2.4.5.1 [default]
packages/core2-64-poky-linux/ptest-runner/ptest-runner-staticdev: PV changed from "2.4.5+git" to "2.4.5.1"
packages/core2-64-poky-linux/ptest-runner/ptest-runner: PKGV changed from 2.4.5+git0+aea9f42f87 to 2.4.5.1 [default]
packages/core2-64-poky-linux/ptest-runner/ptest-runner: PV changed from "2.4.5+git" to "2.4.5.1"

--===============4668559951858317747==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ptest-runner-upgrade-2.4.5-2.4.5.1.patch"

RnJvbSAwMzllN2QyZTc2Y2NkNmQ5ZmQ2Njc3MGI5YTgxODFhM2Y2NjIwYzM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMTI6MTU6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dGVzdC1ydW5uZXI6IHVwZ3JhZGUgMi40LjUgLT4gMi40LjUuMQoKLS0tCiBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9wdGVzdC1ydW5uZXIvcHRlc3QtcnVubmVyXzIuNC41LmJiIHwgNCArKystCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvcHRlc3QtcnVubmVyL3B0ZXN0LXJ1bm5lcl8yLjQuNS5iYiBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L3B0ZXN0LXJ1bm5lci9wdGVzdC1ydW5uZXJfMi40LjUuYmIK
aW5kZXggZDI4YWU3Y2E5MS4uZjgzMzRlODAxYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvcHRlc3QtcnVubmVyL3B0ZXN0LXJ1bm5lcl8yLjQuNS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9wdGVzdC1ydW5uZXIvcHRlc3QtcnVubmVyXzIuNC41LmJiCkBAIC03LDcgKzcs
NyBAQCBIT01FUEFHRSA9ICJodHRwOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNn
aS9wdGVzdC1ydW5uZXIyL2Fib3V0LyIKIExJQ0VOU0UgPSAiR1BMLTIuMC1vci1sYXRlciIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTc1MTQxOTI2MGFhOTU0NDk5Zjdh
YmFhYmFhODgyYmJlIgogCi1TUkNSRVYgPSAiYWVhOWY0MmY4N2YyYTc4YTk3M2FlMjJjYWRlOGU0
NTI1OWY3NTRlMSIKK1NSQ1JFViA9ICJjOTllOGMyNzM3ZmY4MDJmMTEwNjEyY2MyZDkwYzYwMjMz
YzMzMjU1IgogUFYgLj0gIitnaXQiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnlvY3RvcHJvamVj
dC5vcmcvcHRlc3QtcnVubmVyMjticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKQEAgLTM3
LDMgKzM3LDUgQEAgUkRFUEVORFM6JHtQTn06YXBwZW5kID0gIiBwc3RyZWUiCiBpbmhlcml0IHVz
ZXJhZGQKIFVTRVJBRERfUEFDS0FHRVMgPSAiJHtQTn0iCiBVU0VSQUREX1BBUkFNOiR7UE59ID0g
Ii0tc3lzdGVtIC0tbm8tY3JlYXRlLWhvbWUgLS1ob21lIC8gLS11c2VyLWdyb3VwIHB0ZXN0Igor
CitQViA9ICIyLjQuNS4xIgotLSAKMi40NC4xCgo=

--===============4668559951858317747==--

