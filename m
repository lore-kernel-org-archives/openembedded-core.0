Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE55CC83F0A
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:11 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.1411.1751386807592846792
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KQLiQFK0;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WZSaa3kL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010197c6c9da6d-7770ce16-df97-4198-8c92-630ac31a9c96-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386807;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=l6+pE8dgxFSXkacEG++gdkmuVsSiWz5EIbFXWGfV6jE=;
	b=KQLiQFK0zXPGqXbhAtJPs4Fd7pK+3IBhHiyBmI0VkTOICABEPJhGLRQlFeEacWSq
	4tov9iL8V6V7+jj9d1BoVh0V/ji38nZIZW5UlvHiXP8G8gjDlEDHyrg8Wt0foCQi3uQ
	4256gWC1Vx7/dh5x5c6o9klE7gVnfF7y0SylTjpo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386807;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=l6+pE8dgxFSXkacEG++gdkmuVsSiWz5EIbFXWGfV6jE=;
	b=WZSaa3kLbHP19Y4IpgFyLxieF8Jb2yE6kH+6a7mzaHddzO6HXCfLHombGNGjbTJd
	emx0iWmJ7+PlihVC8+VcRML+Tn9duEobFmg+m8KEHoWhvFOCXXFJqI2Dk5+Ip3Mwv+c
	ymRKVPapZ2fCYEPrCnQhF18v3JME7SA/FHQ16ee8=
Content-Type: multipart/mixed; boundary="===============0866378584494205695=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2025.06.1 SUCCEEDED
Message-ID: <01010197c6c9da6d-7770ce16-df97-4198-8c92-630ac31a9c96-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219607

--===============0866378584494205695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2025.06.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2025.06.0-2025.06.1.patch
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
From db6c121c9d2d74638e16eddbb006a062e03eacd9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 07:16:22 +0000
Subject: [PATCH] barebox-tools: upgrade 2025.06.0 -> 2025.06.1

---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 67bc964188..01dbe883ef 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.06.0"
+PV = "2025.06.1"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "d05bc1f85dc1d95b0b6b6a52cac0a469148fbb8f1edb0d352c3ca3b632426941"
+SRC_URI[sha256sum] = "6db91951143129941adbb5e6b26c7af8be170ea6b5a7b56900ec66029f1d2958"
-- 
2.47.1


--===============0866378584494205695==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2025.06.0-2025.06.1.patch"

RnJvbSBkYjZjMTIxYzlkMmQ3NDYzOGUxNmVkZGJiMDA2YTA2MmUwM2VhY2Q5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwNzoxNjoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
cmVib3gtdG9vbHM6IHVwZ3JhZGUgMjAyNS4wNi4wIC0+IDIwMjUuMDYuMQoKLS0tCiBtZXRhL3Jl
Y2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMgYi9tZXRhL3JlY2lwZXMtYnNw
L2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jCmluZGV4IDY3YmM5NjQxODguLjAxZGJlODgzZWYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMK
KysrIGIvbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwpAQCAtMyw2
ICszLDYgQEAgU0VDVElPTiA9ICJib290bG9hZGVycyIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9ZjUxMjVkMTNlMDAwYjljYTFmMGQzMzY0Mjg2YzQxOTIiCiAKLVBW
ID0gIjIwMjUuMDYuMCIKK1BWID0gIjIwMjUuMDYuMSIKIFNSQ19VUkkgPSAiaHR0cHM6Ly9iYXJl
Ym94Lm9yZy9kb3dubG9hZC9iYXJlYm94LSR7UFZ9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZDA1YmMxZjg1ZGMxZDk1YjBiNmI2YTUyY2FjMGE0NjkxNDhmYmI4ZjFlZGIwZDM1MmMz
Y2EzYjYzMjQyNjk0MSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2ZGI5MTk1MTE0MzEyOTk0MWFk
YmI1ZTZiMjZjN2FmOGJlMTcwZWE2YjVhN2I1NjkwMGVjNjYwMjlmMWQyOTU4IgotLSAKMi40Ny4x
Cgo=

--===============0866378584494205695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2025.06.0" to "2025.06.1"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2025.06.0 [default] to 2025.06.1 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2025.06.0" to "2025.06.1"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2025.06.0 [default] to 2025.06.1 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2025.06.0" to "2025.06.1"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2025.06.0 [default] to 2025.06.1 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2025.06.0" to "2025.06.1"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2025.06.0 [default] to 2025.06.1 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2025.06.0" to "2025.06.1"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2025.06.0 [default] to 2025.06.1 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2025.06.0" to "2025.06.1"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2025.06.0 [default] to 2025.06.1 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PV changed from "2025.06.0" to "2025.06.1"
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2025.06.0 [default] to 2025.06.1 [default]
packages/core2-64-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2025.06.0.tar.bz2" to "https://barebox.org/download/barebox-2025.06.1.tar.bz2"
packages/core2-64-poky-linux/barebox-tools: PV changed from "2025.06.0" to "2025.06.1"
packages/core2-64-poky-linux/barebox-tools: PKGV changed from 2025.06.0 [default] to 2025.06.1 [default]

--===============0866378584494205695==--

