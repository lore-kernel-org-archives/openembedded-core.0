Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 68AB4731F6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Apr 2016 08:35:19 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id zm5so108040964pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Apr 2016 01:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=6+sLl4gOVqGtA/y4nTnLPsynVZdCK1d1PkYXOYk4Fck=;
	b=Loieq1+ypDA/yD4t03iaja+7Hrc1F4EJ8gIIydMIQapqHUcXALlnGCj+RXslSze99/
	N1Vq966M36HBA7mTUKk9SEEd34l77h076X+cnvAWOW6SGhhXc7py7qtAdJD9dAgKD7PI
	QAEacLTdALcwomiIm23FwrCfMHXpyQY3tMEOkMJV3nvk2xGqRGvrzSGOPusbXk2NeAKm
	vDbhNiQOsy9etpJPtBQqNVNNKIrwrV1ZDY4+PlK/2nxwbvPzLHQyAeNdFDLkOg0o5LsJ
	0jb/SCv51nROk233HC/Q4qwNujF8lhpTjQA0OWm7jJAdigtcK/jP+htpJi+1RVBV2MYf
	73dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=6+sLl4gOVqGtA/y4nTnLPsynVZdCK1d1PkYXOYk4Fck=;
	b=NPxIMruuc7zm0m1maS+1q0+23nUl5NKal9MBF3xVIp0py5NI54KjzpDyW72jTwxxuN
	2+vHe9CLSQxLtznzjTHrKm8H6I2litdQUrImsmxd6wyOICaoN+ZNXEOqti4JUpUvX3dN
	sbaRIJgFZULZu/wGQY0tHnYYOYJ9rn/vVS+HB1+mhjVNIyH8AtoFUcRdUV5AExzHkMs/
	OGk5MW5IuNo1EixRl4wKakB4iw47FX0ZelhwFByIFWzg95o8Upo7dhRoEvuFpZh7Odue
	AYr4Yoc6xIDlSZE8hu9Pl2HuLeY6SXpO05PKcZAHNzA9+I0MVJRGB0vyh/msWT9R0uAH
	PQRQ==
X-Gm-Message-State: AD7BkJIhPFYBT03waZU+GU8rBwsqoWB7tEFwE2S7BbIoXJwvhIv2JyPbjhWeI3oYj9NoJw==
X-Received: by 10.66.220.66 with SMTP id pu2mr37357468pac.115.1459586120662;
	Sat, 02 Apr 2016 01:35:20 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:1156:ef7c:5e3a:2bb9?
	([2601:646:8800:5a9a:1156:ef7c:5e3a:2bb9])
	by smtp.gmail.com with ESMTPSA id
	g74sm25092049pfj.1.2016.04.02.01.35.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Apr 2016 01:35:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1459501616-4775-1-git-send-email-ross.burton@intel.com>
Date: Sat, 2 Apr 2016 01:35:15 -0700
Message-Id: <11906137-C690-4321-BADB-9279B87254C8@gmail.com>
References: <1459501616-4775-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta: remove obsolete architectures
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
X-List-Received-Date: Sat, 02 Apr 2016 08:35:20 -0000
X-Groupsio-MsgNum: 80425
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BDB87017-2ED0-4E86-BE61-C1B96547D0E3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BDB87017-2ED0-4E86-BE61-C1B96547D0E3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 1, 2016, at 2:06 AM, Ross Burton <ross.burton@intel.com> wrote:
>=20
> Remove ancient and obsolete architectures from openembedded-core, =
they've no
> real users and are causing complications that can be now removed.

Applied !

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/classes/cmake.bbclass                         |   4 -
> meta/classes/insane.bbclass                        |  30 ---
> meta/classes/libc-package.bbclass                  |   7 -
> meta/classes/qemu.bbclass                          |  12 -
> meta/classes/siteinfo.bbclass                      |  26 --
> meta/conf/bitbake.conf                             |   7 -
> meta/conf/machine/include/mips/README              |  36 ---
> meta/conf/machine/include/mips/arch-mips.inc       | 102 --------
> meta/conf/machine/include/powerpc/README           |  17 --
> meta/conf/machine/include/powerpc/arch-powerpc.inc |  34 ---
> .../machine/include/powerpc/arch-powerpc64.inc     |  14 --
> meta/conf/machine/include/sh/README                |  11 -
> meta/conf/machine/include/sh/arch-sh.inc           |   9 -
> meta/conf/machine/include/tune-mips32.inc          |  25 --
> meta/conf/machine/include/tune-mips32r2.inc        |  17 --
> meta/conf/machine/include/tune-mips64.inc          |   3 -
> meta/conf/machine/include/tune-octeon.inc          |  32 ---
> meta/conf/machine/include/tune-power5.inc          |  21 --
> meta/conf/machine/include/tune-power6.inc          |  21 --
> meta/conf/machine/include/tune-power7.inc          |  21 --
> meta/conf/machine/include/tune-ppc476.inc          |  14 --
> meta/conf/machine/include/tune-ppc603e.inc         |  14 --
> meta/conf/machine/include/tune-ppc7400.inc         |  14 --
> meta/conf/machine/include/tune-ppce300c2.inc       |  11 -
> meta/conf/machine/include/tune-ppce300c3.inc       |  23 --
> meta/conf/machine/include/tune-ppce500.inc         |  20 --
> meta/conf/machine/include/tune-ppce500mc.inc       |  14 --
> meta/conf/machine/include/tune-ppce500v2.inc       |  20 --
> meta/conf/machine/include/tune-ppce5500.inc        |  20 --
> meta/conf/machine/include/tune-ppce6500.inc        |  21 --
> meta/conf/machine/include/tune-sh3.inc             |  17 --
> meta/conf/machine/include/tune-sh4.inc             |  34 ---
> meta/conf/machine/qemumips.conf                    |  13 -
> meta/conf/machine/qemumips64.conf                  |  13 -
> meta/conf/machine/qemuppc.conf                     |  13 -
> meta/site/mips-common                              |  56 -----
> meta/site/mips-linux                               |  79 ------
> meta/site/mips-linux-uclibc                        |  80 ------
> meta/site/mips64-linux                             |  83 -------
> meta/site/mips64-linux-uclibc                      |  83 -------
> meta/site/mips64el-linux                           |  82 ------
> meta/site/mips64el-linux-uclibc                    | 108 --------
> meta/site/mipsel-linux                             |  79 ------
> meta/site/mipsel-linux-uclibc                      | 100 --------
> meta/site/powerpc-common                           |  14 --
> meta/site/powerpc-darwin                           |   7 -
> meta/site/powerpc-linux                            |  16 --
> meta/site/powerpc32-linux                          | 275 =
---------------------
> meta/site/powerpc64-linux                          |  39 ---
> 49 files changed, 1811 deletions(-)
> delete mode 100644 meta/conf/machine/include/mips/README
> delete mode 100644 meta/conf/machine/include/mips/arch-mips.inc
> delete mode 100644 meta/conf/machine/include/powerpc/README
> delete mode 100644 meta/conf/machine/include/powerpc/arch-powerpc.inc
> delete mode 100644 =
meta/conf/machine/include/powerpc/arch-powerpc64.inc
> delete mode 100644 meta/conf/machine/include/sh/README
> delete mode 100644 meta/conf/machine/include/sh/arch-sh.inc
> delete mode 100644 meta/conf/machine/include/tune-mips32.inc
> delete mode 100644 meta/conf/machine/include/tune-mips32r2.inc
> delete mode 100644 meta/conf/machine/include/tune-mips64.inc
> delete mode 100644 meta/conf/machine/include/tune-octeon.inc
> delete mode 100644 meta/conf/machine/include/tune-power5.inc
> delete mode 100644 meta/conf/machine/include/tune-power6.inc
> delete mode 100644 meta/conf/machine/include/tune-power7.inc
> delete mode 100644 meta/conf/machine/include/tune-ppc476.inc
> delete mode 100644 meta/conf/machine/include/tune-ppc603e.inc
> delete mode 100644 meta/conf/machine/include/tune-ppc7400.inc
> delete mode 100644 meta/conf/machine/include/tune-ppce300c2.inc
> delete mode 100644 meta/conf/machine/include/tune-ppce300c3.inc
> delete mode 100644 meta/conf/machine/include/tune-ppce500.inc
> delete mode 100644 meta/conf/machine/include/tune-ppce500mc.inc
> delete mode 100644 meta/conf/machine/include/tune-ppce500v2.inc
> delete mode 100644 meta/conf/machine/include/tune-ppce5500.inc
> delete mode 100644 meta/conf/machine/include/tune-ppce6500.inc
> delete mode 100644 meta/conf/machine/include/tune-sh3.inc
> delete mode 100644 meta/conf/machine/include/tune-sh4.inc
> delete mode 100644 meta/conf/machine/qemumips.conf
> delete mode 100644 meta/conf/machine/qemumips64.conf
> delete mode 100644 meta/conf/machine/qemuppc.conf
> delete mode 100644 meta/site/mips-common
> delete mode 100644 meta/site/mips-linux
> delete mode 100644 meta/site/mips-linux-uclibc
> delete mode 100644 meta/site/mips64-linux
> delete mode 100644 meta/site/mips64-linux-uclibc
> delete mode 100644 meta/site/mips64el-linux
> delete mode 100644 meta/site/mips64el-linux-uclibc
> delete mode 100644 meta/site/mipsel-linux
> delete mode 100644 meta/site/mipsel-linux-uclibc
> delete mode 100644 meta/site/powerpc-common
> delete mode 100644 meta/site/powerpc-darwin
> delete mode 100644 meta/site/powerpc-linux
> delete mode 100644 meta/site/powerpc32-linux
> delete mode 100644 meta/site/powerpc64-linux
>=20
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 22cd61e..d7a0f12 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -31,10 +31,6 @@ OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native =3D =
"BOTH"
> # which do not always match TARGET_ARCH, so all the necessary
> # conversions should happen here.
> def map_target_arch_to_uname_arch(target_arch):
> -    if target_arch =3D=3D "powerpc":
> -        return "ppc"
> -    if target_arch =3D=3D "powerpc64":
> -        return "ppc64"
>     return target_arch
>=20
> cmake_do_generate_toolchain_file() {
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index b9adea7..046697d 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -72,44 +72,22 @@ def package_qa_get_machine_dict():
>                         "aarch64_be" :(183,    0,    0,          =
False,         64),
>                         "arm" :       (40,    97,    0,          True, =
         32),
>                         "armeb":      (40,    97,    0,          =
False,         32),
> -                        "powerpc":    (20,     0,    0,          =
False,         32),
> -                        "powerpc64":  (21,     0,    0,          =
False,         64),
>                         "i386":       ( 3,     0,    0,          True, =
         32),
>                         "i486":       ( 3,     0,    0,          True, =
         32),
>                         "i586":       ( 3,     0,    0,          True, =
         32),
>                         "i686":       ( 3,     0,    0,          True, =
         32),
>                         "x86_64":     (62,     0,    0,          True, =
         64),
> -                        "ia64":       (50,     0,    0,          =
True,          64),
> -                        "alpha":      (36902,  0,    0,          =
True,          64),
> -                        "hppa":       (15,     3,    0,          =
False,         32),
>                         "m68k":       ( 4,     0,    0,          =
False,         32),
> -                        "mips":       ( 8,     0,    0,          =
False,         32),
> -                        "mipsel":     ( 8,     0,    0,          =
True,          32),
> -                        "mips64":     ( 8,     0,    0,          =
False,         64),
> -                        "mips64el":   ( 8,     0,    0,          =
True,          64),
>                         "nios2":      (113,    0,    0,          True, =
         32),
> -                        "s390":       (22,     0,    0,          =
False,         32),
> -                        "sh4":        (42,     0,    0,          =
True,          32),
> -                        "sparc":      ( 2,     0,    0,          =
False,         32),
> -                        "microblaze":  (189,   0,    0,          =
False,         32),
> -                        "microblazeeb":(189,   0,    0,          =
False,         32),
> -                        "microblazeel":(189,   0,    0,          =
True,          32),
>                       },
>             "linux-uclibc" : {
>                         "arm" :       (  40,    97,    0,          =
True,          32),
>                         "armeb":      (  40,    97,    0,          =
False,         32),
> -                        "powerpc":    (  20,     0,    0,          =
False,         32),
>                         "i386":       (   3,     0,    0,          =
True,          32),
>                         "i486":       (   3,     0,    0,          =
True,          32),
>                         "i586":       (   3,     0,    0,          =
True,          32),
>                         "i686":       (   3,     0,    0,          =
True,          32),
>                         "x86_64":     (  62,     0,    0,          =
True,          64),
> -                        "mips":       (   8,     0,    0,          =
False,         32),
> -                        "mipsel":     (   8,     0,    0,          =
True,          32),
> -                        "mips64":     (   8,     0,    0,          =
False,         64),
> -                        "mips64el":   (   8,     0,    0,          =
True,          64),
> -                        "avr32":      (6317,     0,    0,          =
False,         32),
> -                        "sh4":        (42,       0,    0,          =
True,          32),
>=20
>                       },
>             "linux-musl" : {
> @@ -117,19 +95,11 @@ def package_qa_get_machine_dict():
>                         "aarch64_be" :(183,    0,    0,            =
False,         64),
>                         "arm" :       (  40,    97,    0,          =
True,          32),
>                         "armeb":      (  40,    97,    0,          =
False,         32),
> -                        "powerpc":    (  20,     0,    0,          =
False,         32),
>                         "i386":       (   3,     0,    0,          =
True,          32),
>                         "i486":       (   3,     0,    0,          =
True,          32),
>                         "i586":       (   3,     0,    0,          =
True,          32),
>                         "i686":       (   3,     0,    0,          =
True,          32),
>                         "x86_64":     (  62,     0,    0,          =
True,          64),
> -                        "mips":       (   8,     0,    0,          =
False,         32),
> -                        "mipsel":     (   8,     0,    0,          =
True,          32),
> -                        "mips64":     (   8,     0,    0,          =
False,         64),
> -                        "mips64el":   (   8,     0,    0,          =
True,          64),
> -                        "microblaze":  (189,     0,    0,          =
False,         32),
> -                        "microblazeeb":(189,     0,    0,          =
False,         32),
> -                        "microblazeel":(189,     0,    0,          =
True,          32),
>                       },
>             "uclinux-uclibc" : {
>                         "bfin":       ( 106,     0,    0,          =
True,         32),
> diff --git a/meta/classes/libc-package.bbclass =
b/meta/classes/libc-package.bbclass
> index 467d567..d523746 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -270,13 +270,6 @@ python package_do_split_gconvs () {
>                 "armeb":   " --uint32-align=3D4 --big-endian ",    \
>                 "aarch64": " --uint32-align=3D4 --little-endian ",    =
\
>                 "aarch64_be": " --uint32-align=3D4 --big-endian ",    =
\
> -                "sh4":     " --uint32-align=3D4 --big-endian ",    \
> -                "powerpc": " --uint32-align=3D4 --big-endian ",    \
> -                "powerpc64": " --uint32-align=3D4 --big-endian ",  \
> -                "mips":    " --uint32-align=3D4 --big-endian ",    \
> -                "mips64":  " --uint32-align=3D4 --big-endian ",    \
> -                "mipsel":  " --uint32-align=3D4 --little-endian ", \
> -                "mips64el":" --uint32-align=3D4 --little-endian ", \
>                 "i586":    " --uint32-align=3D4 --little-endian ", \
>                 "i686":    " --uint32-align=3D4 --little-endian ", \
>                 "x86_64":  " --uint32-align=3D4 --little-endian "  }
> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> index c696085..327f84f 100644
> --- a/meta/classes/qemu.bbclass
> +++ b/meta/classes/qemu.bbclass
> @@ -7,10 +7,6 @@ def qemu_target_binary(data):
>     target_arch =3D data.getVar("TARGET_ARCH", True)
>     if target_arch in ("i486", "i586", "i686"):
>         target_arch =3D "i386"
> -    elif target_arch =3D=3D "powerpc":
> -        target_arch =3D "ppc"
> -    elif target_arch =3D=3D "powerpc64":
> -        target_arch =3D "ppc64"
>=20
>     return "qemu-" + target_arch
> #
> @@ -44,11 +40,3 @@ def qemu_run_binary(data, rootfs_path, binary):
>=20
> QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL} =
${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH', True), =
True) or ""}"
> QEMU_OPTIONS[vardeps] +=3D "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
> -
> -QEMU_EXTRAOPTIONS_ppce500v2 =3D " -cpu e500v2"
> -QEMU_EXTRAOPTIONS_ppce500mc =3D " -cpu e500mc"
> -QEMU_EXTRAOPTIONS_ppce5500 =3D " -cpu e5500"
> -QEMU_EXTRAOPTIONS_ppc64e5500 =3D " -cpu e5500"
> -QEMU_EXTRAOPTIONS_ppce6500 =3D " -cpu e6500"
> -QEMU_EXTRAOPTIONS_ppc64e6500 =3D " -cpu e6500"
> -QEMU_EXTRAOPTIONS_ppc7400 =3D " -cpu 7400"
> diff --git a/meta/classes/siteinfo.bbclass =
b/meta/classes/siteinfo.bbclass
> index b715b6c..f2d68c9 100644
> --- a/meta/classes/siteinfo.bbclass
> +++ b/meta/classes/siteinfo.bbclass
> @@ -30,18 +30,7 @@ def siteinfo_data(d):
>         "i586": "endian-little bit-32 ix86-common",
>         "i686": "endian-little bit-32 ix86-common",
>         "ia64": "endian-little bit-64",
> -        "microblaze": "endian-big bit-32 microblaze-common",
> -        "microblazeeb": "endian-big bit-32 microblaze-common",
> -        "microblazeel": "endian-little bit-32 microblaze-common",
> -        "mips": "endian-big bit-32 mips-common",
> -        "mips64": "endian-big bit-64 mips-common",
> -        "mips64el": "endian-little bit-64 mips-common",
> -        "mipsel": "endian-little bit-32 mips-common",
> -        "powerpc": "endian-big bit-32 powerpc-common",
>         "nios2": "endian-little bit-32 nios2-common",
> -        "powerpc64": "endian-big bit-64 powerpc-common",
> -        "ppc": "endian-big bit-32 powerpc-common",
> -        "ppc64": "endian-big bit-64 powerpc-common",
>         "sh3": "endian-little bit-32 sh-common",
>         "sh4": "endian-little bit-32 sh-common",
>         "sparc": "endian-big bit-32",
> @@ -76,21 +65,6 @@ def siteinfo_data(d):
>         "armeb-linux-gnueabi": "armeb-linux",
>         "armeb-linux-uclibceabi": "armeb-linux-uclibc",
>         "armeb-linux-musleabi": "armeb-linux",
> -        "mips-linux-musl": "mips-linux",
> -        "mipsel-linux-musl": "mipsel-linux",
> -        "mips64-linux-musl": "mips-linux",
> -        "mips64el-linux-musl": "mipsel-linux",
> -        "mips64-linux-gnun32": "mips-linux bit-32",
> -        "mips64el-linux-gnun32": "mipsel-linux bit-32",
> -        "powerpc-linux": "powerpc32-linux",
> -        "powerpc-linux-musl": "powerpc-linux powerpc32-linux",
> -        "powerpc-linux-uclibc": "powerpc-linux powerpc32-linux",
> -        "powerpc-linux-gnuspe": "powerpc-linux powerpc32-linux",
> -        "powerpc-linux-muslspe": "powerpc-linux powerpc32-linux",
> -        "powerpc-linux-uclibcspe": "powerpc-linux powerpc32-linux =
powerpc-linux-uclibc",
> -        "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linux",
> -        "powerpc64-linux-muslspe": "powerpc-linux powerpc64-linux",
> -        "powerpc64-linux": "powerpc-linux",
>         "x86_64-cygwin": "bit-64",
>         "x86_64-darwin": "bit-64",
>         "x86_64-darwin9": "bit-64",
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 1c43d73..84f1054 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -524,13 +524,6 @@ BUILDSDK_LDFLAGS =3D "-L${STAGING_LIBDIR} \
>                     -Wl,-rpath,${base_libdir} -Wl,-O1"
>=20
> LINKER_HASH_STYLE ??=3D "gnu"
> -# mips does not support GNU hash style therefore we override
> -LINKER_HASH_STYLE_mips =3D "sysv"
> -LINKER_HASH_STYLE_mipsel =3D "sysv"
> -LINKER_HASH_STYLE_mips64 =3D "sysv"
> -LINKER_HASH_STYLE_mips64el =3D "sysv"
> -LINKER_HASH_STYLE_mips64n32 =3D "sysv"
> -LINKER_HASH_STYLE_mips64eln32 =3D "sysv"
> TARGET_LINK_HASH_STYLE ?=3D =
"${@['-Wl,--hash-style=3Dgnu',''][d.getVar('LINKER_HASH_STYLE', True) !=3D=
 'gnu']}"
