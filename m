Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 00BFD6C57E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 15:41:50 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v6so9676947wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pWRVR0YfEvB/VDGNyiMyfx8ZhBeKAWeL4VBLqcgI3Nk=;
	b=slh8lezsBfc9LVZeU4SghpzaomEcxMHqd72BhuZEcqlN7dM8bW+vGmWIIQL8wzs/Tn
	6SPDd11VP6qR+UsUSuClHUgGkcZp0Iy7JvTI45JVqSS08NsohDqMQXh+cLy/mVyQ+Sek
	/6j4QvDBMVThKd0KKP2mHMmsSjktLXoPrbSmLeUmU8Yo04n61bVhhQlLqPWNJSLItWfD
	NzfoE7drlbCjSwJx1cjU7iGBKGpbiCU2+BopZfSE5EjLYdawEWJlUYDTLiW/+wwGvy7m
	AnLwGz6m7ATN4i8kn9Ue2scL2yGkh3zjXZvc6i6V2PXSMFoevDiVxUbwuPZHtgc7unnj
	1J7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pWRVR0YfEvB/VDGNyiMyfx8ZhBeKAWeL4VBLqcgI3Nk=;
	b=AMSVwcNoTX87zgzKwlHnKThkEnOCQBnnIlUn33EHIx9nsiVzCpBLtDuXYAh2Vu0Sc9
	sBqnbRoxySah898RMgD07bR/PbwJn/hO13GOZT/OBM0vkwHzKl0qXS/MTrWbE12UK3dP
	wBdwWvxVUcn/rzVtovp32hLHnG2HBXJ0gSJceLgGIUh5rJRUZM1DQJpluYHvjj2wRY5W
	3I3OlFFN8V1qbPXhKnk362zjpA7yzLoI07FwBoWI0FOMLKveYxxNsRMeaXr22w0XR+ju
	WLPcrKbSn2AGwJ+MlbtGRPf5DIyfvjjYuQldRVh+kFM/7Gb7oeYJs7rLGzN7ykrw64uk
	eC5w==
X-Gm-Message-State: AA+aEWbDSWYkj2W6Mo+ub+IOnqtRPCOLdNSmDBYb7J1MbWQ45ZojSl0A
	ltTsULQFhaCAghPokPFUQ6N7YGlk
X-Google-Smtp-Source: AFSGD/X1Jr42bF3tM10fJVjxqoeyafaWThaRtJc5o5rBq6BnFblnGtnLXu095pDlIb54vSgdGwQJpg==
X-Received: by 2002:a5d:55c9:: with SMTP id i9mr9739816wrw.287.1542901311370; 
	Thu, 22 Nov 2018 07:41:51 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm3302931wmf.22.2018.11.22.07.41.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 07:41:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 16:41:22 +0100
Message-Id: <20181122154136.121480-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122154136.121480-1-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/16] openssl10: update to 1.0.2q
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2018 15:41:51 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../openssl10/0001-fix-CVE-2018-0734.patch    | 33 -------------------
 ...penssl10_1.0.2p.bb => openssl10_1.0.2q.bb} |  5 ++-
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl10/0001-fix-CVE-2018-0734.patch
 rename meta/recipes-connectivity/openssl/{openssl10_1.0.2p.bb => openssl10_1.0.2q.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl10/0001-fix-CVE-2018-0734.patch b/meta/recipes-connectivity/openssl/openssl10/0001-fix-CVE-2018-0734.patch
deleted file mode 100644
index b9865a69b5f..00000000000
--- a/meta/recipes-connectivity/openssl/openssl10/0001-fix-CVE-2018-0734.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-CVE: CVE-2018-0734
-
-Upstream-Status: Backport
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From 43e6a58d4991a451daf4891ff05a48735df871ac Mon Sep 17 00:00:00 2001
-From: Pauli <paul.dale@oracle.com>
-Date: Mon, 29 Oct 2018 08:24:22 +1000
-Subject: [PATCH] Merge DSA reallocation timing fix CVE-2018-0734.
-
-Reviewed-by: Richard Levitte <levitte@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/7513)
----
- crypto/dsa/dsa_ossl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/crypto/dsa/dsa_ossl.c b/crypto/dsa/dsa_ossl.c
-index 2dcfedeeee..100e269268 100644
---- a/crypto/dsa/dsa_ossl.c
-+++ b/crypto/dsa/dsa_ossl.c
-@@ -279,7 +279,7 @@ static int dsa_sign_setup(DSA *dsa, BN_CTX *ctx_in, BIGNUM **kinvp,
-         goto err;
- 
-     /* Preallocate space */
--    q_bits = BN_num_bits(dsa->q);
-+    q_bits = BN_num_bits(dsa->q) + sizeof(dsa->q->d[0]) * 16;
-     if (!BN_set_bit(&k, q_bits)
-         || !BN_set_bit(&l, q_bits)
-         || !BN_set_bit(&m, q_bits))
--- 
-2.17.0
-
diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
rename to meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
index 43259407010..8058b98677a 100644
--- a/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
+++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
@@ -40,7 +40,6 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-Fix-build-with-clang-using-external-assembler.patch \
            file://0001-openssl-force-soft-link-to-avoid-rare-race.patch \
            file://0001-allow-manpages-to-be-disabled.patch \
-           file://0001-fix-CVE-2018-0734.patch \
            "
 
 SRC_URI_append_class-target = " \
@@ -52,8 +51,8 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[md5sum] = "ac5eb30bf5798aa14b1ae6d0e7da58df"
-SRC_URI[sha256sum] = "50a98e07b1a89eb8f6a99477f262df71c6fa7bef77df4dc83025a2845c827d00"
+SRC_URI[md5sum] = "7563e1ce046cb21948eeb6ba1a0eb71c"
+SRC_URI[sha256sum] = "5744cfcbcec2b1b48629f7354203bc1e5e9b5466998bbccc5b5fcde3b18eb684"
 
 S = "${WORKDIR}/openssl-${PV}"
 
-- 
2.17.1


