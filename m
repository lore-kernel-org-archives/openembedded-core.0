Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F3DC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:47:49 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12384.1784134063183136132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aFgJEBOA;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7ea9c6ea7deso3891416a34.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134062; x=1784738862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mTiBTKuZiqX6GxF/ZJhRATaz3rMTztr1YD0Ob7zV4/4=;
        b=aFgJEBOAoGlaLpbpaa+g25XfnvGNHQXEj7uDUpSrlXl4/FDhwOObPPZlrqtzELKW1x
         dzwJxYkcTlVJgwruS4+xPZdpOCzBOvBqfh30tJDJ066basyW46+sYKAK5z05Iqhpul+N
         BiiwE1Y8wf6vVafW+8cTeyOPN0x6Mihyj5YXYYEMPWmDWNBZOa6HiKRVbI2C3SmhJJvV
         5URj/SDYkQPJDy7YM934+c1XC8QAL2Zop42H62ySC4lqnPKx1GFDZZ/Q39AtkXFuuddw
         wsbHQOojlHBQ8pZK5svZzgQAt3BOmBu0VmB8noRG3u68IEi4VZl2chKH9AWlRe0gKruS
         AiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134062; x=1784738862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mTiBTKuZiqX6GxF/ZJhRATaz3rMTztr1YD0Ob7zV4/4=;
        b=fRYDt1v9UYww/eAtnsQ0rvyL8/t2iT2acjYzwgHXPJzI3UsFpr6TYoya1UkztebK+2
         qHg6+rTimjCKgTpoJPaCd8eGIIHpmwyFZ/lpPHTbYmVLhCa8uBnxeErVelyUF4QWmlAh
         YIQs2l5XSo4WYZ9+34CKnXIPvIQbWxB+mOmGDmU1UqbULcbSUPBEDq+RklGmDJxkwW9d
         yoaTc6P7Vptb+nYxiSQQQOmb1k4n5w8Cgw7xcuZspHVtRaIto+JCk4zQwkugksMxBYC2
         nWQTLXb19c2d2osuIGVeu0w+JV/YhcXawZEzDJZ2XQozIgNxaQqB2mBeylsztM0/xKGQ
         1BdQ==
X-Gm-Message-State: AOJu0YxvYXlyR2ZK2Z+D058U0hCzt8l2WLPwa9L+m24RiyTFAEfNdkAO
	SLlmBUiGCUFuq3y8maTooWmtz/zvfzDSxgS8zZZ268KxxELD2hGaddQqZ99HYQ==
X-Gm-Gg: AfdE7cl85wP3PxbK2+VQkfczPTqxzJew/qK/K4DWkEbdBty2PYUv2+jAjIMeS8iRP+V
	rZWOgjJ+GcNLLnRxs+mLIzljg2uQxaXIBrRUMdfEV/F7la9bcmD7Em2knTKIlunQvo8n4+3h19W
	VDewnl1zkOVB2OAlx+ji6A4IzQmN0sSChCcOpza+WE7OU1EWBEHmZ9VFIQS3/VvOMrkMjnvMHnC
	Crm3xywCrZShqnYlSuJlOw5R8Sk1bJA9APKR+bIQbBncZcyZoOHRqvaAKITU1El5IwGRpD7PSOe
	sg87wVlrCGU807CQxzoWs1jW4buy1jk/SUYJLgCYrVGi0V8I4em6/oTQ/ySmmCPaEHC8DxMVAZ6
	OOGNO8LDUQXjZzsFWdEfmfSXg/Hkxs1seHx4GSC/w1+GbQlDhywtTUeDvJmsgaSsSHDV7qCyODg
	8GM3tqaRNa
X-Received: by 2002:a05:6820:1356:b0:6a3:19a5:3f86 with SMTP id 006d021491bc7-6a3c60086c8mr4751877eaf.8.1784134061781;
        Wed, 15 Jul 2026 09:47:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:41 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 00/25] Rework LICENSE to be SPDX License Expressions
Date: Wed, 15 Jul 2026 10:44:56 -0600
Message-ID: <20260715164739.364323-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714190405.3328796-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240993

Reworks the way that the LICENSE variable is used so that it uses valid
SPDX License Expressions instead of the custom expressions that were
used previously (which are based on Python syntax). This includes
support for the SPDX "WITH" operator which allows a license exception to
be attached to a license identifier.

The old licenses expressions are still allowed, and will still be
correctly parsed, however a warning will be issued that indicates the
new license string that should be used.

Most layers should be able to use the newly-revised
scripts/contrib/convert-spdx-licenses.py script to do the majority of
the conversion work, although some manual work may still be required if
conditional or complex LICENSE expressions are encountered.

SPDX License Expressions require that all licenses listed are either a
known identifier (e.g. "GPL-2.0-or-later") or start with the prefix
"LicenseRef-" which indicates a custom license. When converting from old
expressions to new one this will need to be followed (the suggested new
license in the warning and the conversion script will automatically add
this prefix for any unrecognized license identifiers). This will most
commonly be the case for NO_GENERIC_LICENSE files; for a good example of
what needs to be done here see the changes to the linux-firmware recipe.
When adding new LicenseRef- licenses to a recipe, the actual license
name should be prefixed with the name of the recipe (e.g.
"LicenseRef-myrecipe-mylicense") to prevent conflicts when merging
multiple license documents together (e.g. in an image).

