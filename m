Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6FFCD13DA
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:24 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2346.1762384574956722874
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jk7cNQdp;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MICogyYr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019a564e7794-289a59b3-6562-478d-ab26-26e7f3561678-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iQ81dA4WyiXHhp9mnIFq0QSvg7o0DoLHXH1TdIkerus=;
	b=jk7cNQdp+6xy1p9hbTJete0gBX7dYXgGwpg+ud5o8UGoIl/PCYqurbGKPnEmgSJ8
	xICre2T7RNT2HYYhUn6kyeG6fUypn4Jvvx+IRvX/kLbjwbinPJuJ5zF2gTzoL0Fc/0b
	wEtwtNTQrz1aoLLTi9+B8DpYNCv5EuvQfdC4UdjM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iQ81dA4WyiXHhp9mnIFq0QSvg7o0DoLHXH1TdIkerus=;
	b=MICogyYrtqKO1CajW6JPAnV+aS8wCFN1YcHhMkRiKsZFqymSKe7cu0anrIN6lEgr
	zvoRP20PtV/3iMKRxawy8fF+Sk8AyLIPqOjkbsk4D8iruFF9wsj1SRViJTBnOcYrY1d
	DI5iH89kxJfydWfD44K3o7KQJV84kUtBR6XXAEqc=
Content-Type: multipart/mixed; boundary="===============3194802464850017581=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2025.10.0 SUCCEEDED
Message-ID: <0101019a564e7794-289a59b3-6562-478d-ab26-26e7f3561678-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225790

--===============3194802464850017581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2025.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2025.09.0-2025.10.0.patch
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
From 214f33b65fa7d12e36fbe34b9914ef5b3ecba98a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 14:19:58 +0000
Subject: [PATCH] barebox-tools: upgrade 2025.09.0 -> 2025.10.0

---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index e41d0858fd..8ad8e133a8 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.09.0"
+PV = "2025.10.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "7df1aa47bb7bf1763a729137ac773e69a4052812af094475d739fc63a9295f0d"
+SRC_URI[sha256sum] = "f7587d576637e46151333dff5bff0423869a5f9f6a9e4439c19c2429d983b84e"
-- 
2.47.1


--===============3194802464850017581==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2025.09.0-2025.10.0.patch"

RnJvbSAyMTRmMzNiNjVmYTdkMTJlMzZmYmUzNGI5OTE0ZWY1YjNlY2JhOThhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNDoxOTo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
cmVib3gtdG9vbHM6IHVwZ3JhZGUgMjAyNS4wOS4wIC0+IDIwMjUuMTAuMAoKLS0tCiBtZXRhL3Jl
Y2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMgYi9tZXRhL3JlY2lwZXMtYnNw
L2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jCmluZGV4IGU0MWQwODU4ZmQuLjhhZDhlMTMzYTgg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMK
KysrIGIvbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwpAQCAtMyw2
ICszLDYgQEAgU0VDVElPTiA9ICJib290bG9hZGVycyIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9ZjUxMjVkMTNlMDAwYjljYTFmMGQzMzY0Mjg2YzQxOTIiCiAKLVBW
ID0gIjIwMjUuMDkuMCIKK1BWID0gIjIwMjUuMTAuMCIKIFNSQ19VUkkgPSAiaHR0cHM6Ly9iYXJl
Ym94Lm9yZy9kb3dubG9hZC9iYXJlYm94LSR7UFZ9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiN2RmMWFhNDdiYjdiZjE3NjNhNzI5MTM3YWM3NzNlNjlhNDA1MjgxMmFmMDk0NDc1ZDcz
OWZjNjNhOTI5NWYwZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmNzU4N2Q1NzY2MzdlNDYxNTEz
MzNkZmY1YmZmMDQyMzg2OWE1ZjlmNmE5ZTQ0MzljMTljMjQyOWQ5ODNiODRlIgotLSAKMi40Ny4x
Cgo=

--===============3194802464850017581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2025.09.0" to "2025.10.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PKGSIZE changed from 135112 to 135176 (+0%)
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2025.09.0 [default] to 2025.10.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2025.09.0" to "2025.10.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2025.09.0 [default] to 2025.10.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2025.09.0" to "2025.10.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2025.09.0 [default] to 2025.10.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2025.09.0" to "2025.10.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2025.09.0 [default] to 2025.10.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2025.09.0" to "2025.10.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2025.09.0 [default] to 2025.10.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2025.09.0" to "2025.10.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2025.09.0 [default] to 2025.10.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PV changed from "2025.09.0" to "2025.10.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2025.09.0 [default] to 2025.10.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools: PV changed from "2025.09.0" to "2025.10.0"
packages/x86-64-v3-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2025.09.0.tar.bz2" to "https://barebox.org/download/barebox-2025.10.0.tar.bz2"
packages/x86-64-v3-poky-linux/barebox-tools: PKGV changed from 2025.09.0 [default] to 2025.10.0 [default]

--===============3194802464850017581==--

