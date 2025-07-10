Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6AEC83F1B
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 14:59:14 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.10932.1752159546865628448
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 07:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EN1li52m;
 spf=pass (domain: konsulko.com, ip: 209.85.167.181, mailfrom: trini@konsulko.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-40669fd81b5so653205b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 07:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1752159546; x=1752764346; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m7acAeqaNUW8qT2rK7IXtl+4Ul7yyglRr13kwB6adME=;
        b=EN1li52mBaulk+kUVnDG+wrx+5RlF5pjMN+K/Qeufx3y4p3zNwH7uWqX0W/1Ac8o3a
         0IjFumpkm6wFlq2dnamxnbow5vyVgk5IKZVg61T1HyPktG/BzDNw4pO860Ri6WNpkK8Y
         Os/D40VbKWhLPtY4nFgZ6E7LPITiVtZCrvJ+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752159546; x=1752764346;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m7acAeqaNUW8qT2rK7IXtl+4Ul7yyglRr13kwB6adME=;
        b=H73f+Y1PQfUzpayQC9TDDnafx22uZfPLKlzw1GKmPl4emUafHO82uHCQnKlTDSCqYi
         MOuClJ/lWTFB6ukzllefOMExkBPgNUO+o9NoRFJ6ODkckcieMdeEwGm6HtN2G59yP6rR
         CbCQFsojXPji6X4t9UAQDbrxQP3nkSKEuSY+zP3dYmWAeNdZWUPFdZ6DollFUH2CU2ku
         usEcONq7e7o/S7uJ/b2oXi41DXNX+tTgsSIbdwTOYDwzRr5RUB+W/XVy6voSG1qu2JhD
         7900B9MDNJFkU9kzItOg7ostjtHvF/JKvshM5D1ZVi8ws1v1g1YYuOdB8hRAiuXzLi3G
         2e3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnC8+IYooUN7ZGRVXINZgGp0PjR8whqwL3cINLfcthRhVDasGohwdxrf684v8w43FRs9LxF3y3RZ0JwpZsQaDEhA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxX9p9QapYb5xh4T0Urv6jQBbDIydQX4DD6R8xoU+OkmUAfJZl/
	K2Jup8iVeYK3nE3KL7h5scKnw7xPyekAJWmmmjfZYRAGDu/9nbfVkqdQheyncOTniVQ=
X-Gm-Gg: ASbGncvtGzt82rf4N7ngU05tcjf9axtC0oz/Hr9jUIooPpD9yhZJmzBtzKGnVKp7UGD
	a7BiL5k0WkpQaRAEHDPqMQFuMv2vH84yVS2ojDKtyHqgXHgVyxkRL+3Upbhv3KUJdXoLxNlHe5E
	R0yM+mRSHfWOm6PklarDQC6Afrwb8W38f/M+/OISHbkYRmGoAJrXL8lK77Mh+teZECOtrcF1V4w
	Ky/6y22+7CFWP7IGxMuAkHUUfX1bLHDOBI/eBn5LkToyc8FicovXouTQRyBcrQ7/oUVQBlfqI6B
	zBR3TzDbFrqq7/bQC7UEVyES/aOXul25P8kfui+SZO5q6h59gJkm4CzDsALaG4UE/CoQXP93n3q
	S9W7qyxk83fVPz004i7Nd
X-Google-Smtp-Source: AGHT+IGZZVitnSy2kl/0JwBZkNfz22gHLkWm4VF+tPUgdmAHVotekKIcv4YvuZAeByUDU8kTnEYPOA==
X-Received: by 2002:a05:6808:179f:b0:3f8:d2f8:d735 with SMTP id 5614622812f47-413f60a6ee9mr1550460b6e.33.1752159545853;
        Thu, 10 Jul 2025 07:59:05 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-97-42.totalplay.net. [189.203.97.42])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4141bbdde6csm215871b6e.23.2025.07.10.07.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 07:59:05 -0700 (PDT)
