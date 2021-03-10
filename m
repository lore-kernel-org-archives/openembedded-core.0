Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.7465.1615376085959459895
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 03:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ovVOdpXN;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id d15so22933996wrv.5
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 03:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XYJA9wS6zqz9OEqDlzQk1+UI4hAr/AwYP/T7/PdrpxA=;
        b=ovVOdpXNRqABYzuphQ4GA6sKQK9+BSHDAUi2u0m+Zl2Lce6qirM0MQ3DedAZitYRan
         gsMRYYGOG5GJMONDxzWaucEtdxfvONR5JaJdHMe73OFsO7tPH+0tcmMhM/+oKGDiBwDX
         LKcggRK3cphcs2j7vrtb8mqcfnQlsofGWLcuO/AG0FLxOJbUMqfjUgSCel+0jci2skFc
         5u7k56CJQmR32/DJ+cPaSYVQv1bFlYhQaH/VtXjIWrWImuyiQJUiTkhZ0CkR47qCKZO7
         ZtAn3Wqe5fgrENvicKcOdAeAJEbsWvhfk57kDRTvSu50rosMj/MaKwo3gKIkhkAk1ebq
         WJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XYJA9wS6zqz9OEqDlzQk1+UI4hAr/AwYP/T7/PdrpxA=;
        b=lecs+he+faeASCY5VG+s0H2R/ZtW0bnOFmG09/xWv2sG52XSv79F/1TWIEPMuXWBNj
         Y4P0MM3IBpx8OLLkZpvv8VrQBLwhfhCwa3MNsgR8k1MwXe10lBwVmO19l8OR6QdymO2P
         bAcIxVdtoTN++/NbxMxj/x87n6cL0QAahwNwuanuBZVO5sPBLOwDfP5QwJSa3GzKYM3O
         KKShNAOEpdQFDzLEgPzOFMVGUNzHPSSVdwguIfm+kXpX8ST+NP6FKiSd2ZVh7l4QkFwr
         77GA5wBnMMFMZWT9t7z8CLLezgsmOTQcmbf2x72ZzYJX1TcHCh8YjqfJn+88sX2Ngw+S
         lryg==
X-Gm-Message-State: AOAM530/3bIzPwXm6gu6fY9Bx8zix4IszZq5+pwmt84U3OrF2aKsqYQx
	MN3qiFSb68Y8ha9JYD4Mz6I=
X-Google-Smtp-Source: ABdhPJwyDJxMb7iHekG2rCM7dJzvTz8fnF7CES4HOtwACqqIKuj5ccpVFtyPeoxrnuUqgFgj9yRECw==
X-Received: by 2002:adf:e482:: with SMTP id i2mr3042548wrm.392.1615376084044;
        Wed, 10 Mar 2021 03:34:44 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id o13sm31511528wro.15.2021.03.10.03.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 03:34:43 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 10 Mar 2021 12:34:42 +0100
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][dunfell 00/27] Pull request (cover letter only)
Message-ID: <20210310113442.bowxtz5ckz7kfkij@jama>
References: <cover.1615334832.git.steve@sakoman.com>
MIME-Version: 1.0
In-Reply-To: <cover.1615334832.git.steve@sakoman.com>
X-Groupsio-MsgNum: 149219
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qizy72tce2bfogoz"
Content-Disposition: inline

--qizy72tce2bfogoz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2021 at 02:09:38PM -1000, Steve Sakoman wrote:
> The following changes since commit dd893279f352e290c23577a0f91df1b8c6232=
f10:
>=20
>   selftest/reproducible: Don't call sync between each file compare (2021=
-03-04 04:19:50 -1000)
>=20
> are available in the Git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-ne=
xt
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dstable=
/dunfell-next
>=20
> Martin Jansa (1):
>   sstatesig.py: show an error instead of warning when sstate manifest
>     isn't found

