Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5910960B34
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 22:55:18 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f129so1265753wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 14:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ten+TN0bjPwTolbhzo/RZNH70KDl9lcZbAQk/0oKEDU=;
	b=lkcy7j/SnyPqpnbfTWBLlJTn1hUPTsreBxM9iDPglcFC1aPXAyS+fSdEFhINLFgnC/
	MlQJqUYEx+kFzO9q4te8R5RALDGmiMzM0Ip5N7K/hZhiu8fDPTyTV8fh1qXqVqefToOk
	9aQ5Jv9uQqOS3eiAm+O7OrCCJidPS4JDw8As1hg2v4RNddhNmkbgBOrdu9c05nom5O4q
	1M3ob9PC5rndFThh/b+AdLnTbKHBAzqzSuL32yMNBSICOlx+dWPPt4o4x5owlKyyFy7x
	eeo/QWC2ZR8KNA/1SZZbsout3vzLAM6Zo3i3hn0BPZ3RMkt3uPxCulT1KAB2i74ecFNc
	LEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ten+TN0bjPwTolbhzo/RZNH70KDl9lcZbAQk/0oKEDU=;
	b=jiilouGvTIWJCPeGEI2tMYQWH8Gs7FccJjZeVOa+/bdQIGApiIbqx+rrBayInf7Xth
	PlbPKpubsO0oBOGta/9g6+fWk/pMNZg371Q3B3K52tL50gEAg8C6J6qf2kr7lKrwII7v
	W3ij435bhDxiVjYBffPDjNIClcIjK4cgx4p0GfnH+QZIXLqu4MDbtXrklv/4NJ/JN0Hb
	/imtK1KI9dRkBvo3LZti28gmlIklJKC6tz+szPIIzELbkMxi/fpzJQYpacDdC/8rX8Rf
	qCLhIM8z0e0Wal3RrMxU5sH+XZ6rnGhIe6xs7QUcqh8m0EGShU9w4G1tBV0BTB0iz7tS
	rc+A==
X-Gm-Message-State: APjAAAVoQd5xNNOBnJwiFaUPer3JP1cTWQP5nMiWxC2SmtuGuaFzy/LP
	XN5DCKfO4XFgUVVFDWHx58s=
X-Google-Smtp-Source: APXvYqz1IrWXjrArAMaIfsw1tk+UdtMRmVOSAykO04qbIDgMXMwgwvstu+zxuYSpdZuiWgzhh74V6Q==
X-Received: by 2002:a1c:545d:: with SMTP id p29mr1378859wmi.91.1580770517076; 
	Mon, 03 Feb 2020 14:55:17 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id 16sm1141943wmi.0.2020.02.03.14.55.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 14:55:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 3 Feb 2020 23:55:15 +0100
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20200203225515.ltbstk7emywvexon@jama>
References: <20200203212641.57611-1-bruce.ashfield@gmail.com>
	<20200203221142.7jljrrrjxic3qtau@jama>
	<CADkTA4M=ZpOR6bOnSA2n2tS4UB2vRYuzHHDUcdjOMNK+e3z+EA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4M=ZpOR6bOnSA2n2tS4UB2vRYuzHHDUcdjOMNK+e3z+EA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kern-tools: tweak symbol_why to be python safe
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
X-List-Received-Date: Mon, 03 Feb 2020 22:55:19 -0000
X-Groupsio-MsgNum: 134474
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="27rp5jdfjop675id"
Content-Disposition: inline

--27rp5jdfjop675id
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 05:22:26PM -0500, Bruce Ashfield wrote:
> On Mon, Feb 3, 2020 at 5:11 PM Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> >
> > On Mon, Feb 03, 2020 at 04:26:41PM -0500, bruce.ashfield@gmail.com wrot=
e:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Updating the SRCREV to pickup tweaks to symbol_why.py to be
> > > python3 safe:
> > >
> > >   - we explicitly call /usr/bin/env python3
> > >   - we full specifiy our symbols
> > >   - do not assume that 'None' can be converted to a string
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >
> > > I didn't realized the v5.4 series had gone in, or I would have
> > > send this sooner. This should resolve the errors that are thrown
> > > when symbol_why is run to detect missing symbol dependencies.
> > >
> > > Bruce
> > >
> > >  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb =
b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> > > index a4c0b6fb8a..57ec1abc6d 100644
> > > --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> > > +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> > > @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://git/tools/kgit;beginline=
=3D5;endline=3D9;md5=3D9c30e971d435
> > >
> > >  DEPENDS =3D "git-native"
> > >
> > > -SRCREV =3D "7465c8497893ef8f6503c918aeede969f7e9753b"
> > > +SRCREV =3D "5358eb293399867db05fd73d04ce908d69a03bed"
> > >  PR =3D "r12"
> > >  PV =3D "0.2+git${SRCPV}"
> >
> > This needs a bit more cleanup for python3.
> >
>=20
> That's strange, it works fine under python3 here. I have a few more
> scattered changes that i can't detangle right now.
>=20
> > DEBUG: Executing python function do_kernel_configcheck
> > Traceback (most recent call last):
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2776, in _ex=
pand_macro
> >     res +=3D args[int(new_args[0])]
> > ValueError: invalid literal for int() with base 10: 'error-if'
> >
> > During handling of the above exception, another exception occurred:
> >
> > Traceback (most recent call last):
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/symbol_why.py", line 295, in <mod=
ule>
> >     conf =3D kconfiglib.Kconfig( kconf, show_errors, show_errors )
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 947, in __in=
it__
> >     self._init(filename, warn, warn_to_stderr, encoding)
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 1085, in _in=
it
> >     self._parse_block(None, self.top_node, self.top_node).next =3D None
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2982, in _pa=
rse_block
> >     prev =3D self._parse_block(None, parent, prev)
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2907, in _pa=
rse_block
> >     while self._next_line():
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2234, in _ne=
xt_line
> >     self._tokens =3D self._tokenize(line)
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2364, in _to=
kenize
> >     self._parse_assignment(s)
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2604, in _pa=
rse_assignment
> >     s, i =3D self._expand_macro(s, i, ())
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2780, in _ex=
pand_macro
> >     res +=3D self._fn_val(new_args)
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2843, in _fn=
_val
> >     return py_fn(self, *args)
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 6769, in _er=
ror_if_fn
> >     kconf.filename, kconf.linenr, msg))
> > kconfiglib.KconfigError: scripts/Kconfig.include:39:  gold linker 'x86_=
64-oe-linux-ld --sysroot=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-l=
inux/linux-yocto/5.4.15-r0/recipe-sysroot  ' not supported
> > Traceback (most recent call last):
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2776, in _ex=
pand_macro
> >     res +=3D args[int(new_args[0])]
> > ValueError: invalid literal for int() with base 10: 'error-if'
> >
> > During handling of the above exception, another exception occurred:
> >
> > and the log is full of this (the warnings at the end look the same as b=
efore)
> >
> > # wc -l /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/temp/log.do_kernel_configcheck.28364
> > 11804 /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/=
5.4.15-r0/temp/log.do_kernel_configcheck.28364
> >
> > Maybe kernel_configcheck now needs KERNEL_LD exported as well? See:
> > https://patchwork.openembedded.org/patch/169702/
> > which fixed do_configure with 5.4.
>=20
> I'm running it fully against v5.4 here, and it is working fine. But I
> have enough debug through things, that I can't get them cleaned up
> now, since I have to be up for a flight in a few hours.
>=20
> What board are you building ? Because none of the warnings you are
> seeing should be coming out, since I've cleaned all of those options
> .. so there's some other mismatch going on.

qemux86-64 as shown in the log

With only oe-core layer included and the only relevant option from
local.conf is:
DISTRO_FEATURES_append =3D " ld-is-go

Even after fixing the python3 exceptions with:
https://patchwork.openembedded.org/patch/169709/

I see following mismatch options:

DEBUG: Executing python function do_kernel_configcheck
[mismatch (291)]: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel=
-source/.kernel-meta/cfg/mismatch.txt
   There were hardware options requested that do not
   have a corresponding value present in the final ".config" file.
   This probably means you aren't getting the config you wanted.

WARNING: [kernel config]: specified values did not make it into the kernel'=
s final configuration:

---------- CONFIG_MCORE2 -----------------
Config: CONFIG_MCORE2
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc-64/common-pc-64-cpu.cfg
Requested value:  CONFIG_MCORE2=3Dy
Actual value:     # CONFIG_MCORE2 is not set

  Config 'MCORE2' has the following Direct dependencies (=3Dy):
        <choice>

---------- CONFIG_ATA -----------------
Config: CONFIG_ATA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_ATA=3Dy
Actual value:     # CONFIG_ATA is not set

Config: CONFIG_ATA_ACPI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_ATA_ACPI=3Dy
Actual value:    =20

Config: CONFIG_ATA_SFF
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_ATA_SFF=3Dy
Actual value:    =20

Config: CONFIG_ATA_BMDMA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_ATA_BMDMA=3Dy
Actual value:    =20

Config: CONFIG_ATA_PIIX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_ATA_PIIX=3Dm
Actual value:    =20

  Config 'ATA' has the following Direct dependencies (=3Dy):
        HAS_IOMEM(=3Dy) && BLOCK(=3Dy)

---------- CONFIG_ATA_ACPI -----------------
Config: CONFIG_ATA_ACPI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_ATA_ACPI=3Dy
Actual value:    =20

  Config 'ATA_ACPI' has the following Direct dependencies (=3Dn):
        ACPI(=3Dy) && ATA(=3Dn)

---------- CONFIG_ATA_SFF -----------------
Config: CONFIG_ATA_SFF
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_ATA_SFF=3Dy
Actual value:    =20

  Config 'ATA_SFF' has the following Direct dependencies (=3Dn):
        ATA(=3Dn)

---------- CONFIG_ATA_BMDMA -----------------
Config: CONFIG_ATA_BMDMA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_ATA_BMDMA=3Dy
Actual value:    =20

  Config 'ATA_BMDMA' has the following Direct dependencies (=3Dn):
        HAS_DMA(=3Dy) && ATA_SFF(=3Dn) && ATA(=3Dn)

---------- CONFIG_ATA_PIIX -----------------
Config: CONFIG_ATA_PIIX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_ATA_PIIX=3Dm
Actual value:    =20

No reference to ATA_PIIX found

---------- CONFIG_PATA_SCH -----------------
Config: CONFIG_PATA_SCH
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_PATA_SCH=3Dy
Actual value:    =20

No reference to PATA_SCH found

---------- CONFIG_INPUT_MOUSEDEV -----------------
Config: CONFIG_INPUT_MOUSEDEV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_INPUT_MOUSEDEV=3Dy
Actual value:     # CONFIG_INPUT_MOUSEDEV is not set

  Config 'INPUT_MOUSEDEV' has the following Direct dependencies (=3Dy):
        INPUT(=3Dy) && !UML(undefined/n) (=3Dy)

---------- CONFIG_INPUT_EVDEV -----------------
Config: CONFIG_INPUT_EVDEV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/input/input.cfg /OE/build/oe-core=
/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/s=
tandard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_INPUT_EVDEV=3Dy
Actual value:     # CONFIG_INPUT_EVDEV is not set

No reference to INPUT_EVDEV found

---------- CONFIG_INPUT_TABLET -----------------
Config: CONFIG_INPUT_TABLET
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_INPUT_TABLET=3Dy
Actual value:     # CONFIG_INPUT_TABLET is not set

  Config 'INPUT_TABLET' has the following Direct dependencies (=3Dy):
        INPUT(=3Dy) && !UML(undefined/n) (=3Dy)

---------- CONFIG_HID_WACOM -----------------
Config: CONFIG_HID_WACOM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_HID_WACOM=3Dy
Actual value:    =20

No reference to HID_WACOM found

---------- CONFIG_RTC_CLASS -----------------
Config: CONFIG_RTC_CLASS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_RTC_CLASS=3Dy
Actual value:     # CONFIG_RTC_CLASS is not set

  Config 'RTC_CLASS' has the following Direct dependencies (=3Dy):
        !S390(undefined/n) (=3Dy) && !UML(undefined/n) (=3Dy)

---------- CONFIG_RTC_DRV_CMOS -----------------
Config: CONFIG_RTC_DRV_CMOS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_RTC_DRV_CMOS=3Dy
Actual value:    =20

  Config 'RTC_DRV_CMOS' has the following Direct dependencies (=3Dn):
        X86(=3Dy) || ARM(undefined/n) || PPC(undefined/n) || MIPS(undefined=
/n) || SPARC64(undefined/n) (=3Dy) && RTC_CLASS(=3Dn)

---------- CONFIG_SERIAL_8250_PNP -----------------
Config: CONFIG_SERIAL_8250_PNP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_SERIAL_8250_PNP=3Dy
Actual value:    =20

No reference to SERIAL_8250_PNP found

---------- CONFIG_PARPORT -----------------
Config: CONFIG_PARPORT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_PARPORT=3Dm
Actual value:     # CONFIG_PARPORT is not set

Config: CONFIG_PARPORT_PC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_PARPORT_PC=3Dm
Actual value:    =20

  Config 'PARPORT' has the following Direct dependencies (=3Dy):
        HAS_IOMEM(=3Dy)

---------- CONFIG_PARPORT_PC -----------------
Config: CONFIG_PARPORT_PC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_PARPORT_PC=3Dm
Actual value:    =20

  Config 'PARPORT_PC' has the following Direct dependencies (=3Dn):
        ARCH_MIGHT_HAVE_PC_PARPORT(=3Dy) && PARPORT(=3Dn)

---------- CONFIG_PRINTER -----------------
Config: CONFIG_PRINTER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_PRINTER=3Dm
Actual value:    =20

  Config 'PRINTER' has the following Direct dependencies (=3Dn):
        PARPORT(=3Dn)

---------- CONFIG_USB_HID -----------------
Config: CONFIG_USB_HID
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_HID=3Dy
Actual value:    =20

Config: CONFIG_USB_HIDDEV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_HIDDEV=3Dy
Actual value:    =20

  Config 'USB_HID' has the following Direct dependencies (=3Dn):
        USB(=3Dn) && INPUT(=3Dy) && USB(=3Dn) && INPUT(=3Dy)

