Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFAEC531E0
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:48 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1403.1771440091438776725
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Z2hwP310;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qrxlqiTm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c720eefb6-5503fe20-6e22-4ca3-92d3-61e465568822-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440107;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=46NO6wyzLqUY2VAKH0K4i5kbzOQaX+ieR5AlPSRxk7E=;
	b=Z2hwP310kpaWRNHMy6o2fK0oAG3NipmmbJuL2o8Dh/uOrjGZM9ku0DJNrq/cH2YH
	brkxTDFKPXDOn/ovfTbvRaIg+1e5p2VItMrj5zVJahL68wrFEewB7hTHTaAqsfW5gPg
	1YwA/I9ikuzdQLyiGrHkVoEiJUSgLG3W6JCoCtHw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440107;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=46NO6wyzLqUY2VAKH0K4i5kbzOQaX+ieR5AlPSRxk7E=;
	b=qrxlqiTmRTXah5I8G58+AqTqLuYnJyqVR22YQsJu31jpvROdTDRJOwKkeG0mwS+v
	3ovWMVvl7gLWcxpAm03RAHm81Kdbf23gHfRdxggh40Ks9DfIk56UFSLrrYnZ/WktlFk
	tdD+uBaM2+Q9Qn1ukAjpk8CYQ7IKdNNoRRTyQLh0=
Content-Type: multipart/mixed; boundary="===============5113483939400208064=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ed: upgrading to 1.22.5 SUCCEEDED
Message-ID: <0101019c720eefb6-5503fe20-6e22-4ca3-92d3-61e465568822-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231371

--===============5113483939400208064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ed* to *1.22.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ed-upgrade-1.22.4-1.22.5.patch
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
From dcd5b2f39789790b0a52e7bf3c1b966fa481dc15 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 14:33:50 +0000
Subject: [PATCH] ed: upgrade 1.22.4 -> 1.22.5

---
 meta/recipes-extended/ed/{ed_1.22.4.bb => ed_1.22.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ed/{ed_1.22.4.bb => ed_1.22.5.bb} (93%)

diff --git a/meta/recipes-extended/ed/ed_1.22.4.bb b/meta/recipes-extended/ed/ed_1.22.5.bb
similarity index 93%
rename from meta/recipes-extended/ed/ed_1.22.4.bb
rename to meta/recipes-extended/ed/ed_1.22.5.bb
index 36b631b762..0301dd42c9 100644
--- a/meta/recipes-extended/ed/ed_1.22.4.bb
+++ b/meta/recipes-extended/ed/ed_1.22.5.bb
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "987a1ebbbad3fcf63a1ffa9e29b3fa7de065150d16319d0a49dd8b57f81d3e9c"
+SRC_URI[sha256sum] = "56e107ddc2f29dad6690376c15bf9751509e1ee3b8241710e44edbe5c3a158cc"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.47.1


--===============5113483939400208064==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ed-upgrade-1.22.4-1.22.5.patch"

RnJvbSBkY2Q1YjJmMzk3ODk3OTBiMGE1MmU3YmYzYzFiOTY2ZmE0ODFkYzE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTQ6MzM6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
ZDogdXBncmFkZSAxLjIyLjQgLT4gMS4yMi41CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9l
ZC97ZWRfMS4yMi40LmJiID0+IGVkXzEuMjIuNS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvZWQve2VkXzEuMjIuNC5iYiA9PiBlZF8xLjIyLjUuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2VkL2VkXzEuMjIuNC5iYiBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9lZC9lZF8xLjIyLjUuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2VkL2VkXzEuMjIuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2VkL2VkXzEuMjIuNS5iYgppbmRleCAzNmI2MzFiNzYyLi4wMzAxZGQ0MmM5IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZWQvZWRfMS4yMi40LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9lZC9lZF8xLjIyLjUuYmIKQEAgLTE5LDcgKzE5LDcgQEAgYmlu
ZGlyID0gIiR7YmFzZV9iaW5kaXJ9IgogU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L2VkLyR7QlB9
LnRhci5seiIKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICIke0dOVV9NSVJST1J9L2VkLyIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjk4N2ExZWJiYmFkM2ZjZjYzYTFmZmE5ZTI5YjNmYTdkZTA2NTE1
MGQxNjMxOWQwYTQ5ZGQ4YjU3ZjgxZDNlOWMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTZlMTA3
ZGRjMmYyOWRhZDY2OTAzNzZjMTViZjk3NTE1MDllMWVlM2I4MjQxNzEwZTQ0ZWRiZTVjM2ExNThj
YyIKIAogRVhUUkFfT0VNQUtFID0gIi1lIE1BS0VGTEFHUz0iCiAKLS0gCjIuNDcuMQoK

--===============5113483939400208064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ed/ed-dbg: PV changed from "1.22.4" to "1.22.5"
packages/x86-64-v3-poky-linux/ed/ed-dbg: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/x86-64-v3-poky-linux/ed/ed-dbg: PKGSIZE changed from 178368 to 178376 (+0%)
packages/x86-64-v3-poky-linux/ed/ed-dev: PV changed from "1.22.4" to "1.22.5"
packages/x86-64-v3-poky-linux/ed/ed-dev: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/x86-64-v3-poky-linux/ed/ed-doc: PV changed from "1.22.4" to "1.22.5"
packages/x86-64-v3-poky-linux/ed/ed-doc: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/x86-64-v3-poky-linux/ed/ed-doc: PKGSIZE changed from 76078 to 76080 (+0%)
packages/x86-64-v3-poky-linux/ed/ed-locale: PV changed from "1.22.4" to "1.22.5"
packages/x86-64-v3-poky-linux/ed/ed-locale: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/x86-64-v3-poky-linux/ed/ed-src: PV changed from "1.22.4" to "1.22.5"
packages/x86-64-v3-poky-linux/ed/ed-src: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/x86-64-v3-poky-linux/ed/ed-src: FILELIST: directory renamed /usr/src/debug/ed/1.22.4 -> /usr/src/debug/ed/1.22.5
packages/x86-64-v3-poky-linux/ed/ed-src: PKGSIZE changed from 117024 to 117015 (-0%)
packages/x86-64-v3-poky-linux/ed/ed-staticdev: PV changed from "1.22.4" to "1.22.5"
packages/x86-64-v3-poky-linux/ed/ed-staticdev: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/x86-64-v3-poky-linux/ed/ed: PV changed from "1.22.4" to "1.22.5"
packages/x86-64-v3-poky-linux/ed/ed: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/x86-64-v3-poky-linux/ed: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/ed/ed-1.22.4.tar.lz" to "https://ftpmirror.gnu.org/gnu/ed/ed-1.22.5.tar.lz"
packages/x86-64-v3-poky-linux/ed: PV changed from "1.22.4" to "1.22.5"
packages/x86-64-v3-poky-linux/ed: PKGV changed from 1.22.4 [default] to 1.22.5 [default]

--===============5113483939400208064==--

