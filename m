Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6C3D5C0D0
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:23 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17382.1765872127684878873
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Xec/Nqfn;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ibuq+q26;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b262e80fd-2d8c3d13-1718-4b48-b6aa-af7f1d14d6ca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872140;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1KWPuXzZIwHtW2PW6O5lwvZJe83MZaC/aIuvH2GRhhc=;
	b=Xec/NqfnkD+HNVkkWJINczkNrlER0LA6pNC14+Lz5mdumBBiGsPgM0piUB3wraNF
	/kz5Wmq/TbQjIEMIJa0P7xQ1k8098w0dpgl1d3qTFo6F3iou2IG1DgaLLQlCtllLyC+
	75ulylXHRSxCIJZweuGAhFl40ZlYJ4OafCJG+wnY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872140;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1KWPuXzZIwHtW2PW6O5lwvZJe83MZaC/aIuvH2GRhhc=;
	b=ibuq+q26ik3pU7a+HzdsE5O3MJ6DFq6cK7xN554FY7tAHEoZxW8+ZYdG1C+3hRXP
	RYVUetzuiZRalUuYBa1DbECfFMqZnXLpiZ/Mb+u+vHbIuOz0cgAczpuGpVNk/oqi4/t
	QHOxoD3JiYpqItHj9cRKOG5gQfn/VaB9ftAeCTKU=
Content-Type: multipart/mixed; boundary="===============0025550973810389287=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.37.2 SUCCEEDED
Message-ID: <0101019b262e80fd-2d8c3d13-1718-4b48-b6aa-af7f1d14d6ca-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227801

--===============0025550973810389287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dbusmock* to *0.37.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dbusmock-upgrade-0.37.0-0.37.2.patch
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
From 8f4e1416270495efc3c50c3f351b398ad2b774f3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 23:39:39 +0000
Subject: [PATCH] python3-dbusmock: upgrade 0.37.0 -> 0.37.2

---
 .../{python3-dbusmock_0.37.0.bb => python3-dbusmock_0.37.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.37.0.bb => python3-dbusmock_0.37.2.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.37.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-dbusmock_0.37.0.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb
index 50c46abc95..afbf0f0c57 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.37.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "38754c5ad2ad8f3936ff67d4b058bca416588a72bc094e91ded9f8f401b06310"
+SRC_URI[sha256sum] = "e0c7354f6887036ee519f2fbba55ce14bb21c3ffceab06c085d15bbbda2b1d03"
 
 PYPI_PACKAGE = "python_dbusmock"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============0025550973810389287==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dbusmock-upgrade-0.37.0-0.37.2.patch"

RnJvbSA4ZjRlMTQxNjI3MDQ5NWVmYzNjNTBjM2YzNTFiMzk4YWQyYjc3NGYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjM6Mzk6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWRidXNtb2NrOiB1cGdyYWRlIDAuMzcuMCAtPiAwLjM3LjIKCi0tLQogLi4uL3tweXRo
b24zLWRidXNtb2NrXzAuMzcuMC5iYiA9PiBweXRob24zLWRidXNtb2NrXzAuMzcuMi5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kYnVzbW9ja18wLjM3LjAu
YmIgPT4gcHl0aG9uMy1kYnVzbW9ja18wLjM3LjIuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRidXNtb2NrXzAuMzcuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kYnVzbW9ja18wLjM3LjIuYmIKc2lt
aWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWRidXNtb2NrXzAuMzcuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWRidXNtb2NrXzAuMzcuMi5iYgppbmRleCA1MGM0NmFiYzk1Li5h
ZmJmMGYwYzU3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZGJ1c21vY2tfMC4zNy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1kYnVzbW9ja18wLjM3LjIuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9weXRob24tZGJ1c21vY2svIgogTElDRU5TRSA9ICJHUEwt
My4wLW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1lNmE2MDBm
ZDVlMWQ5Y2JkZTJkOTgzNjgwMjMzYWQwMiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM4NzU0
YzVhZDJhZDhmMzkzNmZmNjdkNGIwNThiY2E0MTY1ODhhNzJiYzA5NGU5MWRlZDlmOGY0MDFiMDYz
MTAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTBjNzM1NGY2ODg3MDM2ZWU1MTlmMmZiYmE1NWNl
MTRiYjIxYzNmZmNlYWIwNmMwODVkMTViYmJkYTJiMWQwMyIKIAogUFlQSV9QQUNLQUdFID0gInB5
dGhvbl9kYnVzbW9jayIKIFVQU1RSRUFNX0NIRUNLX1BZUElfUEFDS0FHRSA9ICIke1BZUElfUEFD
S0FHRX0iCi0tIAoyLjQ3LjEKCg==

--===============0025550973810389287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock: FILELIST: directory renamed /usr/lib/python3.13/site-packages/python_dbusmock-0.37.0.dist-info -> /usr/lib/python3.13/site-packages/python_dbusmock-0.37.2.dist-info, directory renamed /usr/lib/python3.13/site-packages/python_dbusmock-0.37.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/python_dbusmock-0.37.2.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.13/site-packages/python_dbusmock-0.37.0.dist-info moved to /usr/lib/python3.13/site-packages/python_dbusmock-0.37.2.dist-info

--===============0025550973810389287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-dbusmock: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python_dbusmock/python_dbusmock-0.37.0.tar.gz;downloadfilename=python_dbusmock-0.37.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python_dbusmock/python_dbusmock-0.37.2.tar.gz;downloadfilename=python_dbusmock-0.37.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-dbusmock: PKGV changed from 0.37.0 [default] to 0.37.2 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock: PV changed from "0.37.0" to "0.37.2"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PKGV changed from 0.37.0 [default] to 0.37.2 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PV changed from "0.37.0" to "0.37.2"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-dev: PKGV changed from 0.37.0 [default] to 0.37.2 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-dev: PV changed from "0.37.0" to "0.37.2"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-doc: PKGV changed from 0.37.0 [default] to 0.37.2 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-doc: PV changed from "0.37.0" to "0.37.2"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-locale: PKGV changed from 0.37.0 [default] to 0.37.2 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-locale: PV changed from "0.37.0" to "0.37.2"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-src: PKGV changed from 0.37.0 [default] to 0.37.2 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-src: PV changed from "0.37.0" to "0.37.2"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PKGV changed from 0.37.0 [default] to 0.37.2 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PV changed from "0.37.0" to "0.37.2"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock: PKGV changed from 0.37.0 [default] to 0.37.2 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock: PKGSIZE changed from 490071 to 490067 (-0%)
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock: FILELIST: directory renamed /usr/lib/python3.13/site-packages/python_dbusmock-0.37.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/python_dbusmock-0.37.2.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/python_dbusmock-0.37.0.dist-info -> /usr/lib/python3.13/site-packages/python_dbusmock-0.37.2.dist-info
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock: PV changed from "0.37.0" to "0.37.2"
Changes to packages/x86-64-v3-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.13/site-packages/python_dbusmock-0.37.0.dist-info moved to /usr/lib/python3.13/site-packages/python_dbusmock-0.37.2.dist-info

--===============0025550973810389287==--

