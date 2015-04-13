Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0A37391A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 23:11:38 +0000 (UTC)
Received: by widdi4 with SMTP id di4so91906142wid.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 16:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AdYs1WNcmwuWlia2hFTFAblbdAxrtGL8t+91o7atM9w=;
	b=UQed171sxnb8j5worRbZK3Bh6wdQQYMJ172xBiOr3iRHKAGBccJ3JvJr2DX0L2CRK1
	9/rfYjL4bdKkIJP4dTgFdXjNFTgxzlUJo99paJ0jExJDZzgZKUVqTEyVNuecNSGjMt3E
	vWj4KA1iU7LUKbT3YI12h7eIjk8DHqX26FXMOfpcjnEvogmlvNuEDDDY+Mg97GTxkrCY
	i8ZA4R1yNfnZCPEUopGU7mWFjQpyYc5E+G9qHSI5dlNvS3vzrG09/8MUboXGudFxhatB
	gjXauJSaA98cxJIxVPl8gqmWNpWeB5XX6Sd/HKr9xc+T+Tuy4BOWLFk/YMuDF8Lh8mhV
	qsbg==
X-Received: by 10.180.218.195 with SMTP id pi3mr26444091wic.71.1428966699613; 
	Mon, 13 Apr 2015 16:11:39 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	ed14sm14671832wic.11.2015.04.13.16.11.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2015 16:11:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 14 Apr 2015 01:11:43 +0200
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20150413231013.GM2330@jama>
References: <cover.1427222980.git.bruce.ashfield@windriver.com>
	<2c03175314036b7360039fae572b9c9716d3f1c8.1427222980.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
In-Reply-To: <2c03175314036b7360039fae572b9c9716d3f1c8.1427222980.git.bruce.ashfield@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] linux-yocto/3.19: fixes for Intel core warnings
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
X-List-Received-Date: Mon, 13 Apr 2015 23:11:39 -0000
X-Groupsio-MsgNum: 64333
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ftQmbtOmUf2cr8rB"
Content-Disposition: inline

--ftQmbtOmUf2cr8rB
Content-Type: multipart/mixed; boundary="gh4H09KImyIEQ1se"
Content-Disposition: inline

--gh4H09KImyIEQ1se
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2015 at 02:57:52PM -0400, Bruce Ashfield wrote:
> Updating the 3.19 meta branch to include the following configuration
> change to deal with kernel configuration audit warnings:
>=20
>   9e70b482d377 romley: remove common video and media config items
>   8a4e096759ad intel-common: remove eg20t from common config
>   c2f5ab15620c drm-cdvpvr: Add STAGING_MEDIA
>   ac4693c1db39 media: Prefer modules(m) to yes(y) and update for 3.19 Ker=
nel

I don't know if it's caused by this one or some other linux-yocto
change, but recent qemux86 builds are failing with:

ERROR: Logfile of failure stored in: /OE/build/owpb/webos-ports/tmp-glibc/w=
ork/qemux86-webos-linux/linux-yocto/3.19.2+gitAUTOINC+9e70b482d3_31b35da6a5=
-r0/temp/log.do_compile_kernelmodules.22804
Log data follows:
| DEBUG: Executing shell function do_compile_kernelmodules
| NOTE: make -j 9 modules CC=3Di586-webos-linux-gcc  LD=3Di586-webos-linux-=
ld.bfd
|   CHK     include/config/kernel.release
|   GEN     ./Makefile
|   CHK     include/generated/uapi/linux/version.h
|   Using /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-s=
ource as source for kernel
|   CHK     include/generated/utsrelease.h
|   CALL    /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel=
-source/scripts/checksyscalls.sh
| net/sctp/.transport.o.cmd:5: *** unterminated call to function 'wildcard'=
: missing ')'.  Stop.
| /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/sc=
ripts/Makefile.build:402: recipe for target 'net/sctp' failed
| make[3]: *** [net/sctp] Error 2
| /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/Ma=
kefile:939: recipe for target 'net' failed
| make[2]: *** [net] Error 2
| make[2]: *** Waiting for unfinished jobs....
| Makefile:145: recipe for target 'sub-make' failed
| make[1]: *** [sub-make] Error 2
| Makefile:24: recipe for target '__sub-make' failed
| make: *** [__sub-make] Error 2