>=20
> export LDFLAGS =3D "${TARGET_LDFLAGS}"
> diff --git a/meta/conf/machine/include/mips/README =
b/meta/conf/machine/include/mips/README
> deleted file mode 100644
> index c375f31..0000000
> --- a/meta/conf/machine/include/mips/README
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
> -  - Initial Version
> -
> -MIPS currently defines 12 ABIs.  Combinations of:
> - *) Big/Little Endian
> - *) Hardware/Software Floating Point
> - *) o32, n32, n64 ABI
> -
> -TUNE_ARCH, the GNU canonical arch, is defined as:
> -
> -mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}
> -
> -The package arch is defined in such a way to generated a standard =
naming
> -scheme.  The scheme is: <mips variant>[-nf][-n32]
> -
> -TUNE_PKGARCH is defined as:
> -
> =
-${MIPSPKGSFX_VARIANT_tune-${DEFAULTTUNE}}${MIPSPKGSFX_FPU}${MIPSPKGSFX_AB=
I}
> -
> -The following is a list of MIPS specific variables:
> -
> -MIPSPKGSFX_BYTE - This is defined as either blank and "64" for MIPS64 =
CPUs.
> -
> -MIPSPKGSFX_ENDIAN - For bigendian hardware this is blank, otherwise =
it's
> -defined as "el".
> -
> -MIPSPKGSFX_VARIANT_tune-<tune> - In the default tunings it is set to =
the
> -same value as TUNE_ARCH.  In custom, optimized tunings, the value =
should
> -be modified to more precisely describe the tuning.
> -
> -MIPSPKGSFX_FPU - The value is set to "" or "-nf", where "-nf" =
indicates
> -that the tune is using a non-floating point ABI.
> -
> -MIPSPKGSFX_ABI - This is used to specify an alternative ABI when the =
previous
> -values are not enough to distringuish the package.  "-n32" is added =
when
> -building for N32 ABI.
> diff --git a/meta/conf/machine/include/mips/arch-mips.inc =
b/meta/conf/machine/include/mips/arch-mips.inc
> deleted file mode 100644
> index 89d17e7..0000000
> --- a/meta/conf/machine/include/mips/arch-mips.inc
> +++ /dev/null
> @@ -1,102 +0,0 @@
> -# MIPS Architecture definition
> -# 12 defined ABIs, all combinations of:
> -# *) Big/Little Endian
> -# *) Hardware/Software Floating Point
> -# *) o32, n32, n64 ABI
> -
> -DEFAULTTUNE ?=3D "mips"
> -
> -# Endianess
> -TUNEVALID[bigendian] =3D "Enable big-endian mode"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', =
' -meb', ' -mel', d)}"
> -
> -# ABI flags
> -TUNEVALID[o32] =3D "MIPS o32 ABI"
> -TUNECONFLICTS[o32] =3D "n32 n64"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'o32', ' =
-mabi=3D32', '', d)}"
> -
> -TUNEVALID[n32] =3D "MIPS64 n32 ABI"
> -TUNECONFLICTS[n32] =3D "o32 n64"
> -ABIEXTENSION .=3D "${@bb.utils.contains('TUNE_FEATURES', 'n32', =
'n32', '' ,d)}"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'n32', ' =
-mabi=3Dn32', '', d)}"
> -
> -TUNEVALID[n64] =3D "MIPS64 n64 ABI"
> -TUNECONFLICTS[n64] =3D "o32 n32"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'n64', ' =
-mabi=3D64', '', d)}"
> -
> -# Floating point
> -TUNEVALID[fpu-hard] =3D "Use hardware FPU"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard', ' =
-mhard-float', ' -msoft-float', d)}"
> -TARGET_FPU =3D "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard', '', =
'soft', d)}"
> -
> -# Package naming
> -MIPSPKGSFX_ENDIAN =3D "${@bb.utils.contains('TUNE_FEATURES', =
'bigendian', '', 'el', d)}"
> -MIPSPKGSFX_BYTE =3D "${@bb.utils.contains('TUNE_FEATURES', 'n64' , =
'64', '', d)}"
> -MIPSPKGSFX_BYTE .=3D "${@bb.utils.contains('TUNE_FEATURES', 'n32' , =
'64', '', d)}"
> -MIPSPKGSFX_FPU =3D "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard' =
, '', '-nf', d)}"
> -MIPSPKGSFX_ABI =3D "${@bb.utils.contains('TUNE_FEATURES', 'n32', =
'-n32', '', d)}"
> -
> -TUNE_ARCH =3D "mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}"
> -TUNE_PKGARCH =3D =
"${MIPSPKGSFX_VARIANT_tune-${DEFAULTTUNE}}${MIPSPKGSFX_FPU}${MIPSPKGSFX_AB=
I}"
> -
> -# Base tunes
> -AVAILTUNES +=3D "mips mips64-n32 mips64 mipsel mips64el-n32 mips64el =
mips-nf mips64-nf-n32 mips64-nf mipsel-nf mips64el-nf-n32 mips64el-nf"
> -TUNE_FEATURES_tune-mips =3D "o32 bigendian fpu-hard"
> -BASE_LIB_tune-mips =3D "lib"
> -MIPSPKGSFX_VARIANT_tune-mips =3D "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips =3D "mips"
> -
> -TUNE_FEATURES_tune-mips64-n32 =3D "n32 bigendian fpu-hard"
> -BASE_LIB_tune-mips64-n32 =3D "lib32"
> -MIPSPKGSFX_VARIANT_tune-mips64-n32 =3D "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips64-n32 =3D "mips64-n32"
> -
> -TUNE_FEATURES_tune-mips64 =3D "n64 bigendian fpu-hard"
> -BASE_LIB_tune-mips64 =3D "lib64"
> -MIPSPKGSFX_VARIANT_tune-mips64 =3D "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips64 =3D "mips64"
> -
> -TUNE_FEATURES_tune-mipsel =3D "o32 fpu-hard"
> -BASE_LIB_tune-mipsel =3D "lib"
> -MIPSPKGSFX_VARIANT_tune-mipsel =3D "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mipsel =3D "mipsel"
> -
> -TUNE_FEATURES_tune-mips64el-n32 =3D "n32 fpu-hard"
> -BASE_LIB_tune-mips64el-n32 =3D "lib32"
> -MIPSPKGSFX_VARIANT_tune-mips64el-n32 =3D "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips64el-n32 =3D "mips64el-n32"
> -
> -TUNE_FEATURES_tune-mips64el =3D "n64 fpu-hard"
> -BASE_LIB_tune-mips64el =3D "lib64"
> -MIPSPKGSFX_VARIANT_tune-mips64el =3D "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips64el =3D "mips64el"
> -
> -TUNE_FEATURES_tune-mips-nf =3D "o32 bigendian"
> -BASE_LIB_tune-mips-nf =3D "lib"
> -MIPSPKGSFX_VARIANT_tune-mips-nf =3D "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips-nf =3D "mips-nf"
> -
> -TUNE_FEATURES_tune-mips64-nf-n32 =3D "n32 bigendian"
> -BASE_LIB_tune-mips64-nf-n32 =3D "lib32"
> -MIPSPKGSFX_VARIANT_tune-mips64-nf-n32 =3D "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips64-nf-n32 =3D "mips64-nf-n32"
> -
> -TUNE_FEATURES_tune-mips64-nf =3D "n64 bigendian"
> -BASE_LIB_tune-mips64-nf =3D "lib64"
> -MIPSPKGSFX_VARIANT_tune-mips64-nf =3D "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips64-nf =3D "mips64-nf"
> -
> -TUNE_FEATURES_tune-mipsel-nf =3D "o32"
> -BASE_LIB_tune-mipsel-nf =3D "lib"
> -MIPSPKGSFX_VARIANT_tune-mipsel-nf =3D "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mipsel-nf =3D "mipsel-nf"
> -
> -TUNE_FEATURES_tune-mips64el-nf-n32 =3D "n32"
> -BASE_LIB_tune-mips64el-nf-n32 =3D "lib32"
> -MIPSPKGSFX_VARIANT_tune-mips64el-nf-n32 =3D "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips64el-nf-n32 =3D "mips64el-nf-n32"
> -
> -TUNE_FEATURES_tune-mips64el-nf =3D "n64"
> -BASE_LIB_tune-mips64el-nf =3D "lib64"
> -MIPSPKGSFX_VARIANT_tune-mips64el-nf =3D "${TUNE_ARCH}"
> -PACKAGE_EXTRA_ARCHS_tune-mips64el-nf =3D "mips64el-nf"
> diff --git a/meta/conf/machine/include/powerpc/README =
b/meta/conf/machine/include/powerpc/README
> deleted file mode 100644
> index e87fb50..0000000
> --- a/meta/conf/machine/include/powerpc/README
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
> -  - Initial revision
> -
> -There are 4 primary PowerPC ABIs.
> -# *) Hard/Soft Floating Point
> -# *) 32-bit/64-bit
> -
> -TUNE_ARCH is defined as either "powerpc" or "powerpc64" based on the =
m32
> -or m64 feature.
> -
> -May of the PowerPC package archictures are based on legacy Linux =
names.
> -However, a general naming scheme should be similar to: =
ppc[64][<family>][-nf].
> -(Note: the default package architectures are "powerpc" and =
"powerpc64".)
> -
> -TUNE_PKGARCH is defined as TUNE_PKGARCH_tune-${DEFAULTTUNE}.  All
> -PowerPC tunings are required to define TUNE_PKGARCH_tune-<tune>.
> -
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc =
b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> deleted file mode 100644
> index 9cf6b88..0000000
> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -# Power Architecture definition
> -# Four defined ABIs, all combinations of:
> -# *) Hard/Soft Floating Point
> -# *) 32-bit/64-bit
> -
> -DEFAULTTUNE ?=3D "powerpc"
> -
> -TUNE_PKGARCH =3D "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
> -ABIEXTENSION ?=3D ""
> -
> -TUNEVALID[m32] =3D "Power ELF32 standard ABI"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'm32', ' =
-m32', '', d)}"
> -TUNE_ARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'm32', =
'powerpc', '', d)}"
> -
> -TUNEVALID[fpu-hard] =3D "Use hardware FPU."
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard', ' =
-mhard-float', '', d)}"
> -
> -TUNEVALID[fpu-soft] =3D "Use software FPU."
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'fpu-soft', ' =
-msoft-float', '', d)}"
> -TARGET_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'fpu-soft', =
'soft', '', d)}"
> -
> -TUNEVALID[altivec] =3D "Altivec"
> -
> -# Basic tune definitions
> -AVAILTUNES +=3D "powerpc powerpc-nf"
> -TUNE_FEATURES_tune-powerpc-nf =3D "m32 fpu-soft"
> -BASE_LIB_tune-powerpc-nf =3D "lib"
> -TUNE_PKGARCH_tune-powerpc-nf =3D "powerpc-nf"
> -PACKAGE_EXTRA_ARCHS_tune-powerpc-nf =3D "powerpc-nf"
> -
> -TUNE_FEATURES_tune-powerpc =3D "m32 fpu-hard"
> -BASE_LIB_tune-powerpc =3D "lib"
> -TUNE_PKGARCH_tune-powerpc =3D "powerpc"
> -PACKAGE_EXTRA_ARCHS_tune-powerpc =3D "powerpc"
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc =
b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> deleted file mode 100644
> index 49419b6..0000000
> --- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DEFAULTTUNE ?=3D "powerpc64"
> -
> -require conf/machine/include/powerpc/arch-powerpc.inc
> -
> -TUNEVALID[m64] =3D "Power ELF64 standard ABI"
> -TUNECONFLICTS[m64] =3D "m32 nf"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'm64', ' =
-m64', '', d)}"
> -TUNE_ARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'm64' ], =
'powerpc64', '', d)}"
> -
> -AVAILTUNES +=3D "powerpc64"
> -TUNE_FEATURES_tune-powerpc64 =3D "m64 fpu-hard"
> -BASE_LIB_tune-powerpc64 =3D "lib64"
> -TUNE_PKGARCH_tune-powerpc64 =3D "powerpc64"
> -PACKAGE_EXTRA_ARCHS_tune-powerpc64 =3D "powerpc64"
> diff --git a/meta/conf/machine/include/sh/README =
b/meta/conf/machine/include/sh/README
> deleted file mode 100644
> index b351acd..0000000
> --- a/meta/conf/machine/include/sh/README
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
> - - Initial Revision
> -
> -Both big endian and little endian are defined for SH.
> -
> -Experimental -- SH tunings have not been validated.
> -
> -The TUNE_ARCH is defined as ${TUNE_ARCH_tune-${DEFAULTTUNE}}.
> -
> -The TUNE_PKGARCH is defind as ${TUNE_PKGARCH_tune-${DEFAULTTUNE}}.
> -
> diff --git a/meta/conf/machine/include/sh/arch-sh.inc =
b/meta/conf/machine/include/sh/arch-sh.inc
> deleted file mode 100644
> index bdfbf52..0000000
> --- a/meta/conf/machine/include/sh/arch-sh.inc
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -# SH Architecture definition
> -
> -DEFAULTTUNE ?=3D "sh"
> -
> -TUNE_ARCH =3D "${TUNE_ARCH_tune-${DEFAULTTUNE}}"
> -TUNE_PKGARCH =3D "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
> -
> -TUNEVALID[bigendian] =3D "Enabled big-endian mode."
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', =
' -mb', ' -ml', d)}"
> diff --git a/meta/conf/machine/include/tune-mips32.inc =
b/meta/conf/machine/include/tune-mips32.inc
> deleted file mode 100644
> index ce0445f..0000000
> --- a/meta/conf/machine/include/tune-mips32.inc
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -DEFAULTTUNE ?=3D "mips32"
> -
> -require conf/machine/include/mips/arch-mips.inc
> -
> -TUNEVALID[mips32] =3D "Enable mips32 specific processor =
optimizations"
> -TUNECONFLICTS[mips32] =3D "n64 n32"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'mips32', ' =
-march=3Dmips32', '', d)}"
> -
> -AVAILTUNES +=3D "mips32 mips32el mips32-nf mips32el-nf"
> -
> -TUNE_FEATURES_tune-mips32 =3D "${TUNE_FEATURES_tune-mips} mips32"
> -MIPSPKGSFX_VARIANT_tune-mips32 =3D "mips32"
> -PACKAGE_EXTRA_ARCHS_tune-mips32 =3D "mips mips32"
> -
> -TUNE_FEATURES_tune-mips32el =3D "${TUNE_FEATURES_tune-mipsel} mips32"
> -MIPSPKGSFX_VARIANT_tune-mips32el =3D "mips32el"
> -PACKAGE_EXTRA_ARCHS_tune-mips32el =3D "mipsel mips32el"
> -
> -TUNE_FEATURES_tune-mips32-nf =3D "${TUNE_FEATURES_tune-mips-nf} =
mips32"
> -MIPSPKGSFX_VARIANT_tune-mips32-nf =3D "mips32"
> -PACKAGE_EXTRA_ARCHS_tune-mips32-nf =3D "mips-nf mips32-nf"
> -
> -TUNE_FEATURES_tune-mips32el-nf =3D "${TUNE_FEATURES_tune-mipsel-nf} =
mips32"
> -MIPSPKGSFX_VARIANT_tune-mips32el-nf =3D "mips32el"
> -PACKAGE_EXTRA_ARCHS_tune-mips32el-nf =3D "mipsel-nf mips32el-nf"
> diff --git a/meta/conf/machine/include/tune-mips32r2.inc =
b/meta/conf/machine/include/tune-mips32r2.inc
> deleted file mode 100644
> index 0e95ec8..0000000
> --- a/meta/conf/machine/include/tune-mips32r2.inc
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -DEFAULTTUNE ?=3D "mips32r2"
> -
> -require conf/machine/include/tune-mips32.inc
> -
> -TUNEVALID[mips32r2] =3D "Enable mips32r2 specific processor =
optimizations"
> -TUNECONFLICTS[mips32r2] =3D "n64 n32"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'mips32r2', ' =
-march=3Dmips32r2', '', d)}"
> -
> -AVAILTUNES +=3D "mips32r2 mips32r2el"
> -
> -TUNE_FEATURES_tune-mips32r2 =3D "${TUNE_FEATURES_tune-mips} mips32r2"
> -MIPSPKGSFX_VARIANT_tune-mips32r2 =3D "mips32r2"
> -PACKAGE_EXTRA_ARCHS_tune-mips32r2 =3D "mips mips32 mips32r2"
> -
> -TUNE_FEATURES_tune-mips32r2el =3D "${TUNE_FEATURES_tune-mipsel} =
mips32r2"
> -MIPSPKGSFX_VARIANT_tune-mips32r2el =3D "mips32r2el"
> -PACKAGE_EXTRA_ARCHS_tune-mips32r2el =3D "mipsel mips32el mips32r2el"
> diff --git a/meta/conf/machine/include/tune-mips64.inc =
b/meta/conf/machine/include/tune-mips64.inc
> deleted file mode 100644
> index 9be0e0f..0000000
> --- a/meta/conf/machine/include/tune-mips64.inc
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -DEFAULTTUNE ?=3D "mips64"
> -
> -require conf/machine/include/tune-mips32r2.inc
> diff --git a/meta/conf/machine/include/tune-octeon.inc =
b/meta/conf/machine/include/tune-octeon.inc
> deleted file mode 100644
> index b5deb8f..0000000
> --- a/meta/conf/machine/include/tune-octeon.inc
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -DEFAULTTUNE ?=3D"octeon2"
> -
> -require conf/machine/include/tune-mips64.inc
> -
> -AVAILTUNES +=3D "octeon2 octeon2_64 octeon3 octeon3_64"
> -
> -TUNEVALID[octeon2] =3D "Enable optimization related to octeon2 =
support"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'octeon2', ' =
-march=3Docteon2 ', '',d)}"
> -
> -TUNE_FEATURES_tune-octeon2 =3D "${TUNE_FEATURES_tune-mips64-n32} =
octeon2"
> -BASE_LIB_tune-octeon2 =3D "lib32"
> -MIPSPKGSFX_VARIANT_tune-octeon2 =3D "octeon2"
> -PACKAGE_EXTRA_ARCHS_tune-octeon2 =3D "mips64-n32 octeon2-n32"
> -
> -TUNE_FEATURES_tune-octeon2_64 =3D "${TUNE_FEATURES_tune-mips64} =
octeon2"
> -BASE_LIB_tune-octeon2_64 =3D "lib64"
> -MIPSPKGSFX_VARIANT_tune-octeon2_64 =3D "octeon2_64"
> -PACKAGE_EXTRA_ARCHS_tune-octeon2_64 =3D "mips64 octeon2_64"
> -
> -
> -TUNEVALID[octeon3] =3D "Enable optimization related to octeon3 =
support"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'octeon3', ' =
-march=3Docteon3 ', '',d)}"
> -
> -TUNE_FEATURES_tune-octeon3 =3D "${TUNE_FEATURES_tune-mips64-n32} =
octeon3"
> -BASE_LIB_tune-octeon3 =3D "lib32"
> -MIPSPKGSFX_VARIANT_tune-octeon3 =3D "octeon3"
> -PACKAGE_EXTRA_ARCHS_tune-octeon3 =3D "mips64-n32 octeon3-n32"
> -
> -TUNE_FEATURES_tune-octeon3_64 =3D "${TUNE_FEATURES_tune-mips64} =
octeon3"
> -BASE_LIB_tune-octeon3_64 =3D "lib64"
> -MIPSPKGSFX_VARIANT_tune-octeon3_64 =3D "octeon3_64"
> -PACKAGE_EXTRA_ARCHS_tune-octeon3_64 =3D "mips64 octeon3_64"
> diff --git a/meta/conf/machine/include/tune-power5.inc =
b/meta/conf/machine/include/tune-power5.inc
> deleted file mode 100644
> index a346c30..0000000
> --- a/meta/conf/machine/include/tune-power5.inc
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DEFAULTTUNE ?=3D "ppc64p5"
> -
> -require conf/machine/include/powerpc/arch-powerpc64.inc
> -
> -TUNEVALID[power5] =3D "Enable IBM Power5 specific processor =
optimizations"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'power5', ' =
-mcpu=3Dpower5', '', d)}"
> -
> -AVAILTUNES +=3D "ppcp5 ppc64p5"
> -TUNE_FEATURES_tune-ppcp5 =3D "m32 fpu-hard power5 altivec"
> -BASE_LIB_tune-ppcp5 =3D "lib"
> -TUNE_PKGARCH_tune-ppcp5 =3D "ppcp5"
> -PACKAGE_EXTRA_ARCHS_tune-ppcp5 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppcp5"
> -
> -TUNE_FEATURES_tune-ppc64p5 =3D "m64 fpu-hard power5 altivec"
> -BASE_LIB_tune-ppc64p5 =3D "lib64"
> -TUNE_PKGARCH_tune-ppc64p5 =3D "ppc64p5"
> -PACKAGE_EXTRA_ARCHS_tune-ppc64p5 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p5"
> -
> -# glibc configure options to get power5 specific library
> -GLIBC_EXTRA_OECONF_powerpc64 +=3D =
"${@bb.utils.contains('TUNE_FEATURES', 'power5', '--with-cpu=3Dpower5', =
'', d)}"
> -GLIBC_EXTRA_OECONF_powerpc +=3D =
"${@bb.utils.contains('TUNE_FEATURES', 'power5', '--with-cpu=3Dpower5', =
'', d)}"
> diff --git a/meta/conf/machine/include/tune-power6.inc =
b/meta/conf/machine/include/tune-power6.inc
> deleted file mode 100644
> index ee200f9..0000000
> --- a/meta/conf/machine/include/tune-power6.inc
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DEFAULTTUNE ?=3D "ppcpr6"
> -
> -require conf/machine/include/powerpc/arch-powerpc64.inc
> -
> -TUNEVALID[power6] =3D "Enable IBM Power6 specific processor =
optimizations"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'power6', ' =
-mcpu=3Dpower6', '', d)}"
> -
> -AVAILTUNES +=3D "ppcp6 ppc64p6"
> -TUNE_FEATURES_tune-ppcp6 =3D "m32 fpu-hard power6 altivec"
> -BASE_LIB_tune-ppcp6 =3D "lib"
> -TUNE_PKGARCH_tune-ppcp6 =3D "ppcp6"
> -PACKAGE_EXTRA_ARCHS_tune-ppcp6 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppcp6"
> -
> -TUNE_FEATURES_tune-ppc64p6 =3D "m64 fpu-hard power6 altivec"
> -BASE_LIB_tune-ppc64p6 =3D "lib64"
> -TUNE_PKGARCH_tune-ppc64p6 =3D "ppc64p6"
> -PACKAGE_EXTRA_ARCHS_tune-ppc64p6 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p6"
> -
> -# glibc configure options to get power6 specific library
> -GLIBC_EXTRA_OECONF_powerpc64 +=3D =
"${@bb.utils.contains('TUNE_FEATURES', 'power6', '--with-cpu=3Dpower6', =
'', d)}"
> -GLIBC_EXTRA_OECONF_powerpc +=3D =
"${@bb.utils.contains('TUNE_FEATURES', 'power6', '--with-cpu=3Dpower6', =
'', d)}"
> diff --git a/meta/conf/machine/include/tune-power7.inc =
b/meta/conf/machine/include/tune-power7.inc
> deleted file mode 100644
> index 3a27719..0000000
> --- a/meta/conf/machine/include/tune-power7.inc
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DEFAULTTUNE ?=3D "ppcpr7"
> -
> -require conf/machine/include/powerpc/arch-powerpc64.inc
> -
> -TUNEVALID[power7] =3D "Enable IBM Power7 specific processor =
optimizations"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'power7', ' =
-mcpu=3Dpower7', '', d)}"
> -
> -AVAILTUNES +=3D "ppcp7 ppc64p7"
> -TUNE_FEATURES_tune-ppcp7 =3D "m32 fpu-hard power7 altivec"
> -BASE_LIB_tune-ppcp7 =3D "lib"
> -TUNE_PKGARCH_tune-ppcp7 =3D "ppcp7"
> -PACKAGE_EXTRA_ARCHS_tune-ppcp7 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppcp7"
> -
> -TUNE_FEATURES_tune-ppc64p7 =3D "m64 fpu-hard power7 altivec"
> -BASE_LIB_tune-ppc64p7 =3D "lib64"
> -TUNE_PKGARCH_tune-ppc64p7 =3D "ppc64p7"
> -PACKAGE_EXTRA_ARCHS_tune-ppc64p7 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p7"
> -
> -# glibc configure options to get power7 specific library
> -GLIBC_EXTRA_OECONF_powerpc64 +=3D =
"${@bb.utils.contains('TUNE_FEATURES', 'power7', '--with-cpu=3Dpower7', =
'', d)}"
> -GLIBC_EXTRA_OECONF_powerpc +=3D =
"${@bb.utils.contains('TUNE_FEATURES', 'power7', '--with-cpu=3Dpower7', =
'', d)}"
> diff --git a/meta/conf/machine/include/tune-ppc476.inc =
b/meta/conf/machine/include/tune-ppc476.inc
> deleted file mode 100644
> index d0011ff..0000000
> --- a/meta/conf/machine/include/tune-ppc476.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DEFAULTTUNE ?=3D "ppc476"
> -
> -require conf/machine/include/powerpc/arch-powerpc.inc
> -
> -TUNEVALID[ppc476] =3D "Enable ppc476 specific processor =
optimizations"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'ppc476', ' =
-mcpu=3D476', '', d)}"
> -
> -AVAILTUNES +=3D "ppc476"
> -TUNE_FEATURES_tune-ppc476 =3D "m32 fpu-hard ppc476"
> -TUNE_PKGARCH_tune-ppc476 =3D "ppc476"
> -PACKAGE_EXTRA_ARCHS_tune-ppc476 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc476"
> -
> -# glibc configure options to get 476 specific library (for sqrt)
> -GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains('TUNE_FEATURES', =
'ppc476', '-with-cpu=3D476', '', d)}"
> diff --git a/meta/conf/machine/include/tune-ppc603e.inc =
b/meta/conf/machine/include/tune-ppc603e.inc
> deleted file mode 100644
> index 13f60dd..0000000
> --- a/meta/conf/machine/include/tune-ppc603e.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DEFAULTTUNE ?=3D "ppc603e"
> -
> -require conf/machine/include/powerpc/arch-powerpc.inc
> -
> -TUNEVALID[ppc603e] =3D "Enable ppc603e specific processor =
optimizations"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', ' =
-mcpu=3D603e', '', d)}"
> -
> -AVAILTUNES +=3D "ppc603e"
> -TUNE_FEATURES_tune-ppc603e =3D "m32 fpu-hard ppc603e"
> -TUNE_PKGARCH_tune-ppc603e =3D "ppc603e"
> -PACKAGE_EXTRA_ARCHS_tune-ppc603e =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc603e"
> -
> -# glibc configure options to get 603e specific library (for sqrt)
> -GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains('TUNE_FEATURES', =
'ppc603e', '-with-cpu=3D603e', '', d)}"
> diff --git a/meta/conf/machine/include/tune-ppc7400.inc =
b/meta/conf/machine/include/tune-ppc7400.inc
> deleted file mode 100644
> index 425e8bd..0000000
> --- a/meta/conf/machine/include/tune-ppc7400.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DEFAULTTUNE ?=3D "ppc7400"
> -
> -require conf/machine/include/powerpc/arch-powerpc.inc
> -
> -TUNEVALID[ppc7400] =3D "Enable ppc7400 specific processor =
optimizations"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'ppc7400', ' =
-mcpu=3D7400 -mno-spe', '', d)}"
> -
> -AVAILTUNES +=3D "ppc7400"
> -TUNE_FEATURES_tune-ppc7400 =3D "m32 fpu-hard ppc7400 altivec"
> -TUNE_PKGARCH_tune-ppc7400 =3D "ppc7400"
> -PACKAGE_EXTRA_ARCHS_tune-ppc7400 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc7400"
> -
> -# glibc configure options to get 7400 specific library (for sqrt)
> -#GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains('TUNE_FEATURES', =
'ppc7400', '--with-cpu=3Dpower4', '', d)}"
> diff --git a/meta/conf/machine/include/tune-ppce300c2.inc =
b/meta/conf/machine/include/tune-ppce300c2.inc
> deleted file mode 100644
> index af21f60..0000000
> --- a/meta/conf/machine/include/tune-ppce300c2.inc
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -DEFAULTTUNE ?=3D "ppce300c2"
> -
> -require conf/machine/include/powerpc/arch-powerpc.inc
> -
> -TUNEVALID[ppce300c2] =3D "Enable ppce300c2 specific processor =
optimizations"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'ppce300c2', =
' -mcpu=3De300c2', '', d)}"
> -
> -AVAILTUNES +=3D "ppce300c2"
> -TUNE_FEATURES_tune-ppce300c2 =3D "m32 fpu-soft ppce300c2"
> -TUNE_PKGARCH_tune-ppce300c2 =3D "ppce300c2"
> -PACKAGE_EXTRA_ARCHS_tune-ppce300c2 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppce300c2"
> diff --git a/meta/conf/machine/include/tune-ppce300c3.inc =
b/meta/conf/machine/include/tune-ppce300c3.inc
> deleted file mode 100644
> index a3d836c..0000000
> --- a/meta/conf/machine/include/tune-ppce300c3.inc
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -DEFAULTTUNE ?=3D "ppce300c3"
> -
> -require conf/machine/include/powerpc/arch-powerpc.inc
> -
> -AVAILTUNES +=3D "ppce300c3 ppce300c3-nf"
> -
> -# hard-float
> -TUNEVALID[ppce300c3] =3D "Enable ppce300c3 specific processor =
optimizations"
> -TUNE_FEATURES_tune-ppce300c3 =3D "${TUNE_FEATURES_tune-powerpc} =
ppce300c3"
> -TUNE_PKGARCH_tune-ppce300c3 =3D "ppce300c3"
> -PACKAGE_EXTRA_ARCHS_tune-ppce300c3 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce300c3"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'ppce300c3', =
' -mcpu=3De300c3', '', d)}"
> -
> -# glibc config options to make use of e300c3 (603e) specific =
sqrt/sqrtf routines
> -GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains('TUNE_FEATURES', =
'ppce300c3', '--with-cpu=3De300c3', '', d)}"
> -
> -# soft-float
> -TUNEVALID[ppce300c3-nf] =3D "Enable ppce300c3 specific processor =
optimizations (no fpu)"
> -TUNE_FEATURES_tune-ppce300c3-nf =3D "${TUNE_FEATURES_tune-powerpc-nf} =
ppce300c3-nf"
> -TUNE_PKGARCH_tune-ppce300c3-nf =3D "ppce300c3-nf"
> -PACKAGE_EXTRA_ARCHS_tune-ppce300c3-nf =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppce300c3-nf"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'ppce300c3-nf', ' -mcpu=3De300c3', '', d)}"
> -
> diff --git a/meta/conf/machine/include/tune-ppce500.inc =
b/meta/conf/machine/include/tune-ppce500.inc
> deleted file mode 100644
> index 96073d2..0000000
> --- a/meta/conf/machine/include/tune-ppce500.inc
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DEFAULTTUNE ?=3D "ppce500"
> -
> -require conf/machine/include/powerpc/arch-powerpc.inc
> -
> -TUNEVALID[ppce500] =3D "Enable ppce500 specific processor =
optimizations"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'ppce500', ' =
-mcpu=3D8540', '', d)}"
> -
> -TUNEVALID[spe] =3D "Enable SPE ABI extensions"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'ppce500', =
'spe' ], ' -mabi=3Dspe -mspe -mfloat-gprs=3Dsingle', '', d)}"
> -TARGET_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'ppce500' , =
'spe' ], 'ppc-efs', '', d)}"
> -
> -# spe is defined potentially in two places, so we want to be sure it =
will
> -# only write spe once to the ABIEXTENSIONS field.
> -SPEABIEXTENSION =3D "${@bb.utils.contains('TUNE_FEATURES', 'spe', =
'spe', '', d)}"
> -ABIEXTENSION .=3D "${SPEABIEXTENSION}"
> -
> -AVAILTUNES +=3D "ppce500"
> -TUNE_FEATURES_tune-ppce500 =3D "m32 spe ppce500"
> -TUNE_PKGARCH_tune-ppce500 =3D "ppce500"
> -PACKAGE_EXTRA_ARCHS_tune-ppce500 =3D "ppce500"
> diff --git a/meta/conf/machine/include/tune-ppce500mc.inc =
b/meta/conf/machine/include/tune-ppce500mc.inc
> deleted file mode 100644
> index a1ca9be..0000000
> --- a/meta/conf/machine/include/tune-ppce500mc.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DEFAULTTUNE ?=3D "ppce500mc"
> -
> -require conf/machine/include/powerpc/arch-powerpc.inc
> -
> -TUNEVALID[ppce500mc] =3D "Enable ppce500mc specific processor =
optimizations"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'ppce500mc', =
' -mcpu=3De500mc', '', d)}"
> -
> -AVAILTUNES +=3D "ppce500mc"
> -TUNE_FEATURES_tune-ppce500mc =3D "m32 fpu-hard ppce500mc"
> -TUNE_PKGARCH_tune-ppce500mc =3D "ppce500mc"
> -PACKAGE_EXTRA_ARCHS_tune-ppce500mc =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce500mc"
> -
> -# glibc configure options to get e500mc specific library (for sqrt)
> -GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains('TUNE_FEATURES', =
'ppce500mc', '-with-cpu=3De500mc', '', d)}"
> diff --git a/meta/conf/machine/include/tune-ppce500v2.inc =
b/meta/conf/machine/include/tune-ppce500v2.inc
> deleted file mode 100644
> index 20a5f25..0000000
> --- a/meta/conf/machine/include/tune-ppce500v2.inc
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DEFAULTTUNE ?=3D "ppce500v2"
> -
> -require conf/machine/include/powerpc/arch-powerpc.inc
> -
> -TUNEVALID[ppce500v2] =3D "Enable ppce500v2 specific processor =
optimizations"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'ppce500v2', =
' -mcpu=3D8548', '', d)}"
> -
> -TUNEVALID[spe] =3D "Enable SPE ABI extensions"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', [ =
'ppce500v2', 'spe' ], ' -mabi=3Dspe -mspe -mfloat-gprs=3Ddouble', '', =
d)}"
> -TARGET_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'ppce500v2' =
, 'spe' ], 'ppc-efd', '', d)}"
> -
> -# spe is defined potentially in two places, so we want to be sure it =
will
> -# only write spe once to the ABIEXTENSIONS field.
> -SPEABIEXTENSION =3D "${@bb.utils.contains('TUNE_FEATURES', 'spe', =
'spe', '', d)}"
> -ABIEXTENSION .=3D "${SPEABIEXTENSION}"
> -
> -AVAILTUNES +=3D "ppce500v2"
> -TUNE_FEATURES_tune-ppce500v2 =3D "m32 spe ppce500v2"
> -TUNE_PKGARCH_tune-ppce500v2 =3D "ppce500v2"
> -PACKAGE_EXTRA_ARCHS_tune-ppce500v2 =3D "ppce500v2"
> diff --git a/meta/conf/machine/include/tune-ppce5500.inc =
b/meta/conf/machine/include/tune-ppce5500.inc
> deleted file mode 100644
> index ace2614..0000000
> --- a/meta/conf/machine/include/tune-ppce5500.inc
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DEFAULTTUNE ?=3D "ppce5500"
> -
> -require conf/machine/include/powerpc/arch-powerpc64.inc
> -
> -TUNEVALID[e5500] =3D "Enable Freescale e5500 specific processor =
optimizations"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'e5500', ' =
-mcpu=3De5500', '', d)}"
> -
> -AVAILTUNES +=3D "ppce5500 ppc64e5500"
> -TUNE_FEATURES_tune-ppce5500 =3D "m32 fpu-hard e5500"
> -BASE_LIB_tune-ppce5500 =3D "lib"
> -TUNE_PKGARCH_tune-ppce5500 =3D "ppce5500"
> -PACKAGE_EXTRA_ARCHS_tune-ppce5500 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce5500"
> -
> -TUNE_FEATURES_tune-ppc64e5500 =3D "m64 fpu-hard e5500"
> -BASE_LIB_tune-ppc64e5500 =3D "lib64"
> -TUNE_PKGARCH_tune-ppc64e5500 =3D "ppc64e5500"
> -PACKAGE_EXTRA_ARCHS_tune-ppc64e5500 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64e5500"
> -
> -# glibc configure options to get e5500 specific library (for sqrt)
> -GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains('TUNE_FEATURES', =
'e5500', '--with-cpu=3De5500', '', d)}"
> diff --git a/meta/conf/machine/include/tune-ppce6500.inc =
b/meta/conf/machine/include/tune-ppce6500.inc
> deleted file mode 100644
> index da1e864..0000000
> --- a/meta/conf/machine/include/tune-ppce6500.inc
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DEFAULTTUNE ?=3D "ppce6500"
> -
> -require conf/machine/include/powerpc/arch-powerpc64.inc
> -
> -TUNEVALID[e6500] =3D "Enable Freescale e6500 specific processor =
optimizations"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'e6500', ' =
-mcpu=3De6500', '', d)}"
> -
> -AVAILTUNES +=3D "ppce6500 ppc64e6500"
> -TUNE_FEATURES_tune-ppce6500 =3D "m32 fpu-hard e6500 altivec"
> -BASE_LIB_tune-ppce6500 =3D "lib"
> -TUNE_PKGARCH_tune-ppce6500 =3D "ppce6500"
> -PACKAGE_EXTRA_ARCHS_tune-ppce6500 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce6500"
> -
> -TUNE_FEATURES_tune-ppc64e6500 =3D "m64 fpu-hard e6500 altivec"
> -BASE_LIB_tune-ppc64e6500 =3D "lib64"
> -TUNE_PKGARCH_tune-ppc64e6500 =3D "ppc64e6500"
> -PACKAGE_EXTRA_ARCHS_tune-ppc64e6500 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64e6500"
> -
> -# glibc configure options to get e6500 specific library
> -GLIBC_EXTRA_OECONF_powerpc64 +=3D =
"${@bb.utils.contains('TUNE_FEATURES', 'e6500', '--with-cpu=3De6500', =
'', d)}"
> -GLIBC_EXTRA_OECONF_powerpc +=3D =
"${@bb.utils.contains('TUNE_FEATURES', 'e6500', '--with-cpu=3De6500', =
'', d)}"
> diff --git a/meta/conf/machine/include/tune-sh3.inc =
b/meta/conf/machine/include/tune-sh3.inc
> deleted file mode 100644
> index 80df9a0..0000000
> --- a/meta/conf/machine/include/tune-sh3.inc
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -DEFAULTTUNE ?=3D "sh3"
> -
> -require conf/machine/include/sh/arch-sh.inc
> -
> -TUNEVALID[sh3] =3D "Enable SH3 optimizations"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'sh3', ' =
-m3', '', d)}"
> -
> -AVAILTUNES +=3D "sh3 sh3eb"
> -TUNE_FEATURES_tune-sh3 =3D "sh3"
> -TUNE_ARCH_tune-sh3 =3D "sh3"
> -TUNE_PKGARCH_tune-sh3 =3D "sh3"
> -PACKAGE_EXTRA_ARCHS_tune-sh3 =3D "sh sh3"
> -
> -TUNE_FEATURES_tune-sh3eb =3D "sh3 bigendian"
> -TUNE_ARCH_tune-sh3eb =3D "sh3eb"
> -TUNE_PKGARCH_tune-sh3eb =3D "sh3eb"
> -PACKAGE_EXTRA_ARCHS_tune-sh3eb =3D "sheb sh3eb"
> diff --git a/meta/conf/machine/include/tune-sh4.inc =
b/meta/conf/machine/include/tune-sh4.inc
> deleted file mode 100644
> index 4160c30..0000000
> --- a/meta/conf/machine/include/tune-sh4.inc
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -DEFAULTTUNE ?=3D "sh4"
> -
> -# Pull in sh4 for compatibility...
> -require conf/machine/include/sh/arch-sh.inc
> -
> -TUNEVALID[sh4] =3D "Enable SH4 optimizations"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'sh4', ' =
-m4', '', d)}"
> -
> -# NOTE: If you want to optimize to sh4a, =
conf/machine/include/tune-sh4a.inc.
> -# But it is not compatible for sh4.
> -# The binary optimized by m4a doesn't operate on sh4. It works on =
sh4a only.
> -TUNEVALID[sh4a] =3D "Enable SH4a optimizations"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'sh4a', ' =
-m4a', '', d)}"
> -
> -AVAILTUNES +=3D "sh4 sh4eb sh4a sh4aeb"
> -TUNE_FEATURES_tune-sh4 =3D "sh4"
> -TUNE_ARCH_tune-sh4 =3D "sh4"
> -TUNE_PKGARCH_tune-sh4 =3D "sh4"
> -PACKAGE_EXTRA_ARCHS_tune-sh4 =3D "sh sh4"
> -
> -TUNE_FEATURES_tune-sh4eb =3D "sh4 bigendian"
> -TUNE_ARCH_tune-sh4eb =3D "sh4eb"
> -TUNE_PKGARCH_tune-sh4eb =3D "sh4eb"
> -PACKAGE_EXTRA_ARCHS_tune-sh4eb =3D "sheb sh4eb"
> -
> -TUNE_FEATURES_tune-sh4a =3D "sh4a"
> -TUNE_ARCH_tune-sh4a =3D "sh4"
> -TUNE_PKGARCH_tune-sh4a =3D "sh4a"
> -PACKAGE_EXTRA_ARCHS_tune-sh4a =3D "sh sh4 sh4a"
> -
> -TUNE_FEATURES_tune-sh4aeb =3D "sh4a bigendian"
> -TUNE_ARCH_tune-sh4aeb =3D "sh4eb"
> -TUNE_PKGARCH_tune-sh4aeb =3D "sh4aeb"
> -PACKAGE_EXTRA_ARCHS_tune-sh4aeb =3D "sheb sh4eb sh4aeb"
> diff --git a/meta/conf/machine/qemumips.conf =
b/meta/conf/machine/qemumips.conf
> deleted file mode 100644
> index fbf8137..0000000
> --- a/meta/conf/machine/qemumips.conf
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: mti_malta32_be MIPS
> -#@DESCRIPTION: mti_malta32_be
> -
> -require conf/machine/include/qemu.inc
> -require conf/machine/include/tune-mips32r2.inc
> -
> -KERNEL_IMAGETYPE =3D "vmlinux"
> -KERNEL_ALT_IMAGETYPE =3D "vmlinux.bin"
> -
> -SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS1"
> -
> -MACHINE_EXTRA_RRECOMMENDS =3D " kernel-modules"
> diff --git a/meta/conf/machine/qemumips64.conf =
b/meta/conf/machine/qemumips64.conf
> deleted file mode 100644
> index 8c3f1fe..0000000
> --- a/meta/conf/machine/qemumips64.conf
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: mti-malta64-be MIPS64
> -#@DESCRIPTION: mti-malta64-be
> -
> -require conf/machine/include/qemu.inc
> -require conf/machine/include/tune-mips64.inc
> -
> -KERNEL_IMAGETYPE =3D "vmlinux"
> -KERNEL_ALT_IMAGETYPE =3D "vmlinux.bin"
> -
> -SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS1"
> -
> -MACHINE_EXTRA_RRECOMMENDS =3D " kernel-modules"
> diff --git a/meta/conf/machine/qemuppc.conf =
b/meta/conf/machine/qemuppc.conf
> deleted file mode 100644
> index bf0038d..0000000
> --- a/meta/conf/machine/qemuppc.conf
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: qemu PPC Emulator setup
> -#@DESCRIPTION: Machine configuration for running an PPC system under =
qemu emulation
> -
> -require conf/machine/include/qemu.inc
> -require conf/machine/include/tune-ppc7400.inc
> -
> -TARGET_CC_KERNEL_ARCH =3D "-mno-spe"
> -
> -KERNEL_IMAGETYPE =3D "vmlinux"
> -
> -SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS1"
> -
> diff --git a/meta/site/mips-common b/meta/site/mips-common
> deleted file mode 100644
> index 89d72cb..0000000
> --- a/meta/site/mips-common
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -# general
> -ac_cv_va_val_copy=3D${ac_cv_va_val_copy=3Dyes}
> -
> -# cvs
> -cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=3Dyes}
> -
> -# screen
> -screen_cv_sys_bcopy_overlap=3D${screen_cv_sys_bcopy_overlap=3Dno}
> -screen_cv_sys_memcpy_overlap=3D${screen_cv_sys_memcpy_overlap=3Dno}
> -screen_cv_sys_memmove_overlap=3D${screen_cv_sys_memmove_overlap=3Dno}
> -screen_cv_sys_fifo_broken_impl=3D${screen_cv_sys_fifo_broken_impl=3Dyes=
}
> -screen_cv_sys_fifo_usable=3D${screen_cv_sys_fifo_usable=3Dyes}
> =
-screen_cv_sys_select_broken_retval=3D${screen_cv_sys_select_broken_retval=
=3Dno}
> -screen_cv_sys_sockets_nofs=3D${screen_cv_sys_sockets_nofs=3Dno}
> -screen_cv_sys_sockets_usable=3D${screen_cv_sys_sockets_usable=3Dyes}
> -screen_cv_sys_terminfo_used=3D${screen_cv_sys_terminfo_used=3Dyes}
> -
> -# ORBit2
> -ac_cv_alignof_CORBA_octet=3D1
> -ac_cv_alignof_CORBA_boolean=3D1
> -ac_cv_alignof_CORBA_char=3D1
> -ac_cv_alignof_CORBA_wchar=3D2
> -ac_cv_alignof_CORBA_short=3D2
> -ac_cv_alignof_CORBA_long=3D4
> -ac_cv_alignof_CORBA_long_long=3D8
> -ac_cv_alignof_CORBA_float=3D4
> -ac_cv_alignof_CORBA_double=3D8
> -ac_cv_alignof_CORBA_long_double=3D8
> -ac_cv_alignof_CORBA_pointer=3D4
> -ac_cv_alignof_CORBA_struct=3D1
> -
> -# apache
> -ac_cv_func_pthread_key_delete=3D${ac_cv_func_pthread_key_delete=3Dyes}
> -apr_cv_process_shared_works=3D${apr_cv_process_shared_works=3Dno}
> -ac_cv_sizeof_ssize_t=3D${ac_cv_sizeof_ssize_t=3D4}
> -apr_cv_tcp_nodelay_with_cork=3D${apr_cv_tcp_nodelay_with_cork=3Dyes}
> -
> -# glib
> -glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
> -ac_cv_alignof_guint32=3D4
> -ac_cv_alignof_guint64=3D8
> -ac_cv_alignof_unsigned_long=3D4
> -
> -
> -# slrn
> -slrn_cv_va_val_copy=3D${slrn_cv_va_val_copy=3Dyes}
> -
> -# at-spi2-core
> -ac_cv_alignof_char=3D1
> -ac_cv_alignof_dbind_pointer=3D4
> -ac_cv_alignof_dbind_struct=3D1
> -ac_cv_alignof_dbus_bool_t=3D4
> -ac_cv_alignof_dbus_int16_t=3D2
> -ac_cv_alignof_dbus_int32_t=3D4
> -ac_cv_alignof_dbus_int64_t=3D8
> -ac_cv_alignof_double=3D8
> diff --git a/meta/site/mips-linux b/meta/site/mips-linux
> deleted file mode 100644
> index 72a54f9..0000000
> --- a/meta/site/mips-linux
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -# general
> -ac_cv_func_setvbuf_reversed=3D${ac_cv_func_setvbuf_reversed=3Dno}
> -
> -# bash
> -ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dno}
> -bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dpresent}
> -
> -# openssh
> -ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3Dno}=