SPDX also introduces the "WITH" operator to add an exception to a
license instead of using a bespoke identifier to combine the two, as was
done with the legacy license expressions. Because of this, the logic for
dealing with the INCOMPATIBLE_LICENSE family of variables has changed
slightly. The main difference is that INCOMPATIBLE_LICENSE will now
match the LHS of a "WITH" expression (where as previously this was
"ignored" since it was a bespoke license ID). In order to allow a
license that would normally be rejected, but can be allowed with an
exception, specifically allowed exceptions can be added to the
INCOMPATIBLE_LICENSE_EXCEPTIONS variable (keep in mind, EXCEPTIONS here
means "exceptions to INCOMPATIBLE_LICENSES", not specifically SPDX
License Exceptions). If an SPDX exception is present here, any license
that has that exception will be allowed, even if it would normally match
INCOMPATIBLE_LICENSE. For example, to disallow all GPLv3 except for
those with the GCC exception, use:

    INCOMPATIBLE_LICENSE = "GPL-3.0* LGPL-3.0*"
    INCOMPATIBLE_LICENSE_EXCEPTIONS = "GCC-exception-3.1" # This new line is required


Additionally, "PD" ("Public Domain") is not allowed as a generic license
identifier. Aside from "PD" not being a valid SPDX License Identifier,
most "Public Domain" licenses do have some sort of text associated with
them (see the HPND family of SPDX Licenses, or use the (SPDX License
Match Website)[1] ). In addition, the meaning of "Public Domain" can vary
by jurisdiction, so the actual text with a LicenseRef- or a SPDX License
Identifier needs to be used instead.

Finally, "CLOSED" is also no longer allowed as a license expression
(since it is not a valid SPDX License Identifier). Instead use a
LicenseRef- to point to a file that contains the actual license text
(usually something like "Copyright <name>, all rights reserved")

[1]: https://tools.spdx.org/app/check_license/

V2: Fix errors found while testing

