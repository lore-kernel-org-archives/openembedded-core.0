Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.10705.1608301087932491678
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 06:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TlYKGm/Q;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id x2so2007075ybt.11
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 06:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=be8UEk+vvYexaEVmNv37s2zAOeFMeneiSu45fcxWo0M=;
        b=TlYKGm/Q4zYfRdrQOxiKNGwakmeg3nEVlmbCwIvNKzld9+r225uXTKqcgC92ZAYEds
         H5/BzryH7jBQALSbgm8LrOjCBssumM4l2bfcehZu6+VQ6ir0p/Q4crFP00nVpxUkh3pm
         iArNcZxcZb89x9oJozokfg2WHKnNy5ib5f5B9gE0dWUl36BmfypNEg1hgCh+oI5NZxgw
         soFGoyoKZjKXVT+DuN1u07JqlAqXH9hBGR+JSP8TkxrqagFyRKRsQC/C2BaQmFMoN0PL
         HAFOPRskWn9Wav9hAlun+LLocG424seq5Sh+nEBlsYjcrVjt2m4+ifPN6GBJ/nWxp2XC
         l0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=be8UEk+vvYexaEVmNv37s2zAOeFMeneiSu45fcxWo0M=;
        b=sjKWPced/CT43UR3HeC7rbIN6zWtAYRInC4DYEmGYGy1fpVMk0iT/vkRsjdavqNUFL
         XNgfYTI8/6UtP16mUd0OVkC5gB7gUDqmnO2YM8dwOisNiXn03+FQb8nVpVYRBxV6OfZ4
         gnWa3xaCmVGSMyBhxEc5t0qSfGdBruEabhk0OhycGapJBoQAUnRXmvLo1OTUwB6vs0eG
         VuE1NzGuE3a4cEWB7mTM4MjNLZsNppqA+FbnxC5bE7Z9gl/lLyRmkA55F3GHlwJtvtkZ
         PVnXOGflkC6+MhjS3FnEOiJeB4eDiKZIEk6JcOaUgX6BdMQFFDpRwIzzAgNLZDrLRUQU
         3qsw==
X-Gm-Message-State: AOAM533z0Am7ppXTEYkswyQcOoNQt4imFCl9jWz6Tbs2vrmmDfKefBTs
	GHM1UB+i2mJH/1yzksKN+iaGBos9cvjBlk6fEYKV67yF
X-Google-Smtp-Source: ABdhPJzLhYSUVoPw7sTrQcQ50uMhc7gEwfoymOVNDcFojb4dZo71eau9MrXyCoQ4G5JgwtVla07pNobiwV5P639SsVE=
X-Received: by 2002:a25:db4b:: with SMTP id g72mr5833210ybf.430.1608301081868;
 Fri, 18 Dec 2020 06:18:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1608175306.git.steve@sakoman.com>
In-Reply-To: <cover.1608175306.git.steve@sakoman.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Fri, 18 Dec 2020 04:17:51 -1000
Message-ID: <CAGDS+nn-SU04qRXa+tw4mO6E2VnHTJFu45b3Ofb+QZO5YC+Spw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/28] Pull request (cover letter only)
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Gentle reminder ;-)

