Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76904C83F1B
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:12 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1407.1751386804871394331
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ASjCoPT5;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=XEpCL03I;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010197c6c9dc3e-c503d0bd-b769-4295-acc8-4a67ce712370-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386807;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DFnri1MIlU8NRSPqKfH6VWO6sCv8TR0pd/3WLiVMNNI=;
	b=ASjCoPT5awRJ15XhnhT78IRXT1jP2KQro+/AkeSKAfxNUoGzvo4Wckeiu7WohFEt
	B6RR2zaon74oZ60Qco5Rh0uTpqjmhNkyZ95NDbJj2WHWe5PqYrl84UcLiTIBV0AXIO9
	Uc5CW67mU5scI7eUmJzCaGVvpz5Z8KJFgkm0YmWs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386807;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DFnri1MIlU8NRSPqKfH6VWO6sCv8TR0pd/3WLiVMNNI=;
	b=XEpCL03IB7Yw/5jMGoj4wns+pSdITYkSpZruBjA/e71YhRYf5HegrJ2ZU3HIEsq3
	5QSfxCQm3S8hOBljl0yaflsgPmKmtHz/kXrL312fjBfKdCJIOCmKAp/LzeglayDEyGi
	3dyz04r7LBK6utUu0twFIG3a3ax6GGQ86dGZihp8=
Content-Type: multipart/mixed; boundary="===============5090423071823690208=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.38.0 SUCCEEDED
Message-ID: <01010197c6c9dc3e-c503d0bd-b769-4295-acc8-4a67ce712370-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219613

--===============5090423071823690208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ttyrun* to *2.38.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ttyrun-upgrade-2.37.0-2.38.0.patch
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
From 2d344d9a54e810a06a0587db700d6f7d53650a79 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 08:01:07 +0000
Subject: [PATCH] ttyrun: upgrade 2.37.0 -> 2.38.0

---
 meta/recipes-core/ttyrun/{ttyrun_2.37.0.bb => ttyrun_2.38.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.37.0.bb => ttyrun_2.38.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.37.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.38.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.37.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.38.0.bb
index 507ad1b09e..2e2fa36851 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.37.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.38.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "793c037ded98cd001075cdb55a9c58e122380256"
+SRCREV = "660bab6e68fded26b2117e1dcec0844549a22fed"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.47.1


--===============5090423071823690208==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.37.0-2.38.0.patch"

RnJvbSAyZDM0NGQ5YTU0ZTgxMGEwNmEwNTg3ZGI3MDBkNmY3ZDUzNjUwYTc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwODowMTowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHR0
eXJ1bjogdXBncmFkZSAyLjM3LjAgLT4gMi4zOC4wCgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL3R0
eXJ1bi97dHR5cnVuXzIuMzcuMC5iYiA9PiB0dHlydW5fMi4zOC4wLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb3JlL3R0eXJ1bi97dHR5cnVuXzIuMzcuMC5iYiA9PiB0dHlydW5fMi4zOC4wLmJifSAo
OTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zNy4w
LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3R0eXJ1bl8yLjM4LjAuYmIKc2ltaWxhcml0
eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3R0eXJ1bl8y
LjM3LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zOC4w
LmJiCmluZGV4IDUwN2FkMWIwOWUuLjJlMmZhMzY4NTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zNy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3R0
eXJ1bi90dHlydW5fMi4zOC4wLmJiCkBAIC03LDcgKzcsNyBAQCBMSUNFTlNFID0gIk1JVCIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWY1MTE4ZjE2N2IwNTViZmQ3YzM0
NTA4MDNmMTg0N2FmIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vaWJtLXMzOTAtbGlu
dXgvczM5MC10b29scztwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIgotU1JDUkVWID0gIjc5
M2MwMzdkZWQ5OGNkMDAxMDc1Y2RiNTVhOWM1OGUxMjIzODAyNTYiCitTUkNSRVYgPSAiNjYwYmFi
NmU2OGZkZWQyNmIyMTE3ZTFkY2VjMDg0NDU0OWEyMmZlZCIKIAogQ1ZFX1BST0RVQ1QgPSAiczM5
MC10b29scyIKIAotLSAKMi40Ny4xCgo=

--===============5090423071823690208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ttyrun: PV changed from "2.37.0" to "2.38.0"
packages/core2-64-poky-linux/ttyrun: PKGV changed from 2.37.0 [default] to 2.38.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.37.0" to "2.38.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.37.0 [default] to 2.38.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.37.0" to "2.38.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.37.0 [default] to 2.38.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.37.0" to "2.38.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.37.0 [default] to 2.38.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.37.0" to "2.38.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.37.0 [default] to 2.38.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-src: PV changed from "2.37.0" to "2.38.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.37.0 [default] to 2.38.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.37.0" to "2.38.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.37.0 [default] to 2.38.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun: PV changed from "2.37.0" to "2.38.0"
packages/core2-64-poky-linux/ttyrun/ttyrun: PKGV changed from 2.37.0 [default] to 2.38.0 [default]

--===============5090423071823690208==--

