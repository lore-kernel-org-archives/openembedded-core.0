Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3A73E78699
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 00:16:03 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r68so22200665wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 16:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r1HU9JkvSb/5DjvJTnj6/mq5cVWG/YiACjy++g+WXQY=;
	b=OmC3W/g+zDeNkisNYc27/eiO8zvsZe/4wbRHllvNWjm50MpoXRBVJ8goEIKrv11ZPy
	N2Da8i8xosaXxXfrKVRtvO30dNFN4QT/dHOD/LxhTkynRp9Yv6rJb+3xf0SuP8PXHNxf
	Khj65/jZLm8b2+S3Y+zUN2IzW0UB1s0oVJU7mhfBYkN0hTri7xaye4GLCmtsikXYlSg3
	wiEC1NbRJSa/qinj2N9acewp3tGjA00jX2sAQVbQEJJBodDmo5DF42NCbEhO3JNDQxbY
	KNY3H5n4q3YTeuC2LNlJ31ZJm2337jf2VDk75cQMHVS4KSY9+dZEeX2/Rhs95e13DtPr
	K6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r1HU9JkvSb/5DjvJTnj6/mq5cVWG/YiACjy++g+WXQY=;
	b=bRA2wnR5pyDXJlRsLo5Ur99EFeviuAhu8oc2GXzwOykHOJ6XBA631+MXFGzAgsRk75
	5OI7ND9BwKiTrdeClTSh0e2gb71lHHtQPOD2rBCJHX1zQke7j8hoWDRW/EJgfu+lKYnQ
	GHXjECCMFCdZ7ZFzpnt0FXTZKb4rGOPDSnfq7Zr7R74wEZzGRhCuuoQyyiOmRW8J9EUQ
	S8sOOmMkELNGGF64Ny3ZFyfu0i5J2MgeDH/s+tzWLPzjM7EkucztGIDpbnyA5CMRhIhs
	0XJpffjzEbnDEFpLfswrplL9t0Wy4doCP2eUoqHpMmGAMuZSzb8ymgHoK6kqRB5aVycK
	jkLA==
X-Gm-Message-State: AJaThX4UCYHWkBOK8vBs4bDC035Smwsq0F0a8kwNwjWSOlQFOAbQdSNw
	updZV5Gtt1yRDjNfKdT194w5Rr7Cq/pbOpMQTzg=
X-Google-Smtp-Source: AGs4zMaKYs8xDcU17/CqV5fPfjEimTdV5LBvuAbEVNrsJf3wj1/O7d3+67wUoidhOlxcRjC1hkzI7zP4Kg2nRMNhxmI=
X-Received: by 10.28.156.67 with SMTP id f64mr10943106wme.42.1511223364919;
	Mon, 20 Nov 2017 16:16:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Mon, 20 Nov 2017 16:16:04 -0800 (PST)
In-Reply-To: <cb6bd21a2334aaad2f19df7dc433d629313bb146.1511222485.git.akuster@mvista.com>
References: <cover.1511222485.git.akuster@mvista.com>
	<cb6bd21a2334aaad2f19df7dc433d629313bb146.1511222485.git.akuster@mvista.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 20 Nov 2017 16:16:04 -0800
Message-ID: <CAJ86T=V1J9zsASYonv0SX8HMsu+nMBcnBJc=6CqRcW9nft2awQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: akuster <akuster@mvista.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] gnutls: update to 3.6.1
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
X-List-Received-Date: Tue, 21 Nov 2017 00:16:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 20, 2017 at 4:07 PM, Armin Kuster <akuster808@gmail.com> wrote:
> zlib configure.ac support removed in  3.6.1
> drop patch

If the patch is now unused, can it be deleted?

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-support/gnutls/gnutls.inc                            | 3 +--
>  meta/recipes-support/gnutls/{gnutls_3.5.16.bb => gnutls_3.6.1.bb} | 5 ++---
>  2 files changed, 3 insertions(+), 5 deletions(-)
>  rename meta/recipes-support/gnutls/{gnutls_3.5.16.bb => gnutls_3.6.1.bb} (45%)
>
> diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
> index 29b5dd6..7bcb913 100644
> --- a/meta/recipes-support/gnutls/gnutls.inc
> +++ b/meta/recipes-support/gnutls/gnutls.inc
> @@ -21,7 +21,7 @@ SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz"
>
>  inherit autotools texinfo binconfig pkgconfig gettext lib_package gtk-doc
>
> -PACKAGECONFIG ??= "libidn zlib"
> +PACKAGECONFIG ??= "libidn"
>
>  # You must also have CONFIG_SECCOMP enabled in the kernel for
>  # seccomp to work.
> @@ -32,7 +32,6 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn"
>  PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
>  PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
>  PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
> -PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
>
>  EXTRA_OECONF = " \
>      --enable-doc \
> diff --git a/meta/recipes-support/gnutls/gnutls_3.5.16.bb b/meta/recipes-support/gnutls/gnutls_3.6.1.bb
> similarity index 45%
> rename from meta/recipes-support/gnutls/gnutls_3.5.16.bb
> rename to meta/recipes-support/gnutls/gnutls_3.6.1.bb
> index 635c519..7624a20 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.5.16.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.6.1.bb
> @@ -1,10 +1,9 @@
>  require gnutls.inc
>
>  SRC_URI += "file://0001-configure.ac-fix-sed-command.patch \
> -            file://use-pkg-config-to-locate-zlib.patch \
>              file://arm_eabi.patch \
>             "
> -SRC_URI[md5sum] = "4c39612f1ec3ef7ed79cfb8936fa8143"
> -SRC_URI[sha256sum] = "0924dec90c37c05f49fec966eba3672dab4d336d879e5c06e06e13325cbfec25"
> +SRC_URI[md5sum] = "4b65ae3ffef59f3eeed51a6166ff12b3"
> +SRC_URI[sha256sum] = "20b10d2c9994bc032824314714d0e84c0f19bdb3d715d8ed55beb7364a8ebaed"
>
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