On Wed, Dec 16, 2020 at 5:24 PM Steve Sakoman <steve@sakoman.com> wrote:
>
>
> The following changes since commit e216b2223cbe8c459348262f98b3cfbe79d12023:
>
>   go: update to 1.14.12 (2020-12-03 07:35:27 -1000)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
>
> Alexander Kanavin (7):
>   meta/lib/oe/reproducible.py: gitsm:// works just as fine as git:// for
>     timestamps
>   llvm: fix reproducibility
>   ruby: fix reproducibility
>   webkitgtk: fix reproducibility
>   ffmpeg: fix reproducibility
>   serf: do not install the static library
>   llvm: sort the lists in generated source reproducibibly
>
> Andrej Valek (2):
>   kernel-dummy: fix executing unexpected tasks
>   python3: fix CVE-2019-20907
>
> Brett Warren (1):
>   libffi: add patch to revert clang VFP workaround
>
> Changqing Li (1):
>   buildtools-tarball: add wic dependency into extended buildtools
>
> Dmitry Baryshkov (2):
>   linux-firmware: upgrade 20201022 -> 20201118
>   linux-firmware: package ath11k firmware
>
> Gratian Crisan (1):
>   kernel-module-split.bbclass: fix kernel modules getting marked as
>     CONFFILES
>
> Hongxu Jia (1):
>   glib-networking/btrfs-tools/dosfstools/parted/bmap-tools/libsoup-2.4:
>     add nativesdk support
>
> Lee Chee Yang (3):
>   glibc: fix CVE-2020-29562
>   qemu: fix CVE-2020-25723
>   binutils: fix CVE-2020-16592/16598
>
> Mark Jonas (1):
>   libsdl2: Add directfb to PACKAGECONFIG rdepends
>
> Richard Purdie (2):
>   lz4: Use the new branch naming from upstream
>   metadata_scm: Fix signature handling of METADATA_REVISION and
>     METADATA_BRANCH
>
> Ross Burton (5):
>   oeqa/devtool: use Yocto mirror for pv-1.5.3 tarball
>   devtool: remove unused variable
>   image_types: sort tarball file listings
>   cve-update-db-native: handle all-wildcard versions
>   coreutils: add SUSE-specific issues to CVE whitelist
>
> sangeeta jain (1):
>   meta/lib/oeqa/manual/oe-core.json: Update test_bitbake_devshell
>
> zangrc (1):
>   wireless-regdb: upgrade 2020.04.29 -> 2020.11.20
>
>  meta/classes/image_types.bbclass              |   2 +-
>  meta/classes/kernel-module-split.bbclass      |   5 +-
>  meta/classes/metadata_scm.bbclass             |   2 +
>  meta/lib/oe/reproducible.py                   |   2 +-
>  meta/lib/oeqa/manual/oe-core.json             |   2 +-
>  meta/lib/oeqa/selftest/cases/devtool.py       |   2 +-
>  meta/recipes-core/coreutils/coreutils_8.31.bb |   3 +
>  .../glib-networking/glib-networking_2.62.4.bb |   2 +-
>  .../glibc/glibc/CVE-2020-29562.patch          | 156 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.31.bb         |   1 +
>  .../meta/buildtools-extended-tarball.bb       |   3 +
>  .../recipes-core/meta/cve-update-db-native.bb |   7 +-
>  .../binutils/binutils-2.34.inc                |   2 +
>  .../binutils/binutils/CVE-2020-16592.patch    |  61 +++++++
>  .../binutils/binutils/CVE-2020-16598.patch    |  32 ++++
>  .../btrfs-tools/btrfs-tools_5.4.1.bb          |   2 +-
>  .../dosfstools/dosfstools_4.1.bb              |   2 +-
>  ...r-sort-ClassInfo-lists-by-name-as-we.patch |  31 ++++
>  meta/recipes-devtools/llvm/llvm_git.bb        |   8 +-
>  ...20-8492-Fix-AbstractBasicAuthHandler.patch |   0
>  .../python/python3/CVE-2019-20907.patch       |  44 +++++
>  meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
>  meta/recipes-devtools/qemu/qemu.inc           |   1 +
>  .../qemu/qemu/CVE-2020-25723.patch            |  52 ++++++
>  ...e.in-do-not-write-host-cross-cc-item.patch |  32 ++++
>  meta/recipes-devtools/ruby/ruby_2.7.1.bb      |   1 +
>  meta/recipes-extended/parted/parted_3.3.bb    |   2 +-
>  .../libsdl2/libsdl2_2.0.12.bb                 |   2 +-
>  ...20201022.bb => linux-firmware_20201118.bb} |  11 +-
>  meta/recipes-kernel/linux/linux-dummy.bb      |   4 +-
>  ....04.29.bb => wireless-regdb_2020.11.20.bb} |   2 +-
>  ...e-assembly-with-full-path-from-sourc.patch |  97 +++++++++++
>  .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |   6 +
>  meta/recipes-sato/webkit/webkitgtk_2.28.2.bb  |  12 ++
>  .../bmap-tools/bmap-tools_3.5.bb              |   2 +-
>  ...m-sysv-reverted-clang-VFP-mitigation.patch | 104 ++++++++++++
>  meta/recipes-support/libffi/libffi_3.3.bb     |   1 +
>  .../libsoup/libsoup-2.4_2.68.4.bb             |   2 +-
>  meta/recipes-support/lz4/lz4_1.9.2.bb         |   2 +-
>  meta/recipes-support/serf/serf_1.3.9.bb       |   5 +
>  scripts/lib/devtool/standard.py               |   1 -
>  41 files changed, 688 insertions(+), 21 deletions(-)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-29562.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2020-16592.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2020-16598.patch
>  create mode 100644 meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
>  rename meta/recipes-devtools/python/{files => python3}/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch (100%)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2019-20907.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch
>  create mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20201022.bb => linux-firmware_20201118.bb} (99%)
>  rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2020.04.29.bb => wireless-regdb_2020.11.20.bb} (94%)
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch
>  create mode 100644 meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
>
> --
> 2.17.1
>
>
> 
>
