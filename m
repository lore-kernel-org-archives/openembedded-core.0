Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id D7BFF77143
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 05:39:54 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id f81so43757764iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 21:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=t7sDTFHUbOgZDTGc6jWfo50aJCeCesV1FHLaFEk5NVI=;
	b=NK9c4gmXNEMUUW4JCr6IrgtRGC8xZrCfeek7fqKV04u4LBoNk2+s5CVGxkoyNS9new
	UPI4j0z0/sR7d6KPINd63uI4n6bBo0bUw2W8QIJf+gekz5tD4T0lFYcjYbiq9rd29/gk
	dRWg8tA426A0CVOhgrDBAmlrrX0hRtGnehtugNDI+ddZ/KPKAzobJIgvqmu/Iz31Wum4
	SGlsgbcXalpd4okOxRG+1NWklgQb+AxuUMX25qEqctaMqwDBB+L+2Gps7t9Nyyk9biWW
	xt/PSS5T/3hGMvH/11Q2hEryp2GHAIyjIQIcNHX/klfgXBvXgAu30VVMq48aA+sU1pYt
	9pMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=t7sDTFHUbOgZDTGc6jWfo50aJCeCesV1FHLaFEk5NVI=;
	b=USMoWlRczav+zhNgHM62olMbdQ9uRCF/exaWmmZ1IHzOEcqZYJoEPlU1AICaROtXeg
	qiFrq3jhynWhRP8YDGkZCOIbQ9WR8NCcmBaGvOlZfUIUVGihKaoP+3nsMTlt6RNQPS9p
	ei9eoeyj2dWtTnO5lUVMiwvz8yx/EpN41s0cE5e/5CjYF+XjBvZYOansSYQ9YCEGIZVt
	WRrv8PUPHh77f8XCtNG9qvNpyWgNCiXxlESBeGBsfZz1bNgnvaIDPTa9y4p2420uOOEa
	3Hnzl6mjUKvXf2P+SGUPc4/fCsT9Ht9aw0psTpkIRdOwkSBhGQGmcm6fHiEGgF+24+A5
	pAaw==
X-Gm-Message-State: AG10YOS8fAqo+p5/g9vuf8eajwhjITTEyUDcx7otJQV2Na/a5E6NPocyRymkItFmMpLTRSOJchV1yfm6yJFyfA==
X-Received: by 10.107.9.211 with SMTP id 80mr1629635ioj.112.1454477995014;
	Tue, 02 Feb 2016 21:39:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Tue, 2 Feb 2016 21:39:25 -0800 (PST)
In-Reply-To: <1454451153-19783-2-git-send-email-armccurdy@gmail.com>
References: <1454451153-19783-1-git-send-email-armccurdy@gmail.com>
	<1454451153-19783-2-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Feb 2016 21:39:25 -0800
Message-ID: <CAMKF1sr3iaHr76YyuvxCwia5TxJQeiEh3ts-nkcHnho_n-mbTg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] gnutls.inc: minor formatting improvements
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
X-List-Received-Date: Wed, 03 Feb 2016 05:39:55 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 2, 2016 at 2:12 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Reordering, plus combine two LDFLAGS_append_libc-uclibc lines into one.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-support/gnutls/gnutls.inc | 41 +++++++++++++++++-----------------
>  1 file changed, 21 insertions(+), 20 deletions(-)
>
> diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
> index 90597db..f2d29eb 100644
> --- a/meta/recipes-support/gnutls/gnutls.inc
> +++ b/meta/recipes-support/gnutls/gnutls.inc
> @@ -1,8 +1,6 @@
>  SUMMARY = "GNU Transport Layer Security Library"
>  HOMEPAGE = "http://www.gnu.org/software/gnutls/"
>  BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
> -DEPENDS = "nettle libidn virtual/libiconv"
> -DEPENDS_append_libc-musl = " argp-standalone "

Thinking about it a bit more, we need to define a virtual for this
e.g. virtual/argp
which plugs to argp-standalone on musl and glibc on glibc based system and musl
we need something similar for fts as well. So recipes are then
insulated and we can avoid these overrides.

>
>  LICENSE = "GPLv3+ & LGPLv2.1+"
>  LICENSE_${PN} = "LGPLv2.1+"
> @@ -13,24 +11,33 @@ LICENSE_${PN}-openssl = "GPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>                      file://COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
>
> +DEPENDS = "nettle libidn virtual/libiconv"
> +DEPENDS_append_libc-musl = " argp-standalone"
>
> -SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
> +SHRT_VER = "${@d.getVar('PV', True).split('.')[0]}.${@d.getVar('PV', True).split('.')[1]}"
>
>  SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz"
>
>  inherit autotools texinfo binconfig pkgconfig gettext lib_package
>
> -EXTRA_OECONF="--disable-rpath \
> -              --with-included-libtasn1 \
> -              --enable-local-libopts \
> -              --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
> -              --disable-guile \
> -              --disable-crywrap \
> -              --without-p11-kit \
> -              --enable-openssl-compatibility \
> -              "
> -LDFLAGS_append_libc-musl = " -largp "
> -LDFLAGS_append_libc-uclibc = " -luargp "
> +PACKAGECONFIG ??= "zlib"
> +
> +PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
> +PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
> +
> +EXTRA_OECONF = " \
> +    --disable-crywrap \
> +    --disable-guile \
> +    --disable-rpath \
> +    --enable-local-libopts \
> +    --enable-openssl-compatibility \
> +    --with-included-libtasn1 \
> +    --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
> +    --without-p11-kit \
> +"
> +
> +LDFLAGS_append_libc-musl = " -largp"
> +LDFLAGS_append_libc-uclibc = " -luargp -pthread"
>
>  do_configure_prepend() {
>         for dir in . lib; do
> @@ -38,16 +45,10 @@ do_configure_prepend() {
>         done
>  }
>
> -PACKAGECONFIG ??= "zlib"
> -PACKAGECONFIG[tpm] = "--with-tpm, --without-tpm, trousers"
> -PACKAGECONFIG[zlib] = "--with-zlib, --without-zlib, zlib"
> -
>  PACKAGES =+ "${PN}-openssl ${PN}-xx"
>
>  FILES_${PN}-dev += "${bindir}/gnutls-cli-debug"
>  FILES_${PN}-openssl = "${libdir}/libgnutls-openssl.so.*"
>  FILES_${PN}-xx = "${libdir}/libgnutlsxx.so.*"
>
> -LDFLAGS_append_libc-uclibc += " -pthread"
> -
>  BBCLASSEXTEND = "native nativesdk"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

