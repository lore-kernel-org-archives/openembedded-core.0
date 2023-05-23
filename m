Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38182C7EE2A
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 09:48:19 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.17770.1684835294873122701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 02:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cpHGFF6N;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-309550d4f73so3124993f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 02:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684835293; x=1687427293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2y6cKtF1RHiDy/YQbFmt9QBTDnBnpGnSILGMjcoKQnw=;
        b=cpHGFF6NRuFLujed8MWeXWtH7bL/YgzL+opUDTRn17KgYwby0q66CguabgktFVCKX+
         zOls+dcvP0KNWIaTEpj9gWlMeABTuWPRFsbq5LpcCzVdHz1zkXS5cPFPSeO2JJ/LO0G8
         bHK4P30Tt5BUAm4864rstQEQBD6kUg+CIozOPUmAd3qkhPjyW7izbHUnPpwTAq3zeWwI
         mAKggcRfclPHjb6AeYLX7PEJ92D+rK5KwnzfY32rJbxZP9mBSaV87yw4ACJRF52s2q1W
         Ed1yuB2GKCY1Ce5Q3/U9T3+t/wghDta2UQ4PiO4WWXs+iRPOG+F/M67bULtsYMsazbT3
         PyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684835293; x=1687427293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2y6cKtF1RHiDy/YQbFmt9QBTDnBnpGnSILGMjcoKQnw=;
        b=bwZx7M5UdTPZE07sNaxqtDfrHZYJixhLf5Ze9uwt+MtAr/Y1iCM3/1WtKb6EcKQDsj
         jD5bEEmkc5KUPGac5iwmTGQocBMRncNkXAmHqnxYwnWzRNaRTjrHEFXXO9bj2aanIyRF
         /G1iP0u2z5XBm7TdFHJ0KH3wLwUHd1rrgkXEGZ8JgWjiwYf+fvySLq+zhG4G37xnMszM
         CozDYeaMRGmLl+Q97qpAC1O7S1CGes9xMY5bYStki6gOi3gNIjfHAfW6AMKKl3xUBAvy
         KOX2oMH6bVUcYsy7Akg4GwxdIaKIuVngYPiUeJ9LW4nzaE9I28T7RcI0V3N03Ten2jEY
         X5pg==
X-Gm-Message-State: AC+VfDxsp5LLKuX0meiVH27US0nMzfZgl9UDUtNFCn9pOBhc7EzCBpo9
	9rNXg8NJI40YIcNVZ2ZgdI39aZMdiOE=
X-Google-Smtp-Source: ACHHUZ7ohx8E3HCh+qVmx6S8VDvdwEtmCKWJufjmAl1AXoxqNIPmJ05GcyxZuwBWicoDA285UIrEGA==
X-Received: by 2002:adf:e30f:0:b0:2f1:b74:5d8a with SMTP id b15-20020adfe30f000000b002f10b745d8amr13002191wrj.5.1684835292876;
        Tue, 23 May 2023 02:48:12 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j4-20020a5d6044000000b003093946ea60sm10545317wrt.46.2023.05.23.02.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 02:48:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] rpm: drop unused 0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch
Date: Tue, 23 May 2023 11:48:01 +0200
Message-Id: <20230523094801.3300144-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 09:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181632

* it was removed from SRC_URI in oe-core commit:
  commit 67257ca87c6fa8e6050a20ecea50daf834c7e869
  Author: Alexander Kanavin <alex.kanavin@gmail.com>
  Date:   Sat Apr 25 19:28:00 2020 +0200
  Subject: rpm: upgrade to 4.15.1

  and it's unused since then

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...support-for-unused-MD2-and-RIPEMD160.patch | 81 -------------------
 1 file changed, 81 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch b/meta/recipes-devtools/rpm/files/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch
