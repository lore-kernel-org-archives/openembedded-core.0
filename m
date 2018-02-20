Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 91BA360079
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 21:44:19 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id x196so6294984lfd.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 13:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WPH2Tn1DhMnlkCaJ3u8Qto3uTJubASPXNlGEE691VhI=;
	b=og/xCSGFi7lv2GbyhE2v37gbmz+A5S0uL4+CXDGNKEmSHp5ov4MGf8pOqW+zYtZChh
	LjcGL8SU0uwHuNzv+rKdRUlHnGrtnbKStj/2Z1MrLOHr06MgTM7aq/T4gzYwBdIiSaiA
	xpNijnIOELLqFBOet3g0VkmncOYOQqdJ4W+yaD3e0l1nTUWo10/eoN58vAksx4ElAUDx
	cl/p2R+G9vG9Gj1qIYPxm8dFktS9J0h4dF5lod9aRTpsr5lBeKS6fChGu8ij9CXhsxu3
	AlgKUS2w59gNOtdcH4//cCpNdhqRfDDfDEBLX5dWfhL+acSZtuUDSCl+hJEzTqKSAAwh
	J0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WPH2Tn1DhMnlkCaJ3u8Qto3uTJubASPXNlGEE691VhI=;
	b=Cw1RUeZMdOeGSpB7qr4JQYj3e6h4FZyPtbyRMumyye8nnm1rqksRaCYw81mXk4ob5x
	F4ISICUD6gnv86+RaYvKgv+duM6MOXnH2j2qqCvUeJYEg34447M9viwt3QoQYIdrGXfp
	lw754avw9eYUiTymd/t7wy0NPVNgV8y5vRQUNGaSAqzR2xdJ6MBf6Dkrz5Z4xdz4M681
	8l7UOQkDFZho1a+X9Sf/O8wtKjvuq3O4xkMfJO8aKR/r5OWp34tQtbZGGPunqOy3yYFG
	2KWxNfALbhKKNuICv8ZNBWIGc/SVldGrHyviIIVHwgF28Och8JU1dTpxU4ke1NQAr2K2
	eccQ==
X-Gm-Message-State: APf1xPDvv63Y/Uzd/3EVcU6s0Bpli60VA2doaEKNF3TZjUF23MgoalsA
	qNEDRI/TjisZkfLXGuWPi6xil2jp+OEBtmo/+84ZrA==
X-Google-Smtp-Source: AH8x225wloFwv8sOit0WitT+By9wIkCjfMWLAqcT4ZK1VllISaVi7YlWxzJPVDaIwQUKstusV4P2GarEGTiXZJgXlzM=
X-Received: by 10.46.80.6 with SMTP id e6mr718208ljb.129.1519163059963; Tue,
	20 Feb 2018 13:44:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Tue, 20 Feb 2018 13:44:19 -0800 (PST)
In-Reply-To: <20180220204504.GA16668@lasswell>
References: <20180220164126.13123-1-jsbronder@cold-front.org>
	<CADkTA4PYMiMCKSE-rua7pjHaYgg_U3caan=Sy_i6r2Agc-8vUQ@mail.gmail.com>
	<20180220204504.GA16668@lasswell>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 20 Feb 2018 16:44:19 -0500
Message-ID: <CADkTA4MJtsupoTNKNUzMcBymkN95n7c21bzO_bhDk7NS8KTwSA@mail.gmail.com>
To: Justin Bronder <jsbronder@cold-front.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel: module: module-base: depend on elfutils-native
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
X-List-Received-Date: Tue, 20 Feb 2018 21:44:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 20, 2018 at 3:45 PM, Justin Bronder
<jsbronder@cold-front.org> wrote:
> On 20/02/18 12:06 -0500, Bruce Ashfield wrote:
>> On Tue, Feb 20, 2018 at 11:41 AM, Justin Bronder
>> <jsbronder@cold-front.org> wrote:
>> > libelf is required for CONFIG_STACK_VALIDATION which is required by
>> > CONFIG_UNWINDER_ORC (the default in 4.14+).
>>
>> As you'll see in the discussion about adding bison-native, we don't want to add
>> these version specific dependencies globally.
>
> I was watching but didn't see a definitive conclusion in that thread yet.
> Ignoring out of tree modules, I suppose it is pretty trivial to just add the
> extra DEPENDS to the kernel recipe for a while until they're required by all
> supported kernel versions.  However, for out of tree modules, it's a bit more of
> a burden to add it for every recipe.  Is that the suggested way forward to deal
> with this or is there a better method?

Adding it to the new make-mod-scripts recipe is the suggested way
forward, it may need to be version dependent .. which is why I haven't
added it yet, but instead have been carrying them in kernel recipes.

Since the mod-scripts depend on the kernel recipe, that should be pulling
in a version specific dependency.

>
>>
>> >
>> > We also need to update the module classes to pass HOSTCC and HOSTCPP
>>
>> This is already covered in my v3 "make-modules-script" changes.
>
> That does cover the patch to module-base.bbclass, but it's missing the addition
> to EXTRA_OEMAKE in module.bbclass which is still needed in order to be able to
> find elfutils-native if I add it to the DEPENDS of the module.

Once I get that first iteration in tree, my plan was to follow up with any
additional dependencies.

Bruce

>
>>
>> Bruce
>>
>> > just like the kernel class already does.  Otherwise the test for libelf
>> > in the kernel Makefile fails.
>> > ---
>> >  meta/classes/kernel.bbclass      | 2 +-
>> >  meta/classes/module-base.bbclass | 1 +
>> >  meta/classes/module.bbclass      | 4 +++-
>> >  3 files changed, 5 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> > index 5cdff581ef..d3a7e1e1cb 100644
>> > --- a/meta/classes/kernel.bbclass
>> > +++ b/meta/classes/kernel.bbclass
>> > @@ -4,7 +4,7 @@ KERNEL_PACKAGE_NAME ??= "kernel"
>> >  KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
>> >
>> >  PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
>> > -DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native"
>> > +DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native elfutils-native"
>> >  PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
>> >
>> >  do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot"
>> > diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
>> > index f851b85163..3b56e04534 100644
>> > --- a/meta/classes/module-base.bbclass
>> > +++ b/meta/classes/module-base.bbclass
>> > @@ -23,5 +23,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>> >  do_make_scripts() {
>> >         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>> >         make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
>> > +                  HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" \
>> >                    -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts
>> >  }
>> > diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
>> > index 78d1b21dbd..89dee2dae8 100644
>> > --- a/meta/classes/module.bbclass
>> > +++ b/meta/classes/module.bbclass
>> > @@ -1,10 +1,12 @@
>> >  inherit module-base kernel-module-split pkgconfig
>> >
>> > +DEPENDS += "elfutils-native"
>> > +
>> >  addtask make_scripts after do_prepare_recipe_sysroot before do_configure
>> >  do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>> >  do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
>> >
>> > -EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
>> > +EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR} HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
>> >
>> >  MODULES_INSTALL_TARGET ?= "modules_install"
>> >  MODULES_MODULE_SYMVERS_LOCATION ?= ""
>> > --
>> > 2.13.6
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>
> --
> Justin Bronder



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

