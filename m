Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71776C07CA9
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.813.1686887482033781643
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fYAWiq3z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188c2544dd2-33ad53ba-a7f0-4720-a1de-c3343befba88-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NYx9LBoYwjajrgV+yV8BXVhlmkxW1p6oNHB/vd7xBbY=;
	b=fYAWiq3zbK/XTaFsdOtm6Pt/MJp/x0rS5zOHMycpLg4/86PyopDG/KuQ/20fHB51
	QAhe52GOLPLmcc0oRqKsil3KpbKbYDA5yZiZuAbPctreX6ZgoZX6OqfLoiAeWIBie5t
	pTjkE3ah5sgglDrFpLzP7VU+8CDw7Qv2F95quS10=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NYx9LBoYwjajrgV+yV8BXVhlmkxW1p6oNHB/vd7xBbY=;
	b=WDlfkl/jOktvLSwvOFTfF2DZiD3xem37FsV3wFxaoaTWnsoTowtq171d8BsvnyIB
	rXUxAgvFuTGbaxuaBjMrJPw1DIPwvRDP0GDYakKafiwILlRV1rone/cihjYddJkWeG3
	3I+LNxGM9proHQm3C3zaHyaexvAdNHyyGnrJkLEc=
Content-Type: multipart/mixed; boundary="===============8895350434007740681=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Adrian Bunk <bunk@kernel.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wireless-regdb: upgrading to 2023.05.03 SUCCEEDED
Message-ID: <01010188c2544dd2-33ad53ba-a7f0-4720-a1de-c3343befba88-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182953

--===============8895350434007740681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wireless-regdb* to *2023.05.03* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2023.02.13-2023.05.03.patch
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
From e63a8ad9ece9973db7d0cf6bd227af32fde6a469 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 22:33:29 +0000
Subject: [PATCH] wireless-regdb: upgrade 2023.02.13 -> 2023.05.03

---
 ...ireless-regdb_2023.02.13.bb => wireless-regdb_2023.05.03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2023.02.13.bb => wireless-regdb_2023.05.03.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
index ce60154f1e..cd3f52fc76 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "fe81e8a8694dc4753a45087a1c4c7e1b48dee5a59f5f796ce374ea550f0b2e73"
+SRC_URI[sha256sum] = "f254d08ab3765aeae2b856222e11a95d44aef519a6663877c71ef68fae4c8c12"
 
 inherit bin_package allarch
 
-- 
2.39.2


--===============8895350434007740681==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2023.02.13-2023.05.03.patch"

RnJvbSBlNjNhOGFkOWVjZTk5NzNkYjdkMGNmNmJkMjI3YWYzMmZkZTZhNDY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMjI6MzM6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
aXJlbGVzcy1yZWdkYjogdXBncmFkZSAyMDIzLjAyLjEzIC0+IDIwMjMuMDUuMDMKCi0tLQogLi4u
aXJlbGVzcy1yZWdkYl8yMDIzLjAyLjEzLmJiID0+IHdpcmVsZXNzLXJlZ2RiXzIwMjMuMDUuMDMu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi97d2lyZWxlc3MtcmVn
ZGJfMjAyMy4wMi4xMy5iYiA9PiB3aXJlbGVzcy1yZWdkYl8yMDIzLjA1LjAzLmJifSAoOTQlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3Mt
cmVnZGJfMjAyMy4wMi4xMy5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyMy4wNS4wMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNzLXJlZ2RiXzIw
MjMuMDIuMTMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyMy4wNS4wMy5iYgppbmRleCBjZTYwMTU0ZjFlLi5jZDNmNTJmYzc2
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNz
LXJlZ2RiXzIwMjMuMDIuMTMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1y
ZWdkYi93aXJlbGVzcy1yZWdkYl8yMDIzLjA1LjAzLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIklTQyIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTA3YzRmNmRl
YTM4NDViMDJhMThkYzAwYzhjODc2OTljIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvcHViL3NvZnR3YXJlL25ldHdvcmsvJHtCUE59LyR7QlB9LnRhci54eiIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJmZTgxZThhODY5NGRjNDc1M2E0NTA4N2ExYzRjN2UxYjQ4ZGVlNWE1OWY1
Zjc5NmNlMzc0ZWE1NTBmMGIyZTczIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImYyNTRkMDhhYjM3
NjVhZWFlMmI4NTYyMjJlMTFhOTVkNDRhZWY1MTlhNjY2Mzg3N2M3MWVmNjhmYWU0YzhjMTIiCiAK
IGluaGVyaXQgYmluX3BhY2thZ2UgYWxsYXJjaAogCi0tIAoyLjM5LjIKCg==

--===============8895350434007740681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: PKGV changed from 2023.02.13 [default] to 2023.05.03 [default]
packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2023.02.13.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2023.05.03.tar.xz"
packages/all-poky-linux/wireless-regdb: PV changed from "2023.02.13" to "2023.05.03"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2023.02.13 [default] to 2023.05.03 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2023.02.13" to "2023.05.03"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2023.02.13 [default] to 2023.05.03 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2023.02.13" to "2023.05.03"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 5858 to 5910 (+1%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2023.02.13 [default] to 2023.05.03 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2023.02.13" to "2023.05.03"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 6871 to 6923 (+1%)

--===============8895350434007740681==--

