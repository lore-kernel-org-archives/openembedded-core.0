Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD400C2BBE7
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.39311.1656687063128265966
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ivGObwHh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010181ba3e6d39-34c9bc19-70b4-47f9-968c-c5f21e21b982-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hO3sKnSYhPXlMk07lmiiMteLlPSQDX6kZF3XUGD/Yxs=;
	b=ivGObwHhLv5zaMrf8v6kBJilfpLfo9C2ixHlumL2z7hrMouuB92m4b+9I6G7VsZ0
	/H8ZoCrjj7AG8lNpK65yHYiUmZSXyEK1PbkaTps5YEmprNkatsY1pkzn9ptvh+/8E2j
	ndll1KAVP8c//izIN9HZL3MDbn4sFM+QzD7x+ruo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hO3sKnSYhPXlMk07lmiiMteLlPSQDX6kZF3XUGD/Yxs=;
	b=ks2I+Rc+nxRLeTVtoknivYTBesSJ6MFbivhKH2RBaDG8oxeJkqaw94u4+SZTAtIl
	KQ9yvc6LFTLVUPkIfZDe3Sm0GkBjhyVps92785aVzM98N28xieSh/K5y392h5BCZXJ8
	tMvNOUxoOnTX/NVtVHkkwQBq8S0mNn+EJpEThXW0=
Content-Type: multipart/mixed; boundary="===============8508790263937135733=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodomex: upgrading to 3.15.0 SUCCEEDED
Message-ID: 
 <01010181ba3e6d39-34c9bc19-70b4-47f9-968c-c5f21e21b982-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167492

--===============8508790263937135733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycryptodomex* to *3.15.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodomex-upgrade-3.14.1-3.15.0.patch
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
--===============8508790263937135733==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-pycryptodomex-upgrade-3.14.1-3.15.0.patch"

From c9d706377ae18a487277737c0c99059c14422805 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 08:53:27 +0000
Subject: [PATCH] python3-pycryptodomex: upgrade 3.14.1 -> 3.15.0

---
 ...-pycryptodomex_3.14.1.bb => python3-pycryptodomex_3.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.14.1.bb => python3-pycryptodomex_3.15.0.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.14.1.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.15.0.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.14.1.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.15.0.bb
index 79a3fee19c..e22ce30833 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.14.1.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.15.0.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "2ce76ed0081fd6ac8c74edc75b9d14eca2064173af79843c24fa62573263c1f2"
+SRC_URI[sha256sum] = "7341f1bb2dadb0d1a0047f34c3a58208a92423cdbd3244d998e4b28df5eac0ed"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.31.1


