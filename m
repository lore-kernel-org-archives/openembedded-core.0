Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1A61F791A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 02:41:40 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id 93-v6so8595550qks.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 19:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=7yrShGgOis/ErKs+4LbEurtoWlIo/RGxJePsWMSFndM=;
	b=VNeNVLpAuNYj/MytYWAXo87xf+A7KNdR3W2v9sVlSyyvoQx32E3RXTIQ6RAirJaZSD
	osrGaYpt7MoYd7HR4/OXhyJ9KBFHyb1QmkF44dcxikP2ciYkGqLumIyvXlPlyy9pQAQk
	7nDrPbGmGbwH2ePhpDRaGXSHPEZEXdJ3Sx41b7NLqXzLRG+x5yIAwB4+gKNKl0zpEyuA
	mu1P5viuQpgjvVeNO7dWmb7FyLfh1NzJxrny6I7mbXhVUCX3ogHOKEc4m5tNWRQ/emPK
	CmlGlKnYKbpx01yTqJ44jl7B/Kkl2zvtG130iIV04KVvZvkYvLQ5A8L8Ai+vvgex8fEe
	xU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=7yrShGgOis/ErKs+4LbEurtoWlIo/RGxJePsWMSFndM=;
	b=KcoC9JWjgpbxWDALVgPUslsgRtPj4z8Udhb8mDq/AjVDa4RldQxMNVSC1DQvEiCzEC
	r2P+aYMI+VWGUdgnrVTnwWrfmQzjMO5OKkpt6DbSPbAwQ/TP0IydV0aYFe6Y7S/j8hPy
	h+AtTzZ2/7JtCeof5VF4Db3pQKJkhZn2qMwTHASy6eNLml/TUZeI8dg47YuRxHV6Tdjh
	h2j5Ifi/shkFdCNJaHamjvuLmmN/M75b4ClqQ598CybSzSfDVMBzcGtA8e+1X0SxBmFu
	r2fl9Ki+25O7GFmcGznUpiQSxNWSP2/68DmGGe+oO1EZZl7PMZzReSnIp7ujInSLMD2o
	vmXw==
X-Gm-Message-State: AOUpUlE0my/Goy9zqK7tEgUMVeSR5kNXdaY0+9BpsL8t9OtZuKGihhC7
	z7azoEbTg+gIy6CPSxH08sUuXE3L1UpDKbArQ1o=
X-Google-Smtp-Source: AA+uWPy4B/EAPBuXu480oxnbX7Gz1MKXqjSPLcFMTdB8fKq3tMULjaTAzf5K/IrxsRkf3ZX/4TBQQXvO6OrHWAefVJc=
X-Received: by 2002:a37:1be4:: with SMTP id
	m97-v6mr12694577qkh.12.1534732901545; 
	Sun, 19 Aug 2018 19:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1534699224.git.raj.khem@gmail.com>
	<74b92c8785cfa4377a1738f28e3991d6adee321f.1534699224.git.raj.khem@gmail.com>
	<f64a8311-b32f-3074-96dd-ff7364a43b2d@windriver.com>
In-Reply-To: <f64a8311-b32f-3074-96dd-ff7364a43b2d@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 Aug 2018 19:41:15 -0700
Message-ID: <CAMKF1srgDJK9M7=y5LGxB-93FGk-dwyh0W+ALyC5a0_NidkE8Q@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] gdb: Upgrade to 8.1.1
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
X-List-Received-Date: Mon, 20 Aug 2018 02:41:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 19, 2018 at 7:19 PM ChenQi <Qi.Chen@windriver.com> wrote:
>
> There's a build failure on autobuilder.
>
> https://autobuilder.yocto.io/builders/nightly-musl-x86-64/builds/700/step=
s/BuildImages/logs/stdio
>

 I pushed a patch to pull branch which should fix it
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/mast=
er&id=3Da05cc1ee8eb1cb05064164a9ae62db6dc78d022b