---------- CONFIG_USB_HIDDEV -----------------
Config: CONFIG_USB_HIDDEV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_HIDDEV=3Dy
Actual value:    =20

No reference to USB_HIDDEV found

---------- CONFIG_USB_SERIAL -----------------
Config: CONFIG_USB_SERIAL
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_SERIAL=3Dy
Actual value:    =20

Config: CONFIG_USB_SERIAL_CONSOLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_SERIAL_CONSOLE=3Dy
Actual value:    =20

--
Config: CONFIG_USB_SERIAL_GENERIC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_SERIAL_GENERIC=3Dy
Actual value:    =20

Config: CONFIG_USB_SERIAL_FTDI_SIO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_SERIAL_FTDI_SIO=3Dy
Actual value:    =20

Config: CONFIG_USB_SERIAL_PL2303
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_SERIAL_PL2303=3Dy
Actual value:    =20

  Config 'USB_SERIAL' has the following Direct dependencies (=3Dn):
        TTY(=3Dy) && USB(=3Dn) && USB_SUPPORT(=3Dy)

---------- CONFIG_USB_SERIAL_CONSOLE -----------------
Config: CONFIG_USB_SERIAL_CONSOLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_SERIAL_CONSOLE=3Dy
Actual value:    =20

No reference to USB_SERIAL_CONSOLE found

---------- CONFIG_USB_EZUSB_FX2 -----------------
Config: CONFIG_USB_EZUSB_FX2
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_EZUSB_FX2=3Dy
Actual value:    =20

  Config 'USB_EZUSB_FX2' has the following Direct dependencies (=3Dn):
        USB(=3Dn) && USB_SUPPORT(=3Dy)

---------- CONFIG_USB_SERIAL_GENERIC -----------------
Config: CONFIG_USB_SERIAL_GENERIC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_SERIAL_GENERIC=3Dy
Actual value:    =20

No reference to USB_SERIAL_GENERIC found

---------- CONFIG_USB_SERIAL_FTDI_SIO -----------------
Config: CONFIG_USB_SERIAL_FTDI_SIO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_SERIAL_FTDI_SIO=3Dy
Actual value:    =20

No reference to USB_SERIAL_FTDI_SIO found

---------- CONFIG_USB_SERIAL_PL2303 -----------------
Config: CONFIG_USB_SERIAL_PL2303
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_SERIAL_PL2303=3Dy
Actual value:    =20

No reference to USB_SERIAL_PL2303 found

---------- CONFIG_I2C_I801 -----------------
Config: CONFIG_I2C_I801
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_I2C_I801=3Dy
Actual value:    =20

  Config 'I2C_I801' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) && HAS_IOMEM(=3Dy) && I2C(=3Dn)

---------- CONFIG_IDE -----------------
Config: CONFIG_IDE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_IDE=3Dy
Actual value:     # CONFIG_IDE is not set

Config: CONFIG_IDE_GD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_IDE_GD=3Dy
Actual value:    =20

Config: CONFIG_IDE_GD_ATA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_IDE_GD_ATA=3Dy
Actual value:    =20

  Config 'IDE' has the following Direct dependencies (=3Dy):
        HAVE_IDE(=3Dy) && BLOCK(=3Dy)

---------- CONFIG_IDE_GD -----------------
Config: CONFIG_IDE_GD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_IDE_GD=3Dy
Actual value:    =20

Config: CONFIG_IDE_GD_ATA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_IDE_GD_ATA=3Dy
Actual value:    =20

  Config 'IDE_GD' has the following Direct dependencies (=3Dn):
        IDE(=3Dn)

---------- CONFIG_IDE_GD_ATA -----------------
Config: CONFIG_IDE_GD_ATA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_IDE_GD_ATA=3Dy
Actual value:    =20

  Config 'IDE_GD_ATA' has the following Direct dependencies (=3Dn):
        IDE_GD(=3Dn) && IDE(=3Dn)

---------- CONFIG_BLK_DEV_PIIX -----------------
Config: CONFIG_BLK_DEV_PIIX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_BLK_DEV_PIIX=3Dy
Actual value:    =20

No reference to BLK_DEV_PIIX found

---------- CONFIG_SATA_AHCI -----------------
Config: CONFIG_SATA_AHCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_SATA_AHCI=3Dy
Actual value:    =20

  Config 'SATA_AHCI' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) && HAS_DMA(=3Dy) && ATA(=3Dn)

---------- CONFIG_BLK_DEV_FD -----------------
Config: CONFIG_BLK_DEV_FD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_BLK_DEV_FD=3Dm
Actual value:     # CONFIG_BLK_DEV_FD is not set

No reference to BLK_DEV_FD found

---------- CONFIG_EEPROM_AT24 -----------------
Config: CONFIG_EEPROM_AT24
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_EEPROM_AT24=3Dm
Actual value:    =20

No reference to EEPROM_AT24 found

---------- CONFIG_NVME_CORE -----------------
Config: CONFIG_NVME_CORE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_NVME_CORE=3Dy
Actual value:    =20

  Config 'NVME_CORE' has the following Direct dependencies (=3Dy):
        y

---------- CONFIG_BLK_DEV_NVME -----------------
Config: CONFIG_BLK_DEV_NVME
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_BLK_DEV_NVME=3Dy
Actual value:    =20

  Config 'BLK_DEV_NVME' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) && BLOCK(=3Dy)

---------- CONFIG_NET_CORE -----------------
Config: CONFIG_NET_CORE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_NET_CORE=3Dy
Actual value:    =20

  Config 'NET_CORE' has the following Direct dependencies (=3Dn):
        NETDEVICES(=3Dn)

---------- CONFIG_ETHERNET -----------------
Config: CONFIG_ETHERNET
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_ETHERNET=3Dy
Actual value:    =20

  Config 'ETHERNET' has the following Direct dependencies (=3Dn):
        NET(=3Dn) && NETDEVICES(=3Dn)

---------- CONFIG_NET_VENDOR_3COM -----------------
Config: CONFIG_NET_VENDOR_3COM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_NET_VENDOR_3COM=3Dy
Actual value:    =20

  Config 'NET_VENDOR_3COM' has the following Direct dependencies (=3Dn):
        ISA(=3Dn) || EISA(=3Dn) || PCI(=3Dn) || PCMCIA(=3Dn) (=3Dn) && ETHE=
RNET(=3Dn) && NETDEVICES(=3Dn)

---------- CONFIG_TYPHOON -----------------
Config: CONFIG_TYPHOON
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_TYPHOON=3Dm
Actual value:    =20

No reference to TYPHOON found

---------- CONFIG_NET_VENDOR_BROADCOM -----------------
Config: CONFIG_NET_VENDOR_BROADCOM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_NET_VENDOR_BROADCOM=3Dy
Actual value:    =20

  Config 'NET_VENDOR_BROADCOM' has the following Direct dependencies (=3Dn):
        (SSB_POSSIBLE(=3Dy) && HAS_DMA(=3Dy)) || PCI(=3Dn) || BCM63XX(undef=
ined/n) || SIBYTE_SB1xxx_SOC(undefined/n) (=3Dy) && ETHERNET(=3Dn) && NETDE=
VICES(=3Dn)

---------- CONFIG_TIGON3 -----------------
Config: CONFIG_TIGON3
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_TIGON3=3Dm
Actual value:    =20

  Config 'TIGON3' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) && NET_VENDOR_BROADCOM(=3Dn) && ETHERNET(=3Dn) && NETDEVI=
CES(=3Dn)

---------- CONFIG_BNX2X -----------------
Config: CONFIG_BNX2X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_BNX2X=3Dm
Actual value:    =20

Config: CONFIG_BNX2X_SRIOV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_BNX2X_SRIOV=3Dy
Actual value:    =20

  Config 'BNX2X' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) && NET_VENDOR_BROADCOM(=3Dn) && ETHERNET(=3Dn) && NETDEVI=
CES(=3Dn)

---------- CONFIG_BNX2X_SRIOV -----------------
Config: CONFIG_BNX2X_SRIOV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_BNX2X_SRIOV=3Dy
Actual value:    =20

No reference to BNX2X_SRIOV found

---------- CONFIG_BNXT -----------------
Config: CONFIG_BNXT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_BNXT=3Dm
Actual value:    =20

Config: CONFIG_BNXT_SRIOV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_BNXT_SRIOV=3Dy
Actual value:    =20

  Config 'BNXT' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) && NET_VENDOR_BROADCOM(=3Dn) && ETHERNET(=3Dn) && NETDEVI=
CES(=3Dn)

---------- CONFIG_BNXT_SRIOV -----------------
Config: CONFIG_BNXT_SRIOV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_BNXT_SRIOV=3Dy
Actual value:    =20

No reference to BNXT_SRIOV found

---------- CONFIG_NET_VENDOR_ATHEROS -----------------
Config: CONFIG_NET_VENDOR_ATHEROS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_NET_VENDOR_ATHEROS=3Dy
Actual value:    =20

  Config 'NET_VENDOR_ATHEROS' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) || ATH79(undefined/n) (=3Dn) && ETHERNET(=3Dn) && NETDEVI=
CES(=3Dn)

---------- CONFIG_ATL1 -----------------
Config: CONFIG_ATL1
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_ATL1=3Dm
Actual value:    =20

Config: CONFIG_ATL1C
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_ATL1C=3Dm
Actual value:    =20

Config: CONFIG_ATL1E
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_ATL1E=3Dm
Actual value:    =20

No reference to ATL1 found

---------- CONFIG_ATL1C -----------------
Config: CONFIG_ATL1C
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_ATL1C=3Dm
Actual value:    =20

No reference to ATL1C found

---------- CONFIG_ATL1E -----------------
Config: CONFIG_ATL1E
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_ATL1E=3Dm
Actual value:    =20

No reference to ATL1E found

---------- CONFIG_ATL2 -----------------
Config: CONFIG_ATL2
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_ATL2=3Dm
Actual value:    =20

No reference to ATL2 found

---------- CONFIG_ALX -----------------
Config: CONFIG_ALX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_ALX=3Dm
Actual value:    =20

No reference to ALX found

---------- CONFIG_NET_VENDOR_INTEL -----------------
Config: CONFIG_NET_VENDOR_INTEL
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_NET_VENDOR_INTEL=3Dy
Actual value:    =20

  Config 'NET_VENDOR_INTEL' has the following Direct dependencies (=3Dn):
        ETHERNET(=3Dn) && NETDEVICES(=3Dn)

---------- CONFIG_NET_VENDOR_AMD -----------------
Config: CONFIG_NET_VENDOR_AMD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_NET_VENDOR_AMD=3Dy
Actual value:    =20

  Config 'NET_VENDOR_AMD' has the following Direct dependencies (=3Dn):
        DIO(undefined/n) || MACH_DECSTATION(undefined/n) || MVME147(undefin=
ed/n) || ATARI(undefined/n) || SUN3(undefined/n) || SUN3X(undefined/n) || S=
BUS(=3Dn) || PCI(=3Dn) || ZORRO(undefined/n) || (ISA(=3Dn) && ISA_DMA_API(=
=3Dy)) || (ARM(undefined/n) && ARCH_EBSA110(undefined/n)) || ISA(=3Dn) || E=
ISA(=3Dn) || PCMCIA(=3Dn) || ARM64(undefined/n) (=3Dn) && ETHERNET(=3Dn) &&=
 NETDEVICES(=3Dn)

---------- CONFIG_PCNET32 -----------------
Config: CONFIG_PCNET32
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_PCNET32=3Dm
Actual value:    =20

No reference to PCNET32 found

---------- CONFIG_NET_VENDOR_REALTEK -----------------
Config: CONFIG_NET_VENDOR_REALTEK
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_NET_VENDOR_REALTEK=3Dy
Actual value:    =20

  Config 'NET_VENDOR_REALTEK' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) || (PARPORT(=3Dn) && X86(=3Dy)) (=3Dn) && ETHERNET(=3Dn) =
&& NETDEVICES(=3Dn)

---------- CONFIG_8139CP -----------------
Config: CONFIG_8139CP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_8139CP=3Dm
Actual value:    =20

No reference to 8139CP found

---------- CONFIG_8139TOO -----------------
Config: CONFIG_8139TOO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_8139TOO=3Dm
Actual value:    =20

  Config '8139TOO' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) && NET_VENDOR_REALTEK(=3Dn) && ETHERNET(=3Dn) && NETDEVIC=
ES(=3Dn)

---------- CONFIG_R8169 -----------------
Config: CONFIG_R8169
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_R8169=3Dm
Actual value:    =20

No reference to R8169 found

---------- CONFIG_NET_VENDOR_DLINK -----------------
Config: CONFIG_NET_VENDOR_DLINK
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_NET_VENDOR_DLINK=3Dy
Actual value:    =20

  Config 'NET_VENDOR_DLINK' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) && ETHERNET(=3Dn) && NETDEVICES(=3Dn)

---------- CONFIG_DL2K -----------------
Config: CONFIG_DL2K
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_DL2K=3Dm
Actual value:    =20

No reference to DL2K found

---------- CONFIG_NET_VENDOR_MARVELL -----------------
Config: CONFIG_NET_VENDOR_MARVELL
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_NET_VENDOR_MARVELL=3Dy
Actual value:    =20

  Config 'NET_VENDOR_MARVELL' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) || CPU_PXA168(undefined/n) || MV64X60(undefined/n) || PPC=
32(undefined/n) || PLAT_ORION(undefined/n) || INET(=3Dn) || COMPILE_TEST(=
=3Dn) (=3Dn) && ETHERNET(=3Dn) && NETDEVICES(=3Dn)

---------- CONFIG_SKGE -----------------
Config: CONFIG_SKGE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_SKGE=3Dm
Actual value:    =20

  Config 'SKGE' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) && NET_VENDOR_MARVELL(=3Dn) && ETHERNET(=3Dn) && NETDEVIC=
ES(=3Dn)

---------- CONFIG_SKY2 -----------------
Config: CONFIG_SKY2
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_SKY2=3Dm
Actual value:    =20

  Config 'SKY2' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) && NET_VENDOR_MARVELL(=3Dn) && ETHERNET(=3Dn) && NETDEVIC=
ES(=3Dn)

