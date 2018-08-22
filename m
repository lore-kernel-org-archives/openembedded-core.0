Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 48A3179466
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:10:18 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id c190-v6so3708383oig.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7BeKQoe62SiQ10OoOpaSnBPahk/muQpOp/Ts6TuGeW0=;
	b=WmD15oKNi4jvTIlbtSMyxRE9jXzcNGpB5vXNXcGbNLeg4fod2RIrPBJ0BOEEcFwgWk
	EkiFaynaIq4lzY1lGNVQb+K5uEcQEPWGn5uMP/f98WsyhO1CtHRlx2vXdTOLIrbiCJen
	vvT0rh6TS3fyipkVD4xvjOYFHhu8/1EbsXn7w6qC21fOMIW2qMu97c+0wqgTJkwR0XO9
	GVXZ8G6Rr/N57JZ+c+/TqnUynOaxkbjlT41bDIOFmNrciUWIw7S5DnxUxJ/n64nz8jhH
	tNzXG06aj9DbNl4lkUo7mT6bfVHVj/7d/pmOwhX1WZ3jlwt+wA2PxHiKKZbv9wky9E5Y
	W0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7BeKQoe62SiQ10OoOpaSnBPahk/muQpOp/Ts6TuGeW0=;
	b=pD5Fpx7ODNhdWFWXKfCy2PyYp3njt2Mcd9XJ7nVGEtvKHeCmH2CzLLqo3kfN1pJfBm
	UKgY7nmeJJgPvBFAmDMYcjVuy3HakF/uizCEJYOCY3ooN9YKsQnXEfZ1MYARA8WYCL4M
	Upoh/M4tMBomh6XcsxsSbbuknv76Agz14KMQ0NWnEP6raAgpPGS5DO67Zz0H86lqs3Nz
	fq28JG4dH5xLWF21yGD4QLfv3F9/YgtCOAiizKaQo1tRKIIBDqhg9q7GjzuaTVd6qvbx
	CVGV+APSHOFkPQg2YTwYm93SDSEo/nqMrP+37bVnmHEhfZRlMrHikyvRnjPbDYkjD6+z
	9doA==
X-Gm-Message-State: APzg51AfBivQNyU6D5+kV72U6XShbyI/SsVKSoockUA8YNQS6Gcbed/2
	M6n6Rvgwuq0LUmAaQJ5tkqHJYbu8bXE=
X-Google-Smtp-Source: ANB0Vdb1kIazx1e2oHp8OdlqAqjhq9vadLXw3Wr3F3nPs2ZB7YZ4+V7BV8KixMyJsFvK2qJpOg94fg==
X-Received: by 2002:aca:e485:: with SMTP id
	b127-v6mr4565056oih.309.1534950619054; 
	Wed, 22 Aug 2018 08:10:19 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.10.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:10:18 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:52 +0530
Message-Id: <1534950532-23850-34-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 34/34] libgcrypt: CVE-2018-0495
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
X-List-Received-Date: Wed, 22 Aug 2018 15:10:18 -0000

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


