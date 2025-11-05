Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6D6CD3447
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:36 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2363.1762384580621705410
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0A/zb2TV;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=EAMU5zN3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019a564eb93f-29845a72-2fef-4e01-8cf5-2f28ff5f4043-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384591;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WgVbXzWUtOXUwm8A8nIrIuC/1/6IRxGqG1AbamHVhbA=;
	b=0A/zb2TVQWLGOKoeDdKevqH3Z58zY6YQTR/PPwPvyU2ttfg56I2uigNHmkSbkbJw
	CgYNpaAy7yGA9ePapmKwW3uM9UtPyOxVdTO38bBEGQSJHBI1aN4Amj06ZblXRAc04k7
	j90z1tTIaCZU1qVB++sOQCPxn7lIGmVQpOXrgaRc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384591;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WgVbXzWUtOXUwm8A8nIrIuC/1/6IRxGqG1AbamHVhbA=;
	b=EAMU5zN3j4eUGbWh/K/HSrOeGxJncEmLf0uM2jpZE7dA/o8yofM92I7ezix/gDvH
	YLztu4RQem7zUB7RhBSg7E6yo581Jar6VoFz2uufBjjfMf3yFIRjP2BWk8VHNLD/TgW
	pHDW8NJh/mcUMibUiBu06EY5xSW7tkEAps2op1jw=
Content-Type: multipart/mixed; boundary="===============8661212555919215243=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-webcolors: upgrading to 25.10.0 SUCCEEDED
Message-ID: <0101019a564eb93f-29845a72-2fef-4e01-8cf5-2f28ff5f4043-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225850

--===============8661212555919215243==
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
From b4ca78458feba3837d4d6e3ef6723512761f236c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 18:04:06 +0000
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


--===============8661212555919215243==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-webcolors-upgrade-24.11.1-25.10.0.patch"

RnJvbSBiNGNhNzg0NThmZWJhMzgzN2Q0ZDZlM2VmNjcyMzUxMjc2MWYyMzZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxODowNDowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2ViY29sb3JzOiB1cGdyYWRlIDI0LjExLjEgLT4gMjUuMTAuMAoKLS0tCiAuLi55dGhv
bjMtd2ViY29sb3JzXzI0LjExLjEuYmIgPT4gcHl0aG9uMy13ZWJjb2xvcnNfMjUuMTAuMC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXdlYmNvbG9yc18yNC4x
MS4xLmJiID0+IHB5dGhvbjMtd2ViY29sb3JzXzI1LjEwLjAuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYmNvbG9yc18yNC4xMS4x
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYmNvbG9yc18yNS4x
MC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjQuMTEuMS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYmNvbG9yc18yNS4xMC4wLmJiCmluZGV4
IGQ1Mzc2MTQ1NDUuLjhlNGYyNjRkMDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjQuMTEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2ViY29sb3JzXzI1LjEwLjAuYmIKQEAgLTMsNyArMyw3
IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC93ZWJjb2xvcnMvIgogTElD
RU5TRSA9ICJCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT1jYmFlYmVjNDNiN2QxOTljN2ZkOGY1NDExYjNiMDQ0OCIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gImVjYjNkNzY4ZjMyMjAyYWY3NzA0NzdiOGI2NWYzMThmYTRmNTY2YzIyOTQ4NjczYTk3
N2IwMGQ1ODlkZDgwZjYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjJhYmFlODY1MDRmNjZkMGY2
MzY0YzJhODUyMGRlNGEwYzQ3YjgwYzAzZmMzYTVmMTgxNWZlZGJlZjdjMTliZiIKIAogaW5oZXJp
dCBweXBpIHB5dGhvbl9wZG0gcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============8661212555919215243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-webcolors (sysroot):
  /usr/lib/python3.13/site-packages/webcolors-24.11.1.dist-info moved to /usr/lib/python3.13/site-packages/webcolors-25.10.0.dist-info

--===============8661212555919215243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-webcolors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/webcolors/webcolors-24.11.1.tar.gz;downloadfilename=webcolors-24.11.1.tar.gz" to "https://files.pythonhosted.org/packages/source/w/webcolors/webcolors-25.10.0.tar.gz;downloadfilename=webcolors-25.10.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-webcolors: PV changed from "24.11.1" to "25.10.0"
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
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-ptest: PKGSIZE changed from 35834 to 37693 (+5%)
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-ptest: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-src: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-src: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-staticdev: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors-staticdev: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors: PV changed from "24.11.1" to "25.10.0"
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors: PKGSIZE changed from 85537 to 85262 (-0%)
packages/x86-64-v3-poky-linux/python3-webcolors/python3-webcolors: PKGV changed from 24.11.1 [default] to 25.10.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-webcolors (sysroot):
  /usr/lib/python3.13/site-packages/webcolors-24.11.1.dist-info moved to /usr/lib/python3.13/site-packages/webcolors-25.10.0.dist-info

--===============8661212555919215243==--

