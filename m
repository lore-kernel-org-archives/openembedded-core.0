Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594F9C54744
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:20 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.70889.1724736259312926643
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UYmM+Nml;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a86e5e9ff05so53049666b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736258; x=1725341058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JpqE+UvUBaSlOZKe+DPZOPdu3GF40T4orggoT+2zBUo=;
        b=UYmM+NmlXE5865nEo7g9tVePTksfmaN4/cdzLeH3P9jdpyRhxA+80VgJCAkawpMiUT
         T2NOZbHXQSr1jYlEmQI7jTtKFWypzsWP/NS7TW4afgEm3I0SrgCEXRFDkXNLzhhHC47g
         wfv7j1tlEtH7bcQsFWdL1+E2TxnI6Zmvypx+6Q9GLeDtDuJe49pDKN97agJ8f4c4pLTX
         8+qiP5DRMUe7y5Em5BNZofsB+z9OCnZdJ34/QINgOtH+W1Aw9y0VihH+Hu0g2mMUwShf
         4mZAzBCbXwNVlKzxfHJlRot8LZzQ2EJ1mnJoeMIMbNPxJM5DjK0S5lIfSzNN8V/nJxdg
         /Szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736258; x=1725341058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpqE+UvUBaSlOZKe+DPZOPdu3GF40T4orggoT+2zBUo=;
        b=dvNKB5k94dpoyn0AXJPbAVDUrakuvmWjuwxV273vC4qfmv3OThkPv9LHMD720VdI6h
         TFRWo0pjH76k+VmGGAc0xs54R0F25wlR2F201/zdVRV4ImYBWPIyMIYo9RUXKUD9/hBQ
         oLlrr0W38/Y1mAtKYpZRZoP6Mv5/wpYjKIZKrwetIt9+N1ZgKukY6aFACBcySkITPOmS
         BAHoDEnKSZqdHKTa5KXCr3EY9DDAJb4qFL5P09vK8tiOUys+Nddwl1siXTPpu5+BRqjP
         Xiu6qum+RghMrmG2orMzV5hUplXR+jMwYePdGtuHJ9aEdN+wmIj3OvGs5zb7IYUWrNQR
         OguQ==
X-Gm-Message-State: AOJu0Yw7c/B2gAIm+a4FmEdruye7qEBXdxwDlV/d1DYpd/3xJgGryB09
	lwwZO4eQUvgPIp1s2IeaVNIrfQTfM221hCKSZ3qfjKcBQIvhrG+zxD41yg==
X-Google-Smtp-Source: AGHT+IG2dWsPAfc0nombqvskZ5EywA0IbFxsutuPP3GtDXkpi1bpViNVg69o+ub1bilc+JquZH//qQ==
X-Received: by 2002:a17:907:ea5:b0:a86:8f66:e5cf with SMTP id a640c23a62f3a-a86e397e579mr107679666b.2.1724736257283;
        Mon, 26 Aug 2024 22:24:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 34/34] cracklib: update 2.9.11 -> 2.10.2
Date: Tue, 27 Aug 2024 07:23:54 +0200
Message-Id: <20240827052354.1319810-34-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203810

From: Alexander Kanavin <alex@linutronix.de>

Drop endianness patch; upstream resolved the issue via:
https://github.com/cracklib/cracklib/pull/86
https://github.com/cracklib/cracklib/issues/74

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...port-dictionary-byte-order-dependent.patch | 339 ------------------
 ...{cracklib_2.9.11.bb => cracklib_2.10.2.bb} |   3 +-
 2 files changed, 1 insertion(+), 341 deletions(-)
 delete mode 100644 meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
 rename meta/recipes-extended/cracklib/{cracklib_2.9.11.bb => cracklib_2.10.2.bb} (85%)