> -ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3Dno}
> -ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3Dyes}
> -ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3Dno}
> =
-ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_have_space_d_name_in_s=
truct_dirent=3Dyes}
> -
> -# fget
> -compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
> -
> -# glib
> -glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
> -glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
> -glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
> -glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
> -glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
> -glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
> -glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
> -glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
> -glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
> -glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
> -glib_cv_uscore=3D${glib_cv_uscore=3Dno}
> -
> -# glib-2.0
> -glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
> -utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
> -glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
> -
> -# libpcap
> -ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
> -
> -# startup-notification
> -lf_cv_sane_realloc=3D${lf_cv_sane_realloc=3Dyes}
> -
> -# libidl
> -libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}
> -
> -# ncftp
> -wi_cv_struct_timeval_tv_sec=3D${wi_cv_struct_timeval_tv_sec=3Dlong}
> -wi_cv_struct_timeval_tv_usec=3D${wi_cv_struct_timeval_tv_usec=3Dlong}
> -
> -# db
> -db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
> -db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long'}
> -db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
> -db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
> -
> -# rrdtool
> -rd_cv_ieee_works=3D${rd_cv_ieee_works=3Dyes}
> -# ac_cv_path_PERL=3D${ac_cv_path_PERL=3Dno}
> -
> -# gettext
> -am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
> -
> -# samba
> -samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
> -
> -# vim
> -ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
> -
> -# intercom
> -ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
> -
> -# lmbench
> -ac_cv_uint=3D${ac_cv_unit=3Dyes}
> -
> -# D-BUS
> -ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
> -
> -# evolution-data-server
> -ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
> -
> diff --git a/meta/site/mips-linux-uclibc b/meta/site/mips-linux-uclibc
> deleted file mode 100644
> index b23363e..0000000
> --- a/meta/site/mips-linux-uclibc
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -# general
> -ac_cv_func_setvbuf_reversed=3D${ac_cv_func_setvbuf_reversed=3Dno}
> -
> -# bash
> -ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dno}
> -bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dpresent}
> -
> -# openssh
> -ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3Dno}=

