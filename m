Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D31FC3DA5A
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:29 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.1260.1715794339636628663
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JRnyO742;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=yYhrXlMN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018f7d4fe52b-bd35db93-70d4-4e0e-987e-8e1291da0814-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794339;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=LdQM0QUGm6VBUoQpceZcXA614DjfHWQnaLLh2kxd8zc=;
	b=JRnyO742g8Sz+PrbbqvIXN/Xro949F1pAZnEdwyT7qAHM6mCe7845MzOPTozVqtT
	tQaIy7aJNADSsp9UUZMQI26Xc5chZSPPxNzwhTml/TVpAAK37A9Xxz+3Q7y6L0eI88+
	nu2QgOdNuGrCk7bTytqIm9PBzXsv4y9wzqt5xqjE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794339;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=LdQM0QUGm6VBUoQpceZcXA614DjfHWQnaLLh2kxd8zc=;
	b=yYhrXlMN5But30VMpkAO4he2bum4ZYVxu1BF/W+3qTuNr3xV4kUnqenEsgzyVF/1
	K0HLFHmghX2rCSHoKVAn0QPPSbHgkDQ2HoMrwZPKOOxQ8vbxXG0zD8NCP5SaZPWEG2Q
	qmJ88nhSaSWMsBt//pd94vW8NOE5Jlkb/2AEBqMs=
Content-Type: multipart/mixed; boundary="===============4849767099861059432=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] wireless-regdb: upgrading to 2024.05.08 SUCCEEDED
Message-ID: <0101018f7d4fe52b-bd35db93-70d4-4e0e-987e-8e1291da0814-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199393

--===============4849767099861059432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wireless-regdb* to *2024.05.08* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2024.01.23-2024.05.08.patch
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
From dec0ebb639929ec851d3f8dbf535faa00d8db1d5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 15:21:58 +0000
Subject: [PATCH] wireless-regdb: upgrade 2024.01.23 -> 2024.05.08

---
 ...ireless-regdb_2024.01.23.bb => wireless-regdb_2024.05.08.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.01.23.bb => wireless-regdb_2024.05.08.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
index 8fde236ab4..95e33d9fb1 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "c8a61c9acf76fa7eb4239e89f640dee3e87098d9f69b4d3518c9c60fc6d20c55"
+SRC_URI[sha256sum] = "9aee1d86ebebb363b714bec941b2820f31e3b7f1a485ddc9fcbd9985c7d3e7c4"
 
 inherit bin_package allarch
 
-- 
2.44.0


--===============4849767099861059432==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2024.01.23-2024.05.08.patch"

RnJvbSBkZWMwZWJiNjM5OTI5ZWM4NTFkM2Y4ZGJmNTM1ZmFhMDBkOGRiMWQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTU6MjE6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
aXJlbGVzcy1yZWdkYjogdXBncmFkZSAyMDI0LjAxLjIzIC0+IDIwMjQuMDUuMDgKCi0tLQogLi4u
aXJlbGVzcy1yZWdkYl8yMDI0LjAxLjIzLmJiID0+IHdpcmVsZXNzLXJlZ2RiXzIwMjQuMDUuMDgu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi97d2lyZWxlc3MtcmVn
ZGJfMjAyNC4wMS4yMy5iYiA9PiB3aXJlbGVzcy1yZWdkYl8yMDI0LjA1LjA4LmJifSAoOTQlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3Mt
cmVnZGJfMjAyNC4wMS4yMy5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyNC4wNS4wOC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNzLXJlZ2RiXzIw
MjQuMDEuMjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyNC4wNS4wOC5iYgppbmRleCA4ZmRlMjM2YWI0Li45NWUzM2Q5ZmIx
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNz
LXJlZ2RiXzIwMjQuMDEuMjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1y
ZWdkYi93aXJlbGVzcy1yZWdkYl8yMDI0LjA1LjA4LmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIklTQyIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTA3YzRmNmRl
YTM4NDViMDJhMThkYzAwYzhjODc2OTljIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvcHViL3NvZnR3YXJlL25ldHdvcmsvJHtCUE59LyR7QlB9LnRhci54eiIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJjOGE2MWM5YWNmNzZmYTdlYjQyMzllODlmNjQwZGVlM2U4NzA5OGQ5ZjY5
YjRkMzUxOGM5YzYwZmM2ZDIwYzU1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlhZWUxZDg2ZWJl
YmIzNjNiNzE0YmVjOTQxYjI4MjBmMzFlM2I3ZjFhNDg1ZGRjOWZjYmQ5OTg1YzdkM2U3YzQiCiAK
IGluaGVyaXQgYmluX3BhY2thZ2UgYWxsYXJjaAogCi0tIAoyLjQ0LjAKCg==

--===============4849767099861059432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: PKGV changed from 2024.01.23 [default] to 2024.05.08 [default]
packages/all-poky-linux/wireless-regdb: PV changed from "2024.01.23" to "2024.05.08"
packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2024.01.23.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2024.05.08.tar.xz"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2024.01.23 [default] to 2024.05.08 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2024.01.23" to "2024.05.08"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2024.01.23 [default] to 2024.05.08 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2024.01.23" to "2024.05.08"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 5981 to 6021 (+1%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2024.01.23 [default] to 2024.05.08 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2024.01.23" to "2024.05.08"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 7143 to 7175 (+0%)

--===============4849767099861059432==--

