Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E86CCFC602
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:35:42 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.53350.1728588940637321485
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SK3lJ009;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Y0nMkEHa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019277ee01ac-49adb6ee-8c3e-4cb0-9f7b-204ec707972f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588939;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ywL/C74bDZ+pLj3w56R2EEQZNSTnsGgH2f7RdgOtQ1w=;
	b=SK3lJ009vvIqqNJXykZv3vDWeoER4leIMtHve3cPOeHP7P4Ban/dxIUbV3Q8Tbju
	VedhG1APBsF/2rU/aGZSUi0c8ossayEEaA4dBd4hZGsDozBjkjPNokhXFalxHzFBFn4
	bIyGOwaxvw5o9uPuDVvNB8AP/C5/VeUKEUbAA7XU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588939;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ywL/C74bDZ+pLj3w56R2EEQZNSTnsGgH2f7RdgOtQ1w=;
	b=Y0nMkEHaLL4ngNg8h6H3JQr0gqLHXBAHkCukCNk5QQXehwQj5izuiRyeZcuLn9nq
	jKu+3VhNCmh+rGNhJou8EWckA/wBnBzdbzaq7s13/j2/l28cIML0fc8BU01UEKljcHh
	cBLUfccU5+Xp+U1L7azmOC0SXvAHXSrdQFyTJJq8=
Content-Type: multipart/mixed; boundary="===============3438170286142889573=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] wireless-regdb: upgrading to 2024.10.07 SUCCEEDED
Message-ID: <0101019277ee01ac-49adb6ee-8c3e-4cb0-9f7b-204ec707972f-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:35:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205435

--===============3438170286142889573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wireless-regdb* to *2024.10.07* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2024.07.04-2024.10.07.patch
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
From 3dd0e634d1584bd889b8f623320d239c76cca4c5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 05:35:54 +0000
Subject: [PATCH] wireless-regdb: upgrade 2024.07.04 -> 2024.10.07

---
 ...ireless-regdb_2024.07.04.bb => wireless-regdb_2024.10.07.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.07.04.bb => wireless-regdb_2024.10.07.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
index daf5e6dfcd..0e4100fba7 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "9832a14e1be24abff7be30dee3c9a1afb5fdfcf475a0d91aafef039f8d85f5eb"
+SRC_URI[sha256sum] = "f76f2bd79a653e9f9dd50548d99d03a4a4eb157da056dfd5892f403ec28fb3d5"
 
 inherit bin_package allarch
 
-- 
2.44.1


--===============3438170286142889573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: PV changed from "2024.07.04" to "2024.10.07"
packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2024.07.04.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2024.10.07.tar.xz"
packages/all-poky-linux/wireless-regdb: PKGV changed from 2024.07.04 [default] to 2024.10.07 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2024.07.04" to "2024.10.07"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2024.07.04 [default] to 2024.10.07 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 6525 to 7065 (+8%)
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2024.07.04" to "2024.10.07"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2024.07.04 [default] to 2024.10.07 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 7747 to 8351 (+8%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2024.07.04" to "2024.10.07"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2024.07.04 [default] to 2024.10.07 [default]

--===============3438170286142889573==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2024.07.04-2024.10.07.patch"

RnJvbSAzZGQwZTYzNGQxNTg0YmQ4ODliOGY2MjMzMjBkMjM5Yzc2Y2NhNGM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDU6MzU6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
aXJlbGVzcy1yZWdkYjogdXBncmFkZSAyMDI0LjA3LjA0IC0+IDIwMjQuMTAuMDcKCi0tLQogLi4u
aXJlbGVzcy1yZWdkYl8yMDI0LjA3LjA0LmJiID0+IHdpcmVsZXNzLXJlZ2RiXzIwMjQuMTAuMDcu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi97d2lyZWxlc3MtcmVn
ZGJfMjAyNC4wNy4wNC5iYiA9PiB3aXJlbGVzcy1yZWdkYl8yMDI0LjEwLjA3LmJifSAoOTQlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3Mt
cmVnZGJfMjAyNC4wNy4wNC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyNC4xMC4wNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNzLXJlZ2RiXzIw
MjQuMDcuMDQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyNC4xMC4wNy5iYgppbmRleCBkYWY1ZTZkZmNkLi4wZTQxMDBmYmE3
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNz
LXJlZ2RiXzIwMjQuMDcuMDQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1y
ZWdkYi93aXJlbGVzcy1yZWdkYl8yMDI0LjEwLjA3LmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIklTQyIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTA3YzRmNmRl
YTM4NDViMDJhMThkYzAwYzhjODc2OTljIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvcHViL3NvZnR3YXJlL25ldHdvcmsvJHtCUE59LyR7QlB9LnRhci54eiIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI5ODMyYTE0ZTFiZTI0YWJmZjdiZTMwZGVlM2M5YTFhZmI1ZmRmY2Y0NzVh
MGQ5MWFhZmVmMDM5ZjhkODVmNWViIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImY3NmYyYmQ3OWE2
NTNlOWY5ZGQ1MDU0OGQ5OWQwM2E0YTRlYjE1N2RhMDU2ZGZkNTg5MmY0MDNlYzI4ZmIzZDUiCiAK
IGluaGVyaXQgYmluX3BhY2thZ2UgYWxsYXJjaAogCi0tIAoyLjQ0LjEKCg==

--===============3438170286142889573==--