> -ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3Dno}
> -ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3Dyes}
> -ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3Dno}
> =
-ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_have_space_d_name_in_s=
truct_dirent=3Dyes}
> -
> -# fget
> -compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
> -
> -# glib
> -glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
> -glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
> -glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
> -glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
> -glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
> -glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
> -glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
> -glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
> -glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
> -glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
> -glib_cv_uscore=3D${glib_cv_uscore=3Dno}
> -
> -# glib-2.0
> -glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
> -utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
> -glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
> -
> -# libpcap
> -ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
> -
> -# startup-notification
> -lf_cv_sane_realloc=3D${lf_cv_sane_realloc=3Dyes}
> -
> -# libidl
> -libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}
> -
> -# ncftp
> -wi_cv_struct_timeval_tv_sec=3D${wi_cv_struct_timeval_tv_sec=3Dlong}
> -wi_cv_struct_timeval_tv_usec=3D${wi_cv_struct_timeval_tv_usec=3Dlong}
> -wi_cv_unix_domain_sockets=3D${wi_cv_unix_domain_sockets=3Dyes}
> -
> -# db
> -db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
> -db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long'}
> -db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
> -db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
> -
> -# rrdtool
> -rd_cv_ieee_works=3D${rd_cv_ieee_works=3Dyes}
> -# ac_cv_path_PERL=3D${ac_cv_path_PERL=3Dno}
> -
> -# gettext
> -am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
> -
> -# samba
> -samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
> -
> -# vim
> -ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
> -
> -# intercom
> -ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
> -
> -# lmbench
> -ac_cv_uint=3D${ac_cv_unit=3Dyes}
> -
> -# D-BUS
> -ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
> -
> -# evolution-data-server
> -ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
> -
> diff --git a/meta/site/mips64-linux b/meta/site/mips64-linux
> deleted file mode 100644
> index ed0fbbe..0000000
> --- a/meta/site/mips64-linux
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -# general
> -ac_cv_func_setvbuf_reversed=3D${ac_cv_func_setvbuf_reversed=3Dno}
> -
> -# bash
> -ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dno}
> -bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dpresent}
> -
> -# openssh
> -ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3Dno}=