> | x86_64-poky-linux-musl-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse --sysroot=3D/home/pokybuild/yocto-autobuilder/yocto-worker/ni=
ghtly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/gdb/8.1.1-r=
0/recipe-sysroot  -shared -fPIC -Wl,--soname=3Dlibinproctrace.so -Wl,--no-u=
ndefined -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/=
home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/bui=
ld/tmp/work/core2-64-poky-linux-musl/gdb/8.1.1-r0=3D/usr/src/debug/gdb/8.1.=
1-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-autobuilder/yocto-worker/ni=
ghtly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/gdb/8.1.1-r=
0/recipe-sysroot=3D -fdebug-prefix-map=3D/home/pokybuild/yocto-autobuilder/=
yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-m=
usl/gdb/8.1.1-r0/recipe-sysroot-native=3D  -fvisibility-inlines-hidden    -=
I. -I../../../gdb-8.1.1/gdb/gdbserver -I../../../gdb-8.1.1/gdb/gdbserver/..=
/common -I../../../gdb-8.1.1/gdb/gdbserver/../regformats -I../../../gdb-8.1=
.1/gdb/gdbserver/.. -I../../../gdb-8.1.1/gdb/gdbserver/../../include -I../.=
./../gdb-8.1.1/gdb/gdbserver/../gnulib/import -Ibuild-gnulib-gdbserver/impo=
rt  -Wall -Wpointer-arith -Wno-unused -Wunused-value -Wunused-function -Wno=
-switch -Wno-char-subscripts -Wempty-body -Wunused-but-set-parameter -Wunus=
ed-but-set-variable -Wno-sign-compare -Wno-narrowing -Wno-error=3Dmaybe-uni=
nitialized   -DGDBSERVER \
> | -static-libstdc++ -static-libgcc -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--a=
s-needed -Wl,--dynamic-list=3D../../../gdb-8.1.1/gdb/gdbserver/proc-service=
.list -o libinproctrace.so ax-ipa.o common-utils-ipa.o errors-ipa.o format-=
ipa.o print-utils-ipa.o regcache-ipa.o remote-utils-ipa.o rsp-low-ipa.o tde=
sc-ipa.o tracepoint-ipa.o utils-ipa.o vec-ipaERROR: Task (/home/pokybuild/y=
octo-autobuilder/yocto-worker/nightly-musl-x86-64/build/meta/recipes-devtoo=
ls/gdb/gdb_8.1.1.bb:do_compile) failed with exit code '1'
> .o linux-amd64-ipa.o linux-x86-tdesc-ipa.o arch/amd64-ipa.o -ldl -pthread
> | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/buil=
d/build/tmp/work/core2-64-poky-linux-musl/gdb/8.1.1-r0/recipe-sysroot-nativ=
e/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x=
86_64-poky-linux-musl/8.2.0/ld: common-utils-ipa.o: in function `is_regular=
_file(char const*, int*)':
> | /usr/src/debug/gdb/8.1.1-r0/build-x86_64-poky-linux-musl/gdb/gdbserver/=
../../../gdb-8.1.1/gdb/gdbserver/../common/common-utils.c:419: undefined re=
ference to `rpl_stat'
> | collect2: error: ld returned 1 exit status
> | make[4]: *** [Makefile:414: libinproctrace.so] Error 1
> | make[4]: *** Waiting for unfinished jobs....
> | make[4]: Leaving directory '/home/pokybuild/yocto-autobuilder/yocto-wor=
ker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/gdb/8=
.1.1-r0/build-x86_64-poky-linux-musl/gdb/gdbserver'
> | make[3]: *** [Makefile:2027: subdir_do] Error 1
> | make[3]: Leaving directory '/home/pokybuild/yocto-autobuilder/yocto-wor=
ker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/gdb/8=
.1.1-r0/build-x86_64-poky-linux-musl/gdb'
> | make[2]: *** [Makefile:1621: all] Error 2
> | make[2]: Leaving directory '/home/pokybuild/yocto-autobuilder/yocto-wor=
ker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/gdb/8=
.1.1-r0/build-x86_64-poky-linux-musl/gdb'
> | make[1]: *** [Makefile:8793: all-gdb] Error 2
> | make[1]: Leaving directory '/home/pokybuild/yocto-autobuilder/yocto-wor=
ker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/gdb/8=
.1.1-r0/build-x86_64-poky-linux-musl'
> | make: *** [Makefile:850: all] Error 2
> | ERROR: oe_runmake failed
>
>
> Best Regards,
> Chen Qi
>
> On 08/20/2018 01:23 AM, Khem Raj wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gdb/{gdb-8.1.inc =3D> gdb-8.1.1.inc}      | 4 ++--
>  ...{gdb-cross-canadian_8.1.bb =3D> gdb-cross-canadian_8.1.1.bb} | 0
>  .../gdb/{gdb-cross_8.1.bb =3D> gdb-cross_8.1.1.bb}              | 0
>  meta/recipes-devtools/gdb/{gdb_8.1.bb =3D> gdb_8.1.1.bb}        | 0
>  4 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/gdb/{gdb-8.1.inc =3D> gdb-8.1.1.inc} (89%)
>  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.1.bb =3D> gdb-cro=
ss-canadian_8.1.1.bb} (100%)
>  rename meta/recipes-devtools/gdb/{gdb-cross_8.1.bb =3D> gdb-cross_8.1.1.=
bb} (100%)
>  rename meta/recipes-devtools/gdb/{gdb_8.1.bb =3D> gdb_8.1.1.bb} (100%)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-8.1.inc b/meta/recipes-devtool=
s/gdb/gdb-8.1.1.inc
> similarity index 89%
> rename from meta/recipes-devtools/gdb/gdb-8.1.inc
> rename to meta/recipes-devtools/gdb/gdb-8.1.1.inc
> index 4d9faa2d4b..ad80dd3e4d 100644
> --- a/meta/recipes-devtools/gdb/gdb-8.1.inc
> +++ b/meta/recipes-devtools/gdb/gdb-8.1.1.inc
> @@ -18,6 +18,6 @@ SRC_URI =3D "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.x=
z \
>             file://package_devel_gdb_patches_120-sigprocmask-invalid-call=
.patch \
>             file://gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.p=
atch \
>  "
> -SRC_URI[md5sum] =3D "f46487561f9a16916a8102316f7fd105"
> -SRC_URI[sha256sum] =3D "af61a0263858e69c5dce51eab26662ff3d2ad9aa68da9583=
e8143b5426be4b34"
> +SRC_URI[md5sum] =3D "372fa63a53adeee1bfbfd581d8da9e34"
> +SRC_URI[sha256sum] =3D "97dcc3169bd430270fc29adb65145846a58c1b55cdbb7338=
2a4a89307bdad03c"
>
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_8.1.bb b/meta/r=
ecipes-devtools/gdb/gdb-cross-canadian_8.1.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross-canadian_8.1.bb
> rename to meta/recipes-devtools/gdb/gdb-cross-canadian_8.1.1.bb
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_8.1.bb b/meta/recipes-de=
vtools/gdb/gdb-cross_8.1.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross_8.1.bb
> rename to meta/recipes-devtools/gdb/gdb-cross_8.1.1.bb
> diff --git a/meta/recipes-devtools/gdb/gdb_8.1.bb b/meta/recipes-devtools=
/gdb/gdb_8.1.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb_8.1.bb
> rename to meta/recipes-devtools/gdb/gdb_8.1.1.bb
>
>

