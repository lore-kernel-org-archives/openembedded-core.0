Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 49DD174553
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 18:01:53 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id u6-v6so3698338pls.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 11:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UrPXwKQpDlkZ3GxfDPYu2sDJwG5k0y3wLvCMvwiB4Q0=;
	b=Qx7bcQBOq71DvxAKhCJ0OpwjBKOnZQV5+9WEXjE6Z2kIzWUedgeYBSzLNyCxvYUYJ6
	0OqMSIOG2yY/gVHS/FKXd/JNcOV29ZyhBELXEplFJThVnMK44wOmYRULI5TLxJ47Iu8x
	gdwKsifOtQzNNRSNj+8XHAT1xTP9RGekHw05ClYdoLhgmBvut4cRTgtAijIxfcuDeZZQ
	7ScOWB5Q/lLb54KGsIYewNPuT6FsYsIHsKgfe0aLWxbRyFgpUaK7q0mjtUTfVi90q/mP
	x6/4wZNCXK494uvwgxALTU8zEaRybKLOgYxSreBNUfnGWIqdIZcH9cF8GNr+dLGVd7A6
	4YjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UrPXwKQpDlkZ3GxfDPYu2sDJwG5k0y3wLvCMvwiB4Q0=;
	b=H5JmjuaDgu3e6AGQ4Dvoh/z6xQ/6kZzQRyVUTCb/dGnn/YyEf3MI+FvERiv65TJWcQ
	n9J+7xb7NBNhCLvKoD5oTlR3QlElB6bEuEWSivBFAmXzm1JP/aHuNahnw6OiCi6tGwsI
	kmVlIFGPFNQkZPk3EWs1cJ+GjghqmMehjq4vDV5+nLFjIiV2v0pIn5ZlI26EpZ0Mp/Yj
	0Ko1PkCWoorv3rdy3Pu7DA5G/nhvknO/prqFnuDkzLO1aEJYfPFj8HTUFZWEmdBvaSN4
	9rg+dMLiBtXtevsHGmjVxWKYHUzQK+Wm0x+xGEXfYSo1fBSGgwPn4NA6aX8Hr2zN16Yt
	kuGw==
X-Gm-Message-State: ALKqPwf3+WDUMRbS/hvYoWdIQae/DIHiswuPK/VdNMNF/TWHiqIno9mK
	AnomBNCLbQpBG93jM613tPlUFMyZmOytyNN/+p0=
X-Google-Smtp-Source: AB8JxZrYrDnr2eVHjst2JiQZuaEckZfklxFqtQtuEQq/qAcN2gTd6XUix0ROQa+rqU/gNKB8rkcxaufkhegce/9yeaY=
X-Received: by 2002:a17:902:b78a:: with SMTP id
	e10-v6mr6563477pls.260.1526061711980; 
	Fri, 11 May 2018 11:01:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.139.145 with HTTP; Fri, 11 May 2018 11:01:21 -0700 (PDT)
In-Reply-To: <20180511081012.12843-2-git@andred.net>
References: <20180511081012.12843-1-git@andred.net>
	<20180511081012.12843-2-git@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 May 2018 11:01:21 -0700
Message-ID: <CAMKF1sowd6V-K0o5r5pq_2Ah_mH3kdhTVUGhUzbRERqD7Kacog@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH 2/2] gcc: Remove patch causing ICE on x86_64 valgrind compile (on x86-64 only)
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
X-List-Received-Date: Fri, 11 May 2018 18:01:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 11, 2018 at 1:10 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>
> This is similar to commit f76ee525a75d, but instead of disabling
> the patch on all builds, we only remove it for x86-64 builds, as
> the original change's commit message mentined issues with this
> patch applied on that architecture only.
>

this is better thanks

> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> ---
>  meta/recipes-devtools/gcc/gcc-6.4.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-6.4.inc b/meta/recipes-devtool=
s/gcc/gcc-6.4.inc
> index 1803917f01..9a23863022 100644
> --- a/meta/recipes-devtools/gcc/gcc-6.4.inc
> +++ b/meta/recipes-devtools/gcc/gcc-6.4.inc
> @@ -81,9 +81,11 @@ SRC_URI =3D "\
>             file://0048-sync-gcc-stddef.h-with-musl.patch \
>             file://0054_all_nopie-all-flags.patch \
>             file://0055-unwind_h-glibc26.patch \
> -           file://0056-LRA-PR70904-relax-the-restriction-on-subreg-reloa=
d-f.patch \
> +           ${LRA_PR70904_PATCH} \
>             ${BACKPORTS} \
>  "
> +LRA_PR70904_PATCH =3D "file://0056-LRA-PR70904-relax-the-restriction-on-=
subreg-reload-f.patch"
> +LRA_PR70904_PATCH_x86-64 =3D ""
>  BACKPORTS =3D "\
>             file://CVE-2016-6131.patch \
>             file://0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-pe=
eph.patch \
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

