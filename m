Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C734CEBF66
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:40 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12114.1763224714400114300
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SVyKpCv/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=eZu2dmx5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019a8861fa2d-731f2183-0837-46eb-b09f-856ceda8b182-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224713;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8ISTqGG1ZVDDi1t251+yS32BuR4kj81gYfxNC51j/uU=;
	b=SVyKpCv/vVQMqcFnk6WU2CsGOuAcn3SoGKpEjYaGfXLCqvZkJPhh0e3tK3ocF/mr
	vL17DgcgDOrIYZ5K0R/rHltJdGHtkb1e2taLdJR0xdi2NcCYPos6qThq89zvzwsjxDo
	AsFdyWL+wyFEGLIQloajZrw1VWNvMUgKgzxGFhjI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224713;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8ISTqGG1ZVDDi1t251+yS32BuR4kj81gYfxNC51j/uU=;
	b=eZu2dmx5BxFdWlLRFqkGedCMw2C4ywS2meJiXQL0Fj1EmDgJQnaQ7L/4LQSzp5Yv
	07bBdbSIVuzRHjnkx3pFIBAa06KU8AhZscH637cGtuLDIImgEbC3BwhCuOYlKdDZBS3
	4huX1g9kDe9WpejQLCPFj5F8uOW4gDxi3MVo5pOw=
Content-Type: multipart/mixed; boundary="===============1576707497275195657=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mobile-broadband-provider-info: upgrading to 20251101 SUCCEEDED
Message-ID: <0101019a8861fa2d-731f2183-0837-46eb-b09f-856ceda8b182-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226320

--===============1576707497275195657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mobile-broadband-provider-info* to *20251101* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mobile-broadband-provider-info-upgrade-20250613-2025.patch
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
From 66da273046e4d5bfb885d95a97892e1363e005ef Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 07:53:41 +0000
Subject: [PATCH] mobile-broadband-provider-info: upgrade 20250613 -> 20251101

---
 ...o_20250613.bb => mobile-broadband-provider-info_20251101.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/mobile-broadband-provider-info/{mobile-broadband-provider-info_20250613.bb => mobile-broadband-provider-info_20251101.bb} (91%)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
similarity index 91%
rename from meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb
rename to meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
index 72663c7e0a..441732afe7 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main;tag=${PV}"
-SRCREV = "2a1b409491a531aedcf3eb3ba907929d96bd181a"
+SRCREV = "18cb97517d9c831e1d2ec057e62d04fd3665e10f"
 
 inherit meson
 
-- 
2.47.1


--===============1576707497275195657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mobile-broadband-provider-info: SRC_URI changed from "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main;tag=20250613" to "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main;tag=20251101"
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info: PKGV changed from 20250613 [default] to 20251101 [default]
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info: PV changed from "20250613" to "20251101"
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dbg: PV changed from "20250613" to "20251101"
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dbg: PKGV changed from 20250613 [default] to 20251101 [default]
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dev: PV changed from "20250613" to "20251101"
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dev: PKGV changed from 20250613 [default] to 20251101 [default]
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-doc: PV changed from "20250613" to "20251101"
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-doc: PKGV changed from 20250613 [default] to 20251101 [default]
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-locale: PV changed from "20250613" to "20251101"
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-locale: PKGV changed from 20250613 [default] to 20251101 [default]
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-src: PV changed from "20250613" to "20251101"
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-src: PKGV changed from 20250613 [default] to 20251101 [default]
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-staticdev: PV changed from "20250613" to "20251101"
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-staticdev: PKGV changed from 20250613 [default] to 20251101 [default]
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PV changed from "20250613" to "20251101"
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PKGV changed from 20250613 [default] to 20251101 [default]
packages/x86-64-v3-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PKGSIZE changed from 518547 to 521336 (+1%)

--===============1576707497275195657==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mobile-broadband-provider-info-upgrade-20250613-2025.patch"

RnJvbSA2NmRhMjczMDQ2ZTRkNWJmYjg4NWQ5NWE5Nzg5MmUxMzYzZTAwNWVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDc6NTM6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
b2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm86IHVwZ3JhZGUgMjAyNTA2MTMgLT4gMjAyNTEx
MDEKCi0tLQogLi4ub18yMDI1MDYxMy5iYiA9PiBtb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWlu
Zm9fMjAyNTExMDEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb2JpbGUtYnJv
YWRiYW5kLXByb3ZpZGVyLWluZm8ve21vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mb18yMDI1
MDYxMy5iYiA9PiBtb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm9fMjAyNTExMDEuYmJ9ICg5
MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb2JpbGUtYnJvYWRi
YW5kLXByb3ZpZGVyLWluZm8vbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvXzIwMjUwNjEz
LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVy
LWluZm8vbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvXzIwMjUxMTAxLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9iaWxl
LWJyb2FkYmFuZC1wcm92aWRlci1pbmZvL21vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mb18y
MDI1MDYxMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb2JpbGUtYnJv
YWRiYW5kLXByb3ZpZGVyLWluZm8vbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvXzIwMjUx
MTAxLmJiCmluZGV4IDcyNjYzYzdlMGEuLjQ0MTczMmFmZTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvL21vYmlsZS1i
cm9hZGJhbmQtcHJvdmlkZXItaW5mb18yMDI1MDYxMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L21vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mby9tb2JpbGUtYnJvYWRiYW5k
LXByb3ZpZGVyLWluZm9fMjAyNTExMDEuYmIKQEAgLTgsNyArOCw3IEBAIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTg3OTY0NTc5YjJhOGVjZTRiYzY3NDRkMmRjOWE4YjA0
IgogUEUgPSAiMSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL21v
YmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1h
aW47dGFnPSR7UFZ9IgotU1JDUkVWID0gIjJhMWI0MDk0OTFhNTMxYWVkY2YzZWIzYmE5MDc5Mjlk
OTZiZDE4MWEiCitTUkNSRVYgPSAiMThjYjk3NTE3ZDljODMxZTFkMmVjMDU3ZTYyZDA0ZmQzNjY1
ZTEwZiIKIAogaW5oZXJpdCBtZXNvbgogCi0tIAoyLjQ3LjEKCg==

--===============1576707497275195657==--