---------- CONFIG_JME -----------------
Config: CONFIG_JME
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_JME=3Dm
Actual value:    =20

No reference to JME found

---------- CONFIG_FB_MODE_HELPERS -----------------
Config: CONFIG_FB_MODE_HELPERS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
Requested value:  CONFIG_FB_MODE_HELPERS=3Dy
Actual value:    =20

  Config 'FB_MODE_HELPERS' has the following Direct dependencies (=3Dn):
        FB(=3Dn) && HAS_IOMEM(=3Dy)

---------- CONFIG_CONNECTOR -----------------
Config: CONFIG_CONNECTOR
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
Requested value:  CONFIG_CONNECTOR=3Dy
Actual value:    =20

  Config 'CONNECTOR' has the following Direct dependencies (=3Dn):
        NET(=3Dn)

---------- CONFIG_FB_UVESA -----------------
Config: CONFIG_FB_UVESA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
Requested value:  CONFIG_FB_UVESA=3Dm
Actual value:    =20

No reference to FB_UVESA found

---------- CONFIG_DRM_CIRRUS_QEMU -----------------
Config: CONFIG_DRM_CIRRUS_QEMU
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
Requested value:  CONFIG_DRM_CIRRUS_QEMU=3Dm
Actual value:    =20

No reference to DRM_CIRRUS_QEMU found

---------- CONFIG_WIRELESS -----------------
Config: CONFIG_WIRELESS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_WIRELESS=3Dy
Actual value:    =20

  Config 'WIRELESS' has the following Direct dependencies (=3Dn):
        !S390(undefined/n) (=3Dy) && NET(=3Dn)

---------- CONFIG_WLAN -----------------
Config: CONFIG_WLAN
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_WLAN=3Dy
Actual value:    =20

--
Config: CONFIG_WLAN_VENDOR_ATH
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_WLAN_VENDOR_ATH=3Dy
Actual value:    =20

  Config 'WLAN' has the following Direct dependencies (=3Dn):
        !S390(undefined/n) (=3Dy) && NET(=3Dn) && NETDEVICES(=3Dn)

---------- CONFIG_MAC80211 -----------------
Config: CONFIG_MAC80211
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_MAC80211=3Dm
Actual value:    =20

  Config 'MAC80211' has the following Direct dependencies (=3Dn):
        CFG80211(=3Dn) && WIRELESS(=3Dn) && NET(=3Dn)

---------- CONFIG_CFG80211 -----------------
Config: CONFIG_CFG80211
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_CFG80211=3Dm
Actual value:    =20

--
Config: CONFIG_CFG80211_WEXT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_CFG80211_WEXT=3Dy
Actual value:    =20

  Config 'CFG80211' has the following Direct dependencies (=3Dn):
        RFKILL(=3Dn) || !RFKILL(=3Dn) (=3Dy) && WIRELESS(=3Dn) && NET(=3Dn)

---------- CONFIG_ATH_COMMON -----------------
Config: CONFIG_ATH_COMMON
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_ATH_COMMON=3Dm
Actual value:    =20

  Config 'ATH_COMMON' has the following Direct dependencies (=3Dn):
        WLAN(=3Dn) && NETDEVICES(=3Dn)

---------- CONFIG_WLAN_VENDOR_ATH -----------------
Config: CONFIG_WLAN_VENDOR_ATH
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_WLAN_VENDOR_ATH=3Dy
Actual value:    =20

  Config 'WLAN_VENDOR_ATH' has the following Direct dependencies (=3Dn):
        WLAN(=3Dn) && NETDEVICES(=3Dn)

---------- CONFIG_ATH5K -----------------
Config: CONFIG_ATH5K
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_ATH5K=3Dm
Actual value:    =20

  Config 'ATH5K' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) || ATH25(undefined/n) (=3Dn) && MAC80211(=3Dn) && WLAN_VE=
NDOR_ATH(=3Dn) && WLAN(=3Dn) && NETDEVICES(=3Dn)

---------- CONFIG_ATH9K -----------------
Config: CONFIG_ATH9K
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_ATH9K=3Dm
Actual value:    =20

  Config 'ATH9K' has the following Direct dependencies (=3Dn):
        MAC80211(=3Dn) && HAS_DMA(=3Dy) && WLAN_VENDOR_ATH(=3Dn) && WLAN(=
=3Dn) && NETDEVICES(=3Dn)

---------- CONFIG_WEXT_CORE -----------------
Config: CONFIG_WEXT_CORE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_WEXT_CORE=3Dy
Actual value:    =20

  Config 'WEXT_CORE' has the following Direct dependencies (=3Dn):
        CFG80211_WEXT(=3Dn) || WIRELESS_EXT(=3Dn) (=3Dn) && WIRELESS(=3Dn) =
&& NET(=3Dn)

---------- CONFIG_WEXT_PROC -----------------
Config: CONFIG_WEXT_PROC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_WEXT_PROC=3Dy
Actual value:    =20

No reference to WEXT_PROC found

---------- CONFIG_CFG80211_WEXT -----------------
Config: CONFIG_CFG80211_WEXT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_CFG80211_WEXT=3Dy
Actual value:    =20

  Config 'CFG80211_WEXT' has the following Direct dependencies (=3Dn):
        CFG80211(=3Dn) && WIRELESS(=3Dn) && NET(=3Dn)

---------- CONFIG_BCMA -----------------
Config: CONFIG_BCMA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_BCMA=3Dm
Actual value:     # CONFIG_BCMA is not set

Config: CONFIG_BCMA_HOST_PCI_POSSIBLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
Actual value:    =20

Config: CONFIG_BCMA_HOST_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_BCMA_HOST_PCI=3Dy
Actual value:    =20

Config: CONFIG_BCMA_DRIVER_GMAC_CMN
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
Actual value:    =20

  Config 'BCMA' has the following Direct dependencies (=3Dy):
        BCMA_POSSIBLE(=3Dy)

---------- CONFIG_BCMA_HOST_PCI_POSSIBLE -----------------
Config: CONFIG_BCMA_HOST_PCI_POSSIBLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
Actual value:    =20

  Config 'BCMA_HOST_PCI_POSSIBLE' has the following Direct dependencies (=
=3Dn):
        PCI(=3Dn) =3D y (=3Dn) && BCMA(=3Dn)

---------- CONFIG_BCMA_HOST_PCI -----------------
Config: CONFIG_BCMA_HOST_PCI_POSSIBLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
Actual value:    =20

Config: CONFIG_BCMA_HOST_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_BCMA_HOST_PCI=3Dy
Actual value:    =20

No reference to BCMA_HOST_PCI found

---------- CONFIG_BCMA_DRIVER_GMAC_CMN -----------------
Config: CONFIG_BCMA_DRIVER_GMAC_CMN
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
Actual value:    =20

No reference to BCMA_DRIVER_GMAC_CMN found

---------- CONFIG_CRC8 -----------------
Config: CONFIG_CRC8
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_CRC8=3Dm
Actual value:     # CONFIG_CRC8 is not set

  Config 'CRC8' has the following Direct dependencies (=3Dy):
        y

---------- CONFIG_CORDIC -----------------
Config: CONFIG_CORDIC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_CORDIC=3Dm
Actual value:     # CONFIG_CORDIC is not set

  Config 'CORDIC' has the following Direct dependencies (=3Dy):
        y

---------- CONFIG_PARTITION_ADVANCED -----------------
Config: CONFIG_PARTITION_ADVANCED
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi-ext.cfg
Requested value:  CONFIG_PARTITION_ADVANCED=3Dy
Actual value:     # CONFIG_PARTITION_ADVANCED is not set

  Config 'PARTITION_ADVANCED' has the following Direct dependencies (=3Dy):
        BLOCK(=3Dy)

---------- CONFIG_FB_EFI -----------------
Config: CONFIG_FB_EFI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi-ext.cfg
Requested value:  CONFIG_FB_EFI=3Dy
Actual value:    =20

No reference to FB_EFI found

---------- CONFIG_EFI_VARS -----------------
Config: CONFIG_EFI_VARS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi-ext.cfg
Requested value:  CONFIG_EFI_VARS=3Dm
Actual value:    =20

  Config 'EFI_VARS' has the following Direct dependencies (=3Dn):
        EFI(=3Dn) && EFI(=3Dn)

---------- CONFIG_EFI -----------------
Config: CONFIG_EFI_VARS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi-ext.cfg
Requested value:  CONFIG_EFI_VARS=3Dm
Actual value:    =20

Config: CONFIG_EFI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi.cfg /OE/build/oe-core/tmp-glibc/wo=
rk-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cfg/e=
fi.cfg
Requested value:  CONFIG_EFI=3Dy
Actual value:     # CONFIG_EFI is not set

Config: CONFIG_EFI_STUB
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi.cfg /OE/build/oe-core/tmp-glibc/wo=
rk-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cfg/e=
fi.cfg
Requested value:  CONFIG_EFI_STUB=3Dy
Actual value:    =20

Config: CONFIG_EFIVAR_FS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi.cfg /OE/build/oe-core/tmp-glibc/wo=
rk-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cfg/e=
fi.cfg
Requested value:  CONFIG_EFIVAR_FS=3Dy
Actual value:    =20

--
Config: CONFIG_EFI_EARLYCON
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/debug/printk.cfg
Requested value:  CONFIG_EFI_EARLYCON=3Dy
Actual value:    =20

  Config 'EFI' has the following Direct dependencies (=3Dy):
        ACPI(=3Dy)

---------- CONFIG_EFI_STUB -----------------
Config: CONFIG_EFI_STUB
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi.cfg /OE/build/oe-core/tmp-glibc/wo=
rk-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cfg/e=
fi.cfg
Requested value:  CONFIG_EFI_STUB=3Dy
Actual value:    =20

  Config 'EFI_STUB' has the following Direct dependencies (=3Dn):
        EFI(=3Dn) && !X86_USE_3DNOW(=3Dn) (=3Dy)

---------- CONFIG_EFIVAR_FS -----------------
Config: CONFIG_EFIVAR_FS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi.cfg /OE/build/oe-core/tmp-glibc/wo=
rk-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cfg/e=
fi.cfg
Requested value:  CONFIG_EFIVAR_FS=3Dy
Actual value:    =20

No reference to EFIVAR_FS found

---------- CONFIG_HPET_EMULATE_RTC -----------------
Config: CONFIG_HPET_EMULATE_RTC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/timer/hpet.cfg
Requested value:  CONFIG_HPET_EMULATE_RTC=3Dy
Actual value:    =20

No reference to HPET_EMULATE_RTC found

---------- CONFIG_HPET -----------------
Config: CONFIG_HPET_EMULATE_RTC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/timer/hpet.cfg
Requested value:  CONFIG_HPET_EMULATE_RTC=3Dy
Actual value:    =20

Config: CONFIG_HPET
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/timer/hpet.cfg
Requested value:  CONFIG_HPET=3Dy
Actual value:     # CONFIG_HPET is not set

Config: CONFIG_HPET_MMAP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/timer/hpet.cfg
Requested value:  CONFIG_HPET_MMAP=3Dy
Actual value:    =20

  Config 'HPET' has the following Direct dependencies (=3Dy):
        ACPI(=3Dy)

---------- CONFIG_HPET_MMAP -----------------
Config: CONFIG_HPET_MMAP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/timer/hpet.cfg
Requested value:  CONFIG_HPET_MMAP=3Dy
Actual value:    =20

  Config 'HPET_MMAP' has the following Direct dependencies (=3Dn):
        HPET(=3Dn)

---------- CONFIG_X86_MSR -----------------
Config: CONFIG_X86_MSR
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/x86_base.cfg
Requested value:  CONFIG_X86_MSR=3Dy
Actual value:     # CONFIG_X86_MSR is not set

  Config 'X86_MSR' has the following Direct dependencies (=3Dy):
        y

---------- CONFIG_X86_CPUID -----------------
Config: CONFIG_X86_CPUID
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/x86_base.cfg
Requested value:  CONFIG_X86_CPUID=3Dy
Actual value:     # CONFIG_X86_CPUID is not set

No reference to X86_CPUID found

---------- CONFIG_X86_CHECK_BIOS_CORRUPTION -----------------
Config: CONFIG_X86_CHECK_BIOS_CORRUPTION
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/x86_base.cfg
Requested value:  CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
Actual value:     # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set

  Config 'X86_CHECK_BIOS_CORRUPTION' has the following Direct dependencies =
(=3Dy):
        y

---------- CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK -----------------
Config: CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/x86_base.cfg
Requested value:  CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=3Dy
Actual value:    =20

No reference to X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK found

---------- CONFIG_SMP -----------------
Config: CONFIG_SMP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/smp_64.cfg
Requested value:  CONFIG_SMP=3Dy
Actual value:     # CONFIG_SMP is not set

  Config 'SMP' has the following Direct dependencies (=3Dy):
        y

---------- CONFIG_SCHED_SMT -----------------
Config: CONFIG_SCHED_SMT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/smp_64.cfg
Requested value:  CONFIG_SCHED_SMT=3Dy
Actual value:    =20

No reference to SCHED_SMT found

---------- CONFIG_NR_CPUS -----------------
Config: CONFIG_NR_CPUS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc-64/common-pc-64-cpu.cfg /OE/=
build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/c=
onfigs/v5.4/standard/cfg/smp_64.cfg
Requested value:  CONFIG_NR_CPUS=3D64
Actual value:     CONFIG_NR_CPUS=3D1

No reference to NR_CPUS found

---------- CONFIG_IA32_EMULATION -----------------
Config: CONFIG_IA32_EMULATION
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc-64/common-pc-64-cpu.cfg /OE/=
build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/c=
onfigs/v5.4/standard/cfg/x86_64.cfg
Requested value:  CONFIG_IA32_EMULATION=3Dy
Actual value:     # CONFIG_IA32_EMULATION is not set

  Config 'IA32_EMULATION' has the following Direct dependencies (=3Dy):
        X86_64(=3Dy)

---------- CONFIG_COMPAT -----------------
Config: CONFIG_COMPAT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/x86_64.cfg
Requested value:  CONFIG_COMPAT=3Dy
Actual value:    =20

  Config 'COMPAT' has the following Direct dependencies (=3Dn):
        IA32_EMULATION(=3Dn) || X86_X32(=3Dn)

