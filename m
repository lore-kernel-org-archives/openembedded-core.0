Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFABCD8C83
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:43 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1556.1780328132368531067
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=q1/ABGgC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HpHKGosd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e83d36bd3-44f242a6-9284-4bb5-9a80-6b2d0f67fb72-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328131;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h3bjrqSTHv6Pke+CkB1L5Pm23gWddu6nfua5JCMocy4=;
	b=q1/ABGgCnAjfc+y4gaL5cDqgiQxxmJMW140AhetNpLjPGljbaa+Gy7d5V/7xKtZh
	Hp08aKUv8A3KLJjNJkW+wtbkhpo03nB/4rLeuDVguIvpH/ezWvCpldYurXwD8WeavdF
	3z/tN6fes1VmRFmH0kGYDzOpKNOTdCgkXsRi+2HE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328131;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h3bjrqSTHv6Pke+CkB1L5Pm23gWddu6nfua5JCMocy4=;
	b=HpHKGosdc1dt+A8o0epnoL3+KMDo4kRW2YGuAAVLuLd48a0qsNDPccf8VWnU/jkU
	kSEOqfsAYhpTx9QLt4V1FUP27qPE9Om5UcgpZrXdRllKjq6squpzr/rYYtQB4zeUo7e
	j4Z/voW/RnoI4SMmo6/cOyx7jc0nBeQeHcKP9HsY=
Content-Type: multipart/mixed; boundary="===============6867894716155982767=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2026.05.0 SUCCEEDED
Message-ID: <0101019e83d36bd3-44f242a6-9284-4bb5-9a80-6b2d0f67fb72-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237852

--===============6867894716155982767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2026.05.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2026.04.0-2026.05.0.patch
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
From 541e4ae695a9a3aa2744d7b286796a9ec5c6d5fb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 07:09:45 +0000
Subject: [PATCH] barebox-tools: upgrade 2026.04.0 -> 2026.05.0

---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index f736ca68e0..755d9d9fc6 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2026.04.0"
+PV = "2026.05.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "07fd3e3440c23e27d0094432f67827887fcc0e37d5fe24dc257c39b97c4294a0"
+SRC_URI[sha256sum] = "4fddbb274876b782be01a569abeb8d28807d65acd8b84a70807474766dfa3dce"
-- 
2.47.1


--===============6867894716155982767==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2026.04.0-2026.05.0.patch"

RnJvbSA1NDFlNGFlNjk1YTlhM2FhMjc0NGQ3YjI4Njc5NmE5ZWM1YzZkNWZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwNzowOTo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
cmVib3gtdG9vbHM6IHVwZ3JhZGUgMjAyNi4wNC4wIC0+IDIwMjYuMDUuMAoKLS0tCiBtZXRhL3Jl
Y2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMgYi9tZXRhL3JlY2lwZXMtYnNw
L2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jCmluZGV4IGY3MzZjYTY4ZTAuLjc1NWQ5ZDlmYzYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMK
KysrIGIvbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwpAQCAtMyw2
ICszLDYgQEAgU0VDVElPTiA9ICJib290bG9hZGVycyIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9ZjUxMjVkMTNlMDAwYjljYTFmMGQzMzY0Mjg2YzQxOTIiCiAKLVBW
ID0gIjIwMjYuMDQuMCIKK1BWID0gIjIwMjYuMDUuMCIKIFNSQ19VUkkgPSAiaHR0cHM6Ly9iYXJl
Ym94Lm9yZy9kb3dubG9hZC9iYXJlYm94LSR7UFZ9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMDdmZDNlMzQ0MGMyM2UyN2QwMDk0NDMyZjY3ODI3ODg3ZmNjMGUzN2Q1ZmUyNGRjMjU3
YzM5Yjk3YzQyOTRhMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0ZmRkYmIyNzQ4NzZiNzgyYmUw
MWE1NjlhYmViOGQyODgwN2Q2NWFjZDhiODRhNzA4MDc0NzQ3NjZkZmEzZGNlIgotLSAKMi40Ny4x
Cgo=

--===============6867894716155982767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2026.04.0" to "2026.05.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2026.04.0 [default] to 2026.05.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2026.04.0" to "2026.05.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2026.04.0 [default] to 2026.05.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2026.04.0" to "2026.05.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2026.04.0 [default] to 2026.05.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2026.04.0" to "2026.05.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2026.04.0 [default] to 2026.05.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2026.04.0" to "2026.05.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2026.04.0 [default] to 2026.05.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2026.04.0" to "2026.05.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2026.04.0 [default] to 2026.05.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PV changed from "2026.04.0" to "2026.05.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2026.04.0 [default] to 2026.05.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2026.04.0.tar.bz2" to "https://barebox.org/download/barebox-2026.05.0.tar.bz2"
packages/x86-64-v3-poky-linux/barebox-tools: PV changed from "2026.04.0" to "2026.05.0"
packages/x86-64-v3-poky-linux/barebox-tools: PKGV changed from 2026.04.0 [default] to 2026.05.0 [default]

--===============6867894716155982767==--

