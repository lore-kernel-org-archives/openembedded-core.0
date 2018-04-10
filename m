Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3F55F74897
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 21:20:57 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id b127so61950wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 14:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BrcwgtQDDTxoTJrMJyqR6/M+VuSECgtGiXckHCHfJ8g=;
	b=ccnVh857CQsfk58udO96DuWLfC4llhHUROZRjcFDEWE6scOTnUDruu/2uSTHSjO9TK
	YRhZw3Lf5KvlgoKsdjVWfSFGKOVxohGOftTklLNfQN4vC/G2f4ez/hO3DocaLvfpsnHx
	TcNB9F6wcqwgnQOzdvEFzOtvm5pyRhaHGbCsKWNCqdaawB7gxrrJ0v5Q+wSn5tvS4lFV
	F8PLNdfgKVUsd+J40nYh0ZRplttCqgcS20yukE4Bs6C7RAeaS4pU1r+kGdJLz67Jc/Cz
	peO+tc1biX/JYco8/FvekMkwELgRIHdE2wmx8uOcR9ScIdN/db+5NNbBVuY1571tJTSm
	Irvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BrcwgtQDDTxoTJrMJyqR6/M+VuSECgtGiXckHCHfJ8g=;
	b=fRUrPvZzlDU8Jdbe5M/zdJc9tBghhKoem03Y1E72Kb6sQ58chYvsABvSBpyQFORIXN
	GjA+vhyRlZvnd76Jteka7b5LHDKNku75yrj3AWYsCzZcu1Bc726VU1H7aWhF1DGBrRQI
	SzBOuR3NhcCdAlvT6zSWBN8u9uwtbrUXLG/v6g6pAnYfsOXodwqnKr06t9d/okgtMpoM
	I5jP/lMwoaNDqH0rr3FcMvR0eQvHAZjl2CKr0xPtIy4p1QuJ2W20ZN6a0dxu57G+qvIX
	MYqTHvrvLqlkFwwVmqpZlPVD6hTIkuJ1j2ZosAoQ3Wnd+Hdsk+lP2S08eAy5726hwjIZ
	niaQ==
X-Gm-Message-State: ALQs6tA2iczsaNVWDzuo7aVlXDxoxrIt/lpXVfILPGUo/uB+jLA5YhUu
	d15F0QL+kT0sDy4iahL89vZnGb4B1eR4xHFGV7QvKg==
X-Google-Smtp-Source: AIpwx49oJ/eG7ktCPAh2/oX8FSzfi1ET2VLMTFfsejX85U1etG7VdFaI3kvKOEFhirZ9q5fqWepc0aQ4nsUdpSdXyek=
X-Received: by 10.28.170.205 with SMTP id t196mr744876wme.42.1523395258463;
	Tue, 10 Apr 2018 14:20:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Tue, 10 Apr 2018 14:20:57 -0700 (PDT)
In-Reply-To: <20180410120747.41814-3-alexander.kanavin@linux.intel.com>
References: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
	<20180410120747.41814-3-alexander.kanavin@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 10 Apr 2018 14:20:57 -0700
Message-ID: <CAJ86T=X4cBT=RpXzvyuoOiFVX-fj_8tXO8y6JnAa08R_CBkKeA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 3/5] openssl: update to 1.1.1
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
X-List-Received-Date: Tue, 10 Apr 2018 21:20:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 10, 2018 at 5:07 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> At the moment 1.1.1 is in pre-release stage, however the final release
> should be available within a few weeks. The major selling point is that
> it supports the new TLS 1.3 specification. At the moment it is not clear
> whether this also will be a long term support version of openssl;
> we can make the decision to merge this version once that is made clear
> by upstream. More information:
>
> https://www.openssl.org/policies/releasestrat.html
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  ...1-Take-linking-flags-from-LDFLAGS-env-var.patch | 43 ----------------------
>  .../{openssl_1.1.0h.bb => openssl_1.1.1-pre4.bb}   | 21 +++++------
>  2 files changed, 10 insertions(+), 54 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
>  rename meta/recipes-connectivity/openssl/{openssl_1.1.0h.bb => openssl_1.1.1-pre4.bb} (83%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre4.bb
> similarity index 83%
> rename from meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
> rename to meta/recipes-connectivity/openssl/openssl_1.1.1-pre4.bb
> index 94b75eb92a8..859362f7afe 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre4.bb
> @@ -10,13 +10,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d57d511030c9d66ef5f5966bee5a7eff"
>
>  BBCLASSEXTEND = "native nativesdk"
>
> -SRC_URI[md5sum] = "5271477e4d93f4ea032b665ef095ff24"
> -SRC_URI[sha256sum] = "5835626cde9e99656585fc7aaa2302a73a7e1340bf8c14fd635a62c66802a517"
> +SRC_URI[md5sum] = "07c3f6831fb6dfe975795ef7bbbee9fc"
> +SRC_URI[sha256sum] = "df2d5fcc2a878525611c75b9e9116fbcfbce8d9b96419a16eda5fb11ecc428f6"
>
>  SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://run-ptest \
>             file://openssl-c_rehash.sh \
> -           file://0001-Take-linking-flags-from-LDFLAGS-env-var.patch \
>             "
>
>  S = "${WORKDIR}/openssl-${PV}"
> @@ -114,20 +113,20 @@ do_configure () {
>          if [ "x$useprefix" = "x" ]; then
>                  useprefix=/
>          fi
> -       libdirleaf="$(echo ${libdir} | sed s:$useprefix::)"
> -       perl ./Configure ${EXTRA_OECONF} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdirleaf} $target
> +        # WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
> +        # environment variables set by bitbake. Adjust the environment variables instead.
> +       perl ./Configure ${EXTRA_OECONF} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
>  }
>
> -#| engines/afalg/e_afalg.c: In function 'eventfd':
> -#| engines/afalg/e_afalg.c:110:20: error: '__NR_eventfd' undeclared (first use in this function)
> -#|      return syscall(__NR_eventfd, n);
> -#|                     ^~~~~~~~~~~~
> -EXTRA_OECONF_aarch64 += "no-afalgeng"
> +# This prevents openssl from using getrandom() which is not available on older glibc versions
> +# (native versions can be built with newer glibc, but then relocated onto a system with older glibc)
> +EXTRA_OECONF_class-native += "--with-rand-seed=devrandom"
> +EXTRA_OECONF_class-nativesdk += "--with-rand-seed=devrandom"

Better to avoid += with an over-ride since it doesn't do what most new
users etc expect. Better to use _append instead (or just the over-ride
on it's own, if over-riding the original value is what you intended to
do).

>  #| ./libcrypto.so: undefined reference to `getcontext'
>  #| ./libcrypto.so: undefined reference to `setcontext'
>  #| ./libcrypto.so: undefined reference to `makecontext'
> -EXTRA_OECONF_libc-musl += "-DOPENSSL_NO_ASYNC"
> +CPPFLAGS_libc-musl += "-DOPENSSL_NO_ASYNC"

Same comment here.

>  do_install () {
>          oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
> --