---------- CONFIG_UNWINDER_ORC -----------------
Config: CONFIG_UNWINDER_ORC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/x86_64.cfg
Requested value:  # CONFIG_UNWINDER_ORC is not set
Actual value:     CONFIG_UNWINDER_ORC=3Dy

  Config 'UNWINDER_ORC' has the following Direct dependencies (=3Dy):
        X86_64(=3Dy) && <choice>

---------- CONFIG_UNWINDER_FRAME_POINTER -----------------
Config: CONFIG_UNWINDER_FRAME_POINTER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/x86_64.cfg
Requested value:  CONFIG_UNWINDER_FRAME_POINTER=3Dy
Actual value:     # CONFIG_UNWINDER_FRAME_POINTER is not set

  Config 'UNWINDER_FRAME_POINTER' has the following Direct dependencies (=
=3Dy):
        <choice>

---------- CONFIG_X86_AMD_PLATFORM_DEVICE -----------------
Config: CONFIG_X86_AMD_PLATFORM_DEVICE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/amd.cfg
Requested value:  CONFIG_X86_AMD_PLATFORM_DEVICE=3Dy
Actual value:     # CONFIG_X86_AMD_PLATFORM_DEVICE is not set

No reference to X86_AMD_PLATFORM_DEVICE found

---------- CONFIG_MICROCODE_AMD -----------------
Config: CONFIG_MICROCODE_AMD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/amd.cfg
Requested value:  CONFIG_MICROCODE_AMD=3Dy
Actual value:     # CONFIG_MICROCODE_AMD is not set

No reference to MICROCODE_AMD found

---------- CONFIG_X86_MCE_AMD -----------------
Config: CONFIG_X86_MCE_AMD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/amd.cfg
Requested value:  CONFIG_X86_MCE_AMD=3Dy
Actual value:    =20

  Config 'X86_MCE_AMD' has the following Direct dependencies (=3Dn):
        X86_MCE(=3Dy) && X86_LOCAL_APIC(=3Dy) && AMD_NB(=3Dn)

---------- CONFIG_PCI -----------------
Config: CONFIG_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg /OE/build=
/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/config=
s/v5.4/standard/cfg/efi.cfg /OE/build/oe-core/tmp-glibc/work-shared/qemux86=
-64/kernel-source/.kernel-meta/configs/v5.4/standard/cfg/efi.cfg /OE/build/=
oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs=
/v5.4/standard/features/pci/pci.cfg
Requested value:  CONFIG_PCI=3Dy
Actual value:     # CONFIG_PCI is not set

Config: CONFIG_PCI_MMCONFIG
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/pci/pci.cfg
Requested value:  CONFIG_PCI_MMCONFIG=3Dy
Actual value:    =20

Config: CONFIG_PCI_MSI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/pci/pci.cfg
Requested value:  CONFIG_PCI_MSI=3Dy
Actual value:    =20

Config: CONFIG_PCIEPORTBUS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/pci/pci.cfg
Requested value:  CONFIG_PCIEPORTBUS=3Dy
Actual value:    =20

--
Config: CONFIG_PCI_IOV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/pci-iov/pci-iov.cfg
Requested value:  CONFIG_PCI_IOV=3Dy
Actual value:    =20

  Config 'PCI' has the following Direct dependencies (=3Dy):
        HAVE_PCI(=3Dy)

---------- CONFIG_PCI_MMCONFIG -----------------
Config: CONFIG_PCI_MMCONFIG
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/pci/pci.cfg
Requested value:  CONFIG_PCI_MMCONFIG=3Dy
Actual value:    =20

  Config 'PCI_MMCONFIG' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) && ACPI(=3Dy) || SFI(=3Dn) || JAILHOUSE_GUEST(=3Dn) (=3Dy=
) && X86_64(=3Dy) || PCI_GOANY(=3Dn) || PCI_GOMMCONFIG(=3Dn) (=3Dy)

---------- CONFIG_PCI_MSI -----------------
Config: CONFIG_PCI_MSI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/pci/pci.cfg
Requested value:  CONFIG_PCI_MSI=3Dy
Actual value:    =20

  Config 'PCI_MSI' has the following Direct dependencies (=3Dn):
        PCI(=3Dn)

---------- CONFIG_PCIEPORTBUS -----------------
Config: CONFIG_PCIEPORTBUS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/pci/pci.cfg
Requested value:  CONFIG_PCIEPORTBUS=3Dy
Actual value:    =20

  Config 'PCIEPORTBUS' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) && PCI(=3Dn)

---------- CONFIG_HOTPLUG_PCI -----------------
Config: CONFIG_HOTPLUG_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/pci/pci.cfg
Requested value:  CONFIG_HOTPLUG_PCI=3Dy
Actual value:    =20

  Config 'HOTPLUG_PCI' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) && SYSFS(=3Dy) && PCI(=3Dn)

---------- CONFIG_PCI_IOV -----------------
Config: CONFIG_PCI_IOV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/pci-iov/pci-iov.cfg
Requested value:  CONFIG_PCI_IOV=3Dy
Actual value:    =20

  Config 'PCI_IOV' has the following Direct dependencies (=3Dn):
        PCI(=3Dn)

---------- CONFIG_MMC -----------------
Config: CONFIG_MMC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-base.cfg /OE/build/oe-cor=
e/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/=
standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC=3Dy
Actual value:     # CONFIG_MMC is not set

Config: CONFIG_MMC_SDHCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI=3Dy
Actual value:    =20

Config: CONFIG_MMC_SDHCI_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI_PCI=3Dy
Actual value:    =20

Config: CONFIG_MMC_SDHCI_ACPI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI_ACPI=3Dy
Actual value:    =20

Config: CONFIG_MMC_SDHCI_PLTFM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI_PLTFM=3Dy
Actual value:    =20

Config: CONFIG_MMC_RICOH_MMC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_RICOH_MMC=3Dy
Actual value:    =20

  Config 'MMC' has the following Direct dependencies (=3Dy):
        HAS_IOMEM(=3Dy)

---------- CONFIG_MMC_SDHCI -----------------
Config: CONFIG_MMC_SDHCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI=3Dy
Actual value:    =20

Config: CONFIG_MMC_SDHCI_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI_PCI=3Dy
Actual value:    =20

Config: CONFIG_MMC_SDHCI_ACPI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI_ACPI=3Dy
Actual value:    =20

Config: CONFIG_MMC_SDHCI_PLTFM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI_PLTFM=3Dy
Actual value:    =20

  Config 'MMC_SDHCI' has the following Direct dependencies (=3Dn):
        HAS_DMA(=3Dy) && MMC(=3Dn)

---------- CONFIG_MMC_SDHCI_PCI -----------------
Config: CONFIG_MMC_SDHCI_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI_PCI=3Dy
Actual value:    =20

  Config 'MMC_SDHCI_PCI' has the following Direct dependencies (=3Dn):
        MMC_SDHCI(=3Dn) && PCI(=3Dn) && MMC(=3Dn)

---------- CONFIG_MMC_SDHCI_ACPI -----------------
Config: CONFIG_MMC_SDHCI_ACPI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI_ACPI=3Dy
Actual value:    =20

No reference to MMC_SDHCI_ACPI found

---------- CONFIG_MMC_SDHCI_PLTFM -----------------
Config: CONFIG_MMC_SDHCI_PLTFM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI_PLTFM=3Dy
Actual value:    =20

  Config 'MMC_SDHCI_PLTFM' has the following Direct dependencies (=3Dn):
        MMC_SDHCI(=3Dn) && MMC(=3Dn)

---------- CONFIG_MMC_RICOH_MMC -----------------
Config: CONFIG_MMC_RICOH_MMC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_RICOH_MMC=3Dy
Actual value:    =20

No reference to MMC_RICOH_MMC found

---------- CONFIG_USB_EHCI_HCD -----------------
Config: CONFIG_USB_EHCI_HCD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb/ehci-hcd.cfg
Requested value:  CONFIG_USB_EHCI_HCD=3Dy
Actual value:    =20

  Config 'USB_EHCI_HCD' has the following Direct dependencies (=3Dn):
        HAS_DMA(=3Dy) && HAS_IOMEM(=3Dy) && USB(=3Dn) && USB_SUPPORT(=3Dy)

---------- CONFIG_USB_EHCI_ROOT_HUB_TT -----------------
Config: CONFIG_USB_EHCI_ROOT_HUB_TT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb/ehci-hcd.cfg
Requested value:  CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
Actual value:    =20

  Config 'USB_EHCI_ROOT_HUB_TT' has the following Direct dependencies (=3Dn=
):
        USB_EHCI_HCD(=3Dn) && USB(=3Dn) && USB_SUPPORT(=3Dy)

---------- CONFIG_USB_OHCI_HCD -----------------
Config: CONFIG_USB_OHCI_HCD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb/ohci-hcd.cfg
Requested value:  CONFIG_USB_OHCI_HCD=3Dy
Actual value:    =20

  Config 'USB_OHCI_HCD' has the following Direct dependencies (=3Dn):
        HAS_DMA(=3Dy) && HAS_IOMEM(=3Dy) && USB(=3Dn) && USB_SUPPORT(=3Dy)

---------- CONFIG_USB_XHCI_HCD -----------------
Config: CONFIG_USB_XHCI_HCD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb/xhci-hcd.cfg
Requested value:  CONFIG_USB_XHCI_HCD=3Dy
Actual value:    =20

  Config 'USB_XHCI_HCD' has the following Direct dependencies (=3Dn):
        HAS_DMA(=3Dy) && HAS_IOMEM(=3Dy) && USB(=3Dn) && USB_SUPPORT(=3Dy)

---------- CONFIG_INPUT_TOUCHSCREEN -----------------
Config: CONFIG_INPUT_TOUCHSCREEN
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/input/touchscreen.cfg
Requested value:  CONFIG_INPUT_TOUCHSCREEN=3Dy
Actual value:     # CONFIG_INPUT_TOUCHSCREEN is not set

  Config 'INPUT_TOUCHSCREEN' has the following Direct dependencies (=3Dy):
        INPUT(=3Dy) && !UML(undefined/n) (=3Dy)

---------- CONFIG_TOUCHSCREEN_USB_COMPOSITE -----------------
Config: CONFIG_TOUCHSCREEN_USB_COMPOSITE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb/touchscreen-composite.cfg
Requested value:  CONFIG_TOUCHSCREEN_USB_COMPOSITE=3Dm
Actual value:    =20

  Config 'TOUCHSCREEN_USB_COMPOSITE' has the following Direct dependencies =
(=3Dn):
        USB_ARCH_HAS_HCD(=3Dy) && INPUT_TOUCHSCREEN(=3Dn) && INPUT(=3Dy) &&=
 !UML(undefined/n) (=3Dy)

---------- CONFIG_USB_USBNET -----------------
Config: CONFIG_USB_USBNET
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_USBNET=3Dm
Actual value:    =20

  Config 'USB_USBNET' has the following Direct dependencies (=3Dn):
        USB_NET_DRIVERS(=3Dn) && NETDEVICES(=3Dn)

---------- CONFIG_USB_NET_DRIVERS -----------------
Config: CONFIG_USB_NET_DRIVERS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_DRIVERS=3Dm
Actual value:    =20

  Config 'USB_NET_DRIVERS' has the following Direct dependencies (=3Dn):
        USB(=3Dn) && NET(=3Dn) && NETDEVICES(=3Dn)

---------- CONFIG_USB_KAWETH -----------------
Config: CONFIG_USB_KAWETH
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_KAWETH=3Dm
Actual value:    =20

No reference to USB_KAWETH found

---------- CONFIG_USB_PEGASUS -----------------
Config: CONFIG_USB_PEGASUS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_PEGASUS=3Dm
Actual value:    =20

No reference to USB_PEGASUS found

---------- CONFIG_USB_RTL8150 -----------------
Config: CONFIG_USB_RTL8150
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_RTL8150=3Dm
Actual value:    =20

No reference to USB_RTL8150 found

---------- CONFIG_USB_RTL8152 -----------------
Config: CONFIG_USB_RTL8152
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_RTL8152=3Dm
Actual value:    =20

No reference to USB_RTL8152 found

---------- CONFIG_USB_NET_AX8817X -----------------
Config: CONFIG_USB_NET_AX8817X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_AX8817X=3Dm
Actual value:    =20

No reference to USB_NET_AX8817X found

---------- CONFIG_USB_NET_AX88179_178A -----------------
Config: CONFIG_USB_NET_AX88179_178A
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_AX88179_178A=3Dm
Actual value:    =20

No reference to USB_NET_AX88179_178A found

---------- CONFIG_USB_NET_CDCETHER -----------------
Config: CONFIG_USB_NET_CDCETHER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_CDCETHER=3Dm
Actual value:    =20

  Config 'USB_NET_CDCETHER' has the following Direct dependencies (=3Dn):
        USB_USBNET(=3Dn) && USB_NET_DRIVERS(=3Dn) && NETDEVICES(=3Dn)

---------- CONFIG_USB_NET_CDC_EEM -----------------
Config: CONFIG_USB_NET_CDC_EEM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_CDC_EEM=3Dm
Actual value:    =20

No reference to USB_NET_CDC_EEM found

---------- CONFIG_USB_NET_CDC_NCM -----------------
Config: CONFIG_USB_NET_CDC_NCM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_CDC_NCM=3Dm
Actual value:    =20

  Config 'USB_NET_CDC_NCM' has the following Direct dependencies (=3Dn):
        USB_USBNET(=3Dn) && USB_NET_DRIVERS(=3Dn) && NETDEVICES(=3Dn)

---------- CONFIG_USB_NET_DM9601 -----------------
Config: CONFIG_USB_NET_DM9601
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_DM9601=3Dm
Actual value:    =20

No reference to USB_NET_DM9601 found

---------- CONFIG_USB_NET_SMSC75XX -----------------
Config: CONFIG_USB_NET_SMSC75XX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_SMSC75XX=3Dm
Actual value:    =20

No reference to USB_NET_SMSC75XX found

---------- CONFIG_USB_NET_SMSC95XX -----------------
Config: CONFIG_USB_NET_SMSC95XX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_SMSC95XX=3Dm
Actual value:    =20