--===============8508790263937135733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pycryptodomex: PV changed from "3.14.1" to "3.15.0"
packages/core2-32-poky-linux/python3-pycryptodomex: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.14.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.15.0.tar.gz"
packages/core2-32-poky-linux/python3-pycryptodomex: PKGV changed from 3.14.1 [default] to 3.15.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PV changed from "3.14.1" to "3.15.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGV changed from 3.14.1 [default] to 3.15.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: FILELIST: added "/usr/lib/python3.10/site-packages/Cryptodome/PublicKey/.debug/_ed25519.abi3.so /usr/lib/python3.10/site-packages/Cryptodome/PublicKey/.debug/_ed448.abi3.so /usr/lib/python3.10/site-packages/Cryptodome/PublicKey/.debug/_x25519.abi3.so"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGSIZE changed from 795740 to 1037900 (+30%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PV changed from "3.14.1" to "3.15.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PKGV changed from 3.14.1 [default] to 3.15.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PV changed from "3.14.1" to "3.15.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PKGV changed from 3.14.1 [default] to 3.15.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PV changed from "3.14.1" to "3.15.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PKGV changed from 3.14.1 [default] to 3.15.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PV changed from "3.14.1" to "3.15.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGV changed from 3.14.1 [default] to 3.15.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: FILELIST: directory renamed /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/libtom -> /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/libtom, removed "/usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/siphash.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/p521_table.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/SHA384.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/hash_SHA2_template.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/ghash_clmul.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/raw_cbc.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/CAST.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/SHA256.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycry
 ptodomex-3.14.1/src/AES.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/MD2.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/multiply_64.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/raw_cfb.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/raw_ocb.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/common.h /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/raw_ctr.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/blake2b.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/strxor.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/modexp_utils.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/mont.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/raw_ecb.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/s
 rc/MD4.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/chacha20.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/SHA1.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/MD5.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/SHA224.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/Salsa20.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/cpuid.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/ARC2.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/ec.h /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/p256_table.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/p521_table.h /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/modexp.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/modexp_utils.h /usr/src/de
 bug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/p384_table.h /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/p256_table.h /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/block_common.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/blake2.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/blowfish_init.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/ghash_portable.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/multiply.h /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/SHA512.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/endianess.h /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/blake2s.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/keccak.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/ARC4.c /us
 r/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/RIPEMD160.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/raw_ofb.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/siphash.h /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/ec_ws.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/block_base.h /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/DES.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/p384_table.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/AESNI.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/blowfish.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/pkcs1_decode.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/cast5.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/scrypt.c /usr/src/debu
 g/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/poly1305.c /usr/src/debug/python3-pycryptodomex/3.14.1-r0/pycryptodomex-3.14.1/src/mont.h", added "/usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/common.h /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/ghash_clmul.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/blowfish_init.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/AESNI.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/modexp.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/siphash.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/mont.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/p384_table.h /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/p521_table.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/block_base.h /usr/sr
 c/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/ed448.h /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/p521_table.h /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/SHA384.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/ed25519.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/modexp_utils.h /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/raw_ctr.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/raw_cfb.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/MD2.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/MD4.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/strxor.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/scrypt.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/raw_ofb.c /usr/src/debug/python3-py
 cryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/cast5.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/cpuid.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/endianess.h /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/pkcs1_decode.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/raw_cbc.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/multiply.h /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/RIPEMD160.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/ec.h /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/modexp_utils.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/blake2.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/ghash_portable.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/DES.c /usr/src/debug/python3-pycrypt
 odomex/3.15.0-r0/pycryptodomex-3.15.0/src/SHA1.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/keccak.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/SHA256.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/ed25519.h /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/ec_ws.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/p384_table.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/p256_table.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/ed448.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/blake2b.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/SHA512.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/mod25519.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/p256_table.h /usr/src/debug/python3-pycryptodomex/3.15.0
 -r0/pycryptodomex-3.15.0/src/blake2s.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/chacha20.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/AES.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/CAST.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/poly1305.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/raw_ecb.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/block_common.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/ARC2.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/blowfish.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/hash_SHA2_template.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/raw_ocb.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/MD5.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycr
 yptodomex-3.15.0/src/ARC4.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/SHA224.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/Salsa20.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/mont.h /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/x25519.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/multiply_64.c /usr/src/debug/python3-pycryptodomex/3.15.0-r0/pycryptodomex-3.15.0/src/bignum.c"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGSIZE changed from 2715202 to 2772679 (+2%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PV changed from "3.14.1" to "3.15.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PKGV changed from 3.14.1 [default] to 3.15.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PV changed from "3.14.1" to "3.15.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGV changed from 3.14.1 [default] to 3.15.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: FILELIST: removed "/usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC.py /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC.cpython-310.pyc", added "/usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_448.cpython-310.pyc /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_25519.cpython-310.pyc /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_NIST.py /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/Signature/__pycache__/test_eddsa.cpython-310.pyc /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/Signature/test_eddsa.py /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_NIST.cpython-310.pyc /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_25519.py /usr/lib/python3.10/site-packages/Cryptodome/SelfTe
 st/PublicKey/test_ECC_448.py"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGSIZE changed from 1997882 to 2118531 (+6%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PV changed from "3.14.1" to "3.15.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGV changed from 3.14.1 [default] to 3.15.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: FILELIST: directory renamed /usr/lib/python3.10/site-packages/pycryptodomex-3.14.1.dist-info -> /usr/lib/python3.10/site-packages/pycryptodomex-3.15.0.dist-info, added "/usr/lib/python3.10/site-packages/Cryptodome/Signature/__pycache__/eddsa.cpython-310.pyc /usr/lib/python3.10/site-packages/Cryptodome/Signature/eddsa.pyi /usr/lib/python3.10/site-packages/Cryptodome/PublicKey/_ed25519.abi3.so /usr/lib/python3.10/site-packages/Cryptodome/PublicKey/_ed448.abi3.so /usr/lib/python3.10/site-packages/Cryptodome/PublicKey/_x25519.abi3.so /usr/lib/python3.10/site-packages/Cryptodome/Signature/eddsa.py"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGSIZE changed from 3156105 to 3334725 (+6%)