Any idea what went wrong?

tmp-glibc/work/qemux86-webos-linux/linux-yocto/3.19.2+gitAUTOINC+9e70b482d3=
_31b35da6a5-r0/linux-qemux86-standard-build/net/sctp/.transport.o.cmd
is attached

>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/re=
cipes-kernel/linux/linux-yocto-tiny_3.19.bb
> index d5a07dd68918..0631c5e55156 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
> @@ -10,7 +10,7 @@ KMETA =3D "meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "2"
> =20
>  SRCREV_machine ?=3D "31b35da6a5c8a2b162f6c33202e9b64dd13757d5"
> -SRCREV_meta ?=3D "8fc194deced3f83e78b0671c6ff8b45bdb7f80e7"
> +SRCREV_meta ?=3D "9e70b482d3773abf92c9c5850e134cbca1d5651f"
> =20
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
> =20
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes=
-kernel/linux/linux-yocto_3.19.bb
> index ac1856abcecc..9b19eb299b16 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
> @@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?=3D "31b35da6a5c8a2b162f6c33202=
e9b64dd13757d5"
>  SRCREV_machine_qemux86-64 ?=3D "31b35da6a5c8a2b162f6c33202e9b64dd13757d5"
>  SRCREV_machine_qemumips64 ?=3D "d35649ef8cbb0a0404be5c721377b138866181ad"
>  SRCREV_machine ?=3D "31b35da6a5c8a2b162f6c33202e9b64dd13757d5"
> -SRCREV_meta ?=3D "8fc194deced3f83e78b0671c6ff8b45bdb7f80e7"
> +SRCREV_meta ?=3D "9e70b482d3773abf92c9c5850e134cbca1d5651f"
> =20
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-3.19.git;bareclone=
=3D1;branch=3D${KBRANCH},${KMETA};name=3Dmachine,meta"
> =20
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gh4H09KImyIEQ1se
Content-Type: application/x-object
Content-Disposition: attachment; filename="transport.o"
Content-Transfer-Encoding: quoted-printable

cmd_net/sctp/transport.o :=3D i586-webos-linux-gcc  -Wp,-MD,net/sctp/.trans=
port.o.d  -nostdinc -isystem /OE/build/owpb/webos-ports/tmp-glibc/sysroots/=
x86_64-linux/usr/lib/i586-webos-linux/gcc/i586-webos-linux/4.9.2/include -I=
/OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/arch=
/x86/include -Iarch/x86/include/generated/uapi -Iarch/x86/include/generated=
  -I/OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/=
include -Iinclude -I/OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux8=
6/kernel-source/arch/x86/include/uapi -Iarch/x86/include/generated/uapi -I/=
OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/inclu=
de/uapi -Iinclude/generated/uapi -include /OE/build/owpb/webos-ports/tmp-gl=
ibc/work-shared/qemux86/kernel-source/include/linux/kconfig.h  -I/OE/build/=
owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/net/sctp -Inet=
/sctp -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format=
-security -std=3Dgnu89 -m32 -msoft-float -mregparm=3D3 -freg-struct-return =
-fno-pic -mpreferred-stack-boundary=3D2 -march=3Di686 -mtune=3Dpentium3 -mt=
une=3Dgeneric -maccumulate-outgoing-args -Wa,-mtune=3Dgeneric32 -ffreestand=
ing -DCONFIG_AS_CFI=3D1 -DCONFIG_AS_CFI_SIGNAL_FRAME=3D1 -DCONFIG_AS_CFI_SE=
CTIONS=3D1 -DCONFIG_AS_CRC32=3D1 -DCONFIG_AS_AVX=3D1 -DCONFIG_AS_AVX2=3D1 -=
pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -m=
no-sse2 -mno-3dnow -mno-avx -fno-delete-null-pointer-checks -O2 --param=3Da=
llow-store-data-races=3D0 -Wframe-larger-than=3D1024 -fno-stack-protector -=
Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-c=
alls -fno-var-tracking-assignments -g -pg -Wdeclaration-after-statement -Wn=
o-pointer-sign -fno-strict-overflow -fconserve-stack -Werror=3Dimplicit-int=
 -Werror=3Dstrict-prototypes -Werror=3Ddate-time -DCC_HAVE_ASM_GOTO  -DMODU=
