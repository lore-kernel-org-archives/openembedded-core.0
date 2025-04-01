Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D9EC369A0
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.18063.1743511388576499051
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=AC4z0ukr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oTnpUZhV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010195f1607d52-1fc0f702-2b1d-406f-be93-1022170581dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511388;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Yej6+QquxgEpSdr6nRgEfr1hhSswvmD9snywgC7PjZI=;
	b=AC4z0ukrDnwkkKUndpfmjKTeq/tAyTaQjE8zwigMdksYv24Y6ibsJ0fSxdlM7eng
	up/W65VXvp16e984IbFbzigYNhFBs4IBkJgmLl7GjhBcbHPsRaM3rFS3/m5JX2Q00eb
	u8nPljvxr6sdyZ/tZoswn/jm8yhbiH5/+0kYUL+o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511388;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Yej6+QquxgEpSdr6nRgEfr1hhSswvmD9snywgC7PjZI=;
	b=oTnpUZhV6LehPvHWBMIRhhE/9TImmyY45ZQ+5luvK21K8VcTI5krNAzwSyDf6Wso
	ZWLdztz2f94d3Xyfkh3/Bwz70pp1FY29iMj+p6CON347wtFWTbcltjSbWfXZqg8Ed4X
	YhbaIQr4M/wss0E8NOu0aJhXIxTByK4wpwOcKJD4=
Content-Type: multipart/mixed; boundary="===============3084879546123300891=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2025.03.0 SUCCEEDED
Message-ID: <01010195f1607d52-1fc0f702-2b1d-406f-be93-1022170581dd-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214032

--===============3084879546123300891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2025.03.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2025.02.0-2025.03.0.patch
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
From 83a5fb9e33e7e5f12879f01355373e14ef7ede54 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 06:45:10 +0000
Subject: [PATCH] barebox-tools: upgrade 2025.02.0 -> 2025.03.0

---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 4298966714..7fd7a88d71 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.02.0"
+PV = "2025.03.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "6da5f9e98a8c93f6eead3badefe133ed5fd865395b1a3c0192fdbdd9eb4f7311"
+SRC_URI[sha256sum] = "0bf7118004e445bdd57feeef89ee9064982acc221e8a046c4a7994d3da6da2ec"
-- 
2.47.1


--===============3084879546123300891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2025.02.0" to "2025.03.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2025.02.0 [default] to 2025.03.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2025.02.0" to "2025.03.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2025.02.0 [default] to 2025.03.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2025.02.0" to "2025.03.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2025.02.0 [default] to 2025.03.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2025.02.0" to "2025.03.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2025.02.0 [default] to 2025.03.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2025.02.0" to "2025.03.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2025.02.0 [default] to 2025.03.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2025.02.0" to "2025.03.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2025.02.0 [default] to 2025.03.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PV changed from "2025.02.0" to "2025.03.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2025.02.0 [default] to 2025.03.0 [default]
packages/core2-64-poky-linux/barebox-tools: PV changed from "2025.02.0" to "2025.03.0"
packages/core2-64-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2025.02.0.tar.bz2" to "https://barebox.org/download/barebox-2025.03.0.tar.bz2"
packages/core2-64-poky-linux/barebox-tools: PKGV changed from 2025.02.0 [default] to 2025.03.0 [default]

--===============3084879546123300891==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2025.02.0-2025.03.0.patch"

RnJvbSA4M2E1ZmI5ZTMzZTdlNWYxMjg3OWYwMTM1NTM3M2UxNGVmN2VkZTU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwNjo0NToxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
cmVib3gtdG9vbHM6IHVwZ3JhZGUgMjAyNS4wMi4wIC0+IDIwMjUuMDMuMAoKLS0tCiBtZXRhL3Jl
Y2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMgYi9tZXRhL3JlY2lwZXMtYnNw
L2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jCmluZGV4IDQyOTg5NjY3MTQuLjdmZDdhODhkNzEg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMK
KysrIGIvbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwpAQCAtMyw2
ICszLDYgQEAgU0VDVElPTiA9ICJib290bG9hZGVycyIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9ZjUxMjVkMTNlMDAwYjljYTFmMGQzMzY0Mjg2YzQxOTIiCiAKLVBW
ID0gIjIwMjUuMDIuMCIKK1BWID0gIjIwMjUuMDMuMCIKIFNSQ19VUkkgPSAiaHR0cHM6Ly9iYXJl
Ym94Lm9yZy9kb3dubG9hZC9iYXJlYm94LSR7UFZ9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNmRhNWY5ZTk4YThjOTNmNmVlYWQzYmFkZWZlMTMzZWQ1ZmQ4NjUzOTViMWEzYzAxOTJm
ZGJkZDllYjRmNzMxMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwYmY3MTE4MDA0ZTQ0NWJkZDU3
ZmVlZWY4OWVlOTA2NDk4MmFjYzIyMWU4YTA0NmM0YTc5OTRkM2RhNmRhMmVjIgotLSAKMi40Ny4x
Cgo=

--===============3084879546123300891==--

