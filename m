Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB89DC25B76
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:38 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.42213.1717263218285554867
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QYwVwYbN;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=OQWhtWb1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018fd4dd32bd-a5379e1f-b135-4198-821c-3952b7a60934-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263217;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8chOFkfqfepJGTZyulEC5DVRFM4UiCbGKj8cJFCx2Dg=;
	b=QYwVwYbNwpb+58xBerUr0Mf6TUTngLXaK4+bOpg00352zfmm3Xzs9Dydg+bLHgw7
	3wBTtHoF9JIuGA02+8NsrIs7XXnKV5Uh4AAlx56ClEZeGX+eWNM5Vu0gD/oqRv8drne
	UBByWQe32HjURUFEER1NVsP7lytHR0Es+ndaCsx8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263217;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8chOFkfqfepJGTZyulEC5DVRFM4UiCbGKj8cJFCx2Dg=;
	b=OQWhtWb1nPWHDpcM+S74lcxx+Qb+xPrmqxWTKceqfSkv9VsHiHGdfL2EwYpGcwxC
	9eSdP1TxFSJasLgrDqzQE8Bxk71KRHjX+G9eOXN2uio90DLMyeTaglz8oQJTl43Z4US
	4KKNoUukkg5knUChp/KxQcGQBZDJRtAMgG5N2JG8=
Content-Type: multipart/mixed; boundary="===============8267814914680219066=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.33.1 SUCCEEDED
Message-ID: <0101018fd4dd32bd-a5379e1f-b135-4198-821c-3952b7a60934-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200130

--===============8267814914680219066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ttyrun* to *2.33.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ttyrun-upgrade-2.32.0-2.33.1.patch
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
From 6fb40448569bc1600a89228297429b5f06bae667 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 08:24:12 +0000
Subject: [PATCH] ttyrun: upgrade 2.32.0 -> 2.33.1

---
 meta/recipes-core/ttyrun/{ttyrun_2.32.0.bb => ttyrun_2.33.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.32.0.bb => ttyrun_2.33.1.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.32.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.33.1.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.32.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.33.1.bb
index 815f625a67..ccb7f9b268 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.32.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.33.1.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "9eea78b3ad8ab3710fb3b2d80b9cd058d7c8aba7"
+SRCREV = "686262fdcdaed7903ca1720d7dd0b1f9f5621d7b"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.44.0


--===============8267814914680219066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ttyrun: PKGV changed from 2.32.0 [default] to 2.33.1 [default]
packages/core2-64-poky-linux/ttyrun: PV changed from "2.32.0" to "2.33.1"
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.32.0 [default] to 2.33.1 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.32.0" to "2.33.1"
packages/core2-64-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.32.0 [default] to 2.33.1 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.32.0" to "2.33.1"
packages/core2-64-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.32.0 [default] to 2.33.1 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.32.0" to "2.33.1"
packages/core2-64-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.32.0 [default] to 2.33.1 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.32.0" to "2.33.1"
packages/core2-64-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.32.0 [default] to 2.33.1 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-src: PV changed from "2.32.0" to "2.33.1"
packages/core2-64-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.32.0 [default] to 2.33.1 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.32.0" to "2.33.1"
packages/core2-64-poky-linux/ttyrun/ttyrun: PKGV changed from 2.32.0 [default] to 2.33.1 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun: PV changed from "2.32.0" to "2.33.1"

--===============8267814914680219066==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.32.0-2.33.1.patch"

RnJvbSA2ZmI0MDQ0ODU2OWJjMTYwMGE4OTIyODI5NzQyOWI1ZjA2YmFlNjY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAwODoyNDoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHR0
eXJ1bjogdXBncmFkZSAyLjMyLjAgLT4gMi4zMy4xCgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL3R0
eXJ1bi97dHR5cnVuXzIuMzIuMC5iYiA9PiB0dHlydW5fMi4zMy4xLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb3JlL3R0eXJ1bi97dHR5cnVuXzIuMzIuMC5iYiA9PiB0dHlydW5fMi4zMy4xLmJifSAo
OTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zMi4w
LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3R0eXJ1bl8yLjMzLjEuYmIKc2ltaWxhcml0
eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3R0eXJ1bl8y
LjMyLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zMy4x
LmJiCmluZGV4IDgxNWY2MjVhNjcuLmNjYjdmOWIyNjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zMi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3R0
eXJ1bi90dHlydW5fMi4zMy4xLmJiCkBAIC03LDcgKzcsNyBAQCBMSUNFTlNFID0gIk1JVCIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWY1MTE4ZjE2N2IwNTViZmQ3YzM0
NTA4MDNmMTg0N2FmIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vaWJtLXMzOTAtbGlu
dXgvczM5MC10b29scztwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIgotU1JDUkVWID0gIjll
ZWE3OGIzYWQ4YWIzNzEwZmIzYjJkODBiOWNkMDU4ZDdjOGFiYTciCitTUkNSRVYgPSAiNjg2MjYy
ZmRjZGFlZDc5MDNjYTE3MjBkN2RkMGIxZjlmNTYyMWQ3YiIKIAogQ1ZFX1BST0RVQ1QgPSAiczM5
MC10b29scyIKIAotLSAKMi40NC4wCgo=

--===============8267814914680219066==--

