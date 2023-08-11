Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A403C001B0
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 13:46:13 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web11.43031.1691761568543455986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 06:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=o+S7xse3;
 spf=pass (domain: gmail.com, ip: 209.85.221.176, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-487359fa94eso537745e0c.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 06:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691761567; x=1692366367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bHxXWNaS3deOCejFWakWwJfxugzozQmDW6skE4VYE1I=;
        b=o+S7xse3iy9nvKgIT2M4zijJwzrvVC7sviMvISGuy8PwdROE36PnzX1fYseGFULtum
         ufBhG3JK+8kyGn6bnu2377P/S8rAiUQJJkYPe3qp7PxuZ6HzoqcSjV6FUoCC0zVR1yXK
         ZzQh3SbRR98EJ7sT1YdOzh42TLsZpxAJ7QHtjbWATVHRp6Sm0Apv7y1ZVaLf8pfKZ5YD
         zhT7IciprlF0Hq2s8BGRWS3sN/PKe0OB/cftyvaseFI5+uUe7Zta6aU6HiRM65kNG/hk
         ABrdPuGe0zSb9myHJcln86tEKnJizaFTy6xqK0g4+ZN8dC8DwXWthy9xqaK2mucpZi3c
         J0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691761567; x=1692366367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bHxXWNaS3deOCejFWakWwJfxugzozQmDW6skE4VYE1I=;
        b=IStjFVH4tffM/tzbZ9E+ae8wXD1xglM+xoS1AI5RikbCg2Tvppd04mRzqs7p9waFxl
         A7PwZ+q0yE+q8jvP1c9vFwsr+qOHMvJLQrWm6A1rHiOl1XfanHuiC2nftacUzA7F1Zv7
         mZtW3BxpkS17CMAKDw0HaAAcPh6a8vQEMVk3CrYVJxGC2GN9ogS8/UvKIOVV8dz1Fp1x
         5KjU4uGDRqkZP9T+LeQL/Ve2UlZT6QhegPUPFpOaOOJoA56H/3R+iaCbj45DZmkqJBqo
         tf6VZ+dCkSphDybXmivcY5Sn2MESlfLGJ51N0gDUQzbK2/5Bd+UzOdlejAzMSZgCduX5
         tl6A==
X-Gm-Message-State: AOJu0Yxa8hiT/Yf7QO6Wkr3C9SnRiKlVmJfCIcJhe9FMWqkepmBXLEX4
	w2t2f93zqEC8U6ZJV42U8Mrw/eVde3ToypxJI5JyCekwdNA=
X-Google-Smtp-Source: AGHT+IFpVKA9B4GBRfgvFzxWqqprdN9Y3VKfaW+Q/i+o32qGUYHwLyTyzA3hxYwyPZ68PcN0RuH03zcrs953mxJ1QQ4=
X-Received: by 2002:a67:e918:0:b0:440:d726:c8f0 with SMTP id
 c24-20020a67e918000000b00440d726c8f0mr786398vso.17.1691761566820; Fri, 11 Aug
 2023 06:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230811133541.32176-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230811133541.32176-1-richard.purdie@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 11 Aug 2023 14:45:55 +0100
Message-ID: <CANPvuR=4dx_Ob_g9wgLHpi+sh029Ge=RGBVko=5eCf0znVkauA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes/classes/scripts: Drop SRCPV usage in OE-Core
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003c2d110602a5efb7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 13:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185843

--0000000000003c2d110602a5efb7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Something to warm the user about the usage of it on existing layers around
will be useful in my opinion.

Jose

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia sexta,
11/08/2023 =C3=A0(s) 14:35:

> Now that SRCPV isn't needed we can simplify things in a few places...
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../recipes-test/devtool/devtool-upgrade-test2_git.bb       | 2 +-
>  .../devtool/devtool-upgrade-test2_git.bb.upgraded           | 2 +-
>  .../recipes-test/gitunpackoffline/gitunpackoffline.bb       | 2 +-
>  meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb    | 2 +-
>  meta/classes-global/sstate.bbclass                          | 4 ----
>  meta/classes-recipe/devupstream.bbclass                     | 2 +-
>  meta/classes/externalsrc.bbclass                            | 2 --
>  meta/conf/bitbake.conf                                      | 2 +-
>  meta/conf/documentation.conf                                | 1 -
>  meta/lib/oe/recipeutils.py                                  | 4 +---
>  meta/lib/oeqa/selftest/cases/devtool.py                     | 6 +++---
>  meta/lib/oeqa/selftest/cases/recipetool.py                  | 2 +-
>  meta/lib/oeqa/selftest/cases/sstatetests.py                 | 1 -
>  meta/recipes-bsp/efivar/efivar_38.bb                        | 2 +-
>  meta/recipes-core/dbus-wait/dbus-wait_git.bb                | 2 +-
>  meta/recipes-core/musl/gcompat_git.bb                       | 2 +-
>  meta/recipes-core/musl/libc-test_git.bb                     | 2 +-
>  meta/recipes-core/musl/musl-locales_git.bb                  | 2 +-
>  meta/recipes-core/musl/musl_git.bb                          | 2 +-
>  meta/recipes-core/newlib/newlib.inc                         | 2 +-
>  meta/recipes-core/psplash/psplash_git.bb                    | 2 +-
>  meta/recipes-devtools/gnu-config/gnu-config_git.bb          | 2 +-
>  meta/recipes-devtools/mmc/mmc-utils_git.bb                  | 2 +-
>  meta/recipes-devtools/pkgconfig/pkgconfig_git.bb            | 2 +-
>  meta/recipes-devtools/pseudo/pseudo_git.bb                  | 2 +-
>  meta/recipes-devtools/python/python3-dtc_1.6.1.bb           | 2 +-
>  meta/recipes-devtools/tcf-agent/tcf-agent_git.bb            | 2 +-
>  meta/recipes-devtools/xmlto/xmlto_0.0.28.bb                 | 2 +-
>  .../baremetal-example/baremetal-helloworld_git.bb           | 2 +-
>  meta/recipes-graphics/libfakekey/libfakekey_git.bb          | 2 +-
>  meta/recipes-graphics/piglit/piglit_git.bb                  | 2 +-
>  .../xcursor-transparent-theme_git.bb                        | 2 +-
>  .../xinput-calibrator/xinput-calibrator_git.bb              | 2 +-
>  meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb   | 2 +-
>  meta/recipes-kernel/blktrace/blktrace_git.bb                | 2 +-
>  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb     | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-dev.bb                | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb             | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb             | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb           | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb           | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_6.1.bb                | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_6.4.bb                | 2 +-
>  meta/recipes-multimedia/x264/x264_git.bb                    | 2 +-
>  meta/recipes-sato/l3afpad/l3afpad_git.bb                    | 2 +-
>  .../matchbox-config-gtk/matchbox-config-gtk_0.2.bb          | 2 +-
>  .../recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb | 2 +-
>  meta/recipes-sato/puzzles/puzzles_git.bb                    | 2 +-
>  meta/recipes-support/bmap-tools/bmap-tools_git.bb           | 2 +-
>  meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb     | 2 +-
>  scripts/lib/recipetool/create.py                            | 2 +-
>  scripts/lib/scriptutils.py                                  | 2 +-
>  52 files changed, 50 insertions(+), 60 deletions(-)
>
> diff --git a/meta-selftest/recipes-test/devtool/
> devtool-upgrade-test2_git.bb b/meta-selftest/recipes-test/devtool/
> devtool-upgrade-test2_git.bb
> index 203f4b61c2e..2558a22ce57 100644
> --- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
> +++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
> @@ -8,7 +8,7 @@ DEPENDS =3D "dbus"
>
>  # Note: this is intentionally not the latest version in the original .bb
>  SRCREV =3D "1a3e1343761b30750bed70e0fd688f6d3c7b3717"
> -PV =3D "0.1+git${SRCPV}"
> +PV =3D "0.1+git"
>  PR =3D "r2"
>
>  SRC_URI =3D "git://git.yoctoproject.org/dbus-wait;branch=3Dmaster"
> diff --git
> a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgrade=
d
> b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgrade=
d
> index 3d45fc48572..eaa8bd898da 100644
> ---
> a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgrade=
d
> +++
> b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgrade=
d
> @@ -8,7 +8,7 @@ DEPENDS =3D "dbus"
>
>  # Note: this is intentionally not the latest version in the original .bb
>  SRCREV =3D "6cc6077a36fe2648a5f993fe7c16c9632f946517"
> -PV =3D "0.1+git${SRCPV}"
> +PV =3D "0.1+git"
>
>  SRC_URI =3D "git://git.yoctoproject.org/dbus-wait;branch=3Dmaster"
>  UPSTREAM_CHECK_COMMITS =3D "1"
> diff --git a/meta-selftest/recipes-test/gitunpackoffline/
> gitunpackoffline.bb b/meta-selftest/recipes-test/gitunpackoffline/
> gitunpackoffline.bb
> index 597c89b1993..a687bcc2a7c 100644
> --- a/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.bb
> +++ b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.bb
> @@ -2,4 +2,4 @@ require gitunpackoffline-fail.bb
>
>  TAGVALUE =3D "2.11"
>
> -PV =3D "0.0+git${SRCPV}"
> +PV =3D "0.0+git"
> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> index 6062f8422c0..9437240fcff 100644
> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> @@ -64,7 +64,7 @@ LINUX_VERSION_EXTENSION:append =3D "-custom"
>  # tag: v4.2 64291f7db5bd8150a74ad2036f1037e6a0428df2
>  SRCREV_machine=3D"64291f7db5bd8150a74ad2036f1037e6a0428df2"
>
> -PV =3D "${LINUX_VERSION}+git${SRCPV}"
> +PV =3D "${LINUX_VERSION}+git"
>
>  # Override COMPATIBLE_MACHINE to include your machine in a copy of this
> recipe
>  # file. Leaving it empty here ensures an early explicit build failure.
> diff --git a/meta/classes-global/sstate.bbclass
> b/meta/classes-global/sstate.bbclass
> index 95373fd60a5..c50198449c2 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -769,7 +769,6 @@ def pstaging_fetch(sstatefetch, d):
>      localdata.setVar('FILESPATH', dldir)
>      localdata.setVar('DL_DIR', dldir)
>      localdata.setVar('PREMIRRORS', mirrors)
> -    localdata.setVar('SRCPV', d.getVar('SRCPV'))
>
>      # if BB_NO_NETWORK is set but we also have
> SSTATE_MIRROR_ALLOW_NETWORK,
>      # we'll want to allow network access for the current set of fetches.
> @@ -795,9 +794,6 @@ def pstaging_fetch(sstatefetch, d):
>          except bb.fetch2.BBFetchException:
>              pass
>
> -pstaging_fetch[vardepsexclude] +=3D "SRCPV"
> -
> -
>  def sstate_setscene(d):
>      shared_state =3D sstate_state_fromvars(d)
>      accelerate =3D sstate_installpkg(shared_state, d)
> diff --git a/meta/classes-recipe/devupstream.bbclass
> b/meta/classes-recipe/devupstream.bbclass
> index 1529cc8fca4..d941763fb75 100644
> --- a/meta/classes-recipe/devupstream.bbclass
> +++ b/meta/classes-recipe/devupstream.bbclass
> @@ -46,7 +46,7 @@ python devupstream_virtclass_handler () {
>      pv =3D d.getVar("PV")
>      proto_marker =3D "+" + uri.scheme
>      if proto_marker not in pv and not d.getVar("PV:class-devupstream"):
> -        d.setVar("PV", pv + proto_marker + "${SRCPV}")
> +        d.setVar("PV", pv + proto_marker)
>
>      if variant =3D=3D "native":
>          pn =3D d.getVar("PN")
> diff --git a/meta/classes/externalsrc.bbclass
> b/meta/classes/externalsrc.bbclass
> index aedd78a03aa..e90002a4e74 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -73,8 +73,6 @@ python () {
>
>          d.setVar('SRC_URI', ' '.join(local_srcuri))
>
> -        # Dummy value because the default function can't be called with
> blank SRC_URI
> -        d.setVar('SRCPV', '999')
>          # sstate is never going to work for external source trees,
> disable it
>          d.setVar('SSTATE_SKIP_CREATION', '1')
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index c7ada2c49e9..cf7ff3328c4 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -961,7 +961,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?=3D "doc deps depends \
>      sstate-lockfile-shared prefuncs postfuncs export_func deptask
> rdeptask \
>      recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename
> lineno \
>      progress mcdepends number_threads"
> -BB_HASH_CODEPARSER_VALS =3D "LOGFIFO=3D/ T=3D/ WORKDIR=3D/ DATE=3D1234 T=
IME=3D1234
> PV=3D0.0-1 PN=3Dno-pn METADATA_REVISION=3D1234 SRC_URI=3D SRCPV=3D1234"
> +BB_HASH_CODEPARSER_VALS =3D "LOGFIFO=3D/ T=3D/ WORKDIR=3D/ DATE=3D1234 T=
IME=3D1234
> PV=3D0.0-1 PN=3Dno-pn METADATA_REVISION=3D1234 SRC_URI=3D"
>
>  MLPREFIX ??=3D ""
>  MULTILIB_VARIANTS ??=3D ""
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 66b8e2f24fd..9a88b1fb20d 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -393,7 +393,6 @@ SPECIAL_PKGSUFFIX[doc] =3D "A list of prefixes for PN
> used by the OpenEmbedded bui
>  SRC_URI[doc] =3D "The list of source files - local or remote. This varia=
ble
> tells the OpenEmbedded build system what bits to pull in for the build an=
d
> how to pull them in."
>  SRC_URI_OVERRIDES_PACKAGE_ARCH[doc] =3D "By default, the OpenEmbedded bu=
ild
> system automatically detects whether SRC_URI contains files that are
> machine-specific. If so, the build system automatically changes
> PACKAGE_ARCH. Setting this variable to '0' disables this behavior."
>  SRCDATE[doc] =3D "The date of the source code used to build the package.
> This variable applies only if the source was fetched from a Source Code
> Manager (SCM)."
> -SRCPV[doc] =3D "Returns the version string of the current package. This
> string is used to help define the value of PV."
>  SRCREV[doc] =3D "The revision of the source code used to build the packa=
ge.
> This variable applies to Subversion, Git, Mercurial and Bazaar only."
>  SSTATE_DIR[doc] =3D "The directory for the shared state cache."
>  SSTATE_MIRRORS[doc] =3D "Configures the OpenEmbedded build system to sea=
rch
> other mirror locations for prebuilt cache data objects before building ou=
t
> the data. You can specify a filesystem directory or a remote URL such as
> HTTP or FTP."
> diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
> index 5a902c23f6d..6996e426ec0 100644
> --- a/meta/lib/oe/recipeutils.py
> +++ b/meta/lib/oe/recipeutils.py
> @@ -24,7 +24,7 @@ from collections import OrderedDict, defaultdict
>  from bb.utils import vercmp_string
>
>  # Help us to find places to insert values
> -recipe_progression =3D ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKE=
R',
> 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES',
> 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRCPV', 'SRC_URI', 'S', 'do_fetch()',
> 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE',
> 'EXTRA_OESCONS', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()',
> 'do_install()', 'do_populate_sysroot()', 'INITSCRIPT', 'USERADD',
> 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS',
> 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY',
> 'populate_packages()', 'do_package()', 'do_deploy()', 'BBCLASSEXTEND']
> +recipe_progression =3D ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKE=
R',
> 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES',
> 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRC_URI', 'S', 'do_fetch()',
> 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE',
> 'EXTRA_OESCONS', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()',
> 'do_install()', 'do_populate_sysroot()', 'INITSCRIPT', 'USERADD',
> 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS',
> 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY',
> 'populate_packages()', 'do_package()', 'do_deploy()', 'BBCLASSEXTEND']
>  # Variables that sometimes are a bit long but shouldn't be wrapped
>  nowrap_vars =3D ['SUMMARY', 'HOMEPAGE', 'BUGTRACKER',
> r'SRC_URI\[(.+\.)?md5sum\]', r'SRC_URI\[(.+\.)?sha256sum\]']
>  list_vars =3D ['SRC_URI', 'LIC_FILES_CHKSUM']
> @@ -421,8 +421,6 @@ def copy_recipe_files(d, tgt_dir, whole_dir=3DFalse,
> download=3DTrue, all_variants=3DF
>              # Ensure we handle class-target if we're dealing with one of
> the variants
>              variants.append('target')
>              for variant in variants:
> -                if variant.startswith("devupstream"):
> -                    localdata.setVar('SRCPV', 'git')
>                  localdata.setVar('CLASSOVERRIDE', 'class-%s' % variant)
>                  fetch_urls(localdata)
>
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py
> b/meta/lib/oeqa/selftest/cases/devtool.py
> index 14a80d5ff4c..a2b77e528de 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -433,7 +433,7 @@ class DevtoolAddTests(DevtoolBase):
>          checkvars['LICENSE'] =3D 'GPL-2.0-only'
>          checkvars['LIC_FILES_CHKSUM'] =3D
> 'file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263'
>          checkvars['S'] =3D '${WORKDIR}/git'
> -        checkvars['PV'] =3D '0.1+git${SRCPV}'
> +        checkvars['PV'] =3D '0.1+git'
>          checkvars['SRC_URI'] =3D 'git://
> git.yoctoproject.org/git/dbus-wait;protocol=3Dhttps;branch=3Dmaster'
>          checkvars['SRCREV'] =3D srcrev
>          checkvars['DEPENDS'] =3D set(['dbus'])
> @@ -572,7 +572,7 @@ class DevtoolAddTests(DevtoolBase):
>          self.assertIn('_git.bb', recipefile, 'Recipe file incorrectly
> named')
>          checkvars =3D {}
>          checkvars['S'] =3D '${WORKDIR}/git'
> -        checkvars['PV'] =3D '1.0+git${SRCPV}'
> +        checkvars['PV'] =3D '1.0+git'
>          checkvars['SRC_URI'] =3D url_branch
>          checkvars['SRCREV'] =3D '${AUTOREV}'
>          self._test_recipe_contents(recipefile, checkvars, [])
> @@ -591,7 +591,7 @@ class DevtoolAddTests(DevtoolBase):
>          self.assertIn('_git.bb', recipefile, 'Recipe file incorrectly
> named')
>          checkvars =3D {}
>          checkvars['S'] =3D '${WORKDIR}/git'
> -        checkvars['PV'] =3D '1.5+git${SRCPV}'
> +        checkvars['PV'] =3D '1.5+git'
>          checkvars['SRC_URI'] =3D url_branch
>          checkvars['SRCREV'] =3D checkrev
>          self._test_recipe_contents(recipefile, checkvars, [])
> diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py
> b/meta/lib/oeqa/selftest/cases/recipetool.py
> index a5c0f7164a3..48661bee6f2 100644
> --- a/meta/lib/oeqa/selftest/cases/recipetool.py
> +++ b/meta/lib/oeqa/selftest/cases/recipetool.py
> @@ -368,7 +368,7 @@ class RecipetoolCreateTests(RecipetoolBase):
>          checkvars['LICENSE'] =3D 'LGPL-2.1-only'
>          checkvars['LIC_FILES_CHKSUM'] =3D
> 'file://COPYING;md5=3D7fbc338309ac38fefcd64b04bb903e34'
>          checkvars['S'] =3D '${WORKDIR}/git'
> -        checkvars['PV'] =3D '1.11+git${SRCPV}'
> +        checkvars['PV'] =3D '1.11+git'
>          checkvars['SRC_URI'] =3D srcuri + ';branch=3Dmaster'
>          checkvars['DEPENDS'] =3D set(['libcheck', 'libjpeg-turbo',
> 'libpng', 'libx11', 'libxext', 'pango'])
>          inherits =3D ['autotools', 'pkgconfig']
> diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py
> b/meta/lib/oeqa/selftest/cases/sstatetests.py
> index 3fa3038218c..bdad9088d37 100644
> --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> @@ -188,7 +188,6 @@ class SStateBase(OESelftestTestCase):
>  class SStateTests(SStateBase):
>      def test_autorev_sstate_works(self):
>          # Test that a git repository which changes is correctly handled
> by SRCREV =3D ${AUTOREV}
> -        # when PV does not contain SRCPV
>
>          tempdir =3D tempfile.mkdtemp(prefix=3D'sstate_autorev')
>          tempdldir =3D tempfile.mkdtemp(prefix=3D'sstate_autorev_dldir')
> diff --git a/meta/recipes-bsp/efivar/efivar_38.bb
> b/meta/recipes-bsp/efivar/efivar_38.bb
> index 411e951a5a0..d88eb3fef53 100644
> --- a/meta/recipes-bsp/efivar/efivar_38.bb
> +++ b/meta/recipes-bsp/efivar/efivar_38.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "git://
> github.com/rhinstaller/efivar.git;branch=3Dmain;protocol=3Dhttps \
>             file://0001-docs-do-not-build-efisecdb-manpage.patch \
>             "
>  SRCREV =3D "90e88b221e8bc60dc50f3246051369b8f580c0d0"
> -PV .=3D "+39+git${SRCPV}"
> +PV .=3D "+39+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
> b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
> index bc846de2169..09ba515a61e 100644
> --- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
> +++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>  DEPENDS =3D "dbus"
>
>  SRCREV =3D "6cc6077a36fe2648a5f993fe7c16c9632f946517"
> -PV =3D "0.1+git${SRCPV}"
> +PV =3D "0.1+git"
>  PR =3D "r2"
>
>  SRC_URI =3D "git://git.yoctoproject.org/${BPN};branch=3Dmaster;protocol=
=3Dhttps
> <http://git.yoctoproject.org/$%7BBPN%7D;branch=3Dmaster;protocol=3Dhttps>=
"
> diff --git a/meta/recipes-core/musl/gcompat_git.bb
> b/meta/recipes-core/musl/gcompat_git.bb
> index 11f3c58769e..ba802e3caaa 100644
> --- a/meta/recipes-core/musl/gcompat_git.bb
> +++ b/meta/recipes-core/musl/gcompat_git.bb
> @@ -13,7 +13,7 @@ SRC_URI =3D "git://
> git.adelielinux.org/adelie/gcompat.git;protocol=3Dhttps;branch=3Dcu
>  SRC_URI:append:powerpc =3D "\
>             file://0001-make-Static-PIE-does-not-work-on-musl-ppc.patch \
>             "
> -PV =3D "1.0.0+1.1+git${SRCPV}"
> +PV =3D "1.0.0+1.1+git"
>  SRCREV =3D "c6921a1aa454bb87671f9bd1ecfe47d80d1620aa"
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-core/musl/libc-test_git.bb
> b/meta/recipes-core/musl/libc-test_git.bb
> index 6d64592f0c6..d18c967e138 100644
> --- a/meta/recipes-core/musl/libc-test_git.bb
> +++ b/meta/recipes-core/musl/libc-test_git.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D " \
>      file://run-ptest \
>  "
>
> -PV =3D "0+git${SRCPV}"
> +PV =3D "0+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta/recipes-core/musl/musl-locales_git.bb
> b/meta/recipes-core/musl/musl-locales_git.bb
> index 6ffac4faded..1373c60daf4 100644
> --- a/meta/recipes-core/musl/musl-locales_git.bb
> +++ b/meta/recipes-core/musl/musl-locales_git.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dcf5713fba707073020b1db2acaa73e78 \
>
>  SRC_URI =3D "git://
> git.adelielinux.org/adelie/musl-locales;protocol=3Dhttps;branch=3Dmain"
>
> -PV =3D "1.0+git${SRCPV}"
> +PV =3D "1.0+git"
>  SRCREV =3D "5663f5bfd30bf9e1e0ba3fc5fe2da6725969f30e"
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/
> musl_git.bb
> index 297c5581a37..4a4fe978f93 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -8,7 +8,7 @@ SRCREV =3D "83b858f83b658bd34eca5d8ad4d145f673ae7e5e"
>
>  BASEVER =3D "1.2.4"
>
> -PV =3D "${BASEVER}+git${SRCPV}"
> +PV =3D "${BASEVER}+git"
>
>  # mirror is at git://github.com/kraj/musl.git
>
> diff --git a/meta/recipes-core/newlib/newlib.inc
> b/meta/recipes-core/newlib/newlib.inc
> index 5351a9f9912..da753f11ada 100644
> --- a/meta/recipes-core/newlib/newlib.inc
> +++ b/meta/recipes-core/newlib/newlib.inc
> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D " \
>                 "
>
>  BASEVER =3D "4.3.0"
> -PV =3D "${BASEVER}+git${SRCPV}"
> +PV =3D "${BASEVER}+git"
>  SRC_URI =3D "git://
> sourceware.org/git/newlib-cygwin.git;protocol=3Dhttps;branch=3Dmain"
>  SRCREV=3D"9e09d6ed83cce4777a5950412647ccc603040409"
>
> diff --git a/meta/recipes-core/psplash/psplash_git.bb
> b/meta/recipes-core/psplash/psplash_git.bb
> index 78960e1e4cc..17704a02f69 100644
> --- a/meta/recipes-core/psplash/psplash_git.bb
> +++ b/meta/recipes-core/psplash/psplash_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://psplash.h;beginline=3D1;endline=3D8;md5=3D8f232c1e95929eaca
>  DEPENDS =3D "gdk-pixbuf-native"
>
>  SRCREV =3D "44afb7506d43cca15582b4c5b90ba5580344d75d"
> -PV =3D "0.1+git${SRCPV}"
> +PV =3D "0.1+git"
>
>  SRC_URI =3D "git://git.yoctoproject.org/${BPN};branch=3Dmaster;protocol=
=3Dhttps
> <http://git.yoctoproject.org/$%7BBPN%7D;branch=3Dmaster;protocol=3Dhttps>=
 \
>             file://psplash-init \
> diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> index 080704753d1..2a0e6f8e41f 100644
> --- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> +++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> @@ -10,7 +10,7 @@ DEPENDS:class-native =3D "hostperl-runtime-native"
>  INHIBIT_DEFAULT_DEPS =3D "1"
>
>  SRCREV =3D "63acb96f92473ceb5e21d873d7c0aee266b3d6d3"
> -PV =3D "20230216+git${SRCPV}"
> +PV =3D "20230216+git"
>
>  SRC_URI =3D "git://
> git.savannah.gnu.org/git/config.git;protocol=3Dhttps;branch=3Dmaster \
>             file://gnu-configize.in"
> diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb
> b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> index 373ada2026a..879c179dd73 100644
> --- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
> +++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://mmc.c;beginline=3D1;endline=3D20;md5=3Dfae32792e20f4d27ade1
>  SRCBRANCH ?=3D "master"
>  SRCREV =3D "958227890690290ee766aaad1b92f3413f67048c"
>
> -PV =3D "0.1+git${SRCPV}"
> +PV =3D "0.1+git"
>
>  SRC_URI =3D "git://
> git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=3D${SRCB=
RANCH};protocol=3Dhttps
> <http://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=
=3D$%7BSRCBRANCH%7D;protocol=3Dhttps>
> "
>  UPSTREAM_CHECK_COMMITS =3D "1"
> diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> index 68f624c80a3..16e6c5b6099 100644
> --- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> +++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> @@ -9,7 +9,7 @@ LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>
>  SRCREV =3D "d97db4fae4c1cd099b506970b285dc2afd818ea2"
> -PV =3D "0.29.2+git${SRCPV}"
> +PV =3D "0.29.2+git"
>
>  SRC_URI =3D "git://
> gitlab.freedesktop.org/pkg-config/pkg-config.git;branch=3Dmaster;protocol=
=3Dhttps
> \
>             file://pkg-config-esdk.in \
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb
> b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index c3c4bb0ed92..4ba752f1745 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -15,7 +15,7 @@ SRC_URI[prebuilt.sha256sum] =3D
> "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c
>
>  SRCREV =3D "ec6151a2b057109b3f798f151a36690af582e166"
>  S =3D "${WORKDIR}/git"
> -PV =3D "1.9.0+git${SRCPV}"
> +PV =3D "1.9.0+git"
>
>  # largefile and 64bit time_t support adds these macros via compiler flag=
s
> globally
>  # remove them for pseudo since pseudo intercepts some of the functions
> which will be
> diff --git a/meta/recipes-devtools/python/python3-dtc_1.6.1.bb
> b/meta/recipes-devtools/python/python3-dtc_1.6.1.bb
> index a868bd0109d..95ab0be4747 100644
> --- a/meta/recipes-devtools/python/python3-dtc_1.6.1.bb
> +++ b/meta/recipes-devtools/python/python3-dtc_1.6.1.bb
> @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM =3D
> "file://pylibfdt/libfdt.i;beginline=3D1;endline=3D6;md5=3Dafda088c9
>
>  SRCREV =3D "c001fc01a43e7a06447c06ea3d50bd60641322b8"
>
> -PV =3D "1.6.1+git${SRCPV}"
> +PV =3D "1.6.1+git"
>  S =3D "${WORKDIR}/git"
>
>  PYPA_WHEEL =3D "${S}/dist/libfdt-1.6.2*.whl"
> diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> index 7d151d4642a..4d2ca5f1b0b 100644
> --- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> +++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> @@ -7,7 +7,7 @@ LICENSE =3D "EPL-1.0 | EDL-1.0"
>  LIC_FILES_CHKSUM =3D
> "file://edl-v10.html;md5=3D522a390a83dc186513f0500543ad3679"
>
>  SRCREV =3D "1f11747e83ebf4f53e8d17f430136f92ec378709"
> -PV =3D "1.8.0+git${SRCPV}"
> +PV =3D "1.8.0+git"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
>  SRC_URI =3D "git://
> git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=3Dhttps;branch=
=3Dmaster
> \
> diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> index 5e3fac7a60c..d5a0e69849e 100644
> --- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> +++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> @@ -11,7 +11,7 @@ UPSTREAM_CHECK_COMMITS =3D "1"
>  SRC_URI =3D "git://pagure.io/xmlto.git;protocol=3Dhttps;branch=3Dmaster"
>  S =3D "${WORKDIR}/git"
>
> -PV .=3D "+0.0.29+git${SRCPV}"
> +PV .=3D "+0.0.29+git"
>
>  inherit autotools
>
> diff --git a/meta/recipes-extended/baremetal-example/
> baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-example/
> baremetal-helloworld_git.bb
> index c5d3e04ed55..fde75ec2fd9 100644
> --- a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
> +++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D39346640a23c701e4f459e05f56f4=
449"
>
>  SRCREV =3D "fc7c43d138185028b6ac14c83f6492fce26eca95"
> -PV =3D "0.1+git${SRCPV}"
> +PV =3D "0.1+git"
>
>  SRC_URI =3D "git://
> github.com/ahcbb6/baremetal-helloqemu.git;protocol=3Dhttps;branch=3Dmaste=
r"
>  UPSTREAM_VERSION_UNKNOWN=3D"1"
> diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
> b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
> index c9c828a8c42..5f902d3a67e 100644
> --- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
> +++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
> @@ -11,7 +11,7 @@ DEPENDS =3D "libxtst"
>  SECTION =3D "x11/wm"
>
>  SRCREV =3D "7ad885912efb2131e80914e964d5e635b0d07b40"
> -PV =3D "0.3+git${SRCPV}"
> +PV =3D "0.3+git"
>
>  SRC_URI =3D "git://git.yoctoproject.org/${BPN};branch=3Dmaster;protocol=
=3Dhttps
> <http://git.yoctoproject.org/$%7BBPN%7D;branch=3Dmaster;protocol=3Dhttps>=
"
>
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb
> b/meta/recipes-graphics/piglit/piglit_git.bb
> index cd97ee53547..62cada75906 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -16,7 +16,7 @@ UPSTREAM_CHECK_COMMITS =3D "1"
>
>  SRCREV =3D "5036601c43fff63f7be5cd8ad7b319a5c1f6652c"
>  # (when PV goes above 1.0 remove the trailing r)
> -PV =3D "1.0+gitr${SRCPV}"
> +PV =3D "1.0+gitr"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta/recipes-graphics/xcursor-transparent-theme/
> xcursor-transparent-theme_git.bb
> b/meta/recipes-graphics/xcursor-transparent-theme/
> xcursor-transparent-theme_git.bb
> index b65a3bea562..40b77422bf6 100644
> --- a/meta/recipes-graphics/xcursor-transparent-theme/
> xcursor-transparent-theme_git.bb
> +++ b/meta/recipes-graphics/xcursor-transparent-theme/
> xcursor-transparent-theme_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
>  SECTION =3D "x11/base"
>
>  SRCREV =3D "23c8af5ba4a1b7efbaf0bbca59a65ff7e10a1a06"
> -PV =3D "0.1.1+git${SRCPV}"
> +PV =3D "0.1.1+git"
>
>  SRC_URI =3D "git://git.yoctoproject.org/${BPN};branch=3Dmaster;protocol=
=3Dhttps
> <http://git.yoctoproject.org/$%7BBPN%7D;branch=3Dmaster;protocol=3Dhttps>=
"
>  UPSTREAM_CHECK_COMMITS =3D "1"
> diff --git a/meta/recipes-graphics/xinput-calibrator/
> xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/
> xinput-calibrator_git.bb
> index 3f49df6258b..05f07c190e9 100644
> --- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> +++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://src/calibrator.cpp;endline=3D22;md5=3D1bcba08f67cdb56f34021557898=
e4b5a"
>  DEPENDS =3D "virtual/libx11 libxi libxrandr"
>
> -PV =3D "0.7.5+git${SRCPV}"
> +PV =3D "0.7.5+git"
>  PR =3D "r6"
>
>  inherit autotools pkgconfig features_check
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
> b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
> index 21b499e6666..2e526bd7999 100644
> --- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
> @@ -10,7 +10,7 @@ Infrastructure (DRI)."
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8730ad58d11c7bbad9a7066d69f78=
08e"
>
>  SRCREV =3D "31486f40f8e8f8923ca0799aea84b58799754564"
> -PV =3D "2.99.917+git${SRCPV}"
> +PV =3D "2.99.917+git"
>  S =3D "${WORKDIR}/git"
>
>  SRC_URI =3D "git://
> anongit.freedesktop.org/git/xorg/driver/xf86-video-intel;protocol=3Dhttps=
;branch=3Dmaster
> "
> diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb
> b/meta/recipes-kernel/blktrace/blktrace_git.bb
> index d0eeba32088..d4f5bac84f1 100644
> --- a/meta/recipes-kernel/blktrace/blktrace_git.bb
> +++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
> @@ -12,7 +12,7 @@ DEPENDS =3D "libaio"
>
>  SRCREV =3D "366d30b9cdb20345c5d064af850d686da79b89eb"
>
> -PV =3D "1.3.0+git${SRCPV}"
> +PV =3D "1.3.0+git"
>
>  SRC_URI =3D "git://git.kernel.dk/blktrace.git;branch=3Dmaster;protocol=
=3Dhttps"
>
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index 388d8feebce..5127c70f446 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "\
>  DEPENDS =3D "git-native"
>
>  SRCREV =3D "2d01f24bc78256c709728eb3f204491bce13e0e5"
> -PV =3D "0.3+git${SRCPV}"
> +PV =3D "0.3+git"
>
>  inherit native
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index e695e2d83ea..1d404bd7c6b 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -30,7 +30,7 @@ SRCREV_meta ?=3D
> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "li
>
>  LINUX_VERSION ?=3D "6.5"
>  LINUX_VERSION_EXTENSION ?=3D "-yoctodev-${LINUX_KERNEL_TYPE}"
> -PV =3D "${LINUX_VERSION}+git${SRCPV}"
> +PV =3D "${LINUX_VERSION}+git"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
> index 0645458d11c..2e35748cae8 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
> @@ -27,7 +27,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e46"
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',
> d)}"
>  DEPENDS +=3D "openssl-native util-linux-native"
>
> -PV =3D "${LINUX_VERSION}+git${SRCPV}"
> +PV =3D "${LINUX_VERSION}+git"
>
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "1"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
> index 2f051844d8c..30aab9a23cd 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
> @@ -27,7 +27,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e46"
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',
> d)}"
>  DEPENDS +=3D "openssl-native util-linux-native"
>
> -PV =3D "${LINUX_VERSION}+git${SRCPV}"
> +PV =3D "${LINUX_VERSION}+git"
>
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "1"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
> index dfc1e5e5d6d..5f84454fd64 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
> @@ -20,7 +20,7 @@ KCONF_BSP_AUDIT_LEVEL =3D "2"
>  SRCREV_machine ?=3D "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
>  SRCREV_meta ?=3D "9f8ee63473567964331b9465fa1aba301a9a725b"
>
> -PV =3D "${LINUX_VERSION}+git${SRCPV}"
> +PV =3D "${LINUX_VERSION}+git"
>
>  SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=3Dmachine;p=
rotocol=3Dhttps
> <http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;name=
=3Dmachine;protocol=3Dhttps>
> \
>             git://
> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-6.1;destsuffix=3D${KMETA};protocol=3Dhttps
> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;=
branch=3Dyocto-6.1;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps>
> "
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
> index 64dfb3a3791..863c9ae7cef 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
> @@ -20,7 +20,7 @@ KCONF_BSP_AUDIT_LEVEL =3D "2"
>  SRCREV_machine ?=3D "72bad8cd7540f07ab54e08b83ad106dec0df123c"
>  SRCREV_meta ?=3D "88ed9ec49099d69f9546d21137191fd747d06ec4"
>
> -PV =3D "${LINUX_VERSION}+git${SRCPV}"
> +PV =3D "${LINUX_VERSION}+git"
>
>  SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=3Dmachine;p=
rotocol=3Dhttps
> <http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;name=
=3Dmachine;protocol=3Dhttps>
> \
>             git://
> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-6.4;destsuffix=3D${KMETA};protocol=3Dhttps
> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;=
branch=3Dyocto-6.4;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps>
> "
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
> b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
> index 2f804d379d6..d50838f4939 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
> @@ -47,7 +47,7 @@ SRC_URI +=3D
> "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>  LINUX_VERSION ?=3D "6.1.43"
>
> -PV =3D "${LINUX_VERSION}+git${SRCPV}"
> +PV =3D "${LINUX_VERSION}+git"
>
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "1"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
> b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
> index d0d96c4d108..0c0cb851b64 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
> @@ -46,7 +46,7 @@ SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D${KBRA
> <http://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D$%7B=
KBRA>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>  LINUX_VERSION ?=3D "6.4.9"
>
> -PV =3D "${LINUX_VERSION}+git${SRCPV}"
> +PV =3D "${LINUX_VERSION}+git"
>
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "1"
> diff --git a/meta/recipes-multimedia/x264/x264_git.bb
> b/meta/recipes-multimedia/x264/x264_git.bb
> index 2ac2b6f1a67..e7d9e75e8de 100644
> --- a/meta/recipes-multimedia/x264/x264_git.bb
> +++ b/meta/recipes-multimedia/x264/x264_git.bb
> @@ -16,7 +16,7 @@ UPSTREAM_CHECK_COMMITS =3D "1"
>
>  SRCREV =3D "baee400fa9ced6f5481a728138fed6e867b0ff7f"
>
> -PV =3D "r3039+git${SRCPV}"
> +PV =3D "r3039+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta/recipes-sato/l3afpad/l3afpad_git.bb
> b/meta/recipes-sato/l3afpad/l3afpad_git.bb
> index 56cbe6bc8d3..55400839284 100644
> --- a/meta/recipes-sato/l3afpad/l3afpad_git.bb
> +++ b/meta/recipes-sato/l3afpad/l3afpad_git.bb
> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D4fbd65380cdd255951079008b364516c \
>
>  DEPENDS =3D "gtk+3 intltool-native gettext-native"
>
> -PV =3D "0.8.18.1.11+git${SRCPV}"
> +PV =3D "0.8.18.1.11+git"
>  SRC_URI =3D "git://
> github.com/stevenhoneyman/l3afpad.git;branch=3Dmaster;protocol=3Dhttps"
>  SRCREV =3D"3cdccdc9505643e50f8208171d9eee5de11a42ff"
>
> diff --git a/meta/recipes-sato/matchbox-config-gtk/
> matchbox-config-gtk_0.2.bb b/meta/recipes-sato/matchbox-config-gtk/
> matchbox-config-gtk_0.2.bb
> index 490bd582b25..caa34966ccc 100644
> --- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
> +++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
> @@ -13,7 +13,7 @@ SRCREV =3D "7182e603357250952aa24d90f6d89345f93da7ce"
>  SRC_URI =3D "git://git.yoctoproject.org/${BPN};branch=3Dmaster;protocol=
=3Dhttps
> <http://git.yoctoproject.org/$%7BBPN%7D;branch=3Dmaster;protocol=3Dhttps>=
 \
>             file://no-handed.patch"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
> -PV =3D "0.2+git${SRCPV}"
> +PV =3D "0.2+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
> b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
> index a1f236b40ff..f91c593f784 100644
> --- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
> +++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
> @@ -12,7 +12,7 @@ SECTION =3D "x11/utils"
>  SRCREV =3D "99e6eb7db1b5fef110973d96194eec992a2515a2"
>  SRC_URI =3D "git://git.yoctoproject.org/${BPN};branch=3Dmaster;protocol=
=3Dhttps
> <http://git.yoctoproject.org/$%7BBPN%7D;branch=3Dmaster;protocol=3Dhttps>=
"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
> -PV =3D "0.2+git${SRCPV}"
> +PV =3D "0.2+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb
> b/meta/recipes-sato/puzzles/puzzles_git.bb
> index 960b5d3b110..04338a603b5 100644
> --- a/meta/recipes-sato/puzzles/puzzles_git.bb
> +++ b/meta/recipes-sato/puzzles/puzzles_git.bb
> @@ -12,7 +12,7 @@ SRC_URI =3D "git://
> git.tartarus.org/simon/puzzles.git;branch=3Dmain;protocol=3Dhttps"
>  UPSTREAM_CHECK_COMMITS =3D "1"
>  SRCREV =3D "b6c842a28cf6597df063fcff35079c3e3982381e"
>  PE =3D "2"
> -PV =3D "0.0+git${SRCPV}"
> +PV =3D "0.0+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta/recipes-support/bmap-tools/bmap-tools_git.bb
> b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
> index 89b7bf2b93c..1de95c8e524 100644
> --- a/meta/recipes-support/bmap-tools/bmap-tools_git.bb
> +++ b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
> @@ -14,7 +14,7 @@ SRC_URI =3D "git://
> github.com/intel/${BPN};branch=3Dmain;protocol=3Dhttps
> <http://github.com/intel/$%7BBPN%7D;branch=3Dmain;protocol=3Dhttps>"
>  SRCREV =3D "c0673962a8ec1624b5189dc1d24f33fe4f06785a"
>  S =3D "${WORKDIR}/git"
>  BASEVER =3D "3.6"
> -PV =3D "${BASEVER}+git${SRCPV}"
> +PV =3D "${BASEVER}+git"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> index 60918a38927..ff336b38208 100644
> --- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> @@ -8,7 +8,7 @@ LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882=
bbe"
>
>  SRCREV =3D "4148e75284e443fc8ffaef425c467aa5523528ff"
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>
>  SRC_URI =3D "git://
> git.yoctoproject.org/ptest-runner2;branch=3Dmaster;protocol=3Dhttps \
>  "
> diff --git a/scripts/lib/recipetool/create.py
> b/scripts/lib/recipetool/create.py
> index e99e0714bf4..f9dda3c2f96 100644
> --- a/scripts/lib/recipetool/create.py
> +++ b/scripts/lib/recipetool/create.py
> @@ -690,7 +690,7 @@ def create_recipe(args):
>              srcpvprefix =3D 'svnr'
>          else:
>              srcpvprefix =3D scheme
> -        lines_before.append('PV =3D "%s+%s${SRCPV}"' % (realpv or '1.0',
> srcpvprefix))
> +        lines_before.append('PV =3D "%s+%s"' % (realpv or '1.0',
> srcpvprefix))
>          pv_srcpv =3D True
>          if not args.autorev and srcrev =3D=3D '${AUTOREV}':
>              if os.path.exists(os.path.join(srctree, '.git')):
> diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
> index f433106c9a8..f23e53cba93 100644
> --- a/scripts/lib/scriptutils.py
> +++ b/scripts/lib/scriptutils.py
> @@ -177,7 +177,7 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir,
> logger, preserve_tmp=3DFalse, mirr
>                  f.write('BB_STRICT_CHECKSUM =3D "ignore"\n')
>                  f.write('SRC_URI =3D "%s"\n' % srcuri)
>                  f.write('SRCREV =3D "%s"\n' % srcrev)
> -                f.write('PV =3D "0.0+${SRCPV}"\n')
> +                f.write('PV =3D "0.0+"\n')
>                  f.write('WORKDIR =3D "%s"\n' % tmpworkdir)
>                  # Set S out of the way so it doesn't get created under
> the workdir
>                  f.write('S =3D "%s"\n' % os.path.join(tmpdir, 'emptysrc'=
))
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185842):
> https://lists.openembedded.org/g/openembedded-core/message/185842
> Mute This Topic: https://lists.openembedded.org/mt/100683548/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000003c2d110602a5efb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Richard,</div><br>Something to warm the user about=
 the usage of it on existing layers around will be useful=C2=A0in my opinio=
