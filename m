Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B92D5CC9D
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:38 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17390.1765872134595423694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=w7eQALcH;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WuCJcGXx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262ea628-b16ada2d-aaa3-4b67-b31f-c9d797eb109e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872150;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o4LYBweX0rLQINnHkmxDQ/vcaa0Os4FwdLtsUwFOSZc=;
	b=w7eQALcH04NCo9oGc6GRXTeqSfJIwZoCyItjqyggBfFLsn/CqhCZnHvAZrDmEE6L
	CKkmFyIqK2wbPwh22WA39q/Ma2PssSzXGJknF3pbl9iuSrCIne6acVNxwJgiznPnQAR
	S4JvhQoyF4OtxLfycu9gUJr4I9XWkVw0EgyoXx+s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872150;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o4LYBweX0rLQINnHkmxDQ/vcaa0Os4FwdLtsUwFOSZc=;
	b=WuCJcGXxsBsWSZsdFCc6cy9UumI7FgxCk1uYKJphN8ksYgYNi18FULiRfbID1JCo
	Ewl78EM80sH5AdB8H4uiqsi8vUQorVAyLOtk18MBZtUTCR8XTYFbqOcP+pUjyh9N5NG
	tOM6cFrbBbZqP5G2uxqnoLMg/i0vQ2CCm4qnmFgU=
Content-Type: multipart/mixed; boundary="===============5384938685343675464=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-webcolors: upgrading to 25.10.0 SUCCEEDED
Message-ID: <0101019b262ea628-b16ada2d-aaa3-4b67-b31f-c9d797eb109e-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227833

--===============5384938685343675464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-webcolors* to *25.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-webcolors-upgrade-24.11.1-25.10.0.patch
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
From c4e180713d9bc2a139fb72942813527ec3861a0b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 01:40:52 +0000
Subject: [PATCH] python3-webcolors: upgrade 24.11.1 -> 25.10.0

---
 ...ython3-webcolors_24.11.1.bb => python3-webcolors_25.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-webcolors_24.11.1.bb => python3-webcolors_25.10.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb b/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
rename to meta/recipes-devtools/python/python3-webcolors_25.10.0.bb
index d537614545..8e4f264d04 100644
--- a/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
+++ b/meta/recipes-devtools/python/python3-webcolors_25.10.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/webcolors/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cbaebec43b7d199c7fd8f5411b3b0448"
 
-SRC_URI[sha256sum] = "ecb3d768f32202af770477b8b65f318fa4f566c22948673a977b00d589dd80f6"
+SRC_URI[sha256sum] = "62abae86504f66d0f6364c2a8520de4a0c47b80c03fc3a5f1815fedbef7c19bf"
 
 inherit pypi python_pdm ptest-python-pytest
 
-- 
2.47.1


--===============5384938685343675464==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-webcolors-upgrade-24.11.1-25.10.0.patch"

RnJvbSBjNGUxODA3MTNkOWJjMmExMzlmYjcyOTQyODEzNTI3ZWMzODYxYTBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDE6NDA6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdlYmNvbG9yczogdXBncmFkZSAyNC4xMS4xIC0+IDI1LjEwLjAKCi0tLQogLi4ueXRo
b24zLXdlYmNvbG9yc18yNC4xMS4xLmJiID0+IHB5dGhvbjMtd2ViY29sb3JzXzI1LjEwLjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13ZWJjb2xvcnNfMjQu
MTEuMS5iYiA9PiBweXRob24zLXdlYmNvbG9yc18yNS4xMC4wLmJifSAoODAlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjQuMTEu
MS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjUu
MTAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2ViY29sb3JzXzI0LjExLjEuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjUuMTAuMC5iYgppbmRl
eCBkNTM3NjE0NTQ1Li44ZTRmMjY0ZDA0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtd2ViY29sb3JzXzI0LjExLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYmNvbG9yc18yNS4xMC4wLmJiCkBAIC0zLDcgKzMs
NyBAQCBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3Qvd2ViY29sb3JzLyIKIExJ
Q0VOU0UgPSAiQlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RTttZDU9Y2JhZWJlYzQzYjdkMTk5YzdmZDhmNTQxMWIzYjA0NDgiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICJlY2IzZDc2OGYzMjIwMmFmNzcwNDc3YjhiNjVmMzE4ZmE0ZjU2NmMyMjk0ODY3M2E5
NzdiMDBkNTg5ZGQ4MGY2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYyYWJhZTg2NTA0ZjY2ZDBm
NjM2NGMyYTg1MjBkZTRhMGM0N2I4MGMwM2ZjM2E1ZjE4MTVmZWRiZWY3YzE5YmYiCiAKIGluaGVy
aXQgcHlwaSBweXRob25fcGRtIHB0ZXN0LXB5dGhvbi1weXRlc3QKIAotLSAKMi40Ny4xCgo=

--===============5384938685343675464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors: FILELIST: directory renamed /usr/lib/python3.13/site-packages/webcolors-24.11.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/webcolors-25.10.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/webcolors-24.11.1.dist-info -> /usr/lib/python3.13/site-packages/webcolors-25.10.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-webcolors (sysroot):
  /usr/lib/python3.13/site-packages/webcolors-24.11.1.dist-info moved to /usr/lib/python3.13/site-packages/webcolors-25.10.0.dist-info

--===============5384938685343675464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-webcolors: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/webcolors/webcolors-24.11.1.tar.gz;downloadfilename=webcolors-24.11.1.tar.gz" to "https://files.pythonhosted.org/packages/source/w/webcolors/webcolors-25.10.0.tar.gz;downloadfilename=webcolors-25.10.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-webcolors: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-dbg: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-dbg: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-dev: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-dev: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-doc: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-doc: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-locale: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-locale: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-ptest: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-ptest: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-ptest: PKGSIZE changed from 35834 to 37693 (+5%)
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-src: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-src: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-staticdev: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-staticdev: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors: FILELIST: directory renamed /usr/lib/python3.13/site-packages/webcolors-24.11.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/webcolors-25.10.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/webcolors-24.11.1.dist-info -> /usr/lib/python3.13/site-packages/webcolors-25.10.0.dist-info
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors: PKGSIZE changed from 85537 to 85262 (-0%)
Changes to packages/x86-64-v3-poky-linux/python3-webcolors (sysroot):
  /usr/lib/python3.13/site-packages/webcolors-24.11.1.dist-info moved to /usr/lib/python3.13/site-packages/webcolors-25.10.0.dist-info

--===============5384938685343675464==--

