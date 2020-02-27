Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0490D61163
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 07:45:05 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id u124so2190154qkh.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 23:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oo5v4SnUtqFAuZsS+RimsxFHNVXW/agXhlO4BnIfFJA=;
	b=dlsnd//rAw66Yw0jOPXV7BsuwXfg2OJ37xKRrhlZH+F5syAXg5j7QGLB7v6870Y0RO
	QigzueD0Q25CnNOTQY24ioaI9xzmGfn3+y6x23m0+5CxnLp8Wmq9JrBchktQ96tQ15sY
	um7bn6hysO0uXhGbZAvNmzNzOJEIAveaOI9onmWzTe13QIuwfkwEc7Vqcrp7qdaIcFmP
	dOtojA8qwZh1RrpDU5YLZKYaa6U0l1rUaLTLWDjW5GUrE5cl5I4WxIG/171bauIsAeKL
	c6An6JCHocpXNhr7nH3eQIXA16hGxwSjpXsUl3aiVY51Z/X/kMgJ2fMyTXzTl2/+TqSj
	8NbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oo5v4SnUtqFAuZsS+RimsxFHNVXW/agXhlO4BnIfFJA=;
	b=iohe/vbdhcixb5mU6S8Y9oM9QOY8TwRFojDhhDIjWFFfnvKbameB6N0yiX9CI+lNGL
	FWPMy6wWCGWxonbVGGs1ukTxIMaEcDlYO64oC9ppwHhs6sUvIFOd99E9Li+ovmy5cbFN
	iEBqufbSk/yF8C91iIMj/kwZ0Wm6Vg8rPz0aacroqtZByrg7csY2n9JundhE4F2Nn0ID
	hfVBZWZYHi78DfWsy20T7bDEmbagdfr7fvE9O3dv4zivt25aJ2nA0aJa3Xe4rrg9KVgn
	JLnEven2MwDfKuLRb/n1jFmFsut32Wh5WfY6a/939WUlBPXDPppP0I1R+a9Wa6ajmyLv
	Quug==
X-Gm-Message-State: APjAAAXeNf/I+D7bIYbUZL722nBlxEttVFtKD2+md1GqP2cJ3NHPMkZl
	YoxzfY8ygcGMf3PLTqdv30ZVogzfxalHQBiUE11xNxe4
X-Google-Smtp-Source: APXvYqz+1XV2VniTgIhPxRHaxCwBKPH803K1dl0wsVSCukAMR5xvuMs9ITfwO0w1DTdniajIZjmBbkBRPC/c1OgJc2s=
X-Received: by 2002:a37:6307:: with SMTP id x7mr3869393qkb.225.1582789506498; 
	Wed, 26 Feb 2020 23:45:06 -0800 (PST)
MIME-Version: 1.0
References: <20200227061657.66871-1-zboszor@pr.hu>
	<f35582c7-c1e7-a2ac-29b8-75bb33305d36@pr.hu>
In-Reply-To: <f35582c7-c1e7-a2ac-29b8-75bb33305d36@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Feb 2020 23:44:39 -0800
Message-ID: <CAMKF1sqBdh45oAbTGMYxQSXPaF-r5ZqbdVZZzmR1P7heAy=6kQ@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-clang][PATCH] conf/nonclangable.conf: Always build mesa with gcc
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
X-List-Received-Date: Thu, 27 Feb 2020 07:45:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you send it via github pull request please

On Wed, Feb 26, 2020 at 10:21 PM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n via
Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
>
> Ignore this, the patch is against the zeus branch.
> Re-sent with the proper subject.
>
> 2020. 02. 27. 7:16 keltez=C3=A9ssel, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n =C3=ADrta:
> > Building mesa (at least version 19.3.4) with clang 9.0.1 leads
> > to linker errors on x86/x86-64:
> >
> > "undefined reference to `typeinfo for llvm::raw_pwrite_stream'"
> > in libvulkan_radeon.so
> >
> > and
> >
> > "undefined reference to `typeinfo for llvm::RTDyldMemoryManager'"
> > in libgallium.a.
> >
> > It was reported at https://gitlab.freedesktop.org/mesa/mesa/issues/2533
> >
> > It seems it is related to rtti not being enabled, at least reports
> > from a few years ago on forums lead to that conclusion.
> > But enabling rtti for clang in PACKAGECONFIG doesn't help.
> >
> > Just build mesa with gcc, it fixes the linker errors.
> >
> > Signed-off-by: B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszor@pr.hu>
> > ---
> >   conf/nonclangable.conf | 7 +++----
> >   1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/conf/nonclangable.conf b/conf/nonclangable.conf
> > index 70336bb..91b9965 100644
> > --- a/conf/nonclangable.conf
> > +++ b/conf/nonclangable.conf
> > @@ -45,10 +45,9 @@ TOOLCHAIN_pn-libssp-nonshared =3D "gcc"
> >   TOOLCHAIN_pn-libstd-rs =3D "gcc"
> >   TOOLCHAIN_pn-m4_powerpc =3D "gcc"
> >   # clang does not have 64bit atomics on mips32
> > -TOOLCHAIN_pn-mesa_mips =3D "gcc"
> > -TOOLCHAIN_pn-mesa_mipsel =3D "gcc"
> > -TOOLCHAIN_pn-mesa_riscv64 =3D "gcc"
> > -TOOLCHAIN_pn-mesa_powerpc =3D "gcc"
> > +# building Mesa 19.3.x with clang causes linker errors on x86/x86-64
> > +# See https://gitlab.freedesktop.org/mesa/mesa/issues/2533
> > +TOOLCHAIN_pn-mesa =3D "gcc"
> >   # multiple definition of 'mongo::error_details::isNamedCode<0>'
> >   TOOLCHAIN_pn-mongodb =3D "gcc"
> >   # variant-impl.hpp:309:36: error: 'is_variant' does not name a templa=
te but is followed by template arguments
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

