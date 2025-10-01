Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAAFBCCD194
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:23 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.17935.1759325534934502456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Z/vUIcDZ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=QO34YWfD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101999ff93866-4a2fadf3-9cad-473f-afb1-47a5afd56fb0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jVZgq6lhDrw+Xa0Q4TZDwRQxv8y06/fG27VthCY/DTY=;
	b=Z/vUIcDZtqytJHDqoN8ULoD/doGcs8t7/Ag5LNVBQ12ot9cDV9NvWbxiMAM5RkCT
	Z5nAnMa0Vuo4hYx6kJK6JpTsbikBcwBNeexEWYf4NkN+xbz8IHc65TxAHoRI46OvGHZ
	Tx9RlpoC15/YjkHNx53bS6AJw3Jbpu577suT4gaI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jVZgq6lhDrw+Xa0Q4TZDwRQxv8y06/fG27VthCY/DTY=;
	b=QO34YWfDU4MMxtT8TvGLJ6s2QfF+CLbAO7OwHbaAt9aiC1SzkR3+jksXE+BqdpZ4
	2Iut0qrdrVujacKIdv2zIK3PrEwln657XFJ8BoYhfEa1dBt6I6bFQ44UfHqUrRw68k2
	1+RrrvTlu6la0bjW8EX9YHPDBZ5RzSGSzVK4NVco=
Content-Type: multipart/mixed; boundary="===============7199555842003995249=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2025.09.0 SUCCEEDED
Message-ID: <010101999ff93866-4a2fadf3-9cad-473f-afb1-47a5afd56fb0-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224219

--===============7199555842003995249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2025.09.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2025.08.0-2025.09.0.patch
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
From afde5b30224c67d57cf598c018a63455df977910 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 07:31:05 +0000
Subject: [PATCH] barebox-tools: upgrade 2025.08.0 -> 2025.09.0

---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 864c6010c9..e41d0858fd 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.08.0"
+PV = "2025.09.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "b32f141ee708e87cb0cc01d626adafc07bd6eb52d62ca969287d7d27462eab32"
+SRC_URI[sha256sum] = "7df1aa47bb7bf1763a729137ac773e69a4052812af094475d739fc63a9295f0d"
-- 
2.47.1


--===============7199555842003995249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2025.08.0 [default] to 2025.09.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2025.08.0" to "2025.09.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PKGSIZE changed from 135128 to 135112 (-0%)
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2025.08.0 [default] to 2025.09.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2025.08.0" to "2025.09.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2025.08.0 [default] to 2025.09.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2025.08.0" to "2025.09.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2025.08.0 [default] to 2025.09.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2025.08.0" to "2025.09.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2025.08.0 [default] to 2025.09.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2025.08.0" to "2025.09.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2025.08.0 [default] to 2025.09.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2025.08.0" to "2025.09.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2025.08.0 [default] to 2025.09.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PV changed from "2025.08.0" to "2025.09.0"
packages/x86-64-v3-poky-linux/barebox-tools: PKGV changed from 2025.08.0 [default] to 2025.09.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools: PV changed from "2025.08.0" to "2025.09.0"
packages/x86-64-v3-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2025.08.0.tar.bz2" to "https://barebox.org/download/barebox-2025.09.0.tar.bz2"

--===============7199555842003995249==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2025.08.0-2025.09.0.patch"

RnJvbSBhZmRlNWIzMDIyNGM2N2Q1N2NmNTk4YzAxOGE2MzQ1NWRmOTc3OTEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwNzozMTowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
cmVib3gtdG9vbHM6IHVwZ3JhZGUgMjAyNS4wOC4wIC0+IDIwMjUuMDkuMAoKLS0tCiBtZXRhL3Jl
Y2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMgYi9tZXRhL3JlY2lwZXMtYnNw
L2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jCmluZGV4IDg2NGM2MDEwYzkuLmU0MWQwODU4ZmQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMK
KysrIGIvbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwpAQCAtMyw2
ICszLDYgQEAgU0VDVElPTiA9ICJib290bG9hZGVycyIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9ZjUxMjVkMTNlMDAwYjljYTFmMGQzMzY0Mjg2YzQxOTIiCiAKLVBW
ID0gIjIwMjUuMDguMCIKK1BWID0gIjIwMjUuMDkuMCIKIFNSQ19VUkkgPSAiaHR0cHM6Ly9iYXJl
Ym94Lm9yZy9kb3dubG9hZC9iYXJlYm94LSR7UFZ9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYjMyZjE0MWVlNzA4ZTg3Y2IwY2MwMWQ2MjZhZGFmYzA3YmQ2ZWI1MmQ2MmNhOTY5Mjg3
ZDdkMjc0NjJlYWIzMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3ZGYxYWE0N2JiN2JmMTc2M2E3
MjkxMzdhYzc3M2U2OWE0MDUyODEyYWYwOTQ0NzVkNzM5ZmM2M2E5Mjk1ZjBkIgotLSAKMi40Ny4x
Cgo=

--===============7199555842003995249==--

