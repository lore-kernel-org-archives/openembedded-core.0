Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.12831.1614955618084421456
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gXUpdnMR;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id h4so1522556pgf.13
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TZkKvWnrKD//6TMRFqVyoymP4HmCooVgmxnAEQYWNd0=;
        b=gXUpdnMRwjYCt93RMqQU+lqNPfM2I/EyMudR3wWtqy68q+VJuB1a6so7FRjqQeOFKv
         yuAb3SWZGBUm3UptyjeLti7NhgD01hXvADGlSvGJKcdSpLJWl+ig4sHZXm0QuJWjKu+K
         38UQnrVX7mBI6FycdrMS3ETaMD/dG41EB5C59S+RqWtjxbJlC7V4tZlRLVIjdnIItlbg
         gNFyQw5IfYTTHQHAdOpkZSIOvY7X8+EByi93yGRqlJmNTnnzHpBl/+E+qy4AqWY0G7fv
         ZFvYzThH9gQmpjT8tOhekLkGPplnJpwc8OJ/+GXDV7in/6+GfSAxpywyAVOf6gY5mVfX
         d5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TZkKvWnrKD//6TMRFqVyoymP4HmCooVgmxnAEQYWNd0=;
        b=K/H6d8E2qJwI2vH7KLw8dFvnEqsC8lvJ0zfdv37fACQdtrI6YrhZmKDiWPQdsnNHj3
         Ql9sEV3XnYTavcLENkt5pFIckntQ+GGSDleGvDx6e9jlempdC92PaW/fUq8Ekz2VYndg
         vYtIXGqla8Lus4lN9YUQyWMJauA7ItUZDTBR4qXEk8wbVXJeoAjmlg/JvT0nNYTpDEb7
         v1SQ8/RgJE4/i2pofI9nqUTI4HiMffo2zP5e1tIH75al8V5ak5HZHpH+ZnS05LIy3VCD
         5BdrNSLL1Kwsn8VL7Td499qvamySKmJOwXBlsb8LYXKfcX9mfEsMOx++PZGaaudBCDRK
         KpIw==
X-Gm-Message-State: AOAM530vz310pd0JLEfkXmdok2KyqJC+XMmvUkl43vDDGASKTUv35XN3
	8WOwyOM0vj4nVE4p9xcjfkNXSx7KQGwfTrsa
X-Google-Smtp-Source: ABdhPJzt6/QxkUKTYZLCkKO3cvzKo0EqhICYBw76S8BbcTD67TH89pBeH9RBzA1aCkCUFbuFBJdxMA==
X-Received: by 2002:aa7:8758:0:b029:1ed:c13f:f645 with SMTP id g24-20020aa787580000b02901edc13ff645mr9498171pfo.50.1614955616668;
        Fri, 05 Mar 2021 06:46:56 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.46.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:46:56 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/27] Patch review
Date: Fri,  5 Mar 2021 04:46:09 -1000
Message-Id: <cover.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1943

The following changes since commit dd893279f352e290c23577a0f91df1b8c6232f10:

  selftest/reproducible: Don't call sync between each file compare (2021-03-04 04:19:50 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Anuj Mittal (1):
  python3: fix CVE-2021-3177

Dorinda (4):
  meta/recipes-bsp: Add HOMEPAGE / DESCRIPTION
  meta/recipes-connectivity: Add HOMEPAGE / DESCRIPTION
  meta/recipes-devtools: Add HOMEPAGE / DESCRIPTION
  meta/recipes-core: Add HOMEPAGE / DESCRIPTION

Jan-Simon Möller (1):
  reproducible_builds: SOURCE_DATE_EPOCH should not be 0

Lee Chee Yang (1):
  libsdl2: fix CVE-2020-14409 CVE-2020-14410

Martin Jansa (1):
  sstatesig.py: show an error instead of warning when sstate manifest
    isn't found

Milan Shah (1):
  report-error.bbclass: Add layer and bitbake version info to error
    report

Minjae Kim (2):
  bind: fix CVE-2020-8625
  librepo: fix CVE-2020-14352

Peter Kjellerstedt (1):
  asciidoc: Switch to using the main branch

