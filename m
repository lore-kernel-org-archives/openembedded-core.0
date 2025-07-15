Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17179CA0EE1
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:56:04 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.12180.1752594943302919794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0zvfw4cB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=EC6pZ9GZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101980eccb168-89773ca1-2be1-40bd-9e07-ce697a9c4054-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594952;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IlK2zVVrhVam/YWJ37F0v+te9w1P2mxq4+/k+pnAKiQ=;
	b=0zvfw4cB8WsS8KU3H1TKHEW5Rr7eGnnr0VHVD0gmVqNPM7rKcChTJmn/0utGCFWX
	YpWm/yBlZqfMXBrfCtR2rBouH0tv8c5b8FG98fXhdtGq3jVQe4d9aAxwFiG9jIB+02F
	Tp+LugGTsog5yDMysnK4naNNEXMhN+eyAsTBj/8g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594952;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IlK2zVVrhVam/YWJ37F0v+te9w1P2mxq4+/k+pnAKiQ=;
	b=EC6pZ9GZdQZN1Rs9dZMVSb8kf9O5LXhTAPbbciEKUAjyJV5+vQEvukIqFKN8JNM0
	DYCp0Us9rM8pi/sBg/j5u+HZbt7IqqIzhDDg6QGUgwsAuwoh7vA4Q4w2ZqCqyGhMvRc
	3QKZ+xjL5U+zOcyWbxsrjEN4DkNUpSOzafSiju3k=
Content-Type: multipart/mixed; boundary="===============4571018398931090358=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] wireless-regdb: upgrading to 2025.07.10 SUCCEEDED
Message-ID: <010101980eccb168-89773ca1-2be1-40bd-9e07-ce697a9c4054-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220386

--===============4571018398931090358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wireless-regdb* to *2025.07.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2025.02.20-2025.07.10.patch
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
From 7f06fcf2846bd6ac73e1702eb017800425a0273a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 14:31:18 +0000
Subject: [PATCH] wireless-regdb: upgrade 2025.02.20 -> 2025.07.10

---
 ...ireless-regdb_2025.02.20.bb => wireless-regdb_2025.07.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.02.20.bb => wireless-regdb_2025.07.10.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.02.20.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.07.10.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.02.20.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.07.10.bb
index 09fff768c4..decccad05a 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.02.20.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.07.10.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "57f8e7721cf5a880c13ae0c202edbb21092a060d45f9e9c59bcd2a8272bfa456"
+SRC_URI[sha256sum] = "a8340bcdcd1b5db6c79149879d122b170f3bb075381718d4f429ad831a6fa28d"
 
 inherit bin_package allarch
 
-- 
2.47.1


--===============4571018398931090358==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2025.02.20-2025.07.10.patch"

RnJvbSA3ZjA2ZmNmMjg0NmJkNmFjNzNlMTcwMmViMDE3ODAwNDI1YTAyNzNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTQ6MzE6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
aXJlbGVzcy1yZWdkYjogdXBncmFkZSAyMDI1LjAyLjIwIC0+IDIwMjUuMDcuMTAKCi0tLQogLi4u
aXJlbGVzcy1yZWdkYl8yMDI1LjAyLjIwLmJiID0+IHdpcmVsZXNzLXJlZ2RiXzIwMjUuMDcuMTAu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi97d2lyZWxlc3MtcmVn
ZGJfMjAyNS4wMi4yMC5iYiA9PiB3aXJlbGVzcy1yZWdkYl8yMDI1LjA3LjEwLmJifSAoOTQlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3Mt
cmVnZGJfMjAyNS4wMi4yMC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyNS4wNy4xMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNzLXJlZ2RiXzIw
MjUuMDIuMjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyNS4wNy4xMC5iYgppbmRleCAwOWZmZjc2OGM0Li5kZWNjY2FkMDVh
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNz
LXJlZ2RiXzIwMjUuMDIuMjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1y
ZWdkYi93aXJlbGVzcy1yZWdkYl8yMDI1LjA3LjEwLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIklTQyIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTA3YzRmNmRl
YTM4NDViMDJhMThkYzAwYzhjODc2OTljIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvcHViL3NvZnR3YXJlL25ldHdvcmsvJHtCUE59LyR7QlB9LnRhci54eiIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI1N2Y4ZTc3MjFjZjVhODgwYzEzYWUwYzIwMmVkYmIyMTA5MmEwNjBkNDVm
OWU5YzU5YmNkMmE4MjcyYmZhNDU2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImE4MzQwYmNkY2Qx
YjVkYjZjNzkxNDk4NzlkMTIyYjE3MGYzYmIwNzUzODE3MThkNGY0MjlhZDgzMWE2ZmEyOGQiCiAK
IGluaGVyaXQgYmluX3BhY2thZ2UgYWxsYXJjaAogCi0tIAoyLjQ3LjEKCg==

--===============4571018398931090358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2025.02.20.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2025.07.10.tar.xz"
packages/all-poky-linux/wireless-regdb: PV changed from "2025.02.20" to "2025.07.10"
packages/all-poky-linux/wireless-regdb: PKGV changed from 2025.02.20 [default] to 2025.07.10 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2025.02.20" to "2025.07.10"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2025.02.20 [default] to 2025.07.10 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2025.02.20" to "2025.07.10"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 7277 to 7333 (+1%)
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2025.02.20 [default] to 2025.07.10 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2025.02.20" to "2025.07.10"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2025.02.20 [default] to 2025.07.10 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 8563 to 8655 (+1%)

--===============4571018398931090358==--

