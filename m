Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DAFC0015E
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 13:15:46 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.10854.1691327740875465547
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Aug 2023 06:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RGiLSigY;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: luca.boccassi@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-586bacac98aso9592257b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 06:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691327740; x=1691932540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U84kBbrteXrbHIGEz4zWD4+MDeBwc9stym6VdevrubI=;
        b=RGiLSigYFgxmphNCYg1qOAqxnyMHGxA+0Mty1Q9+10h+Q0TwKsdIjq1tN4+E8hlRvV
         oY29XpAva/P/6jZtn84I10seZjLueAHJddJE38n9eCIpPh4mIuSuuhmbX/sKk3LAwUM9
         t4XePNkQvFaRZ7SVfnNCqwlNyUQe1B5D2+lohap1SxlXccN+A0xgBWHFUWy4SQlBbe1S
         7C7itG898uBwGPBItYxEgs+k9ElqBM7aKVODUOF3hAWglmJNbKhoZMzkx9wAhXv0Nauv
         JfkTzT3WIWZSVDrVwN5JzTV5qnAnYbY7D/tVt4ZvMrGIX50gs/RmcXCjsDuYPNk+MWpj
         AJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691327740; x=1691932540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U84kBbrteXrbHIGEz4zWD4+MDeBwc9stym6VdevrubI=;
        b=QZ3Sefnzpc/Gj1U3NFZ1lDtwf8/54S+T7Zi3amzgk9VcAyOni2ZLeNOziITXhJ4rHE
         qKOKLHiZC6Sjre0nxoMxUIAqkvdh2XYG5AZPWKmrjiixPbjxNFe0TWTnWSe+I8VAq/LS
         9snvjud+qqWvV6OPoE4T1eNEsUzIDar2uxpWNFTX1UXFBtO0EdLJeD8aJDiyKhujlm9c
         +6bfGOayLPqmU1ZgJjKpRIvVW6od3B3kKM9ZwUbH/4w+oLO9HsvdmyssnyftzhRZNCwV
         qQTk0hhgYbfunV0OXHo5ffx1I1X+THy2n6oSJJWBPq4ci8/hDMpx6cJ5anFoCS64Ba+W
         +0rQ==
X-Gm-Message-State: AOJu0YzfgIGsauJle2HdJZyTSKTgtwOZU4VUWVbTS1XJcDEYvdyR4wkF
	6Fa47INhuTxD5qQsP4lCfFSBI+Qnnpj/ylCqXh4=
X-Google-Smtp-Source: AGHT+IFgZWrfefoqehR84H/6MTwOAP8GtbYOw0vd2UTNKcznxtHblrkCUGq8FadfCQ89kATQ/6bDECivPJ09W8ulZOc=
X-Received: by 2002:a81:4785:0:b0:57a:6a2c:f4dd with SMTP id
 u127-20020a814785000000b0057a6a2cf4ddmr6826158ywa.36.1691327739947; Sun, 06
 Aug 2023 06:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230802231615.2106089-1-luca.boccassi@gmail.com> <202308061238184bdb334c@mail.local>
In-Reply-To: <202308061238184bdb334c@mail.local>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Sun, 6 Aug 2023 14:15:27 +0100
Message-ID: <CAMw=ZnQZ0ZJGjm5DCMza2dfF+xhpAoaPbgeMvJre6NM_qNd6RQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v8] systemd: update to v254
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 13:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185565

On Sun, 6 Aug 2023 at 13:38, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> I have high suspicions that the upgrade causes the following failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5559/st=
eps/14/logs/stdio
>
> ERROR: core-image-minimal-1.0-r0 do_image_wic: ExecutionError('/home/poky=
build/yocto-worker/oe-selftest-fedora/build/build-st-1163224/tmp/work/qemux=
86_64-poky-linux/core-image-minimal/1.0-r0/temp/run.do_image_wic.1308950', =
1, None, None)
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/oe-self=
test-fedora/build/build-st-1163224/tmp/work/qemux86_64-poky-linux/core-imag=
e-minimal/1.0-r0/temp/log.do_image_wic.1308950
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/oe-selftes=
t-fedora/build/meta/recipes-bsp/grub/grub-efi_2.06.bb:do_populate_sysroot',=
 '/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-core/g=
