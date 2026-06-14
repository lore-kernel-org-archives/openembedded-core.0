Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD65CD98D8
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 05:07:08 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103691.1781413624197879474
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 22:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OlaP+kuY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=v1ALU3iR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019ec486b5ee-c3de50c0-1e21-45ce-b962-dc70b9aa4fad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781413623;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uWz82IIm41OOJBKfX+OranjEMlt2zrSe9cTGIpsY/Ws=;
	b=OlaP+kuYPLkcMw2+pTyP62P9PA8KSvq6wjsAk6AI/e2Q/LCBsvPhQxagW3P1CjLy
	wFvyH69G5ypvMWFVpWlAogYu/8VWCbsiQa4/gQDPFxPtAJWjIgSI0jcvc1lkfBnIEom
	p1DlWo4WoXl0X2nB5nbz0qc1xvYI+PTuJDfI11B0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781413623;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uWz82IIm41OOJBKfX+OranjEMlt2zrSe9cTGIpsY/Ws=;
	b=v1ALU3iR+aEscxDxxhOkaVM9ywLN4aH7DtHoS4vh6K87M08Rwf6sLMVh14mLaK9M
	whJroyHWuUv/zIVCOYO3xpXzItaBSpzTWZYsQV9HvUNrYuTfbxSTUrt6NZ4qMblt78L
	IW0x9sdVcAlw8HFN0X7ya/4it0ip4LVHrE7iTu6Q=
Content-Type: multipart/mixed; boundary="===============0410549405596399894=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest: upgrading to 9.1.0 SUCCEEDED
Message-ID: <0101019ec486b5ee-c3de50c0-1e21-45ce-b962-dc70b9aa4fad-000000@us-west-2.amazonses.com>
Date: Sun, 14 Jun 2026 05:07:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.14-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 05:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238684

--===============0410549405596399894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pytest* to *9.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-upgrade-9.0.3-9.1.0.patch
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
From 375010134e4ae9af400dcf483005cb789472c1d5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 14 Jun 2026 05:06:59 +0000
Subject: [PATCH] python3-pytest: upgrade 9.0.3 -> 9.1.0