No reference to USB_NET_SMSC95XX found

---------- CONFIG_USB_NET_MCS7830 -----------------
Config: CONFIG_USB_NET_MCS7830
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_MCS7830=3Dm
Actual value:    =20

No reference to USB_NET_MCS7830 found

---------- CONFIG_USB_NET_RNDIS_HOST -----------------
Config: CONFIG_USB_NET_RNDIS_HOST
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_RNDIS_HOST=3Dm
Actual value:    =20

  Config 'USB_NET_RNDIS_HOST' has the following Direct dependencies (=3Dn):
        USB_USBNET(=3Dn) && USB_NET_DRIVERS(=3Dn) && NETDEVICES(=3Dn)

---------- CONFIG_USB_NET_CDC_SUBSET_ENABLE -----------------
Config: CONFIG_USB_NET_CDC_SUBSET_ENABLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_CDC_SUBSET_ENABLE=3Dm
Actual value:    =20

  Config 'USB_NET_CDC_SUBSET_ENABLE' has the following Direct dependencies =
(=3Dn):
        USB_NET_CDC_SUBSET(=3Dn) && USB_NET_DRIVERS(=3Dn) && NETDEVICES(=3D=
n)

---------- CONFIG_USB_NET_CDC_SUBSET -----------------
Config: CONFIG_USB_NET_CDC_SUBSET_ENABLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_CDC_SUBSET_ENABLE=3Dm
Actual value:    =20

Config: CONFIG_USB_NET_CDC_SUBSET
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_CDC_SUBSET=3Dm
Actual value:    =20

  Config 'USB_NET_CDC_SUBSET' has the following Direct dependencies (=3Dn):
        USB_USBNET(=3Dn) && USB_NET_DRIVERS(=3Dn) && NETDEVICES(=3Dn)

---------- CONFIG_USB_ALI_M5632 -----------------
Config: CONFIG_USB_ALI_M5632
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_ALI_M5632=3Dy
Actual value:    =20

No reference to USB_ALI_M5632 found

---------- CONFIG_USB_AN2720 -----------------
Config: CONFIG_USB_AN2720
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_AN2720=3Dy
Actual value:    =20

No reference to USB_AN2720 found

---------- CONFIG_USB_BELKIN -----------------
Config: CONFIG_USB_BELKIN
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_BELKIN=3Dy
Actual value:    =20

No reference to USB_BELKIN found

---------- CONFIG_USB_ARMLINUX -----------------
Config: CONFIG_USB_ARMLINUX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_ARMLINUX=3Dy
Actual value:    =20

No reference to USB_ARMLINUX found

---------- CONFIG_USB_KC2190 -----------------
Config: CONFIG_USB_KC2190
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_KC2190=3Dy
Actual value:    =20

No reference to USB_KC2190 found

---------- CONFIG_E100 -----------------
Config: CONFIG_E100
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg /OE/build/=
oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs=
/v5.4/standard/features/intel-e1xxxx/intel-e100.cfg /OE/build/oe-core/tmp-g=
libc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standar=
d/features/intel-e1xxxx/intel-e1xxxx.cfg
Requested value:  CONFIG_E100=3Dy
Actual value:    =20

Config: CONFIG_E1000E
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg /OE/build/=
oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs=
/v5.4/standard/features/intel-e1xxxx/intel-e1xxxx.cfg
Requested value:  CONFIG_E1000E=3Dy
Actual value:    =20

Config: CONFIG_E1000
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg /OE/build/=
oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs=
/v5.4/standard/features/intel-e1xxxx/intel-e1xxxx.cfg
Requested value:  CONFIG_E1000=3Dy
Actual value:    =20

No reference to E100 found

---------- CONFIG_E1000E -----------------
Config: CONFIG_E1000E
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg /OE/build/=
oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs=
/v5.4/standard/features/intel-e1xxxx/intel-e1xxxx.cfg
Requested value:  CONFIG_E1000E=3Dy
Actual value:    =20

  Config 'E1000E' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) && !SPARC32(undefined/n) || BROKEN(=3Dn) (=3Dy) && NET_VE=
NDOR_INTEL(=3Dn) && ETHERNET(=3Dn) && NETDEVICES(=3Dn)

---------- CONFIG_E1000 -----------------
Config: CONFIG_E1000E
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg /OE/build/=
oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs=
/v5.4/standard/features/intel-e1xxxx/intel-e1xxxx.cfg
Requested value:  CONFIG_E1000E=3Dy
Actual value:    =20

Config: CONFIG_E1000
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg /OE/build/=
oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs=
/v5.4/standard/features/intel-e1xxxx/intel-e1xxxx.cfg
Requested value:  CONFIG_E1000=3Dy
Actual value:    =20

No reference to E1000 found

---------- CONFIG_IGB -----------------
Config: CONFIG_IGB
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/igb/igb.cfg
Requested value:  CONFIG_IGB=3Dy
Actual value:    =20

Config: CONFIG_IGBVF
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/igb/igb.cfg
Requested value:  CONFIG_IGBVF=3Dm
Actual value:    =20

  Config 'IGB' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) && NET_VENDOR_INTEL(=3Dn) && ETHERNET(=3Dn) && NETDEVICES=
(=3Dn)

---------- CONFIG_IGBVF -----------------
Config: CONFIG_IGBVF
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/igb/igb.cfg
Requested value:  CONFIG_IGBVF=3Dm
Actual value:    =20

No reference to IGBVF found

---------- CONFIG_IRQ_REMAP -----------------
Config: CONFIG_IRQ_REMAP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/x2apic/x2apic.cfg
Requested value:  CONFIG_IRQ_REMAP=3Dy
Actual value:    =20

  Config 'IRQ_REMAP' has the following Direct dependencies (=3Dn):
        X86_64(=3Dy) && X86_IO_APIC(=3Dy) && PCI_MSI(=3Dn) && ACPI(=3Dy) &&=
 IOMMU_SUPPORT(=3Dy)

---------- CONFIG_X86_X2APIC -----------------
Config: CONFIG_X86_X2APIC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/x2apic/x2apic.cfg
Requested value:  CONFIG_X86_X2APIC=3Dy
Actual value:    =20

  Config 'X86_X2APIC' has the following Direct dependencies (=3Dn):
        X86_LOCAL_APIC(=3Dy) && X86_64(=3Dy) && IRQ_REMAP(=3Dn) || HYPERVIS=
OR_GUEST(=3Dn) (=3Dn)

---------- CONFIG_ISDN -----------------
Config: CONFIG_ISDN
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_ISDN=3Dy
Actual value:    =20

Config: CONFIG_ISDN_CAPI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_ISDN_CAPI=3Dm
Actual value:    =20

  Config 'ISDN' has the following Direct dependencies (=3Dn):
        NET(=3Dn) && NETDEVICES(=3Dn) && !S390(undefined/n) (=3Dy) && !UML(=
undefined/n) (=3Dy)

---------- CONFIG_ISDN_CAPI -----------------
Config: CONFIG_ISDN_CAPI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_ISDN_CAPI=3Dm
Actual value:    =20

  Config 'ISDN_CAPI' has the following Direct dependencies (=3Dn):
        ISDN(=3Dn)

---------- CONFIG_BT_6LOWPAN -----------------
Config: CONFIG_BT_6LOWPAN
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_6LOWPAN=3Dm
Actual value:    =20

No reference to BT_6LOWPAN found

---------- CONFIG_BT_RFCOMM -----------------
Config: CONFIG_BT_RFCOMM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_RFCOMM=3Dm
Actual value:    =20

Config: CONFIG_BT_RFCOMM_TTY
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_RFCOMM_TTY=3Dy
Actual value:    =20

  Config 'BT_RFCOMM' has the following Direct dependencies (=3Dn):
        BT_BREDR(=3Dn) && NET(=3Dn)

---------- CONFIG_BT_RFCOMM_TTY -----------------
Config: CONFIG_BT_RFCOMM_TTY
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_RFCOMM_TTY=3Dy
Actual value:    =20

No reference to BT_RFCOMM_TTY found

---------- CONFIG_BT_BNEP -----------------
Config: CONFIG_BT_BNEP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_BNEP=3Dm
Actual value:    =20

Config: CONFIG_BT_BNEP_MC_FILTER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_BNEP_MC_FILTER=3Dy
Actual value:    =20

Config: CONFIG_BT_BNEP_PROTO_FILTER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_BNEP_PROTO_FILTER=3Dy
Actual value:    =20

  Config 'BT_BNEP' has the following Direct dependencies (=3Dn):
        BT_BREDR(=3Dn) && NET(=3Dn)

---------- CONFIG_BT_BNEP_MC_FILTER -----------------
Config: CONFIG_BT_BNEP_MC_FILTER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_BNEP_MC_FILTER=3Dy
Actual value:    =20

No reference to BT_BNEP_MC_FILTER found

---------- CONFIG_BT_BNEP_PROTO_FILTER -----------------
Config: CONFIG_BT_BNEP_PROTO_FILTER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_BNEP_PROTO_FILTER=3Dy
Actual value:    =20

No reference to BT_BNEP_PROTO_FILTER found

---------- CONFIG_BT_CMTP -----------------
Config: CONFIG_BT_CMTP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_CMTP=3Dm
Actual value:    =20

No reference to BT_CMTP found

---------- CONFIG_BT_HIDP -----------------
Config: CONFIG_BT_HIDP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_HIDP=3Dm
Actual value:    =20

No reference to BT_HIDP found

---------- CONFIG_BT_LE -----------------
Config: CONFIG_BT_LE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_LE=3Dy
Actual value:    =20

  Config 'BT_LE' has the following Direct dependencies (=3Dn):
        BT(=3Dn) && NET(=3Dn)

---------- CONFIG_BT_BREDR -----------------
Config: CONFIG_BT_BREDR
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_BREDR=3Dy
Actual value:    =20

  Config 'BT_BREDR' has the following Direct dependencies (=3Dn):
        BT(=3Dn) && NET(=3Dn)

---------- CONFIG_6LOWPAN -----------------
Config: CONFIG_6LOWPAN
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/6lowpan/6lowpan.cfg
Requested value:  CONFIG_6LOWPAN=3Dm
Actual value:    =20

  Config '6LOWPAN' has the following Direct dependencies (=3Dn):
        IPV6(=3Dn) && NET(=3Dn)

---------- CONFIG_SERIAL_8250 -----------------
Config: CONFIG_SERIAL_8250_PNP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_SERIAL_8250_PNP=3Dy
Actual value:    =20

--
Config: CONFIG_SERIAL_8250
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg /OE/bu=
ild/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/con=
figs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_8250=3Dy
Actual value:     # CONFIG_SERIAL_8250 is not set

Config: CONFIG_SERIAL_8250_CONSOLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg /OE/bu=
ild/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/con=
figs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_8250_CONSOLE=3Dy
Actual value:    =20

Config: CONFIG_SERIAL_8250_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg /OE/bu=
ild/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/con=
figs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_8250_PCI=3Dy
Actual value:    =20

Config: CONFIG_SERIAL_8250_NR_UARTS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_8250_NR_UARTS=3D4
Actual value:    =20

Config: CONFIG_SERIAL_8250_RUNTIME_UARTS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
Actual value:    =20

  Config 'SERIAL_8250' has the following Direct dependencies (=3Dy):
        !S390(undefined/n) (=3Dy) && HAS_IOMEM(=3Dy) && TTY(=3Dy)

---------- CONFIG_SERIAL_8250_CONSOLE -----------------
Config: CONFIG_SERIAL_8250_CONSOLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg /OE/bu=
ild/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/con=
figs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_8250_CONSOLE=3Dy
Actual value:    =20

  Config 'SERIAL_8250_CONSOLE' has the following Direct dependencies (=3Dn):
        SERIAL_8250(=3Dn) =3D y (=3Dn) && HAS_IOMEM(=3Dy) && TTY(=3Dy)

---------- CONFIG_SERIAL_8250_PCI -----------------
Config: CONFIG_SERIAL_8250_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg /OE/bu=
ild/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/con=
figs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_8250_PCI=3Dy
Actual value:    =20

  Config 'SERIAL_8250_PCI' has the following Direct dependencies (=3Dn):
        SERIAL_8250(=3Dn) && PCI(=3Dn) && HAS_IOMEM(=3Dy) && TTY(=3Dy)

---------- CONFIG_SERIAL_8250_NR_UARTS -----------------
Config: CONFIG_SERIAL_8250_NR_UARTS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_8250_NR_UARTS=3D4
Actual value:    =20

  Config 'SERIAL_8250_NR_UARTS' has the following Direct dependencies (=3Dn=
):
        SERIAL_8250(=3Dn) && HAS_IOMEM(=3Dy) && TTY(=3Dy)

---------- CONFIG_SERIAL_8250_RUNTIME_UARTS -----------------
Config: CONFIG_SERIAL_8250_RUNTIME_UARTS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
Actual value:    =20

No reference to SERIAL_8250_RUNTIME_UARTS found

---------- CONFIG_SERIAL_CORE -----------------
Config: CONFIG_SERIAL_CORE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_CORE=3Dy
Actual value:    =20

Config: CONFIG_SERIAL_CORE_CONSOLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_CORE_CONSOLE=3Dy
Actual value:    =20

  Config 'SERIAL_CORE' has the following Direct dependencies (=3Dy):
        HAS_IOMEM(=3Dy) && TTY(=3Dy)

---------- CONFIG_SERIAL_CORE_CONSOLE -----------------
Config: CONFIG_SERIAL_CORE_CONSOLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_CORE_CONSOLE=3Dy
Actual value:    =20

  Config 'SERIAL_CORE_CONSOLE' has the following Direct dependencies (=3Dy):
        HAS_IOMEM(=3Dy) && TTY(=3Dy)

---------- CONFIG_AGP -----------------
Config: CONFIG_AGP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg
Requested value:  CONFIG_AGP=3Dy
Actual value:    =20

Config: CONFIG_AGP_INTEL
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg
Requested value:  CONFIG_AGP_INTEL=3Dy
Actual value:    =20

  Config 'AGP' has the following Direct dependencies (=3Dn):
        ALPHA(undefined/n) || IA64(undefined/n) || PARISC(undefined/n) || P=
