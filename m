Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FD9C531F7
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:01 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1390.1771440099760607578
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=zzwkA9d7;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=nwdJXSXF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019c720efefb-70cdcf59-5cfe-4743-9d80-3dd85045bd1a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440111;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ICUEv+pvauRqJbjxSkv4qvCgQBr/Kmz2JDGJyaepcEE=;
	b=zzwkA9d7AN4G+fUOkqiPFLRIYJRAZf7Fy6bBS0kFHVm0IWJIgC0HcL2E062sZnas
	D2llwy5Bu+hCMg0oSv6It5L3JtbVUEvnn1TK060Tx9TmD+pjU8zIXf7EPZEmSmVkdEe
	ZohoixQ5eE/w1q9nGPahsdvPweQxV6cdrFbnHDNY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440111;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ICUEv+pvauRqJbjxSkv4qvCgQBr/Kmz2JDGJyaepcEE=;
	b=nwdJXSXFRLN08Qx7EupInrZPg96jww32+YrYB08IJJVQ7uFJUGaOwmM4jLopQY9L
	92ewaQBkr/uwD2hqlXHTr8Ag5gUG/1Hx9s2pLRn29uLkrf3P6xsrwD3+RYN+C+n/l7K
	kkfKwUH/0qlhVf4RrQcDgWVMk/Cg1ON2WfcDJmdo=
Content-Type: multipart/mixed; boundary="===============6985864345993082207=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] wireless-regdb: upgrading to 2026.02.04 SUCCEEDED
Message-ID: <0101019c720efefb-70cdcf59-5cfe-4743-9d80-3dd85045bd1a-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231390

--===============6985864345993082207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wireless-regdb* to *2026.02.04* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2025.10.07-2026.02.04.patch
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
From da107c543fd6ef9bd3917325aeb5da9f6f049159 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 15:54:53 +0000
Subject: [PATCH] wireless-regdb: upgrade 2025.10.07 -> 2026.02.04

---
 ...ireless-regdb_2025.10.07.bb => wireless-regdb_2026.02.04.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.10.07.bb => wireless-regdb_2026.02.04.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
index 68ae3b0464..2f7c816043 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d4c872a44154604c869f5851f7d21d818d492835d370af7f58de8847973801c3"
+SRC_URI[sha256sum] = "0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6"
 
 inherit bin_package allarch
 
-- 
2.47.1


--===============6985864345993082207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: PKGV changed from 2025.10.07 [default] to 2026.02.04 [default]
packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2025.10.07.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2026.02.04.tar.xz"
packages/all-poky-linux/wireless-regdb: PV changed from "2025.10.07" to "2026.02.04"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2025.10.07 [default] to 2026.02.04 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2025.10.07" to "2026.02.04"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2025.10.07 [default] to 2026.02.04 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 7413 to 7393 (-0%)
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2025.10.07" to "2026.02.04"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2025.10.07 [default] to 2026.02.04 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 8755 to 8751 (-0%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2025.10.07" to "2026.02.04"

--===============6985864345993082207==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2025.10.07-2026.02.04.patch"

RnJvbSBkYTEwN2M1NDNmZDZlZjliZDM5MTczMjVhZWI1ZGE5ZjZmMDQ5MTU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTU6NTQ6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
aXJlbGVzcy1yZWdkYjogdXBncmFkZSAyMDI1LjEwLjA3IC0+IDIwMjYuMDIuMDQKCi0tLQogLi4u
aXJlbGVzcy1yZWdkYl8yMDI1LjEwLjA3LmJiID0+IHdpcmVsZXNzLXJlZ2RiXzIwMjYuMDIuMDQu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi97d2lyZWxlc3MtcmVn
ZGJfMjAyNS4xMC4wNy5iYiA9PiB3aXJlbGVzcy1yZWdkYl8yMDI2LjAyLjA0LmJifSAoOTQlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3Mt
cmVnZGJfMjAyNS4xMC4wNy5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyNi4wMi4wNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNzLXJlZ2RiXzIw
MjUuMTAuMDcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyNi4wMi4wNC5iYgppbmRleCA2OGFlM2IwNDY0Li4yZjdjODE2MDQz
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNz
LXJlZ2RiXzIwMjUuMTAuMDcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1y
ZWdkYi93aXJlbGVzcy1yZWdkYl8yMDI2LjAyLjA0LmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIklTQyIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTA3YzRmNmRl
YTM4NDViMDJhMThkYzAwYzhjODc2OTljIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvcHViL3NvZnR3YXJlL25ldHdvcmsvJHtCUE59LyR7QlB9LnRhci54eiIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJkNGM4NzJhNDQxNTQ2MDRjODY5ZjU4NTFmN2QyMWQ4MThkNDkyODM1ZDM3
MGFmN2Y1OGRlODg0Nzk3MzgwMWMzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBmZjQ4YTVjZDll
OWNmZThlODE1YTI0ZTAyMzczNDkxOWU5YTNiN2FkMmYwMzkyNDNhZDEyMWNmNWFhYmY2YzYiCiAK
IGluaGVyaXQgYmluX3BhY2thZ2UgYWxsYXJjaAogCi0tIAoyLjQ3LjEKCg==

--===============6985864345993082207==--

