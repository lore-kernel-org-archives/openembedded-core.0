Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53774C10DAA
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:14 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.8653.1698848703907836952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dDxg3/AN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=q4oHtffT;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.30, mailfrom: 0101018b8b460820-12308ad5-ddd4-4c98-90e7-ce8af71290b1-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Yz6F34oDGU5j3fFEKhnc3D1EjSRFKwmjp3CJhmjKt+4=;
	b=dDxg3/ANPEVBI1iJD3dgKXLI4NOSETB1sA0wOxSoNyM0Zpy70IEAVcgUM/LUnD8h
	DOTedR7q+axlYcaGBgpYDUPRRf695s+3o+Qrqqod0wLReed/385JjAxAYvvhbm0dpgb
	sewjVSdfDKu4nyUmZeAOtx+8sbCAQCe4FaGgWO0E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Yz6F34oDGU5j3fFEKhnc3D1EjSRFKwmjp3CJhmjKt+4=;
	b=q4oHtffTtlmJFopuBOOEFjlec56dqYh6S96dQqTPSOle3xb2Vh4YqJ/b3rXnOA23
	ZCgHdWZoVss2RyUziGllZjSKLrLH7DJ/QgaCWx7K428xRpzgqCapp0Y6o/k0qBqjzwV
	3MiTLacf3qZOkAWvJEvw9BzHypgZuoDaWyjsoCbA=
Content-Type: multipart/mixed; boundary="===============0120692076743675738=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wheel: upgrading to 0.41.3 SUCCEEDED
Message-ID: <0101018b8b460820-12308ad5-ddd4-4c98-90e7-ce8af71290b1-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189980

--===============0120692076743675738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-wheel* to *0.41.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wheel-upgrade-0.41.2-0.41.3.patch
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
From c9a78101df8d583a700b175107e1752527c621c1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 09:42:28 +0000
Subject: [PATCH] python3-wheel: upgrade 0.41.2 -> 0.41.3

---
 .../python/{python3-wheel_0.41.2.bb => python3-wheel_0.41.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.41.2.bb => python3-wheel_0.41.3.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.41.2.bb b/meta/recipes-devtools/python/python3-wheel_0.41.3.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-wheel_0.41.2.bb
rename to meta/recipes-devtools/python/python3-wheel_0.41.3.bb
index d11c6a857a..bdba98b8d5 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.41.2.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.41.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "0c5ac5ff2afb79ac23ab82bab027a0be7b5dbcf2e54dc50efe4bf507de1f7985"
+SRC_URI[sha256sum] = "4d4987ce51a49370ea65c0bfd2234e8ce80a12780820d9dc462597a6e60d0841"
 
 inherit python_flit_core pypi
 
-- 
2.39.2


--===============0120692076743675738==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wheel-upgrade-0.41.2-0.41.3.patch"

RnJvbSBjOWE3ODEwMWRmOGQ1ODNhNzAwYjE3NTEwN2UxNzUyNTI3YzYyMWMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwOTo0MjoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2hlZWw6IHVwZ3JhZGUgMC40MS4yIC0+IDAuNDEuMwoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXdoZWVsXzAuNDEuMi5iYiA9PiBweXRob24zLXdoZWVsXzAuNDEuMy5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXdoZWVsXzAuNDEuMi5iYiA9PiBw
eXRob24zLXdoZWVsXzAuNDEuMy5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2hlZWxfMC40MS4yLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVsXzAuNDEuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDg1
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2hlZWxf
MC40MS4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
d2hlZWxfMC40MS4zLmJiCmluZGV4IGQxMWM2YTg1N2EuLmJkYmE5OGI4ZDUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13aGVlbF8wLjQxLjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVsXzAuNDEuMy5iYgpA
QCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIk1JVCIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT03ZmZiMGRiMDQ1Mjdj
ZmUzODBlNGYyNzI2YmQwNWViZiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBjNWFjNWZmMmFm
Yjc5YWMyM2FiODJiYWIwMjdhMGJlN2I1ZGJjZjJlNTRkYzUwZWZlNGJmNTA3ZGUxZjc5ODUiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNGQ0OTg3Y2U1MWE0OTM3MGVhNjVjMGJmZDIyMzRlOGNlODBh
MTI3ODA4MjBkOWRjNDYyNTk3YTZlNjBkMDg0MSIKIAogaW5oZXJpdCBweXRob25fZmxpdF9jb3Jl
IHB5cGkKIAotLSAKMi4zOS4yCgo=

--===============0120692076743675738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-wheel: PV changed from "0.41.2" to "0.41.3"
packages/core2-64-poky-linux/python3-wheel: PKGV changed from 0.41.2 [default] to 0.41.3 [default]
packages/core2-64-poky-linux/python3-wheel: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.41.2.tar.gz;downloadfilename=wheel-0.41.2.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.41.3.tar.gz;downloadfilename=wheel-0.41.3.tar.gz"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dbg: PV changed from "0.41.2" to "0.41.3"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dbg: PKGV changed from 0.41.2 [default] to 0.41.3 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dev: PV changed from "0.41.2" to "0.41.3"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dev: PKGV changed from 0.41.2 [default] to 0.41.3 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-doc: PV changed from "0.41.2" to "0.41.3"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-doc: PKGV changed from 0.41.2 [default] to 0.41.3 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-locale: PV changed from "0.41.2" to "0.41.3"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-locale: PKGV changed from 0.41.2 [default] to 0.41.3 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-src: PV changed from "0.41.2" to "0.41.3"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-src: PKGV changed from 0.41.2 [default] to 0.41.3 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-staticdev: PV changed from "0.41.2" to "0.41.3"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-staticdev: PKGV changed from 0.41.2 [default] to 0.41.3 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel: PV changed from "0.41.2" to "0.41.3"
packages/core2-64-poky-linux/python3-wheel/python3-wheel: PKGSIZE changed from 467789 to 475454 (+2%)
packages/core2-64-poky-linux/python3-wheel/python3-wheel: PKGV changed from 0.41.2 [default] to 0.41.3 [default]
Changes to packages/core2-64-poky-linux/python3-wheel (sysroot):
  /usr/lib/python3.11/site-packages/wheel-0.41.2.dist-info moved to /usr/lib/python3.11/site-packages/wheel-0.41.3.dist-info

--===============0120692076743675738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-wheel (sysroot):
  /usr/lib/python3.11/site-packages/wheel-0.41.2.dist-info moved to /usr/lib/python3.11/site-packages/wheel-0.41.3.dist-info

--===============0120692076743675738==--

