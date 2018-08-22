Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0A2B9793BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:19:44 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id m11-v6so2519179oic.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7BeKQoe62SiQ10OoOpaSnBPahk/muQpOp/Ts6TuGeW0=;
	b=ZOU9xZ8i2ICviyKJUsC/xy4lZYzCF533tq8+k2FCjyH6F7IykVQObE+oltAqnGfJB7
	52ajhMlKatUiME/ge6Zla1AwOj1BH1AgLmOn0xwszLM1CYO2ywEDYbDLVz51EUmmynz+
	cLX/Bc261w+6XdNe55tvr+vTlYcX6uiY4MP+4xrbheb0Wd5E21TtQWvlEPAtzde+mNix
	JeW2ad1xEkEH2DypCXsQQEEzE/66uFh09f25/7NBXBNGE9jkpIv2Pbi/yrTTLg1EyyRE
	qT3wCazxxM4r5z4sdxvxbhpVkFH9SnJ0xsB2hv31p4+4SHDtB297NgXiYMc+a+F68yLO
	k5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7BeKQoe62SiQ10OoOpaSnBPahk/muQpOp/Ts6TuGeW0=;
	b=uh6flhs6JeRjH6v4BNyOwoIj17e1GsWnLSC6edsFFigCPW89XzVez1/v4t4KpLmMlk
	BfswcU8+dDjWQLeQXDj51WoocPaAI63AGgLjluU9DV+MRzUOP8+MxCIn46dIVeWno3t9
	eUQNz4UrHU1DmEG+pv/RyFIV4Uq8f778nCUqx4zElOflZEz8Mhyt/hMvWNYzIvlo3NpT
	RDCM8wnAeJVKxp7EROD2u2W5vOyobktnPC+Gl0KYVzx/A0EuHOwBlhH+Ka4RrtXs9b1Y
	PAypmQ1qLFsdkYrKZQNcJsW7E+itrrIHpOEdBdErew9d0tElQKXmtmyHTpcuDbBuSrR7
	CuRQ==
X-Gm-Message-State: APzg51B96BSR10k3MlvBLKJfM+/7ZRN6Qa9X+GyI7RkwZ9pV6TNrqe3Q
	OXCq+REn0lay2wv35rsIBM+YSmj+inM=
X-Google-Smtp-Source: ANB0VdZex6rJxlPZJUiBQ7alktaOB3AlDx5Y//0vnKzm0aaHm63bs8T3XO57ZjfFNLGMPSPY+U7Slw==
X-Received: by 2002:aca:d44a:: with SMTP id
	l71-v6mr3608050oig.199.1534936785058; 
	Wed, 22 Aug 2018 04:19:45 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.19.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:19:44 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:48:12 +0530
Message-Id: <1534936692-11736-34-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 34/34] libgcrypt: CVE-2018-0495
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
X-List-Received-Date: Wed, 22 Aug 2018 11:19:44 -0000

ecc: Add blinding for ECDSA.

* cipher/ecc-ecdsa.c (_gcry_ecc_ecdsa_sign): Blind secret D with
randomized nonce B.

--

CVE-id: CVE-2018-0495

Affects libgcrypt < 1.7.10 and libgcrypt < 1.8.3

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../libgcrypt/files/CVE-2018-0495.patch            | 76 ++++++++++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb  |  1 +
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
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb
index 02982f0..3d189f5 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
            file://0005-ecc-Add-input-validation-for-X25519.patch \
            file://0006-Fix-building-AArch32-CE-implementations-when-target-.patch \
+           file://CVE-2018-0495.patch \
 "
 SRC_URI[md5sum] = "110ce4352f9ea6f560bdc6c5644ae93c"
 SRC_URI[sha256sum] = "f6e470b7f2d3a703e8747f05a8c19d9e10e26ebf2d5f3d71ff75a40f504e12ee"
-- 
2.7.4