Date: Thu, 10 Jul 2025 08:59:03 -0600
From: Tom Rini <trini@konsulko.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Fabio Estevam <festevam@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	adrian.freihofer@siemens.com, Marek Vasut <marek.vasut@mailbox.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [OE-core] [PATCH] u-boot: upgrade 2025.04 -> 2025.07
Message-ID: <20250710145903.GB6424@bill-the-cat>
References: <20250708012959.77522-1-festevam@gmail.com>
 <DB6OGLNWBEVN.2V2F24LHIZ4C4@bootlin.com>
 <CAOMZO5BJBc0E0EfejEPmVdGBZiQrrvRWsHhy0Bxgi+jx6WiYRQ@mail.gmail.com>
 <20250708175732.GU6424@bill-the-cat>
 <DB7DN2I98ZYX.3V9C86PS14M9B@bootlin.com>
 <20250709142932.GW6424@bill-the-cat>
 <1850E573A97965CE.21176@lists.openembedded.org>
 <aG_TTWzkD215ATpq@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aG_TTWzkD215ATpq@nuoska>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 14:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220123

On Thu, Jul 10, 2025 at 05:50:53PM +0300, Mikko Rapeli wrote:
> Hi,
>=20
> On Thu, Jul 10, 2025 at 04:02:14PM +0300, Mikko Rapeli via lists.openembe=
dded.org wrote:
> > Adding Ilias,
> >=20
> > On Wed, Jul 09, 2025 at 08:29:32AM -0600, Tom Rini via lists.openembedd=
ed.org wrote:
> > > On Wed, Jul 09, 2025 at 10:21:34AM +0200, Mathieu Dubois-Briand wrote:
> > > > On Tue Jul 8, 2025 at 7:57 PM CEST, Tom Rini wrote:
> > > > > On Tue, Jul 08, 2025 at 02:04:15PM -0300, Fabio Estevam wrote:
> > > > >> Hi Mathieu,
> > > > >>=20
> > > > >> On Tue, Jul 8, 2025 at 9:37=E2=80=AFAM Mathieu Dubois-Briand
> > > > >> <mathieu.dubois-briand@bootlin.com> wrote:
> > > > >> >
> > > > >> > On Tue Jul 8, 2025 at 3:29 AM CEST, Fabio Estevam via lists.op=
enembedded.org wrote:
> > > > >> > > Upgrade to U-Boot 2025.07.
> > > > >> > >
> > > > >> > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > > > >> > > ---
> > > > >> >
> > > > >> > Hi Fabio,
> > > > >> >
> > > > >> > Thanks for your patch.
> > > > >> >
> > > > >> > It looks like this is breaking selftests on the autobuilder:
> > > > >> >
> > > > >> > 2025-07-08 07:43:52,116 - oe-selftest - INFO - fitimage.UBootF=
itImageTests.test_sign_cascaded_uboot_fit_image (subunit.RemotedTestCase)
> > > > >> > 2025-07-08 07:43:52,118 - oe-selftest - INFO -  ... FAIL
> > > > >> > ...
> > > > >> > ERROR: u-boot-1_2025.07-r0 do_compile: oe_runmake failed
> > > > >> > ...
> > > > >> > | arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.=
a: No such file or directory
> > > > >> >
> > > > >> >
> > > > >> > Both on debian and armhost:
> > > > >> >
> > > > >> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/bu=
ilds/1923
> > > > >> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/bu=
ilds/2077
> > > > >> >
> > > > >> > Can you have a look at these failures please?
> > > > >>=20
> > > > >> Thanks for the report.
> > > > >>=20
> > > > >> I am adding some folks on CC in case they have some ideas.
> > > > >
> > > > > Interesting. How can we trigger that outside of the autobuilder?
> > > >=20
> > > > Hi,
> > > >=20
> > > > It's not so easy to reproduce, as it looks like it is somehow linked
> > > > with the host environment: this have been failing on debian workers=
 but