n.<div><br></div><div>Jose</div><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:richard=
.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; esc=
reveu no dia sexta, 11/08/2023 =C3=A0(s) 14:35:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Now that SRCPV isn&#39;t needed we can sim=
plify things in a few places...<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0.../recipes-test/devtool/<a href=3D"http://devtool-upgrade-test2_git.=
bb" rel=3D"noreferrer" target=3D"_blank">devtool-upgrade-test2_git.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../devtool/devtool-upgrade-test2_git.bb.upgraded=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../recipes-test/gitunpackoffline/<a href=3D"http://gitunpackoffline.=
bb" rel=3D"noreferrer" target=3D"_blank">gitunpackoffline.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-skeleton/recipes-kernel/linux/<a href=3D"http://linux-yocto-cust=
om.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-custom.bb</a>=C2=A0=
 =C2=A0 | 2 +-<br>
=C2=A0meta/classes-global/sstate.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ----<br>
=C2=A0meta/classes-recipe/devupstream.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/classes/externalsrc.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 --<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 =
-<br>
=C2=A0meta/lib/oe/recipeutils.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 4 +---<br>
=C2=A0meta/lib/oeqa/selftest/cases/devtool.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
=C2=A0meta/lib/oeqa/selftest/cases/recipetool.py=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/lib/oeqa/selftest/cases/sstatetests.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta/recipes-bsp/efivar/<a href=3D"http://efivar_38.bb" rel=3D"norefe=
rrer" target=3D"_blank">efivar_38.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-core/dbus-wait/<a href=3D"http://dbus-wait_git.bb" rel=
=3D"noreferrer" target=3D"_blank">dbus-wait_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-core/musl/<a href=3D"http://gcompat_git.bb" rel=3D"noref=
errer" target=3D"_blank">gcompat_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-core/musl/<a href=3D"http://libc-test_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">libc-test_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-core/musl/<a href=3D"http://musl-locales_git.bb" rel=3D"=
noreferrer" target=3D"_blank">musl-locales_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"noreferr=
er" target=3D"_blank">musl_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-core/newlib/newlib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-core/psplash/<a href=3D"http://psplash_git.bb" rel=3D"no=
referrer" target=3D"_blank">psplash_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-devtools/gnu-config/<a href=3D"http://gnu-config_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">gnu-config_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-devtools/mmc/<a href=3D"http://mmc-utils_git.bb" rel=3D"=
noreferrer" target=3D"_blank">mmc-utils_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-devtools/pkgconfig/<a href=3D"http://pkgconfig_git.bb" r=
el=3D"noreferrer" target=3D"_blank">pkgconfig_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pseudo_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-dtc_1.6.1.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-dtc_1.6.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-devtools/tcf-agent/<a href=3D"http://tcf-agent_git.bb" r=
el=3D"noreferrer" target=3D"_blank">tcf-agent_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-devtools/xmlto/<a href=3D"http://xmlto_0.0.28.bb" rel=3D=
"noreferrer" target=3D"_blank">xmlto_0.0.28.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../baremetal-example/<a href=3D"http://baremetal-helloworld_git.bb" =
rel=3D"noreferrer" target=3D"_blank">baremetal-helloworld_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-graphics/libfakekey/<a href=3D"http://libfakekey_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">libfakekey_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" rel=3D"=
noreferrer" target=3D"_blank">piglit_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0.../<a href=3D"http://xcursor-transparent-theme_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">xcursor-transparent-theme_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +=
-<br>
=C2=A0.../xinput-calibrator/<a href=3D"http://xinput-calibrator_git.bb" rel=
=3D"noreferrer" target=3D"_blank">xinput-calibrator_git.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-graphics/xorg-driver/<a href=3D"http://xf86-video-intel_=
git.bb" rel=3D"noreferrer" target=3D"_blank">xf86-video-intel_git.bb</a>=C2=
=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-kernel/blktrace/<a href=3D"http://blktrace_git.bb" rel=
=3D"noreferrer" target=3D"_blank">blktrace_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a>=C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.1.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.4.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.4.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.1.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.4.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.4.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.1.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.1.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.4.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-multimedia/x264/<a href=3D"http://x264_git.bb" rel=3D"no=
referrer" target=3D"_blank">x264_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-sato/l3afpad/<a href=3D"http://l3afpad_git.bb" rel=3D"no=
referrer" target=3D"_blank">l3afpad_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0.../matchbox-config-gtk/<a href=3D"http://matchbox-config-gtk_0.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">matchbox-config-gtk_0.2.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0.../recipes-sato/matchbox-terminal/<a href=3D"http://matchbox-termina=
l_0.2.bb" rel=3D"noreferrer" target=3D"_blank">matchbox-terminal_0.2.bb</a>=
 | 2 +-<br>
