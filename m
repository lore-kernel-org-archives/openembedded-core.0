Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id DD2F178996
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 14:26:59 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id d71so10783258iog.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 06:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/cbq+kBC6AmkfKRoGKAP3xx/ngrfuMm2Lbq2r21rbng=;
	b=kj01li0omyVFvWF+ILeno5Kw0AtT3O46s9TCnMpGlBJKLu18H/kUo2+6lJm8OpiQ/c
	nfZLQ2lkLaQ11cmvCBVfByRuI++MWJyUgOP1LJG6zGIT1iM2hkEgqf1do9EEv4zTglr7
	31BHxndCZHgNC3hx81HNwDVuMmRgwvD2X4fqfOo4DtaFll9f8Yd3OnFnzLb6PXjbhM62
	ghfZ77y8V3ham7zyFQRnOqpzSMdZJM2ZsC10v3WECHpRHcE9TGpNdjbxPaHJI3YoXUuX
	iHJFCoGbJt283/jl5yau3+rFfo+YntX52iM2udM+SrHtmMYh8V0YcfH6aRJyFne0mxa8
	dpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/cbq+kBC6AmkfKRoGKAP3xx/ngrfuMm2Lbq2r21rbng=;
	b=eq75pt3ThO3iwacJ9iAWLBwpLxbRzB5al27VL+kH4Kh+KSBhiP3Fw/EUD4d9u7wD1l
	RgDc49T7hLIV59aq3f6FRhPtA2iPXdSIY1YlcVmwzkS8isIkrXPIWoMM11KmSKp15x5m
	ebHbOzIRymFZEBnmS2f13OW06P7QrKOe930uIXGKBhPY2Q0ziczoahSZreYxeMe7VNL6
	kIX71nlD90ZNmyH+8K4Y2ZuwvDskylGOTWByJw2jABewZgy0CnG4Dcc9qRm7DGDW8XPD
	gcKHbQ6v1m79GNBZ9pLEEKYC5VLNl/kbfuZewsPYu4hA3J/iGlrB6etEPswFH4kcSI/M
	1i8A==
X-Gm-Message-State: APf1xPBt+k1j1y2tpdJCAHOsRHbQFdTWC/nqNyhkdOAcMC5OrLJJhKtm
	rzk/0wwGpp0bIDYGVFpsDy3w70DGy5RBRUnshRD2oA==
X-Google-Smtp-Source: AG47ELu5SjAoP52Dj8Ol5FwaKDeHKS8nZ/Ki4prJ9LSldRZ0SxOVvLjFewTucioA6UxJEY9aavN7DQEwu2VlTc39F2c=
X-Received: by 10.107.7.87 with SMTP id 84mr6861045ioh.216.1520000820689; Fri,
	02 Mar 2018 06:27:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Fri, 2 Mar 2018 06:26:40 -0800 (PST)
In-Reply-To: <2e0d78eb-cce0-ffe0-867d-fea4f6d189e6@windriver.com>
References: <1519845645-21713-1-git-send-email-bruce.ashfield@windriver.com>
	<20180301082802.GA16294@mbabyjoh-desk.ger.corp.intel.com>
	<CAJTo0LYxPA=4=qQZSm0_AbWHCCG+=0j0+2pzmFrV76nxG7DRww@mail.gmail.com>
	<2e0d78eb-cce0-ffe0-867d-fea4f6d189e6@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Mar 2018 14:26:40 +0000
Message-ID: <CAJTo0LYOhro2P9bW7yXVQEWZJM6O9wbOiNBtVwzBpAvmZeHzKQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Fri, 02 Mar 2018 14:27:00 -0000
Content-Type: multipart/alternative; boundary="001a113ecdf4f9e6e005666ec4e7"

--001a113ecdf4f9e6e005666ec4e7
Content-Type: text/plain; charset="UTF-8"

Alpine Linux has hit this and they just build a custom getconf binary as
part of their musl build;

https://git.alpinelinux.org/cgit/aports/tree/main/musl

(also getent)

Ross

