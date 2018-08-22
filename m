Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 608DD793FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:21:06 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id y207-v6so3010950oie.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NXSciuBQ453n+BLI3fkOCYE1LXQmkU1Qrgu8NbP3u8o=;
	b=YZRDb5oEya5bDnMnDfKvL/xMQTLhLQY4MA1Yk8IPZLvnfoNR4NM4ZJUWTBlYYuAZKf
	2Muv4R6FfJ6gUHN+60cUaTkWZU8HuCAs1yKP1nuzCR0aDuspQurOFuV/m6L6s2swUyzw
	gQRHaPnFlmDe08WWIuX9zCnhU3sfRW7DBWxlejrZKQOKh6QFaPBvYQAemWPgZsfFZLe7
	UAtcZBuhHNcT0vROoS6598UPhJHUsX/eZkHPL0slzMOvHnH+xI+zU/qqFPhnZgjLbAoy
	FEum6Fn2KPOeIfX8VRPnZrDpWILul8+AmpAs7BP98UNr4ZJdGDvk1Y8Tq5UPsqA3/aV8
	ef+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NXSciuBQ453n+BLI3fkOCYE1LXQmkU1Qrgu8NbP3u8o=;
	b=rQ3lOgArMab7WJeL+le3XFErf4yckag/TrxNAG6bg2I6MLrr/KCig/SiIyLx0EIygf
	tg4nizBqivkI7t78gAB7OP0reixbZuuSvY00AinTf+LkmARtH5OQ0627Otk57QnmNoxl
	JZ1wT2Z/rsm7wrV2CkVPep0JrSqLTF5POMNirbIOTW7wY3C3QwHkeRHMX82c9c5p380D
	HqSw/rIJlXcF7yylKs51c3LmoRSeM77cp5N7q+BcggBkWLnwaHBzR8kQXYypPwygYYXB
	tpZZwzq2LE2YNQSTLXvnz9hSjAvjCtwpHd8ZYGk35cwyiEo0UtZ4Au7Hr5lH9Qny28Zi
	rnHQ==
X-Gm-Message-State: APzg51A8dToR//TpuBSH9dm9Qp5sGtt0S+wadsNAh61fImACgLNIOaOk
	Nd12ClKgrhRd7dxQeJKKOag59jdEtfA=
X-Google-Smtp-Source: ANB0VdaQzBxR1t8QAGEPI9D1CiwMMGOcD5p8mMsL7qB6jxYx9LJLMxOoJQ8Dg5NdCR4rxxsviVT92A==
X-Received: by 2002:aca:ceca:: with SMTP id
	e193-v6mr4142530oig.37.1534944067212; 
	Wed, 22 Aug 2018 06:21:07 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	t141-v6sm2354715oif.18.2018.08.22.06.21.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:21:06 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 18:50:09 +0530
Message-Id: <1534944009-21362-19-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [SUMO][PATCH 19/19] libgcrypt: CVE-2018-0495
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
X-List-Received-Date: Wed, 22 Aug 2018 13:21:06 -0000

ecc: Add blinding for ECDSA.

* cipher/ecc-ecdsa.c (_gcry_ecc_ecdsa_sign): Blind secret D with
randomized nonce B.

--

CVE-id: CVE-2018-0495

Affects libgcrypt < 1.7.10 and libgcrypt < 1.8.3

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../libgcrypt/files/CVE-2018-0495.patch            | 76 ++++++++++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt_1.8.2.bb  |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2018-0495.patch