FYI: now when this was backported to gatesgarth and dunfell I've found
one case where it triggers this error:

http://jenkins.nas-admin.org/job/LuneOS/view/testing/job/luneos-testing_ma=
ko/735/console
ERROR: android-kernel-bootimg-1.0-r0 do_package: Manifest
/home/jenkins/workspace/luneos-testing/webos-ports/tmp-glibc/sstate-contro=
l/manifest-x86_64_x86_64-nativesdk-initramfs-android-image.packagedata
not found in mako cortexa8t2hf-neon-halium cortexa8t2hf-neon
cortexa8t2hf-vfp cortexa8hf-neon cortexa8hf-vfp armv7at2hf-neon
armv7ahf-neon armv7at2hf-vfp armv7ahf-vfp armv6thf-vfp armv6hf-vfp
armv5tehf-vfp armv5ehf-vfp armv5thf-vfp armv5hf-vfp allarch
x86_64_x86_64-nativesdk (variant '')?

The error looks strange as it probably shouldn't be looking for
nativesdk- manifest and it doesn't happen with master.

I'll find why it doesn't happen with master and there might be some more
changes to backport (or this change reverted in gatesgarth and dunfell),
I'll let you know.

>=20
> Milan Shah (1):
>   report-error.bbclass: Add layer and bitbake version info to error
>     report
>=20
> Minjae Kim (2):
>   bind: fix CVE-2020-8625
>   librepo: fix CVE-2020-14352
>=20
> Peter Kjellerstedt (1):
>   asciidoc: Switch to using the main branch
>=20
> Richard Purdie (12):
>   linux-firmware: upgrade 20201218 -> 20210208
>   image: Add directories to PSEUDO_IGNORE_PATHS
>   populate_sdk: Add directories to PSEUDO_IGNORE_PATHS
>   bitbake.conf/image: Move image specific PSEUDO_IGNORE_PATHS to image
>     class
>   bitbake.conf: Split PSEUDO_IGNORE_PATHS to be more readable
>   maintainers: Update email address for Victor
>   libevdev: Update patch status to backport
>   ca-certificates: Clean up two patches and submit upstream
>   libpcre: Drop old/stale patch
>   reproducible: Improve SOURCE_DATE_EPOCH_FALLBACK handling
>   package/package_rpm: Disable font_provides configuration for
>     reproducibilty
>   cups: Fix reproducibility issues
>=20
> Scott Murray (1):
>   screen: fix CVE-2021-26937
>=20
> Stefan Ghinea (1):
>   wpa-supplicant: fix CVE-2021-0326
>=20
> Wang Mingyu (1):
>   openssl: upgrade 1.1.1i -> 1.1.1j
>=20
>  meta/classes/image.bbclass                    |   2 +
>  meta/classes/package.bbclass                  |   2 +-
>  meta/classes/package_rpm.bbclass              |   1 +
>  meta/classes/populate_sdk_base.bbclass        |   2 +-
>  meta/classes/report-error.bbclass             |   4 +
>  meta/classes/reproducible_build.bbclass       |  15 +-
>  meta/conf/abi_version.conf                    |   2 +-
>  meta/conf/bitbake.conf                        |   5 +-
>  meta/conf/distro/include/maintainers.inc      |   6 +-
>  meta/lib/oe/reproducible.py                   |   8 +-
>  meta/lib/oe/sstatesig.py                      |   2 +-
>  meta/recipes-bsp/gnu-efi/gnu-efi_3.0.11.bb    |   1 +
>  meta/recipes-bsp/opensbi/opensbi_0.6.bb       |   1 +
>  meta/recipes-bsp/v86d/v86d_0.1.10.bb          |   1 +
>  .../bind/bind/CVE-2020-8625.patch             |  17 ++
>  .../recipes-connectivity/bind/bind_9.11.22.bb |   2 +
>  .../libnss-mdns/libnss-mdns_0.14.1.bb         |   1 +
>  .../mobile-broadband-provider-info_git.bb     |   1 +
>  .../{openssl_1.1.1i.bb =3D> openssl_1.1.1j.bb}  |   2 +-
>  .../ppp-dialin/ppp-dialin_0.1.bb              |   1 +
>  .../wpa-supplicant/CVE-2021-0326.patch        |  45 +++++
>  .../wpa-supplicant/wpa-supplicant_2.9.bb      |   2 +
>  .../base-passwd/base-passwd_3.5.29.bb         |   1 +
>  meta/recipes-core/dbus-wait/dbus-wait_git.bb  |   1 +
>  meta/recipes-core/dropbear/dropbear.inc       |   1 +
>  meta/recipes-core/ell/ell_0.33.bb             |   1 +
>  meta/recipes-core/fts/fts_1.2.7.bb            |   1 +
>  meta/recipes-core/ifupdown/ifupdown_0.8.35.bb |   1 +
>  meta/recipes-core/kbd/kbd_2.2.0.bb            |   1 +
>  meta/recipes-core/udev/eudev_3.2.9.bb         |   1 +
>  meta/recipes-devtools/apt/apt.inc             |   1 +
>  .../cdrtools/cdrtools-native_3.01.bb          |   1 +
>  .../recipes-devtools/dejagnu/dejagnu_1.6.2.bb |   1 +
>  .../desktop-file-utils_0.24.bb                |   3 +-
>  .../devel-config/distcc-config.bb             |   1 +
>  meta/recipes-devtools/distcc/distcc_3.3.3.bb  |   1 +
>  .../dmidecode/dmidecode_3.2.bb                |   1 +
>  meta/recipes-devtools/dnf/dnf_4.2.2.bb        |   1 +
>  meta/recipes-devtools/dpkg/dpkg.inc           |   2 +
>  .../dwarfsrcfiles/dwarfsrcfiles.bb            |   1 +
>  .../elfutils/elfutils_0.178.bb                |   1 +
>  meta/recipes-devtools/fdisk/gptfdisk_1.0.4.bb |   1 +
>  meta/recipes-devtools/gcc/gcc-common.inc      |   1 +
>  meta/recipes-devtools/gdb/gdb-common.inc      |   1 +
>  meta/recipes-devtools/git/git.inc             |   1 +
>  meta/recipes-devtools/glide/glide_0.13.3.bb   |   3 +-
>  .../gnu-config/gnu-config_git.bb              |   1 +
>  .../help2man/help2man-native_1.47.11.bb       |   3 +-
>  .../i2c-tools/i2c-tools_4.1.bb                |   1 +
>  .../nativesdk-icecc-toolchain_0.1.bb          |   1 +
>  .../intltool/intltool_0.51.0.bb               |   2 +
>  meta/recipes-devtools/jquery/jquery_3.5.0.bb  |   1 +
>  .../libcomps/libcomps_0.1.15.bb               |   2 +
>  meta/recipes-devtools/libdnf/libdnf_0.28.1.bb |   2 +
>  .../libmodulemd/libmodulemd-v1_git.bb         |   2 +
>  .../librepo/librepo/CVE-2020-14352.patch      |  55 +++++
>  .../librepo/librepo_1.11.2.bb                 |   3 +
>  .../makedevs/makedevs_1.0.1.bb                |   1 +
>  meta/recipes-devtools/mmc/mmc-utils_git.bb    |   1 +
>  meta/recipes-devtools/mtd/mtd-utils_git.bb    |   1 +
>  meta/recipes-devtools/nasm/nasm_2.15.03.bb    |   2 +
>  meta/recipes-devtools/ninja/ninja_1.10.0.bb   |   1 +
>  meta/recipes-devtools/opkg/opkg_0.4.2.bb      |   1 +
>  meta/recipes-devtools/orc/orc_0.4.31.bb       |   1 +
>  .../patchelf/patchelf_0.10.bb                 |   9 +-
>  meta/recipes-devtools/perl/perl_5.30.1.bb     |   1 +
>  meta/recipes-devtools/pseudo/pseudo.inc       |   1 +
>  .../python-numpy/python-numpy.inc             |   2 +
>  .../python/python3/CVE-2021-3177.patch        | 191 ++++++++++++++++++
>  meta/recipes-devtools/python/python3_3.8.2.bb |   2 +
>  meta/recipes-devtools/rsync/rsync_3.1.3.bb    |   1 +
>  .../run-postinsts/run-postinsts_1.0.bb        |   1 +
>  .../squashfs-tools/squashfs-tools_git.bb      |   2 +
>  meta/recipes-devtools/strace/strace_5.5.bb    |   1 +
>  .../subversion/subversion_1.13.0.bb           |   1 +
>  .../syslinux/syslinux_6.04-pre2.bb            |   1 +
>  .../systemd-bootchart_233.bb                  |   6 +
>  .../tcf-agent/tcf-agent_git.bb                |   1 +
>  meta/recipes-devtools/tcltk/tcl_8.6.10.bb     |   1 +
>  meta/recipes-devtools/unfs3/unfs3_git.bb      |   1 +
>  meta/recipes-devtools/unifdef/unifdef_2.12.bb |   1 +
>  meta/recipes-devtools/vala/vala.inc           |   2 +-
>  .../valgrind/valgrind_3.15.0.bb               |   1 +
>  meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   |   3 +-
>  .../asciidoc/asciidoc_8.6.9.bb                |   2 +-
>  meta/recipes-extended/cups/cups.inc           |   2 +
>  meta/recipes-extended/groff/groff_1.22.4.bb   |   1 -
>  .../screen/screen/CVE-2021-26937.patch        |  68 +++++++
>  meta/recipes-extended/screen/screen_4.8.0.bb  |   1 +
>  .../watchdog/watchdog_5.15.bb                 |   1 -
>  .../libsdl2/CVE-2020-14409-14410.patch        |  79 ++++++++
>  .../libsdl2/libsdl2_2.0.12.bb                 |   1 +
>  .../xorg-font/xorg-minimal-fonts.bb           |   2 -
>  ...20201218.bb =3D> linux-firmware_20210208.bb} |   4 +-
>  .../ca-certificates/sbindir.patch             |  10 +-
>  ...pdate-ca-certificates-support-Toybox.patch |  21 +-
>  .../libevdev/libevdev/determinism.patch       |   3 +-
>  .../libpcre/fix-pcre-name-collision.patch     |  41 ----
>  meta/recipes-support/libpcre/libpcre_8.44.bb  |   1 -
>  99 files changed, 613 insertions(+), 86 deletions(-)
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8625.pa=
tch
>  rename meta/recipes-connectivity/openssl/{openssl_1.1.1i.bb =3D> openss=
l_1.1.1j.bb} (98%)
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplic=
ant/CVE-2021-0326.patch
>  create mode 100644 meta/recipes-devtools/librepo/librepo/CVE-2020-14352=
.patch
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-3177.p=
atch
>  create mode 100644 meta/recipes-extended/screen/screen/CVE-2021-26937.p=
atch
>  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409=
-14410.patch
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20201218.bb =
=3D> linux-firmware_20210208.bb} (99%)
>  delete mode 100644 meta/recipes-support/libpcre/libpcre/fix-pcre-name-c=
ollision.patch
>=20
> --=20
> 2.25.1
>=20

>=20
>=20
>=20


--qizy72tce2bfogoz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYEiu0AAKCRA3VSO3ZXaA
HOyWAKCUjfgawXLXfHWzBrP0BoE+B33kBQCfURNg5xioZO/QhLqA0dBhorGjAe0=
=hAVP
-----END PGP SIGNATURE-----

--qizy72tce2bfogoz--
