Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3D3CA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:31 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.89997.1756850183475790001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SR7dJTD0;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=C6uCIm5C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101990c6e5a43-85967e90-70ca-4ea0-88f2-f9f362d646d6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850182;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iS+spar7JPacsCuRQ3wYgvx7ALgGvptnUCD3myhKADg=;
	b=SR7dJTD0znUBZf640DxbfNNVpzj0EY3PVNA7ddikdwtA2ShMIrNr1uyCGmX8yW5T
	mA6r+lerXKyp170riJGBP+Bk5qwKxiTlO6dQy9rKSDOogda+OGk6hEbIxF4NKp4mH98
	t5E37XwSkYhd3s4U9qGJVgLBmwEi2fRD+uSQvKNI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850182;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iS+spar7JPacsCuRQ3wYgvx7ALgGvptnUCD3myhKADg=;
	b=C6uCIm5Cdb0qIS27dAekpP2oPtIi89lbBQ5BVNyWR7ys7D+LqMRJ2lmU1l5OfC7y
	G+XfG+0/20QZ/HKHo68ljeyAulKbwtj3dkYFhvz0lb5B7BKxIfVQMcfc4aX09VJoTXM
	0bhRM86DaPEO6bQkiSt+Tg7ShBEAIBILWR2bfXlo=
Content-Type: multipart/mixed; boundary="===============0960148974569210622=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2025.08.0 SUCCEEDED
Message-ID: <010101990c6e5a43-85967e90-70ca-4ea0-88f2-f9f362d646d6-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222756

--===============0960148974569210622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2025.08.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2025.07.0-2025.08.0.patch
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
From 3abea14f0e95deae8bca31ef8ff674e015a6dd3d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 16:19:52 +0000
Subject: [PATCH] barebox-tools: upgrade 2025.07.0 -> 2025.08.0

---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index a9a6a91db9..864c6010c9 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.07.0"
+PV = "2025.08.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "92add334bd0f5847deb2c23da54c78b40e8bae4f93c545e62be28e2f0afe137b"
+SRC_URI[sha256sum] = "b32f141ee708e87cb0cc01d626adafc07bd6eb52d62ca969287d7d27462eab32"
-- 
2.47.1


--===============0960148974569210622==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2025.07.0-2025.08.0.patch"

RnJvbSAzYWJlYTE0ZjBlOTVkZWFlOGJjYTMxZWY4ZmY2NzRlMDE1YTZkZDNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxNjoxOTo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
cmVib3gtdG9vbHM6IHVwZ3JhZGUgMjAyNS4wNy4wIC0+IDIwMjUuMDguMAoKLS0tCiBtZXRhL3Jl
Y2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMgYi9tZXRhL3JlY2lwZXMtYnNw
L2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jCmluZGV4IGE5YTZhOTFkYjkuLjg2NGM2MDEwYzkg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMK
KysrIGIvbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwpAQCAtMyw2
ICszLDYgQEAgU0VDVElPTiA9ICJib290bG9hZGVycyIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9ZjUxMjVkMTNlMDAwYjljYTFmMGQzMzY0Mjg2YzQxOTIiCiAKLVBW
ID0gIjIwMjUuMDcuMCIKK1BWID0gIjIwMjUuMDguMCIKIFNSQ19VUkkgPSAiaHR0cHM6Ly9iYXJl
Ym94Lm9yZy9kb3dubG9hZC9iYXJlYm94LSR7UFZ9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiOTJhZGQzMzRiZDBmNTg0N2RlYjJjMjNkYTU0Yzc4YjQwZThiYWU0ZjkzYzU0NWU2MmJl
MjhlMmYwYWZlMTM3YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiMzJmMTQxZWU3MDhlODdjYjBj
YzAxZDYyNmFkYWZjMDdiZDZlYjUyZDYyY2E5NjkyODdkN2QyNzQ2MmVhYjMyIgotLSAKMi40Ny4x
Cgo=

--===============0960148974569210622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2025.07.0" to "2025.08.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2025.07.0 [default] to 2025.08.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2025.07.0" to "2025.08.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2025.07.0 [default] to 2025.08.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2025.07.0" to "2025.08.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2025.07.0 [default] to 2025.08.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2025.07.0" to "2025.08.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2025.07.0 [default] to 2025.08.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2025.07.0" to "2025.08.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2025.07.0 [default] to 2025.08.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2025.07.0" to "2025.08.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2025.07.0 [default] to 2025.08.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PV changed from "2025.07.0" to "2025.08.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2025.07.0 [default] to 2025.08.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools: PV changed from "2025.07.0" to "2025.08.0"
packages/x86-64-v3-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2025.07.0.tar.bz2" to "https://barebox.org/download/barebox-2025.08.0.tar.bz2"
packages/x86-64-v3-poky-linux/barebox-tools: PKGV changed from 2025.07.0 [default] to 2025.08.0 [default]

--===============0960148974569210622==--