PC(undefined/n) || X86(=3Dy) (=3Dy) && PCI(=3Dn) && HAS_IOMEM(=3Dy)

---------- CONFIG_AGP_INTEL -----------------
Config: CONFIG_AGP_INTEL
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg
Requested value:  CONFIG_AGP_INTEL=3Dy
Actual value:    =20

  Config 'AGP_INTEL' has the following Direct dependencies (=3Dn):
        AGP(=3Dn) && X86(=3Dy) && HAS_IOMEM(=3Dy)

---------- CONFIG_DRM_I915 -----------------
Config: CONFIG_DRM_I915
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg
Requested value:  CONFIG_DRM_I915=3Dm
Actual value:    =20

Config: CONFIG_DRM_I915_ALPHA_SUPPORT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg
Requested value:  CONFIG_DRM_I915_ALPHA_SUPPORT=3Dy
Actual value:    =20

  Config 'DRM_I915' has the following Direct dependencies (=3Dn):
        DRM(=3Dn) && X86(=3Dy) && PCI(=3Dn) && HAS_IOMEM(=3Dy)

---------- CONFIG_DRM_I915_ALPHA_SUPPORT -----------------
Config: CONFIG_DRM_I915_ALPHA_SUPPORT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg
Requested value:  CONFIG_DRM_I915_ALPHA_SUPPORT=3Dy
Actual value:    =20

  Config 'DRM_I915_ALPHA_SUPPORT' has the following Direct dependencies (=
=3Dn):
        DRM_I915(=3Dn) && HAS_IOMEM(=3Dy)

---------- CONFIG_BLK_DEV_SD -----------------
Config: CONFIG_BLK_DEV_SD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/scsi/disk.cfg
Requested value:  CONFIG_BLK_DEV_SD=3Dy
Actual value:    =20

No reference to BLK_DEV_SD found

---------- CONFIG_USB_VIDEO_CLASS -----------------
Config: CONFIG_USB_VIDEO_CLASS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_VIDEO_CLASS=3Dm
Actual value:    =20

Config: CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=3Dy
Actual value:    =20

  Config 'USB_VIDEO_CLASS' has the following Direct dependencies (=3Dn):
        VIDEO_V4L2(=3Dn) && MEDIA_CAMERA_SUPPORT(=3Dn) && MEDIA_USB_SUPPORT=
(=3Dn) && USB(=3Dn) && MEDIA_SUPPORT(=3Dn) && MEDIA_SUPPORT(=3Dn)

---------- CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV -----------------
Config: CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=3Dy
Actual value:    =20

No reference to USB_VIDEO_CLASS_INPUT_EVDEV found

---------- CONFIG_USB_GSPCA -----------------
Config: CONFIG_USB_GSPCA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA=3Dm
Actual value:    =20

--
Config: CONFIG_USB_GSPCA_BENQ
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_BENQ=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_CONEX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_CONEX=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_CPIA1
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_CPIA1=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_ETOMS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_ETOMS=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_FINEPIX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_FINEPIX=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_JEILINJ
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_JEILINJ=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_JL2005BCD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_JL2005BCD=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_KINECT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_KINECT=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_KONICA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_KONICA=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_MARS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_MARS=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_MR97310A
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_MR97310A=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_NW80X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_NW80X=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_OV519
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_OV519=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_OV534
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_OV534=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_OV534_9
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_OV534_9=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_PAC207
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_PAC207=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_PAC7302
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_PAC7302=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_PAC7311
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_PAC7311=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SE401
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SE401=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SN9C2028
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SN9C2028=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SN9C20X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SN9C20X=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SONIXB
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SONIXB=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SONIXJ
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SONIXJ=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SPCA500
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA500=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SPCA501
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA501=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SPCA505
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA505=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SPCA506
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA506=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SPCA508
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA508=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SPCA561
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA561=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SPCA1528
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA1528=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SQ905
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SQ905=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SQ905C
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SQ905C=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SQ930X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SQ930X=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_STK014
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_STK014=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_STV0680
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_STV0680=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SUNPLUS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SUNPLUS=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_T613
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_T613=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_TOPRO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_TOPRO=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_TV8532
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_TV8532=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_VC032X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_VC032X=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_VICAM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_VICAM=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_XIRLINK_CIT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_XIRLINK_CIT=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_ZC3XX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_ZC3XX=3Dm
Actual value:    =20

  Config 'USB_GSPCA' has the following Direct dependencies (=3Dn):
        VIDEO_V4L2(=3Dn) && INPUT(=3Dy) || INPUT(=3Dy) =3D n (=3Dy) && MEDI=
A_CAMERA_SUPPORT(=3Dn) && MEDIA_USB_SUPPORT(=3Dn) && USB(=3Dn) && MEDIA_SUP=
PORT(=3Dn) && MEDIA_SUPPORT(=3Dn)

---------- CONFIG_USB_M5602 -----------------
Config: CONFIG_USB_M5602
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_M5602=3Dm
Actual value:    =20

No reference to USB_M5602 found

---------- CONFIG_USB_STV06XX -----------------
Config: CONFIG_USB_STV06XX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_STV06XX=3Dm
Actual value:    =20

No reference to USB_STV06XX found

---------- CONFIG_USB_GL860 -----------------
Config: CONFIG_USB_GL860
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GL860=3Dm
Actual value:    =20

No reference to USB_GL860 found

---------- CONFIG_USB_GSPCA_BENQ -----------------
Config: CONFIG_USB_GSPCA_BENQ
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_BENQ=3Dm
Actual value:    =20

No reference to USB_GSPCA_BENQ found

---------- CONFIG_USB_GSPCA_CONEX -----------------
Config: CONFIG_USB_GSPCA_CONEX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_CONEX=3Dm
Actual value:    =20

No reference to USB_GSPCA_CONEX found

---------- CONFIG_USB_GSPCA_CPIA1 -----------------
Config: CONFIG_USB_GSPCA_CPIA1
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_CPIA1=3Dm
Actual value:    =20

No reference to USB_GSPCA_CPIA1 found

---------- CONFIG_USB_GSPCA_ETOMS -----------------
Config: CONFIG_USB_GSPCA_ETOMS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_ETOMS=3Dm
Actual value:    =20

No reference to USB_GSPCA_ETOMS found

---------- CONFIG_USB_GSPCA_FINEPIX -----------------
Config: CONFIG_USB_GSPCA_FINEPIX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_FINEPIX=3Dm
Actual value:    =20

No reference to USB_GSPCA_FINEPIX found

---------- CONFIG_USB_GSPCA_JEILINJ -----------------
Config: CONFIG_USB_GSPCA_JEILINJ
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_JEILINJ=3Dm
Actual value:    =20

No reference to USB_GSPCA_JEILINJ found

---------- CONFIG_USB_GSPCA_JL2005BCD -----------------
Config: CONFIG_USB_GSPCA_JL2005BCD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_JL2005BCD=3Dm
Actual value:    =20

No reference to USB_GSPCA_JL2005BCD found

---------- CONFIG_USB_GSPCA_KINECT -----------------
Config: CONFIG_USB_GSPCA_KINECT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_KINECT=3Dm
Actual value:    =20

No reference to USB_GSPCA_KINECT found

---------- CONFIG_USB_GSPCA_KONICA -----------------
Config: CONFIG_USB_GSPCA_KONICA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_KONICA=3Dm
Actual value:    =20

No reference to USB_GSPCA_KONICA found

---------- CONFIG_USB_GSPCA_MARS -----------------
Config: CONFIG_USB_GSPCA_MARS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_MARS=3Dm
Actual value:    =20

No reference to USB_GSPCA_MARS found

---------- CONFIG_USB_GSPCA_MR97310A -----------------
Config: CONFIG_USB_GSPCA_MR97310A
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_MR97310A=3Dm
Actual value:    =20

No reference to USB_GSPCA_MR97310A found

---------- CONFIG_USB_GSPCA_NW80X -----------------
Config: CONFIG_USB_GSPCA_NW80X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_NW80X=3Dm
Actual value:    =20

No reference to USB_GSPCA_NW80X found

---------- CONFIG_USB_GSPCA_OV519 -----------------
Config: CONFIG_USB_GSPCA_OV519
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_OV519=3Dm
Actual value:    =20

No reference to USB_GSPCA_OV519 found

---------- CONFIG_USB_GSPCA_OV534 -----------------
Config: CONFIG_USB_GSPCA_OV534
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_OV534=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_OV534_9
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_OV534_9=3Dm
Actual value:    =20

No reference to USB_GSPCA_OV534 found

---------- CONFIG_USB_GSPCA_OV534_9 -----------------
Config: CONFIG_USB_GSPCA_OV534_9
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_OV534_9=3Dm
Actual value:    =20

No reference to USB_GSPCA_OV534_9 found

---------- CONFIG_USB_GSPCA_PAC207 -----------------
Config: CONFIG_USB_GSPCA_PAC207
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_PAC207=3Dm
Actual value:    =20

No reference to USB_GSPCA_PAC207 found

---------- CONFIG_USB_GSPCA_PAC7302 -----------------
Config: CONFIG_USB_GSPCA_PAC7302
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_PAC7302=3Dm
Actual value:    =20

No reference to USB_GSPCA_PAC7302 found

---------- CONFIG_USB_GSPCA_PAC7311 -----------------
Config: CONFIG_USB_GSPCA_PAC7311
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_PAC7311=3Dm
Actual value:    =20

No reference to USB_GSPCA_PAC7311 found

---------- CONFIG_USB_GSPCA_SE401 -----------------
Config: CONFIG_USB_GSPCA_SE401
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SE401=3Dm
Actual value:    =20

No reference to USB_GSPCA_SE401 found

---------- CONFIG_USB_GSPCA_SN9C2028 -----------------
Config: CONFIG_USB_GSPCA_SN9C2028
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SN9C2028=3Dm
Actual value:    =20

No reference to USB_GSPCA_SN9C2028 found

---------- CONFIG_USB_GSPCA_SN9C20X -----------------
Config: CONFIG_USB_GSPCA_SN9C20X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SN9C20X=3Dm
Actual value:    =20

No reference to USB_GSPCA_SN9C20X found

---------- CONFIG_USB_GSPCA_SONIXB -----------------
Config: CONFIG_USB_GSPCA_SONIXB
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SONIXB=3Dm
Actual value:    =20

No reference to USB_GSPCA_SONIXB found

---------- CONFIG_USB_GSPCA_SONIXJ -----------------
Config: CONFIG_USB_GSPCA_SONIXJ
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SONIXJ=3Dm
Actual value:    =20

No reference to USB_GSPCA_SONIXJ found

---------- CONFIG_USB_GSPCA_SPCA500 -----------------
Config: CONFIG_USB_GSPCA_SPCA500
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA500=3Dm
Actual value:    =20

No reference to USB_GSPCA_SPCA500 found

---------- CONFIG_USB_GSPCA_SPCA501 -----------------
Config: CONFIG_USB_GSPCA_SPCA501
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA501=3Dm
Actual value:    =20

No reference to USB_GSPCA_SPCA501 found

---------- CONFIG_USB_GSPCA_SPCA505 -----------------
Config: CONFIG_USB_GSPCA_SPCA505
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA505=3Dm
Actual value:    =20

No reference to USB_GSPCA_SPCA505 found

---------- CONFIG_USB_GSPCA_SPCA506 -----------------
Config: CONFIG_USB_GSPCA_SPCA506
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA506=3Dm
Actual value:    =20

No reference to USB_GSPCA_SPCA506 found

---------- CONFIG_USB_GSPCA_SPCA508 -----------------
Config: CONFIG_USB_GSPCA_SPCA508
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA508=3Dm
Actual value:    =20

No reference to USB_GSPCA_SPCA508 found

---------- CONFIG_USB_GSPCA_SPCA561 -----------------
Config: CONFIG_USB_GSPCA_SPCA561
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA561=3Dm
Actual value:    =20

No reference to USB_GSPCA_SPCA561 found

---------- CONFIG_USB_GSPCA_SPCA1528 -----------------
Config: CONFIG_USB_GSPCA_SPCA1528
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA1528=3Dm
Actual value:    =20

No reference to USB_GSPCA_SPCA1528 found

---------- CONFIG_USB_GSPCA_SQ905 -----------------
Config: CONFIG_USB_GSPCA_SQ905
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SQ905=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SQ905C
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SQ905C=3Dm
Actual value:    =20

No reference to USB_GSPCA_SQ905 found

---------- CONFIG_USB_GSPCA_SQ905C -----------------
Config: CONFIG_USB_GSPCA_SQ905C
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SQ905C=3Dm
Actual value:    =20

No reference to USB_GSPCA_SQ905C found

---------- CONFIG_USB_GSPCA_SQ930X -----------------
Config: CONFIG_USB_GSPCA_SQ930X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SQ930X=3Dm
Actual value:    =20

No reference to USB_GSPCA_SQ930X found

---------- CONFIG_USB_GSPCA_STK014 -----------------
Config: CONFIG_USB_GSPCA_STK014
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_STK014=3Dm
Actual value:    =20

No reference to USB_GSPCA_STK014 found

---------- CONFIG_USB_GSPCA_STV0680 -----------------
Config: CONFIG_USB_GSPCA_STV0680
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_STV0680=3Dm
Actual value:    =20

No reference to USB_GSPCA_STV0680 found

---------- CONFIG_USB_GSPCA_SUNPLUS -----------------
Config: CONFIG_USB_GSPCA_SUNPLUS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SUNPLUS=3Dm
Actual value:    =20

No reference to USB_GSPCA_SUNPLUS found

---------- CONFIG_USB_GSPCA_T613 -----------------
Config: CONFIG_USB_GSPCA_T613
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_T613=3Dm
Actual value:    =20

No reference to USB_GSPCA_T613 found

---------- CONFIG_USB_GSPCA_TOPRO -----------------
Config: CONFIG_USB_GSPCA_TOPRO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_TOPRO=3Dm
Actual value:    =20

No reference to USB_GSPCA_TOPRO found

---------- CONFIG_USB_GSPCA_TV8532 -----------------
Config: CONFIG_USB_GSPCA_TV8532
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_TV8532=3Dm
Actual value:    =20

