Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8C11F6C226
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Oct 2019 15:09:21 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id s17so4308529plp.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Oct 2019 08:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=va0ilPfQNifB8Uw+xhh2N3KqNrZXBMoLwUpGJkOcN/c=;
	b=VDsRDURXG/1XGaOOXz0IKJY7fjwZ4Dz9VZkDQquEMDmBkzG53DYpZ8FeyPPLQ5B49n
	J8gYR6HmeP6+RREjMcNtDyJiCA0wyvCOpKP2Y8lmkXtv/VaIFpbZBZlLg553bl0U6dWN
	fFU8smcP2epl+qEtsCSFVTuYbuuwP2/fjUX4ikXFJ73HqwV5UmUlWF62KTLrI5JxGRit
	QxJ7/I/y4/sIqisE5wZVADqhrdd32bNnIkHiJxuBE/NPpmN5TNK6zhNUSHTOoFS4gu2H
	XW3Hu0ILLxmMLJ+LQ/3deUw9mB45j0nzQsLz+GXZXqbf9WWAts3aMr+CktgM0Nm4HsXV
	gBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=va0ilPfQNifB8Uw+xhh2N3KqNrZXBMoLwUpGJkOcN/c=;
	b=IOQFAI46gDsL9J9Wp4VIGW2UfXKUUkqLKhIzxKwQJfJlwbxma+6bpvNzLRBH1Kr4FR
	Ug70UhrhZTMgYydWXBvYgFBSnG4P0Nd47kGbTXCpOEA2VSFUQ5bNR6Q7E/S2yIzo4t/U
	PnTtToYwDsby3TRa9WYKoAjU6Gi1/N6/93T4KoGb9Bslqty4nDRbE32EH8+J0suj43jm
	WFb4mnxOicLQnsNzTsQOKo5Olvr/PdZo3ZFEsIQboNbBnxxI9wIhNdeYTrKDe3bToS3i
	QUdCjxV/F9bgCpvgdCeqTxgonl2AhnWszPgOtFRfmwaUFt7d49BdVZk7nBY1nkREho/C
	ghqw==
X-Gm-Message-State: APjAAAUMBGAXaVaTudBUI6zodkRP6waT2la0nQ6LK7BMam6T2g3MubJ3
	G5qO0Yhky4eJ5gQL4JijQQIQ+YrS
X-Google-Smtp-Source: APXvYqzZFHhjMxcEfuXatanmeFumv4keRVAIBjruO2iQj8Ua2OmD0BA81cYrHQN+4fOVQGSFt8bYxg==
X-Received: by 2002:a17:902:a584:: with SMTP id
	az4mr15071314plb.74.1571497762120; 
	Sat, 19 Oct 2019 08:09:22 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:d127:ede6:77ca:f77d?
	([2601:202:4180:a5c0:d127:ede6:77ca:f77d])
	by smtp.gmail.com with ESMTPSA id
	16sm10354353pfi.55.2019.10.19.08.09.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Oct 2019 08:09:21 -0700 (PDT)
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20191018193216.126648-1-trevor.gamblin@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <26adba14-b2ae-937a-9ae4-cbbf18757f60@gmail.com>
Date: Sat, 19 Oct 2019 08:09:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018193216.126648-1-trevor.gamblin@windriver.com>
Subject: Re: [zeus][PATCH] libgcrypt: fix CVE-2019-13627
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
X-List-Received-Date: Sat, 19 Oct 2019 15:09:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 10/18/19 12:32 PM, Trevor Gamblin wrote:
> Note that there are two patch files added for this fix.
Queued up while we sort out the maintainer.

https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/zeus-nmut


