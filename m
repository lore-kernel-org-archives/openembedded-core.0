Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
	[209.85.222.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9970F7BE2F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 01:17:02 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id n12so31022qkh.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 17:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MdzKC7BuvJb+7Jnnq1y4JznGIhz/zX9fYG3ZsUVrq20=;
	b=aFCbjYV4UrJMoA6Wv0aPpA4+FLsBXmpURn564AmevSxXFUV1lXCWDnJ7BK1JhVQt1b
	XquoOzvRPq9lQE+x0z5Aq0rCAYZ67CRXjX55gecC7G6JFEfA042/OrOaVavBpKYwoEHZ
	vN1czGvHqaweITLFgSNqWXENoRpzmZJwrCOyPskSpL9sI0fKzTo4zt0DFrJujRVUoI8c
	ja/yClGgq9Io4u9PGoXwKoXiOQfAq7w19emUgBkb7oKzfoJ4O51hpycj6e3OkyKf4Yw5
	5tq3R3xDCIiuuIEoYhZclZAyOVkDI1ICPCDYq0/Dq7uM3Rxf1QRbnU/h785OWODcyTL9
	fucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MdzKC7BuvJb+7Jnnq1y4JznGIhz/zX9fYG3ZsUVrq20=;
	b=CzDaBooBoiccDBaIA+72Lg5Q0+JUFMikTp4CvzV2a17ufRQWBQOrLiCnu6AOqwvjzv
	RuxodEV0cBeoa/+1uN1su8D/Ih1oCTVnp6jA28qonK06j/nj3zlgcZZhaZwFqaD6Ejy3
	JJgKV/b9zathrVFdiXvr9st3IqNDRjWn9wo5Ht8jvNK+V88ikzHy6ESFv/4pQycExT1R
	dabPLb3i8mZ/g1XLLiahNj4JeI6LZRLCS/Mwuaz+5QzFQK3qYDzM3tOEWdyjE4dNGwbO
	97+QRduEYeVOeDcIANtF2EUjAum/26K3EXNZBY8M2YRODjbMIfXXwmcddLXKEsfiXibm
	sDiw==
X-Gm-Message-State: AA+aEWYhfMf8Q+IOqmC0nve5WKc4hAQZKtgx5Pcq1WRaXOohgV6BJOsQ
	QvhVLTfWuLA62qx7RHVLgKOZGScA/LbttD3DukvP6//3Zr0=
X-Google-Smtp-Source: AFSGD/XipdTQsBpMaiHOZLwt6uUcz7TjAN7VvG0IMgRyWdz//joZAN1+1BuO9hkkxnbJBIac6asFaqDH68t2KlMijRg=
X-Received: by 2002:a37:a80a:: with SMTP id r10mr23436124qke.2.1545268623124; 
	Wed, 19 Dec 2018 17:17:03 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
	<E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
In-Reply-To: <E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Dec 2018 17:16:37 -0800
Message-ID: <CAMKF1sq5rCLE+mW4zzs59kpZnA_g9LJzvpSL0TyW5Lng8A0Xdg@mail.gmail.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	James Feist <james.feist@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: flto automake
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
X-List-Received-Date: Thu, 20 Dec 2018 01:17:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 18, 2018 at 4:42 PM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
>
>
> > On Dec 18, 2018, at 1:08 PM, James Feist <james.feist@linux.intel.com> =
wrote:
> >
> > If you aren't planning on enabling flto in a repo you can ignore this e=
mail.
> >
> >
> > I've created a new class flto-automake https://github.com/openbmc/meta-=
phosphor/blob/master/classes/flto-automake.bbclass if you are enabling -flt=
o in an autotools project you might be interested in. When using static lib=
raries you may run into undefined references when building with Yocto. Yoct=
o by default uses:


The changes are right but I think flto should also be a DISTRO_FEATURE
and this change should become effective only when flto is in
DISTRO_FEATURES

> >
> > export AR =3D "${HOST_PREFIX}ar"
> > export RANLIB =3D "${HOST_PREFIX}ranlib"
> >
> > for AR and RANLIB. This new class replaces these with the gcc equivalen=
t wrappers that can work with the flto object files. This doesn't seem to b=
e an issue for the CI build, it only shows up for Yocto builds. Reference: =
http://stackoverflow.com/questions/25878407/how-can-i-use-lto-with-static-l=
ibraries#comment67660913_25878408
> >
> > For Cmake I suggest looking at the way bmcweb handles it in CMakesLists=
:
> > https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt#L92

hardcoding is not right. We have cross versions of these tools
installed during OE build and we also have options to use non-gcc
compilers, e.g. llvm provides its own verisons of llvm-ar and
llvm-ranlib and llvm-nm which should be used when using clang
or other llvm based static compilers.
This is right fix for cross compiling with CMake
https://github.com/YoeDistro/meta-ti/blob/yoe/mut/recipes-bsp/rwmem/rwmem/0=
001-Use-CMake-provided-vars-for-ar-and-ranlib.patch

> >
> > Thanks,
> >
> > James
>
> Thanks James
>
> I wonder if this is something they would be interested in upstream.  I=E2=
=80=99ve copied
> the oe-core mailing list for possible comment.
>
> -brad
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

