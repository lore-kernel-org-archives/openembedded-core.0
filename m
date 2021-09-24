Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.8930.1632492956596030654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ua14mLeS;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id e7so10018623pgk.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JUosWXrkoMJFLK72qdWxJcpuEt7uDvIXQpsxcMxa/xg=;
        b=ua14mLeSv8Q2WvsDpoSLUmvU/5BCw/KCO4lfqEwj99+Tg7ZnqLQqYZmXZnhiZt1nvD
         pPShXFmuq419iS/75g77Dr4lKgcrnd0gbcGYWnClVZl84DiRDnMzp+T6TIJXLjIyazP2
         ZDPi0x/v7LS5cyZpAU0R2rXR6m6EqzSi6cFUsrVC6gg4gHFzKbGksqEo5Axb3SZXwUXO
         hK6+adhh7GtC4hC99S2CqezvC6s8tfybjdkDQwtJAjo0on+YZ2ZjL/h3fiTCgy6+imVN
         SFd2DYKPG6ZchDg8yuiWSNzie0CvEne9EfZJQ/7ABUNP244feyyrgmPI6A2ksNZ/bZs8
         VcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JUosWXrkoMJFLK72qdWxJcpuEt7uDvIXQpsxcMxa/xg=;
        b=eFVB1CI3Q8RdVCuMZcVfkVPX8XKmJriMLQcf8CJ1UHFyEOX+mQyjGvLqhDNRCdrOfh
         xrdwPQGpvY529Uh0Alx2G9lDKm9BOfwstHvu5eJ0GeMvEVJD/CZ72HzBPWgNaJGDUEdb
         5tUxm1/wqTFGVd8mUuDOP1AJC0Wx0aywj5k93yGm3hWg6HpBf+3ioT49nvENonqEQn0G
         1mOsn3W7XCoGQ0gZvgk5O+2nbKEj8JfYLKcigi5dtQaaJhkwpO6xdyYzyxKgtZgMQrEk
         vxQkpdeCSVZ0dUxHAH4Z3FY6jDIYjFC5apNGH1Rdy9h4o9BhywIxYShA/lj5Y4ALOREC
         E0yQ==
X-Gm-Message-State: AOAM532Qm2wJ9+SJm6jo/YeA8xEtcDvEpTLPD+ZkB6dYRxay5A6iyNru
	VVFrkkbBZRW6zP5t2qVnMKCVKEERHT7PRqXy0ns=
X-Google-Smtp-Source: ABdhPJynSW54ZTBKDHGx2PUkgYD541GAHCvqgWP2rHnsdi9xy+PSKEGByU5NqDzDAMoSZQerf27ytA==
X-Received: by 2002:a05:6a00:43:b0:43d:f06e:4f4a with SMTP id i3-20020a056a00004300b0043df06e4f4amr9305251pfk.20.1632492955307;
        Fri, 24 Sep 2021 07:15:55 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.15.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:15:54 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/25] libgcrypt: Security fix CVE-2021-33560
Date: Fri, 24 Sep 2021 04:15:05 -1000
Message-Id: <3fc6a2421972e975f0d8ebe984420da6e589df14.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: https://sources.debian.org/patches/libgcrypt20/1.8.4-5+deb10u1
MR: 111591
Type: Security Fix
Disposition: Backport from https://sources.debian.org/data/main/libg/libgcrypt20/1.8.4-5%2Bdeb10u1/debian/patches/31_cipher-Fix-ElGamal-encryption-for-other-implementati.patch
ChangeID: d066a9baacc0d967dd80ac54c684cde031ac686e
Description:

Affects before 1.8.8 and 1.9.x before 1.9.3

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libgcrypt/files/CVE-2021-33560.patch      | 109 ++++++++++++++++++
 .../libgcrypt/libgcrypt_1.8.5.bb              |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2021-33560.patch

