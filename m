Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB9F79E93
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 10:41:15 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f81so1536669wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 02:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=JHS8GMucfHdHpyJXm3FaFDhCgUN2eAHcG6YnzCNGDkk=;
	b=AAiZC5stpeBGH1VCXDPvrUerAWKt4PZb/iG0B+TqY5xf+jkHMb+0Sf77+ODHgMI7cC
	fV93/JGeR2KNb4G3E4vpSgZKkC3EneCFxSElTa+MavZli9eCLL27aBfhNICab7lUx9fu
	EJBaWOACgXQ3f8H880pNVb8S5fqLn4b0uCCSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=JHS8GMucfHdHpyJXm3FaFDhCgUN2eAHcG6YnzCNGDkk=;
	b=Llz3cpywdtsVW5d8adNK3UX9RoLAzpSwGT9G/mgKkWl6vLwl9RDXF9K3zUk4qjOq/J
	FsQViq58IEJryZ9SJ57LTent/jpdg0hhc+ea9RVpMRgABJLy7GxyrYSo9EiLu8wpEAcB
	llOUJKBGC+dwLTXlGqGiinXfVay/EC2Kx6Fo2vDcjY+il6StZXBUaebXTLNIhs9zGAsL
	kasSJ7rCo8IUzV9curDPQp9LwzylPqMm/RF9++Mcf6ZHvAR1VtX9jrJT+RXM4DF8YptF
	5USeih/fvtYAuFsEzkGABSqcnJio+q9/bTQ68cJlNmVYnUVvMexaoIt3VmKnM6wYQthr
	eWcQ==
X-Gm-Message-State: AA+aEWYXT0TXPlSh5OyvrtI/SOBg9OGglO2g4zaET25QxX1EdxxADi4t
	NqLgUeVwCqjyyI6+Aa7rlRLEeg==
X-Google-Smtp-Source: AFSGD/UV/XrAXs5O+0K7DUo4Xmvall93C7/T7KRsCJyCdZCWSNo/aJ3hl7TXp3KtjRfh9f8eAtzRzg==
X-Received: by 2002:a1c:9a0d:: with SMTP id c13mr1318640wme.41.1545302475907; 
	Thu, 20 Dec 2018 02:41:15 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id s8sm8644494wrn.44.2018.12.20.02.41.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 20 Dec 2018 02:41:14 -0800 (PST)
Message-ID: <e4590788139cd1231dc0ac09e58cd7403c1a5892.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Dec 2018 10:41:13 +0000
In-Reply-To: <CAMKF1so94po_iN+AmHq7JKjtDKeoQkMUbTu4UTgeGB9u9SmkzA@mail.gmail.com>
References: <20181220001545.12618-1-richard.purdie@linuxfoundation.org>
	<20181220001545.12618-2-richard.purdie@linuxfoundation.org>
	<CAMKF1so94po_iN+AmHq7JKjtDKeoQkMUbTu4UTgeGB9u9SmkzA@mail.gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] gcc: Drop gcc-cross-initial and use gcc-cross instead
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
X-List-Received-Date: Thu, 20 Dec 2018 10:41:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-12-19 at 16:55 -0800, Khem Raj wrote:
> On Wed, Dec 19, 2018 at 4:16 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > +# ifunc doesn't appear to work on mips, casuses libbfd assertion
> > failures
> > +CACHED_CONFIGUREVARS_append_mipsarch = "
> > libc_cv_ld_gnu_indirect_function=no"
> 
> perhaps we should use --disable-gnu-indirect-function to make it more
> readable.

I did it this way to exactly emulate how it was "failing" prior to the
changes.

> > +
> >  GLIBC_EXTRA_OECONF ?= ""
> >  GLIBC_EXTRA_OECONF_class-nativesdk = ""
> >  INHIBIT_DEFAULT_DEPS = "1"
> > diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > index e2ce234aa14..009ab111683 100644
> > --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > @@ -24,6 +24,8 @@ GCCTHREADS ?= "posix"
> > 
> >  GCCPIE ??= ""
> > 
> > +# glibc version is a minimum and doesn't need to track glibc
> > exactly
> > +# only governs ppc specific features in much older glibc versions
> 
> I hope there are no effects of this pinning to glibc 2.28 on non-
> glibc builds especially musl.