Richard Purdie (12):
  linux-firmware: upgrade 20201218 -> 20210208
  image: Add directories to PSEUDO_IGNORE_PATHS
  populate_sdk: Add directories to PSEUDO_IGNORE_PATHS
  bitbake.conf/image: Move image specific PSEUDO_IGNORE_PATHS to image
    class
  bitbake.conf: Split PSEUDO_IGNORE_PATHS to be more readable
  maintainers: Update email address for Victor
  libevdev: Update patch status to backport
  ca-certificates: Clean up two patches and submit upstream
  libpcre: Drop old/stale patch
  reproducible: Improve SOURCE_DATE_EPOCH_FALLBACK handling
  package/package_rpm: Disable font_provides configuration for
    reproducibilty
  cups: Fix reproducibility issues

Scott Murray (1):
  screen: fix CVE-2021-26937

Stefan Ghinea (1):
  wpa-supplicant: fix CVE-2021-0326

Wang Mingyu (1):
  openssl: upgrade 1.1.1i -> 1.1.1j

 meta/classes/image.bbclass                    |   2 +
 meta/classes/package.bbclass                  |   2 +-
 meta/classes/package_rpm.bbclass              |   1 +
 meta/classes/populate_sdk_base.bbclass        |   2 +-
 meta/classes/report-error.bbclass             |   4 +
 meta/classes/reproducible_build.bbclass       |  15 +-
 meta/conf/abi_version.conf                    |   2 +-
 meta/conf/bitbake.conf                        |   5 +-
 meta/conf/distro/include/maintainers.inc      |   6 +-
 meta/lib/oe/reproducible.py                   |   8 +-
 meta/lib/oe/sstatesig.py                      |   2 +-
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.11.bb    |   1 +
 meta/recipes-bsp/opensbi/opensbi_0.6.bb       |   1 +
 meta/recipes-bsp/v86d/v86d_0.1.10.bb          |   1 +
 .../bind/bind/CVE-2020-8625.patch             |  17 ++
 .../recipes-connectivity/bind/bind_9.11.22.bb |   2 +
 .../libnss-mdns/libnss-mdns_0.14.1.bb         |   1 +
 .../mobile-broadband-provider-info_git.bb     |   1 +
 .../{openssl_1.1.1i.bb => openssl_1.1.1j.bb}  |   2 +-
 .../ppp-dialin/ppp-dialin_0.1.bb              |   1 +
 .../wpa-supplicant/CVE-2021-0326.patch        |  45 +++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |   2 +
 .../base-passwd/base-passwd_3.5.29.bb         |   1 +
 meta/recipes-core/dbus-wait/dbus-wait_git.bb  |   1 +
 meta/recipes-core/dropbear/dropbear.inc       |   1 +
 meta/recipes-core/ell/ell_0.33.bb             |   1 +
 meta/recipes-core/fts/fts_1.2.7.bb            |   1 +
 meta/recipes-core/ifupdown/ifupdown_0.8.35.bb |   1 +
 meta/recipes-core/kbd/kbd_2.2.0.bb            |   1 +
 meta/recipes-core/udev/eudev_3.2.9.bb         |   1 +
 meta/recipes-devtools/apt/apt.inc             |   1 +
 .../cdrtools/cdrtools-native_3.01.bb          |   1 +
 .../recipes-devtools/dejagnu/dejagnu_1.6.2.bb |   1 +
 .../desktop-file-utils_0.24.bb                |   3 +-
 .../devel-config/distcc-config.bb             |   1 +
 meta/recipes-devtools/distcc/distcc_3.3.3.bb  |   1 +
 .../dmidecode/dmidecode_3.2.bb                |   1 +
 meta/recipes-devtools/dnf/dnf_4.2.2.bb        |   1 +
 meta/recipes-devtools/dpkg/dpkg.inc           |   2 +
 .../dwarfsrcfiles/dwarfsrcfiles.bb            |   1 +
 .../elfutils/elfutils_0.178.bb                |   1 +
 meta/recipes-devtools/fdisk/gptfdisk_1.0.4.bb |   1 +
 meta/recipes-devtools/gcc/gcc-common.inc      |   1 +
 meta/recipes-devtools/gdb/gdb-common.inc      |   1 +
 meta/recipes-devtools/git/git.inc             |   1 +
 meta/recipes-devtools/glide/glide_0.13.3.bb   |   3 +-
 .../gnu-config/gnu-config_git.bb              |   1 +
 .../help2man/help2man-native_1.47.11.bb       |   3 +-
 .../i2c-tools/i2c-tools_4.1.bb                |   1 +
 .../nativesdk-icecc-toolchain_0.1.bb          |   1 +
 .../intltool/intltool_0.51.0.bb               |   2 +
 meta/recipes-devtools/jquery/jquery_3.5.0.bb  |   1 +
 .../libcomps/libcomps_0.1.15.bb               |   2 +
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb |   2 +
 .../libmodulemd/libmodulemd-v1_git.bb         |   2 +
 .../librepo/librepo/CVE-2020-14352.patch      |  55 +++++
 .../librepo/librepo_1.11.2.bb                 |   3 +
 .../makedevs/makedevs_1.0.1.bb                |   1 +
 meta/recipes-devtools/mmc/mmc-utils_git.bb    |   1 +
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |   1 +
 meta/recipes-devtools/nasm/nasm_2.15.03.bb    |   2 +
 meta/recipes-devtools/ninja/ninja_1.10.0.bb   |   1 +
 meta/recipes-devtools/opkg/opkg_0.4.2.bb      |   1 +
 meta/recipes-devtools/orc/orc_0.4.31.bb       |   1 +
 .../patchelf/patchelf_0.10.bb                 |   9 +-
 meta/recipes-devtools/perl/perl_5.30.1.bb     |   1 +
 meta/recipes-devtools/pseudo/pseudo.inc       |   1 +
 .../python-numpy/python-numpy.inc             |   2 +
 .../python/python3/CVE-2021-3177.patch        | 191 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |   2 +
 meta/recipes-devtools/rsync/rsync_3.1.3.bb    |   1 +
 .../run-postinsts/run-postinsts_1.0.bb        |   1 +
 .../squashfs-tools/squashfs-tools_git.bb      |   2 +
 meta/recipes-devtools/strace/strace_5.5.bb    |   1 +
 .../subversion/subversion_1.13.0.bb           |   1 +
 .../syslinux/syslinux_6.04-pre2.bb            |   1 +
 .../systemd-bootchart_233.bb                  |   6 +
 .../tcf-agent/tcf-agent_git.bb                |   1 +
 meta/recipes-devtools/tcltk/tcl_8.6.10.bb     |   1 +
 meta/recipes-devtools/unfs3/unfs3_git.bb      |   1 +
 meta/recipes-devtools/unifdef/unifdef_2.12.bb |   1 +
 meta/recipes-devtools/vala/vala.inc           |   2 +-
 .../valgrind/valgrind_3.15.0.bb               |   1 +
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   |   3 +-
 .../asciidoc/asciidoc_8.6.9.bb                |   2 +-
 meta/recipes-extended/cups/cups.inc           |   2 +
 meta/recipes-extended/groff/groff_1.22.4.bb   |   1 -
 .../screen/screen/CVE-2021-26937.patch        |  68 +++++++
 meta/recipes-extended/screen/screen_4.8.0.bb  |   1 +
 .../watchdog/watchdog_5.15.bb                 |   1 -
 .../libsdl2/CVE-2020-14409-14410.patch        |  79 ++++++++
 .../libsdl2/libsdl2_2.0.12.bb                 |   1 +
 .../xorg-font/xorg-minimal-fonts.bb           |   2 -
 ...20201218.bb => linux-firmware_20210208.bb} |   4 +-
 .../ca-certificates/sbindir.patch             |  10 +-
 ...pdate-ca-certificates-support-Toybox.patch |  21 +-
 .../libevdev/libevdev/determinism.patch       |   3 +-
 .../libpcre/fix-pcre-name-collision.patch     |  41 ----
 meta/recipes-support/libpcre/libpcre_8.44.bb  |   1 -
 99 files changed, 613 insertions(+), 86 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1i.bb => openssl_1.1.1j.bb} (98%)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-0326.patch
 create mode 100644 meta/recipes-devtools/librepo/librepo/CVE-2020-14352.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-3177.patch
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2021-26937.patch
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/CVE-2020-14409-14410.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20201218.bb => linux-firmware_20210208.bb} (99%)
 delete mode 100644 meta/recipes-support/libpcre/libpcre/fix-pcre-name-collision.patch

-- 
2.25.1