=C2=A0meta/recipes-sato/puzzles/<a href=3D"http://puzzles_git.bb" rel=3D"no=
referrer" target=3D"_blank">puzzles_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_git.bb" =
rel=3D"noreferrer" target=3D"_blank">bmap-tools_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-support/ptest-runner/<a href=3D"http://ptest-runner_2.4.=
2.bb" rel=3D"noreferrer" target=3D"_blank">ptest-runner_2.4.2.bb</a>=C2=A0 =
=C2=A0 =C2=A0| 2 +-<br>
=C2=A0scripts/lib/recipetool/create.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0scripts/lib/scriptutils.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>
=C2=A052 files changed, 50 insertions(+), 60 deletions(-)<br>
<br>
diff --git a/meta-selftest/recipes-test/devtool/<a href=3D"http://devtool-u=
pgrade-test2_git.bb" rel=3D"noreferrer" target=3D"_blank">devtool-upgrade-t=
est2_git.bb</a> b/meta-selftest/recipes-test/devtool/<a href=3D"http://devt=
ool-upgrade-test2_git.bb" rel=3D"noreferrer" target=3D"_blank">devtool-upgr=
ade-test2_git.bb</a><br>
index 203f4b61c2e..2558a22ce57 100644<br>
--- a/meta-selftest/recipes-test/devtool/<a href=3D"http://devtool-upgrade-=
test2_git.bb" rel=3D"noreferrer" target=3D"_blank">devtool-upgrade-test2_gi=
t.bb</a><br>
+++ b/meta-selftest/recipes-test/devtool/<a href=3D"http://devtool-upgrade-=
test2_git.bb" rel=3D"noreferrer" target=3D"_blank">devtool-upgrade-test2_gi=
t.bb</a><br>
@@ -8,7 +8,7 @@ DEPENDS =3D &quot;dbus&quot;<br>
<br>
=C2=A0# Note: this is intentionally not the latest version in the original =
.bb<br>
=C2=A0SRCREV =3D &quot;1a3e1343761b30750bed70e0fd688f6d3c7b3717&quot;<br>
-PV =3D &quot;0.1+git${SRCPV}&quot;<br>
+PV =3D &quot;0.1+git&quot;<br>
=C2=A0PR =3D &quot;r2&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/dbus-w=
ait;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.=
org/dbus-wait;branch=3Dmaster</a>&quot;<br>
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.b=
b.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.b=
b.upgraded<br>
index 3d45fc48572..eaa8bd898da 100644<br>
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgra=
ded<br>
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgra=
ded<br>
@@ -8,7 +8,7 @@ DEPENDS =3D &quot;dbus&quot;<br>
<br>
=C2=A0# Note: this is intentionally not the latest version in the original =
.bb<br>
=C2=A0SRCREV =3D &quot;6cc6077a36fe2648a5f993fe7c16c9632f946517&quot;<br>
-PV =3D &quot;0.1+git${SRCPV}&quot;<br>
+PV =3D &quot;0.1+git&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/dbus-w=
ait;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.=
org/dbus-wait;branch=3Dmaster</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
diff --git a/meta-selftest/recipes-test/gitunpackoffline/<a href=3D"http://=
gitunpackoffline.bb" rel=3D"noreferrer" target=3D"_blank">gitunpackoffline.=
bb</a> b/meta-selftest/recipes-test/gitunpackoffline/<a href=3D"http://gitu=
npackoffline.bb" rel=3D"noreferrer" target=3D"_blank">gitunpackoffline.bb</=
a><br>
index 597c89b1993..a687bcc2a7c 100644<br>
--- a/meta-selftest/recipes-test/gitunpackoffline/<a href=3D"http://gitunpa=
ckoffline.bb" rel=3D"noreferrer" target=3D"_blank">gitunpackoffline.bb</a><=
br>
+++ b/meta-selftest/recipes-test/gitunpackoffline/<a href=3D"http://gitunpa=
ckoffline.bb" rel=3D"noreferrer" target=3D"_blank">gitunpackoffline.bb</a><=
br>
@@ -2,4 +2,4 @@ require <a href=3D"http://gitunpackoffline-fail.bb" rel=3D"=
noreferrer" target=3D"_blank">gitunpackoffline-fail.bb</a><br>
<br>
=C2=A0TAGVALUE =3D &quot;2.11&quot;<br>
<br>
-PV =3D &quot;0.0+git${SRCPV}&quot;<br>
+PV =3D &quot;0.0+git&quot;<br>
diff --git a/meta-skeleton/recipes-kernel/linux/<a href=3D"http://linux-yoc=
to-custom.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-custom.bb</a=
> b/meta-skeleton/recipes-kernel/linux/<a href=3D"http://linux-yocto-custom=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-custom.bb</a><br>
index 6062f8422c0..9437240fcff 100644<br>
--- a/meta-skeleton/recipes-kernel/linux/<a href=3D"http://linux-yocto-cust=
om.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-custom.bb</a><br>
+++ b/meta-skeleton/recipes-kernel/linux/<a href=3D"http://linux-yocto-cust=
om.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-custom.bb</a><br>
@@ -64,7 +64,7 @@ LINUX_VERSION_EXTENSION:append =3D &quot;-custom&quot;<br=
>
=C2=A0# tag: v4.2 64291f7db5bd8150a74ad2036f1037e6a0428df2<br>
=C2=A0SRCREV_machine=3D&quot;64291f7db5bd8150a74ad2036f1037e6a0428df2&quot;=
<br>
<br>
-PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
+PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
<br>
=C2=A0# Override COMPATIBLE_MACHINE to include your machine in a copy of th=
is recipe<br>
=C2=A0# file. Leaving it empty here ensures an early explicit build failure=
.<br>
diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass<br>
index 95373fd60a5..c50198449c2 100644<br>
--- a/meta/classes-global/sstate.bbclass<br>
+++ b/meta/classes-global/sstate.bbclass<br>
@@ -769,7 +769,6 @@ def pstaging_fetch(sstatefetch, d):<br>
=C2=A0 =C2=A0 =C2=A0localdata.setVar(&#39;FILESPATH&#39;, dldir)<br>
=C2=A0 =C2=A0 =C2=A0localdata.setVar(&#39;DL_DIR&#39;, dldir)<br>
=C2=A0 =C2=A0 =C2=A0localdata.setVar(&#39;PREMIRRORS&#39;, mirrors)<br>
-=C2=A0 =C2=A0 localdata.setVar(&#39;SRCPV&#39;, d.getVar(&#39;SRCPV&#39;))=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0# if BB_NO_NETWORK is set but we also have SSTATE_MIRRO=
R_ALLOW_NETWORK,<br>
=C2=A0 =C2=A0 =C2=A0# we&#39;ll want to allow network access for the curren=
t set of fetches.<br>
@@ -795,9 +794,6 @@ def pstaging_fetch(sstatefetch, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except bb.fetch2.BBFetchException:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
<br>
-pstaging_fetch[vardepsexclude] +=3D &quot;SRCPV&quot;<br>
-<br>
-<br>
=C2=A0def sstate_setscene(d):<br>
=C2=A0 =C2=A0 =C2=A0shared_state =3D sstate_state_fromvars(d)<br>
=C2=A0 =C2=A0 =C2=A0accelerate =3D sstate_installpkg(shared_state, d)<br>
diff --git a/meta/classes-recipe/devupstream.bbclass b/meta/classes-recipe/=
devupstream.bbclass<br>
index 1529cc8fca4..d941763fb75 100644<br>
--- a/meta/classes-recipe/devupstream.bbclass<br>
+++ b/meta/classes-recipe/devupstream.bbclass<br>
@@ -46,7 +46,7 @@ python devupstream_virtclass_handler () {<br>
=C2=A0 =C2=A0 =C2=A0pv =3D d.getVar(&quot;PV&quot;)<br>
=C2=A0 =C2=A0 =C2=A0proto_marker =3D &quot;+&quot; + uri.scheme<br>
=C2=A0 =C2=A0 =C2=A0if proto_marker not in pv and not d.getVar(&quot;PV:cla=
ss-devupstream&quot;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;PV&quot;, pv + proto_marker + &=
quot;${SRCPV}&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;PV&quot;, pv + proto_marker)<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0if variant =3D=3D &quot;native&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pn =3D d.getVar(&quot;PN&quot;)<br>
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bb=
class<br>
index aedd78a03aa..e90002a4e74 100644<br>
--- a/meta/classes/externalsrc.bbclass<br>
+++ b/meta/classes/externalsrc.bbclass<br>
@@ -73,8 +73,6 @@ python () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;SRC_URI&#39;, &#39; &#39;.j=
oin(local_srcuri))<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Dummy value because the default function can=
&#39;t be called with blank SRC_URI<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;SRCPV&#39;, &#39;999&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# sstate is never going to work for exter=
nal source trees, disable it<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;SSTATE_SKIP_CREATION&#39;, =
&#39;1&#39;)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index c7ada2c49e9..cf7ff3328c4 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -961,7 +961,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?=3D &quot;doc deps depends =
\<br>
=C2=A0 =C2=A0 =C2=A0sstate-lockfile-shared prefuncs postfuncs export_func d=
eptask rdeptask \<br>
=C2=A0 =C2=A0 =C2=A0recrdeptask nodeprrecs stamp-extra-info sstate-outputdi=
rs filename lineno \<br>
=C2=A0 =C2=A0 =C2=A0progress mcdepends number_threads&quot;<br>
-BB_HASH_CODEPARSER_VALS =3D &quot;LOGFIFO=3D/ T=3D/ WORKDIR=3D/ DATE=3D123=
4 TIME=3D1234 PV=3D0.0-1 PN=3Dno-pn METADATA_REVISION=3D1234 SRC_URI=3D SRC=
PV=3D1234&quot;<br>
+BB_HASH_CODEPARSER_VALS =3D &quot;LOGFIFO=3D/ T=3D/ WORKDIR=3D/ DATE=3D123=
4 TIME=3D1234 PV=3D0.0-1 PN=3Dno-pn METADATA_REVISION=3D1234 SRC_URI=3D&quo=
t;<br>
<br>
=C2=A0MLPREFIX ??=3D &quot;&quot;<br>
=C2=A0MULTILIB_VARIANTS ??=3D &quot;&quot;<br>
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf<br=
>
index 66b8e2f24fd..9a88b1fb20d 100644<br>
--- a/meta/conf/documentation.conf<br>
+++ b/meta/conf/documentation.conf<br>
@@ -393,7 +393,6 @@ SPECIAL_PKGSUFFIX[doc] =3D &quot;A list of prefixes for=
 PN used by the OpenEmbedded bui<br>
=C2=A0SRC_URI[doc] =3D &quot;The list of source files - local or remote. Th=
is variable tells the OpenEmbedded build system what bits to pull in for th=
e build and how to pull them in.&quot;<br>
=C2=A0SRC_URI_OVERRIDES_PACKAGE_ARCH[doc] =3D &quot;By default, the OpenEmb=
edded build system automatically detects whether SRC_URI contains files tha=
t are machine-specific. If so, the build system automatically changes PACKA=
GE_ARCH. Setting this variable to &#39;0&#39; disables this behavior.&quot;=
<br>
=C2=A0SRCDATE[doc] =3D &quot;The date of the source code used to build the =
package. This variable applies only if the source was fetched from a Source=
 Code Manager (SCM).&quot;<br>
-SRCPV[doc] =3D &quot;Returns the version string of the current package. Th=
is string is used to help define the value of PV.&quot;<br>
=C2=A0SRCREV[doc] =3D &quot;The revision of the source code used to build t=
he package. This variable applies to Subversion, Git, Mercurial and Bazaar =
only.&quot;<br>
=C2=A0SSTATE_DIR[doc] =3D &quot;The directory for the shared state cache.&q=
uot;<br>
=C2=A0SSTATE_MIRRORS[doc] =3D &quot;Configures the OpenEmbedded build syste=
m to search other mirror locations for prebuilt cache data objects before b=
uilding out the data. You can specify a filesystem directory or a remote UR=
L such as HTTP or FTP.&quot;<br>
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py<br>
index 5a902c23f6d..6996e426ec0 100644<br>
--- a/meta/lib/oe/recipeutils.py<br>
+++ b/meta/lib/oe/recipeutils.py<br>
@@ -24,7 +24,7 @@ from collections import OrderedDict, defaultdict<br>
=C2=A0from bb.utils import vercmp_string<br>
<br>
=C2=A0# Help us to find places to insert values<br>
-recipe_progression =3D [&#39;SUMMARY&#39;, &#39;DESCRIPTION&#39;, &#39;HOM=
EPAGE&#39;, &#39;BUGTRACKER&#39;, &#39;SECTION&#39;, &#39;LICENSE&#39;, &#3=
9;LICENSE_FLAGS&#39;, &#39;LIC_FILES_CHKSUM&#39;, &#39;PROVIDES&#39;, &#39;=
DEPENDS&#39;, &#39;PR&#39;, &#39;PV&#39;, &#39;SRCREV&#39;, &#39;SRCPV&#39;=
, &#39;SRC_URI&#39;, &#39;S&#39;, &#39;do_fetch()&#39;, &#39;do_unpack()&#3=
9;, &#39;do_patch()&#39;, &#39;EXTRA_OECONF&#39;, &#39;EXTRA_OECMAKE&#39;, =
&#39;EXTRA_OESCONS&#39;, &#39;do_configure()&#39;, &#39;EXTRA_OEMAKE&#39;, =
&#39;do_compile()&#39;, &#39;do_install()&#39;, &#39;do_populate_sysroot()&=
#39;, &#39;INITSCRIPT&#39;, &#39;USERADD&#39;, &#39;GROUPADD&#39;, &#39;PAC=
KAGES&#39;, &#39;FILES&#39;, &#39;RDEPENDS&#39;, &#39;RRECOMMENDS&#39;, &#3=
9;RSUGGESTS&#39;, &#39;RPROVIDES&#39;, &#39;RREPLACES&#39;, &#39;RCONFLICTS=
&#39;, &#39;ALLOW_EMPTY&#39;, &#39;populate_packages()&#39;, &#39;do_packag=
e()&#39;, &#39;do_deploy()&#39;, &#39;BBCLASSEXTEND&#39;]<br>
+recipe_progression =3D [&#39;SUMMARY&#39;, &#39;DESCRIPTION&#39;, &#39;HOM=
EPAGE&#39;, &#39;BUGTRACKER&#39;, &#39;SECTION&#39;, &#39;LICENSE&#39;, &#3=
9;LICENSE_FLAGS&#39;, &#39;LIC_FILES_CHKSUM&#39;, &#39;PROVIDES&#39;, &#39;=
DEPENDS&#39;, &#39;PR&#39;, &#39;PV&#39;, &#39;SRCREV&#39;, &#39;SRC_URI&#3=
9;, &#39;S&#39;, &#39;do_fetch()&#39;, &#39;do_unpack()&#39;, &#39;do_patch=
()&#39;, &#39;EXTRA_OECONF&#39;, &#39;EXTRA_OECMAKE&#39;, &#39;EXTRA_OESCON=
S&#39;, &#39;do_configure()&#39;, &#39;EXTRA_OEMAKE&#39;, &#39;do_compile()=
&#39;, &#39;do_install()&#39;, &#39;do_populate_sysroot()&#39;, &#39;INITSC=
RIPT&#39;, &#39;USERADD&#39;, &#39;GROUPADD&#39;, &#39;PACKAGES&#39;, &#39;=
FILES&#39;, &#39;RDEPENDS&#39;, &#39;RRECOMMENDS&#39;, &#39;RSUGGESTS&#39;,=
 &#39;RPROVIDES&#39;, &#39;RREPLACES&#39;, &#39;RCONFLICTS&#39;, &#39;ALLOW=
_EMPTY&#39;, &#39;populate_packages()&#39;, &#39;do_package()&#39;, &#39;do=
_deploy()&#39;, &#39;BBCLASSEXTEND&#39;]<br>
=C2=A0# Variables that sometimes are a bit long but shouldn&#39;t be wrappe=
d<br>
=C2=A0nowrap_vars =3D [&#39;SUMMARY&#39;, &#39;HOMEPAGE&#39;, &#39;BUGTRACK=
ER&#39;, r&#39;SRC_URI\[(.+\.)?md5sum\]&#39;, r&#39;SRC_URI\[(.+\.)?sha256s=
um\]&#39;]<br>
=C2=A0list_vars =3D [&#39;SRC_URI&#39;, &#39;LIC_FILES_CHKSUM&#39;]<br>
@@ -421,8 +421,6 @@ def copy_recipe_files(d, tgt_dir, whole_dir=3DFalse, do=
wnload=3DTrue, all_variants=3DF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Ensure we handle class-ta=
rget if we&#39;re dealing with one of the variants<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0variants.append(&#39;target=
&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for variant in variants:<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if variant.startsw=
ith(&quot;devupstream&quot;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 loca=
ldata.setVar(&#39;SRCPV&#39;, &#39;git&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0localdata.set=
Var(&#39;CLASSOVERRIDE&#39;, &#39;class-%s&#39; % variant)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fetch_urls(lo=
caldata)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py<br>
index 14a80d5ff4c..a2b77e528de 100644<br>
--- a/meta/lib/oeqa/selftest/cases/devtool.py<br>
+++ b/meta/lib/oeqa/selftest/cases/devtool.py<br>
@@ -433,7 +433,7 @@ class DevtoolAddTests(DevtoolBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;LICENSE&#39;] =3D &#39;GPL=
-2.0-only&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;LIC_FILES_CHKSUM&#39;] =3D=
 &#39;file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;S&#39;] =3D &#39;${WORKDIR=
}/git&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 checkvars[&#39;PV&#39;] =3D &#39;0.1+git${SRCP=
V}&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 checkvars[&#39;PV&#39;] =3D &#39;0.1+git&#39;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;SRC_URI&#39;] =3D &#39;git=
://<a href=3D"http://git.yoctoproject.org/git/dbus-wait;protocol=3Dhttps;br=
anch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/gi=
t/dbus-wait;protocol=3Dhttps;branch=3Dmaster</a>&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;SRCREV&#39;] =3D srcrev<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;DEPENDS&#39;] =3D set([&#3=
9;dbus&#39;])<br>
@@ -572,7 +572,7 @@ class DevtoolAddTests(DevtoolBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertIn(&#39;_<a href=3D"http://git=
.bb" rel=3D"noreferrer" target=3D"_blank">git.bb</a>&#39;, recipefile, &#39=
;Recipe file incorrectly named&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars =3D {}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;S&#39;] =3D &#39;${WORKDIR=
}/git&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 checkvars[&#39;PV&#39;] =3D &#39;1.0+git${SRCP=
V}&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 checkvars[&#39;PV&#39;] =3D &#39;1.0+git&#39;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;SRC_URI&#39;] =3D url_bran=
ch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;SRCREV&#39;] =3D &#39;${AU=
TOREV}&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._test_recipe_contents(recipefile, ch=
eckvars, [])<br>
@@ -591,7 +591,7 @@ class DevtoolAddTests(DevtoolBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertIn(&#39;_<a href=3D"http://git=
.bb" rel=3D"noreferrer" target=3D"_blank">git.bb</a>&#39;, recipefile, &#39=
;Recipe file incorrectly named&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars =3D {}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;S&#39;] =3D &#39;${WORKDIR=
}/git&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 checkvars[&#39;PV&#39;] =3D &#39;1.5+git${SRCP=
V}&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 checkvars[&#39;PV&#39;] =3D &#39;1.5+git&#39;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;SRC_URI&#39;] =3D url_bran=
ch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;SRCREV&#39;] =3D checkrev<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._test_recipe_contents(recipefile, ch=
eckvars, [])<br>
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/sel=
ftest/cases/recipetool.py<br>
index a5c0f7164a3..48661bee6f2 100644<br>
--- a/meta/lib/oeqa/selftest/cases/recipetool.py<br>
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py<br>
@@ -368,7 +368,7 @@ class RecipetoolCreateTests(RecipetoolBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;LICENSE&#39;] =3D &#39;LGP=
L-2.1-only&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;LIC_FILES_CHKSUM&#39;] =3D=
 &#39;file://COPYING;md5=3D7fbc338309ac38fefcd64b04bb903e34&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;S&#39;] =3D &#39;${WORKDIR=
}/git&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 checkvars[&#39;PV&#39;] =3D &#39;1.11+git${SRC=
PV}&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 checkvars[&#39;PV&#39;] =3D &#39;1.11+git&#39;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;SRC_URI&#39;] =3D srcuri +=
 &#39;;branch=3Dmaster&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkvars[&#39;DEPENDS&#39;] =3D set([&#3=
9;libcheck&#39;, &#39;libjpeg-turbo&#39;, &#39;libpng&#39;, &#39;libx11&#39=
;, &#39;libxext&#39;, &#39;pango&#39;])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inherits =3D [&#39;autotools&#39;, &#39;p=
kgconfig&#39;]<br>
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/se=
lftest/cases/sstatetests.py<br>
index 3fa3038218c..bdad9088d37 100644<br>
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py<br>
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py<br>
@@ -188,7 +188,6 @@ class SStateBase(OESelftestTestCase):<br>
=C2=A0class SStateTests(SStateBase):<br>
=C2=A0 =C2=A0 =C2=A0def test_autorev_sstate_works(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Test that a git repository which change=
s is correctly handled by SRCREV =3D ${AUTOREV}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # when PV does not contain SRCPV<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tempdir =3D tempfile.mkdtemp(prefix=3D&#3=
9;sstate_autorev&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tempdldir =3D tempfile.mkdtemp(prefix=3D&=
#39;sstate_autorev_dldir&#39;)<br>
diff --git a/meta/recipes-bsp/efivar/<a href=3D"http://efivar_38.bb" rel=3D=
"noreferrer" target=3D"_blank">efivar_38.bb</a> b/meta/recipes-bsp/efivar/<=
a href=3D"http://efivar_38.bb" rel=3D"noreferrer" target=3D"_blank">efivar_=
38.bb</a><br>
index 411e951a5a0..d88eb3fef53 100644<br>
--- a/meta/recipes-bsp/efivar/<a href=3D"http://efivar_38.bb" rel=3D"norefe=
rrer" target=3D"_blank">efivar_38.bb</a><br>
+++ b/meta/recipes-bsp/efivar/<a href=3D"http://efivar_38.bb" rel=3D"norefe=
rrer" target=3D"_blank">efivar_38.bb</a><br>
@@ -11,7 +11,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/rhin=
staller/efivar.git;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/rhinstaller/efivar.git;branch=3Dmain;protocol=3Dhtt=
ps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-docs-do-not-build-efi=
secdb-manpage.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRCREV =3D &quot;90e88b221e8bc60dc50f3246051369b8f580c0d0&quot;<br>
-PV .=3D &quot;+39+git${SRCPV}&quot;<br>
+PV .=3D &quot;+39+git&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
diff --git a/meta/recipes-core/dbus-wait/<a href=3D"http://dbus-wait_git.bb=
" rel=3D"noreferrer" target=3D"_blank">dbus-wait_git.bb</a> b/meta/recipes-=
core/dbus-wait/<a href=3D"http://dbus-wait_git.bb" rel=3D"noreferrer" targe=
t=3D"_blank">dbus-wait_git.bb</a><br>
index bc846de2169..09ba515a61e 100644<br>
--- a/meta/recipes-core/dbus-wait/<a href=3D"http://dbus-wait_git.bb" rel=
=3D"noreferrer" target=3D"_blank">dbus-wait_git.bb</a><br>
+++ b/meta/recipes-core/dbus-wait/<a href=3D"http://dbus-wait_git.bb" rel=
=3D"noreferrer" target=3D"_blank">dbus-wait_git.bb</a><br>
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f=
5fce4486a80fdaf4a4263&quot;<br>
=C2=A0DEPENDS =3D &quot;dbus&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;6cc6077a36fe2648a5f993fe7c16c9632f946517&quot;<br>
-PV =3D &quot;0.1+git${SRCPV}&quot;<br>
+PV =3D &quot;0.1+git&quot;<br>
=C2=A0PR =3D &quot;r2&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/$%7BBP=
N%7D;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>git.yoctoproject.org/${BPN};branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
diff --git a/meta/recipes-core/musl/<a href=3D"http://gcompat_git.bb" rel=
=3D"noreferrer" target=3D"_blank">gcompat_git.bb</a> b/meta/recipes-core/mu=
sl/<a href=3D"http://gcompat_git.bb" rel=3D"noreferrer" target=3D"_blank">g=
compat_git.bb</a><br>
index 11f3c58769e..ba802e3caaa 100644<br>
--- a/meta/recipes-core/musl/<a href=3D"http://gcompat_git.bb" rel=3D"noref=
errer" target=3D"_blank">gcompat_git.bb</a><br>
+++ b/meta/recipes-core/musl/<a href=3D"http://gcompat_git.bb" rel=3D"noref=
errer" target=3D"_blank">gcompat_git.bb</a><br>
@@ -13,7 +13,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.adelielinux=
.org/adelie/gcompat.git;protocol=3Dhttps;branch=3Dcu" rel=3D"noreferrer" ta=
rget=3D"_blank">git.adelielinux.org/adelie/gcompat.git;protocol=3Dhttps;bra=
nch=3Dcu</a><br>
=C2=A0SRC_URI:append:powerpc =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-make-Static-PIE-does-=
not-work-on-musl-ppc.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-PV =3D &quot;1.0.0+1.1+git${SRCPV}&quot;<br>
+PV =3D &quot;1.0.0+1.1+git&quot;<br>
=C2=A0SRCREV =3D &quot;c6921a1aa454bb87671f9bd1ecfe47d80d1620aa&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
diff --git a/meta/recipes-core/musl/<a href=3D"http://libc-test_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libc-test_git.bb</a> b/meta/recipes-core/=
musl/<a href=3D"http://libc-test_git.bb" rel=3D"noreferrer" target=3D"_blan=
k">libc-test_git.bb</a><br>
index 6d64592f0c6..d18c967e138 100644<br>
--- a/meta/recipes-core/musl/<a href=3D"http://libc-test_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">libc-test_git.bb</a><br>
+++ b/meta/recipes-core/musl/<a href=3D"http://libc-test_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">libc-test_git.bb</a><br>
@@ -15,7 +15,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0&quot;<br>
<br>
-PV =3D &quot;0+git${SRCPV}&quot;<br>
+PV =3D &quot;0+git&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
diff --git a/meta/recipes-core/musl/<a href=3D"http://musl-locales_git.bb" =
rel=3D"noreferrer" target=3D"_blank">musl-locales_git.bb</a> b/meta/recipes=
-core/musl/<a href=3D"http://musl-locales_git.bb" rel=3D"noreferrer" target=
=3D"_blank">musl-locales_git.bb</a><br>
index 6ffac4faded..1373c60daf4 100644<br>
--- a/meta/recipes-core/musl/<a href=3D"http://musl-locales_git.bb" rel=3D"=
noreferrer" target=3D"_blank">musl-locales_git.bb</a><br>
+++ b/meta/recipes-core/musl/<a href=3D"http://musl-locales_git.bb" rel=3D"=
noreferrer" target=3D"_blank">musl-locales_git.bb</a><br>
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dcf5713fba70=
7073020b1db2acaa73e78 \<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.adelielinux.org/adelie/=
musl-locales;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=3D"_=
blank">git.adelielinux.org/adelie/musl-locales;protocol=3Dhttps;branch=3Dma=
in</a>&quot;<br>
<br>
-PV =3D &quot;1.0+git${SRCPV}&quot;<br>
+PV =3D &quot;1.0+git&quot;<br>
=C2=A0SRCREV =3D &quot;5663f5bfd30bf9e1e0ba3fc5fe2da6725969f30e&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
diff --git a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">musl_git.bb</a> b/meta/recipes-core/musl/<a hr=
ef=3D"http://musl_git.bb" rel=3D"noreferrer" target=3D"_blank">musl_git.bb<=
/a><br>
index 297c5581a37..4a4fe978f93 100644<br>
--- a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"noreferr=
er" target=3D"_blank">musl_git.bb</a><br>
+++ b/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"noreferr=
er" target=3D"_blank">musl_git.bb</a><br>
@@ -8,7 +8,7 @@ SRCREV =3D &quot;83b858f83b658bd34eca5d8ad4d145f673ae7e5e&q=
uot;<br>
<br>
=C2=A0BASEVER =3D &quot;1.2.4&quot;<br>
<br>
-PV =3D &quot;${BASEVER}+git${SRCPV}&quot;<br>
+PV =3D &quot;${BASEVER}+git&quot;<br>
<br>
=C2=A0# mirror is at git://<a href=3D"http://github.com/kraj/musl.git" rel=
=3D"noreferrer" target=3D"_blank">github.com/kraj/musl.git</a><br>
<br>
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib=
/newlib.inc<br>
index 5351a9f9912..da753f11ada 100644<br>
--- a/meta/recipes-core/newlib/newlib.inc<br>
+++ b/meta/recipes-core/newlib/newlib.inc<br>
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0BASEVER =3D &quot;4.3.0&quot;<br>
-PV =3D &quot;${BASEVER}+git${SRCPV}&quot;<br>
+PV =3D &quot;${BASEVER}+git&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://sourceware.org/git/newlib-c=
ygwin.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=3D"_bla=
nk">sourceware.org/git/newlib-cygwin.git;protocol=3Dhttps;branch=3Dmain</a>=
&quot;<br>
=C2=A0SRCREV=3D&quot;9e09d6ed83cce4777a5950412647ccc603040409&quot;<br>
<br>
diff --git a/meta/recipes-core/psplash/<a href=3D"http://psplash_git.bb" re=
l=3D"noreferrer" target=3D"_blank">psplash_git.bb</a> b/meta/recipes-core/p=
splash/<a href=3D"http://psplash_git.bb" rel=3D"noreferrer" target=3D"_blan=
k">psplash_git.bb</a><br>
index 78960e1e4cc..17704a02f69 100644<br>
--- a/meta/recipes-core/psplash/<a href=3D"http://psplash_git.bb" rel=3D"no=
referrer" target=3D"_blank">psplash_git.bb</a><br>
+++ b/meta/recipes-core/psplash/<a href=3D"http://psplash_git.bb" rel=3D"no=
referrer" target=3D"_blank">psplash_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://psplash.h;beginline=3D1;e=
ndline=3D8;md5=3D8f232c1e95929eaca<br>
=C2=A0DEPENDS =3D &quot;gdk-pixbuf-native&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;44afb7506d43cca15582b4c5b90ba5580344d75d&quot;<br>
-PV =3D &quot;0.1+git${SRCPV}&quot;<br>
+PV =3D &quot;0.1+git&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/$%7BBP=
N%7D;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>git.yoctoproject.org/${BPN};branch=3Dmaster;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://psplash-init \<br>
diff --git a/meta/recipes-devtools/gnu-config/<a href=3D"http://gnu-config_=
git.bb" rel=3D"noreferrer" target=3D"_blank">gnu-config_git.bb</a> b/meta/r=
ecipes-devtools/gnu-config/<a href=3D"http://gnu-config_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">gnu-config_git.bb</a><br>
index 080704753d1..2a0e6f8e41f 100644<br>
--- a/meta/recipes-devtools/gnu-config/<a href=3D"http://gnu-config_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">gnu-config_git.bb</a><br>
+++ b/meta/recipes-devtools/gnu-config/<a href=3D"http://gnu-config_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">gnu-config_git.bb</a><br>
@@ -10,7 +10,7 @@ DEPENDS:class-native =3D &quot;hostperl-runtime-native&qu=
ot;<br>
=C2=A0INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;63acb96f92473ceb5e21d873d7c0aee266b3d6d3&quot;<br>
-PV =3D &quot;20230216+git${SRCPV}&quot;<br>
+PV =3D &quot;20230216+git&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.savannah.gnu.org/git/co=
nfig.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_bl=
ank">git.savannah.gnu.org/git/config.git;protocol=3Dhttps;branch=3Dmaster</=
a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<a href=3D"http://gnu-conf=
igize.in" rel=3D"noreferrer" target=3D"_blank">gnu-configize.in</a>&quot;<b=
r>
diff --git a/meta/recipes-devtools/mmc/<a href=3D"http://mmc-utils_git.bb" =
rel=3D"noreferrer" target=3D"_blank">mmc-utils_git.bb</a> b/meta/recipes-de=
vtools/mmc/<a href=3D"http://mmc-utils_git.bb" rel=3D"noreferrer" target=3D=
"_blank">mmc-utils_git.bb</a><br>
index 373ada2026a..879c179dd73 100644<br>
--- a/meta/recipes-devtools/mmc/<a href=3D"http://mmc-utils_git.bb" rel=3D"=
noreferrer" target=3D"_blank">mmc-utils_git.bb</a><br>
+++ b/meta/recipes-devtools/mmc/<a href=3D"http://mmc-utils_git.bb" rel=3D"=
noreferrer" target=3D"_blank">mmc-utils_git.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://mmc.c;beginline=3D1;endli=
ne=3D20;md5=3Dfae32792e20f4d27ade1<br>
=C2=A0SRCBRANCH ?=3D &quot;master&quot;<br>
=C2=A0SRCREV =3D &quot;958227890690290ee766aaad1b92f3413f67048c&quot;<br>
<br>
-PV =3D &quot;0.1+git${SRCPV}&quot;<br>
+PV =3D &quot;0.1+git&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/linu=
x/kernel/git/cjb/mmc-utils.git;branch=3D$%7BSRCBRANCH%7D;protocol=3Dhttps" =
rel=3D"noreferrer" target=3D"_blank">git.kernel.org/pub/scm/linux/kernel/gi=
t/cjb/mmc-utils.git;branch=3D${SRCBRANCH};protocol=3Dhttps</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
diff --git a/meta/recipes-devtools/pkgconfig/<a href=3D"http://pkgconfig_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">pkgconfig_git.bb</a> b/meta/reci=
pes-devtools/pkgconfig/<a href=3D"http://pkgconfig_git.bb" rel=3D"noreferre=
r" target=3D"_blank">pkgconfig_git.bb</a><br>
index 68f624c80a3..16e6c5b6099 100644<br>
--- a/meta/recipes-devtools/pkgconfig/<a href=3D"http://pkgconfig_git.bb" r=
el=3D"noreferrer" target=3D"_blank">pkgconfig_git.bb</a><br>
+++ b/meta/recipes-devtools/pkgconfig/<a href=3D"http://pkgconfig_git.bb" r=
el=3D"noreferrer" target=3D"_blank">pkgconfig_git.bb</a><br>
@@ -9,7 +9,7 @@ LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;d97db4fae4c1cd099b506970b285dc2afd818ea2&quot;<br>
-PV =3D &quot;0.29.2+git${SRCPV}&quot;<br>
+PV =3D &quot;0.29.2+git&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freedesktop.org/pkg-=
config/pkg-config.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" =
target=3D"_blank">gitlab.freedesktop.org/pkg-config/pkg-config.git;branch=
=3Dmaster;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<a href=3D"http://pkg-conf=
ig-esdk.in" rel=3D"noreferrer" target=3D"_blank">pkg-config-esdk.in</a> \<b=
r>
diff --git a/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" =
rel=3D"noreferrer" target=3D"_blank">pseudo_git.bb</a> b/meta/recipes-devto=
ols/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">pseudo_git.bb</a><br>
index c3c4bb0ed92..4ba752f1745 100644<br>
--- a/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pseudo_git.bb</a><br>
+++ b/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pseudo_git.bb</a><br>
@@ -15,7 +15,7 @@ SRC_URI[prebuilt.sha256sum] =3D &quot;ed9f456856e9d86359f=
169f46a70ad7be4190d6040282b84c<br>
<br>
=C2=A0SRCREV =3D &quot;ec6151a2b057109b3f798f151a36690af582e166&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-PV =3D &quot;1.9.0+git${SRCPV}&quot;<br>
+PV =3D &quot;1.9.0+git&quot;<br>
<br>
=C2=A0# largefile and 64bit time_t support adds these macros via compiler f=
lags globally<br>
=C2=A0# remove them for pseudo since pseudo intercepts some of the function=
s which will be<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-dtc_1.6=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-dtc_1.6.1.bb</a> b/meta=
/recipes-devtools/python/<a href=3D"http://python3-dtc_1.6.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-dtc_1.6.1.bb</a><br>
index a868bd0109d..95ab0be4747 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-dtc_1.6.1.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-dtc_1.6.1.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-dtc_1.6.1.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-dtc_1.6.1.bb</a><br>
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM =3D &quot;file://pylibfdt/libfdt.i;begin=
line=3D1;endline=3D6;md5=3Dafda088c9<br>
<br>
=C2=A0SRCREV =3D &quot;c001fc01a43e7a06447c06ea3d50bd60641322b8&quot;<br>
<br>
-PV =3D &quot;1.6.1+git${SRCPV}&quot;<br>
+PV =3D &quot;1.6.1+git&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0PYPA_WHEEL =3D &quot;${S}/dist/libfdt-1.6.2*.whl&quot;<br>
diff --git a/meta/recipes-devtools/tcf-agent/<a href=3D"http://tcf-agent_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">tcf-agent_git.bb</a> b/meta/reci=
pes-devtools/tcf-agent/<a href=3D"http://tcf-agent_git.bb" rel=3D"noreferre=
r" target=3D"_blank">tcf-agent_git.bb</a><br>
index 7d151d4642a..4d2ca5f1b0b 100644<br>
--- a/meta/recipes-devtools/tcf-agent/<a href=3D"http://tcf-agent_git.bb" r=
el=3D"noreferrer" target=3D"_blank">tcf-agent_git.bb</a><br>
+++ b/meta/recipes-devtools/tcf-agent/<a href=3D"http://tcf-agent_git.bb" r=
el=3D"noreferrer" target=3D"_blank">tcf-agent_git.bb</a><br>
@@ -7,7 +7,7 @@ LICENSE =3D &quot;EPL-1.0 | EDL-1.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://edl-v10.html;md5=3D522a390a83dc1865=
13f0500543ad3679&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;1f11747e83ebf4f53e8d17f430136f92ec378709&quot;<br>
-PV =3D &quot;1.8.0+git${SRCPV}&quot;<br>
+PV =3D &quot;1.8.0+git&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;(\d+(\.\d+)+))&qu=
ot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.eclipse.org/r/tcf/org.e=
clipse.tcf.agent.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" t=
arget=3D"_blank">git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=
=3Dhttps;branch=3Dmaster</a> \<br>
diff --git a/meta/recipes-devtools/xmlto/<a href=3D"http://xmlto_0.0.28.bb"=
 rel=3D"noreferrer" target=3D"_blank">xmlto_0.0.28.bb</a> b/meta/recipes-de=
vtools/xmlto/<a href=3D"http://xmlto_0.0.28.bb" rel=3D"noreferrer" target=
=3D"_blank">xmlto_0.0.28.bb</a><br>
index 5e3fac7a60c..d5a0e69849e 100644<br>
--- a/meta/recipes-devtools/xmlto/<a href=3D"http://xmlto_0.0.28.bb" rel=3D=
"noreferrer" target=3D"_blank">xmlto_0.0.28.bb</a><br>
+++ b/meta/recipes-devtools/xmlto/<a href=3D"http://xmlto_0.0.28.bb" rel=3D=
"noreferrer" target=3D"_blank">xmlto_0.0.28.bb</a><br>
@@ -11,7 +11,7 @@ UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://pagure.io/xmlto.git;protoco=
l=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">pagure.io/x=
mlto.git;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-PV .=3D &quot;+0.0.29+git${SRCPV}&quot;<br>
+PV .=3D &quot;+0.0.29+git&quot;<br>
<br>
=C2=A0inherit autotools<br>
<br>
diff --git a/meta/recipes-extended/baremetal-example/<a href=3D"http://bare=
metal-helloworld_git.bb" rel=3D"noreferrer" target=3D"_blank">baremetal-hel=
loworld_git.bb</a> b/meta/recipes-extended/baremetal-example/<a href=3D"htt=
p://baremetal-helloworld_git.bb" rel=3D"noreferrer" target=3D"_blank">barem=
etal-helloworld_git.bb</a><br>
index c5d3e04ed55..fde75ec2fd9 100644<br>
--- a/meta/recipes-extended/baremetal-example/<a href=3D"http://baremetal-h=
elloworld_git.bb" rel=3D"noreferrer" target=3D"_blank">baremetal-helloworld=
_git.bb</a><br>
+++ b/meta/recipes-extended/baremetal-example/<a href=3D"http://baremetal-h=
elloworld_git.bb" rel=3D"noreferrer" target=3D"_blank">baremetal-helloworld=
_git.bb</a><br>
@@ -5,7 +5,7 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D39346640a23c701e4f459=
e05f56f4449&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;fc7c43d138185028b6ac14c83f6492fce26eca95&quot;<br>
-PV =3D &quot;0.1+git${SRCPV}&quot;<br>
+PV =3D &quot;0.1+git&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/ahcbb6/baremetal=
-helloqemu.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=
=3D"_blank">github.com/ahcbb6/baremetal-helloqemu.git;protocol=3Dhttps;bran=
ch=3Dmaster</a>&quot;<br>
=C2=A0UPSTREAM_VERSION_UNKNOWN=3D&quot;1&quot;<br>
diff --git a/meta/recipes-graphics/libfakekey/<a href=3D"http://libfakekey_=
git.bb" rel=3D"noreferrer" target=3D"_blank">libfakekey_git.bb</a> b/meta/r=
ecipes-graphics/libfakekey/<a href=3D"http://libfakekey_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">libfakekey_git.bb</a><br>
index c9c828a8c42..5f902d3a67e 100644<br>
--- a/meta/recipes-graphics/libfakekey/<a href=3D"http://libfakekey_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">libfakekey_git.bb</a><br>
+++ b/meta/recipes-graphics/libfakekey/<a href=3D"http://libfakekey_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">libfakekey_git.bb</a><br>
@@ -11,7 +11,7 @@ DEPENDS =3D &quot;libxtst&quot;<br>
=C2=A0SECTION =3D &quot;x11/wm&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;7ad885912efb2131e80914e964d5e635b0d07b40&quot;<br>
-PV =3D &quot;0.3+git${SRCPV}&quot;<br>
+PV =3D &quot;0.3+git&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/$%7BBP=
N%7D;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>git.yoctoproject.org/${BPN};branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
<br>
diff --git a/meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" =
rel=3D"noreferrer" target=3D"_blank">piglit_git.bb</a> b/meta/recipes-graph=
ics/piglit/<a href=3D"http://piglit_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">piglit_git.bb</a><br>
index cd97ee53547..62cada75906 100644<br>
--- a/meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" rel=3D"=
noreferrer" target=3D"_blank">piglit_git.bb</a><br>
+++ b/meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" rel=3D"=
noreferrer" target=3D"_blank">piglit_git.bb</a><br>
@@ -16,7 +16,7 @@ UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;5036601c43fff63f7be5cd8ad7b319a5c1f6652c&quot;<br>
=C2=A0# (when PV goes above 1.0 remove the trailing r)<br>
-PV =3D &quot;1.0+gitr${SRCPV}&quot;<br>
+PV =3D &quot;1.0+gitr&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/<a href=3D"htt=
p://xcursor-transparent-theme_git.bb" rel=3D"noreferrer" target=3D"_blank">=
xcursor-transparent-theme_git.bb</a> b/meta/recipes-graphics/xcursor-transp=
arent-theme/<a href=3D"http://xcursor-transparent-theme_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">xcursor-transparent-theme_git.bb</a><br>
index b65a3bea562..40b77422bf6 100644<br>
--- a/meta/recipes-graphics/xcursor-transparent-theme/<a href=3D"http://xcu=
rsor-transparent-theme_git.bb" rel=3D"noreferrer" target=3D"_blank">xcursor=
-transparent-theme_git.bb</a><br>
+++ b/meta/recipes-graphics/xcursor-transparent-theme/<a href=3D"http://xcu=
rsor-transparent-theme_git.bb" rel=3D"noreferrer" target=3D"_blank">xcursor=
-transparent-theme_git.bb</a><br>
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9=
ba36caa9b7df079bae19f&quot;<br>
=C2=A0SECTION =3D &quot;x11/base&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;23c8af5ba4a1b7efbaf0bbca59a65ff7e10a1a06&quot;<br>
-PV =3D &quot;0.1.1+git${SRCPV}&quot;<br>
+PV =3D &quot;0.1.1+git&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/$%7BBP=
N%7D;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>git.yoctoproject.org/${BPN};branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
diff --git a/meta/recipes-graphics/xinput-calibrator/<a href=3D"http://xinp=
ut-calibrator_git.bb" rel=3D"noreferrer" target=3D"_blank">xinput-calibrato=
r_git.bb</a> b/meta/recipes-graphics/xinput-calibrator/<a href=3D"http://xi=
nput-calibrator_git.bb" rel=3D"noreferrer" target=3D"_blank">xinput-calibra=
tor_git.bb</a><br>
index 3f49df6258b..05f07c190e9 100644<br>
--- a/meta/recipes-graphics/xinput-calibrator/<a href=3D"http://xinput-cali=
brator_git.bb" rel=3D"noreferrer" target=3D"_blank">xinput-calibrator_git.b=
b</a><br>
+++ b/meta/recipes-graphics/xinput-calibrator/<a href=3D"http://xinput-cali=
brator_git.bb" rel=3D"noreferrer" target=3D"_blank">xinput-calibrator_git.b=
b</a><br>
@@ -4,7 +4,7 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://src/calibrator.cpp;endline=3D22;md5=
=3D1bcba08f67cdb56f34021557898e4b5a&quot;<br>
=C2=A0DEPENDS =3D &quot;virtual/libx11 libxi libxrandr&quot;<br>
<br>
-PV =3D &quot;0.7.5+git${SRCPV}&quot;<br>
+PV =3D &quot;0.7.5+git&quot;<br>
=C2=A0PR =3D &quot;r6&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig features_check<br>
diff --git a/meta/recipes-graphics/xorg-driver/<a href=3D"http://xf86-video=
-intel_git.bb" rel=3D"noreferrer" target=3D"_blank">xf86-video-intel_git.bb=
</a> b/meta/recipes-graphics/xorg-driver/<a href=3D"http://xf86-video-intel=
_git.bb" rel=3D"noreferrer" target=3D"_blank">xf86-video-intel_git.bb</a><b=
r>
index 21b499e6666..2e526bd7999 100644<br>
--- a/meta/recipes-graphics/xorg-driver/<a href=3D"http://xf86-video-intel_=
git.bb" rel=3D"noreferrer" target=3D"_blank">xf86-video-intel_git.bb</a><br=
>
+++ b/meta/recipes-graphics/xorg-driver/<a href=3D"http://xf86-video-intel_=
git.bb" rel=3D"noreferrer" target=3D"_blank">xf86-video-intel_git.bb</a><br=
>
@@ -10,7 +10,7 @@ Infrastructure (DRI).&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D8730ad58d11c7bbad9a70=
66d69f7808e&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;31486f40f8e8f8923ca0799aea84b58799754564&quot;<br>
-PV =3D &quot;2.99.917+git${SRCPV}&quot;<br>
+PV =3D &quot;2.99.917+git&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://anongit.freedesktop.org/git=
/xorg/driver/xf86-video-intel;protocol=3Dhttps;branch=3Dmaster" rel=3D"nore=
ferrer" target=3D"_blank">anongit.freedesktop.org/git/xorg/driver/xf86-vide=
o-intel;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
diff --git a/meta/recipes-kernel/blktrace/<a href=3D"http://blktrace_git.bb=
" rel=3D"noreferrer" target=3D"_blank">blktrace_git.bb</a> b/meta/recipes-k=
ernel/blktrace/<a href=3D"http://blktrace_git.bb" rel=3D"noreferrer" target=
=3D"_blank">blktrace_git.bb</a><br>
index d0eeba32088..d4f5bac84f1 100644<br>
--- a/meta/recipes-kernel/blktrace/<a href=3D"http://blktrace_git.bb" rel=
=3D"noreferrer" target=3D"_blank">blktrace_git.bb</a><br>
+++ b/meta/recipes-kernel/blktrace/<a href=3D"http://blktrace_git.bb" rel=
=3D"noreferrer" target=3D"_blank">blktrace_git.bb</a><br>
@@ -12,7 +12,7 @@ DEPENDS =3D &quot;libaio&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;366d30b9cdb20345c5d064af850d686da79b89eb&quot;<br>
<br>
-PV =3D &quot;1.3.0+git${SRCPV}&quot;<br>
+PV =3D &quot;1.3.0+git&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.dk/blktrace.git;=
branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">git.=
kernel.dk/blktrace.git;branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
<br>
diff --git a/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-na=
tive_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb<=
/a> b/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a><br>
index 388d8feebce..5127c70f446 100644<br>
--- a/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a><br>
+++ b/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a><br>
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
=C2=A0DEPENDS =3D &quot;git-native&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;2d01f24bc78256c709728eb3f204491bce13e0e5&quot;<br>
-PV =3D &quot;0.3+git${SRCPV}&quot;<br>
+PV =3D &quot;0.3+git&quot;<br>
<br>
=C2=A0inherit native<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb=
" rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a> b/meta/recipe=
s-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=3D"noreferrer" tar=
get=3D"_blank">linux-yocto-dev.bb</a><br>
index e695e2d83ea..1d404bd7c6b 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><br>
@@ -30,7 +30,7 @@ SRCREV_meta ?=3D &#39;${@oe.utils.conditional(&quot;PREFE=
RRED_PROVIDER_virtual/kernel&quot;, &quot;li<br>
<br>
=C2=A0LINUX_VERSION ?=3D &quot;6.5&quot;<br>
=C2=A0LINUX_VERSION_EXTENSION ?=3D &quot;-yoctodev-${LINUX_KERNEL_TYPE}&quo=
t;<br>
-PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
+PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc93980=
86aedcd7e46&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.1=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.1.bb</a> b/meta/=
recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">linux-yocto-rt_6.1.bb</a><br>
index 0645458d11c..2e35748cae8 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.1.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.1.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.1.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.1.bb</a><br>
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5=
bd9a7fc9398086aedcd7e46&quot;<br>
=C2=A0DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x86&#39;=
, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0DEPENDS +=3D &quot;openssl-native util-linux-native&quot;<br>
<br>
-PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
+PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0KCONF_BSP_AUDIT_LEVEL =3D &quot;1&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.4=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.4.bb</a> b/meta/=
recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">linux-yocto-rt_6.4.bb</a><br>
index 2f051844d8c..30aab9a23cd 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.4.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.4.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.4.bb</a><br>
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5=
bd9a7fc9398086aedcd7e46&quot;<br>
=C2=A0DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x86&#39;=
, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0DEPENDS +=3D &quot;openssl-native util-linux-native&quot;<br>
<br>
-PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
+PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0KCONF_BSP_AUDIT_LEVEL =3D &quot;1&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6=
.1.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.1.bb</a> b/m=
eta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.1.bb" rel=3D"=
noreferrer" target=3D"_blank">linux-yocto-tiny_6.1.bb</a><br>
index dfc1e5e5d6d..5f84454fd64 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.1.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.1.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.1.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.1.bb</a><br>
@@ -20,7 +20,7 @@ KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
=C2=A0SRCREV_machine ?=3D &quot;19cd9d8c4bafb673a03b2d7c22407d7c8d192a96&qu=
ot;<br>
=C2=A0SRCREV_meta ?=3D &quot;9f8ee63473567964331b9465fa1aba301a9a725b&quot;=
<br>
<br>
-PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
+PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine;protocol=3Dhttps" rel=3D"n=
oreferrer" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;branch=3D=
${KBRANCH};name=3Dmachine;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-6.1;=
destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_b=
lank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;bran=
ch=3Dyocto-6.1;destsuffix=3D${KMETA};protocol=3Dhttps</a>&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6=
.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.4.bb</a> b/m=
eta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.4.bb" rel=3D"=
noreferrer" target=3D"_blank">linux-yocto-tiny_6.4.bb</a><br>
index 64dfb3a3791..863c9ae7cef 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.4.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.4.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.4.bb</a><br>
@@ -20,7 +20,7 @@ KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
=C2=A0SRCREV_machine ?=3D &quot;72bad8cd7540f07ab54e08b83ad106dec0df123c&qu=
ot;<br>
=C2=A0SRCREV_meta ?=3D &quot;88ed9ec49099d69f9546d21137191fd747d06ec4&quot;=
<br>
<br>
-PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
+PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine;protocol=3Dhttps" rel=3D"n=
oreferrer" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;branch=3D=
${KBRANCH};name=3Dmachine;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-6.4;=
destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_b=
lank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;bran=
ch=3Dyocto-6.4;destsuffix=3D${KMETA};protocol=3Dhttps</a>&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.1.bb=
" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.1.bb</a> b/meta/recipe=
s-kernel/linux/<a href=3D"http://linux-yocto_6.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">linux-yocto_6.1.bb</a><br>
index 2f804d379d6..d50838f4939 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.1.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.1.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.1.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.1.bb</a><br>
@@ -47,7 +47,7 @@ SRC_URI +=3D &quot;file://0001-perf-cpumap-Make-counter-a=
s-unsigned-ints.patch&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc93980=
86aedcd7e46&quot;<br>
=C2=A0LINUX_VERSION ?=3D &quot;6.1.43&quot;<br>
<br>
-PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
+PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0KCONF_BSP_AUDIT_LEVEL =3D &quot;1&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.4.bb=
" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.4.bb</a> b/meta/recipe=
s-kernel/linux/<a href=3D"http://linux-yocto_6.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">linux-yocto_6.4.bb</a><br>
index d0d96c4d108..0c0cb851b64 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.4.bb</a><br>
@@ -46,7 +46,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoprojec=
t.org/linux-yocto.git;name=3Dmachine;branch=3D$%7BKBRA" rel=3D"noreferrer" =
target=3D"_blank">git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branc=
h=3D${KBRA</a><br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc93980=
86aedcd7e46&quot;<br>
=C2=A0LINUX_VERSION ?=3D &quot;6.4.9&quot;<br>
<br>
-PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
+PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0KCONF_BSP_AUDIT_LEVEL =3D &quot;1&quot;<br>
diff --git a/meta/recipes-multimedia/x264/<a href=3D"http://x264_git.bb" re=
l=3D"noreferrer" target=3D"_blank">x264_git.bb</a> b/meta/recipes-multimedi=
a/x264/<a href=3D"http://x264_git.bb" rel=3D"noreferrer" target=3D"_blank">=
x264_git.bb</a><br>
index 2ac2b6f1a67..e7d9e75e8de 100644<br>
--- a/meta/recipes-multimedia/x264/<a href=3D"http://x264_git.bb" rel=3D"no=
referrer" target=3D"_blank">x264_git.bb</a><br>
+++ b/meta/recipes-multimedia/x264/<a href=3D"http://x264_git.bb" rel=3D"no=
referrer" target=3D"_blank">x264_git.bb</a><br>
@@ -16,7 +16,7 @@ UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;baee400fa9ced6f5481a728138fed6e867b0ff7f&quot;<br>
<br>
-PV =3D &quot;r3039+git${SRCPV}&quot;<br>
+PV =3D &quot;r3039+git&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
diff --git a/meta/recipes-sato/l3afpad/<a href=3D"http://l3afpad_git.bb" re=
l=3D"noreferrer" target=3D"_blank">l3afpad_git.bb</a> b/meta/recipes-sato/l=
3afpad/<a href=3D"http://l3afpad_git.bb" rel=3D"noreferrer" target=3D"_blan=
k">l3afpad_git.bb</a><br>
index 56cbe6bc8d3..55400839284 100644<br>
--- a/meta/recipes-sato/l3afpad/<a href=3D"http://l3afpad_git.bb" rel=3D"no=
referrer" target=3D"_blank">l3afpad_git.bb</a><br>
+++ b/meta/recipes-sato/l3afpad/<a href=3D"http://l3afpad_git.bb" rel=3D"no=
referrer" target=3D"_blank">l3afpad_git.bb</a><br>
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380=
cdd255951079008b364516c \<br>
<br>
=C2=A0DEPENDS =3D &quot;gtk+3 intltool-native gettext-native&quot;<br>
<br>
-PV =3D &quot;0.8.18.1.11+git${SRCPV}&quot;<br>
+PV =3D &quot;0.8.18.1.11+git&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/stevenhoneyman/l=
3afpad.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">github.com/stevenhoneyman/l3afpad.git;branch=3Dmaster;protocol=3Dhtt=
ps</a>&quot;<br>
=C2=A0SRCREV =3D&quot;3cdccdc9505643e50f8208171d9eee5de11a42ff&quot;<br>
<br>
diff --git a/meta/recipes-sato/matchbox-config-gtk/<a href=3D"http://matchb=
ox-config-gtk_0.2.bb" rel=3D"noreferrer" target=3D"_blank">matchbox-config-=
gtk_0.2.bb</a> b/meta/recipes-sato/matchbox-config-gtk/<a href=3D"http://ma=
tchbox-config-gtk_0.2.bb" rel=3D"noreferrer" target=3D"_blank">matchbox-con=
fig-gtk_0.2.bb</a><br>
index 490bd582b25..caa34966ccc 100644<br>
--- a/meta/recipes-sato/matchbox-config-gtk/<a href=3D"http://matchbox-conf=
ig-gtk_0.2.bb" rel=3D"noreferrer" target=3D"_blank">matchbox-config-gtk_0.2=
.bb</a><br>
+++ b/meta/recipes-sato/matchbox-config-gtk/<a href=3D"http://matchbox-conf=
ig-gtk_0.2.bb" rel=3D"noreferrer" target=3D"_blank">matchbox-config-gtk_0.2=
.bb</a><br>
@@ -13,7 +13,7 @@ SRCREV =3D &quot;7182e603357250952aa24d90f6d89345f93da7ce=
&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/$%7BBP=
N%7D;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>git.yoctoproject.org/${BPN};branch=3Dmaster;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://no-handed.patch&quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;(\d+(\.\d+)+))&qu=
ot;<br>
-PV =3D &quot;0.2+git${SRCPV}&quot;<br>
+PV =3D &quot;0.2+git&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
diff --git a/meta/recipes-sato/matchbox-terminal/<a href=3D"http://matchbox=
-terminal_0.2.bb" rel=3D"noreferrer" target=3D"_blank">matchbox-terminal_0.=
2.bb</a> b/meta/recipes-sato/matchbox-terminal/<a href=3D"http://matchbox-t=
erminal_0.2.bb" rel=3D"noreferrer" target=3D"_blank">matchbox-terminal_0.2.=
bb</a><br>
index a1f236b40ff..f91c593f784 100644<br>
--- a/meta/recipes-sato/matchbox-terminal/<a href=3D"http://matchbox-termin=
al_0.2.bb" rel=3D"noreferrer" target=3D"_blank">matchbox-terminal_0.2.bb</a=
><br>
+++ b/meta/recipes-sato/matchbox-terminal/<a href=3D"http://matchbox-termin=
al_0.2.bb" rel=3D"noreferrer" target=3D"_blank">matchbox-terminal_0.2.bb</a=
><br>
@@ -12,7 +12,7 @@ SECTION =3D &quot;x11/utils&quot;<br>
=C2=A0SRCREV =3D &quot;99e6eb7db1b5fef110973d96194eec992a2515a2&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/$%7BBP=
N%7D;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>git.yoctoproject.org/${BPN};branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;(\d+(\.\d+)+))&qu=
ot;<br>
-PV =3D &quot;0.2+git${SRCPV}&quot;<br>
+PV =3D &quot;0.2+git&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
diff --git a/meta/recipes-sato/puzzles/<a href=3D"http://puzzles_git.bb" re=
l=3D"noreferrer" target=3D"_blank">puzzles_git.bb</a> b/meta/recipes-sato/p=
uzzles/<a href=3D"http://puzzles_git.bb" rel=3D"noreferrer" target=3D"_blan=
k">puzzles_git.bb</a><br>
index 960b5d3b110..04338a603b5 100644<br>
--- a/meta/recipes-sato/puzzles/<a href=3D"http://puzzles_git.bb" rel=3D"no=
referrer" target=3D"_blank">puzzles_git.bb</a><br>
+++ b/meta/recipes-sato/puzzles/<a href=3D"http://puzzles_git.bb" rel=3D"no=
referrer" target=3D"_blank">puzzles_git.bb</a><br>
@@ -12,7 +12,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.tartarus.or=
g/simon/puzzles.git;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" targ=
et=3D"_blank">git.tartarus.org/simon/puzzles.git;branch=3Dmain;protocol=3Dh=
ttps</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
=C2=A0SRCREV =3D &quot;b6c842a28cf6597df063fcff35079c3e3982381e&quot;<br>
=C2=A0PE =3D &quot;2&quot;<br>
-PV =3D &quot;0.0+git${SRCPV}&quot;<br>
+PV =3D &quot;0.0+git&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
diff --git a/meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_git.bb</a> b/meta/re=
cipes-support/bmap-tools/<a href=3D"http://bmap-tools_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">bmap-tools_git.bb</a><br>
index 89b7bf2b93c..1de95c8e524 100644<br>
--- a/meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_git.bb" =
rel=3D"noreferrer" target=3D"_blank">bmap-tools_git.bb</a><br>
+++ b/meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_git.bb" =
rel=3D"noreferrer" target=3D"_blank">bmap-tools_git.bb</a><br>
@@ -14,7 +14,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/inte=
l/$%7BBPN%7D;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">github.com/intel/${BPN};branch=3Dmain;protocol=3Dhttps</a>&quot;<br>
=C2=A0SRCREV =3D &quot;c0673962a8ec1624b5189dc1d24f33fe4f06785a&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0BASEVER =3D &quot;3.6&quot;<br>
-PV =3D &quot;${BASEVER}+git${SRCPV}&quot;<br>
+PV =3D &quot;${BASEVER}+git&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)&quo=
t;<br>
<br>
diff --git a/meta/recipes-support/ptest-runner/<a href=3D"http://ptest-runn=
er_2.4.2.bb" rel=3D"noreferrer" target=3D"_blank">ptest-runner_2.4.2.bb</a>=
 b/meta/recipes-support/ptest-runner/<a href=3D"http://ptest-runner_2.4.2.b=
b" rel=3D"noreferrer" target=3D"_blank">ptest-runner_2.4.2.bb</a><br>
index 60918a38927..ff336b38208 100644<br>
--- a/meta/recipes-support/ptest-runner/<a href=3D"http://ptest-runner_2.4.=
2.bb" rel=3D"noreferrer" target=3D"_blank">ptest-runner_2.4.2.bb</a><br>
+++ b/meta/recipes-support/ptest-runner/<a href=3D"http://ptest-runner_2.4.=
2.bb" rel=3D"noreferrer" target=3D"_blank">ptest-runner_2.4.2.bb</a><br>
@@ -8,7 +8,7 @@ LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D751419260aa954499f7ab=
aabaa882bbe&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;4148e75284e443fc8ffaef425c467aa5523528ff&quot;<br>
-PV .=3D &quot;+git${SRCPV}&quot;<br>
+PV .=3D &quot;+git&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/ptest-=
runner2;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bla=
nk">git.yoctoproject.org/ptest-runner2;branch=3Dmaster;protocol=3Dhttps</a>=
 \<br>
=C2=A0&quot;<br>
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py<br>
index e99e0714bf4..f9dda3c2f96 100644<br>
--- a/scripts/lib/recipetool/create.py<br>
+++ b/scripts/lib/recipetool/create.py<br>
@@ -690,7 +690,7 @@ def create_recipe(args):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcpvprefix =3D &#39;svnr&#=
39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcpvprefix =3D scheme<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 lines_before.append(&#39;PV =3D &quot;%s+%s${S=
RCPV}&quot;&#39; % (realpv or &#39;1.0&#39;, srcpvprefix))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lines_before.append(&#39;PV =3D &quot;%s+%s&qu=
ot;&#39; % (realpv or &#39;1.0&#39;, srcpvprefix))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pv_srcpv =3D True<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not args.autorev and srcrev =3D=3D &#3=
9;${AUTOREV}&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(os.path.j=
oin(srctree, &#39;.git&#39;)):<br>
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py<br>
index f433106c9a8..f23e53cba93 100644<br>
--- a/scripts/lib/scriptutils.py<br>
+++ b/scripts/lib/scriptutils.py<br>
@@ -177,7 +177,7 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir, logger,=
 preserve_tmp=3DFalse, mirr<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;=
BB_STRICT_CHECKSUM =3D &quot;ignore&quot;\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;=
SRC_URI =3D &quot;%s&quot;\n&#39; % srcuri)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;=
SRCREV =3D &quot;%s&quot;\n&#39; % srcrev)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#39;PV =
=3D &quot;0.0+${SRCPV}&quot;\n&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#39;PV =
=3D &quot;0.0+&quot;\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;=
WORKDIR =3D &quot;%s&quot;\n&#39; % tmpworkdir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Set S out o=
f the way so it doesn&#39;t get created under the workdir<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;=
S =3D &quot;%s&quot;\n&#39; % os.path.join(tmpdir, &#39;emptysrc&#39;))<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#185842): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185842" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/185842</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100683548/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100683548/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div></div>

--0000000000003c2d110602a5efb7--

