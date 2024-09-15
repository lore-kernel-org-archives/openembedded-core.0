Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19C9C36016
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.115400.1726410841501496218
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ENJ7blM7;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=iAdnWKt2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010191f61ada8a-51ebc3f0-4dd8-4768-b04d-e837c81b88c2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dTC/yYbYZYwYiNczftMCG8M513fVG69r80zSxMggxb0=;
	b=ENJ7blM7GIaNuSxfY5fVQdC5rVuPJa5Dk+j7OJFlNLCwitgVUFl1oIDxkiClsNQY
	2Dwh/2rcW4Ye7e5Crq8pivzFbLh5b0dBmXmaP78IiVFEk/mi24fejmT9/KY8tmBbmjV
	L51RjBITM8mvXnAmA/l3UawWwM+tQf1GdVlyArQY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dTC/yYbYZYwYiNczftMCG8M513fVG69r80zSxMggxb0=;
	b=iAdnWKt2utvgEYh4hKT7qt+P/0pET7Rm2KTgk7L4PmfBJACMYecQ8+3lp8K6q8BF
	0HLHEf2gqyJbrHgP8JZbQhQ5XlvVjR8UcuDqUoXeuZ5L/cijiSmFh9VIyPFsk/TAx24
	vwya0fkZijJaMIAqwvwfDY5lvQzZVxT0Pxm+NvSs=
Content-Type: multipart/mixed; boundary="===============2377367701276606277=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iputils: upgrading to 20240905 SUCCEEDED
Message-ID: <01010191f61ada8a-51ebc3f0-4dd8-4768-b04d-e837c81b88c2-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204549

--===============2377367701276606277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *iputils* to *20240905* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iputils-upgrade-20240117-20240905.patch
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
From b9f5ca1bd5dff38ff1d9682fe854f23e4c81a46b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 09:49:19 +0000
Subject: [PATCH] iputils: upgrade 20240117 -> 20240905