> -ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3Dno}
> -ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3Dyes}
> -ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3Dno}
> =
-ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_have_space_d_name_in_s=
truct_dirent=3Dyes}
> -
> -# fget
> -compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
> -
> -# glib
> -glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
> -glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
> -glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
> -glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
> -glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
> -glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
> -glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
> -glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
> -glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
> -glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
> -glib_cv_uscore=3D${glib_cv_uscore=3Dno}
> -
> -# glib-2.0
> -glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
> -utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
> -glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
> -ac_cv_alignof_guint32=3D4
> -ac_cv_alignof_guint64=3D8
> -ac_cv_alignof_unsigned_long=3D8
> -ac_cv_sizeof_ssize_t=3D8
> -
> -# libpcap
> -ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
> -
> -# startup-notification
> -lf_cv_sane_realloc=3D${lf_cv_sane_realloc=3Dyes}
> -
> -# libidl
> -libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}
> -
> -# ncftp
> -wi_cv_struct_timeval_tv_sec=3D${wi_cv_struct_timeval_tv_sec=3Dlong}
> -wi_cv_struct_timeval_tv_usec=3D${wi_cv_struct_timeval_tv_usec=3Dlong}
> -
> -# db
> -db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
> -db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long'}
> -db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
> -db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
> -
> -# rrdtool
> -rd_cv_ieee_works=3D${rd_cv_ieee_works=3Dyes}
> -# ac_cv_path_PERL=3D${ac_cv_path_PERL=3Dno}
> -
> -# gettext
> -am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
> -
> -# samba
> -samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
> -
> -# vim
> -ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
> -
> -# intercom
> -ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
> -
> -# lmbench
> -ac_cv_uint=3D${ac_cv_unit=3Dyes}
> -
> -# D-BUS
> -ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
> -
> -# eds-dbus
> -ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
> -
> diff --git a/meta/site/mips64-linux-uclibc =
b/meta/site/mips64-linux-uclibc
> deleted file mode 100644
> index cbba552..0000000
> --- a/meta/site/mips64-linux-uclibc
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -# general
> -ac_cv_func_setvbuf_reversed=3D${ac_cv_func_setvbuf_reversed=3Dno}
> -
> -# bash
> -ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dno}
> -bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dpresent}
> -
> -# openssh
> -ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3Dno}=