No reference to USB_GSPCA_TV8532 found

---------- CONFIG_USB_GSPCA_VC032X -----------------
Config: CONFIG_USB_GSPCA_VC032X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_VC032X=3Dm
Actual value:    =20

No reference to USB_GSPCA_VC032X found

---------- CONFIG_USB_GSPCA_VICAM -----------------
Config: CONFIG_USB_GSPCA_VICAM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_VICAM=3Dm
Actual value:    =20

No reference to USB_GSPCA_VICAM found

---------- CONFIG_USB_GSPCA_XIRLINK_CIT -----------------
Config: CONFIG_USB_GSPCA_XIRLINK_CIT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_XIRLINK_CIT=3Dm
Actual value:    =20

No reference to USB_GSPCA_XIRLINK_CIT found

---------- CONFIG_USB_GSPCA_ZC3XX -----------------
Config: CONFIG_USB_GSPCA_ZC3XX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_ZC3XX=3Dm
Actual value:    =20

No reference to USB_GSPCA_ZC3XX found

---------- CONFIG_USB_PWC -----------------
Config: CONFIG_USB_PWC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_PWC=3Dm
Actual value:    =20

Config: CONFIG_USB_PWC_INPUT_EVDEV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_PWC_INPUT_EVDEV=3Dy
Actual value:    =20

  Config 'USB_PWC' has the following Direct dependencies (=3Dn):
        VIDEO_V4L2(=3Dn) && MEDIA_CAMERA_SUPPORT(=3Dn) && MEDIA_USB_SUPPORT=
(=3Dn) && USB(=3Dn) && MEDIA_SUPPORT(=3Dn) && MEDIA_SUPPORT(=3Dn)

---------- CONFIG_USB_PWC_INPUT_EVDEV -----------------
Config: CONFIG_USB_PWC_INPUT_EVDEV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_PWC_INPUT_EVDEV=3Dy
Actual value:    =20

No reference to USB_PWC_INPUT_EVDEV found

---------- CONFIG_VIDEO_CPIA2 -----------------
Config: CONFIG_VIDEO_CPIA2
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_VIDEO_CPIA2=3Dm
Actual value:    =20

No reference to VIDEO_CPIA2 found

---------- CONFIG_USB_STKWEBCAM -----------------
Config: CONFIG_USB_STKWEBCAM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_STKWEBCAM=3Dm
Actual value:    =20

No reference to USB_STKWEBCAM found

---------- CONFIG_USB_S2255 -----------------
Config: CONFIG_USB_S2255
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_S2255=3Dm
Actual value:    =20

No reference to USB_S2255 found

---------- CONFIG_SND_PCI -----------------
Config: CONFIG_SND_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_PCI=3Dy
Actual value:    =20

  Config 'SND_PCI' has the following Direct dependencies (=3Dn):
        PCI(=3Dn) && SND(=3Dn) && !UML(undefined/n) (=3Dy) && SOUND(=3Dn)

---------- CONFIG_SND_HDA_INTEL -----------------
Config: CONFIG_SND_HDA_INTEL
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_INTEL=3Dm
Actual value:    =20

  Config 'SND_HDA_INTEL' has the following Direct dependencies (=3Dn):
        SND_PCI(=3Dn) && SND(=3Dn) && !UML(undefined/n) (=3Dy) && SOUND(=3D=
n)

---------- CONFIG_SND_HDA_GENERIC -----------------
Config: CONFIG_SND_HDA_GENERIC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_GENERIC=3Dm
Actual value:    =20

  Config 'SND_HDA_GENERIC' has the following Direct dependencies (=3Dn):
        SND_HDA(=3Dn) && SND(=3Dn) && !UML(undefined/n) (=3Dy) && SOUND(=3D=
n)

---------- CONFIG_SND_HDA_CODEC_HDMI -----------------
Config: CONFIG_SND_HDA_CODEC_HDMI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_HDMI=3Dm
Actual value:    =20

  Config 'SND_HDA_CODEC_HDMI' has the following Direct dependencies (=3Dn):
        SND_HDA(=3Dn) && SND(=3Dn) && !UML(undefined/n) (=3Dy) && SOUND(=3D=
n)

---------- CONFIG_SND_HDA_CODEC_ANALOG -----------------
Config: CONFIG_SND_HDA_CODEC_ANALOG
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_ANALOG=3Dm
Actual value:    =20

  Config 'SND_HDA_CODEC_ANALOG' has the following Direct dependencies (=3Dn=
):
        SND_HDA(=3Dn) && SND(=3Dn) && !UML(undefined/n) (=3Dy) && SOUND(=3D=
n)

---------- CONFIG_SND_HDA_CODEC_REALTEK -----------------
Config: CONFIG_SND_HDA_CODEC_REALTEK
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_REALTEK=3Dm
Actual value:    =20

  Config 'SND_HDA_CODEC_REALTEK' has the following Direct dependencies (=3D=
n):
        SND_HDA(=3Dn) && SND(=3Dn) && !UML(undefined/n) (=3Dy) && SOUND(=3D=
n)

---------- CONFIG_SND_HDA_CODEC_SIGMATEL -----------------
Config: CONFIG_SND_HDA_CODEC_SIGMATEL
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_SIGMATEL=3Dm
Actual value:    =20

  Config 'SND_HDA_CODEC_SIGMATEL' has the following Direct dependencies (=
=3Dn):
        SND_HDA(=3Dn) && SND(=3Dn) && !UML(undefined/n) (=3Dy) && SOUND(=3D=
n)

---------- CONFIG_SND_HDA_CODEC_CIRRUS -----------------
Config: CONFIG_SND_HDA_CODEC_CIRRUS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_CIRRUS=3Dm
Actual value:    =20

  Config 'SND_HDA_CODEC_CIRRUS' has the following Direct dependencies (=3Dn=
):
        SND_HDA(=3Dn) && SND(=3Dn) && !UML(undefined/n) (=3Dy) && SOUND(=3D=
n)

---------- CONFIG_SND_HDA_CODEC_CONEXANT -----------------
Config: CONFIG_SND_HDA_CODEC_CONEXANT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_CONEXANT=3Dm
Actual value:    =20

  Config 'SND_HDA_CODEC_CONEXANT' has the following Direct dependencies (=
=3Dn):
        SND_HDA(=3Dn) && SND(=3Dn) && !UML(undefined/n) (=3Dy) && SOUND(=3D=
n)

---------- CONFIG_SND_HDA_CODEC_CA0110 -----------------
Config: CONFIG_SND_HDA_CODEC_CA0110
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_CA0110=3Dm
Actual value:    =20

  Config 'SND_HDA_CODEC_CA0110' has the following Direct dependencies (=3Dn=
):
        SND_HDA(=3Dn) && SND(=3Dn) && !UML(undefined/n) (=3Dy) && SOUND(=3D=
n)

---------- CONFIG_SND_HDA_CODEC_CA0132 -----------------
Config: CONFIG_SND_HDA_CODEC_CA0132
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_CA0132=3Dm
Actual value:    =20

  Config 'SND_HDA_CODEC_CA0132' has the following Direct dependencies (=3Dn=
):
        SND_HDA(=3Dn) && SND(=3Dn) && !UML(undefined/n) (=3Dy) && SOUND(=3D=
n)

---------- CONFIG_SND_HDA_CODEC_CMEDIA -----------------
Config: CONFIG_SND_HDA_CODEC_CMEDIA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_CMEDIA=3Dm
Actual value:    =20

  Config 'SND_HDA_CODEC_CMEDIA' has the following Direct dependencies (=3Dn=
):
        SND_HDA(=3Dn) && SND(=3Dn) && !UML(undefined/n) (=3Dy) && SOUND(=3D=
n)

---------- CONFIG_SND_HDA_CODEC_SI3054 -----------------
Config: CONFIG_SND_HDA_CODEC_SI3054
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_SI3054=3Dm
Actual value:    =20

  Config 'SND_HDA_CODEC_SI3054' has the following Direct dependencies (=3Dn=
):
        SND_HDA(=3Dn) && SND(=3Dn) && !UML(undefined/n) (=3Dy) && SOUND(=3D=
n)

---------- CONFIG_DMA_SHARED_BUFFER -----------------
Config: CONFIG_DMA_SHARED_BUFFER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DMA_SHARED_BUFFER=3Dy
Actual value:    =20

  Config 'DMA_SHARED_BUFFER' has the following Direct dependencies (=3Dy):
        y

---------- CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS -----------------
Config: CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
Actual value:    =20

No reference to MOUSE_PS2_SYNAPTICS_SMBUS found

---------- CONFIG_MOUSE_PS2_SMBUS -----------------
Config: CONFIG_MOUSE_PS2_SMBUS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_MOUSE_PS2_SMBUS=3Dy
Actual value:    =20

  Config 'MOUSE_PS2_SMBUS' has the following Direct dependencies (=3Dy):
        MOUSE_PS2(=3Dy) && INPUT_MOUSE(=3Dy) && INPUT(=3Dy) && !UML(undefin=
ed/n) (=3Dy)

---------- CONFIG_VT_HW_CONSOLE_BINDING -----------------
Config: CONFIG_VT_HW_CONSOLE_BINDING
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_VT_HW_CONSOLE_BINDING=3Dy
Actual value:     # CONFIG_VT_HW_CONSOLE_BINDING is not set

  Config 'VT_HW_CONSOLE_BINDING' has the following Direct dependencies (=3D=
y):
        HW_CONSOLE(=3Dy) && TTY(=3Dy)

---------- CONFIG_I2C -----------------
Config: CONFIG_I2C_I801
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_I2C_I801=3Dy
Actual value:    =20

--
Config: CONFIG_I2C
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg /OE/bu=
ild/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/con=
figs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/tmp-glibc/work-=
shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/features=
/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_I2C=3Dy
Actual value:     # CONFIG_I2C is not set

Config: CONFIG_I2C_BOARDINFO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_I2C_BOARDINFO=3Dy
Actual value:    =20

Config: CONFIG_I2C_COMPAT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_I2C_COMPAT=3Dy
Actual value:    =20

Config: CONFIG_I2C_HELPER_AUTO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_I2C_HELPER_AUTO=3Dy
Actual value:    =20

Config: CONFIG_I2C_ALGOBIT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_I2C_ALGOBIT=3Dy
Actual value:    =20

  Config 'I2C' has the following Direct dependencies (=3Dy):
        y

---------- CONFIG_I2C_BOARDINFO -----------------
Config: CONFIG_I2C_BOARDINFO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_I2C_BOARDINFO=3Dy
Actual value:    =20

No reference to I2C_BOARDINFO found

---------- CONFIG_I2C_COMPAT -----------------
Config: CONFIG_I2C_COMPAT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_I2C_COMPAT=3Dy
Actual value:    =20

No reference to I2C_COMPAT found

---------- CONFIG_I2C_HELPER_AUTO -----------------
Config: CONFIG_I2C_HELPER_AUTO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_I2C_HELPER_AUTO=3Dy
Actual value:    =20

  Config 'I2C_HELPER_AUTO' has the following Direct dependencies (=3Dn):
        I2C(=3Dn)

---------- CONFIG_I2C_ALGOBIT -----------------
Config: CONFIG_I2C_ALGOBIT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_I2C_ALGOBIT=3Dy
Actual value:    =20

  Config 'I2C_ALGOBIT' has the following Direct dependencies (=3Dn):
        I2C(=3Dn)

---------- CONFIG_DRM -----------------
Config: CONFIG_DRM_CIRRUS_QEMU
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
Requested value:  CONFIG_DRM_CIRRUS_QEMU=3Dm
Actual value:    =20

--
Config: CONFIG_DRM_I915
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg
Requested value:  CONFIG_DRM_I915=3Dm
Actual value:    =20

Config: CONFIG_DRM_I915_ALPHA_SUPPORT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg
Requested value:  CONFIG_DRM_I915_ALPHA_SUPPORT=3Dy
Actual value:    =20

--
Config: CONFIG_DRM_VIRTIO_GPU
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/virtio.cfg /OE/build/oe-core/tmp-glibc=
/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cf=
g/virtio.cfg
Requested value:  CONFIG_DRM_VIRTIO_GPU=3Dy
Actual value:    =20

--
Config: CONFIG_DRM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM=3Dy
Actual value:     # CONFIG_DRM is not set

Config: CONFIG_DRM_KMS_HELPER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_KMS_HELPER=3Dy
Actual value:    =20

Config: CONFIG_DRM_KMS_FB_HELPER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_KMS_FB_HELPER=3Dy
Actual value:    =20

Config: CONFIG_DRM_FBDEV_EMULATION
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_FBDEV_EMULATION=3Dy
Actual value:    =20

Config: CONFIG_DRM_FBDEV_OVERALLOC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_FBDEV_OVERALLOC=3D100
Actual value:    =20

Config: CONFIG_DRM_TTM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_TTM=3Dy
Actual value:    =20

Config: CONFIG_DRM_BOCHS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_BOCHS=3Dy
Actual value:    =20

Config: CONFIG_DRM_PANEL
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_PANEL=3Dy
Actual value:    =20

Config: CONFIG_DRM_BRIDGE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_BRIDGE=3Dy
Actual value:    =20

Config: CONFIG_DRM_PANEL_BRIDGE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_PANEL_BRIDGE=3Dy
Actual value:    =20

Config: CONFIG_DRM_PANEL_ORIENTATION_QUIRKS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
Actual value:    =20

  Config 'DRM' has the following Direct dependencies (=3Dy):
        AGP(=3Dn) || AGP(=3Dn) =3D n (=3Dy) && !EMULATED_CMPXCHG(undefined/=
n) (=3Dy) && HAS_DMA(=3Dy) && HAS_IOMEM(=3Dy)

---------- CONFIG_DRM_FBDEV_EMULATION -----------------
Config: CONFIG_DRM_FBDEV_EMULATION
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_FBDEV_EMULATION=3Dy
Actual value:    =20

  Config 'DRM_FBDEV_EMULATION' has the following Direct dependencies (=3Dn):
        DRM(=3Dn) && HAS_IOMEM(=3Dy)

---------- CONFIG_DRM_FBDEV_OVERALLOC -----------------
Config: CONFIG_DRM_FBDEV_OVERALLOC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_FBDEV_OVERALLOC=3D100
Actual value:    =20