---
 .../python/{python3-pytest_9.0.3.bb => python3-pytest_9.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_9.0.3.bb => python3-pytest_9.1.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_9.0.3.bb b/meta/recipes-devtools/python/python3-pytest_9.1.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_9.0.3.bb
rename to meta/recipes-devtools/python/python3-pytest_9.1.0.bb
index bec521d3ef..9180e7bf1f 100644
--- a/meta/recipes-devtools/python/python3-pytest_9.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pytest_9.1.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "b86ada508af81d19edeb213c681b1d48246c1a91d304c6c81a427674c17eb91c"
+SRC_URI[sha256sum] = "41dd9148c08072446394cefd3d79701701335a9f4cae69ba92e39f6c7f5c061c"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.47.1


--===============0410549405596399894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pytest-9.0.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/pytest-9.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pytest-9.0.3.dist-info -> /usr/lib/python3.14/site-packages/pytest-9.1.0.dist-info, removed "/usr/lib/python3.14/site-packages/_pytest/config/__pycache__/compat.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/config/compat.py", added "/usr/lib/python3.14/site-packages/_pytest/assertion/_typing.py /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_guards.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/highlight.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_typing.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_compare_set.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/assertion/__
 pycache__/_compare_any.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/assertion/_guards.py /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_compare_mapping.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/assertion/highlight.py /usr/lib/python3.14/site-packages/_pytest/assertion/_compare_any.py /usr/lib/python3.14/site-packages/_pytest/assertion/_compare_set.py /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/compare_text.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/assertion/_compare_mapping.py /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_compare_sequence.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/assertion/_compare_sequence.py /usr/lib/python3.14/site-packages/_pytest/assertion/compare_text.py"
Changes to packages/x86-64-v3-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.14/site-packages/pytest-9.0.3.dist-info moved to /usr/lib/python3.14/site-packages/pytest-9.1.0.dist-info
  /usr/lib/python3.14/site-packages/_pytest/assertion/_compare_any.py was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/_compare_mapping.py was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/_compare_sequence.py was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/_compare_set.py was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/compare_text.py was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/_guards.py was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/highlight.py was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_compare_any.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_compare_mapping.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_compare_sequence.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_compare_set.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/compare_text.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_guards.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/highlight.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_typing.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/_typing.py was added
  /usr/lib/python3.14/site-packages/_pytest/config/compat.py was removed
  /usr/lib/python3.14/site-packages/_pytest/config/__pycache__/compat.cpython-314.pyc was removed

--===============0410549405596399894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pytest: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest/pytest-9.0.3.tar.gz;downloadfilename=pytest-9.0.3.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest/pytest-9.1.0.tar.gz;downloadfilename=pytest-9.1.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pytest: PV changed from "9.0.3" to "9.1.0"
packages/x86-64-v3-poky-linux/python3-pytest: PKGV changed from 9.0.3 [default] to 9.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-dbg: PV changed from "9.0.3" to "9.1.0"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-dbg: PKGV changed from 9.0.3 [default] to 9.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-dev: PV changed from "9.0.3" to "9.1.0"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-dev: PKGV changed from 9.0.3 [default] to 9.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-doc: PV changed from "9.0.3" to "9.1.0"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-doc: PKGV changed from 9.0.3 [default] to 9.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-locale: PV changed from "9.0.3" to "9.1.0"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-locale: PKGV changed from 9.0.3 [default] to 9.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-src: PV changed from "9.0.3" to "9.1.0"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-src: PKGV changed from 9.0.3 [default] to 9.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-staticdev: PV changed from "9.0.3" to "9.1.0"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-staticdev: PKGV changed from 9.0.3 [default] to 9.1.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pytest-9.0.3.dist-info -> /usr/lib/python3.14/site-packages/pytest-9.1.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pytest-9.0.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/pytest-9.1.0.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/_pytest/config/__pycache__/compat.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/config/compat.py", added "/usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/highlight.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/assertion/_compare_sequence.py /usr/lib/python3.14/site-packages/_pytest/assertion/_compare_any.py /usr/lib/python3.14/site-packages/_pytest/assertion/_compare_set.py /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/compare_text.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/assertion/_guards.py /usr/lib/python3.14/s
 ite-packages/_pytest/assertion/__pycache__/_compare_any.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/assertion/_compare_mapping.py /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_compare_set.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_compare_sequence.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/assertion/compare_text.py /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_guards.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_typing.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/assertion/highlight.py /usr/lib/python3.14/site-packages/_pytest/assertion/_typing.py /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_compare_mapping.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: PV changed from "9.0.3" to "9.1.0"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 3213198 to 3277589 (+2%)
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: PKGV changed from 9.0.3 [default] to 9.1.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.14/site-packages/pytest-9.0.3.dist-info moved to /usr/lib/python3.14/site-packages/pytest-9.1.0.dist-info
  /usr/lib/python3.14/site-packages/_pytest/assertion/_compare_any.py was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/_compare_mapping.py was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/_compare_sequence.py was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/_compare_set.py was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/compare_text.py was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/_guards.py was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/highlight.py was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_compare_any.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_compare_mapping.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_compare_sequence.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_compare_set.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/compare_text.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_guards.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/highlight.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/__pycache__/_typing.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/assertion/_typing.py was added
  /usr/lib/python3.14/site-packages/_pytest/config/compat.py was removed
  /usr/lib/python3.14/site-packages/_pytest/config/__pycache__/compat.cpython-314.pyc was removed

--===============0410549405596399894==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-upgrade-9.0.3-9.1.0.patch"

RnJvbSAzNzUwMTAxMzRlNGFlOWFmNDAwZGNmNDgzMDA1Y2I3ODk0NzJjMWQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTQgSnVuIDIwMjYgMDU6MDY6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5dGVzdDogdXBncmFkZSA5LjAuMyAtPiA5LjEuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXB5dGVzdF85LjAuMy5iYiA9PiBweXRob24zLXB5dGVzdF85LjEuMC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5dGVzdF85LjAuMy5iYiA9PiBw
eXRob24zLXB5dGVzdF85LjEuMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0XzkuMC4zLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF85LjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkx
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0
XzkuMC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHl0ZXN0XzkuMS4wLmJiCmluZGV4IGJlYzUyMWQzZWYuLjkxODBlN2JmMWYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3RfOS4wLjMuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF85LjEuMC5iYgpA
QCAtNSw3ICs1LDcgQEAgREVTQ1JJUFRJT04gPSAiVGhlIHB5dGVzdCBmcmFtZXdvcmsgbWFrZXMg
aXQgZWFzeSB0byB3cml0ZSBzbWFsbCB0ZXN0cywgeWV0IHNjYWwKIExJQ0VOU0UgPSAiTUlUIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YmQyN2U0MWI2NTUwZmUwZmM0
NTM1NmQxZDgxZWUzN2MiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiODZhZGE1MDhhZjgxZDE5
ZWRlYjIxM2M2ODFiMWQ0ODI0NmMxYTkxZDMwNGM2YzgxYTQyNzY3NGMxN2ViOTFjIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjQxZGQ5MTQ4YzA4MDcyNDQ2Mzk0Y2VmZDNkNzk3MDE3MDEzMzVhOWY0
Y2FlNjliYTkyZTM5ZjZjN2Y1YzA2MWMiCiAKIERFUEVORFMgKz0gInB5dGhvbjMtc2V0dXB0b29s
cy1zY20tbmF0aXZlIgogCi0tIAoyLjQ3LjEKCg==

--===============0410549405596399894==--