> -ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3Dno}
> -ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3Dyes}
> -ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3Dno}
> =
-ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_have_space_d_name_in_s=
truct_dirent=3Dyes}
> -
> -# fget
> -compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
> -
> -# glib
> -glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
> -glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
> -glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
> -glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
> -glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
> -glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
> -glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
> -glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
> -glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
> -glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
> -glib_cv_uscore=3D${glib_cv_uscore=3Dno}
> -
> -# glib-2.0
> -glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
> -utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
> -glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
> -ac_cv_alignof_guint32=3D4
> -ac_cv_alignof_guint64=3D8
> -ac_cv_alignof_unsigned_long=3D8
> -
> -# libpcap
> -ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
> -
> -# startup-notification
> -lf_cv_sane_realloc=3D${lf_cv_sane_realloc=3Dyes}
> -
> -# libidl
> -libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}
> -
> -# ncftp
> -wi_cv_struct_timeval_tv_sec=3D${wi_cv_struct_timeval_tv_sec=3Dlong}
> -wi_cv_struct_timeval_tv_usec=3D${wi_cv_struct_timeval_tv_usec=3Dlong}
> -wi_cv_unix_domain_sockets=3D${wi_cv_unix_domain_sockets=3Dyes}
> -
> -# db
> -db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
> -db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long'}
> -db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
> -db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
> -
> -# rrdtool
> -rd_cv_ieee_works=3D${rd_cv_ieee_works=3Dyes}
> -# ac_cv_path_PERL=3D${ac_cv_path_PERL=3Dno}
> -
> -# gettext
> -am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
> -
> -# samba
> -samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
> -
> -# vim
> -ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
> -
> -# intercom
> -ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
> -
> -# lmbench
> -ac_cv_uint=3D${ac_cv_unit=3Dyes}
> -
> -# D-BUS
> -ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
> -
> -# eds-dbus
> -ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
> -
> diff --git a/meta/site/mips64el-linux b/meta/site/mips64el-linux
> deleted file mode 100644
> index 8b61eb0..0000000
> --- a/meta/site/mips64el-linux
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -# general
> -ac_cv_func_setvbuf_reversed=3D${ac_cv_func_setvbuf_reversed=3Dno}
> -
> -# bash
> -ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dno}
> -bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dpresent}
> -
> -# openssh
> -ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3Dno}=

> -ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3Dno}
> -ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3Dyes}
> -ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3Dno}
> =
-ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_have_space_d_name_in_s=
truct_dirent=3Dyes}
> -
> -# fget
> -compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
> -
> -# glib
> -glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
> -glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
> -glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
> -glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
> -glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
> -glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
> -glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
> -glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
> -glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
> -glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
> -glib_cv_uscore=3D${glib_cv_uscore=3Dno}
> -
> -# glib-2.0
> -glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
> -utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
> -glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
> -ac_cv_alignof_guint32=3D4
> -ac_cv_alignof_guint64=3D8
> -ac_cv_alignof_unsigned_long=3D8
> -
> -# libpcap
> -ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
> -
> -# startup-notification
> -lf_cv_sane_realloc=3D${lf_cv_sane_realloc=3Dyes}
> -
> -# libidl
> -libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}
> -
> -# ncftp
> -wi_cv_struct_timeval_tv_sec=3D${wi_cv_struct_timeval_tv_sec=3Dlong}
> -wi_cv_struct_timeval_tv_usec=3D${wi_cv_struct_timeval_tv_usec=3Dlong}
> -wi_cv_unix_domain_sockets=3D${wi_cv_unix_domain_sockets=3Dyes}
> -
> -# db
> -db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
> -db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long'}
> -db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
> -db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
> -
> -# rrdtool
> -rd_cv_ieee_works=3D${rd_cv_ieee_works=3Dyes}
> -# ac_cv_path_PERL=3D${ac_cv_path_PERL=3Dno}
> -
> -# gettext
> -am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
> -
> -# samba
> -samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
> -
> -# vim
> -ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
> -
> -# intercom
> -ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
> -
> -#lmbench
> -ac_cv_uint=3D${ac_cv_unit=3Dyes}
> -
> -# D-BUS
> -ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
> -
> -# eds-dbus
> -ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
> diff --git a/meta/site/mips64el-linux-uclibc =
b/meta/site/mips64el-linux-uclibc
> deleted file mode 100644
> index 6a0499d..0000000
> --- a/meta/site/mips64el-linux-uclibc
> +++ /dev/null
> @@ -1,108 +0,0 @@
> -# general
> -ac_cv_func_setvbuf_reversed=3D${ac_cv_func_setvbuf_reversed=3Dno}
> -
> -# bash
> -ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dno}
> -bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dpresent}
> -
> -# openssh
> -ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3Dno}=

> -ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3Dno}
> -ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3Dyes}
> -ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3Dno}
> =
-ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_have_space_d_name_in_s=
truct_dirent=3Dyes}
> -
> -# fget
> -compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
> -
> -# glib
> -glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
> -glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
> -glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
> -glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
> -glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
> -glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
> -glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
> -glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
> -glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
> -glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
> -glib_cv_uscore=3D${glib_cv_uscore=3Dno}
> -
> -# glib-2.0
> -glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
> -utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
> -glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
> -ac_cv_alignof_guint32=3D4
> -ac_cv_alignof_guint64=3D8
> -ac_cv_alignof_unsigned_long=3D8
> -
> -# libpcap
> -ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
> -
> -# startup-notification
> -lf_cv_sane_realloc=3D${lf_cv_sane_realloc=3Dyes}
> -
> -# libidl
> -libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}
> -
> -# ncftp
> -wi_cv_struct_timeval_tv_sec=3D${wi_cv_struct_timeval_tv_sec=3Dlong}
> -wi_cv_struct_timeval_tv_usec=3D${wi_cv_struct_timeval_tv_usec=3Dlong}
> -wi_cv_unix_domain_sockets=3D${wi_cv_unix_domain_sockets=3Dyes}
> -
> -# gettext
> -am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
> -
> -# samba
> -# from samba 3.0.14a on 5/29/2005
> -ac_cv_func_memcmp_working=3D${ac_cv_func_memcmp_working=3Dyes}
> -ac_cv_have_asprintf_decl=3D${ac_cv_have_asprintf_decl=3Dyes}
> -ac_cv_have_setresgid_decl=3D${ac_cv_have_setresgid_decl=3Dyes}
> -ac_cv_have_setresuid_decl=3D${ac_cv_have_setresuid_decl=3Dyes}
> -ac_cv_have_vasprintf_decl=3D${ac_cv_have_vasprintf_decl=3Dyes}
> -fu_cv_sys_stat_statvfs64=3D${fu_cv_sys_stat_statvfs64=3Dyes}
> -samba_cv_FTRUNCATE_NEEDS_ROOT=3D${samba_cv_FTRUNCATE_NEEDS_ROOT=3Dno}
> =
-samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=3D${samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=
=3Dno}
> -samba_cv_HAVE_BROKEN_GETGROUPS=3D${samba_cv_HAVE_BROKEN_GETGROUPS=3Dno}=

> -samba_cv_HAVE_BROKEN_READDIR=3D${samba_cv_HAVE_BROKEN_READDIR=3Dno}
> -samba_cv_HAVE_C99_VSNPRINTF=3D${samba_cv_HAVE_C99_VSNPRINTF=3Dyes}
> -samba_cv_HAVE_DEV64_T=3D${samba_cv_HAVE_DEV64_T=3Dno}
> -samba_cv_HAVE_DEVICE_MAJOR_FN=3D${samba_cv_HAVE_DEVICE_MAJOR_FN=3Dyes}
> -samba_cv_HAVE_DEVICE_MINOR_FN=3D${samba_cv_HAVE_DEVICE_MINOR_FN=3Dyes}
> =
-samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=3D${samba_cv_HAVE_EXPLICIT_LARGE=
FILE_SUPPORT=3Dyes}
> -samba_cv_HAVE_FCNTL_LOCK=3D${samba_cv_HAVE_FCNTL_LOCK=3Dyes}
> -samba_cv_HAVE_FTRUNCATE_EXTEND=3D${samba_cv_HAVE_FTRUNCATE_EXTEND=3Dyes=
}
> -samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
> -samba_cv_HAVE_INO64_T=3D${samba_cv_HAVE_INO64_T=3Dno}
> =
-samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=3D${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=
=3Dyes}
> =
-samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=3D${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=
=3Dyes}
> =
-samba_cv_HAVE_KERNEL_SHARE_MODES=3D${samba_cv_HAVE_KERNEL_SHARE_MODES=3Dy=
es}
> -samba_cv_HAVE_MAKEDEV=3D${samba_cv_HAVE_MAKEDEV=3Dyes}
> -samba_cv_HAVE_MMAP=3D${samba_cv_HAVE_MMAP=3Dyes}
> -samba_cv_HAVE_OFF64_T=3D${samba_cv_HAVE_OFF64_T=3Dno}
> -samba_cv_HAVE_QUOTACTL_4A=3D${samba_cv_HAVE_QUOTACTL_4A=3Dyes}
> -samba_cv_HAVE_ROOT=3D${samba_cv_HAVE_ROOT=3Dno}
> -samba_cv_HAVE_SECURE_MKSTEMP=3D${samba_cv_HAVE_SECURE_MKSTEMP=3Dyes}
> -samba_cv_HAVE_SENDFILE64=3D${samba_cv_HAVE_SENDFILE64=3Dyes}
> -samba_cv_HAVE_STRUCT_DIRENT64=3D${samba_cv_HAVE_STRUCT_DIRENT64=3Dyes}
> -samba_cv_HAVE_STRUCT_FLOCK64=3D${samba_cv_HAVE_STRUCT_FLOCK64=3Dyes}
> -samba_cv_HAVE_TRUNCATED_SALT=3D${samba_cv_HAVE_TRUNCATED_SALT=3Dno}
> -samba_cv_HAVE_UNSIGNED_CHAR=3D${samba_cv_HAVE_UNSIGNED_CHAR=3Dno}
> -samba_cv_HAVE_WORKING_AF_LOCAL=3D${samba_cv_HAVE_WORKING_AF_LOCAL=3Dno}=

> -samba_cv_HAVE_Werror=3D${samba_cv_HAVE_Werror=3Dyes}
> -samba_cv_REALPATH_TAKES_NULL=3D${samba_cv_REALPATH_TAKES_NULL=3Dno}
> -samba_cv_REPLACE_INET_NTOA=3D${samba_cv_REPLACE_INET_NTOA=3Dno}
> -samba_cv_SIZEOF_INO_T=3D${samba_cv_SIZEOF_INO_T=3Dyes}
> -samba_cv_SIZEOF_OFF_T=3D${samba_cv_SIZEOF_OFF_T=3Dyes}
> =
-samba_cv_SYSCONF_SC_NGROUPS_MAX=3D${samba_cv_SYSCONF_SC_NGROUPS_MAX=3Dyes=
}
> -samba_cv_SYSCONF_SC_NPROC_ONLN=3D${samba_cv_SYSCONF_SC_NPROC_ONLN=3Dno}=

> -samba_cv_SYSQUOTA_FOUND=3D${samba_cv_SYSQUOTA_FOUND=3Dyes}
> -samba_cv_SYSQUOTA_WORKS=3D${samba_cv_SYSQUOTA_WORKS=3Dyes}
> -samba_cv_USE_SETRESUID=3D${samba_cv_USE_SETRESUID=3Dyes}
> -samba_cv_have_longlong=3D${samba_cv_have_longlong=3Dyes}
> -samba_cv_have_setresgid=3D${samba_cv_have_setresgid=3Dyes}
> -samba_cv_have_setresuid=3D${samba_cv_have_setresuid=3Dyes}
> -samba_cv_sysquotas_file=3D${samba_cv_sysquotas_file=3Dlib/sysquotas_4A.=
c}
> -# This cached value needs a local patch to pick it up, upstream =
3.0.14a
> -# doesn't cache it.
> -samba_cv_LINUX_LFS_SUPPORT=3D${samba_cv_LINUX_LFS_SUPPORT=3Dyes}
> diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
> deleted file mode 100644
> index 696b1be..0000000
> --- a/meta/site/mipsel-linux
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -# general
> -ac_cv_func_setvbuf_reversed=3D${ac_cv_func_setvbuf_reversed=3Dno}
> -
> -# bash
> -ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dno}
> -bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dpresent}
> -
> -# openssh
> -ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3Dno}=

> -ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3Dno}
> -ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3Dyes}
> -ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3Dno}
> =
-ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_have_space_d_name_in_s=
truct_dirent=3Dyes}
> -
> -# fget
> -compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
> -
> -# glib
> -glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
> -glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
> -glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
> -glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
> -glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
> -glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
> -glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
> -glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
> -glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
> -glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
> -glib_cv_uscore=3D${glib_cv_uscore=3Dno}
> -
> -# glib-2.0
> -glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
> -utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
> -glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
> -
> -# libpcap
> -ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
> -
> -# startup-notification
> -lf_cv_sane_realloc=3D${lf_cv_sane_realloc=3Dyes}
> -
> -# libidl
> -libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}
> -
> -# ncftp
> -wi_cv_struct_timeval_tv_sec=3D${wi_cv_struct_timeval_tv_sec=3Dlong}
> -wi_cv_struct_timeval_tv_usec=3D${wi_cv_struct_timeval_tv_usec=3Dlong}
> -wi_cv_unix_domain_sockets=3D${wi_cv_unix_domain_sockets=3Dyes}
> -
> -# db
> -db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
> -db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long'}
> -db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
> -db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
> -
> -# rrdtool
> -rd_cv_ieee_works=3D${rd_cv_ieee_works=3Dyes}
> -# ac_cv_path_PERL=3D${ac_cv_path_PERL=3Dno}
> -
> -# gettext
> -am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
> -
> -# samba
> -samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
> -
> -# vim
> -ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
> -
> -# intercom
> -ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
> -
> -#lmbench
> -ac_cv_uint=3D${ac_cv_unit=3Dyes}
> -
> -# D-BUS
> -ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
> -
> -# evolution-data-server
> -ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
> diff --git a/meta/site/mipsel-linux-uclibc =
b/meta/site/mipsel-linux-uclibc
> deleted file mode 100644
> index f921cda..0000000
> --- a/meta/site/mipsel-linux-uclibc
> +++ /dev/null
> @@ -1,100 +0,0 @@
> -# general
> -ac_cv_func_setvbuf_reversed=3D${ac_cv_func_setvbuf_reversed=3Dno}
> -
> -# bash
> -ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dno}
> -bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dpresent}
> -
> -# openssh
> -ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3Dno}=

> -ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3Dno}
> -ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3Dyes}
> -ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3Dno}
> =
-ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_have_space_d_name_in_s=
truct_dirent=3Dyes}
> -
> -# fget
> -compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
> -
> -# glib
> -glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
> -glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
> -glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
> -glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
> -glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
> -glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
> -glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
> -glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
> -glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
> -glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
> -glib_cv_uscore=3D${glib_cv_uscore=3Dno}
> -
> -# libpcap
> -ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
> -
> -# startup-notification
> -lf_cv_sane_realloc=3D${lf_cv_sane_realloc=3Dyes}
> -
> -# libidl
> -libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}
> -
> -# ncftp
> -wi_cv_struct_timeval_tv_sec=3D${wi_cv_struct_timeval_tv_sec=3Dlong}
> -wi_cv_struct_timeval_tv_usec=3D${wi_cv_struct_timeval_tv_usec=3Dlong}
> -wi_cv_unix_domain_sockets=3D${wi_cv_unix_domain_sockets=3Dyes}
> -
> -# gettext
> -am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
> -
> -# samba
> -# from samba 3.0.14a on 5/29/2005
> -ac_cv_func_memcmp_working=3D${ac_cv_func_memcmp_working=3Dyes}
> -ac_cv_have_asprintf_decl=3D${ac_cv_have_asprintf_decl=3Dyes}
> -ac_cv_have_setresgid_decl=3D${ac_cv_have_setresgid_decl=3Dyes}
> -ac_cv_have_setresuid_decl=3D${ac_cv_have_setresuid_decl=3Dyes}
> -ac_cv_have_vasprintf_decl=3D${ac_cv_have_vasprintf_decl=3Dyes}
> -fu_cv_sys_stat_statvfs64=3D${fu_cv_sys_stat_statvfs64=3Dyes}
> -samba_cv_FTRUNCATE_NEEDS_ROOT=3D${samba_cv_FTRUNCATE_NEEDS_ROOT=3Dno}
> =
-samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=3D${samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=
=3Dno}
> -samba_cv_HAVE_BROKEN_GETGROUPS=3D${samba_cv_HAVE_BROKEN_GETGROUPS=3Dno}=

