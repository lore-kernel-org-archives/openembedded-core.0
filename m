Return-Path: <nathan@nathanrossi.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id A67417964C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 08:30:51 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id z78-v6so16232382qka.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 01:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yIbUBJkjYhQMfKoNWtTDtRTHVKhgJCZNTZhQC8JEN8o=;
	b=MXlMgLI30drT9L4rm4KdNgX96ZPVogkCKJ81wNt2nGVsBEE0SsbFaDcp4kqP/OC5SA
	wET0o3xjgWqA39f5tW6NScXfoJMf20cEJ+Gcu8BnHOiDjRn+yPjke49K9ZoRvfRtn3eh
	yegyfLHZkkBUm1PrNBSX0Dl5kM4S0SOh1zWaFBGAQs+fKSNygfylRd1AgruK+dFU4kYY
	G/zA1osV8Tmyb+cQjcoltxJMxLkB7McnG19AKvFD4k62+9FDK+X2tEMKkughNaXvCa06
	DNE72o501VBPvJDXvRhISUNBrowZkFQc9bZKv2Y2NLuhoK9S1YVdY9NMvnENs6pSRTd6
	+Oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yIbUBJkjYhQMfKoNWtTDtRTHVKhgJCZNTZhQC8JEN8o=;
	b=tK4fujMfIN9ZKJuOSeuza7ZRDTiIwB9UDBpCiFZDYyISos9JAo52T66F+cWpUfs0r/
	cBSiXXXjjwsdTwQlPEn4YmvbG/W2+lrdkfi/63gGYq5zJ/MKDx0sBdjVCBP52zCQuZXk
	Ah03M301zsnfD/ohjxsewgoUqqZUEr5gm75ptk+ndKKqVcokR9Qpkdnlg63W2jmi30bk
	ivPERkeUv9QVQMAbUGXiIKNmTKFa8M6qNbMhF6AfYvSlRJoJ8PRz8EvOx3e+M4gfSYRd
	3OyBC7oaibwsXMQCQQyV1FmoknQht2byHqL+R9HFo8qyzg8vWtRKuY6DerqLgr7CyWwY
	sOmA==
X-Gm-Message-State: APzg51COz1q+MDQw+VjzeTPaO6J/U84Pj0ImhfNANTfh6ukErOImHfuL
	W/oPFlc4OdCXnkKTs3KPGdSHDkmgCBTzKKYJVi/BCBCO
X-Google-Smtp-Source: ANB0VdbQQnzEYirobGrZdFbfHAxQK8GijhsS9GPdYprGJTDRIfmnGIAZyXGodfShE+7k6Q+zo6YbwltTZAUL6zi0WRI=
X-Received: by 2002:a37:ae03:: with SMTP id
	x3-v6mr18222230qke.170.1536654652425; 
	Tue, 11 Sep 2018 01:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20180910124503.21183-1-nathan@nathanrossi.com>
	<CAMKF1sq=i8METMpL_gL0PorPWu-VbJRQTQstC4WB2ZmcMSW_rw@mail.gmail.com>
In-Reply-To: <CAMKF1sq=i8METMpL_gL0PorPWu-VbJRQTQstC4WB2ZmcMSW_rw@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Tue, 11 Sep 2018 18:30:41 +1000
Message-ID: <CA+aJhH2LNoVETLiW6W5hN3PBVGYDuthvdQVp-0uovqCAEB6xng@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tclibc-baremetal.inc: Remove BASEDEPENDS on compilerlibs
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
X-List-Received-Date: Tue, 11 Sep 2018 08:30:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Sep 2018 at 02:14, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Sep 10, 2018 at 5:45 AM Nathan Rossi <nathan@nathanrossi.com> wrote:
> >
> > Without a libc the gcc-runtime provider of compilerlibs does not
> > compile. As such avoid the default dependence on the
> > virtual/${TARGET_PREFIX}compilerlibs provider.
> >
>
> compilerlibs is compiler runtime, do we not have crtstuff and libgcc
> for baremetal ?

At first I thought that might be an issue, but it turns out that the
libgcc code (and 'crt(begin|end|i|n).o') is built by the libgcc recipe
and populated into the sysroot from that recipe. 'compilerlibs' which
is provided by gcc-runtime only handles other libraries (libgomp,
libatomic, libstdc++v3, etc).

A larger problem that really prevents gcc-runtime from being used at
all is the lack of libc (by choice of course) and because of that the
lack of the crt[01].o objects which the compiler specs for "elfos".
Which means the tclibc-baremetal is only practically useful with
"-nostdlib" or equivalent being provided (otherwise by default it
attempts to use "-lc" and "crt0.o"). Even with -nostdlib none of the
gcc-runtime libraries compile (missing support for various libc
features). Setting "-nostdlib" in tclibc-baremetal via TARGET_CC_ARGS
might be worth adding as well?

Although I might be missing something? Since my use case for baremetal
is just a c compiler and linker without any start objects or library
code.

Thanks,
Nathan

>
> > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > ---
> >  meta/conf/distro/include/tclibc-baremetal.inc | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/distro/include/tclibc-baremetal.inc
> > index b00917913f..e04f8c8812 100644
> > --- a/meta/conf/distro/include/tclibc-baremetal.inc
> > +++ b/meta/conf/distro/include/tclibc-baremetal.inc
> > @@ -21,6 +21,9 @@ LIBC_DEPENDENCIES = ""
> >  EXTRA_OECONF_pn-gcc-cross-${TARGET_ARCH}_append = " --without-headers"
> >  DEPENDS_remove_pn-meta-toolchain = "virtual/libc virtual/${TARGET_PREFIX}compilerlibs"
> >
> > +# certain compiler libs cannot be used without libc, avoid the dependence on compilerlibs
> > +BASEDEPENDS_remove_class-target = "virtual/${TARGET_PREFIX}compilerlibs"
> > +
> >  TARGET_OS = "elf"
> >  TARGET_OS_arm = "eabi"
> >
> > ---
> > 2.18.0
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

