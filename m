Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 659A3EFCBA1
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:58 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28972.1773582117682767656
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wOYEojP0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Fycw0EJP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019cf1bb68d4-2d9a0a1f-a5ef-4d41-b866-7d55cda50f1d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582117;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s12mi2Zwo87gr1VfogXNWPPZ6k99zLXYQCq44xrMafI=;
	b=wOYEojP0i1hPb3kNCJK1VkfJcCKrs8Ef0vjUGHwvAIWvnEKhfdHLzu/3hDgWruwm
	3tkk1i2qH+covFLAcRu0g6uCq0uVsttomrJWDwQk2aZXuFpAVS0mRUM5mrugKBo0xaH
	TmpX0gMnc+TsTXUPW5daKkGJdHlON2AL+NTjwm8s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582117;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s12mi2Zwo87gr1VfogXNWPPZ6k99zLXYQCq44xrMafI=;
	b=Fycw0EJPtpJlvKpeHIKQ5p29/nQzSGeMvBvO9e5ZJ+uMO/XvuB/TQgKJIPNBLaT1
	mcfB239+SCiO+2/Cub0+pzP6bNBRx6gwUb/mhUHJZzmDyXol41IAKnCs7jg88ssAxzc
	K6+rPrjG0gNKadfsUObJXnNigyTHfd6UpxWF+7Tw=
Content-Type: multipart/mixed; boundary="===============5643840403885131820=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytz: upgrading to 2026.1 SUCCEEDED
Message-ID: <0101019cf1bb68d4-2d9a0a1f-a5ef-4d41-b866-7d55cda50f1d-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233146

--===============5643840403885131820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pytz* to *2026.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytz-upgrade-2025.2-2026.1.patch
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
From ef86acb44be86c917b91d2ed30b77313f4d391c3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 08:19:40 +0000
Subject: [PATCH] python3-pytz: upgrade 2025.2 -> 2026.1

---
 .../python/{python3-pytz_2025.2.bb => python3-pytz_2026.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2025.2.bb => python3-pytz_2026.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2025.2.bb b/meta/recipes-devtools/python/python3-pytz_2026.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pytz_2025.2.bb
rename to meta/recipes-devtools/python/python3-pytz_2026.1.bb
index 86bfceadc8..0c9e1e7a4c 100644
--- a/meta/recipes-devtools/python/python3-pytz_2025.2.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2026.1.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3 ptest-python-pytest
 
 PTEST_PYTEST_DIR = "pytz/tests"
 
-SRC_URI[sha256sum] = "360b9e3dbb49a209c21ad61809c7fb453643e048b38924c765813546746e81c3"
+SRC_URI[sha256sum] = "10413c35476919b4c07bda6b9810c6e24d914378c430070bdb1869e18a37eee5"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \
-- 
2.47.1


--===============5643840403885131820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pytz: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2025.2.tar.gz;downloadfilename=pytz-2025.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2026.1.tar.gz;downloadfilename=pytz-2026.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-pytz: PKGV changed from 2025.2 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/python3-pytz: PV changed from "2025.2" to "2026.1"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dbg: PKGV changed from 2025.2 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dbg: PV changed from "2025.2" to "2026.1"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dev: PKGV changed from 2025.2 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dev: PV changed from "2025.2" to "2026.1"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-doc: PKGV changed from 2025.2 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-doc: PV changed from "2025.2" to "2026.1"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-locale: PKGV changed from 2025.2 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-locale: PV changed from "2025.2" to "2026.1"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-ptest: PKGV changed from 2025.2 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-ptest: PV changed from "2025.2" to "2026.1"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-src: PKGV changed from 2025.2 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-src: PV changed from "2025.2" to "2026.1"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-staticdev: PKGV changed from 2025.2 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-staticdev: PV changed from "2025.2" to "2026.1"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: PKGSIZE changed from 1045509 to 1047705 (+0%)
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pytz-2025.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pytz-2026.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pytz-2025.2.dist-info -> /usr/lib/python3.14/site-packages/pytz-2026.1.dist-info
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: PKGV changed from 2025.2 [default] to 2026.1 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: PV changed from "2025.2" to "2026.1"
Changes to packages/x86-64-v3-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.14/site-packages/pytz-2025.2.dist-info moved to /usr/lib/python3.14/site-packages/pytz-2026.1.dist-info

--===============5643840403885131820==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytz-upgrade-2025.2-2026.1.patch"

RnJvbSBlZjg2YWNiNDRiZTg2YzkxN2I5MWQyZWQzMGI3NzMxM2Y0ZDM5MWMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDg6MTk6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5dHo6IHVwZ3JhZGUgMjAyNS4yIC0+IDIwMjYuMQoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXB5dHpfMjAyNS4yLmJiID0+IHB5dGhvbjMtcHl0el8yMDI2LjEuYmJ9ICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5dHpfMjAyNS4yLmJiID0+IHB5
dGhvbjMtcHl0el8yMDI2LjEuYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyNS4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyNi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXR6XzIwMjUu
Mi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpf
MjAyNi4xLmJiCmluZGV4IDg2YmZjZWFkYzguLjBjOWUxZTdhNGMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXR6XzIwMjUuMi5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0el8yMDI2LjEuYmIKQEAgLTcsNyAr
Nyw3IEBAIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMyBwdGVzdC1weXRob24tcHl0ZXN0CiAKIFBU
RVNUX1BZVEVTVF9ESVIgPSAicHl0ei90ZXN0cyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM2
MGI5ZTNkYmI0OWEyMDljMjFhZDYxODA5YzdmYjQ1MzY0M2UwNDhiMzg5MjRjNzY1ODEzNTQ2NzQ2
ZTgxYzMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTA0MTNjMzU0NzY5MTliNGMwN2JkYTZiOTgx
MGM2ZTI0ZDkxNDM3OGM0MzAwNzBiZGIxODY5ZTE4YTM3ZWVlNSIKIAogUkRFUEVORFM6JHtQTn06
Y2xhc3MtdGFyZ2V0ICs9ICJcCiAgICAgcHl0aG9uMy1kYXRldGltZSBcCi0tIAoyLjQ3LjEKCg==

--===============5643840403885131820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pytz-2025.2.dist-info -> /usr/lib/python3.14/site-packages/pytz-2026.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/pytz-2025.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pytz-2026.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.14/site-packages/pytz-2025.2.dist-info moved to /usr/lib/python3.14/site-packages/pytz-2026.1.dist-info

--===============5643840403885131820==--