> > > > not on the fedora ones.
> > > > So basic instructions are below, but this was not enough to reprodu=
ce it
> > > > in the ubuntu 24.4 docker I've been using so far.
> > > >=20
> > > > git clone git://git.yoctoproject.org/poky-ci-archive -b autobuilder=
=2Eyoctoproject.org/valkyrie/a-full-1972
> > > > cd poky-ci-archive
> > > > . oe-init-build-env
> > > >=20
> > > > Add following lines in conf/local.conf (I bet only the last one is
> > > > really needed, but let's try to be as close as possible as the
> > > > autobuilder configuration):
> > > > MACHINE =3D "qemux86-64"
> > > > DISTRO =3D "poky"
> > > > SDKMACHINE =3D "x86_64"
> > > > PACKAGE_CLASSES =3D "package_rpm"
> > > > RPM_GPG_SIGN_CHUNK =3D '1'
> > > > IMAGE_INSTALL:append =3D ' ssh-pregen-hostkeys'
> > > > SANITY_TESTED_DISTROS =3D ''
> > > >=20
> > > > Add poky-ci-archive/meta-selftest in conf/bblayers.conf.
> > > >=20
> > > > And finally, run the tests:
> > > > oe-selftest -r fitimage.UBootFitImageTests.test_sign_cascaded_uboot=
_fit_image
> > > > oe-selftest -r fitimage.UBootFitImageTests.test_sign_standalone_ubo=
ot_atf_tee_fit_image
> > >=20
> > > Yeah, looking at the logs it's not even Debian, it's Ubuntu 22.04, wh=
ich
> > > is what we use for our CI too. I guess I would suggest bisect'ing with
> > > the autobuilder until finding out what commit breaks and then someone
> > > from the U-Boot side of things can chime in.
> >=20
> > I've tried to reproduce this on x86_64 Ubuntu 22.04 build machine
> > targeting qemuarm and arm64 Ubuntu 24.04 build machine targeting
> > beaglebone. No luck so far. In my builds, lib.a has always been
> > created in before any other linking steps happens. I presume this is a
> > race condition where linking step of lib/efi_loader/testapp_efi.so
> > does not actually have a dependency to the lib.a creating linking step.
> >=20
> > I'm not familiar enough with u-boot/Kconfig build setups to see where t=
his
> > dependency should be added.
> >=20
> > From do_compile log in passing case:
> >=20
> > set -e; mkdir -p include/generated/;    (echo \#define PLAIN_VERSION \"=
2025.07\"; echo \#define U_BOOT_VERSION \"U-Boot \" PLAIN_VERSION; echo \#d=
efine U_BOOT_VERSION_NUM 2025; echo \#define U_BOOT_VERSION_NUM_PATCH $(ech=
o 07 | sed -e "s/^0*//"); echo \#define HOST_ARCH 0x00a7; echo \#define CC_=
VERSION_STRING \"$(LC_ALL=3DC arm-poky-linux-gnueabi-gcc  --sysroot=3D/home=
/mcfrisk/src/base/repo/poky/build_beaglebone/tmp/work/beaglebone_yocto-poky=
-linux-gnueabi/u-boot/2025.07/recipe-sysroot  -ffile-prefix-map=3D/home/mcf=
risk/src/base/repo/poky/build_beaglebone/tmp/work/beaglebone_yocto-poky-lin=
ux-gnueabi/u-boot/2025.07/sources/u-boot-2025.07=3D/usr/src/debug/u-boot/20=
25.07  -ffile-prefix-map=3D/home/mcfrisk/src/base/repo/poky/build_beaglebon=
e/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/2025.07/build=3D/usr/=
src/debug/u-boot/2025.07  -ffile-prefix-map=3D/home/mcfrisk/src/base/repo/p=
oky/build_beaglebone/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/20=
25.07/recipe-sysroot=3D  -ffile-prefix-map=3D/home/mcfrisk/src/base/repo/po=
ky/build_beaglebone/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/202=
5.07/recipe-sysroot-native=3D  --version | head -n 1)\"; echo \#define LD_V=
ERSION_STRING \"$(LC_ALL=3DC arm-poky-linux-gnueabi-ld.bfd --version | head=
 -n 1)\"; ) < include/config/uboot.release > include/generated/version_auto=
generated.h.tmp; if [ -r include/generated/version_autogenerated.h ] && cmp=
 -s include/generated/version_autogenerated.h include/generated/version_aut=
ogenerated.h.tmp; then rm -f include/generated/version_autogenerated.h.tmp;=
 else : '  UPD     include/generated/version_autogenerated.h'; mv -f includ=
