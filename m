Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9A6BB7ECB9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2019 17:01:10 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id i4so14203888qtj.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2019 10:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=f6mfC6vaAfbuJrOfJkT+Fa7cWGmySfnvXe3+aCPDLV8=;
	b=eOmw4ZSnKfZudG5dRE0Z2T6Lf7uZvOFeuDI/06YdiruQCNStcohuUVSpElZjuZkeDG
	NDBPkKOt4ITzd1bxguKIxmMsJGeTmxx13x3I0yPSeSTgvhNXwLIUO+DtxzL3g84PJzuf
	xcMsw2KnEvLvP06YJ2dFNHP5QRoqsTIkGI7lzlkK7fOwahA6XKsDqm3ENXkxSMHSqiaB
	+n8c2TunuupbTRpncRc5iwEw7xzPPynmasbtQzxu7qq9jBte7C5PuQCLQOnGjVs7aGxc
	2nGJoyvrCSgpNTOVf51LBpV9mMK2Wv81mPHX9C8b04A4wShlRKw6jmTO7NI1We/Ztc5p
	YcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=f6mfC6vaAfbuJrOfJkT+Fa7cWGmySfnvXe3+aCPDLV8=;
	b=jVljYPZ4d13jMQTlgmF7PCtizLwFXQco+F5yJ/hl05/F0WKXQA9oC8uH8EYZznhnaX
	xfgbZhTVfGD8X40oKvQustFPesioL+0/Md+KDUmCljm2uC1jKkZ2RE6bnwmXZnFNPRrX
	o+Kpjln+POqcJr6Dmkdl51YTMfNP3mA579e38sxeV10cPF+zK6EhYuMKztrv40oBfTKL
	3+4v5fejNM+h2G9HWtxdV+fM9aJqaDmUGUyR7OrKezIdoqU0UeQb720vGcY4M/oq7jIq
	ke0JwQ9d0TU/RSRHE7V9uHaVy07y254qID5jPHJ5HKNyMNHElUsBkGYbsq5F8MPdYfyu
	B/FQ==
X-Gm-Message-State: APjAAAUj1sw3d93N2F2z1ZpKlM6If2dtwjzNlG1CbdgHevT9iBhL+JNf
	5QhFaEShxx4svqTvoMbrPz+w5nOUCIGvwN9EZK8=
X-Google-Smtp-Source: APXvYqznS/8pCtP/jsnNk9lzkUJNcqV+fD/onIQxyGAiOu9vjOa1Vt6+EaxxOkspr1ueC9V3NNf4WpjZ3Y4ueO1Lcuw=
X-Received: by 2002:a0c:e485:: with SMTP id n5mr8926035qvl.175.1566666071274; 
	Sat, 24 Aug 2019 10:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
	<1566593504-21918-9-git-send-email-armccurdy@gmail.com>
In-Reply-To: <1566593504-21918-9-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Aug 2019 10:00:45 -0700
Message-ID: <CAMKF1sqvdfRaA-iTEtNzS9NFXybcP_zzvP4nyt+x075Zp8G2Dg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/13] glibc: drop obsolete packaging of glibc libnsl libs
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
X-List-Received-Date: Sat, 24 Aug 2019 17:01:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2019 at 1:53 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> Packaging rules were left behind when libnsl was removed:
>
>   https://git.openembedded.org/openembedded-core/commit/?id=3D9dc9983901c=
ec364ea57a72b9da1a0396b60663a
>

this was due to other versions of glibc using the same header file in
other toolchain layers e.g.
IIRC meta-linaro, but it might not be needed however double check please

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-cor=
e/glibc/glibc-package.inc
> index f796876..a0df267 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -14,7 +14,7 @@ RPROVIDES_glibc-extra-nss =3D "eglibc-extra-nss"
>  RPROVIDES_glibc-thread-db =3D "eglibc-thread-db"
>  RPROVIDES_${PN}-pcprofile =3D "eglibc-pcprofile"
>  RPROVIDES_${PN}-dbg =3D "eglibc-dbg"
> -libc_baselibs =3D "${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${b=
ase_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/libmvec-*.so=
 ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.=
so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_l=
ibdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so =
${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/lib=
nsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${ba=
se_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libd=
ir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libns=
s_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libd=
ir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*=
.so.* ${base_libdir}/libBrokenLocale-*.so"
> +libc_baselibs =3D "${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${b=
ase_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/libmvec-*.so=
 ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.=
so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_l=
ibdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so =
${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/lib=
nss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_comp=
at*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* =
${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/li=
bdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libd=
ir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
>  ARCH_DYNAMIC_LOADER =3D ""
>  # The aarch64 ABI says the dynamic linker -must- be
>  # /lib/ld-linux-aarch64{,_be}.so.1. With usrmerge, that may mean that
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