I took a closer look at this. The only platforms that touch it are
rs6000 and the spe port. For linux.h, that only changes one thing in
gcc/config/rs6000/rs6000.c for glibc 2.19 or higher:

/* Support for TARGET_ATOMIC_ASSIGN_EXPAND_FENV without FPRs depends
   on glibc 2.19 or greater.  */
#define RS6000_GLIBC_ATOMIC_FENV 1

For the linux64.h part:

/* Split stack is only supported for 64 bit, and requires glibc >=
2.18.  */
#  define TARGET_CAN_SPLIT_STACK
#   define TARGET_CAN_SPLIT_STACK_64BIT 1
#   define TARGET_CAN_SPLIT_STACK_64BIT 0

Are those going to cause problems on musl?


> 
> >  EXTRA_OECONF = "\
> >      ${@['--enable-clocale=generic', ''][d.getVar('USE_NLS') !=
> > 'no']} \
> >      --with-gnu-ld \
> > @@ -38,6 +40,7 @@ EXTRA_OECONF = "\
> >      --enable-libstdcxx-pch \
> >      --program-prefix=${TARGET_PREFIX} \
> >      --without-local-prefix \
> > +    --with-glibc-version=2.28 \
> >      ${EXTRA_OECONF_BASE} \
> >      ${EXTRA_OECONF_GCC_FLOAT} \
> >      ${EXTRA_OECONF_PATHS} \
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > index 2f32d3407fb..73f1e054463 100644
> > --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > @@ -3,7 +3,7 @@ inherit cross-canadian
> >  SUMMARY = "GNU cc and gcc C compilers (cross-canadian for
> > ${TARGET_ARCH} target)"
> >  PN = "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> > 
> > -DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}gcc-
> > crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-
> > ${HOST_PREFIX}libc-for-gcc nativesdk-gettext flex-native"
> > +DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}gcc-
> > crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-
> > ${HOST_PREFIX}libc-for-gcc nativesdk-gettext flex-native
> > virtual/libc"
> > 
> >  GCCMULTILIB = "--enable-multilib"
> > 
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc
> > b/meta/recipes-devtools/gcc/gcc-cross.inc
> > index 89b19684bef..63a196e2e99 100644
> > --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> > @@ -2,7 +2,7 @@ inherit cross
> > 
> >  INHIBIT_DEFAULT_DEPS = "1"
> >  EXTRADEPENDS = ""
> > -DEPENDS = "virtual/${TARGET_PREFIX}binutils
> > virtual/${TARGET_PREFIX}libc-for-gcc ${EXTRADEPENDS} ${NATIVEDEPS}"
> > +DEPENDS = "virtual/${TARGET_PREFIX}binutils ${EXTRADEPENDS}
> > ${NATIVEDEPS}"
> >  PROVIDES = "virtual/${TARGET_PREFIX}gcc
> > virtual/${TARGET_PREFIX}g++"
> >  python () {
> >      if d.getVar("TARGET_OS").startswith("linux"):
> > @@ -44,6 +44,12 @@ EXTRA_OECONF_PATHS = "\
> > 
> >  ARCH_FLAGS_FOR_TARGET += "-
> > isystem${STAGING_DIR_TARGET}${target_includedir}"
> > 
> > +
> > +do_configure_prepend () {
> > +       install -d ${RECIPE_SYSROOT}${target_includedir}
> > +       touch ${RECIPE_SYSROOT}${target_includedir}/limits.h
> 
> I wonder if we should use install  0644 so we dont have permission
> errors not sure what touch will do in that regard

The file isn't packaged and we're not in pseudo context so it shouldn't
matter here as we're just poking something into our own recipe
sysroot...

Cheers,

Richard