e/generated/version_autogenerated.h.tmp include/generated/version_autogener=
ated.h; fi
> > ...
> >   rm -f arch/arm/lib/lib.a; arm-poky-linux-gnueabi-ar cDPrsT arch/arm/l=
ib/lib.a arch/arm/lib/ashldi3.o arch/arm/lib/ashrdi3.o arch/arm/lib/div0.o =
arch/arm/lib/div64.o arch/arm/lib/lib1funcs.o arch/arm/lib/lshrdi3.o arch/a=
rm/lib/muldi3.o arch/arm/lib/uldivmod.o
> > ...
> >   arm-poky-linux-gnueabi-ld.bfd -nostdlib -zexecstack -znocombreloc -zn=
orelro --no-warn-rwx-segments -L /home/mcfrisk/src/base/repo/poky/build_bea=
glebone/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/2025.07/sources=
/u-boot-2025.07 -T arch/arm/lib/elf_arm_efi.lds -shared -Bsymbolic -s lib/e=
fi_loader/testapp.o lib/efi_loader/efi_crt0.o lib/efi_loader/efi_reloc.o li=
b/efi_loader/efi_freestanding.o arch/arm/lib/lib.a -o lib/efi_loader/testap=
p_efi.so
> >=20
> > Looks like testapp_efi.so linking step is the first one using
> > arm-poky-linux-gnueabi-ld.bfd.
> >=20
> > Failing case:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2914600/raw_i=
nline
> >=20
> > | set -e; mkdir -p include/generated/; 	(echo \#define PLAIN_VERSION \"=
2025.07\"; echo \#define U_BOOT_VERSION \"U-Boot \" PLAIN_VERSION; echo \#d=
efine U_BOOT_VERSION_NUM 2025; echo \#define U_BOOT_VERSION_NUM_PATCH $(ech=
o 07 | sed -e "s/^0*//"); echo \#define HOST_ARCH 0x00a7; echo \#define CC_=
VERSION_STRING \"$(LC_ALL=3DC arm-poky-linux-gnueabi-gcc  --sysroot=3D/srv/=
pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3119200/tmp/work/=
beaglebone_yocto-poky-linux-gnueabi/u-boot/2025.07/recipe-sysroot  -ffile-p=
refix-map=3D/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-=
3119200/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/2025.07/sources=
/u-boot-2025.07=3D/usr/src/debug/u-boot/2025.07  -ffile-prefix-map=3D/srv/p=
okybuild/yocto-worker/oe-selftest-armhost/build/build-st-3119200/tmp/work/b=
eaglebone_yocto-poky-linux-gnueabi/u-boot/2025.07/build=3D/usr/src/debug/u-=
boot/2025.07  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/oe-selftest-a=
rmhost/build/build-st-3119200/tmp/work/beaglebone_yocto-poky-linux-gnueabi/=
u-boot/2025.07/recipe-sysroot=3D  -ffile-prefix-map=3D/srv/pokybuild/yocto-=
worker/oe-selftest-armhost/build/build-st-3119200/tmp/work/beaglebone_yocto=
-poky-linux-gnueabi/u-boot/2025.07/recipe-sysroot-native=3D  --version | he=
ad -n 1)\"; echo \#define LD_VERSION_STRING \"$(LC_ALL=3DC arm-poky-linux-g=
nueabi-ld.bfd --version | head -n 1)\"; ) < include/config/uboot.release > =
include/generated/version_autogenerated.h.tmp; if [ -r include/generated/ve=
rsion_autogenerated.h ] && cmp -s include/generated/version_autogenerated.h=
 include/generated/version_autogenerated.h.tmp; then rm -f include/generate=
