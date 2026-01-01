Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20805EE57C5
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:37:49 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103049.1767267465864508282
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DRGtD/AX;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=O0cnKidJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b7959820d-cc9d1662-53e5-4a5c-834b-8ba9daee131e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267468;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QbKu+n9XP7VypeYQR7a5l+zh1iaLER9kQQRYb5nwB7c=;
	b=DRGtD/AXL7UJ9+JLmg1dGvOkXC/M2WQ7Eb0inQ+0TORdwIUUpoz2s2trBTbRkL23
	DPb98QsnAqURsLj5ymkW7mAEPl7dC8VP12pC78T0TiOt00skhMqJlQZPTfUBXrO8NFe
	O9FDwCo1cxpdsRMveycInPMuMpOfkyqVcbWz3HT0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267468;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QbKu+n9XP7VypeYQR7a5l+zh1iaLER9kQQRYb5nwB7c=;
	b=O0cnKidJYYvcG1F9rz2iLGT4+askWRbE1GtIgnX061/HQnnUxep2awhL5A0gwJMK
	1g4bnoNA1ozb/MOS7BzL4Ve6LcGNok+r1ocuRzPi9xTTj4/7o3tIpAwGUJsHqaS9bSD
	Yvm4AN6BLm8Kg/LpHZE5jEbhq2qpZhzPnLq94Guw=
Content-Type: multipart/mixed; boundary="===============5045866615654089205=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2025.12.0 SUCCEEDED
Message-ID: <0101019b7959820d-cc9d1662-53e5-4a5c-834b-8ba9daee131e-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228756

--===============5045866615654089205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2025.12.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2025.11.0-2025.12.0.patch
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
From e45d870804432fbf94e3686336b875b9cd5f6cef Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 06:03:02 +0000
Subject: [PATCH] barebox-tools: upgrade 2025.11.0 -> 2025.12.0

---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 0ad9166aa2..3b6f827afa 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.11.0"
+PV = "2025.12.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "6a487eb975169ef4ecc912d3e1044fb9ee4aa164c21d4db960a384a60d0914f6"
+SRC_URI[sha256sum] = "71d2cdc42bf52b2e96e62f24babc0f5a93acb5b21b048d4d17dd589a893529cf"
-- 
2.47.1


--===============5045866615654089205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2025.11.0" to "2025.12.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2025.11.0 [default] to 2025.12.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2025.11.0" to "2025.12.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2025.11.0 [default] to 2025.12.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2025.11.0" to "2025.12.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2025.11.0 [default] to 2025.12.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2025.11.0" to "2025.12.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2025.11.0 [default] to 2025.12.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2025.11.0" to "2025.12.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2025.11.0 [default] to 2025.12.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2025.11.0" to "2025.12.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2025.11.0 [default] to 2025.12.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PV changed from "2025.11.0" to "2025.12.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2025.11.0 [default] to 2025.12.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools: PV changed from "2025.11.0" to "2025.12.0"
packages/x86-64-v3-poky-linux/barebox-tools: PKGV changed from 2025.11.0 [default] to 2025.12.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2025.11.0.tar.bz2" to "https://barebox.org/download/barebox-2025.12.0.tar.bz2"

--===============5045866615654089205==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2025.11.0-2025.12.0.patch"

RnJvbSBlNDVkODcwODA0NDMyZmJmOTRlMzY4NjMzNmI4NzViOWNkNWY2Y2VmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwNjowMzowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
cmVib3gtdG9vbHM6IHVwZ3JhZGUgMjAyNS4xMS4wIC0+IDIwMjUuMTIuMAoKLS0tCiBtZXRhL3Jl
Y2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMgYi9tZXRhL3JlY2lwZXMtYnNw
L2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jCmluZGV4IDBhZDkxNjZhYTIuLjNiNmY4MjdhZmEg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMK
KysrIGIvbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwpAQCAtMyw2
ICszLDYgQEAgU0VDVElPTiA9ICJib290bG9hZGVycyIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9ZjUxMjVkMTNlMDAwYjljYTFmMGQzMzY0Mjg2YzQxOTIiCiAKLVBW
ID0gIjIwMjUuMTEuMCIKK1BWID0gIjIwMjUuMTIuMCIKIFNSQ19VUkkgPSAiaHR0cHM6Ly9iYXJl
Ym94Lm9yZy9kb3dubG9hZC9iYXJlYm94LSR7UFZ9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNmE0ODdlYjk3NTE2OWVmNGVjYzkxMmQzZTEwNDRmYjllZTRhYTE2NGMyMWQ0ZGI5NjBh
Mzg0YTYwZDA5MTRmNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3MWQyY2RjNDJiZjUyYjJlOTZl
NjJmMjRiYWJjMGY1YTkzYWNiNWIyMWIwNDhkNGQxN2RkNTg5YTg5MzUyOWNmIgotLSAKMi40Ny4x
Cgo=

--===============5045866615654089205==--