On 2 March 2018 at 14:23, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> I worked through some problems to test with musl:
>
>   - uprev'd linux-libc-headers --> refresh / change of the musl ethhdr
>     patch
>
>   - worked around the binutils link issue and libsystemd
>
> So I was able to assemble kernel-devsrc on an image with musl, and now
> I'm back to the problem that lead me to add glibc-utils to the RDEPENDS
> of kernel-devsrc:
>
> ---------
>
> root@qemux86-64:/lib/modules/4.14.19-yocto-standard/build# make ARCH=x86
> scripts
> make: getconf: Command not found
> make: getconf: Command not found
> make: getconf: Command not found
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/basic/bin2c
> make[1]: getconf: Command not found
> make[1]: getconf: Command not found
> make[1]: getconf: Command not found
>   HOSTCC  scripts/kconfig/conf.o
>   SHIPPED scripts/kconfig/zconf.tab.c
>   SHIPPED scripts/kconfig/zconf.lex.c
>   HOSTCC  scripts/kconfig/zconf.tab.o
>   HOSTLD  scripts/kconfig/conf
> scripts/kconfig/conf  --silentoldconfig Kconfig
>   WRAP    arch/x86/include/generated/asm/clkdev.h
>   WRAP    arch/x86/include/generated/asm/dma-contiguous.h
>   WRAP    arch/x86/include/generated/asm/early_ioremap.h
>   WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
>   WRAP    arch/x86/include/generated/asm/mm-arch-hooks.h
>   CC      scripts/mod/empty.o
>   HOSTCC  scripts/mod/mk_elfconfig
>   MKELF   scripts/mod/elfconfig.h
>   HOSTCC  scripts/mod/modpost.o
>   CC      scripts/mod/devicetable-offsets.s
>   CHK     scripts/mod/devicetable-offsets.h
>   UPD     scripts/mod/devicetable-offsets.h
>   HOSTCC  scripts/mod/file2alias.o
>   HOSTCC  scripts/mod/sumversion.o
>   HOSTLD  scripts/mod/modpost
>   HOSTCC  scripts/kallsyms
>   HOSTCC  scripts/conmakehash
>   HOSTCC  scripts/recordmcount
>   HOSTCC  scripts/sortextable
> root@qemux86-64:/lib/modules/4.14.19-yocto-standard/build#
>
> ----------------
>
> I've added Khem to the cc .. Khem: what in the muslc world would
> provide 'getconf' ? I didn't see it when glancing through the packaging.
>
> Bruce
>
> On 2018-03-01 4:37 AM, Burton, Ross wrote:
>
>> Also fails on musl:
>>
>> ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/pokybuild/yocto-autobuil
>> der/yocto-worker/nightly-musl/build/meta/recipes-kernel/linux/
>> kernel-devsrc.bb <http://kernel-devsrc.bb> RDEPENDS on or otherwise
>> requires it)
>>
>> Ross
>>
>>
>> On 1 March 2018 at 08:28, Maxin B. John <maxin.john@intel.com <mailto:
>> maxin.john@intel.com>> wrote:
>>
>>     Hi,
>>
>>     On Wed, Feb 28, 2018 at 02:20:45PM -0500, Bruce Ashfield wrote:
>>      > The existing kernel-devsrc package starts with a full copy of the
>>     kernel
>>      > source and then starts to strip out elements that are not required.
>>      >
>>      > This results in extra time (I/O) and extra space being taken up
>>     in the
>>      > final package. The main purpose of the kernel-devsrc package has
>>     been to
>>      > build modules against the running kernel, not to include a full
>>     copy of
>>      > the source code for re-building the kernel. The end result was a
>>      > 600M kernel-devsrc package.
>>      >
>>      > This restructuring of the package uses an approach similar to other
>>      > distros, where the kernel-devsrc package is for building against
>> the
>>      > running kernel and uses a curated set of copied infrastructure,
>>     versus
>>      > a mass copy of the entire kernel.
>>      >
>>      > The differences in this approach versus other is largely due to the
>>      > architecture support and the split build/source directory of the
>>      > kernel.
>>      >
>>      > The result is a kernel-devsrc package of about 10M, which is
>> capable
>>      > of running "make scripts" and compiling kernel modules against the
>>      > running kernel.
>>      >
>>      > Along with the changes to the copying of the infrascture, we also
>>      > have the following changes:
>>      >
>>      >  - a better/more explicit listing of dependencies for on-target
>>      >    builds of "make scripts" or "make modules_prepare"
>>      >
>>      >  - The kernel source is installed into /lib/modules/<version>/build
>>      >    and a symlink created from /usr/src/kernel to the new location.
>>      >    This aligns with the standard location for module support
>>      >    code
>>      >
>>      >  - There is also a symlink from /lib/modules/<version>/source ->
>>     build
>>      >    to reserve a spot for a new package that is simply the kernel
>>      >    source. That package is not part of this update.
>>      >
>>      > [YOCTO #12535]
>>      >
>>      > Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com
>>     <mailto:bruce.ashfield@windriver.com>>
>>
>>      > ---
>>      >
>>      >  v2: fix arch/arm devsrc builds
>>
>>     Noticed one kernel-devsrc build failure in autobuilder (qemuarm) :
>>
>>     https://autobuilder.yocto.io/builders/nightly-arm/builds/876
>> /steps/BuildImages/logs/stdio
>>     <https://autobuilder.yocto.io/builders/nightly-arm/builds/87
>> 6/steps/BuildImages/logs/stdio>
>>
>>     ERROR: kernel-devsrc-1.0-r0 do_install: Function failed: do_install
>>     (log file is located at
>>     /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/
>> build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-
>> devsrc/1.0-r0/temp/log.do_install.25822)
>>     ERROR: Logfile of failure stored in:
>>     /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/
>> build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-
>> devsrc/1.0-r0/temp/log.do_install.25822
>>     Log data follows:
>>     | DEBUG: Executing python function extend_recipe_sysroot
>>     | NOTE: Direct dependencies are
>>     ['/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-
>> arm/build/meta/recipes-devtools/binutils/binutils-cross_2.30.bb:
>> do_populate_sysroot',
>>     'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-
>> worker/nightly-arm/build/meta/recipes-extended/xz/xz_5.2.3.
>> bb:do_populate_sysroot',
>>     'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-
>> worker/nightly-arm/build/meta/recipes-devtools/pkgconfig/
>> pkgconfig_git.bb:do_populate_sysroot',
>>     'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-
>> worker/nightly-arm/build/meta/recipes-support/lzop/lzop_1.03.bb:
>> do_populate_sysroot',
>>     '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/
>> build/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:
>> do_populate_sysroot',
>>     '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/
>> build/meta/recipes-devtools/gcc/gcc-runtime_7.3.bb:do_populate_sysroot',
>>     '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/
>> build/meta/recipes-devtools/gcc/gcc-cross_7.
>>       3.bb:do_populate_sysroot',
>>     'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-
>> worker/nightly-arm/build/meta/recipes-devtools/bison/bison_3.0.4.bb:
>> do_populate_sysroot',
>>     'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-
>> worker/nightly-arm/build/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb:
>> do_populate_sysroot',
>>     '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/
>> build/meta/recipes-core/glibc/glibc_2.26.bb:do_populate_sysroot',
>>     '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/
>> build/meta/recipes-kernel/kmod/kmod-native_git.bb:do_populate_sysroot',
>>     'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-
>> worker/nightly-arm/build/meta/recipes-extended/bc/bc_1.06.
>> bb:do_populate_sysroot',
>>     '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/
>> build/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_
>> populate_sysroot',
>>     'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-
>> worker/nightly-arm/build/meta/recipes-connectivity/openssl/
>> openssl_1.0.2n.bb:d
>>       o_populate_sysroot']
>>     | NOTE: Installed into sysroot: ['pkgconfig-native', 'lzop-native',
>>     'kern-tools-native', 'pseudo-native', 'kmod-native', 'bc-native',
>>     'openssl-native', 'gtk-doc-native', 'lzo-native',
>>     'makedepend-native', 'cryptodev-linux-native', 'util-macros-native',
>>     'xproto-native']
>>     | NOTE: Skipping as already exists in sysroot:
>>     ['binutils-cross-arm', 'xz-native', 'gcc-runtime', 'gcc-cross-arm',
>>     'bison-native', 'glibc', 'quilt-native', 'gettext-minimal-native',
>>     'gnu-config-native', 'automake-native', 'autoconf-native',
>>     'libtool-native', 'linux-libc-headers', 'libgcc', 'zlib-native',
>>     'texinfo-dummy-native', 'flex-native', 'libmpc-native',
>>     'gmp-native', 'mpfr-native', 'm4-native']
>>     | DEBUG: sed -e
>>     's:^[^/]*/:/home/pokybuild/yocto-autobuilder/yocto-worker/
>> nightly-arm/build/build/tmp/work/qemuarm-poky-linux-
>> gnueabi/kernel-devsrc/1.0-r0/recipe-sysroot-native/:g'
>>     /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/
>> build/build/tmp/sysroots-components/x86_64/pkgconfig-native/fixmepath
>>     /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/
>> build/build/tmp/sysroots-components/x86_64/openssl-native/fixmepath
>>     /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/
>> build/build/tmp/sysroots-components/x86_64/gtk-doc-native/fixmepath
>>     | xargs sed -i -e
>>     's:FIXMESTAGINGDIRTARGET:/home/pokybuild/yocto-autobuilder/
>> yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-
>> poky-linux-gnueabi/kernel-devsrc/1.0-r0/recipe-sysroot:g;
>>     s:FIXMESTAGINGDIRHOST:/home/pokybuild/yocto-autobuilder/yoct
>> o-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-
>> linux-gnueabi/kernel-devsrc/1.0-r0/recipe-sysroot-native:g'
>>     -e 's:FIXME_COMPONENTS_DIR:/home/pokybuild/yocto-autobuilder/y
>>       octo-worker/nightly-arm/build/build/tmp/sysroots-components:g' -e
>>     's:FIXME_HOSTTOOLS_DIR:/home/pokybuild/yocto-autobuilder/yoc
>> to-worker/nightly-arm/build/build/tmp/hosttools:g'
>>     -e
>>     's:FIXME_PKGDATA_DIR:/home/pokybuild/yocto-autobuilder/yocto
>> -worker/nightly-arm/build/build/tmp/pkgdata/qemuarm:g'
>>     -e
>>     's:FIXME_PSEUDO_LOCALSTATEDIR:/home/pokybuild/yocto-autobuil
>> der/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-
>> poky-linux-gnueabi/kernel-devsrc/1.0-r0/pseudo/:g'
>>     -e
>>     's:FIXME_LOGFIFO:/home/pokybuild/yocto-autobuilder/yocto-
>> worker/nightly-arm/build/build/tmp/work/qemuarm-poky-
>> linux-gnueabi/kernel-devsrc/1.0-r0/temp/fifo.25822:g'
>>     | DEBUG: Python function extend_recipe_sysroot finished
>>     | DEBUG: Executing shell function do_install
>>     | cp: with --parents, the destination must be a directory
>>     | Try 'cp --help' for more information.
>>     | WARNING:
>>     /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/
>> build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-
>> devsrc/1.0-r0/temp/run.do_install.25822:1
>>     exit 1 from 'rm -rf $kerneldir/build/include'
>>     | ERROR: Function failed: do_install (log file is located at
>>     /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/
>> build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-
>> devsrc/1.0-r0/temp/log.do_install.25822)
>>     NOTE: recipe kernel-devsrc-1.0-r0: task do_install: Failed
>>     ERROR: Task
>>     (/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/
>> build/meta/recipes-kernel/linux/kernel-devsrc.bb:do_install)
>>     failed with exit code '1'
>>
>>     Best Regards,
>>     Maxin
>>     --
>>     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>
>>
>>
>

--001a113ecdf4f9e6e005666ec4e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Alpine Linux has hit this and they just build a custom get=
conf binary as part of their musl build;<div><br></div><div><a href=3D"http=
s://git.alpinelinux.org/cgit/aports/tree/main/musl">https://git.alpinelinux=
.org/cgit/aports/tree/main/musl</a><br></div><div><br></div><div>(also gete=
nt)</div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On 2 March 2018 at 14:23, Bruce Ashfield <span =
dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_=
blank">bruce.ashfield@windriver.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">I worked through some problems to test with musl:<br>
<br>
=C2=A0 - uprev&#39;d linux-libc-headers --&gt; refresh / change of the musl=
 ethhdr<br>
=C2=A0 =C2=A0 patch<br>
<br>
=C2=A0 - worked around the binutils link issue and libsystemd<br>
<br>
So I was able to assemble kernel-devsrc on an image with musl, and now<br>
I&#39;m back to the problem that lead me to add glibc-utils to the RDEPENDS=
<br>
of kernel-devsrc:<br>
<br>
---------<br>
<br>
root@qemux86-64:/lib/modules/4<wbr>.14.19-yocto-standard/build# make ARCH=
=3Dx86 scripts<br>
make: getconf: Command not found<br>
make: getconf: Command not found<br>
make: getconf: Command not found<br>
=C2=A0 HOSTCC=C2=A0 scripts/basic/fixdep<br>
=C2=A0 HOSTCC=C2=A0 scripts/basic/bin2c<br>
make[1]: getconf: Command not found<br>
make[1]: getconf: Command not found<br>
make[1]: getconf: Command not found<br>
=C2=A0 HOSTCC=C2=A0 scripts/kconfig/conf.o<br>
=C2=A0 SHIPPED scripts/kconfig/zconf.tab.c<br>
=C2=A0 SHIPPED scripts/kconfig/zconf.lex.c<br>
=C2=A0 HOSTCC=C2=A0 scripts/kconfig/zconf.tab.o<br>
=C2=A0 HOSTLD=C2=A0 scripts/kconfig/conf<br>
scripts/kconfig/conf=C2=A0 --silentoldconfig Kconfig<br>
=C2=A0 WRAP=C2=A0 =C2=A0 arch/x86/include/generated/asm<wbr>/clkdev.h<br>
=C2=A0 WRAP=C2=A0 =C2=A0 arch/x86/include/generated/asm<wbr>/dma-contiguous=
.h<br>
=C2=A0 WRAP=C2=A0 =C2=A0 arch/x86/include/generated/asm<wbr>/early_ioremap.=
h<br>
=C2=A0 WRAP=C2=A0 =C2=A0 arch/x86/include/generated/asm<wbr>/mcs_spinlock.h=
<br>
=C2=A0 WRAP=C2=A0 =C2=A0 arch/x86/include/generated/asm<wbr>/mm-arch-hooks.=
h<br>
=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 scripts/mod/empty.o<br>
=C2=A0 HOSTCC=C2=A0 scripts/mod/mk_elfconfig<br>
=C2=A0 MKELF=C2=A0 =C2=A0scripts/mod/elfconfig.h<br>
=C2=A0 HOSTCC=C2=A0 scripts/mod/modpost.o<br>
=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 scripts/mod/devicetable-offset<wbr>s.s<br>
=C2=A0 CHK=C2=A0 =C2=A0 =C2=A0scripts/mod/devicetable-offse<wbr>ts.h<br>
=C2=A0 UPD=C2=A0 =C2=A0 =C2=A0scripts/mod/devicetable-offse<wbr>ts.h<br>
=C2=A0 HOSTCC=C2=A0 scripts/mod/file2alias.o<br>
=C2=A0 HOSTCC=C2=A0 scripts/mod/sumversion.o<br>
=C2=A0 HOSTLD=C2=A0 scripts/mod/modpost<br>
=C2=A0 HOSTCC=C2=A0 scripts/kallsyms<br>
=C2=A0 HOSTCC=C2=A0 scripts/conmakehash<br>
=C2=A0 HOSTCC=C2=A0 scripts/recordmcount<br>
=C2=A0 HOSTCC=C2=A0 scripts/sortextable<br>
root@qemux86-64:/lib/modules/4<wbr>.14.19-yocto-standard/build#<br>
<br>
----------------<br>
<br>
I&#39;ve added Khem to the cc .. Khem: what in the muslc world would<br>
provide &#39;getconf&#39; ? I didn&#39;t see it when glancing through the p=
ackaging.<br>
<br>
Bruce<span class=3D""><br>
<br>
On 2018-03-01 4:37 AM, Burton, Ross wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
Also fails on musl:<br>
<br>
ERROR: Nothing RPROVIDES &#39;glibc-utils&#39; (but /home/pokybuild/yocto-a=
utobuil<wbr>der/yocto-worker/nightly-musl/<wbr>build/meta/recipes-kernel/<w=
br>linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=3D"_=
blank">kernel-devsrc.bb</a> &lt;<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">http://kernel-devsrc.bb</a>&gt; RDEPENDS on o=
r otherwise requires it)<br>
<br>
Ross<div><div class=3D"h5"><br>
<br>
On 1 March 2018 at 08:28, Maxin B. John &lt;<a href=3D"mailto:maxin.john@in=
tel.com" target=3D"_blank">maxin.john@intel.com</a> &lt;mailto:<a href=3D"m=
ailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;&=
gt; wrote:<br>
<br>
=C2=A0 =C2=A0 Hi,<br>
<br>
=C2=A0 =C2=A0 On Wed, Feb 28, 2018 at 02:20:45PM -0500, Bruce Ashfield wrot=
e:<br>
=C2=A0 =C2=A0 =C2=A0&gt; The existing kernel-devsrc package starts with a f=
ull copy of the<br>
=C2=A0 =C2=A0 kernel<br>
=C2=A0 =C2=A0 =C2=A0&gt; source and then starts to strip out elements that =
are not required.<br>
=C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt; This results in extra time (I/O) and extra space b=
eing taken up<br>
=C2=A0 =C2=A0 in the<br>
=C2=A0 =C2=A0 =C2=A0&gt; final package. The main purpose of the kernel-devs=
rc package has<br>
=C2=A0 =C2=A0 been to<br>
=C2=A0 =C2=A0 =C2=A0&gt; build modules against the running kernel, not to i=
nclude a full<br>
=C2=A0 =C2=A0 copy of<br>
=C2=A0 =C2=A0 =C2=A0&gt; the source code for re-building the kernel. The en=
d result was a<br>
=C2=A0 =C2=A0 =C2=A0&gt; 600M kernel-devsrc package.<br>
=C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt; This restructuring of the package uses an approach=
 similar to other<br>
=C2=A0 =C2=A0 =C2=A0&gt; distros, where the kernel-devsrc package is for bu=
ilding against the<br>
=C2=A0 =C2=A0 =C2=A0&gt; running kernel and uses a curated set of copied in=
frastructure,<br>
=C2=A0 =C2=A0 versus<br>
=C2=A0 =C2=A0 =C2=A0&gt; a mass copy of the entire kernel.<br>
=C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt; The differences in this approach versus other is l=
argely due to the<br>
=C2=A0 =C2=A0 =C2=A0&gt; architecture support and the split build/source di=
rectory of the<br>
=C2=A0 =C2=A0 =C2=A0&gt; kernel.<br>
=C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt; The result is a kernel-devsrc package of about 10M=
, which is capable<br>
=C2=A0 =C2=A0 =C2=A0&gt; of running &quot;make scripts&quot; and compiling =
kernel modules against the<br>
=C2=A0 =C2=A0 =C2=A0&gt; running kernel.<br>
=C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt; Along with the changes to the copying of the infra=
scture, we also<br>
=C2=A0 =C2=A0 =C2=A0&gt; have the following changes:<br>
=C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 - a better/more explicit listing of dependen=
cies for on-target<br>
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 builds of &quot;make scripts&quot; or=
 &quot;make modules_prepare&quot;<br>
=C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 - The kernel source is installed into /lib/m=
odules/&lt;version&gt;/build<br>
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 and a symlink created from /usr/src/k=
ernel to the new location.<br>
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 This aligns with the standard locatio=
n for module support<br>
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 code<br>
=C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 - There is also a symlink from /lib/modules/=
&lt;version&gt;/source -&gt;<br>
=C2=A0 =C2=A0 build<br>
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 to reserve a spot for a new package t=
hat is simply the kernel<br>
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 source. That package is not part of t=
his update.<br>
=C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt; [YOCTO #12535]<br>
=C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailt=
o:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windriver.=
com</a><br></div></div>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:bruce.ashfield@windriver.com" ta=
rget=3D"_blank">bruce.ashfield@windriv<wbr>er.com</a>&gt;&gt;<div><div clas=
s=3D"h5"><br>
=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
=C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 v2: fix arch/arm devsrc builds<br>
<br>
=C2=A0 =C2=A0 Noticed one kernel-devsrc build failure in autobuilder (qemua=
rm) :<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://autobuilder.yocto.io/builders/nightly-arm/=
builds/876/steps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D"_blan=
k">https://autobuilder.yocto.io/b<wbr>uilders/nightly-arm/builds/876<wbr>/s=
teps/BuildImages/logs/stdio</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"https://autobuilder.yocto.io/builders/nightly-=
arm/builds/876/steps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D"_=
blank">https://autobuilder.yocto.io/<wbr>builders/nightly-arm/builds/87<wbr=
>6/steps/BuildImages/logs/stdio</a><wbr>&gt;<br>
<br>
=C2=A0 =C2=A0 ERROR: kernel-devsrc-1.0-r0 do_install: Function failed: do_i=
nstall<br>
=C2=A0 =C2=A0 (log file is located at<br>
=C2=A0 =C2=A0 /home/pokybuild/yocto-autobuil<wbr>der/yocto-worker/nightly-a=
rm/<wbr>build/build/tmp/work/qemuarm-<wbr>poky-linux-gnueabi/kernel-<wbr>de=
vsrc/1.0-r0/temp/log.do_<wbr>install.25822)<br>
=C2=A0 =C2=A0 ERROR: Logfile of failure stored in:<br>
=C2=A0 =C2=A0 /home/pokybuild/yocto-autobuil<wbr>der/yocto-worker/nightly-a=
rm/<wbr>build/build/tmp/work/qemuarm-<wbr>poky-linux-gnueabi/kernel-<wbr>de=
vsrc/1.0-r0/temp/log.do_<wbr>install.25822<br>
=C2=A0 =C2=A0 Log data follows:<br>
=C2=A0 =C2=A0 | DEBUG: Executing python function extend_recipe_sysroot<br>
=C2=A0 =C2=A0 | NOTE: Direct dependencies are<br>
=C2=A0 =C2=A0 [&#39;/home/pokybuild/yocto-autobu<wbr>ilder/yocto-worker/nig=
htly-<wbr>arm/build/meta/recipes-<wbr>devtools/binutils/binutils-<wbr>cross=
_2.30.bb:do_populate_<wbr>sysroot&#39;,<br>
=C2=A0 =C2=A0 &#39;virtual:native:/home/pokybuil<wbr>d/yocto-autobuilder/yo=
cto-<wbr>worker/nightly-arm/build/meta/<wbr>recipes-extended/xz/xz_5.2.3.<w=
br>bb:do_populate_sysroot&#39;,<br>
=C2=A0 =C2=A0 &#39;virtual:native:/home/pokybuil<wbr>d/yocto-autobuilder/yo=
cto-<wbr>worker/nightly-arm/build/meta/<wbr>recipes-devtools/pkgconfig/<wbr=
>pkgconfig_git.bb:do_populate_<wbr>sysroot&#39;,<br>
=C2=A0 =C2=A0 &#39;virtual:native:/home/pokybuil<wbr>d/yocto-autobuilder/yo=
cto-<wbr>worker/nightly-arm/build/meta/<wbr>recipes-support/lzop/lzop_1.<wb=
r>03.bb:do_populate_sysroot&#39;,<br>
=C2=A0 =C2=A0 &#39;/home/pokybuild/yocto-autobui<wbr>lder/yocto-worker/nigh=
tly-arm/<wbr>build/meta/recipes-kernel/<wbr>kern-tools/kern-tools-native_<w=
br>git.bb:do_populate_sysroot&#39;,<br>
=C2=A0 =C2=A0 &#39;/home/pokybuild/yocto-autobui<wbr>lder/yocto-worker/nigh=
tly-arm/<wbr>build/meta/recipes-devtools/<wbr>gcc/gcc-runtime_7.3.bb:do_<wb=
r>populate_sysroot&#39;,<br>
=C2=A0 =C2=A0 &#39;/home/pokybuild/yocto-autobui<wbr>lder/yocto-worker/nigh=
tly-arm/<wbr>build/meta/recipes-devtools/<wbr>gcc/gcc-cross_7.<br>
=C2=A0 =C2=A0 =C2=A0=C2=A03.bb:do_populate_sysroot&#39;,<br>
=C2=A0 =C2=A0 &#39;virtual:native:/home/pokybuil<wbr>d/yocto-autobuilder/yo=
cto-<wbr>worker/nightly-arm/build/meta/<wbr>recipes-devtools/bison/bison_<w=
br>3.0.4.bb:do_populate_sysroot&#39;,<br>
=C2=A0 =C2=A0 &#39;virtual:native:/home/pokybuil<wbr>d/yocto-autobuilder/yo=
cto-<wbr>worker/nightly-arm/build/meta/<wbr>recipes-devtools/pseudo/<wbr>ps=
eudo_1.8.2.bb:do_populate_<wbr>sysroot&#39;,<br>
=C2=A0 =C2=A0 &#39;/home/pokybuild/yocto-autobui<wbr>lder/yocto-worker/nigh=
tly-arm/<wbr>build/meta/recipes-core/glibc/<wbr>glibc_2.26.bb:do_populate_<=
wbr>sysroot&#39;,<br>
=C2=A0 =C2=A0 &#39;/home/pokybuild/yocto-autobui<wbr>lder/yocto-worker/nigh=
tly-arm/<wbr>build/meta/recipes-kernel/<wbr>kmod/kmod-native_git.bb:do_<wbr=
>populate_sysroot&#39;,<br>
=C2=A0 =C2=A0 &#39;virtual:native:/home/pokybuil<wbr>d/yocto-autobuilder/yo=
cto-<wbr>worker/nightly-arm/build/meta/<wbr>recipes-extended/bc/bc_1.06.<wb=
r>bb:do_populate_sysroot&#39;,<br>
=C2=A0 =C2=A0 &#39;/home/pokybuild/yocto-autobui<wbr>lder/yocto-worker/nigh=
tly-arm/<wbr>build/meta/recipes-devtools/<wbr>quilt/quilt-native_0.65.bb:do=
_<wbr>populate_sysroot&#39;,<br>
=C2=A0 =C2=A0 &#39;virtual:native:/home/pokybuil<wbr>d/yocto-autobuilder/yo=
cto-<wbr>worker/nightly-arm/build/meta/<wbr>recipes-connectivity/openssl/<w=
br>openssl_1.0.2n.bb:d<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0o_populate_sysroot&#39;]<br>
=C2=A0 =C2=A0 | NOTE: Installed into sysroot: [&#39;pkgconfig-native&#39;, =
&#39;lzop-native&#39;,<br>
=C2=A0 =C2=A0 &#39;kern-tools-native&#39;, &#39;pseudo-native&#39;, &#39;km=
od-native&#39;, &#39;bc-native&#39;,<br>
=C2=A0 =C2=A0 &#39;openssl-native&#39;, &#39;gtk-doc-native&#39;, &#39;lzo-=
native&#39;,<br>
=C2=A0 =C2=A0 &#39;makedepend-native&#39;, &#39;cryptodev-linux-native&#39;=
, &#39;util-macros-native&#39;,<br>
=C2=A0 =C2=A0 &#39;xproto-native&#39;]<br>
=C2=A0 =C2=A0 | NOTE: Skipping as already exists in sysroot:<br>
=C2=A0 =C2=A0 [&#39;binutils-cross-arm&#39;, &#39;xz-native&#39;, &#39;gcc-=
runtime&#39;, &#39;gcc-cross-arm&#39;,<br>
=C2=A0 =C2=A0 &#39;bison-native&#39;, &#39;glibc&#39;, &#39;quilt-native&#3=
9;, &#39;gettext-minimal-native&#39;,<br>
=C2=A0 =C2=A0 &#39;gnu-config-native&#39;, &#39;automake-native&#39;, &#39;=
autoconf-native&#39;,<br>
=C2=A0 =C2=A0 &#39;libtool-native&#39;, &#39;linux-libc-headers&#39;, &#39;=
libgcc&#39;, &#39;zlib-native&#39;,<br>
=C2=A0 =C2=A0 &#39;texinfo-dummy-native&#39;, &#39;flex-native&#39;, &#39;l=
ibmpc-native&#39;,<br>
=C2=A0 =C2=A0 &#39;gmp-native&#39;, &#39;mpfr-native&#39;, &#39;m4-native&#=
39;]<br>
=C2=A0 =C2=A0 | DEBUG: sed -e<br>
=C2=A0 =C2=A0 &#39;s:^[^/]*/:/home/pokybuild/yoc<wbr>to-autobuilder/yocto-w=
orker/<wbr>nightly-arm/build/build/tmp/<wbr>work/qemuarm-poky-linux-<wbr>gn=
ueabi/kernel-devsrc/1.0-r0/<wbr>recipe-sysroot-native/:g&#39;<br>
=C2=A0 =C2=A0 /home/pokybuild/yocto-autobuil<wbr>der/yocto-worker/nightly-a=
rm/<wbr>build/build/tmp/sysroots-<wbr>components/x86_64/pkgconfig-<wbr>nati=
ve/fixmepath<br>
=C2=A0 =C2=A0 /home/pokybuild/yocto-autobuil<wbr>der/yocto-worker/nightly-a=
rm/<wbr>build/build/tmp/sysroots-<wbr>components/x86_64/openssl-<wbr>native=
/fixmepath<br>
=C2=A0 =C2=A0 /home/pokybuild/yocto-autobuil<wbr>der/yocto-worker/nightly-a=
rm/<wbr>build/build/tmp/sysroots-<wbr>components/x86_64/gtk-doc-<wbr>native=
/fixmepath<br>
=C2=A0 =C2=A0 | xargs sed -i -e<br>
=C2=A0 =C2=A0 &#39;s:FIXMESTAGINGDIRTARGET:/home<wbr>/pokybuild/yocto-autob=
uilder/<wbr>yocto-worker/nightly-arm/<wbr>build/build/tmp/work/qemuarm-<wbr=
>poky-linux-gnueabi/kernel-<wbr>devsrc/1.0-r0/recipe-sysroot:<wbr>g;<br>
=C2=A0 =C2=A0 s:FIXMESTAGINGDIRHOST:/home/po<wbr>kybuild/yocto-autobuilder/=
yoct<wbr>o-worker/nightly-arm/build/<wbr>build/tmp/work/qemuarm-poky-<wbr>l=
inux-gnueabi/kernel-devsrc/1.<wbr>0-r0/recipe-sysroot-native:g&#39;<br>
=C2=A0 =C2=A0 -e &#39;s:FIXME_COMPONENTS_DIR:/home/<wbr>pokybuild/yocto-aut=
obuilder/y<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0octo-worker/nightly-arm/buil<wbr>d/build/tmp/sysr=
oots-component<wbr>s:g&#39; -e<br>
=C2=A0 =C2=A0 &#39;s:FIXME_HOSTTOOLS_DIR:/home/p<wbr>okybuild/yocto-autobui=
lder/yoc<wbr>to-worker/nightly-arm/build/<wbr>build/tmp/hosttools:g&#39;<br=
>
=C2=A0 =C2=A0 -e<br>
=C2=A0 =C2=A0 &#39;s:FIXME_PKGDATA_DIR:/home/pok<wbr>ybuild/yocto-autobuild=
er/yocto<wbr>-worker/nightly-arm/build/<wbr>build/tmp/pkgdata/qemuarm:g&#39=
;<br>
=C2=A0 =C2=A0 -e<br>
=C2=A0 =C2=A0 &#39;s:FIXME_PSEUDO_LOCALSTATEDIR:<wbr>/home/pokybuild/yocto-=
autobuil<wbr>der/yocto-worker/nightly-arm/<wbr>build/build/tmp/work/qemuarm=
-<wbr>poky-linux-gnueabi/kernel-<wbr>devsrc/1.0-r0/pseudo/:g&#39;<br>
=C2=A0 =C2=A0 -e<br>
=C2=A0 =C2=A0 &#39;s:FIXME_LOGFIFO:/home/pokybui<wbr>ld/yocto-autobuilder/y=
octo-<wbr>worker/nightly-arm/build/<wbr>build/tmp/work/qemuarm-poky-<wbr>li=
nux-gnueabi/kernel-devsrc/1.<wbr>0-r0/temp/fifo.25822:g&#39;<br>
=C2=A0 =C2=A0 | DEBUG: Python function extend_recipe_sysroot finished<br>
=C2=A0 =C2=A0 | DEBUG: Executing shell function do_install<br>
=C2=A0 =C2=A0 | cp: with --parents, the destination must be a directory<br>
=C2=A0 =C2=A0 | Try &#39;cp --help&#39; for more information.<br>
=C2=A0 =C2=A0 | WARNING:<br>
=C2=A0 =C2=A0 /home/pokybuild/yocto-autobuil<wbr>der/yocto-worker/nightly-a=
rm/<wbr>build/build/tmp/work/qemuarm-<wbr>poky-linux-gnueabi/kernel-<wbr>de=
vsrc/1.0-r0/temp/run.do_<wbr>install.25822:1<br>
=C2=A0 =C2=A0 exit 1 from &#39;rm -rf $kerneldir/build/include&#39;<br>
=C2=A0 =C2=A0 | ERROR: Function failed: do_install (log file is located at<=
br>
=C2=A0 =C2=A0 /home/pokybuild/yocto-autobuil<wbr>der/yocto-worker/nightly-a=
rm/<wbr>build/build/tmp/work/qemuarm-<wbr>poky-linux-gnueabi/kernel-<wbr>de=
vsrc/1.0-r0/temp/log.do_<wbr>install.25822)<br>
=C2=A0 =C2=A0 NOTE: recipe kernel-devsrc-1.0-r0: task do_install: Failed<br=
>
=C2=A0 =C2=A0 ERROR: Task<br>
=C2=A0 =C2=A0 (/home/pokybuild/yocto-autobui<wbr>lder/yocto-worker/nightly-=
arm/<wbr>build/meta/recipes-kernel/<wbr>linux/kernel-devsrc.bb:do_<wbr>inst=
all)<br>
=C2=A0 =C2=A0 failed with exit code &#39;1&#39;<br>
<br>
=C2=A0 =C2=A0 Best Regards,<br>
=C2=A0 =C2=A0 Maxin<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 ______________________________<wbr>_________________<br>
=C2=A0 =C2=A0 Openembedded-core mailing list<br>
=C2=A0 =C2=A0 <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br></div=
></div>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:Openembedded-core@lists.openembe=
dded.org" target=3D"_blank">Openembedded-core@list<wbr>s.openembedded.org</=
a>&gt;<br>
=C2=A0 =C2=A0 <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://lists.openembedded.org/mailman/listinfo=
/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.opene=
mbedded.org<wbr>/mailman/listinfo/openembedded<wbr>-core</a>&gt;<br>
<br>
<br>
</blockquote>
<br>
</blockquote></div><br></div>

--001a113ecdf4f9e6e005666ec4e7--
