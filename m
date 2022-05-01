Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928CAC4707E
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.2280.1651434542748272530
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=rdAyQkzw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010180812b5408-28706621-d3bb-4375-8ad9-5743a4b4033b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qGgBej10FVIftUVebZ/DC1fmNnZtsiisNBcLkeZK6gs=;
	b=rdAyQkzwZseVEdVc/0fPfJ9l6rpErs+e/F4ecIoY2SXNcwhrrrXnk+W9fGuCO9OW
	2c427KosWV+M2k8FtCgqPM62kAf9ewsXg1evHdeu0Ft8oxN/LQVIxb359eFuu4Aj2OU
	B3RI9hrKYTT8y/9dMT49oouUmsjizhAqwPVLNBIk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qGgBej10FVIftUVebZ/DC1fmNnZtsiisNBcLkeZK6gs=;
	b=hEnvE6RR3Ub6FG/TSsjwn5JM5s0iShnDXp8oVqC4SlmeEtq9BGNjGuFqaFXmfi0I
	Dj596OEo/1rs8s4n2toYmO0K5YKbMX8Fv2/PzcYAuSLE2kotQu/1vI44RiE1Oml1zv/
	hJ162LW+8Uz6IFe1u2KUN67rAW6w72vhqkNDUPzo=
Content-Type: multipart/mixed; boundary="===============7822340805219852025=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors: upgrading to 37.0.1 SUCCEEDED
Message-ID: 
 <01010180812b5408-28706621-d3bb-4375-8ad9-5743a4b4033b-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165101

--===============7822340805219852025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography-vectors* to *37.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-vectors-upgrade-36.0.2-37.0.1.patch
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
--===============7822340805219852025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.10/site-packages/cryptography_vectors-36.0.2.dist-info -> /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.1.dist-info, added "/usr/lib/python3.10/site-packages/cryptography_vectors/x509/ocsp/ocsp-army.inapplicable-req.der /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_hash_mask_diff.pem /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_hash_mask.pem /usr/lib/python3.10/site-packages/cryptography_vectors/pkcs7/amazon-roots.der /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/invalid_utf8_common_name.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/scottishpower-bitstring-dn.pem /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/test-vector-1-nonce112.txt /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetri
 c/PEM_Serialization/rsa-bad-1025-q-is-2.pem /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/test-vector-1-nonce104.txt /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/ocsp/ocsp-army.valid-req.der /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_hash.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/ocsp/ocsp-army.revoked-req.der /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_hash_mask_salt.pem /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/test-vector-1-nonce120.txt"
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.10/site-packages/cryptography_vectors-36.0.2.dist-info moved to /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.1.dist-info
  /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PEM_Serialization/rsa-bad-1025-q-is-2.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_hash_mask_diff.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_hash_mask.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_hash_mask_salt.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_hash.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/test-vector-1-nonce104.txt was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/test-vector-1-nonce112.txt was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/test-vector-1-nonce120.txt was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/pkcs7/amazon-roots.der was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/invalid_utf8_common_name.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/ocsp/ocsp-army.inapplicable-req.der was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/ocsp/ocsp-army.revoked-req.der was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/ocsp/ocsp-army.valid-req.der was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/scottishpower-bitstring-dn.pem was added

--===============7822340805219852025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-36.0.2.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-37.0.1.tar.gz"
packages/core2-32-poky-linux/python3-cryptography-vectors: PV changed from "36.0.2" to "37.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors: PKGV changed from 36.0.2 [default] to 37.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "36.0.2" to "37.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 36.0.2 [default] to 37.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "36.0.2" to "37.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 36.0.2 [default] to 37.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "36.0.2" to "37.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 36.0.2 [default] to 37.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "36.0.2" to "37.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 36.0.2 [default] to 37.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "36.0.2" to "37.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 36.0.2 [default] to 37.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "36.0.2" to "37.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 36.0.2 [default] to 37.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "36.0.2" to "37.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 36.0.2 [default] to 37.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.10/site-packages/cryptography_vectors-36.0.2.dist-info -> /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.1.dist-info, added "/usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/test-vector-1-nonce120.txt /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048.pem /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_hash_mask.pem /usr/lib/python3.10/site-packages/cryptography_vectors/pkcs7/amazon-roots.der /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PEM_Serialization/rsa-bad-1025-q-is-2.pem /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_hash_mask_salt.pem /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_hash.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x
 509/custom/invalid_utf8_common_name.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/ocsp/ocsp-army.valid-req.der /usr/lib/python3.10/site-packages/cryptography_vectors/x509/scottishpower-bitstring-dn.pem /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_hash_mask_diff.pem /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/test-vector-1-nonce112.txt /usr/lib/python3.10/site-packages/cryptography_vectors/x509/ocsp/ocsp-army.revoked-req.der /usr/lib/python3.10/site-packages/cryptography_vectors/x509/ocsp/ocsp-army.inapplicable-req.der /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/test-vector-1-nonce104.txt"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGSIZE changed from 74797462 to 74825210 (+0%)
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.10/site-packages/cryptography_vectors-36.0.2.dist-info moved to /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.1.dist-info
  /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PEM_Serialization/rsa-bad-1025-q-is-2.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_hash_mask_diff.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_hash_mask.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_hash_mask_salt.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_hash.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/test-vector-1-nonce104.txt was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/test-vector-1-nonce112.txt was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/test-vector-1-nonce120.txt was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/pkcs7/amazon-roots.der was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/invalid_utf8_common_name.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/ocsp/ocsp-army.inapplicable-req.der was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/ocsp/ocsp-army.revoked-req.der was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/ocsp/ocsp-army.valid-req.der was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/scottishpower-bitstring-dn.pem was added

--===============7822340805219852025==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-upgrade-36.0.2-37.0.1.patch"

From 854ea143e7a0c555ef0070090fc8da6ca407bc74 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 10:12:04 +0000
Subject: [PATCH] python3-cryptography-vectors: upgrade 36.0.2 -> 37.0.1

---
 ...vectors_36.0.2.bb => python3-cryptography-vectors_37.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_36.0.2.bb => python3-cryptography-vectors_37.0.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.2.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_36.0.2.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb
index be0eda056e..98740ba95f 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "2a7924449a03025faf7f8754a6f4200001cab210734a6ce6ac1f6bdacd3a68e4"
+SRC_URI[sha256sum] = "66c9a714232be730fe822bd7e4e9da6231ff9e537ee4feb0f092c06b8ea4d94a"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.27.0


--===============7822340805219852025==--

