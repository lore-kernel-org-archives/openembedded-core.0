Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F7FC36000
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:20 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.10352.1742048289505815391
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=h/XiS3Uf;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=p1X/FzoB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101959a2b7aa6-555db263-34ba-482e-b943-09619cd22fe4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xUtky5BX11+u1LGNZJtgIQtHU3FzqcJ4PqLNCXr92mU=;
	b=h/XiS3UfynOZow2dnxnnD1e2mEhwGclQYtcSrdd7CETL72qIBwnXTPUdopXcyHho
	wy6ndgX7VzBhU5qq9jUVTb00mZlTjiQ/BmlYDmqJrzxWyEkszVtFsqA5kkHgWytK9cd
	btFc/YLpcKfhfrqP1SA8QLSLe4QYPGlaglyuoyow=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xUtky5BX11+u1LGNZJtgIQtHU3FzqcJ4PqLNCXr92mU=;
	b=p1X/FzoBZREypOXZCvP10bJOl9mvUDmzgNK8wTppjLPgdWT8x4YguX3LMwNTPqjn
	/eaiWctOM5fYWNb0LZICUB/lSGzGKXPIlO65yZFUHHxlws8XxZFHtB0iYc2WVfJU0E0
	hxRKS8t9b2mQMUjNe87LBYSBvUS79NDvSiDMLn+M=
Content-Type: multipart/mixed; boundary="===============3522402998896712659=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fastfloat: upgrading to 8.0.2 SUCCEEDED
Message-ID: <010101959a2b7aa6-555db263-34ba-482e-b943-09619cd22fe4-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212896

--===============3522402998896712659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fastfloat* to *8.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fastfloat-upgrade-8.0.0-8.0.2.patch
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
From ae15abb9cb13b23c5aff7b39feeafb2ee14d8a77 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 08:13:29 +0000
Subject: [PATCH] fastfloat: upgrade 8.0.0 -> 8.0.2

---
 .../fastfloat/{fastfloat_8.0.0.bb => fastfloat_8.0.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.0.0.bb => fastfloat_8.0.2.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.0.0.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.0.2.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.0.0.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.0.2.bb
index 6426a1d2ec..b3f45ccef4 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.0.0.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.0.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main"
 
-SRCREV = "77cc847c842c49e7e3477c1e95da2b6540166d66"
+SRCREV = "50a80a73ab2ab256ba1c3bf86923ddd8b4202bc7"
 S = "${WORKDIR}/git"
 
 inherit cmake
-- 
2.44.1


--===============3522402998896712659==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fastfloat-upgrade-8.0.0-8.0.2.patch"

RnJvbSBhZTE1YWJiOWNiMTNiMjNjNWFmZjdiMzlmZWVhZmIyZWUxNGQ4YTc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDg6MTM6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
YXN0ZmxvYXQ6IHVwZ3JhZGUgOC4wLjAgLT4gOC4wLjIKCi0tLQogLi4uL2Zhc3RmbG9hdC97ZmFz
dGZsb2F0XzguMC4wLmJiID0+IGZhc3RmbG9hdF84LjAuMi5iYn0gICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2Zhc3RmbG9hdC97ZmFzdGZsb2F0XzguMC4wLmJiID0+IGZhc3RmbG9h
dF84LjAuMi5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmFz
dGZsb2F0L2Zhc3RmbG9hdF84LjAuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0Zmxv
YXQvZmFzdGZsb2F0XzguMC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0ZmxvYXQvZmFzdGZsb2F0XzguMC4wLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjAuMi5iYgppbmRl
eCA2NDI2YTFkMmVjLi5iM2Y0NWNjZWY0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZmFzdGZsb2F0L2Zhc3RmbG9hdF84LjAuMi5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVT
X0NIS1NVTSA9ICIgXAogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vZmFzdGZsb2F0L2Zh
c3RfZmxvYXQuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIgogCi1TUkNSRVYgPSAiNzdj
Yzg0N2M4NDJjNDllN2UzNDc3YzFlOTVkYTJiNjU0MDE2NmQ2NiIKK1NSQ1JFViA9ICI1MGE4MGE3
M2FiMmFiMjU2YmExYzNiZjg2OTIzZGRkOGI0MjAyYmM3IgogUyA9ICIke1dPUktESVJ9L2dpdCIK
IAogaW5oZXJpdCBjbWFrZQotLSAKMi40NC4xCgo=

--===============3522402998896712659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/fastfloat/fastfloat-dbg: PV changed from "8.0.0" to "8.0.2"
packages/core2-64-poky-linux/fastfloat/fastfloat-dbg: PKGV changed from 8.0.0 [default] to 8.0.2 [default]
packages/core2-64-poky-linux/fastfloat/fastfloat-dev: PV changed from "8.0.0" to "8.0.2"
packages/core2-64-poky-linux/fastfloat/fastfloat-dev: PKGV changed from 8.0.0 [default] to 8.0.2 [default]
packages/core2-64-poky-linux/fastfloat/fastfloat-dev: PKGSIZE changed from 157825 to 158252 (+0%)
packages/core2-64-poky-linux/fastfloat/fastfloat-doc: PV changed from "8.0.0" to "8.0.2"
packages/core2-64-poky-linux/fastfloat/fastfloat-doc: PKGV changed from 8.0.0 [default] to 8.0.2 [default]
packages/core2-64-poky-linux/fastfloat/fastfloat-locale: PV changed from "8.0.0" to "8.0.2"
packages/core2-64-poky-linux/fastfloat/fastfloat-locale: PKGV changed from 8.0.0 [default] to 8.0.2 [default]
packages/core2-64-poky-linux/fastfloat/fastfloat-src: PV changed from "8.0.0" to "8.0.2"
packages/core2-64-poky-linux/fastfloat/fastfloat-src: PKGV changed from 8.0.0 [default] to 8.0.2 [default]
packages/core2-64-poky-linux/fastfloat/fastfloat-staticdev: PV changed from "8.0.0" to "8.0.2"
packages/core2-64-poky-linux/fastfloat/fastfloat-staticdev: PKGV changed from 8.0.0 [default] to 8.0.2 [default]
packages/core2-64-poky-linux/fastfloat/fastfloat: PV changed from "8.0.0" to "8.0.2"
packages/core2-64-poky-linux/fastfloat/fastfloat: PKGV changed from 8.0.0 [default] to 8.0.2 [default]
packages/core2-64-poky-linux/fastfloat: PV changed from "8.0.0" to "8.0.2"
packages/core2-64-poky-linux/fastfloat: PKGV changed from 8.0.0 [default] to 8.0.2 [default]

--===============3522402998896712659==--