>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  ...cdsa-Fix-use-of-nonce-use-larger-one.patch | 126 ++++++++++++++++++
>  ...Add-mitigation-against-timing-attack.patch |  68 ++++++++++
>  .../libgcrypt/libgcrypt_1.8.4.bb              |   2 +
>  3 files changed, 196 insertions(+)
>  create mode 100644 meta/recipes-support/libgcrypt/files/0001-dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch
>  create mode 100644 meta/recipes-support/libgcrypt/files/0001-ecc-Add-mitigation-against-timing-attack.patch
>
> diff --git a/meta/recipes-support/libgcrypt/files/0001-dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch b/meta/recipes-support/libgcrypt/files/0001-dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch
> new file mode 100644
> index 0000000000..fdc3873ba1
> --- /dev/null
> +++ b/meta/recipes-support/libgcrypt/files/0001-dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch
> @@ -0,0 +1,126 @@
> +From 7c2943309d14407b51c8166c4dcecb56a3628567 Mon Sep 17 00:00:00 2001
> +From: NIIBE Yutaka <gniibe@fsij.org>
> +Date: Thu, 8 Aug 2019 17:42:02 +0900
> +Subject: [PATCH] dsa,ecdsa: Fix use of nonce, use larger one.
> +
> +* cipher/dsa-common.c (_gcry_dsa_modify_k): New.
> +* cipher/pubkey-internal.h (_gcry_dsa_modify_k): New.
> +* cipher/dsa.c (sign): Use _gcry_dsa_modify_k.
> +* cipher/ecc-ecdsa.c (_gcry_ecc_ecdsa_sign): Likewise.
> +* cipher/ecc-gost.c (_gcry_ecc_gost_sign): Likewise.
> +
> +CVE-id: CVE-2019-13627
> +GnuPG-bug-id: 4626
> +Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
> +---
> + cipher/dsa-common.c      | 24 ++++++++++++++++++++++++
> + cipher/dsa.c             |  2 ++
> + cipher/ecc-ecdsa.c       | 10 +---------
> + cipher/ecc-gost.c        |  2 ++
> + cipher/pubkey-internal.h |  1 +
> + 5 files changed, 30 insertions(+), 9 deletions(-)
> +
> +Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=7c2943309d1]
> +This backport is one of two upstream patches addressing CVE-2019-13627. 
> +
> +CVE: CVE-2019-13627
> +
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> +
> +diff --git a/cipher/dsa-common.c b/cipher/dsa-common.c
> +index 8c0a6843..fe49248d 100644
> +--- a/cipher/dsa-common.c
> ++++ b/cipher/dsa-common.c
> +@@ -29,6 +29,30 @@
> + #include "pubkey-internal.h"
> + 
> + 
> ++/*
> ++ * Modify K, so that computation time difference can be small,
> ++ * by making K large enough.
> ++ *
> ++ * Originally, (EC)DSA computation requires k where 0 < k < q.  Here,
> ++ * we add q (the order), to keep k in a range: q < k < 2*q (or,
> ++ * addming more q, to keep k in a range: 2*q < k < 3*q), so that
> ++ * timing difference of the EC multiply (or exponentiation) operation
> ++ * can be small.  The result of (EC)DSA computation is same.
> ++ */
> ++void
> ++_gcry_dsa_modify_k (gcry_mpi_t k, gcry_mpi_t q, int qbits)
> ++{
> ++  gcry_mpi_t k1 = mpi_new (qbits+2);
> ++
> ++  mpi_resize (k, (qbits+2+BITS_PER_MPI_LIMB-1) / BITS_PER_MPI_LIMB);
> ++  k->nlimbs = k->alloced;
> ++  mpi_add (k, k, q);
> ++  mpi_add (k1, k, q);
> ++  mpi_set_cond (k, k1, !mpi_test_bit (k, qbits));
> ++
> ++  mpi_free (k1);
> ++}
> ++
> + /*
> +  * Generate a random secret exponent K less than Q.
> +  * Note that ECDSA uses this code also to generate D.
> +diff --git a/cipher/dsa.c b/cipher/dsa.c
> +index 22d8d782..24a53528 100644
> +--- a/cipher/dsa.c
> ++++ b/cipher/dsa.c
> +@@ -635,6 +635,8 @@ sign (gcry_mpi_t r, gcry_mpi_t s, gcry_mpi_t input, DSA_secret_key *skey,
> +       k = _gcry_dsa_gen_k (skey->q, GCRY_STRONG_RANDOM);
> +     }
> + 
> ++  _gcry_dsa_modify_k (k, skey->q, qbits);
> ++
> +   /* r = (a^k mod p) mod q */
> +   mpi_powm( r, skey->g, k, skey->p );
> +   mpi_fdiv_r( r, r, skey->q );
> +diff --git a/cipher/ecc-ecdsa.c b/cipher/ecc-ecdsa.c
> +index 84a1cf84..97966c3a 100644
> +--- a/cipher/ecc-ecdsa.c
> ++++ b/cipher/ecc-ecdsa.c
> +@@ -114,15 +114,7 @@ _gcry_ecc_ecdsa_sign (gcry_mpi_t input, ECC_secret_key *skey,
> +           else
> +             k = _gcry_dsa_gen_k (skey->E.n, GCRY_STRONG_RANDOM);
> + 
> +-          /* Originally, ECDSA computation requires k where 0 < k < n.
> +-           * Here, we add n (the order of curve), to keep k in a
> +-           * range: n < k < 2*n, or, addming more n, keep k in a range:
> +-           * 2*n < k < 3*n, so that timing difference of the EC
> +-           * multiply operation can be small.  The result is same.
> +-           */
> +-          mpi_add (k, k, skey->E.n);
> +-          if (!mpi_test_bit (k, qbits))
> +-            mpi_add (k, k, skey->E.n);
> ++          _gcry_dsa_modify_k (k, skey->E.n, qbits);
> + 
> +           _gcry_mpi_ec_mul_point (&I, k, &skey->E.G, ctx);
> +           if (_gcry_mpi_ec_get_affine (x, NULL, &I, ctx))
> +diff --git a/cipher/ecc-gost.c b/cipher/ecc-gost.c
> +index a34fa084..0362a6c7 100644
> +--- a/cipher/ecc-gost.c
> ++++ b/cipher/ecc-gost.c
> +@@ -94,6 +94,8 @@ _gcry_ecc_gost_sign (gcry_mpi_t input, ECC_secret_key *skey,
> +           mpi_free (k);
> +           k = _gcry_dsa_gen_k (skey->E.n, GCRY_STRONG_RANDOM);
> + 
> ++          _gcry_dsa_modify_k (k, skey->E.n, qbits);
> ++
> +           _gcry_mpi_ec_mul_point (&I, k, &skey->E.G, ctx);
> +           if (_gcry_mpi_ec_get_affine (x, NULL, &I, ctx))
> +             {
> +diff --git a/cipher/pubkey-internal.h b/cipher/pubkey-internal.h
> +index b8167c77..d31e26f3 100644
> +--- a/cipher/pubkey-internal.h
> ++++ b/cipher/pubkey-internal.h
> +@@ -84,6 +84,7 @@ _gcry_rsa_pss_verify (gcry_mpi_t value, gcry_mpi_t encoded,
> + 
> + 
> + /*-- dsa-common.c --*/
> ++void _gcry_dsa_modify_k (gcry_mpi_t k, gcry_mpi_t q, int qbits);
> + gcry_mpi_t _gcry_dsa_gen_k (gcry_mpi_t q, int security_level);
> + gpg_err_code_t _gcry_dsa_gen_rfc6979_k (gcry_mpi_t *r_k,
> +                                         gcry_mpi_t dsa_q, gcry_mpi_t dsa_x,
> +-- 
> +2.23.0
> +
> diff --git a/meta/recipes-support/libgcrypt/files/0001-ecc-Add-mitigation-against-timing-attack.patch b/meta/recipes-support/libgcrypt/files/0001-ecc-Add-mitigation-against-timing-attack.patch
> new file mode 100644
> index 0000000000..66402d6187
> --- /dev/null
> +++ b/meta/recipes-support/libgcrypt/files/0001-ecc-Add-mitigation-against-timing-attack.patch
> @@ -0,0 +1,68 @@
> +From b9577f7c89b4327edc09f2231bc8b31521102c79 Mon Sep 17 00:00:00 2001
> +From: NIIBE Yutaka <gniibe@fsij.org>
> +Date: Wed, 17 Jul 2019 12:44:50 +0900
> +Subject: [PATCH] ecc: Add mitigation against timing attack.
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +* cipher/ecc-ecdsa.c (_gcry_ecc_ecdsa_sign): Add the order N to K.
> +* mpi/ec.c (_gcry_mpi_ec_mul_point): Compute with NBITS of P or larger.
> +
> +CVE-id: CVE-2019-13627
> +GnuPG-bug-id: 4626
> +Co-authored-by: Ján Jančár <johny@neuromancer.sk>
> +Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
> +---
> + cipher/ecc-ecdsa.c | 10 ++++++++++
> + mpi/ec.c           |  6 +++++-
> + 2 files changed, 15 insertions(+), 1 deletion(-)
> +
> +Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=b9577f7c89b]
> +This backport is one of two upstream patches addressing CVE-2019-13627.
> +
> +CVE: CVE-2019-13627
> +
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> +
> +diff --git a/cipher/ecc-ecdsa.c b/cipher/ecc-ecdsa.c
> +index 140e8c09..84a1cf84 100644
> +--- a/cipher/ecc-ecdsa.c
> ++++ b/cipher/ecc-ecdsa.c
> +@@ -114,6 +114,16 @@ _gcry_ecc_ecdsa_sign (gcry_mpi_t input, ECC_secret_key *skey,
> +           else
> +             k = _gcry_dsa_gen_k (skey->E.n, GCRY_STRONG_RANDOM);
> + 
> ++          /* Originally, ECDSA computation requires k where 0 < k < n.
> ++           * Here, we add n (the order of curve), to keep k in a
> ++           * range: n < k < 2*n, or, addming more n, keep k in a range:
> ++           * 2*n < k < 3*n, so that timing difference of the EC
> ++           * multiply operation can be small.  The result is same.
> ++           */
> ++          mpi_add (k, k, skey->E.n);
> ++          if (!mpi_test_bit (k, qbits))
> ++            mpi_add (k, k, skey->E.n);
> ++
> +           _gcry_mpi_ec_mul_point (&I, k, &skey->E.G, ctx);
> +           if (_gcry_mpi_ec_get_affine (x, NULL, &I, ctx))
> +             {
> +diff --git a/mpi/ec.c b/mpi/ec.c
> +index 97afbfed..ed936d74 100644
> +--- a/mpi/ec.c
> ++++ b/mpi/ec.c
> +@@ -1509,7 +1509,11 @@ _gcry_mpi_ec_mul_point (mpi_point_t result,
> +       unsigned int nbits;
> +       int j;
> + 
> +-      nbits = mpi_get_nbits (scalar);
> ++      if (mpi_cmp (scalar, ctx->p) >= 0)
> ++        nbits = mpi_get_nbits (scalar);
> ++      else
> ++        nbits = mpi_get_nbits (ctx->p);
> ++
> +       if (ctx->model == MPI_EC_WEIERSTRASS)
> +         {
> +           mpi_set_ui (result->x, 1);
> +-- 
> +2.23.0
> +
> diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
> index fda68a2938..9d649e49a3 100644
> --- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
> +++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
> @@ -21,6 +21,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
>             file://0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch \
>             file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
>             file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
> +           file://0001-ecc-Add-mitigation-against-timing-attack.patch \
> +           file://0001-dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch \
>  "
>  SRC_URI[md5sum] = "fbfdaebbbc6d7e5fbbf6ffdb3e139573"
>  SRC_URI[sha256sum] = "f638143a0672628fde0cad745e9b14deb85dffb175709cacc1f4fe24b93f2227"


