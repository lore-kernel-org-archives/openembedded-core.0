Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E36CC87FD6
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:50 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.12163.1752594932097233024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Cv2INhRD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RhZTSPBn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101980ecc99e2-40920d8c-6558-48c2-94d4-81ed993b1cf5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594946;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w/CRYCeie10TG6AnpKeqGr1O3MMCf9eb/JXXirsXfqc=;
	b=Cv2INhRDB7lQMpBdxoXfggpHSKwhoHqPy1QKQ6se2wliCEndMf/QjU+I5XaOMfdW
	IIRQMnh6bPpvQDJtq/k3vno9IJ6OdCYLInIg0uP8CLYdwvQJmb72pfFKqwi3Nk3t61L
	5fqPXa0QiySiDwAXpRb4eAIe485tRZw71xa/DL74=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594946;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w/CRYCeie10TG6AnpKeqGr1O3MMCf9eb/JXXirsXfqc=;
	b=RhZTSPBnObXtE2Uvr1qXIKq32C4i40NZy8wDX9FRP51gFpIh0wxSEixWNeMPp7LS
	L4GYJgUMXFviVss6uIKkbyMEvABYIVACQTYPYc7OlRvcd/Mzm8x/u6QfTwpID8eVoIu
	9v9IPsd+4ANIircIRj3/yix5BEnHC0qGmPQ8d4v8=
Content-Type: multipart/mixed; boundary="===============5277151110371548818=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] less: upgrading to 679 SUCCEEDED
Message-ID: <010101980ecc99e2-40920d8c-6558-48c2-94d4-81ed993b1cf5-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220362

--===============5277151110371548818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *less* to *679* has Succeeded.

Next steps:
    - apply the patch: git am 0001-less-upgrade-678-679.patch
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
From aa8febbd19a2003c209ea6b99582c21809ba0e6a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 10:46:37 +0000
Subject: [PATCH] less: upgrade 678 -> 679

---
 meta/recipes-extended/less/{less_678.bb => less_679.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_678.bb => less_679.bb} (95%)

diff --git a/meta/recipes-extended/less/less_678.bb b/meta/recipes-extended/less/less_679.bb
similarity index 95%
rename from meta/recipes-extended/less/less_678.bb
rename to meta/recipes-extended/less/less_679.bb
index 87ec6c92ca..613c71f571 100644
--- a/meta/recipes-extended/less/less_678.bb
+++ b/meta/recipes-extended/less/less_679.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "4c085364f3028290d34647df27f56018c365dc4c0092ab7de74ed8fe89014fe7"
+SRC_URI[sha256sum] = "9b68820c34fa8a0af6b0e01b74f0298bcdd40a0489c61649b47058908a153d78"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.47.1


--===============5277151110371548818==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-less-upgrade-678-679.patch"

RnJvbSBhYThmZWJiZDE5YTIwMDNjMjA5ZWE2Yjk5NTgyYzIxODA5YmEwZTZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTA6NDY6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
ZXNzOiB1cGdyYWRlIDY3OCAtPiA2NzkKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xlc3Mv
e2xlc3NfNjc4LmJiID0+IGxlc3NfNjc5LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9s
ZXNzL3tsZXNzXzY3OC5iYiA9PiBsZXNzXzY3OS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzY3OC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9sZXNzL2xlc3NfNjc5LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNjc4LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbGVzcy9sZXNzXzY3OS5iYgppbmRleCA4N2VjNmM5MmNhLi42MTNjNzFmNTcxIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzY3OC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzY3OS5iYgpAQCAtMjksNyArMjksNyBAQCBT
UkNfVVJJID0gImh0dHA6Ly93d3cuZ3JlZW53b29kc29mdHdhcmUuY29tLyR7QlBOfS8ke0JQTn0t
JHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAg
ICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRjMDg1MzY0ZjMwMjgyOTBkMzQ2NDdkZjI3ZjU2
MDE4YzM2NWRjNGMwMDkyYWI3ZGU3NGVkOGZlODkwMTRmZTciCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiOWI2ODgyMGMzNGZhOGEwYWY2YjBlMDFiNzRmMDI5OGJjZGQ0MGEwNDg5YzYxNjQ5YjQ3MDU4
OTA4YTE1M2Q3OCIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHA6Ly93d3cuZ3JlZW53b29k
c29mdHdhcmUuY29tL2xlc3MvZG93bmxvYWQuaHRtbCIKIAotLSAKMi40Ny4xCgo=

--===============5277151110371548818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/less: PV changed from "678" to "679"
packages/core2-64-poky-linux/less: SRC_URI changed from "http://www.greenwoodsoftware.com/less/less-678.tar.gz file://run-ptest" to "http://www.greenwoodsoftware.com/less/less-679.tar.gz file://run-ptest"
packages/core2-64-poky-linux/less: PKGV changed from 678 [default] to 679 [default]
packages/core2-64-poky-linux/less/less-dbg: PV changed from "678" to "679"
packages/core2-64-poky-linux/less/less-dbg: PKGV changed from 678 [default] to 679 [default]
packages/core2-64-poky-linux/less/less-dev: PV changed from "678" to "679"
packages/core2-64-poky-linux/less/less-dev: PKGV changed from 678 [default] to 679 [default]
packages/core2-64-poky-linux/less/less-doc: PV changed from "678" to "679"
packages/core2-64-poky-linux/less/less-doc: PKGV changed from 678 [default] to 679 [default]
packages/core2-64-poky-linux/less/less-locale: PV changed from "678" to "679"
packages/core2-64-poky-linux/less/less-locale: PKGV changed from 678 [default] to 679 [default]
packages/core2-64-poky-linux/less/less-ptest: PV changed from "678" to "679"
packages/core2-64-poky-linux/less/less-ptest: PKGV changed from 678 [default] to 679 [default]
packages/core2-64-poky-linux/less/less-src: PV changed from "678" to "679"
packages/core2-64-poky-linux/less/less-src: PKGV changed from 678 [default] to 679 [default]
packages/core2-64-poky-linux/less/less-staticdev: PV changed from "678" to "679"
packages/core2-64-poky-linux/less/less-staticdev: PKGV changed from 678 [default] to 679 [default]
packages/core2-64-poky-linux/less/less: PV changed from "678" to "679"
packages/core2-64-poky-linux/less/less: PKGV changed from 678 [default] to 679 [default]

--===============5277151110371548818==--