> -samba_cv_HAVE_BROKEN_READDIR=3D${samba_cv_HAVE_BROKEN_READDIR=3Dno}
> -samba_cv_HAVE_C99_VSNPRINTF=3D${samba_cv_HAVE_C99_VSNPRINTF=3Dyes}
> -samba_cv_HAVE_DEV64_T=3D${samba_cv_HAVE_DEV64_T=3Dno}
> -samba_cv_HAVE_DEVICE_MAJOR_FN=3D${samba_cv_HAVE_DEVICE_MAJOR_FN=3Dyes}
> -samba_cv_HAVE_DEVICE_MINOR_FN=3D${samba_cv_HAVE_DEVICE_MINOR_FN=3Dyes}
> =
-samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=3D${samba_cv_HAVE_EXPLICIT_LARGE=
FILE_SUPPORT=3Dyes}
> -samba_cv_HAVE_FCNTL_LOCK=3D${samba_cv_HAVE_FCNTL_LOCK=3Dyes}
> -samba_cv_HAVE_FTRUNCATE_EXTEND=3D${samba_cv_HAVE_FTRUNCATE_EXTEND=3Dyes=
}
> -samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
> -samba_cv_HAVE_INO64_T=3D${samba_cv_HAVE_INO64_T=3Dno}
> =
-samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=3D${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=
=3Dyes}
> =
-samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=3D${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=
=3Dyes}
> =
-samba_cv_HAVE_KERNEL_SHARE_MODES=3D${samba_cv_HAVE_KERNEL_SHARE_MODES=3Dy=
es}
> -samba_cv_HAVE_MAKEDEV=3D${samba_cv_HAVE_MAKEDEV=3Dyes}
> -samba_cv_HAVE_MMAP=3D${samba_cv_HAVE_MMAP=3Dyes}
> -samba_cv_HAVE_OFF64_T=3D${samba_cv_HAVE_OFF64_T=3Dno}
> -samba_cv_HAVE_QUOTACTL_4A=3D${samba_cv_HAVE_QUOTACTL_4A=3Dyes}
> -samba_cv_HAVE_ROOT=3D${samba_cv_HAVE_ROOT=3Dno}
> -samba_cv_HAVE_SECURE_MKSTEMP=3D${samba_cv_HAVE_SECURE_MKSTEMP=3Dyes}
> -samba_cv_HAVE_SENDFILE64=3D${samba_cv_HAVE_SENDFILE64=3Dyes}
> -samba_cv_HAVE_STRUCT_DIRENT64=3D${samba_cv_HAVE_STRUCT_DIRENT64=3Dyes}
> -samba_cv_HAVE_STRUCT_FLOCK64=3D${samba_cv_HAVE_STRUCT_FLOCK64=3Dyes}
> -samba_cv_HAVE_TRUNCATED_SALT=3D${samba_cv_HAVE_TRUNCATED_SALT=3Dno}
> -samba_cv_HAVE_UNSIGNED_CHAR=3D${samba_cv_HAVE_UNSIGNED_CHAR=3Dno}
> -samba_cv_HAVE_WORKING_AF_LOCAL=3D${samba_cv_HAVE_WORKING_AF_LOCAL=3Dno}=

> -samba_cv_HAVE_Werror=3D${samba_cv_HAVE_Werror=3Dyes}
> -samba_cv_REALPATH_TAKES_NULL=3D${samba_cv_REALPATH_TAKES_NULL=3Dno}
> -samba_cv_REPLACE_INET_NTOA=3D${samba_cv_REPLACE_INET_NTOA=3Dno}
> -samba_cv_SIZEOF_INO_T=3D${samba_cv_SIZEOF_INO_T=3Dyes}
> -samba_cv_SIZEOF_OFF_T=3D${samba_cv_SIZEOF_OFF_T=3Dyes}
> =
-samba_cv_SYSCONF_SC_NGROUPS_MAX=3D${samba_cv_SYSCONF_SC_NGROUPS_MAX=3Dyes=
}
> -samba_cv_SYSCONF_SC_NPROC_ONLN=3D${samba_cv_SYSCONF_SC_NPROC_ONLN=3Dno}=

> -samba_cv_SYSQUOTA_FOUND=3D${samba_cv_SYSQUOTA_FOUND=3Dyes}
> -samba_cv_SYSQUOTA_WORKS=3D${samba_cv_SYSQUOTA_WORKS=3Dyes}
> -samba_cv_USE_SETRESUID=3D${samba_cv_USE_SETRESUID=3Dyes}
> -samba_cv_have_longlong=3D${samba_cv_have_longlong=3Dyes}
> -samba_cv_have_setresgid=3D${samba_cv_have_setresgid=3Dyes}
> -samba_cv_have_setresuid=3D${samba_cv_have_setresuid=3Dyes}
> -samba_cv_sysquotas_file=3D${samba_cv_sysquotas_file=3Dlib/sysquotas_4A.=
c}
> -# This cached value needs a local patch to pick it up, upstream =
3.0.14a
> -# doesn't cache it.
> -samba_cv_LINUX_LFS_SUPPORT=3D${samba_cv_LINUX_LFS_SUPPORT=3Dyes}
> diff --git a/meta/site/powerpc-common b/meta/site/powerpc-common
> deleted file mode 100644
> index efa299c..0000000
> --- a/meta/site/powerpc-common
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -# glib
> -ac_cv_alignof_guint32=3D4
> -ac_cv_alignof_guint64=3D8
> -ac_cv_alignof_unsigned_long=3D4
> -
> -# at-spi2-core
> -ac_cv_alignof_char=3D1
> -ac_cv_alignof_dbind_pointer=3D4
> -ac_cv_alignof_dbind_struct=3D1
> -ac_cv_alignof_dbus_bool_t=3D4
> -ac_cv_alignof_dbus_int16_t=3D2
> -ac_cv_alignof_dbus_int32_t=3D4
> -ac_cv_alignof_dbus_int64_t=3D8
> -ac_cv_alignof_double=3D8
> diff --git a/meta/site/powerpc-darwin b/meta/site/powerpc-darwin
> deleted file mode 100644
> index 085f50b..0000000
> --- a/meta/site/powerpc-darwin
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# pkgconfig-native for OS X buid
> -ac_cv_sizeof_char=3D${ac_cv_sizeof_char=3D1}
> -ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
> -ac_cv_sizeof_long=3D${ac_cv_sizeof_long=3D4}
> -ac_cv_sizeof_long_long=3D${ac_cv_sizeof_long_long=3D8}
> -ac_cv_sizeof_short=3D${ac_cv_sizeof_short=3D2}
> -ac_cv_sizeof_void_p=3D${ac_cv_sizeof_void_p=3D4}
> diff --git a/meta/site/powerpc-linux b/meta/site/powerpc-linux
> deleted file mode 100644
> index a9f89cb..0000000
> --- a/meta/site/powerpc-linux
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -# general
> -ac_cv_va_val_copy=3D${ac_cv_va_val_copy=3Dyes}
> -
> -# startup-notification
> -lf_cv_sane_realloc=3Dyes
> -
> -# glib
> -glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
> -glib_cv_uscore=3D${glib_cv_uscore=3Dno}
> -glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
> -
> -# lftp
> -lftp_cv_va_val_copy=3D${lftp_cv_va_val_copy=3Dyes}
> -
> -# slrn
> -slrn_cv_va_val_copy=3D${slrn_cv_va_val_copy=3Dyes}
> diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
> deleted file mode 100644
> index e3929ac..0000000
> --- a/meta/site/powerpc32-linux
> +++ /dev/null
> @@ -1,275 +0,0 @@
> -ac_cv_func_setvbuf_reversed=3Dno
> -ac_cv_sizeof___int64=3D${ac_cv_sizeof___int64=3D0}
> -ac_cv_sizeof_bool=3D${ac_cv_sizeof_bool=3D1}
> -ac_cv_sizeof_char=3D${ac_cv_sizeof_char=3D1}
> -ac_cv_sizeof_char_p=3D${ac_cv_sizeof_char_p=3D4}
> -ac_cv_sizeof_double=3D${ac_cv_sizeof_double=3D8}
> -ac_cv_sizeof_float=3D${ac_cv_sizeof_float=3D4}
> -ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
> -ac_cv_sizeof_int_p=3D${ac_cv_sizeof_int_p=3D4}
> -ac_cv_sizeof_long=3D${ac_cv_sizeof_long=3D4}
> -ac_cv_sizeof_long_p=3D${ac_cv_sizeof_long_p=3D4}
> -ac_cv_sizeof_long_double=3D${ac_cv_sizeof_long_double=3D16}
> -ac_cv_sizeof_long_int=3D${ac_cv_sizeof_long_int=3D4}
> -ac_cv_sizeof_long_long=3D${ac_cv_sizeof_long_long=3D8}
> -ac_cv_sizeof_long_long_int=3D${ac_cv_sizeof_long_long_int=3D8}
> -ac_cv_sizeof_short=3D${ac_cv_sizeof_short=3D2}
> -ac_cv_sizeof_short_int=3D${ac_cv_sizeof_short_int=3D2}
> -ac_cv_sizeof_signed_char=3D${ac_cv_sizeof_signed_char=3D1}
> -ac_cv_sizeof_size_t=3D${ac_cv_sizeof_size_t=3D4}
> -ac_cv_sizeof_unsigned_char=3D${ac_cv_sizeof_unsigned_char=3D1}
> -ac_cv_sizeof_unsigned_int=3D${ac_cv_sizeof_unsigned_int=3D4}
> -ac_cv_sizeof_unsigned_long=3D${ac_cv_sizeof_unsigned_long=3D4}
> -ac_cv_sizeof_unsigned_long_int=3D${ac_cv_sizeof_unsigned_long_int=3D4}
> =
-ac_cv_sizeof_unsigned_long_long_int=3D${ac_cv_sizeof_unsigned_long_long_i=
nt=3D8}
> -ac_cv_sizeof_unsigned_short=3D${ac_cv_sizeof_unsigned_short=3D2}
> -ac_cv_sizeof_unsigned_short_int=3D${ac_cv_sizeof_unsigned_short_int=3D2=
}
> -ac_cv_sizeof_void_p=3D${ac_cv_sizeof_void_p=3D4}
> -ac_cv_sizeof_wchar_t=3D${ac_cv_sizeof_wchar_t=3D4}
> -ac_cv_type___int64=3D${ac_cv_type___int64=3Dno}
> -ac_cv_type_size_t=3D${ac_cv_type_size_t=3Dyes}
> -ac_cv_type_void_p=3D${ac_cv_type_void_p=3Dyes}
> -ac_cv_uchar=3D${ac_cv_uchar=3Dno}
> -ac_cv_uint=3D${ac_cv_uint=3Dyes}
> -ac_cv_ulong=3D${ac_cv_ulong=3Dyes}
> -ac_cv_ushort=3D${ac_cv_ushort=3Dyes}
> -ac_cv_time_r_type=3D${ac_cv_time_r_type=3DPOSIX}
> =
-cookie_io_functions_use_off64_t=3D${cookie_io_functions_use_off64_t=3Dyes=
}
> -
> -
> -# apache
> -ac_cv_func_pthread_key_delete=3D${ac_cv_func_pthread_key_delete=3Dyes}
> -apr_cv_process_shared_works=3D${apr_cv_process_shared_works=3Dno}
> -ac_cv_sizeof_ssize_t=3D${ac_cv_sizeof_ssize_t=3D4}
> -
> -ac_cv_header_netinet_sctp_h=3D${ac_cv_header_netinet_sctp_h=3Dno}
> -ac_cv_header_netinet_sctp_uio_h=3D${ac_cv_header_netinet_sctp_uio_h=3Dn=
o}
> -ac_cv_sctp=3D${ac_cv_sctp=3Dno}
> -
> -# ssh
> =
-ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_dirent_have_space_d_na=
me=3Dyes}
> -ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3Dno}
> -ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3Dno}=