diff --git a/meta/recipes-support/libgcrypt/files/CVE-2021-33560.patch b/meta/recipes-support/libgcrypt/files/CVE-2021-33560.patch
new file mode 100644
index 0000000000..c0d00485e6
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/CVE-2021-33560.patch
@@ -0,0 +1,109 @@
+From 707c3c5c511ee70ad0e39ec613471f665305fbea Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Fri, 21 May 2021 11:15:07 +0900
+Subject: [PATCH] cipher: Fix ElGamal encryption for other implementations.
+
+* cipher/elgamal.c (gen_k): Remove support of smaller K.
+(do_encrypt): Never use smaller K.
+(sign): Folllow the change of gen_k.
+
+--
+
+Cherry-pick master commit of:
+	632d80ef30e13de6926d503aa697f92b5dbfbc5e
+
+This change basically reverts encryption changes in two commits:
+
+	74386120dad6b3da62db37f7044267c8ef34689b
+	78531373a342aeb847950f404343a05e36022065
+
+Use of smaller K for ephemeral key in ElGamal encryption is only good,
+when we can guarantee that recipient's key is generated by our
+implementation (or compatible).
+
+For detail, please see:
+
+    Luca De Feo, Bertram Poettering, Alessandro Sorniotti,
+    "On the (in)security of ElGamal in OpenPGP";
+    in the proceedings of  CCS'2021.
+
+CVE-id: CVE-2021-33560
+GnuPG-bug-id: 5328
+Suggested-by: Luca De Feo, Bertram Poettering, Alessandro Sorniotti
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+Upstream-Status: Backport
+CVE: CVE-2021-33560
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+---
+ cipher/elgamal.c | 24 ++++++------------------
+ 1 file changed, 6 insertions(+), 18 deletions(-)
+
+diff --git a/cipher/elgamal.c b/cipher/elgamal.c
+index 4eb52d62..ae7a631e 100644
+--- a/cipher/elgamal.c
++++ b/cipher/elgamal.c
+@@ -66,7 +66,7 @@ static const char *elg_names[] =
+ 
+ 
+ static int test_keys (ELG_secret_key *sk, unsigned int nbits, int nodie);
+-static gcry_mpi_t gen_k (gcry_mpi_t p, int small_k);
++static gcry_mpi_t gen_k (gcry_mpi_t p);
+ static gcry_err_code_t generate (ELG_secret_key *sk, unsigned nbits,
+                                  gcry_mpi_t **factors);
+ static int  check_secret_key (ELG_secret_key *sk);
+@@ -189,11 +189,10 @@ test_keys ( ELG_secret_key *sk, unsigned int nbits, int nodie )
+ 
+ /****************
+  * Generate a random secret exponent k from prime p, so that k is
+- * relatively prime to p-1.  With SMALL_K set, k will be selected for
+- * better encryption performance - this must never be used signing!
++ * relatively prime to p-1.
+  */
+ static gcry_mpi_t
+-gen_k( gcry_mpi_t p, int small_k )
++gen_k( gcry_mpi_t p )
+ {
+   gcry_mpi_t k = mpi_alloc_secure( 0 );
+   gcry_mpi_t temp = mpi_alloc( mpi_get_nlimbs(p) );
+@@ -202,18 +201,7 @@ gen_k( gcry_mpi_t p, int small_k )
+   unsigned int nbits, nbytes;
+   char *rndbuf = NULL;
+ 
+-  if (small_k)
+-    {
+-      /* Using a k much lesser than p is sufficient for encryption and
+-       * it greatly improves the encryption performance.  We use
+-       * Wiener's table and add a large safety margin. */
+-      nbits = wiener_map( orig_nbits ) * 3 / 2;
+-      if( nbits >= orig_nbits )
+-        BUG();
+-    }
+-  else
+-    nbits = orig_nbits;
+-
++  nbits = orig_nbits;
+ 
+   nbytes = (nbits+7)/8;
+   if( DBG_CIPHER )
+@@ -492,7 +480,7 @@ do_encrypt(gcry_mpi_t a, gcry_mpi_t b, gcry_mpi_t input, ELG_public_key *pkey )
+    * error code.
+    */
+ 
+-  k = gen_k( pkey->p, 1 );
++  k = gen_k( pkey->p );
+   mpi_powm (a, pkey->g, k, pkey->p);
+ 
+   /* b = (y^k * input) mod p
+@@ -594,7 +582,7 @@ sign(gcry_mpi_t a, gcry_mpi_t b, gcry_mpi_t input, ELG_secret_key *skey )
+     *
+     */
+     mpi_sub_ui(p_1, p_1, 1);
+-    k = gen_k( skey->p, 0 /* no small K ! */ );
++    k = gen_k( skey->p );
+     mpi_powm( a, skey->g, k, skey->p );
+     mpi_mul(t, skey->x, a );
+     mpi_subm(t, input, t, p_1 );
+-- 
+2.30.2
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
index 16a58ad9b8..174b087b24 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
@@ -28,6 +28,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0002-AES-move-look-up-tables-to-.data-section-and-unshare.patch \
            file://0003-GCM-move-look-up-table-to-.data-section-and-unshare-.patch \
            file://determinism.patch \
+           file://CVE-2021-33560.patch \
 "
 SRC_URI[md5sum] = "348cc4601ca34307fc6cd6c945467743"
 SRC_URI[sha256sum] = "3b4a2a94cb637eff5bdebbcaf46f4d95c4f25206f459809339cdada0eb577ac3"
-- 
2.25.1

