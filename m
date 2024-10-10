Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6B6D1A442
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:30 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.53299.1728588979640380312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=i6ZuKQmi;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=4fgmqGmY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019277ee9f46-9a6ffed6-2a34-49a5-888e-0211bc478e4d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588980;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ItKeZIN6H+45H6iGfzpyWIZwL9auomYyAajZHVq4IWE=;
	b=i6ZuKQmiqnKbH3XDVC8VqzWQrTPBn6IqihoogqppgCN51s0MRlj2OEMqE1kMOEtb
	+GgcPq9RlG17JBES0SOt52qLBqngSSnCap9YTaH18thVOG8WONXShVy+bbdM9Q/cG9D
	rUKcbTmnze8lExiNSd/pqtvmqNVYCUWg3nIN4BGY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588980;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ItKeZIN6H+45H6iGfzpyWIZwL9auomYyAajZHVq4IWE=;
	b=4fgmqGmY5LFlMI4F9O4+t8kAO0IFDwa4Y5XGGwPa05Z94+n1QbM3V2X259++Xf0T
	6kIPQfTqsNQCEW79m5N4R5x2UcWZPLKC9975qP53XJ/wzA2VqNtedt2VX1RrATvu5qC
	+LjsDvdQ1x1PnRWWa0O7IYJmUG9Wg6d2p/9p1/Lg=
Content-Type: multipart/mixed; boundary="===============5778718889341005532=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] wireless-regdb: upgrading to 2024.10.07 SUCCEEDED
Message-ID: <0101019277ee9f46-9a6ffed6-2a34-49a5-888e-0211bc478e4d-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205556

--===============5778718889341005532==
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
From 37458c03ded2dd33461b32a1a7a07f0d3b1f3f57 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 15:51:10 +0000
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


--===============5778718889341005532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2024.07.04.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2024.10.07.tar.xz"
packages/all-poky-linux/wireless-regdb: PV changed from "2024.07.04" to "2024.10.07"
packages/all-poky-linux/wireless-regdb: PKGV changed from 2024.07.04 [default] to 2024.10.07 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2024.07.04" to "2024.10.07"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2024.07.04 [default] to 2024.10.07 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2024.07.04" to "2024.10.07"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 6525 to 7065 (+8%)
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2024.07.04 [default] to 2024.10.07 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2024.07.04" to "2024.10.07"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 7747 to 8351 (+8%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2024.07.04 [default] to 2024.10.07 [default]

--===============5778718889341005532==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2024.07.04-2024.10.07.patch"

RnJvbSAzNzQ1OGMwM2RlZDJkZDMzNDYxYjMyYTFhN2EwN2YwZDNiMWYzZjU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTU6NTE6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
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

--===============5778718889341005532==--