> -ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3Dyes}
> -ac_cv_type_struct_timespec=3D${ac_cv_type_struct_timespec=3Dyes}
> -ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3Dyes}
> -
> -# coreutils
> -utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1019}
> -
> -# libpcap
> -ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
> -
> -# nano
> -ac_cv_regexec_segfault_emptystr=3D${ac_cv_regexec_segfault_emptystr=3Dn=
o}
> =
-nano_cv_func_regexec_segv_emptystr=3D${nano_cv_func_regexec_segv_emptystr=
=3Dno}
> -
> -
> -# libnet
> -ac_libnet_have_packet_socket=3D${ac_libnet_have_packet_socket=3Dyes}
> -
> -# screen
> -screen_cv_sys_bcopy_overlap=3D${screen_cv_sys_bcopy_overlap=3Dno}
> -screen_cv_sys_memcpy_overlap=3D${screen_cv_sys_memcpy_overlap=3Dno}
> -screen_cv_sys_memmove_overlap=3D${screen_cv_sys_memmove_overlap=3Dno}
> -screen_cv_sys_fifo_broken_impl=3D${screen_cv_sys_fifo_broken_impl=3Dyes=
}
> -screen_cv_sys_fifo_usable=3D${screen_cv_sys_fifo_usable=3Dyes}
> =
-screen_cv_sys_select_broken_retval=3D${screen_cv_sys_select_broken_retval=
=3Dno}
> -screen_cv_sys_sockets_nofs=3D${screen_cv_sys_sockets_nofs=3Dno}
> -screen_cv_sys_sockets_usable=3D${screen_cv_sys_sockets_usable=3Dyes}
> -screen_cv_sys_terminfo_used=3D${screen_cv_sys_terminfo_used=3Dyes}
> -
> =
-ac_cv_func_lstat_dereferences_slashed_symlink=3D${ac_cv_func_lstat_derefe=
rences_slashed_symlink=3Dyes}
> =
-ac_cv_func_lstat_empty_string_bug=3D${ac_cv_func_lstat_empty_string_bug=3D=
no}
> =
-ac_cv_func_stat_empty_string_bug=3D${ac_cv_func_stat_empty_string_bug=3Dn=
o}
> =
-ac_cv_func_stat_ignores_trailing_slash=3D${ac_cv_func_stat_ignores_traili=
ng_slash=3Dno}
> -
> -# socat
> -ac_cv_ispeed_offset=3D${ac_cv_ispeed_offset=3D13}
> -sc_cv_termios_ispeed=3D${sc_cv_termios_ispeed=3Dyes}
> -
> -# links
> =
-ac_cv_lib_png_png_create_info_struct=3D${ac_cv_lib_png_png_create_info_st=
ruct=3Dyes}
> -
> -# db
> -db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
> -db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
> -db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
> -db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long'}
> -
> -# php
> -ac_cv_pread=3D${ac_cv_pread=3Dno}
> -ac_cv_pwrite=3D${ac_cv_pwrite=3Dno}
> =
-php_cv_lib_cookie_io_functions_use_off64_t=3D${php_cv_lib_cookie_io_funct=
ions_use_off64_t=3Dyes}
> -
> -# gettext
> -am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
> -
> -# glib
> -glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
> -glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
> -glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
> -glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
> -glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
> -glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
> -glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
> -glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
> -glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
> -glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
> =
-glib_cv_sys_pthread_mutex_trylock_posix=3D${glib_cv_sys_pthread_mutex_try=
lock_posix=3Dyes}
> =
-glib_cv_sys_pthread_getspecific_posix=3D${glib_cv_sys_pthread_getspecific=
_posix=3Dyes}
> =
-glib_cv_sys_pthread_cond_timedwait_posix=3D${glib_cv_sys_pthread_cond_tim=
edwait_posix=3Dyes}
> -
> -# ettercap
> -ettercap_cv_type_socklen_t=3D${ettercap_cv_type_socklen_t=3Dyes}
> -
> -# libesmtp
> -acx_working_snprintf=3D${acx_working_snprintf=3Dyes}
> -
> -# D-BUS
> -ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
> -
> -# glib 2.0
> -glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
> -glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
> -glib_cv_sizeof_intmax_t=3D${glib_cv_sizeof_intmax_t=3D8}
> -glib_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D4}
> -glib_cv_sizeof_size_t=3D${glib_cv_sizeof_size_t=3D4}
> -glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
> =
-glib_cv_sys_use_pid_niceness_surrogate=3D${glib_cv_sys_use_pid_niceness_s=
urrogate=3Dyes}
> -
> -glib_cv_strlcpy=3D${glib_cv_strlcpy=3Dno}
> -
> -# httppc
> -ac_cv_strerror_r_SUSv3=3D${ac_cv_strerror_r_SUSv3=3Dno}
> -
> -# lftp
> -ac_cv_need_trio=3D${ac_cv_need_trio=3Dno}
> -lftp_cv_va_val_copy=3D${lftp_cv_va_val_copy=3Dyes}
> -
> -# edb
> -db_cv_spinlocks=3D${db_cv_spinlocks=3Dno}
> -
> -# fget
> -compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
> -compat_cv_func_basename_works=3D${compat_cv_func_basename_works=3Dno}
> -compat_cv_func_dirname_works=3D${compat_cv_func_dirname_works=3Dno}
> -
> -# slrn
> -slrn_cv_va_val_copy=3D${slrn_cv_va_val_copy=3Dyes}
> -
> -# libidl
> -libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}
> -
> -# ORBit2
> -ac_cv_alignof_CORBA_boolean=3D1
> -ac_cv_alignof_CORBA_char=3D1
> -ac_cv_alignof_CORBA_double=3D4
> -ac_cv_alignof_CORBA_float=3D4
> -ac_cv_alignof_CORBA_long=3D4
> -ac_cv_alignof_CORBA_long_double=3D4
> -ac_cv_alignof_CORBA_long_long=3D4
> -ac_cv_alignof_CORBA_octet=3D1
> -ac_cv_alignof_CORBA_pointer=3D4
> -ac_cv_alignof_CORBA_short=3D2
> -ac_cv_alignof_CORBA_struct=3D4
> -ac_cv_alignof_CORBA_wchar=3D2
> -
> -# cvs
> -cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=3Dyes}
> -
> -# bash
> -ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dyes}
> -bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dmissing}
> -
> -# openssh
> -ac_cv_have_broken_dirname=3D${ac_cv_have_broken_dirname=3D'yes'}
> =
-ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_have_space_d_name_in_s=
truct_dirent=3D'no'}
> -ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3D'no'}
> -ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3D'yes'}
> -ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3D'no=
'}
> -ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3D'yes'}
> -
> -# vim
> -ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D'4'}
> -
> -#modphp
> -ac_cv_c_bigendian_php=3D${ac_cv_c_bigendian_php=3Dyes}
> -ac_cv_sizeof_ptrdiff_t=3D${ac_cv_sizeof_ptrdiff_t=3D4}
> -
> -# apache2 (note other apache stanza in this file)
> -ap_void_ptr_lt_long=3D${ap_void_ptr_lt_long=3Dno}
> -apr_cv_use_lfs64=3D${apr_cv_use_lfs64=3Dyes}
> -apr_cv_epoll=3D${apr_cv_epoll=3Dyes}
> -apr_cv_pthreads_cflags=3D${apr_cv_pthreads_cflags=3D-pthread}
> -apr_cv_pthreads_lib=3D${apr_cv_pthreads_lib=3D-lpthread}
> -ac_cv_func_mmap=3D${ac_cv_func_mmap=3Dyes}
> -ac_cv_file__dev_zero=3D${ac_cv_file__dev_zero=3Dyes}
> -ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
> -ac_cv_sizeof_pid_t=3D${ac_cv_sizeof_pid_t=3D4}
> -ac_cv_socklen_t=3D${ac_cv_socklen_t=3Dyes}
> -ac_cv_struct_rlimit=3D${ac_cv_struct_rlimit=3Dyes}
> -ac_cv_negative_eai=3D${ac_cv_negative_eai=3Dyes}
> -apr_cv_gai_addrconfig=3D${apr_cv_gai_addrconfig=3Dno}
> -apr_cv_tcp_nodelay_with_cork=3D${apr_cv_tcp_nodelay_with_cork=3Dyes}
> -
> -# binutils (libiberty)
> -ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
> -ac_cv_type_int=3D${ac_cv_type_int=3Dyes}
> -ac_cv_type_uintptr_t=3D${ac_cv_type_uintptr_t=3Dyes}
> -liberty_cv_uint64=3D${liberty_cv_uint64=3Duint64_t}
> -
> -#samba
> -ac_cv_func_memcmp_working=3D${ac_cv_func_memcmp_working=3Dyes}
> -fu_cv_sys_stat_statvfs64=3D${fu_cv_sys_stat_statvfs64=3Dyes}
> =
-samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=3D${samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=
=3Dno}
> -samba_cv_HAVE_BROKEN_GETGROUPS=3D${samba_cv_HAVE_BROKEN_GETGROUPS=3Dno}=

> -samba_cv_HAVE_BROKEN_READDIR=3D${samba_cv_HAVE_BROKEN_READDIR=3Dyes}
> =
-samba_cv_HAVE_BROKEN_READDIR_NAME=3D${samba_cv_HAVE_BROKEN_READDIR_NAME=3D=
no}
> -samba_cv_HAVE_C99_VSNPRINTF=3D${samba_cv_HAVE_C99_VSNPRINTF=3Dyes}
> -samba_cv_HAVE_DEV64_T=3D${samba_cv_HAVE_DEV64_T=3Dno}
> -samba_cv_HAVE_DEVICE_MAJOR_FN=3D${samba_cv_HAVE_DEVICE_MAJOR_FN=3Dyes}
> -samba_cv_HAVE_DEVICE_MINOR_FN=3D${samba_cv_HAVE_DEVICE_MINOR_FN=3Dyes}
> -samba_cv_HAVE_FCNTL_LOCK=3D${samba_cv_HAVE_FCNTL_LOCK=3Dyes}
> -samba_cv_HAVE_FTRUNCATE_EXTEND=3D${samba_cv_HAVE_FTRUNCATE_EXTEND=3Dyes=
}
> -samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
> -samba_cv_HAVE_INO64_T=3D${samba_cv_HAVE_INO64_T=3Dno}
> =
-samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=3D${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=
=3Dyes}
> =
-samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=3D${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=
=3Dyes}
> =
-samba_cv_HAVE_KERNEL_SHARE_MODES=3D${samba_cv_HAVE_KERNEL_SHARE_MODES=3Dy=
es}
> -samba_cv_HAVE_MAKEDEV=3D${samba_cv_HAVE_MAKEDEV=3Dyes}
> -samba_cv_HAVE_MMAP=3D${samba_cv_HAVE_MMAP=3Dyes}
> -samba_cv_HAVE_OFF64_T=3D${samba_cv_HAVE_OFF64_T=3Dno}
> -samba_cv_HAVE_SECURE_MKSTEMP=3D${samba_cv_HAVE_SECURE_MKSTEMP=3Dyes}
> -samba_cv_HAVE_SENDFILE64=3D${samba_cv_HAVE_SENDFILE64=3Dyes}
> -samba_cv_HAVE_SENDFILE=3D${samba_cv_HAVE_SENDFILE=3Dyes}
> -samba_cv_HAVE_STRUCT_FLOCK64=3D${samba_cv_HAVE_STRUCT_FLOCK64=3Dyes}
> -samba_cv_HAVE_TRUNCATED_SALT=3D${samba_cv_HAVE_TRUNCATED_SALT=3Dno}
> -samba_cv_HAVE_UNSIGNED_CHAR=3D${samba_cv_HAVE_UNSIGNED_CHAR=3Dyes}
> -samba_cv_HAVE_WORKING_AF_LOCAL=3D${samba_cv_HAVE_WORKING_AF_LOCAL=3Dyes=
}
> -samba_cv_LINUX_LFS_SUPPORT=3D${samba_cv_LINUX_LFS_SUPPORT=3Dyes}
> -samba_cv_REALPATH_TAKES_NULL=3D${samba_cv_REALPATH_TAKES_NULL=3Dyes}
> -samba_cv_REPLACE_INET_NTOA=3D${samba_cv_REPLACE_INET_NTOA=3Dno}
> -samba_cv_REPLACE_READDIR=3D${samba_cv_REPLACE_READDIR=3Dno}
> -samba_cv_SIZEOF_DEV_T=3D${samba_cv_SIZEOF_DEV_T=3Dyes}
> -samba_cv_SIZEOF_INO_T=3D${samba_cv_SIZEOF_INO_T=3Dyes}
> -samba_cv_SIZEOF_OFF_T=3D${samba_cv_SIZEOF_OFF_T=3Dyes}
> -samba_cv_STAT_STATVFS64=3D${samba_cv_STAT_STATVFS64=3Dyes}
> -samba_cv_USE_SETEUID=3D${samba_cv_USE_SETEUID=3Dyes}
> -samba_cv_USE_SETRESUID=3D${samba_cv_USE_SETRESUID=3Dyes}
> -samba_cv_USE_SETREUID=3D${samba_cv_USE_SETREUID=3Dyes}
> -samba_cv_USE_SETUIDX=3D${samba_cv_USE_SETUIDX=3Dyes}
> -samba_cv_have_longlong=3D${samba_cv_have_longlong=3Dyes}
> -samba_cv_have_setresgid=3D${samba_cv_have_setresgid=3Dyes}
> -samba_cv_have_setresuid=3D${samba_cv_have_setresuid=3Dyes}
> -
> -# mysql
> -mysql_cv_func_atomic_sub=3D${mysql_cv_func_atomic_sub=3Dno}
> -mysql_cv_func_atomic_add=3D${mysql_cv_func_atomic_add=3Dno}
> -
> -
> -# libc
> -libc_cv_ppc_machine=3D${libc_cv_ppc_machine=3Dyes}
> -libc_cv_mlong_double_128ibm=3D${libc_cv_mlong_double_128ibm=3Dyes}
> -libc_cv_mabi_ibmlongdouble=3D${libc_cv_mabi_ibmlongdouble=3Dyes}
> -libc_cv_mlong_double_128=3D${libc_cv_mlong_double_128=3Dyes}
> diff --git a/meta/site/powerpc64-linux b/meta/site/powerpc64-linux
> deleted file mode 100644
> index d64e230..0000000
> --- a/meta/site/powerpc64-linux
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -ac_cv_sizeof_char=3D${ac_cv_sizeof_char=3D1}
> -ac_cv_sizeof_char_p=3D${ac_cv_sizeof_char_p=3D8}
> -ac_cv_sizeof_double=3D${ac_cv_sizeof_double=3D8}
> -ac_cv_sizeof_float=3D${ac_cv_sizeof_float=3D4}
> -ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
> -ac_cv_sizeof_long=3D${ac_cv_sizeof_long=3D8}
> -ac_cv_sizeof_long_double=3D${ac_cv_sizeof_long_double=3D16}
> -ac_cv_sizeof_long_int=3D${ac_cv_sizeof_long_int=3D8}
> -ac_cv_sizeof_long_long=3D${ac_cv_sizeof_long_long=3D8}
> -ac_cv_sizeof_long_long_int=3D${ac_cv_sizeof_long_long_int=3D8}
> -ac_cv_sizeof_short=3D${ac_cv_sizeof_short=3D2}
> -ac_cv_sizeof_short_int=3D${ac_cv_sizeof_short_int=3D2}
> -ac_cv_sizeof_signed_char=3D${ac_cv_sizeof_signed_char=3D1}
> -ac_cv_sizeof_unsigned_char=3D${ac_cv_sizeof_unsigned_char=3D1}
> -ac_cv_sizeof_unsigned_int=3D${ac_cv_sizeof_unsigned_int=3D4}
> -ac_cv_sizeof_unsigned_long=3D${ac_cv_sizeof_unsigned_long=3D8}
> -ac_cv_sizeof_unsigned_long_int=3D${ac_cv_sizeof_unsigned_long_int=3D8}
> =
-ac_cv_sizeof_unsigned_long_long_int=3D${ac_cv_sizeof_unsigned_long_long_i=
nt=3D8}
> -ac_cv_sizeof_unsigned_short=3D${ac_cv_sizeof_unsigned_short=3D2}
> -ac_cv_sizeof_unsigned_short_int=3D${ac_cv_sizeof_unsigned_short_int=3D2=
}
> -ac_cv_sizeof_void_p=3D${ac_cv_sizeof_void_p=3D8}
> -
> -# screen
> -screen_cv_sys_bcopy_overlap=3D${screen_cv_sys_bcopy_overlap=3Dno}
> -screen_cv_sys_memcpy_overlap=3D${screen_cv_sys_memcpy_overlap=3Dno}
> -screen_cv_sys_memmove_overlap=3D${screen_cv_sys_memmove_overlap=3Dno}
> -screen_cv_sys_fifo_broken_impl=3D${screen_cv_sys_fifo_broken_impl=3Dyes=
}
> -screen_cv_sys_fifo_usable=3D${screen_cv_sys_fifo_usable=3Dyes}
> =
-screen_cv_sys_select_broken_retval=3D${screen_cv_sys_select_broken_retval=
=3Dno}
> -screen_cv_sys_sockets_nofs=3D${screen_cv_sys_sockets_nofs=3Dno}
> -screen_cv_sys_sockets_usable=3D${screen_cv_sys_sockets_usable=3Dyes}
> -screen_cv_sys_terminfo_used=3D${screen_cv_sys_terminfo_used=3Dyes}
> -
> -# libpcap
> -ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
> -
> -# apr
> -apr_cv_tcp_nodelay_with_cork=3D${apr_cv_tcp_nodelay_with_cork=3Dyes}
> -
> --
> 2.6.4 (Apple Git-63)
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_BDB87017-2ED0-4E86-BE61-C1B96547D0E3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb/hEcACgkQuwUzVZGdMxS0/QCfbIq0TquU8poeZp4dGtuSbXwJ
gEEAoISK0lt8eAdpg/eh29jXQseozkgA
=wMXQ
-----END PGP SIGNATURE-----

--Apple-Mail=_BDB87017-2ED0-4E86-BE61-C1B96547D0E3--
