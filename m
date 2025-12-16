Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F2AD5CC8A
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:27 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17393.1765872135280841953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Q3Z/dsgi;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PMAQMti8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019b262e9622-f4ab6a4e-2ffc-4777-82ae-0fc2a6d274b7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qqPmdWcnKut6Hv2upQCUNsddS3On+YuOHJIB4DAR1+o=;
	b=Q3Z/dsgiQWzGlj7K8e1xRf/WLf7djHX9K93+s/eG555q1lEbdvIa6BgmvTuckKOd
	rhz7omKQee4TnjeFhX4mH4440kCdOcQIcZ4q083NJUphLYKS6kyvdt84q5XPCoBfIyg
	KU7ZhhvfsVgAQftar/OvhCtw/n5/vtf7pH5esv1c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qqPmdWcnKut6Hv2upQCUNsddS3On+YuOHJIB4DAR1+o=;
	b=PMAQMti8FtkVpkzkj0r/bvO67bdU3ng//WZbaTDL3DR21IvTFxpBkJ8fohHjTl8D
	0a2ATIEK4WwL7ZN8eurSM0GzVVeey29YMj4QUSGl/PN8hyWDXn2dgM//Ina/IU4q68q
	A97zHdK8NjtWYdTN/n9CzhsWRHVYfBW7GK5/Zuos=
Content-Type: multipart/mixed; boundary="===============0052064706978930160=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyproject-metadata: upgrading to 0.10.0 SUCCEEDED
Message-ID: <0101019b262e9622-f4ab6a4e-2ffc-4777-82ae-0fc2a6d274b7-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227818

--===============0052064706978930160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyproject-metadata* to *0.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyproject-metadata-upgrade-0.9.1-0.10.0.patch
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
From 3be487734419f645690b2a3c640ec042f335cbdc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 01:01:03 +0000
Subject: [PATCH] python3-pyproject-metadata: upgrade 0.9.1 -> 0.10.0

---
 ...t-metadata_0.9.1.bb => python3-pyproject-metadata_0.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyproject-metadata_0.9.1.bb => python3-pyproject-metadata_0.10.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.1.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.10.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyproject-metadata_0.9.1.bb
rename to meta/recipes-devtools/python/python3-pyproject-metadata_0.10.0.bb
index d3a93efa31..5b5396fdd7 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.9.1.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.10.0.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "b8b2253dd1b7062b78cf949a115f02ba7fa4114aabe63fa10528e9e1a954a816"
+SRC_URI[sha256sum] = "7f5bd0ef398b60169556cb17ea261d715caf7f8561238151f51b2305084ba8d4"
 
 RDEPENDS:${PN} += " \
     python3-logging \
-- 
2.47.1


--===============0052064706978930160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pyproject_metadata-0.9.1.dist-info -> /usr/lib/python3.13/site-packages/pyproject_metadata-0.10.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/pyproject_metadata-0.9.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/pyproject_metadata-0.10.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pyproject-metadata (sysroot):
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.10.0.dist-info was added
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.10.0.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.10.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.10.0.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.10.0.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.9.1.dist-info was removed
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.9.1.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.9.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.9.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.9.1.dist-info/WHEEL was removed

--===============0052064706978930160==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyproject-metadata-upgrade-0.9.1-0.10.0.patch"

RnJvbSAzYmU0ODc3MzQ0MTlmNjQ1NjkwYjJhM2M2NDBlYzA0MmYzMzVjYmRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDE6MDE6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5cHJvamVjdC1tZXRhZGF0YTogdXBncmFkZSAwLjkuMSAtPiAwLjEwLjAKCi0tLQog
Li4udC1tZXRhZGF0YV8wLjkuMS5iYiA9PiBweXRob24zLXB5cHJvamVjdC1tZXRhZGF0YV8wLjEw
LjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weXByb2pl
Y3QtbWV0YWRhdGFfMC45LjEuYmIgPT4gcHl0aG9uMy1weXByb2plY3QtbWV0YWRhdGFfMC4xMC4w
LmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1weXByb2plY3QtbWV0YWRhdGFfMC45LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlwcm9qZWN0LW1ldGFkYXRhXzAuMTAuMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHlwcm9qZWN0LW1ldGFkYXRhXzAuOS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHlwcm9qZWN0LW1ldGFkYXRhXzAuMTAuMC5iYgppbmRleCBkM2E5
M2VmYTMxLi41YjUzOTZmZGQ3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcHlwcm9qZWN0LW1ldGFkYXRhXzAuOS4xLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXByb2plY3QtbWV0YWRhdGFfMC4xMC4wLmJiCkBA
IC0xNyw3ICsxNyw3IEBAIFVQU1RSRUFNX0NIRUNLX1BZUElfUEFDS0FHRSA9ICIke1BZUElfUEFD
S0FHRX0iCiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3JlCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICJiOGIyMjUzZGQxYjcwNjJiNzhjZjk0OWExMTVmMDJiYTdmYTQxMTRhYWJlNjNmYTEw
NTI4ZTllMWE5NTRhODE2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdmNWJkMGVmMzk4YjYwMTY5
NTU2Y2IxN2VhMjYxZDcxNWNhZjdmODU2MTIzODE1MWY1MWIyMzA1MDg0YmE4ZDQiCiAKIFJERVBF
TkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtbG9nZ2luZyBcCi0tIAoyLjQ3LjEKCg==

--===============0052064706978930160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyproject-metadata: PV changed from "0.9.1" to "0.10.0"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata: PKGV changed from 0.9.1 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyproject_metadata/pyproject_metadata-0.9.1.tar.gz;downloadfilename=pyproject_metadata-0.9.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyproject_metadata/pyproject_metadata-0.10.0.tar.gz;downloadfilename=pyproject_metadata-0.10.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dbg: PV changed from "0.9.1" to "0.10.0"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dbg: PKGV changed from 0.9.1 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dev: PV changed from "0.9.1" to "0.10.0"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dev: PKGV changed from 0.9.1 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-doc: PV changed from "0.9.1" to "0.10.0"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-doc: PKGV changed from 0.9.1 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-locale: PV changed from "0.9.1" to "0.10.0"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-locale: PKGV changed from 0.9.1 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-src: PV changed from "0.9.1" to "0.10.0"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-src: PKGV changed from 0.9.1 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-staticdev: PV changed from "0.9.1" to "0.10.0"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-staticdev: PKGV changed from 0.9.1 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PV changed from "0.9.1" to "0.10.0"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PKGV changed from 0.9.1 [default] to 0.10.0 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PKGSIZE changed from 124402 to 133819 (+8%)
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pyproject_metadata-0.9.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/pyproject_metadata-0.10.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/pyproject_metadata-0.9.1.dist-info -> /usr/lib/python3.13/site-packages/pyproject_metadata-0.10.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pyproject-metadata (sysroot):
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.10.0.dist-info was added
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.10.0.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.10.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.10.0.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.10.0.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.9.1.dist-info was removed
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.9.1.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.9.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.9.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/pyproject_metadata-0.9.1.dist-info/WHEEL was removed

--===============0052064706978930160==--