LE  -D"KBUILD_STR(s)=3D\#s" -D"KBUILD_BASENAME=3DKBUILD_STR(transport)"  -D=
"KBUILD_MODNAME=3DKBUILD_STR(sctp)" -c -o net/sctp/transport.o /OE/build/ow=
pb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/net/sctp/transpo=
rt.c

source_net/sctp/transport.o :=3D /OE/build/owpb/webos-ports/tmp-glibc/work-=
shared/qemux86/kernel-source/net/sctp/transport.c

deps_net/sctp/transport.o :=3D \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/slab.h \
    $(wildcard include/config/slab/debug.h) \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/kmemcheck.h) \
    $(wildcard include/config/failslab.h) \
    $(wildcard include/config/memcg/kmem.h) \
    $(wildcard include/config/slab.h) \
    $(wildcard include/config/slub.h) \
    $(wildcard include/config/slob.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/tracing.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/gfp.h \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/cma.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/virtual.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/stringify.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/sparsemem.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
    $(wildcard include/config/nodes/span/other/nodes.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/typecheck.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/preempt.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/context/tracking.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/linkage.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/64bit.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/compiler-gcc4.h \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/types.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/types.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/asm-generic/types.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/int-ll64.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/asm-generic/int-ll64.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/bitsperlong.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/bitsperlong.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/asm-generic/bitsperlong.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/posix_types.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/stddef.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/stddef.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/posix_types.h \
    $(wildcard include/config/x86/32.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/posix_types_32.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/asm-generic/posix_types.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/linkage.h \
    $(wildcard include/config/x86/64.h) \
    $(wildcard include/config/x86/alignment/16.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/const.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/panic/timeout.h) \
    $(wildcard include/config/ring/buffer.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/sysroots/x86_64-linux/usr/lib/i586-w=
ebos-linux/gcc/i586-webos-linux/4.9.2/include/stdarg.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/bitops.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/bitops.h \
    $(wildcard include/config/x86/cmov.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/alternative.h \
    $(wildcard include/config/paravirt.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/asm.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/ptrace.h \
    $(wildcard include/config/x86/debugctlmsr.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/segment.h \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/x86/32/lazy/gs.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/page_types.h \
    $(wildcard include/config/physical/start.h) \
    $(wildcard include/config/physical/align.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/page_32_types.h \
    $(wildcard include/config/highmem4g.h) \
    $(wildcard include/config/highmem64g.h) \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/x86/pae.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/ptrace.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/ptrace-abi.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/processor-flags.h \
    $(wildcard include/config/vm86.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/processor-flags.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/paravirt_types.h \
    $(wildcard include/config/x86/local/apic.h) \
    $(wildcard include/config/paravirt/debug.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/desc_defs.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/kmap_types.h \
    $(wildcard include/config/debug/highmem.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/kmap_types.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/pgtable_types.h \
    $(wildcard include/config/mem/soft/dirty.h) \
    $(wildcard include/config/proc/fs.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/pgtable_32_types.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/pgtable-2level_types.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/pgtable-nopud.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/pgtable-nopmd.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/spinlock_types.h \
    $(wildcard include/config/paravirt/spinlocks.h) \
    $(wildcard include/config/nr/cpus.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/qrwlock_types.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/ptrace.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/cpufeature.h \
    $(wildcard include/config/x86/feature/names.h) \
    $(wildcard include/config/x86/debug/static/cpu/has.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/required-features.h \
    $(wildcard include/config/x86/minimum/cpu/family.h) \
    $(wildcard include/config/math/emulation.h) \
    $(wildcard include/config/x86/cmpxchg64.h) \
    $(wildcard include/config/x86/use/3dnow.h) \
    $(wildcard include/config/x86/p6/nop.h) \
    $(wildcard include/config/matom.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/disabled-features.h \
    $(wildcard include/config/x86/intel/mpx.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/rmwcc.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/barrier.h \
    $(wildcard include/config/x86/ppro/fence.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/nops.h \
    $(wildcard include/config/mk7.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/bitops/fls64.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/bitops/find.h \
    $(wildcard include/config/generic/find/first/bit.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/bitops/sched.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/arch_hweight.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/bitops/const_hweight.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/bitops/le.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/byteorder.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/byteorder/little_endian.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/byteorder/little_endian.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/swab.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/swab.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/swab.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/byteorder/generic.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/bitops/ext2-atomic-setbit.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/init.h \
    $(wildcard include/config/broken/rodata.h) \
    $(wildcard include/config/lto.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/kern_levels.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/kernel.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/sysinfo.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/cache.h \
    $(wildcard include/config/x86/l1/cache/shift.h) \
    $(wildcard include/config/x86/internode/cache/shift.h) \
    $(wildcard include/config/x86/vsmp.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/dynamic_debug.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/string.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/string.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/string_32.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/errno.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/errno.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/errno.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/asm-generic/errno.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/asm-generic/errno-base.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/div64.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/preempt.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/percpu.h \
    $(wildcard include/config/x86/64/smp.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/percpu.h \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/threads.h \
    $(wildcard include/config/base/small.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
    $(wildcard include/config/debug/stack/usage.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/bug.h \
    $(wildcard include/config/generic/bug.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/bug.h \
    $(wildcard include/config/debug/bugverbose.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/thread_info.h \
    $(wildcard include/config/ia32/emulation.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/page.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/page_32.h \
    $(wildcard include/config/x86/3dnow.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/range.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/memory_model.h \
    $(wildcard include/config/sparsemem/vmemmap.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/getorder.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/processor.h \
    $(wildcard include/config/m486.h) \
    $(wildcard include/config/xen.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/vm86.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/vm86.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/math_emu.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/sigcontext.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/sigcontext.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/current.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/msr.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/msr.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/msr-index.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/ioctl.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/ioctl.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/ioctl.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/asm-generic/ioctl.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/cpumask.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
    $(wildcard include/config/disable/obsolete/cpumask/functions.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/bitmap.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/paravirt.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/special_insns.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/personality.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/personality.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/err.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/irqflags.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/atomic.h \
    $(wildcard include/config/arch/has/atomic/or.h) \
    $(wildcard include/config/generic/atomic64.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/atomic.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/cmpxchg.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/cmpxchg_32.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/atomic64_32.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/atomic-long.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/bottom_half.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/preempt_mask.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/spinlock_types.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/prove/rcu.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/rwlock_types.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/spinlock.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/jump_label.h \
    $(wildcard include/config/jump/label.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/qrwlock.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/qrwlock.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/rwlock.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/spinlock_api_smp.h \
    $(wildcard include/config/inline/spin/lock.h) \
    $(wildcard include/config/inline/spin/lock/bh.h) \
    $(wildcard include/config/inline/spin/lock/irq.h) \
    $(wildcard include/config/inline/spin/lock/irqsave.h) \
    $(wildcard include/config/inline/spin/trylock.h) \
    $(wildcard include/config/inline/spin/trylock/bh.h) \
    $(wildcard include/config/uninline/spin/unlock.h) \
    $(wildcard include/config/inline/spin/unlock/bh.h) \
    $(wildcard include/config/inline/spin/unlock/irq.h) \
    $(wildcard include/config/inline/spin/unlock/irqrestore.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/rwlock_api_smp.h \
    $(wildcard include/config/inline/read/lock.h) \
    $(wildcard include/config/inline/write/lock.h) \
    $(wildcard include/config/inline/read/lock/bh.h) \
    $(wildcard include/config/inline/write/lock/bh.h) \
    $(wildcard include/config/inline/read/lock/irq.h) \
    $(wildcard include/config/inline/write/lock/irq.h) \
    $(wildcard include/config/inline/read/lock/irqsave.h) \
    $(wildcard include/config/inline/write/lock/irqsave.h) \
    $(wildcard include/config/inline/read/trylock.h) \
    $(wildcard include/config/inline/write/trylock.h) \
    $(wildcard include/config/inline/read/unlock.h) \
    $(wildcard include/config/inline/write/unlock.h) \
    $(wildcard include/config/inline/read/unlock/bh.h) \
    $(wildcard include/config/inline/write/unlock/bh.h) \
    $(wildcard include/config/inline/read/unlock/irq.h) \
    $(wildcard include/config/inline/write/unlock/irq.h) \
    $(wildcard include/config/inline/read/unlock/irqrestore.h) \
    $(wildcard include/config/inline/write/unlock/irqrestore.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/wait.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/wait.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/seqlock.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/nodemask.h \
    $(wildcard include/config/movable/node.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/page-flags-layout.h \
  include/generated/bounds.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/memory_hotplug.h \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/notifier.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/mutex/spin/on/owner.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/osq_lock.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/rwsem.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/srcu.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/rcupdate.h \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/rcu/trace.h) \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/rcu/user/qs.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/rcu/nocb/cpu/all.h) \
    $(wildcard include/config/no/hz/full/sysidle.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/completion.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/debugobjects.h \
    $(wildcard include/config/debug/objects/free.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/rcutree.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/sysfs.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/timer.h \
    $(wildcard include/config/timer/stats.h) \
    $(wildcard include/config/debug/objects/timers.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/ktime.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/time64.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/time.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/jiffies.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/timex.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/timex.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/param.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/param.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/asm-generic/param.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/timex.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/tsc.h \
    $(wildcard include/config/x86/tsc.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/timekeeping.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/smp.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/smp.h \
    $(wildcard include/config/x86/io/apic.h) \
    $(wildcard include/config/x86/32/smp.h) \
    $(wildcard include/config/debug/nmi/selftest.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/mpspec.h \
    $(wildcard include/config/eisa.h) \
    $(wildcard include/config/x86/mpparse.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/mpspec_def.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/x86_init.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/bootparam.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/screen_info.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/screen_info.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/apm_bios.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/apm_bios.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/edd.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/edd.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/e820.h \
    $(wildcard include/config/efi.h) \
    $(wildcard include/config/hibernation.h) \
    $(wildcard include/config/memtest.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/e820.h \
    $(wildcard include/config/intel/txt.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/ioport.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/ist.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/ist.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/video/edid.h \
    $(wildcard include/config/x86.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/video/edid.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/apicdef.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/apic.h \
    $(wildcard include/config/x86/x2apic.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/pm.h \
    $(wildcard include/config/vt/console/sleep.h) \
    $(wildcard include/config/pm.h) \
    $(wildcard include/config/pm/clk.h) \
    $(wildcard include/config/pm/generic/domains.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/fixmap.h \
    $(wildcard include/config/x86/vsyscall/emulation.h) \
    $(wildcard include/config/paravirt/clock.h) \
    $(wildcard include/config/provide/ohci1394/dma/init.h) \
    $(wildcard include/config/pci/mmconfig.h) \
    $(wildcard include/config/x86/intel/mid.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/acpi.h \
    $(wildcard include/config/acpi.h) \
    $(wildcard include/config/acpi/numa.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/acpi/pdc_intel.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/numa.h \
    $(wildcard include/config/numa/emu.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/topology.h \
    $(wildcard include/config/x86/ht.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/topology.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/numa_32.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/mmu.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/realmode.h \
    $(wildcard include/config/acpi/sleep.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/io.h \
    $(wildcard include/config/mtrr.h) \
  arch/x86/include/generated/asm/early_ioremap.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/early_ioremap.h \
    $(wildcard include/config/generic/early/ioremap.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/iomap.h \
    $(wildcard include/config/has/ioport/map.h) \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/generic/iomap.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/pci_iomap.h \
    $(wildcard include/config/no/generic/pci/ioport/map.h) \
    $(wildcard include/config/generic/pci/iomap.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/vmalloc.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/rbtree.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/pvclock.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/clocksource.h \
    $(wildcard include/config/arch/clocksource/data.h) \
    $(wildcard include/config/clocksource/watchdog.h) \
    $(wildcard include/config/clksrc/of.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/clocksource.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/pvclock-abi.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/fixmap.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/idle.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/io_apic.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/irq_vectors.h \
    $(wildcard include/config/have/kvm.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/pfn.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/kmemleak.h \
    $(wildcard include/config/debug/kmemleak.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/random.h \
    $(wildcard include/config/arch/random.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/random.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/irqnr.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/irqnr.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/archrandom.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/net/sctp/sctp.h \
    $(wildcard include/config/ipv6.h) \
    $(wildcard include/config/ip/sctp.h) \
    $(wildcard include/config/sctp/dbg/objcnt.h) \
    $(wildcard include/config/sctp/dbg/objcount.h) \
    $(wildcard include/config/sysctl.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/in.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/in.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/socket.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/socket.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/asm-generic/socket.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/sockios.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/asm-generic/sockios.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/sockios.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/uio.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/uio.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/socket.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/tty.h \
    $(wildcard include/config/tty.h) \
    $(wildcard include/config/audit.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/fs.h \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/ima.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/fs/xip.h) \
    $(wildcard include/config/migration.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/kdev_t.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/kdev_t.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/dcache.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/rculist.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/rculist_bl.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/list_bl.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/bit_spinlock.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/lockref.h \
    $(wildcard include/config/arch/use/cmpxchg/lockref.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/path.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/stat.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/stat.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/stat.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/uidgid.h \
    $(wildcard include/config/user/ns.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/highuid.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/list_lru.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/radix-tree.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/pid.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/capability.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/capability.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/semaphore.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/fiemap.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/shrinker.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/migrate_mode.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/percpu-rwsem.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/blk_types.h \
    $(wildcard include/config/blk/cgroup.h) \
    $(wildcard include/config/blk/dev/integrity.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/fs.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/limits.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/quota.h \
    $(wildcard include/config/quota/netlink/interface.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/percpu_counter.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/dqblk_xfs.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/dqblk_v1.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/dqblk_v2.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/dqblk_qtree.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/projid.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/quota.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/nfs_fs_i.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/fcntl.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/fcntl.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/fcntl.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/asm-generic/fcntl.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/major.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/linux/termios.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/termios.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/asm-generic/termios.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/uaccess.h \
    $(wildcard include/config/x86/intel/usercopy.h) \
    $(wildcard include/config/debug/strict/user/copy/checks.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/smap.h \
    $(wildcard include/config/x86/smap.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/asm/uaccess_32.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/asm-generic/termios.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/termbits.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/asm-generic/termbits.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/ar=
ch/x86/include/uapi/asm/ioctls.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/uapi/asm-generic/ioctls.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/tty_driver.h \
    $(wildcard include/config/console/poll.h) \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/cdev.h \
  /OE/build/owpb/webos-ports/tmp-glibc/work-shared/qemux86/kernel-source/in=
clude/linux/kobject.h \
    $(wildcard include/config/uevent/help

--gh4H09KImyIEQ1se--

--ftQmbtOmUf2cr8rB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUsTS8ACgkQN1Ujt2V2gBz7bwCbBITXY79UerwGtiCbjumYaH6d
X+cAoKppKTSxLJETzMfFFaMEbeDmrjNJ
=jUb+
-----END PGP SIGNATURE-----

--ftQmbtOmUf2cr8rB--