libc/cross-localedef-native_2.37.bb:do_populate_sysroot', '/home/pokybuild/=
yocto-worker/oe-selftest-fedora/build/meta/recipes-core/glibc/ldconfig-nati=
ve_2.12.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/oe-selftes=
t-fedora/build/meta/recipes-core/os-release/os-release.bb:do_populate_sysro=
ot', '/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-co=
re/systemd/systemd-boot_254.bb:do_populate_sysroot', '/home/pokybuild/yocto=
-worker/oe-selftest-fedora/build/meta/recipes-devtools/binutils/binutils-cr=
oss_2.41.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/oe-selftest=
-fedora/build/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb:do_pop=
ulate_sysroot', '/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta=
/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot', '/hom=
e/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtools/sys=
linux/syslinux_6.04-pre2.bb:do_populate_sysroot', '/home/pokybuild/yocto-wo=
rker/oe-selftest-fedora/build/meta/recipes-kernel/kmod/depmodwrapper-cross_=
1.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/o=
e-selftest-fedora/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do=
_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftes=
t-fedora/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.1.bb:do_po=
pulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-f=
edora/build/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_po=
pulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-f=
edora/build/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_populate_sysroot', '=
virtual:native:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/r=
ecipes-devtools/dosfstools/dosfstools_4.2.bb:do_populate_sysroot', 'virtual=
:native:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-=
devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot', 'virtual:nativ=
e:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtoo=
ls/erofs-utils/erofs-utils_1.6.bb:do_populate_sysroot', 'virtual:native:/ho=
me/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtools/fd=
isk/gptfdisk_1.0.9.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild=
/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtools/makedevs/maked=
evs_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-wo=
rker/oe-selftest-fedora/build/meta/recipes-devtools/mtools/mtools_4.0.43.bb=
:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-self=
test-fedora/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_p=
opulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-=
fedora/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot=
', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/me=
ta/recipes-devtools/rpm/rpm_4.18.1.bb:do_populate_sysroot', 'virtual:native=
:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtool=
s/squashfs-tools/squashfs-tools_git.bb:do_populate_sysroot', 'virtual:nativ=
e:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtoo=
ls/syslinux/syslinux_6.04-pre2.bb:do_populate_sysroot', 'virtual:native:/ho=
me/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-extended/pa=
rted/parted_3.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yo=
cto-worker/oe-selftest-fedora/build/meta/recipes-extended/pbzip2/pbzip2_1.1=
.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/o=
e-selftest-fedora/build/meta/recipes-extended/pigz/pigz_2.7.bb:do_populate_=
sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-fedora/b=
uild/meta/recipes-support/bmap-tools/bmap-tools_git.bb:do_populate_sysroot'=
]
> | NOTE: Installed into sysroot: ['cpio-native']
> | NOTE: Skipping as already exists in sysroot: ['grub-efi', 'cross-locale=
def-native', 'ldconfig-native', 'os-release', 'systemd-boot', 'binutils-cro=
ss-x86_64', 'cdrtools-native', 'qemuwrapper-cross', 'syslinux', 'depmodwrap=
per-cross', 'update-rc.d-native', 'btrfs-tools-native', 'createrepo-c-nativ=
e', 'dnf-native', 'dosfstools-native', 'e2fsprogs-native', 'erofs-utils-nat=
ive', 'gptfdisk-native', 'makedevs-native', 'mtools-native', 'opkg-utils-na=
tive', 'pseudo-native', 'rpm-native', 'squashfs-tools-native', 'syslinux-na=
tive', 'parted-native', 'pbzip2-native', 'pigz-native', 'bmap-tools-native'=
, 'libtool-native', 'texinfo-dummy-native', 'util-linux-native', 'attr-nati=
ve', 'gettext-minimal-native', 'file-native', 'xz-native', 'elfutils-native=
', 'lua-native', 'zstd-native', 'sqlite3-native', 'libgcrypt-native', 'pyth=
on3-native', 'bzip2-native', 'popt-native', 'openssl-native', 'zlib-native'=
, 'expat-native', 'glib-2.0-native', 'cmake-native', 'curl-native', 'libxml=
2-native', 'python3-setuptools-native', 'kmod-native', 'python3-build-nativ=
e', 'python3-installer-native', 'python3-wheel-native', 'python3-six-native=
', 'coreutils-native', 'shared-mime-info-native', 'nasm-native', 'ncurses-n=
ative', 'util-linux-libuuid-native', 'lz4-native', 'qemu-native', 'libcomps=
-native', 'libdnf-native', 'librepo-native', 'python3-iniparse-native', 'sh=
adow-native', 'glibc', 'gcc-runtime', 'flex-native', 'gnu-config-native', '=
e2fsprogs', 'util-linux', 'readline-native', 'perl-native', 'lzo-native', '=
debianutils-native', 'libcap', 'libpcre2-native', 'libcap-ng-native', 'libm=
icrohttpd-native', 'libarchive-native', 'libcap-native', 'libgpg-error-nati=
ve', 'gdbm-native', 'libnsl2-native', 'libedit-native', 'libffi-native', 'l=
ibtirpc-native', 'gettext-native', 'qemu-system-native', 'qemu-helper-nativ=
e', 'unfs3-native', 'python3-pyproject-hooks-native', 'python3-flit-core-na=
tive', 'python3-packaging-native', 'itstool-native', 'groff-native', 'gobje=
ct-introspection-native', 'libmodulemd-native', 'swig-native', 'json-c-nati=
ve', 'libsolv-native', 'libcheck-native', 'gpgme-native', 'linux-libc-heade=
rs', 'libgcc', 'm4-native', 'opkg-utils', 'attr', 'bash-completion', 'libca=
p-ng', 'util-linux-libuuid', 'zlib', 'libxcrypt', 'ncurses', 'make-native',=
 'gnutls-native', 'acl-native', 'alsa-lib-native', 'libepoxy-native', 'dtc-=
native', 'libslirp-native', 'virglrenderer-native', 'pixman-native', 'libsd=
l2-native', 'unzip-native', 'libyaml-native', 'libassuan-native', 'libidn2-=
native', 'libunistring-native', 'nettle-native', 'libtasn1-native', 'gmp-na=
tive', 'libx11-native', 'mesa-native', 'libdrm-native', 'libxext-native', '=
libxrandr-native', 'libxrender-native', 'libxcb-native', 'util-macros-nativ=
e', 'xorgproto-native', 'xtrans-native', 'llvm-native', 'wayland-native', '=
libxdamage-native', 'wayland-protocols-native', 'python3-mako-native', 'lib=
xxf86vm-native', 'xrandr-native', 'libxshmfence-native', 'chrpath-native', =
'makedepend-native', 'libxfixes-native', 'libpciaccess-native', 'libpthread=
-stubs-native', 'xcb-proto-native', 'libxau-native', 'libxdmcp-native', 'py=
thon3-pygments-native', 'python3-markupsafe-native']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing python function set_image_size
> | DEBUG: 62249.200000 =3D 47884 * 1.300000
> | DEBUG: 62249.200000 =3D max(62249.200000, 8192)[62249.200000] + 0
> | DEBUG: 62250.000000 =3D int(62249.200000)
> | DEBUG: 62250 =3D aligned(62250)
> | DEBUG: returning 62250
> | DEBUG: Python function set_image_size finished
> | DEBUG: Executing shell function do_image_wic
> | INFO: Creating image(s)...
> |
> | ERROR: _exec_cmd: export PATH=3D/home/pokybuild/yocto-worker/oe-selftes=
t-fedora/build/build-st-1163224/tmp/work/qemux86_64-poky-linux/core-image-m=
inimal/1.0-r0/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/oe-se=
lftest-fedora/build/build-st-1163224/tmp/work/qemux86_64-poky-linux/core-im=
age-minimal/1.0-r0/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-wor=
ker/oe-selftest-fedora/build/build-st-1163224/tmp/work/qemux86_64-poky-linu=
x/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin:/home/pokybuild/y=
octo-worker/oe-selftest-fedora/build/build-st-1163224/tmp/work/qemux86_64-p=
oky-linux/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/x86_64-po=
ky-linux:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-116=
3224/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/recipe-sysroo=
t-native/bin:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st=
-1163224/tmp/hosttools:$PATH;x86_64-poky-linux-objcopy --enable-determinist=
ic-archives --preserve-dates --add-section .osrel=3D/home/pokybuild/yocto-w=
orker/oe-selftest-fedora/build/build-st-1163224/tmp/work/qemux86_64-poky-li=
nux/core-image-minimal/1.0-r0/recipe-sysroot/usr/lib/os-release --change-se=
ction-vma .osrel=3D0x20000 --add-section .cmdline=3D/tmp/tmpqugy4n6d/cmdlin=
e --change-section-vma .cmdline=3D0x30000 --add-section .linux=3D/home/poky=
build/yocto-worker/oe-selftest-fedora/build/build-st-1163224/tmp/deploy/ima=
ges/qemux86-64/bzImage --change-section-vma .linux=3D0x2000000 --add-sectio=
n .initrd=3D/tmp/tmpqugy4n6d/initrd --change-section-vma .initrd=3D0x300000=
0 /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1163224/tm=
p/deploy/images/qemux86-64/linuxx64.efi.stub /home/pokybuild/yocto-worker/o=
e-selftest-fedora/build/build-st-1163224/tmp/work/qemux86_64-poky-linux/cor=
e-image-minimal/1.0-r0/tmp-wic/hdd/boot/EFI/Linux/linux.efi returned '1' in=
stead of 0
> | output: x86_64-poky-linux-objcopy: /home/pokybuild/yocto-worker/oe-self=
test-fedora/build/build-st-1163224/tmp/deploy/images/qemux86-64/linuxx64.ef=
i.stub (.reloc): section flag STYP_GROUP (0x4) ignored
> | /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1163224/=
tmp/deploy/images/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_=
COPY (0x10) ignored
> | /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1163224/=
tmp/deploy/images/qemux86-64/linuxx64.efi.stub: warning: ignoring section f=
lag IMAGE_SCN_MEM_NOT_PAGED in section .reloc
> | x86_64-poky-linux-objcopy: /home/pokybuild/yocto-worker/oe-selftest-fed=
ora/build/build-st-1163224/tmp/deploy/images/qemux86-64/linuxx64.efi.stub (=
.reloc): section flag STYP_GROUP (0x4) ignored
> | /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1163224/=
tmp/deploy/images/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_=
COPY (0x10) ignored
> | /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1163224/=
tmp/deploy/images/qemux86-64/linuxx64.efi.stub: warning: ignoring section f=
lag IMAGE_SCN_MEM_NOT_PAGED in section .reloc
> | x86_64-poky-linux-objcopy: /home/pokybuild/yocto-worker/oe-selftest-fed=
ora/build/build-st-1163224/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: =
file format not recognized
> | x86_64-poky-linux-objcopy: --change-section-vma .initrd=3D0x3000000 nev=
er used
> | x86_64-poky-linux-objcopy: --change-section-vma .linux=3D0x2000000 neve=
r used
> | x86_64-poky-linux-objcopy: --change-section-vma .cmdline=3D0x30000 neve=
r used
> | x86_64-poky-linux-objcopy: --change-section-vma .osrel=3D0x20000 never =
used
> |
> | WARNING: /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st=
-1163224/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/run.=
do_image_wic.1308950:163 exit 1 from 'BUILDDIR=3D"/home/pokybuild/yocto-wor=
ker/oe-selftest-fedora/build/build-st-1163224" PSEUDO_UNLOAD=3D1 wic create=
 "$wks" --vars "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build=
-st-1163224/tmp/sysroots/qemux86-64/imgdata/" -e "core-image-minimal" -o "$=
build_wic/" -w "$tmp_wic"'
> | WARNING: Backtrace (BB generated script):
> |       #1: do_image_wic, /home/pokybuild/yocto-worker/oe-selftest-fedora=
/build/build-st-1163224/tmp/work/qemux86_64-poky-linux/core-image-minimal/1=
.0-r0/temp/run.do_image_wic.1308950, line 163
> |       #2: main, /home/pokybuild/yocto-worker/oe-selftest-fedora/build/b=
uild-st-1163224/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/te=
mp/run.do_image_wic.1308950, line 179
> NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Failed
> ERROR: Task (/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/r=
ecipes-core/images/core-image-minimal.bb:do_image_wic) failed with exit cod=
e '1'

Where does that objcopy command come from? It looks awfully like it is
hard-coding VMAs? That cannot possibly work reliably, the actual VMAs
have to be calculated based on the components being added to the PE.
I'd recommend to use 'ukify' as that makes it much easier, and
actually we have an intern working to add a bbclass for that just now.
But it's not needed, you can do the calculations by hand too, dracut
used to do something similar and was fixed some months ago iirc.