d/version_autogenerated.h.tmp; else : '  UPD     include/generated/version_=
autogenerated.h'; mv -f include/generated/version_autogenerated.h.tmp inclu=
de/generated/version_autogenerated.h; fi
> > ...
> > |    rm -f lib/efi_loader/built-in.o; arm-poky-linux-gnueabi-ar cDPrsT =
lib/efi_loader/built-in.o lib/efi_loader/efi_bootmgr.o lib/efi_loader/efi_b=
ootbin.o lib/efi_loader/efi_boottime.o lib/efi_loader/efi_helper.o lib/efi_=
loader/efi_console.o lib/efi_loader/efi_device_path.o lib/efi_loader/efi_de=
vice_path_to_text.o lib/efi_loader/efi_device_path_utilities.o lib/efi_load=
er/efi_dt_fixup.o lib/efi_loader/efi_fdt.o lib/efi_loader/efi_file.o lib/ef=
i_loader/efi_hii.o lib/efi_loader/efi_hii_config.o lib/efi_loader/efi_image=
_loader.o lib/efi_loader/efi_load_options.o lib/efi_loader/efi_memory.o lib=
/efi_loader/efi_root_node.o lib/efi_loader/efi_runtime.o lib/efi_loader/efi=
_setup.o lib/efi_loader/efi_string.o lib/efi_loader/efi_unicode_collation.o=
 lib/efi_loader/efi_var_common.o lib/efi_loader/efi_var_mem.o lib/efi_loade=
r/efi_variable.o lib/efi_loader/efi_var_file.o lib/efi_loader/efi_watchdog.=
o lib/efi_loader/efi_disk.o lib/efi_loader/efi_net.o lib/efi_loader/efi_smb=
ios.o lib/efi_loader/efi_load_initrd.o lib/efi_loader/efi_conformance.o
> > |   arm-poky-linux-gnueabi-ld.bfd -nostdlib -zexecstack -znocombreloc -=
znorelro --no-warn-rwx-segments -L /srv/pokybuild/yocto-worker/oe-selftest-=
armhost/build/build-st-3119200/tmp/work/beaglebone_yocto-poky-linux-gnueabi=
/u-boot/2025.07/sources/u-boot-2025.07 -T arch/arm/lib/elf_arm_efi.lds -sha=
red -Bsymbolic -s lib/efi_loader/helloworld.o lib/efi_loader/efi_crt0.o lib=
/efi_loader/efi_reloc.o lib/efi_loader/efi_freestanding.o arch/arm/lib/lib.=
a -o lib/efi_loader/helloworld_efi.so
> > | arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No suc=
h file or directory
> > | make[3]: *** [scripts/Makefile.lib:512: lib/efi_loader/helloworld_efi=
=2Eso] Error 1
> >=20
> > In this failing log, nothing created lib.a before lib/efi_loader/hellow=
orld_efi.so
> > link step started.
>=20
> I managed to reproduce the problem with an artificial delay:
>=20
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -353,7 +353,7 @@ $(modorder-target): $(subdir-ym) FORCE
>  #
>  ifdef lib-target
>  quiet_cmd_link_l_target =3D AR      $@
> -cmd_link_l_target =3D rm -f $@; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-y)
> +cmd_link_l_target =3D rm -f $@ && echo "HACK, delaying build!" && sleep =
60 && $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-y)
>=20
>  $(lib-target): $(lib-y) FORCE
>         $(call if_changed,link_l_target)
>=20
>=20
> and fix for this seems to be:
>=20
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -508,7 +508,7 @@ $(obj)/efi_reloc.o: $(srctree)/arch/$(ARCH)/lib/$(EFI=
_RELOC:.o=3D.c) $(recordmcoun
>         $(call cmd,force_checksrc)
>         $(call if_changed_rule,cc_o_c)
> =20
> -$(obj)/%_efi.so: $(obj)/%.o $(obj)/efi_crt0.o $(obj)/efi_reloc.o $(obj)/=
efi_freestanding.o
> +$(obj)/%_efi.so: $(PLATFORM_LIBGCC) $(obj)/%.o $(obj)/efi_crt0.o $(obj)/=
efi_reloc.o $(obj)/efi_freestanding.o
>         $(call cmd,efi_ld)
> =20
>  targets +=3D $(obj)/efi_crt0.o $(obj)/efi_reloc.o $(obj)/efi_freestandin=
g.o
>=20
> I sent this to u-boot list but it seems my message is in moderator queue.
> Fabio was on Cc: so maybe you can pick this up for a new revision of u-bo=
ot
> update to oe-core. It should fix the race condition.

I cleared you patch (and moderation flag) but I don't think the above
works in all cases since PLATFORM_LIBGCC can have a number of values
only one of which is that file.

--=20
Tom