Changes to packages/core2-32-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.10/site-packages/pycryptodomex-3.14.1.dist-info moved to /usr/lib/python3.10/site-packages/pycryptodomex-3.15.0.dist-info
  /usr/lib/python3.10/site-packages/Cryptodome/PublicKey/_ed25519.abi3.so was added
  /usr/lib/python3.10/site-packages/Cryptodome/PublicKey/_ed448.abi3.so was added
  /usr/lib/python3.10/site-packages/Cryptodome/PublicKey/_x25519.abi3.so was added
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_25519.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_448.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_NIST.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_25519.py was added
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_448.py was added
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_NIST.py was added
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/Signature/__pycache__/test_eddsa.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/Signature/test_eddsa.py was added
  /usr/lib/python3.10/site-packages/Cryptodome/Signature/eddsa.py was added
  /usr/lib/python3.10/site-packages/Cryptodome/Signature/eddsa.pyi was added
  /usr/lib/python3.10/site-packages/Cryptodome/Signature/__pycache__/eddsa.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC.py was removed

--===============8508790263937135733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGSIZE changed from 795740 to 1037900 (+30%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: FILELIST: removed "/usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC.cpython-310.pyc /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC.py", added "/usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_448.py /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_25519.cpython-310.pyc /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_448.cpython-310.pyc /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/Signature/test_eddsa.py /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_NIST.cpython-310.pyc /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/Signature/__pycache__/test_eddsa.cpython-310.pyc /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_NIST.py /usr/lib/python3.10/site-packages/Cryptodome/SelfTest
 /PublicKey/test_ECC_25519.py"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: FILELIST: directory renamed /usr/lib/python3.10/site-packages/pycryptodomex-3.14.1.dist-info -> /usr/lib/python3.10/site-packages/pycryptodomex-3.15.0.dist-info, added "/usr/lib/python3.10/site-packages/Cryptodome/Signature/__pycache__/eddsa.cpython-310.pyc /usr/lib/python3.10/site-packages/Cryptodome/PublicKey/_ed448.abi3.so /usr/lib/python3.10/site-packages/Cryptodome/PublicKey/_x25519.abi3.so /usr/lib/python3.10/site-packages/Cryptodome/Signature/eddsa.pyi /usr/lib/python3.10/site-packages/Cryptodome/PublicKey/_ed25519.abi3.so /usr/lib/python3.10/site-packages/Cryptodome/Signature/eddsa.py"
Changes to packages/core2-32-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.10/site-packages/pycryptodomex-3.14.1.dist-info moved to /usr/lib/python3.10/site-packages/pycryptodomex-3.15.0.dist-info
  /usr/lib/python3.10/site-packages/Cryptodome/PublicKey/_ed25519.abi3.so was added
  /usr/lib/python3.10/site-packages/Cryptodome/PublicKey/_ed448.abi3.so was added
  /usr/lib/python3.10/site-packages/Cryptodome/PublicKey/_x25519.abi3.so was added
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_25519.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_448.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_NIST.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_25519.py was added
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_448.py was added
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_NIST.py was added
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/Signature/__pycache__/test_eddsa.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/Signature/test_eddsa.py was added
  /usr/lib/python3.10/site-packages/Cryptodome/Signature/eddsa.py was added
  /usr/lib/python3.10/site-packages/Cryptodome/Signature/eddsa.pyi was added
  /usr/lib/python3.10/site-packages/Cryptodome/Signature/__pycache__/eddsa.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC.py was removed

--===============8508790263937135733==--