No reference to DRM_FBDEV_OVERALLOC found

---------- CONFIG_DRM_TTM -----------------
Config: CONFIG_DRM_TTM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_TTM=3Dy
Actual value:    =20

  Config 'DRM_TTM' has the following Direct dependencies (=3Dn):
        DRM(=3Dn) && MMU(=3Dy) && HAS_IOMEM(=3Dy)

---------- CONFIG_DRM_BOCHS -----------------
Config: CONFIG_DRM_BOCHS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_BOCHS=3Dy
Actual value:    =20

No reference to DRM_BOCHS found

---------- CONFIG_DRM_PANEL -----------------
Config: CONFIG_DRM_PANEL
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_PANEL=3Dy
Actual value:    =20

--
Config: CONFIG_DRM_PANEL_BRIDGE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_PANEL_BRIDGE=3Dy
Actual value:    =20

Config: CONFIG_DRM_PANEL_ORIENTATION_QUIRKS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
Actual value:    =20

  Config 'DRM_PANEL' has the following Direct dependencies (=3Dn):
        DRM(=3Dn) && HAS_IOMEM(=3Dy)

---------- CONFIG_DRM_BRIDGE -----------------
Config: CONFIG_DRM_BRIDGE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_BRIDGE=3Dy
Actual value:    =20

  Config 'DRM_BRIDGE' has the following Direct dependencies (=3Dn):
        DRM(=3Dn) && HAS_IOMEM(=3Dy)

---------- CONFIG_DRM_PANEL_BRIDGE -----------------
Config: CONFIG_DRM_PANEL_BRIDGE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_PANEL_BRIDGE=3Dy
Actual value:    =20

  Config 'DRM_PANEL_BRIDGE' has the following Direct dependencies (=3Dn):
        DRM_BRIDGE(=3Dn) && DRM_KMS_HELPER(=3Dn) && HAS_IOMEM(=3Dy)

---------- CONFIG_DRM_PANEL_ORIENTATION_QUIRKS -----------------
Config: CONFIG_DRM_PANEL_ORIENTATION_QUIRKS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
Actual value:    =20

  Config 'DRM_PANEL_ORIENTATION_QUIRKS' has the following Direct dependenci=
es (=3Dy):
        HAS_IOMEM(=3Dy)

---------- CONFIG_FB_CMDLINE -----------------
Config: CONFIG_FB_CMDLINE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_CMDLINE=3Dy
Actual value:    =20

  Config 'FB_CMDLINE' has the following Direct dependencies (=3Dy):
        HAS_IOMEM(=3Dy)

---------- CONFIG_FB_NOTIFY -----------------
Config: CONFIG_FB_NOTIFY
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_NOTIFY=3Dy
Actual value:    =20

  Config 'FB_NOTIFY' has the following Direct dependencies (=3Dy):
        HAS_IOMEM(=3Dy)

---------- CONFIG_FB -----------------
Config: CONFIG_FB_MODE_HELPERS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
Requested value:  CONFIG_FB_MODE_HELPERS=3Dy
Actual value:    =20

--
Config: CONFIG_FB_UVESA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
Requested value:  CONFIG_FB_UVESA=3Dm
Actual value:    =20

--
Config: CONFIG_FB_EFI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi-ext.cfg
Requested value:  CONFIG_FB_EFI=3Dy
Actual value:    =20

--
Config: CONFIG_FB_CMDLINE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_CMDLINE=3Dy
Actual value:    =20

Config: CONFIG_FB_NOTIFY
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_NOTIFY=3Dy
Actual value:    =20

Config: CONFIG_FB
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg /OE/build/=
oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs=
/v5.4/standard/cfg/efi-ext.cfg /OE/build/oe-core/tmp-glibc/work-shared/qemu=
x86-64/kernel-source/.kernel-meta/configs/v5.4/standard/features/drm-bochs/=
drm-bochs.cfg
Requested value:  CONFIG_FB=3Dy
Actual value:     # CONFIG_FB is not set

Config: CONFIG_FB_CFB_FILLRECT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_CFB_FILLRECT=3Dy
Actual value:    =20

Config: CONFIG_FB_CFB_COPYAREA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_CFB_COPYAREA=3Dy
Actual value:    =20

Config: CONFIG_FB_CFB_IMAGEBLIT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_CFB_IMAGEBLIT=3Dy
Actual value:    =20

Config: CONFIG_FB_SYS_FILLRECT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SYS_FILLRECT=3Dy
Actual value:    =20

Config: CONFIG_FB_SYS_COPYAREA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SYS_COPYAREA=3Dy
Actual value:    =20

Config: CONFIG_FB_SYS_IMAGEBLIT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SYS_IMAGEBLIT=3Dy
Actual value:    =20

Config: CONFIG_FB_SYS_FOPS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SYS_FOPS=3Dy
Actual value:    =20

Config: CONFIG_FB_DEFERRED_IO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_DEFERRED_IO=3Dy
Actual value:    =20

Config: CONFIG_FB_SIMPLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SIMPLE=3Dy
Actual value:    =20

  Config 'FB' has the following Direct dependencies (=3Dy):
        HAS_IOMEM(=3Dy)

---------- CONFIG_FB_CFB_FILLRECT -----------------
Config: CONFIG_FB_CFB_FILLRECT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_CFB_FILLRECT=3Dy
Actual value:    =20

  Config 'FB_CFB_FILLRECT' has the following Direct dependencies (=3Dn):
        FB(=3Dn) && HAS_IOMEM(=3Dy)

---------- CONFIG_FB_CFB_COPYAREA -----------------
Config: CONFIG_FB_CFB_COPYAREA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_CFB_COPYAREA=3Dy
Actual value:    =20

  Config 'FB_CFB_COPYAREA' has the following Direct dependencies (=3Dn):
        FB(=3Dn) && HAS_IOMEM(=3Dy)

---------- CONFIG_FB_CFB_IMAGEBLIT -----------------
Config: CONFIG_FB_CFB_IMAGEBLIT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_CFB_IMAGEBLIT=3Dy
Actual value:    =20

  Config 'FB_CFB_IMAGEBLIT' has the following Direct dependencies (=3Dn):
        FB(=3Dn) && HAS_IOMEM(=3Dy)

---------- CONFIG_FB_SYS_FILLRECT -----------------
Config: CONFIG_FB_SYS_FILLRECT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SYS_FILLRECT=3Dy
Actual value:    =20

  Config 'FB_SYS_FILLRECT' has the following Direct dependencies (=3Dn):
        FB(=3Dn) && HAS_IOMEM(=3Dy)

---------- CONFIG_FB_SYS_COPYAREA -----------------
Config: CONFIG_FB_SYS_COPYAREA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SYS_COPYAREA=3Dy
Actual value:    =20

  Config 'FB_SYS_COPYAREA' has the following Direct dependencies (=3Dn):
        FB(=3Dn) && HAS_IOMEM(=3Dy)

---------- CONFIG_FB_SYS_IMAGEBLIT -----------------
Config: CONFIG_FB_SYS_IMAGEBLIT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SYS_IMAGEBLIT=3Dy
Actual value:    =20

  Config 'FB_SYS_IMAGEBLIT' has the following Direct dependencies (=3Dn):
        FB(=3Dn) && HAS_IOMEM(=3Dy)

---------- CONFIG_FB_SYS_FOPS -----------------
Config: CONFIG_FB_SYS_FOPS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SYS_FOPS=3Dy
Actual value:    =20

  Config 'FB_SYS_FOPS' has the following Direct dependencies (=3Dn):
        FB(=3Dn) && HAS_IOMEM(=3Dy)

---------- CONFIG_FB_DEFERRED_IO -----------------
Config: CONFIG_FB_DEFERRED_IO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_DEFERRED_IO=3Dy
Actual value:    =20

  Config 'FB_DEFERRED_IO' has the following Direct dependencies (=3Dn):
        FB(=3Dn) && HAS_IOMEM(=3Dy)

---------- CONFIG_FB_SIMPLE -----------------
Config: CONFIG_FB_SIMPLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SIMPLE=3Dy
Actual value:    =20

  Config 'FB_SIMPLE' has the following Direct dependencies (=3Dn):
        FB(=3Dn) =3D y (=3Dn) && HAS_IOMEM(=3Dy)

---------- CONFIG_HDMI -----------------
Config: CONFIG_HDMI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_HDMI=3Dy
Actual value:    =20

  Config 'HDMI' has the following Direct dependencies (=3Dy):
        HAS_IOMEM(=3Dy)

---------- CONFIG_FRAMEBUFFER_CONSOLE -----------------
Config: CONFIG_FRAMEBUFFER_CONSOLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg /OE/build/=
oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs=
/v5.4/standard/cfg/efi-ext.cfg /OE/build/oe-core/tmp-glibc/work-shared/qemu=
x86-64/kernel-source/.kernel-meta/configs/v5.4/standard/features/drm-bochs/=
drm-bochs.cfg
Requested value:  CONFIG_FRAMEBUFFER_CONSOLE=3Dy
Actual value:    =20

Config: CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
Actual value:    =20

  Config 'FRAMEBUFFER_CONSOLE' has the following Direct dependencies (=3Dn):
        FB(=3Dn) && !UML(undefined/n) (=3Dy) && VT(=3Dy)

---------- CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY -----------------
Config: CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
Actual value:    =20

  Config 'FRAMEBUFFER_CONSOLE_DETECT_PRIMARY' has the following Direct depe=
ndencies (=3Dn):
        FRAMEBUFFER_CONSOLE(=3Dn) && VT(=3Dy)

---------- CONFIG_SYNC_FILE -----------------
Config: CONFIG_SYNC_FILE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_SYNC_FILE=3Dy
Actual value:     # CONFIG_SYNC_FILE is not set

  Config 'SYNC_FILE' has the following Direct dependencies (=3Dy):
        y

---------- CONFIG_FONT_SUPPORT -----------------
Config: CONFIG_FONT_SUPPORT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FONT_SUPPORT=3Dy
Actual value:    =20

  Config 'FONT_SUPPORT' has the following Direct dependencies (=3Dy):
        y

---------- CONFIG_FONT_8x8 -----------------
Config: CONFIG_FONT_8x8
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FONT_8x8=3Dy
Actual value:    =20

  Config 'FONT_8x8' has the following Direct dependencies (=3Dn):
        FRAMEBUFFER_CONSOLE(=3Dn) || STI_CONSOLE(=3Dn) (=3Dn) && FONT_SUPPO=
RT(=3Dn)

---------- CONFIG_FONT_8x16 -----------------
Config: CONFIG_FONT_8x16
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FONT_8x16=3Dy
Actual value:    =20

  Config 'FONT_8x16' has the following Direct dependencies (=3Dn):
        FONT_SUPPORT(=3Dn)

---------- CONFIG_HYPERVISOR_GUEST -----------------
Config: CONFIG_HYPERVISOR_GUEST
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/hv-guest.cfg
Requested value:  CONFIG_HYPERVISOR_GUEST=3Dy
Actual value:     # CONFIG_HYPERVISOR_GUEST is not set

  Config 'HYPERVISOR_GUEST' has the following Direct dependencies (=3Dy):
        y

---------- CONFIG_KVM_GUEST -----------------
Config: CONFIG_KVM_GUEST
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/paravirt_kvm.cfg
Requested value:  CONFIG_KVM_GUEST=3Dy
Actual value:    =20

  Config 'KVM_GUEST' has the following Direct dependencies (=3Dn):
        PARAVIRT(=3Dn) && HYPERVISOR_GUEST(=3Dn)

---------- CONFIG_PARAVIRT -----------------
Config: CONFIG_PARAVIRT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/paravirt_kvm.cfg
Requested value:  CONFIG_PARAVIRT=3Dy
Actual value:    =20

Config: CONFIG_PARAVIRT_CLOCK
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/paravirt_kvm.cfg
Requested value:  CONFIG_PARAVIRT_CLOCK=3Dy
Actual value:    =20

  Config 'PARAVIRT' has the following Direct dependencies (=3Dn):
        HYPERVISOR_GUEST(=3Dn)

---------- CONFIG_PARAVIRT_CLOCK -----------------
Config: CONFIG_PARAVIRT_CLOCK
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/paravirt_kvm.cfg
Requested value:  CONFIG_PARAVIRT_CLOCK=3Dy
Actual value:    =20

  Config 'PARAVIRT_CLOCK' has the following Direct dependencies (=3Dn):
        HYPERVISOR_GUEST(=3Dn)

---------- CONFIG_SCSI -----------------
Config: CONFIG_SCSI_VIRTIO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/virtio.cfg /OE/build/oe-core/tmp-glibc=
/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cf=
g/virtio.cfg
Requested value:  CONFIG_SCSI_VIRTIO=3Dy
Actual value:    =20

--
Config: CONFIG_SCSI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/scsi/scsi.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/scsi/scsi.cfg /OE/build/oe-core/tmp-glibc/work-shared/qemux8=
6-64/kernel-source/.kernel-meta/configs/v5.4/standard/features/scsi/scsi.cfg
Requested value:  CONFIG_SCSI=3Dy
Actual value:     # CONFIG_SCSI is not set

Config: CONFIG_SCSI_DEBUG
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/scsi/scsi-debug.cfg
Requested value:  CONFIG_SCSI_DEBUG=3Dm
Actual value:    =20

  Config 'SCSI' has the following Direct dependencies (=3Dy):
        BLOCK(=3Dy)

---------- CONFIG_SCSI_DEBUG -----------------
Config: CONFIG_SCSI_DEBUG
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/scsi/scsi-debug.cfg
Requested value:  CONFIG_SCSI_DEBUG=3Dm
Actual value:    =20

No reference to SCSI_DEBUG found


DEBUG: Python function do_kernel_configcheck finished
>=20
> Cheers,
>=20
> Bruce
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

--27rp5jdfjop675id
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXjik0gAKCRA3VSO3ZXaA
HLE1AKCITqDONGumosNZy0lmiPCTlVUkNACdH9pmYpEPFH6bFSafrffWU8A1RXY=
=PSuE
-----END PGP SIGNATURE-----

--27rp5jdfjop675id--
