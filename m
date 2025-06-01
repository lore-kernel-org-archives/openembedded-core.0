Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 373B3C71148
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:34 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.27773.1748786127131277289
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2HcVDTSF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=F0o/DDRY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101972bc69df6-efcfced8-f814-4b32-88a1-18572aa1c702-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786126;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=l/Qb99PIfUj3oPCyW82U6eU+JRi+x/BA7lXw6OPtryk=;
	b=2HcVDTSFHpc9fNqNtqi1WUSPWnEtoRSndaGOgfBQMMZiD3/HzkDgb6gq+0FHDpUO
	FQMs7OFCvDNX9eurITvBCDofcxSnTqIjSekBywJgBWXiBSMrXckaYCjVnKwad/bWmZA
	6bLuG9phyyVnQevlEf4C7BQTcFWiNcWxeSF7yTEo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786126;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=l/Qb99PIfUj3oPCyW82U6eU+JRi+x/BA7lXw6OPtryk=;
	b=F0o/DDRYi/ZbBTuOKuwuVu0bImgAy7HUgHthjpBerVQ4LvD2iodQyAAMsCSaIAvQ
	hkS1cyU78E3zyPj7vjTKdWtl48pxm1DVU1gspX/1r+K9TNmaER4iObuiOrB4ajKwhLe
	NdDEG1/i6SoZHvNUTl17R+K36xeAqFAbeiRxjyQg=
Content-Type: multipart/mixed; boundary="===============4997572805831043424=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2025.05.0 SUCCEEDED
Message-ID: <010101972bc69df6-efcfced8-f814-4b32-88a1-18572aa1c702-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217571

--===============4997572805831043424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2025.05.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2025.04.0-2025.05.0.patch
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
From 6bf827a1c73e1804ff020efa9a4ddfaa9bcc4f08 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 07:45:42 +0000
Subject: [PATCH] barebox-tools: upgrade 2025.04.0 -> 2025.05.0

---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index d6ea1eedfe..616da2a4ee 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.04.0"
+PV = "2025.05.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "3124f3c2b69d9ce0512b2d40fa17cace9c356f65f005a63da0474387b8839c41"
+SRC_URI[sha256sum] = "693f9aca90b282f6fb96024b70c06c9c57efe4eefe8e2298ef78eaa05c76fd5d"
-- 
2.47.1


--===============4997572805831043424==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2025.04.0-2025.05.0.patch"

RnJvbSA2YmY4MjdhMWM3M2UxODA0ZmYwMjBlZmE5YTRkZGZhYTliY2M0ZjA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwNzo0NTo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
cmVib3gtdG9vbHM6IHVwZ3JhZGUgMjAyNS4wNC4wIC0+IDIwMjUuMDUuMAoKLS0tCiBtZXRhL3Jl
Y2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMgYi9tZXRhL3JlY2lwZXMtYnNw
L2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jCmluZGV4IGQ2ZWExZWVkZmUuLjYxNmRhMmE0ZWUg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMK
KysrIGIvbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwpAQCAtMyw2
ICszLDYgQEAgU0VDVElPTiA9ICJib290bG9hZGVycyIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9ZjUxMjVkMTNlMDAwYjljYTFmMGQzMzY0Mjg2YzQxOTIiCiAKLVBW
ID0gIjIwMjUuMDQuMCIKK1BWID0gIjIwMjUuMDUuMCIKIFNSQ19VUkkgPSAiaHR0cHM6Ly9iYXJl
Ym94Lm9yZy9kb3dubG9hZC9iYXJlYm94LSR7UFZ9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMzEyNGYzYzJiNjlkOWNlMDUxMmIyZDQwZmExN2NhY2U5YzM1NmY2NWYwMDVhNjNkYTA0
NzQzODdiODgzOWM0MSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2OTNmOWFjYTkwYjI4MmY2ZmI5
NjAyNGI3MGMwNmM5YzU3ZWZlNGVlZmU4ZTIyOThlZjc4ZWFhMDVjNzZmZDVkIgotLSAKMi40Ny4x
Cgo=

--===============4997572805831043424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2025.04.0 [default] to 2025.05.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2025.04.0" to "2025.05.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2025.04.0 [default] to 2025.05.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2025.04.0" to "2025.05.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2025.04.0 [default] to 2025.05.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2025.04.0" to "2025.05.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2025.04.0 [default] to 2025.05.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2025.04.0" to "2025.05.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2025.04.0 [default] to 2025.05.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2025.04.0" to "2025.05.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2025.04.0 [default] to 2025.05.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2025.04.0" to "2025.05.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2025.04.0 [default] to 2025.05.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PV changed from "2025.04.0" to "2025.05.0"
packages/core2-64-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2025.04.0.tar.bz2" to "https://barebox.org/download/barebox-2025.05.0.tar.bz2"
packages/core2-64-poky-linux/barebox-tools: PKGV changed from 2025.04.0 [default] to 2025.05.0 [default]
packages/core2-64-poky-linux/barebox-tools: PV changed from "2025.04.0" to "2025.05.0"

--===============4997572805831043424==--