Joshua Watt (25):
  scripts/pull-spdx-licenses.py: Add exceptions
  Add SPDX License Exceptions
  Add SPDX license library
  Parse LICENSE as SPDX Expression
  linux-firmware: Convert to SPDX license strings
  meta-selftest: Add NO_GENERIC_LICENSE
  convert-spdx-licenses: Convert to valid SPDX expressions
  gcc-common.inc: Remove LICENSE
  gcc: Update license
  xz: Replace deprecated SPDX identifier
  autoconf-archive: Replace deprecated SPDX identifier
  gnu-config: Replace deprecated SPDX identifier
  libglvnd: Replace deprecated SPDX identifier
  flac: Replace deprecated SPDX identifier
  libgit2: Replace deprecated SPDX identifier
  Fix up licenses
  lib: oe: license: Rework package licenses matching
  classes/go-mod-update-modules: Switch to SPDX license
  license: Remove tidy_licenses()
  meta-selftest: Change license on test recipes
  Convert licenses to SPDX expressions
  meta-selftest: libxpm: Fix license
  lib: oe: sbom30: Handle None in Relationship
  oeqa: selftest: bbtest: Fix license exception
  scripts/contrib: Add reuse-get-license.py

 .../python/python3-guessing-game_git.bb       |    2 +-
 .../python3-guessing-game_git.bb.upgraded     |    2 +-
 .../sysdig/sysdig-selftest_0.28.0.bb          |    2 +-
 .../recipes-test/aspell/aspell_0.0.0.1.bb     |    2 +-
 .../devtool/devtool-patch-overrides.bb        |    3 +-
 .../devtool/devtool-test-ignored.bb           |    3 +-
 .../devtool/devtool-test-localonly.bb         |    3 +-
 .../devtool/devtool-test-long-filename.bb     |    3 +-
 .../devtool/devtool-test-reset-re++.bb        |    3 +-
 .../devtool/devtool-test-subdir.bb            |    3 +-
 .../license/incompatible-license-alias.bb     |    2 +-
 .../license/incompatible-licenses.bb          |    2 +-
 .../license/incompatible-nonspdx-license.bb   |    3 +-
 .../recipes-test/logging-test/logging-test.bb |    3 +-
 .../sysroot-test/sysroot-la-test_1.0.bb       |    3 +-
 .../sysroot-test/sysroot-pc-test_1.0.bb       |    3 +-
 .../sysroot-test/sysroot-shebang-test_1.0.bb  |    3 +-
 .../sysroot-test/sysroot-test-arch1_1.0.bb    |    3 +-
 .../sysroot-test/sysroot-test-arch2_1.0.bb    |    3 +-
 .../sysroot-test/sysroot-test_1.0.bb          |    3 +-
 .../recipes-skeleton/libxpm/libxpm_3.5.6.bb   |    2 +-
 meta/classes-global/insane.bbclass            |    8 +-
 meta/classes-global/license.bbclass           |  113 +-
 .../go-mod-update-modules.bbclass             |   21 +-
 meta/classes-recipe/license_image.bbclass     |   31 +-
 meta/classes/buildhistory.bbclass             |    3 +-
 meta/classes/copyleft_filter.bbclass          |    4 +-
 meta/conf/licenses.conf                       |    4 +
 meta/files/common-licenses/389-exception      |    7 +
 meta/files/common-licenses/Asterisk-exception |    5 +
 .../Asterisk-linking-protocols-exception      |   13 +
 .../common-licenses/Autoconf-exception-2.0    |    5 +
 .../common-licenses/Autoconf-exception-3.0    |   26 +
 .../Autoconf-exception-generic                |    4 +
 .../Autoconf-exception-generic-3.0            |    6 +
 .../common-licenses/Autoconf-exception-macro  |   12 +
 .../common-licenses/Bison-exception-1.24      |    4 +
 .../files/common-licenses/Bison-exception-2.2 |    5 +
 .../common-licenses/Bootloader-exception      |   10 +
 .../common-licenses/CGAL-linking-exception    |    4 +
 .../files/common-licenses/CLISP-exception-2.0 |   15 +
 .../common-licenses/Classpath-exception-2.0   |    3 +
 .../Classpath-exception-2.0-short             |   11 +
 .../common-licenses/DigiRule-FOSS-exception   |   54 +
 .../Digia-Qt-LGPL-exception-1.1               |    9 +
 meta/files/common-licenses/FLTK-exception     |   17 +
 .../common-licenses/Fawkes-Runtime-exception  |    1 +
 meta/files/common-licenses/Font-exception-2.0 |    1 +
 meta/files/common-licenses/GCC-exception-2.0  |    1 +
 .../common-licenses/GCC-exception-2.0-note    |   16 +
 meta/files/common-licenses/GCC-exception-3.1  |   33 +
 meta/files/common-licenses/GNAT-exception     |    6 +
 .../common-licenses/GNOME-examples-exception  |    1 +
 .../common-licenses/GNU-compiler-exception    |    6 +
 .../GPL-3.0-389-ds-base-exception             |   10 +
 .../GPL-3.0-interface-exception               |    7 +
 .../common-licenses/GPL-3.0-linking-exception |    3 +
 .../GPL-3.0-linking-source-exception          |    3 +
 meta/files/common-licenses/GPL-CC-1.0         |   46 +
 .../common-licenses/GStreamer-exception-2005  |    1 +
 .../common-licenses/GStreamer-exception-2008  |    1 +
 meta/files/common-licenses/Gmsh-exception     |   16 +
 .../Independent-modules-exception             |   18 +
 .../common-licenses/KiCad-libraries-exception |    1 +
 .../LGPL-3.0-linking-exception                |   16 +
 meta/files/common-licenses/LLGPL              |   56 +
 meta/files/common-licenses/LLVM-exception     |   15 +
 meta/files/common-licenses/LZMA-exception     |    3 +
 meta/files/common-licenses/Libtool-exception  |    1 +
 meta/files/common-licenses/Linux-syscall-note |   12 +
 meta/files/common-licenses/OCCT-exception-1.0 |    3 +
 .../OCaml-LGPL-linking-exception              |    1 +
 .../OpenJDK-assembly-exception-1.0            |   31 +
 meta/files/common-licenses/PCRE2-exception    |    8 +
 .../PS-or-PDF-font-exception-20170817         |    8 +
 .../QPL-1.0-INRIA-2004-exception              |    5 +
 .../common-licenses/Qt-GPL-exception-1.0      |   21 +
 .../common-licenses/Qt-LGPL-exception-1.1     |   22 +
 meta/files/common-licenses/Qwt-exception-1.0  |   12 +
 .../RRDtool-FLOSS-exception-2.0               |   66 +
 meta/files/common-licenses/SANE-exception     |   20 +
 meta/files/common-licenses/SHL-2.0            |   22 +
 meta/files/common-licenses/SHL-2.1            |   49 +
 meta/files/common-licenses/SWI-exception      |    7 +
 .../Simple-Library-Usage-exception            |   33 +
 meta/files/common-licenses/Swift-exception    |    6 +
 meta/files/common-licenses/Texinfo-exception  |    4 +
 meta/files/common-licenses/UBDL-exception     |   59 +
 .../Universal-FOSS-exception-1.0              |   11 +
 .../common-licenses/WxWindows-exception-3.1   |    9 +
 .../cryptsetup-OpenSSL-exception              |   12 +
 meta/files/common-licenses/eCos-exception-2.0 |    3 +
 .../erlang-otp-linking-exception              |   11 +
 meta/files/common-licenses/fmt-exception      |    6 +
 .../common-licenses/freertos-exception-2.0    |   19 +
 .../common-licenses/gnu-javamail-exception    |    1 +
 meta/files/common-licenses/harbour-exception  |   23 +
 .../common-licenses/i2p-gpl-java-exception    |    1 +
 .../common-licenses/kvirc-openssl-exception   |   30 +
 .../common-licenses/libpri-OpenH323-exception |    4 +
 meta/files/common-licenses/mif-exception      |    1 +
 meta/files/common-licenses/mxml-exception     |   16 +
 .../common-licenses/openvpn-openssl-exception |    3 +
 .../files/common-licenses/polyparse-exception |    7 +
 meta/files/common-licenses/romic-exception    |    6 +
 .../common-licenses/rsync-linking-exception   |    6 +
 .../sqlitestudio-OpenSSL-exception            |    9 +
 meta/files/common-licenses/stunnel-exception  |    5 +
 .../common-licenses/u-boot-exception-2.0      |    6 +
 .../common-licenses/vsftpd-openssl-exception  |    5 +
 .../common-licenses/x11vnc-openssl-exception  |    9 +
 meta/files/license-hashes.csv                 |    4 +-
 meta/files/spdx-exceptions.json               |  971 ++++++++++
 meta/lib/oe/license.py                        |  585 +++---
 meta/lib/oe/license_finder.py                 |   10 +-
 meta/lib/oe/sbom30.py                         |    3 +
 meta/lib/oe/spdx30_tasks.py                   |  173 +-
 meta/lib/oe/spdx_license.py                   |  768 ++++++++
 meta/lib/oeqa/selftest/cases/bbtests.py       |    1 +
 meta/lib/oeqa/selftest/cases/devtool.py       |    5 +-
 .../oeqa/selftest/cases/incompatible_lic.py   |   31 +-
 meta/lib/oeqa/selftest/cases/oelib/license.py |  296 ++-
 meta/lib/oeqa/selftest/cases/recipetool.py    |  106 +-
 meta/recipes-bsp/alsa-state/alsa-state.bb     |    2 +-
 meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb     |    2 +-
 meta/recipes-bsp/usbutils/usbutils_019.bb     |    4 +-
 meta/recipes-connectivity/avahi/avahi_0.9.bb  |    2 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |    2 +-
 .../connman/connman-gnome_0.7.bb              |    2 +-
 .../nfs-utils/nfs-utils_2.9.1.bb              |    2 +-
 .../openssh/openssh_10.4p1.bb                 |    2 +-
 meta/recipes-connectivity/ppp/ppp_2.5.3.bb    |    2 +-
 .../slirp/libslirp_4.9.3.bb                   |    2 +-
 .../socat/socat_1.8.1.3.bb                    |    3 +-
 meta/recipes-core/busybox/busybox.inc         |    2 +-
 meta/recipes-core/dbus/dbus-glib_0.114.bb     |    2 +-
 meta/recipes-core/dbus/dbus_1.16.2.bb         |    2 +-
 .../recipes-core/dropbear/dropbear_2026.92.bb |    2 +-
 meta/recipes-core/gettext/gettext_1.0.bb      |    4 +-
 meta/recipes-core/glib-2.0/glib.inc           |    2 +-
 meta/recipes-core/glibc/glibc-common.inc      |    2 +-
 .../initscripts/init-system-helpers_1.69.bb   |    2 +-
 meta/recipes-core/kbd/kbd_2.10.0.bb           |    4 +-
 meta/recipes-core/libxcrypt/libxcrypt.inc     |    2 +-
 meta/recipes-core/musl/bsd-headers.bb         |    2 +-
 meta/recipes-core/musl/musl-locales_git.bb    |    2 +-
 meta/recipes-core/musl/musl-utils.bb          |    2 +-
 meta/recipes-core/newlib/newlib.inc           |    2 +-
 meta/recipes-core/picolibc/picolibc.inc       |    2 +-
 .../sysfsutils/sysfsutils_2.1.1.bb            |    2 +-
 meta/recipes-core/systemd/systemd.inc         |    2 +-
 meta/recipes-core/udev/eudev_3.2.14.bb        |    2 +-
 .../util-linux/util-linux_2.42.2.bb           |   40 +-
 .../autoconf-archive_2024.10.16.bb            |    2 +-
 .../btrfs-tools/btrfs-tools_7.0.bb            |    2 +-
 meta/recipes-devtools/ccache/ccache_4.13.6.bb |    2 +-
 .../cdrtools/cdrtools-native_3.01.bb          |    2 +-
 meta/recipes-devtools/clang/common.inc        |    2 +-
 meta/recipes-devtools/clang/llvm_git.bb       |    2 +-
 .../clang/nativesdk-clang-glue.bb             |    2 +-
 .../cmake/cmake-native_4.4.0.bb               |    2 +-
 meta/recipes-devtools/cmake/cmake_4.4.0.bb    |    2 +-
 .../debugedit/debugedit_5.3.bb                |    2 +-
 .../docbook-xml/docbook-xml-dtd4_4.5.bb       |    2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |    2 +-
 .../elfutils/elfutils_0.195.bb                |   10 +-
 .../erofs-utils/erofs-utils_1.9.2.bb          |    2 +-
 meta/recipes-devtools/expect/expect_5.45.4.bb |    2 +-
 .../fastfloat/fastfloat_8.2.10.bb             |    2 +-
 meta/recipes-devtools/flex/flex_2.6.4.bb      |    2 +-
 meta/recipes-devtools/fmt/fmt_12.2.0.bb       |    2 +-
 meta/recipes-devtools/gcc/gcc-16.1.inc        |    2 +-
 meta/recipes-devtools/gcc/gcc-common.inc      |    1 -
 meta/recipes-devtools/gcc/gcc-runtime.inc     |    4 +-
 meta/recipes-devtools/gcc/gcc-sanitizers.inc  |    2 +-
 meta/recipes-devtools/gcc/libgcc-initial.inc  |    2 +-
 meta/recipes-devtools/gcc/libgcc.inc          |    8 +-
 meta/recipes-devtools/gcc/libgfortran.inc     |    6 +-
 meta/recipes-devtools/gdb/gdb.inc             |    2 +-
 meta/recipes-devtools/git/git_2.55.0.bb       |    2 +-
 .../gnu-config/gnu-config_git.bb              |    2 +-
 .../i2c-tools/i2c-tools_4.4.bb                |    2 +-
 .../libtool/libtool-2.5.4.inc                 |    2 +-
 .../log4cplus/log4cplus_2.2.0.1.bb            |    2 +-
 meta/recipes-devtools/orc/orc_0.4.42.bb       |    2 +-
 .../perl-cross/perlcross_1.6.4.bb             |    2 +-
 .../perl/libmodule-build-perl_0.4234.bb       |    2 +-
 .../perl/libtest-fatal-perl_0.018.bb          |    2 +-
 .../perl/libtest-needs-perl_0.002010.bb       |    2 +-
 .../perl/libtest-warnings-perl_0.038.bb       |    2 +-
 .../recipes-devtools/perl/libxml-perl_0.08.bb |    2 +-
 .../perl/libxml-simple-perl_2.25.bb           |    2 +-
 meta/recipes-devtools/perl/perl_5.42.2.bb     |    2 +-
 .../python/python-pycryptodome.inc            |    2 +-
 .../python/python3-cryptography-vectors.bb    |    2 +-
 .../python/python3-cryptography.bb            |    2 +-
 .../python/python3-docutils_0.23.bb           |    4 +-
 .../python/python3-dtc_1.8.1.bb               |    2 +-
 .../python/python3-idna_3.18.bb               |    2 +-
 .../python/python3-lxml_6.1.1.bb              |    2 +-
 .../python/python3-maturin_1.14.1.bb          |    2 +-
 .../python/python3-numpy_2.5.0.bb             |    2 +-
 .../python/python3-packaging_26.2.bb          |    2 +-
 .../python/python3-pip_26.1.2.bb              |    2 +-
 .../python/python3-poetry-core_2.4.1.bb       |    2 +-
 .../python/python3-pycairo_1.29.0.bb          |    2 +-
 .../python/python3-roman-numerals_4.1.0.bb    |    2 +-
 .../python/python3-sphinx-rtd-theme_3.1.0.bb  |    2 +-
 .../python/python3-sphinx_9.1.0.bb            |    2 +-
 .../python/python3-subunit_1.4.4.bb           |    2 +-
 .../python/python3-uv-build_0.11.28.bb        |    2 +-
 .../qemu/python3-qemu-qmp_0.0.6.bb            |    2 +-
 meta/recipes-devtools/qemu/qemu.inc           |    2 +-
 .../rpm-sequoia/rpm-sequoia_1.10.2.bb         |    2 +-
 meta/recipes-devtools/ruby/ruby_4.0.5.bb      |    2 +-
 meta/recipes-devtools/rust/cargo_1.96.1.bb    |    2 +-
 .../recipes-devtools/rust/libstd-rs_1.96.1.bb |    2 +-
 meta/recipes-devtools/rust/rust_1.96.1.bb     |    2 +-
 meta/recipes-devtools/strace/strace_7.1.bb    |    2 +-
 .../subversion/subversion_1.14.5.bb           |    2 +-
 meta/recipes-devtools/swig/swig_4.4.1.bb      |    2 +-
 .../systemd-bootchart_235.bb                  |    2 +-
 .../tcf-agent/tcf-agent_1.11.0.bb             |    2 +-
 meta/recipes-devtools/tcltk/tcl_9.0.4.bb      |    2 +-
 meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb   |    2 +-
 .../valgrind/valgrind_3.27.1.bb               |    2 +-
 .../acpica/acpica_20260408.bb                 |    2 +-
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |    4 +-
 meta/recipes-extended/cronie/cronie_1.7.2.bb  |    2 +-
 meta/recipes-extended/gawk/gawk_5.4.1.bb      |    2 +-
 meta/recipes-extended/hdparm/hdparm_9.65.bb   |    6 +-
 .../iputils/iputils_20250605.bb               |    2 +-
 .../jansson/jansson_2.15.1.bb                 |    2 +-
 meta/recipes-extended/less/less_704.bb        |    2 +-
 meta/recipes-extended/libidn/libidn2_2.3.8.bb |    4 +-
 meta/recipes-extended/ltp/ltp_20260529.bb     |    2 +-
 meta/recipes-extended/man-db/man-db_2.13.1.bb |    2 +-
 .../man-pages/man-pages_6.18.bb               |    2 +-
 meta/recipes-extended/mdadm/mdadm_4.6.bb      |    2 +-
 meta/recipes-extended/pam/libpam_1.7.2.bb     |    2 +-
 .../perl/libconvert-asn1-perl_0.34.bb         |    2 +-
 .../perl/libtimedate-perl_2.30.bb             |    2 +-
 .../perl/libxml-namespacesupport-perl_1.12.bb |    2 +-
 .../perl/libxml-sax-base-perl_1.09.bb         |    2 +-
 .../perl/libxml-sax-perl_1.02.bb              |    2 +-
 meta/recipes-extended/pigz/pigz_2.8.bb        |    2 +-
 meta/recipes-extended/procps/procps_4.0.6.bb  |    2 +-
 meta/recipes-extended/quota/quota_4.11.bb     |    2 +-
 .../shadow/shadow-sysroot_4.6.bb              |    2 +-
 meta/recipes-extended/sudo/sudo.inc           |    2 +-
 meta/recipes-extended/timezone/timezone.inc   |    2 +-
 meta/recipes-extended/xz/xz_5.8.3.bb          |    8 +-
 meta/recipes-extended/zstd/zstd_1.5.7.bb      |    2 +-
 .../gi-docgen/gi-docgen_2026.1.bb             |    2 +-
 .../gnome/adwaita-icon-theme_50.0.bb          |    2 +-
 .../gobject-introspection_1.86.0.bb           |    2 +-
 meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb      |    2 +-
 meta/recipes-gnome/gtk+/gtk4_4.22.4.bb        |    2 +-
 meta/recipes-graphics/cairo/cairo_1.18.4.bb   |   16 +-
 .../cantarell-fonts_0.303.1.bb                |    2 +-
 .../fontconfig/fontconfig_2.18.2.bb           |    2 +-
 .../freetype/freetype_2.14.3.bb               |    2 +-
 .../glslang/glslang_1.4.350.1.bb              |    2 +-
 .../jpeg/libjpeg-turbo_3.2.0.bb               |    2 +-
 .../libglvnd/libglvnd_1.7.0.bb                |    2 +-
 .../libmatchbox/libmatchbox_1.14.bb           |    2 +-
 .../libsdl2/libsdl2_2.32.10.bb                |    4 +-
 .../recipes-graphics/mesa/mesa-demos_9.0.0.bb |    2 +-
 meta/recipes-graphics/piglit/piglit_git.bb    |    2 +-
 .../spir/spirv-headers_1.4.350.1.bb           |    2 +-
 .../vulkan/vulkan-headers_1.4.350.1.bb        |    2 +-
 .../vulkan-validation-layers_1.4.350.1.bb     |    2 +-
 .../xorg-font/encodings_1.1.0.bb              |    2 +-
 .../xorg-font/font-util_1.4.2.bb              |    2 +-
 .../xorg-font/xorg-minimal-fonts.bb           |    2 +-
 .../xorg-lib/libx11-compose-data_1.8.12.bb    |    2 +-
 .../xorg-lib/libx11_1.8.13.bb                 |    2 +-
 .../xorg-lib/libxfont2_2.0.8.bb               |    2 +-
 .../xorg-lib/libxfont_1.5.4.bb                |    2 +-
 meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb |    2 +-
 .../xorg-lib/libxkbcommon_1.13.2.bb           |    2 +-
 .../recipes-graphics/xorg-lib/libxmu_1.3.1.bb |    2 +-
 meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb |    2 +-
 .../xorg-lib/pixman_0.46.4.bb                 |    2 +-
 .../xorg-lib/xkeyboard-config_2.48.bb         |    2 +-
 .../xorg-xserver/xserver-xorg.inc             |    2 +-
 .../xwayland/xwayland_24.1.13.bb              |    2 +-
 meta/recipes-kernel/dtc/dtc_1.8.1.bb          |    2 +-
 .../kern-tools/kern-tools-native_git.bb       |    2 +-
 meta/recipes-kernel/kmod/kmod_34.2.bb         |    2 +-
 .../libtraceevent/libtraceevent_1.9.0.bb      |    2 +-
 .../linux-firmware/linux-firmware_20260622.bb | 1666 ++++++++---------
 .../linux/linux-yocto-fitimage.bb             |    2 +-
 meta/recipes-kernel/linux/linux-yocto.inc     |    2 +-
 .../recipes-kernel/lttng/babeltrace2_2.1.2.bb |    2 +-
 .../lttng/lttng-modules_2.15.2.bb             |    2 +-
 .../lttng/lttng-tools_2.15.1.bb               |    2 +-
 meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb |    2 +-
 .../alsa/alsa-lib_1.2.16.1.bb                 |    2 +-
 .../alsa/alsa-plugins_1.2.12.bb               |    2 +-
 .../alsa/alsa-tools_1.2.15.bb                 |    2 +-
 .../recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb |    2 +-
 meta/recipes-multimedia/flac/flac_1.5.0.bb    |    2 +-
 .../gstreamer1.0-plugins-bad_1.28.4.bb        |    2 +-
 .../gstreamer1.0-plugins-ugly_1.28.4.bb       |    2 +-
 meta/recipes-multimedia/libtiff/tiff_4.7.2.bb |    2 +-
 .../pulseaudio/pulseaudio.inc                 |    2 +-
 meta/recipes-multimedia/sbc/sbc_2.2.bb        |    2 +-
 meta/recipes-rt/rt-tests/rt-tests_git.bb      |    2 +-
 .../matchbox-desktop/matchbox-desktop_2.3.bb  |    2 +-
 meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb    |    2 +-
 .../sato-screenshot/sato-screenshot_0.3.bb    |    2 +-
 meta/recipes-sato/webkit/webkitgtk_2.52.5.bb  |    2 +-
 .../recipes-support/aspell/aspell_0.60.8.2.bb |    2 +-
 meta/recipes-support/attr/acl_2.4.0.bb        |    2 +-
 meta/recipes-support/attr/attr_2.6.0.bb       |    2 +-
 meta/recipes-support/boost/boost-1.91.0.inc   |    2 +-
 .../ca-certificates_20260601.bb               |    2 +-
 .../debianutils/debianutils_5.23.2.bb         |    2 +-
 meta/recipes-support/gmp/gmp_6.3.0.bb         |    2 +-
 meta/recipes-support/gnupg/gnupg_2.5.20.bb    |    2 +-
 meta/recipes-support/gnutls/gnutls_3.8.13.bb  |    2 +-
 .../recipes-support/gnutls/libtasn1_4.21.0.bb |    2 +-
 meta/recipes-support/gpgme/gpgme_2.1.2.bb     |    4 +-
 meta/recipes-support/hwdata/hwdata_0.409.bb   |    2 +-
 meta/recipes-support/icu/icu_78.3.bb          |    2 +-
 .../libassuan/libassuan_3.0.2.bb              |    2 +-
 .../libatomic-ops/libatomic-ops_7.10.0.bb     |    2 +-
 meta/recipes-support/libbsd/libbsd_0.12.2.bb  |    2 +-
 meta/recipes-support/libcap-ng/libcap-ng.inc  |    2 +-
 meta/recipes-support/libcap/libcap_2.78.bb    |    6 +-
 .../libevent/libevent_2.1.13.bb               |    2 +-
 meta/recipes-support/libfm/libfm_1.3.2.bb     |    2 +-
 .../libgcrypt/libgcrypt_1.12.2.bb             |    6 +-
 meta/recipes-support/libgit2/libgit2_1.9.4.bb |    2 +-
 .../libgpg-error/libgpg-error_1.61.bb         |    2 +-
 meta/recipes-support/libical/libical_4.0.3.bb |    2 +-
 .../libjitterentropy_3.6.3.bb                 |    2 +-
 meta/recipes-support/libksba/libksba_1.8.0.bb |    4 +-
 meta/recipes-support/libmd/libmd_1.2.0.bb     |    2 +-
 .../recipes-support/libpcre/libpcre2_10.47.bb |    2 +-
 .../libunistring/libunistring_1.4.2.bb        |    2 +-
 .../recipes-support/liburcu/liburcu_0.15.6.bb |    2 +-
 meta/recipes-support/lz4/lz4_1.10.0.bb        |    2 +-
 meta/recipes-support/nettle/nettle_4.0.bb     |    2 +-
 .../recipes-support/numactl/numactl_2.0.19.bb |    2 +-
 meta/recipes-support/re2c/re2c_4.5.1.bb       |    2 +-
 meta/recipes-support/taglib/taglib_2.3.bb     |    2 +-
 meta/recipes-support/utfcpp/utfcpp_4.1.1.bb   |    4 +-
 meta/recipes-support/vte/vte_0.84.0.bb        |    2 +-
 meta/recipes-support/xxhash/xxhash_0.8.3.bb   |    2 +-
 scripts/contrib/convert-spdx-licenses.py      |  254 ++-
 scripts/contrib/reuse-get-license.py          |  106 ++
 scripts/lib/recipetool/create.py              |  116 +-
 scripts/lib/recipetool/create_npm.py          |   13 +-
 scripts/pull-spdx-licenses.py                 |  124 +-
 356 files changed, 5205 insertions(+), 1895 deletions(-)
 create mode 100644 meta/files/common-licenses/389-exception
 create mode 100644 meta/files/common-licenses/Asterisk-exception
 create mode 100644 meta/files/common-licenses/Asterisk-linking-protocols-exception
 create mode 100644 meta/files/common-licenses/Autoconf-exception-2.0
 create mode 100644 meta/files/common-licenses/Autoconf-exception-3.0
 create mode 100644 meta/files/common-licenses/Autoconf-exception-generic
 create mode 100644 meta/files/common-licenses/Autoconf-exception-generic-3.0
 create mode 100644 meta/files/common-licenses/Autoconf-exception-macro
 create mode 100644 meta/files/common-licenses/Bison-exception-1.24
 create mode 100644 meta/files/common-licenses/Bison-exception-2.2
 create mode 100644 meta/files/common-licenses/Bootloader-exception
 create mode 100644 meta/files/common-licenses/CGAL-linking-exception
 create mode 100644 meta/files/common-licenses/CLISP-exception-2.0
 create mode 100644 meta/files/common-licenses/Classpath-exception-2.0
 create mode 100644 meta/files/common-licenses/Classpath-exception-2.0-short
 create mode 100644 meta/files/common-licenses/DigiRule-FOSS-exception
 create mode 100644 meta/files/common-licenses/Digia-Qt-LGPL-exception-1.1
 create mode 100644 meta/files/common-licenses/FLTK-exception
 create mode 100644 meta/files/common-licenses/Fawkes-Runtime-exception
 create mode 100644 meta/files/common-licenses/Font-exception-2.0
 create mode 100644 meta/files/common-licenses/GCC-exception-2.0
 create mode 100644 meta/files/common-licenses/GCC-exception-2.0-note
 create mode 100644 meta/files/common-licenses/GCC-exception-3.1
 create mode 100644 meta/files/common-licenses/GNAT-exception
 create mode 100644 meta/files/common-licenses/GNOME-examples-exception
 create mode 100644 meta/files/common-licenses/GNU-compiler-exception
 create mode 100644 meta/files/common-licenses/GPL-3.0-389-ds-base-exception
 create mode 100644 meta/files/common-licenses/GPL-3.0-interface-exception
 create mode 100644 meta/files/common-licenses/GPL-3.0-linking-exception
 create mode 100644 meta/files/common-licenses/GPL-3.0-linking-source-exception
 create mode 100644 meta/files/common-licenses/GPL-CC-1.0
 create mode 100644 meta/files/common-licenses/GStreamer-exception-2005
 create mode 100644 meta/files/common-licenses/GStreamer-exception-2008
 create mode 100644 meta/files/common-licenses/Gmsh-exception
 create mode 100644 meta/files/common-licenses/Independent-modules-exception
 create mode 100644 meta/files/common-licenses/KiCad-libraries-exception
 create mode 100644 meta/files/common-licenses/LGPL-3.0-linking-exception
 create mode 100644 meta/files/common-licenses/LLGPL
 create mode 100644 meta/files/common-licenses/LLVM-exception
 create mode 100644 meta/files/common-licenses/LZMA-exception
 create mode 100644 meta/files/common-licenses/Libtool-exception
 create mode 100644 meta/files/common-licenses/Linux-syscall-note
 create mode 100644 meta/files/common-licenses/OCCT-exception-1.0
 create mode 100644 meta/files/common-licenses/OCaml-LGPL-linking-exception
 create mode 100644 meta/files/common-licenses/OpenJDK-assembly-exception-1.0
 create mode 100644 meta/files/common-licenses/PCRE2-exception
 create mode 100644 meta/files/common-licenses/PS-or-PDF-font-exception-20170817
 create mode 100644 meta/files/common-licenses/QPL-1.0-INRIA-2004-exception
 create mode 100644 meta/files/common-licenses/Qt-GPL-exception-1.0
 create mode 100644 meta/files/common-licenses/Qt-LGPL-exception-1.1
 create mode 100644 meta/files/common-licenses/Qwt-exception-1.0
 create mode 100644 meta/files/common-licenses/RRDtool-FLOSS-exception-2.0
 create mode 100644 meta/files/common-licenses/SANE-exception
 create mode 100644 meta/files/common-licenses/SHL-2.0
 create mode 100644 meta/files/common-licenses/SHL-2.1
 create mode 100644 meta/files/common-licenses/SWI-exception
 create mode 100644 meta/files/common-licenses/Simple-Library-Usage-exception
 create mode 100644 meta/files/common-licenses/Swift-exception
 create mode 100644 meta/files/common-licenses/Texinfo-exception
 create mode 100644 meta/files/common-licenses/UBDL-exception
 create mode 100644 meta/files/common-licenses/Universal-FOSS-exception-1.0
 create mode 100644 meta/files/common-licenses/WxWindows-exception-3.1
 create mode 100644 meta/files/common-licenses/cryptsetup-OpenSSL-exception
 create mode 100644 meta/files/common-licenses/eCos-exception-2.0
 create mode 100644 meta/files/common-licenses/erlang-otp-linking-exception
 create mode 100644 meta/files/common-licenses/fmt-exception
 create mode 100644 meta/files/common-licenses/freertos-exception-2.0
 create mode 100644 meta/files/common-licenses/gnu-javamail-exception
 create mode 100644 meta/files/common-licenses/harbour-exception
 create mode 100644 meta/files/common-licenses/i2p-gpl-java-exception
 create mode 100644 meta/files/common-licenses/kvirc-openssl-exception
 create mode 100644 meta/files/common-licenses/libpri-OpenH323-exception
 create mode 100644 meta/files/common-licenses/mif-exception
 create mode 100644 meta/files/common-licenses/mxml-exception
 create mode 100644 meta/files/common-licenses/openvpn-openssl-exception
 create mode 100644 meta/files/common-licenses/polyparse-exception
 create mode 100644 meta/files/common-licenses/romic-exception
 create mode 100644 meta/files/common-licenses/rsync-linking-exception
 create mode 100644 meta/files/common-licenses/sqlitestudio-OpenSSL-exception
 create mode 100644 meta/files/common-licenses/stunnel-exception
 create mode 100644 meta/files/common-licenses/u-boot-exception-2.0
 create mode 100644 meta/files/common-licenses/vsftpd-openssl-exception
 create mode 100644 meta/files/common-licenses/x11vnc-openssl-exception
 create mode 100644 meta/files/spdx-exceptions.json
 create mode 100644 meta/lib/oe/spdx_license.py
 create mode 100755 scripts/contrib/reuse-get-license.py

-- 
2.54.0