diff --git a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
deleted file mode 100644
index 35229ae8900..00000000000
--- a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
+++ /dev/null
@@ -1,339 +0,0 @@
-From aae03b7e626d5f62ab929d51d11352a5a2ff6b2d Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Tue, 9 Jun 2015 11:11:48 +0900
-Subject: [PATCH 1/2] packlib.c: support dictionary byte order dependent
-
-The previous dict files are NOT byte-order independent, in fact they are
-probably ARCHITECTURE SPECIFIC.
-Create the dict files in big endian, and convert to host endian while
-load them. This could fix the endian issue on multiple platform.
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Upstream-Status: Submitted [https://github.com/cracklib/cracklib/pull/41]
-
-We can't use the endian.h, htobe* and be*toh functions because they are
-not available on older versions of glibc, such as that found in RHEL
-5.9.
-
-Change to checking endian and directly calling bswap_* as defined in
-byteswap.h.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
----
- lib/packlib.c | 214 +++++++++++++++++++++++++++++++++++++++++++++-
- 1 file changed, 210 insertions(+), 4 deletions(-)
-
-diff --git a/lib/packlib.c b/lib/packlib.c
-index 9396e1d..d0bb181 100644
---- a/lib/packlib.c
-+++ b/lib/packlib.c
-@@ -16,6 +16,12 @@
- #ifdef HAVE_STDINT_H
- #include <stdint.h>
- #endif
-+
-+#ifndef _BSD_SOURCE
-+#define _BSD_SOURCE             /* See feature_test_macros(7) */
-+#endif
-+#include <endian.h>
-+#include <byteswap.h>
- #include "packer.h"
- 
- #define DEBUG 0
-@@ -43,6 +49,185 @@ typedef struct
-     char data_get[NUMWORDS][MAXWORDLEN];
- } PWDICT64;
- 
-+enum{
-+    en_is32,
-+    en_is64
-+};
-+
-+static int
-+IheaderHostToBigEndian(char *pHeader, int nBitType)
-+{
-+    if (nBitType == en_is64 && __BYTE_ORDER == __LITTLE_ENDIAN)
-+    {
-+        struct pi_header64 *pHeader64 = (struct pi_header64*)pHeader;
-+
-+        pHeader64->pih_magic = bswap_64(pHeader64->pih_magic);
-+        pHeader64->pih_numwords = bswap_64(pHeader64->pih_numwords);
-+        pHeader64->pih_blocklen = bswap_16(pHeader64->pih_blocklen);
-+        pHeader64->pih_pad = bswap_16(pHeader64->pih_pad);
-+
-+#if DEBUG
-+        printf("Header64: magic %x, numwords %x, blocklen %x, pad %x\n",
-+          pHeader64->pih_magic, pHeader64->pih_numwords,
-+          pHeader64->pih_blocklen, pHeader64->pih_pad);
-+#endif
-+    }
-+    else if (nBitType == en_is32 && __BYTE_ORDER == __LITTLE_ENDIAN)
-+    {
-+        struct pi_header *pHeader32 = (struct pi_header*)pHeader;
-+
-+        pHeader32->pih_magic = bswap_32(pHeader32->pih_magic);
-+        pHeader32->pih_numwords = bswap_32(pHeader32->pih_numwords);
-+        pHeader32->pih_blocklen = bswap_16(pHeader32->pih_blocklen);
-+        pHeader32->pih_pad = bswap_16(pHeader32->pih_pad);
-+
-+#if DEBUG
-+        printf("Header32: magic %x, numwords %x, blocklen %x, pad %x\n",
-+          pHeader32->pih_magic, pHeader32->pih_numwords,
-+          pHeader32->pih_blocklen, pHeader32->pih_pad);
-+#endif
-+    }
-+    else if (__BYTE_ORDER == __LITTLE_ENDIAN)
-+    {
-+        fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
-+        return (-1);
-+    }
-+
-+    return 0;
-+}
-+
-+static int
-+IheaderBigEndianToHost(char *pHeader, int nBitType)
-+{
-+    if (nBitType == en_is64 && __BYTE_ORDER == __LITTLE_ENDIAN)
-+    {
-+        struct pi_header64 *pHeader64 = (struct pi_header64*)pHeader;
-+
-+        pHeader64->pih_magic = bswap_64(pHeader64->pih_magic);
-+        pHeader64->pih_numwords = bswap_64(pHeader64->pih_numwords);
-+        pHeader64->pih_blocklen = bswap_16(pHeader64->pih_blocklen);
-+        pHeader64->pih_pad = bswap_16(pHeader64->pih_pad);
-+
-+#if DEBUG
-+        printf("Header64: magic %x, numwords %x, blocklen %x, pad %x\n",
-+          pHeader64->pih_magic, pHeader64->pih_numwords,
-+          pHeader64->pih_blocklen, pHeader64->pih_pad);
-+#endif
-+    }
-+    else if (nBitType == en_is32 && __BYTE_ORDER == __LITTLE_ENDIAN)
-+    {
-+        struct pi_header *pHeader32 = (struct pi_header*)pHeader;
-+
-+        pHeader32->pih_magic = bswap_32(pHeader32->pih_magic);
-+        pHeader32->pih_numwords = bswap_32(pHeader32->pih_numwords);
-+        pHeader32->pih_blocklen = bswap_16(pHeader32->pih_blocklen);
-+        pHeader32->pih_pad = bswap_16(pHeader32->pih_pad);
-+
-+#if DEBUG
-+        printf("Header32: magic %x, numwords %x, blocklen %x, pad %x\n",
-+            pHeader32->pih_magic, pHeader32->pih_numwords,
-+            pHeader32->pih_blocklen, pHeader32->pih_pad);
-+#endif
-+    }
-+    else if (__BYTE_ORDER == __LITTLE_ENDIAN)
-+    {
-+        fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
-+        return (-1);
-+    }
-+
-+    return 0;
-+}
-+
-+static int
-+HwmsHostToBigEndian(char *pHwms, int nLen,int nBitType)
-+{
-+    int i = 0;
-+
-+    if (nBitType == en_is64 && __BYTE_ORDER == __LITTLE_ENDIAN)
-+    {
-+        uint64_t *pHwms64 = (uint64_t*)pHwms;
-+
-+        for (i = 0; i < nLen / sizeof(uint64_t); i++)
-+        {
-+            *pHwms64 = bswap_64(*pHwms64);
-+            *pHwms64++;
-+        }
-+
-+    }
-+    else if (nBitType == en_is32 && __BYTE_ORDER == __LITTLE_ENDIAN)
-+    {
-+        uint32_t *pHwms32 = (uint32_t*)pHwms;
-+
-+        for (i = 0; i < nLen / sizeof(uint32_t); i++)
-+        {
-+            *pHwms32 = bswap_32(*pHwms32);
-+            *pHwms32++;
-+        }
-+
-+    }
-+    else if (__BYTE_ORDER == __LITTLE_ENDIAN)
-+    {
-+        fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
-+        return (-1);
-+    }
-+
-+#if DEBUG
-+    for (i = 0; i < nLen; i+=8)
-+    {
-+        printf("hwms%s: %02X %02X %02X %02X %02X %02X %02X %02X\n",
-+            nBitType==en_is64?"64":"32", pHwms[i+0]&0xFF, pHwms[i+1]&0xFF,
-+            pHwms[i+2]&0xFF, pHwms[i+3]&0xFF, pHwms[i+4]&0xFF,
-+            pHwms[i+5]&0xFF, pHwms[i+6]&0xFF, pHwms[i+7]&0xFF);
-+    }
-+#endif
-+
-+    return 0;
-+}
-+
-+static int
-+HwmsBigEndianToHost(char *pHwms, int nLen, int nBitType)
-+{
-+    int i = 0;
-+
-+    if (nBitType == en_is64 && __BYTE_ORDER == __LITTLE_ENDIAN)
-+    {
-+        uint64_t *pHwms64 = (uint64_t*)pHwms;
-+
-+        for (i = 0; i < nLen / sizeof(uint64_t); i++)
-+        {
-+            *pHwms64++ = bswap_64(*pHwms64);
-+        }
-+
-+    }
-+    else if (nBitType == en_is32 && __BYTE_ORDER == __LITTLE_ENDIAN)
-+    {
-+        uint32_t *pHwms32 = (uint32_t*)pHwms;
-+
-+        for (i = 0; i < nLen / sizeof(uint32_t); i++)
-+        {
-+            *pHwms32 = bswap_32(*pHwms32);
-+            *pHwms32++;
-+        }
-+
-+    }
-+    else if (__BYTE_ORDER == __LITTLE_ENDIAN)
-+    {
-+        fprintf(stderr, "Neither 32 or 64: %d\n", nBitType);
-+        return (-1);
-+    }
-+
-+#if DEBUG
-+    for (i = 0; i < nLen; i+=8)
-+    {
-+        printf("hwms%s: %02X %02X %02X %02X %02X %02X %02X %02X\n",
-+            nBitType==en_is64?"64":"32", pHwms[i+0]&0xFF, pHwms[i+1]&0xFF,
-+            pHwms[i+2]&0xFF, pHwms[i+3]&0xFF, pHwms[i+4]&0xFF,
-+            pHwms[i+5]&0xFF, pHwms[i+6]&0xFF, pHwms[i+7]&0xFF);
-+    }
-+#endif
-+
-+    return 0;
-+}
- 
- static int
- _PWIsBroken64(FILE *ifp)
-@@ -55,6 +240,7 @@ _PWIsBroken64(FILE *ifp)
-        return 0;
-     }
- 
-+    IheaderBigEndianToHost((char *) &pdesc64.header, en_is64);
-     return (pdesc64.header.pih_magic == PIH_MAGIC);
- }
- 
-@@ -147,7 +333,11 @@ PWOpen(prefix, mode)
- 	pdesc.header.pih_blocklen = NUMWORDS;
- 	pdesc.header.pih_numwords = 0;
- 
--	fwrite((char *) &pdesc.header, sizeof(pdesc.header), 1, ifp);
-+	struct pi_header tmpheader32;
-+
-+	memcpy(&tmpheader32,  &pdesc.header, sizeof(pdesc.header));
-+	IheaderHostToBigEndian((char *) &tmpheader32, en_is32);
-+	fwrite((char *) &tmpheader32, sizeof(tmpheader32), 1, ifp);
-     } else
-     {
- 	pdesc.flags &= ~PFOR_WRITE;
-@@ -171,6 +361,7 @@ PWOpen(prefix, mode)
- 	    return NULL;
- 	}
- 
-+        IheaderBigEndianToHost((char *) &pdesc.header, en_is32);
-         if ((pdesc.header.pih_magic == 0) || (pdesc.header.pih_numwords == 0))
-         {
-             /* uh-oh. either a broken "64-bit" file or a garbage file. */
-@@ -193,6 +384,7 @@ PWOpen(prefix, mode)
- 		}
-                 return NULL;
-             }
-+            IheaderBigEndianToHost((char *) &pdesc64.header, en_is64);
-             if (pdesc64.header.pih_magic != PIH_MAGIC)
-             {
-                 /* nope, not "64-bit" after all */
-@@ -288,6 +480,7 @@ PWOpen(prefix, mode)
-                 {
-                     pdesc.flags &= ~PFOR_USEHWMS;
-                 }
-+                HwmsBigEndianToHost((char*)pdesc64.hwms, sizeof(pdesc64.hwms), en_is64);
-                 for (i = 0; i < sizeof(pdesc.hwms) / sizeof(pdesc.hwms[0]); i++)
-                 {
-                     pdesc.hwms[i] = pdesc64.hwms[i];
-@@ -297,6 +490,7 @@ PWOpen(prefix, mode)
- 	    {
- 		pdesc.flags &= ~PFOR_USEHWMS;
- 	    }
-+	    HwmsBigEndianToHost((char*)pdesc.hwms, sizeof(pdesc.hwms), en_is32);
- #if DEBUG
-             for (i=1; i<=0xff; i++)
-             {
-@@ -330,7 +524,11 @@ PWClose(pwp)
- 	    return (-1);
- 	}
- 
--	if (!fwrite((char *) &pwp->header, sizeof(pwp->header), 1, pwp->ifp))
-+	struct pi_header tmpheader32;
-+
-+	memcpy(&tmpheader32,  &pwp->header, sizeof(pwp->header));
-+	IheaderHostToBigEndian((char *) &tmpheader32, en_is32);
-+	if (!fwrite((char *) &tmpheader32, sizeof(tmpheader32), 1, pwp->ifp))
- 	{
- 	    fprintf(stderr, "index magic fwrite failed\n");
- 	    return (-1);
-@@ -349,7 +547,12 @@ PWClose(pwp)
- 	    	printf("hwm[%02x] = %d\n", i, pwp->hwms[i]);
- #endif
- 	    }
--	    fwrite(pwp->hwms, 1, sizeof(pwp->hwms), pwp->wfp);
-+
-+	    PWDICT tmp_pwp;
-+
-+	    memcpy(&tmp_pwp, pwp, sizeof(PWDICT));
-+	    HwmsHostToBigEndian((char *)tmp_pwp.hwms, sizeof(tmp_pwp.hwms), en_is32);
-+	    fwrite(tmp_pwp.hwms, 1, sizeof(tmp_pwp.hwms), pwp->wfp);
- 	}
-     }
- 
-@@ -403,7 +606,8 @@ PutPW(pwp, string)
- 
- 	datum = (uint32_t) ftell(pwp->dfp);
- 
--	fwrite((char *) &datum, sizeof(datum), 1, pwp->ifp);
-+	uint32_t tmpdatum = (__BYTE_ORDER == __LITTLE_ENDIAN) ? bswap_32(datum) : datum;
-+	fwrite((char *) &tmpdatum, sizeof(tmpdatum), 1, pwp->ifp);
- 
- 	fputs(pwp->data_put[0], pwp->dfp);
- 	putc(0, (FILE*) pwp->dfp);
-@@ -462,6 +666,7 @@ GetPW(pwp, number)
-            perror("(index fread failed)");
-            return NULL;
-        }
-+       datum64 = (__BYTE_ORDER == __LITTLE_ENDIAN) ? bswap_64(datum64) : datum64;
-        datum = datum64;
-     } else {
-        if (fseek(pwp->ifp, sizeof(struct pi_header) + (thisblock * sizeof(uint32_t)), 0))
-@@ -475,6 +680,7 @@ GetPW(pwp, number)
-            perror("(index fread failed)");
-            return NULL;
-        }
-+       datum = (__BYTE_ORDER == __LITTLE_ENDIAN) ? bswap_32(datum) : datum;
-     }
- 
- 	int r = 1;
--- 
-2.20.1
-
diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.11.bb b/meta/recipes-extended/cracklib/cracklib_2.10.2.bb
similarity index 85%
rename from meta/recipes-extended/cracklib/cracklib_2.9.11.bb
rename to meta/recipes-extended/cracklib/cracklib_2.10.2.bb
index 34ef2b65a11..2c913da1527 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.11.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.10.2.bb
@@ -10,10 +10,9 @@ DEPENDS = "cracklib-native zlib"
 EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
 
 SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=main \
-           file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
            "
 
-SRCREV = "4cf5125250c6325ef0a2dc085eabff875227edc3"
+SRCREV = "e5211fc1d2b435884a2bb77001e107489285296d"
 S = "${WORKDIR}/git/src"
 
 inherit autotools gettext
-- 
2.39.2


