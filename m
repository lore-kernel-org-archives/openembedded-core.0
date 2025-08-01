Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31A4CA0EDA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:00 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.88634.1754057271312997460
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YqgOz0t1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qYRCPiar;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019865f5f150-6bd55c34-f288-486d-abdb-7884301e32cc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057273;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nnRk/EgWSzRfd1ZmH3UmdLK0TVg6a42k5pKXEpYOE6Y=;
	b=YqgOz0t1WvGlBHfgTinJjXQpH6SGuolMTcZyiRZ858GEVj/LBZ5wiEjLgNx1EM2A
	2pWURj7UM55fh1BPe+IUvYilhhr5XEA/DvbaDH85Tpx/U+VJXyeTiqvAoZlvmtQpabl
	iaeITRMmzghh5d8heR0JtaBw+tiwfHRd3C8FFBbI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057273;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nnRk/EgWSzRfd1ZmH3UmdLK0TVg6a42k5pKXEpYOE6Y=;
	b=qYRCPiarrHFoSDfFeiFq8qLJGpCm1/1vsTd805LN0Vo6lRBiTyd3gficczKl8SrC
	6cwt6oGwev7UDCi+uWpEoSXIMhZwVSECowYtLRzRXKuFMC8licQjChRZsz7Fp/csdIP
	7hEl8ATgl5GjWp4Q3WDCgwQvQTq154OtYnBgqIpo=
Content-Type: multipart/mixed; boundary="===============4827129194576703580=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.25.5 SUCCEEDED
Message-ID: <0101019865f5f150-6bd55c34-f288-486d-abdb-7884301e32cc-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221279

--===============4827129194576703580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.25.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.25.4-2.25.5.patch
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
From 0cb7d3a0f1a9d2d674c22d66a5daeee41c286fbd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 10:02:10 +0000
Subject: [PATCH] python3-pdm: upgrade 2.25.4 -> 2.25.5

---
 .../python/{python3-pdm_2.25.4.bb => python3-pdm_2.25.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.25.4.bb => python3-pdm_2.25.5.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.25.4.bb b/meta/recipes-devtools/python/python3-pdm_2.25.5.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pdm_2.25.4.bb
rename to meta/recipes-devtools/python/python3-pdm_2.25.5.bb
index 1e25e18974..53a966e150 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.25.4.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.25.5.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "bd655d789429928d6e27ff6693c19c82bc81aa75ba51d7b1c6102d039c8f211c"
+SRC_URI[sha256sum] = "063fa211dd6b062d3ca87b722e4010b802093d8b437486bfcf07ced802c544ea"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============4827129194576703580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pdm: PKGV changed from 2.25.4 [default] to 2.25.5 [default]
packages/core2-64-poky-linux/python3-pdm: PV changed from "2.25.4" to "2.25.5"
packages/core2-64-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.25.4.tar.gz;downloadfilename=pdm-2.25.4.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.25.5.tar.gz;downloadfilename=pdm-2.25.5.tar.gz"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.25.4 [default] to 2.25.5 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.25.4" to "2.25.5"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.25.4 [default] to 2.25.5 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.25.4" to "2.25.5"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.25.4 [default] to 2.25.5 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.25.4" to "2.25.5"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.25.4 [default] to 2.25.5 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.25.4" to "2.25.5"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.25.4 [default] to 2.25.5 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.25.4" to "2.25.5"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.25.4 [default] to 2.25.5 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.25.4" to "2.25.5"
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.25.4 [default] to 2.25.5 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2239953 to 2240640 (+0%)
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PV changed from "2.25.4" to "2.25.5"
Changes to packages/core2-64-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.25.4.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.25.5.dist-info

--===============4827129194576703580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.25.4.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.25.5.dist-info

--===============4827129194576703580==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.25.4-2.25.5.patch"

RnJvbSAwY2I3ZDNhMGYxYTlkMmQ2NzRjMjJkNjZhNWRhZWVlNDFjMjg2ZmJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMDowMjoxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGRtOiB1cGdyYWRlIDIuMjUuNCAtPiAyLjI1LjUKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1wZG1fMi4yNS40LmJiID0+IHB5dGhvbjMtcGRtXzIuMjUuNS5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wZG1fMi4yNS40LmJiID0+IHB5dGhv
bjMtcGRtXzIuMjUuNS5iYn0gKDgyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjUuNC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1wZG1fMi4yNS41LmJiCnNpbWlsYXJpdHkgaW5kZXggODIlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG1fMi4yNS40LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjUuNS5i
YgppbmRleCAxZTI1ZTE4OTc0Li41M2E5NjZlMTUwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjUuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjUuNS5iYgpAQCAtNCw3ICs0LDcgQEAgTElD
RU5TRSA9ICJNSVQiCiBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTJlYjMxYTJjYzFhNzU4YzM0YjQ5OWYyODdkZDA0ZWYyIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmQ2NTVkNzg5NDI5OTI4ZDZlMjdmZjY2OTNjMTljODJi
YzgxYWE3NWJhNTFkN2IxYzYxMDJkMDM5YzhmMjExYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIw
NjNmYTIxMWRkNmIwNjJkM2NhODdiNzIyZTQwMTBiODAyMDkzZDhiNDM3NDg2YmZjZjA3Y2VkODAy
YzU0NGVhIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi0t
IAoyLjQ3LjEKCg==

--===============4827129194576703580==--