deleted file mode 100644
index 734e38bb39..0000000000
--- a/meta/recipes-devtools/rpm/files/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 2d53d1e308a5bd15a16cc289fa7e1f264ea706be Mon Sep 17 00:00:00 2001
-From: Panu Matilainen <pmatilai@redhat.com>
-Date: Tue, 26 Jun 2018 10:46:14 +0300
-Subject: [PATCH] Rip out partial support for unused MD2 and RIPEMD160 digests
-
-Inspired by #453, adding configure-checks for unused digests algorithms
-seems nonsensical, at no point in rpm history have these algorithms been
-used for anything in rpm so there's not even backward compatibility to
-care about. So the question becomes why do we appear to have (some)
-support for those unused algorithms? So lets don't, problem solved...
-
-Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/ff4b9111aeba01dd025dd133ce617fb80f7398a0]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- rpmio/digest_beecrypt.c | 7 -------
- rpmio/digest_nss.c      | 2 --
- rpmio/digest_openssl.c  | 6 ------
- 3 files changed, 15 deletions(-)
-
-diff --git a/rpmio/digest_beecrypt.c b/rpmio/digest_beecrypt.c
-index 597027e25..653a39491 100644
---- a/rpmio/digest_beecrypt.c
-+++ b/rpmio/digest_beecrypt.c
-@@ -132,10 +132,6 @@ DIGEST_CTX rpmDigestInit(int hashalgo, rpmDigestFlags flags)
- 	ctx->Digest = (void *) sha512Digest;
- 	break;
- #endif
--    case PGPHASHALGO_RIPEMD160:
--    case PGPHASHALGO_MD2:
--    case PGPHASHALGO_TIGER192:
--    case PGPHASHALGO_HAVAL_5_160:
-     default:
- 	free(ctx);
- 	return NULL;
-@@ -292,9 +288,6 @@ static int pgpVerifySigRSA(pgpDigAlg pgpkey, pgpDigAlg pgpsig, uint8_t *hash, si
-     case PGPHASHALGO_SHA1:
-         prefix = "3021300906052b0e03021a05000414";
-         break;
--    case PGPHASHALGO_MD2:
--        prefix = "3020300c06082a864886f70d020205000410";
--        break;
-     case PGPHASHALGO_SHA256:
-         prefix = "3031300d060960864801650304020105000420";
-         break;
-diff --git a/rpmio/digest_nss.c b/rpmio/digest_nss.c
-index e11920e3e..b3d2b5595 100644
---- a/rpmio/digest_nss.c
-+++ b/rpmio/digest_nss.c
-@@ -117,7 +117,6 @@ static HASH_HashType getHashType(int hashalgo)
- {
-     switch (hashalgo) {
-     case PGPHASHALGO_MD5:	return HASH_AlgMD5;
--    case PGPHASHALGO_MD2:	return HASH_AlgMD2;
-     case PGPHASHALGO_SHA1:	return HASH_AlgSHA1;
- #ifdef SHA224_LENGTH
-     case PGPHASHALGO_SHA224:	return HASH_AlgSHA224;
-@@ -217,7 +216,6 @@ static SECOidTag getHashAlg(unsigned int hashalgo)
- {
-     switch (hashalgo) {
-     case PGPHASHALGO_MD5:	return SEC_OID_MD5;
--    case PGPHASHALGO_MD2:	return SEC_OID_MD2;
-     case PGPHASHALGO_SHA1:	return SEC_OID_SHA1;
- #ifdef SHA224_LENGTH
-     case PGPHASHALGO_SHA224:	return SEC_OID_SHA224;
-diff --git a/rpmio/digest_openssl.c b/rpmio/digest_openssl.c
-index 18e52a724..0ae48dd1d 100644
---- a/rpmio/digest_openssl.c
-+++ b/rpmio/digest_openssl.c
-@@ -172,12 +172,6 @@ static const EVP_MD *getEVPMD(int hashalgo)
-     case PGPHASHALGO_SHA1:
-         return EVP_sha1();
- 
--    case PGPHASHALGO_RIPEMD160:
--        return EVP_ripemd160();
--
--    case PGPHASHALGO_MD2:
--        return EVP_md2();
--
-     case PGPHASHALGO_SHA256:
-         return EVP_sha256();
- 
-- 
2.40.1


