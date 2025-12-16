Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342AFD5C0FB
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:27 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17388.1765872134050108079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IANzIg1z;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Z7dr+ZLg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b262e8b52-5a02792d-962d-4f86-90c7-3d2867244c9f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=j9wVX0bgG95Vib4uHd8qET/Yck8EuHYJe7IulMv30fk=;
	b=IANzIg1zBGyZanTNyymV5fFR+6GLcPc8O1aSo6N1QUV0kU5Rh+t5Bp/tmq8zybLn
	u5IJLxP9BdPsyKBQqxZxUOJzP+UNPOOm0KRnyN+W4Wt2dOw0icv1dnBUvCGC6GJSin6
	3ugTuRHbJYLCl9lVmECwagE0Gx6QcDbTq/TrEgbw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=j9wVX0bgG95Vib4uHd8qET/Yck8EuHYJe7IulMv30fk=;
	b=Z7dr+ZLgq87QuZfKrA0UQ8whFYU4+5HIFOtP+FUIjm1RrXOed6uMY8No8bBnBmwB
	hqbLjaLzDoLuyjqN7z4Y59H/Oi56B1JM7Ejd1YAw/lnG5r+y8RF/j55479T78CQpfJ6
	b+E6TFsFrMUUmofmcQkY2t7L2j62a2zyBp2n2NX8=
Content-Type: multipart/mixed; boundary="===============7476340459177556462=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm-backend: upgrading to 2.4.6 SUCCEEDED
Message-ID: <0101019b262e8b52-5a02792d-962d-4f86-90c7-3d2867244c9f-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227809

--===============7476340459177556462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm-backend* to *2.4.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-backend-upgrade-2.4.5-2.4.6.patch
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
From 854d04e8e057183b8ed0857cb296b5152052bc8b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 00:33:47 +0000
Subject: [PATCH] python3-pdm-backend: upgrade 2.4.5 -> 2.4.6

---
 ...ython3-pdm-backend_2.4.5.bb => python3-pdm-backend_2.4.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-backend_2.4.5.bb => python3-pdm-backend_2.4.6.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.5.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.4.6.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-pdm-backend_2.4.5.bb
rename to meta/recipes-devtools/python/python3-pdm-backend_2.4.6.bb
index 5e6d75c188..95d8e3e4a4 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.5.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.6.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "56c019c440308adad5d057c08cbb777e65f43b991a3b0920749781258972fe5b"
+SRC_URI[sha256sum] = "5dd9cd581a4f18d57ff506a5b3aad7c8df31e5949b6fd854bbc34c38107e4532"
 
 inherit pypi python_pep517
 
-- 
2.47.1


--===============7476340459177556462==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-backend-upgrade-2.4.5-2.4.6.patch"

RnJvbSA4NTRkMDRlOGUwNTcxODNiOGVkMDg1N2NiMjk2YjUxNTIwNTJiYzhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDA6MzM6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbS1iYWNrZW5kOiB1cGdyYWRlIDIuNC41IC0+IDIuNC42CgotLS0KIC4uLnl0aG9u
My1wZG0tYmFja2VuZF8yLjQuNS5iYiA9PiBweXRob24zLXBkbS1iYWNrZW5kXzIuNC42LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40
LjUuYmIgPT4gcHl0aG9uMy1wZG0tYmFja2VuZF8yLjQuNi5iYn0gKDgxJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40LjUu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40
LjYuYmIKc2ltaWxhcml0eSBpbmRleCA4MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBkbS1iYWNrZW5kXzIuNC41LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40LjYuYmIKaW5kZXgg
NWU2ZDc1YzE4OC4uOTVkOGUzZTRhNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBkbS1iYWNrZW5kXzIuNC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG0tYmFja2VuZF8yLjQuNi5iYgpAQCAtNCw3ICs0LDcg
QEAgTElDRU5TRSA9ICJNSVQiCiBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTRhNTY0Mjk3YjNjNWI2MjlhNTI4YjkyZmQ4ZmY2
MWVhIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTZjMDE5YzQ0MDMwOGFkYWQ1ZDA1N2MwOGNi
Yjc3N2U2NWY0M2I5OTFhM2IwOTIwNzQ5NzgxMjU4OTcyZmU1YiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI1ZGQ5Y2Q1ODFhNGYxOGQ1N2ZmNTA2YTViM2FhZDdjOGRmMzFlNTk0OWI2ZmQ4NTRiYmMz
NGMzODEwN2U0NTMyIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3BlcDUxNwogCi0tIAoyLjQ3LjEK
Cg==

--===============7476340459177556462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pdm_backend-2.4.5.dist-info -> /usr/lib/python3.13/site-packages/pdm_backend-2.4.6.dist-info, directory renamed /usr/lib/python3.13/site-packages/pdm_backend-2.4.5.dist-info/licenses -> /usr/lib/python3.13/site-packages/pdm_backend-2.4.6.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pdm-backend (sysroot):
  /usr/lib/python3.13/site-packages/pdm_backend-2.4.5.dist-info moved to /usr/lib/python3.13/site-packages/pdm_backend-2.4.6.dist-info

--===============7476340459177556462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm-backend: PKGV changed from 2.4.5 [default] to 2.4.6 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm_backend/pdm_backend-2.4.5.tar.gz;downloadfilename=pdm_backend-2.4.5.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm_backend/pdm_backend-2.4.6.tar.gz;downloadfilename=pdm_backend-2.4.6.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm-backend: PV changed from "2.4.5" to "2.4.6"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dbg: PKGV changed from 2.4.5 [default] to 2.4.6 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dbg: PV changed from "2.4.5" to "2.4.6"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dev: PKGV changed from 2.4.5 [default] to 2.4.6 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dev: PV changed from "2.4.5" to "2.4.6"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-doc: PKGV changed from 2.4.5 [default] to 2.4.6 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-doc: PV changed from "2.4.5" to "2.4.6"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-locale: PKGV changed from 2.4.5 [default] to 2.4.6 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-locale: PV changed from "2.4.5" to "2.4.6"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-src: PKGV changed from 2.4.5 [default] to 2.4.6 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-src: PV changed from "2.4.5" to "2.4.6"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-staticdev: PKGV changed from 2.4.5 [default] to 2.4.6 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-staticdev: PV changed from "2.4.5" to "2.4.6"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: PKGV changed from 2.4.5 [default] to 2.4.6 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pdm_backend-2.4.5.dist-info/licenses -> /usr/lib/python3.13/site-packages/pdm_backend-2.4.6.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/pdm_backend-2.4.5.dist-info -> /usr/lib/python3.13/site-packages/pdm_backend-2.4.6.dist-info
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: PKGSIZE changed from 757534 to 759357 (+0%)
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: PV changed from "2.4.5" to "2.4.6"
Changes to packages/x86-64-v3-poky-linux/python3-pdm-backend (sysroot):
  /usr/lib/python3.13/site-packages/pdm_backend-2.4.5.dist-info moved to /usr/lib/python3.13/site-packages/pdm_backend-2.4.6.dist-info

--===============7476340459177556462==--