diff --git a/meta/recipes-support/libgcrypt/files/CVE-2018-0495.patch b/meta/recipes-support/libgcrypt/files/CVE-2018-0495.patch
new file mode 100644
index 0000000..c16bd3a
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/CVE-2018-0495.patch
@@ -0,0 +1,76 @@
+From 9010d1576e278a4274ad3f4aa15776c28f6ba965 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Wed, 13 Jun 2018 15:28:58 +0900
+Subject: [PATCH] ecc: Add blinding for ECDSA.
+
+* cipher/ecc-ecdsa.c (_gcry_ecc_ecdsa_sign): Blind secret D with
+randomized nonce B.
+
+--
+
+Reported-by: Keegan Ryan <Keegan.Ryan@nccgroup.trust>
+CVE-id: CVE-2018-0495
+
+Upstream-Status: Backport [http://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=9010d1576e278a4274ad3f4aa15776c28f6ba965]
+
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ cipher/ecc-ecdsa.c | 20 ++++++++++++++++++--
+ 1 file changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/cipher/ecc-ecdsa.c b/cipher/ecc-ecdsa.c
+index 1484830b..140e8c09 100644
+--- a/cipher/ecc-ecdsa.c
++++ b/cipher/ecc-ecdsa.c
+@@ -50,6 +50,8 @@ _gcry_ecc_ecdsa_sign (gcry_mpi_t input, ECC_secret_key *skey,
+   const void *abuf;
+   unsigned int abits, qbits;
+   mpi_ec_t ctx;
++  gcry_mpi_t b;                /* Random number needed for blinding.  */
++  gcry_mpi_t bi;               /* multiplicative inverse of B.        */
+ 
+   if (DBG_CIPHER)
+     log_mpidump ("ecdsa sign hash  ", input );
+@@ -61,6 +63,15 @@ _gcry_ecc_ecdsa_sign (gcry_mpi_t input, ECC_secret_key *skey,
+   if (rc)
+     return rc;
+ 
++  b  = mpi_snew (qbits);
++  bi = mpi_snew (qbits);
++  do
++    {
++      _gcry_mpi_randomize (b, qbits, GCRY_WEAK_RANDOM);
++      mpi_mod (b, b, skey->E.n);
++    }
++  while (!mpi_invm (bi, b, skey->E.n));
++
+   k = NULL;
+   dr = mpi_alloc (0);
+   sum = mpi_alloc (0);
+@@ -115,8 +126,11 @@ _gcry_ecc_ecdsa_sign (gcry_mpi_t input, ECC_secret_key *skey,
+         }
+       while (!mpi_cmp_ui (r, 0));
+ 
+-      mpi_mulm (dr, skey->d, r, skey->E.n); /* dr = d*r mod n  */
+-      mpi_addm (sum, hash, dr, skey->E.n);  /* sum = hash + (d*r) mod n  */
++      mpi_mulm (dr, b, skey->d, skey->E.n);
++      mpi_mulm (dr, dr, r, skey->E.n);      /* dr = d*r mod n (blinded with b) */
++      mpi_mulm (sum, b, hash, skey->E.n);
++      mpi_addm (sum, sum, dr, skey->E.n);   /* sum = hash + (d*r) mod n  (blinded with b) */
++      mpi_mulm (sum, bi, sum, skey->E.n);   /* undo blinding by b^-1 */
+       mpi_invm (k_1, k, skey->E.n);         /* k_1 = k^(-1) mod n  */
+       mpi_mulm (s, k_1, sum, skey->E.n);    /* s = k^(-1)*(hash+(d*r)) mod n */
+     }
+@@ -129,6 +143,8 @@ _gcry_ecc_ecdsa_sign (gcry_mpi_t input, ECC_secret_key *skey,
+     }
+ 
+  leave:
++  mpi_free (b);
++  mpi_free (bi);
+   _gcry_mpi_ec_free (ctx);
+   point_free (&I);
+   mpi_free (x);
+-- 
+2.13.3
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.2.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.2.bb
index b36e653..9d036c8 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.2.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.2.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch \
            file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
+           file://CVE-2018-0495.patch \
 "
 SRC_URI[md5sum] = "cfb0b5c79eab07686b6898160a407139"
 SRC_URI[sha256sum] = "c8064cae7558144b13ef0eb87093412380efa16c4ee30ad12ecb54886a524c07"
-- 
2.7.4