---
 .../iputils/{iputils_20240117.bb => iputils_20240905.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/iputils/{iputils_20240117.bb => iputils_20240905.bb} (97%)

diff --git a/meta/recipes-extended/iputils/iputils_20240117.bb b/meta/recipes-extended/iputils/iputils_20240905.bb
similarity index 97%
rename from meta/recipes-extended/iputils/iputils_20240117.bb
rename to meta/recipes-extended/iputils/iputils_20240905.bb
index 3880689742..ca8ddc530d 100644
--- a/meta/recipes-extended/iputils/iputils_20240117.bb
+++ b/meta/recipes-extended/iputils/iputils_20240905.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=627cc07ec86a45951d43e30658bbd819"
 DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https"
-SRCREV = "8372f355bdf7a9b0c79338dd8ef8464c00a5c4e2"
+SRCREV = "10b50784aae3fb75c96cdf9b1668916b49557dd5"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


--===============2377367701276606277==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iputils-upgrade-20240117-20240905.patch"

RnJvbSBiOWY1Y2ExYmQ1ZGZmMzhmZjFkOTY4MmZlODU0ZjIzZTRjODFhNDZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMDk6NDk6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
cHV0aWxzOiB1cGdyYWRlIDIwMjQwMTE3IC0+IDIwMjQwOTA1CgotLS0KIC4uLi9pcHV0aWxzL3tp
cHV0aWxzXzIwMjQwMTE3LmJiID0+IGlwdXRpbHNfMjAyNDA5MDUuYmJ9ICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9pcHV0aWxzL3tpcHV0aWxzXzIwMjQwMTE3LmJiID0+IGlwdXRp
bHNfMjAyNDA5MDUuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2lwdXRpbHMvaXB1dGlsc18yMDI0MDExNy5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9pcHV0
aWxzL2lwdXRpbHNfMjAyNDA5MDUuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2lwdXRpbHMvaXB1dGlsc18yMDI0MDExNy5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2lwdXRpbHMvaXB1dGlsc18yMDI0MDkwNS5iYgppbmRl
eCAzODgwNjg5NzQyLi5jYThkZGM1MzBkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvaXB1dGlscy9pcHV0aWxzXzIwMjQwMTE3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9pcHV0aWxzL2lwdXRpbHNfMjAyNDA5MDUuYmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NjI3Y2MwN2VjODZhNDU5NTFkNDNlMzA2NThi
YmQ4MTkiCiBERVBFTkRTID0gImdudXRscyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L2lwdXRpbHMvaXB1dGlsczticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0g
IjgzNzJmMzU1YmRmN2E5YjBjNzkzMzhkZDhlZjg0NjRjMDBhNWM0ZTIiCitTUkNSRVYgPSAiMTBi
NTA3ODRhYWUzZmI3NWM5NmNkZjliMTY2ODkxNmI0OTU1N2RkNSIKIAogUyA9ICIke1dPUktESVJ9
L2dpdCIKIAotLSAKMi40NC4wCgo=

--===============2377367701276606277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/iputils/iputils-ping: PKGSIZE changed from 89728 to 159360 (+78%)

--===============2377367701276606277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/iputils/iputils-arping: PV changed from "20240117" to "20240905"
packages/core2-64-poky-linux/iputils/iputils-arping: PKGV changed from 20240117 [default] to 20240905 [default]
packages/core2-64-poky-linux/iputils/iputils-clockdiff: PV changed from "20240117" to "20240905"
packages/core2-64-poky-linux/iputils/iputils-clockdiff: PKGV changed from 20240117 [default] to 20240905 [default]
packages/core2-64-poky-linux/iputils/iputils-dbg: PKGSIZE changed from 373544 to 375264 (+0%)
packages/core2-64-poky-linux/iputils/iputils-dbg: PV changed from "20240117" to "20240905"
packages/core2-64-poky-linux/iputils/iputils-dbg: PKGV changed from 20240117 [default] to 20240905 [default]
packages/core2-64-poky-linux/iputils/iputils-dev: PV changed from "20240117" to "20240905"
packages/core2-64-poky-linux/iputils/iputils-dev: PKGV changed from 20240117 [default] to 20240905 [default]
packages/core2-64-poky-linux/iputils/iputils-doc: PV changed from "20240117" to "20240905"
packages/core2-64-poky-linux/iputils/iputils-doc: PKGV changed from 20240117 [default] to 20240905 [default]
packages/core2-64-poky-linux/iputils/iputils-locale: PV changed from "20240117" to "20240905"
packages/core2-64-poky-linux/iputils/iputils-locale: PKGV changed from 20240117 [default] to 20240905 [default]
packages/core2-64-poky-linux/iputils/iputils-ping: PKGSIZE changed from 89728 to 159360 (+78%)
packages/core2-64-poky-linux/iputils/iputils-ping: PV changed from "20240117" to "20240905"
packages/core2-64-poky-linux/iputils/iputils-ping: PKGV changed from 20240117 [default] to 20240905 [default]
packages/core2-64-poky-linux/iputils/iputils-ping6: PV changed from "20240117" to "20240905"
packages/core2-64-poky-linux/iputils/iputils-ping6: PKGV changed from 20240117 [default] to 20240905 [default]
packages/core2-64-poky-linux/iputils/iputils-src: PKGSIZE changed from 200178 to 201890 (+1%)
packages/core2-64-poky-linux/iputils/iputils-src: PV changed from "20240117" to "20240905"
packages/core2-64-poky-linux/iputils/iputils-src: PKGV changed from 20240117 [default] to 20240905 [default]
packages/core2-64-poky-linux/iputils/iputils-staticdev: PV changed from "20240117" to "20240905"
packages/core2-64-poky-linux/iputils/iputils-staticdev: PKGV changed from 20240117 [default] to 20240905 [default]
packages/core2-64-poky-linux/iputils/iputils-tracepath: PV changed from "20240117" to "20240905"
packages/core2-64-poky-linux/iputils/iputils-tracepath: PKGV changed from 20240117 [default] to 20240905 [default]
packages/core2-64-poky-linux/iputils/iputils: PV changed from "20240117" to "20240905"
packages/core2-64-poky-linux/iputils/iputils: PKGV changed from 20240117 [default] to 20240905 [default]
packages/core2-64-poky-linux/iputils: PV changed from "20240117" to "20240905"
packages/core2-64-poky-linux/iputils: PKGV changed from 20240117 [default] to 20240905 [default]

--===============2377367701276606277==--

