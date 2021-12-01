Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C46C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 22:40:59 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.621.1638398458680993105
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 14:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1LXYvUSs;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id f125so11841376pgc.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 14:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U+xuMA252qcLWslzblVrJ8jv3HlR8HssOiSVjuU/bJE=;
        b=1LXYvUSskkpGqpzr1on2WkGEKzgJAO0f9s0MMtk/SbxlU0DVjg+RUYyoqsuj5Ghf3s
         ct8UCa9Bh1gtUveWpcoKJ7w7F2brYkU+anFVR6X/pDo1/XQ3ZvscS0PSqR6A9f9jrKLJ
         fmDyt93u1Kj+PH1ykbYDo36iBYZtEKDEGSihUoJbdUVJVGvsb5TKiOxuurchZoRMl5vq
         pvrIAXYPEF7sO96q/iB65pqfo3GG43AslBaxxOtTohB18JBztudIZvibcODxt8dQX00G
         WltWU3/WFikdV3l9MeR7E+xfgARgZcIpyMfo7lRiu4vl1r3OFFxTsEOaWauebgTfbe7k
         HtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U+xuMA252qcLWslzblVrJ8jv3HlR8HssOiSVjuU/bJE=;
        b=URIKcNpgv/3XKKOvSJzd6j81MD8DFxBvzgauOk6X27i4ij55HFUKJO5lkciAOSfAi8
         bQ1FuxIGVtOTDPzBofy08uNOPlORN6ce+/JXqEIEQlVjA8fjO6n/oMwISJ6U34Qxp6aS
         bUsxZH664xVEnZmGvfVIvZX4JM08HVgWxga+3tFeEsE+uq0sb0OxtuaiU2+7D2v0BLnA
         Al5mD+1Ejc2RgbkldxgTUShxCj6O/79ropk7STv8IFBWmK0QrFfectZSiek2BpzJyJGU
         Uo0o9GuMRmh3DgQFCD+UQQZbqT9v+kSvod0cY7nJimymXNHVBiIZuN+mYdrkH+xKeo9+
         vkIQ==
X-Gm-Message-State: AOAM530tYCCIH0ymf0caq2T05cMecz8lB/SG0A7gNkZo+JIKY+kEeSyD
	r26Cj8bD7obVuZqSfuZar0Lk2o8dtuI53M1dTII=
X-Google-Smtp-Source: 
 ABdhPJzV4Ovjhbr4/9gIlo5QSukMuaUKnEzhoQHqpbWVU1qHZX0+V0NfAdCykfN3ySPC9+kOwdKKOg==
X-Received: by 2002:a63:8f02:: with SMTP id n2mr7062883pgd.270.1638398457249;
        Wed, 01 Dec 2021 14:40:57 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k2sm937464pfc.53.2021.12.01.14.40.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 14:40:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/40] Pull request (cover letter only)
Date: Wed,  1 Dec 2021 12:40:26 -1000
Message-Id: <cover.1638386573.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 22:40:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159065

The following changes since commit 44b1970c40e9d73f6e63fb10cdc55837a26f5921:

  build-appliance-image: Update to dunfell head revision (2021-11-15 15:00:44 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (17):
  linux-firmware: upgrade 20210919 -> 20211027
  libpcre/libpcre2: correct SRC_URI
  curl: submit patch upstream
  libxml2: submit patch upstream
  cracklib: patches submitted upstream
  docbook-xml: patch is not upstreamable
  lrzsz: patch is not upstreamable
  valgrind: mark ptest-specific patch as inappropriate
  systemd-bootchart: submit musl patches upstream
  libxml2: mark patch as non-upstreamable
  libgpg-error: mark patch as non-upstreamable
  valgrind: submit patch upstream
  webkitgtk: submit patches upstream
  weston: submit patch upstream
  db: mark all patches as non-upstreamable
  unzip/zip: mark all patches as non-upstreamable
  slang: mark patch as inappropriate for upstream submission

Anuj Mittal (1):
  glibc-version.inc: remove branch= from GLIBC_GIT_URI

Bruce Ashfield (4):
  linux-yocto/5.4: update to v5.4.154
  linux-yocto/5.4: update to v5.4.155
  linux-yocto/5.4: update to v5.4.156
  linux-yocto/5.4: update to v5.4.158

Claus Stovgaard (1):
  cups: Fix missing installation of cups sysv init scripts

Daniel Gomez (1):
  os-release: Add DISTRO_CODENAME as vardeps for do_compile

Denys Dmytriyenko (1):
  make-mod-scripts: pass CROSS_COMPILE to configure and build

Jon Mason (1):
  scripts/lib/wic/help.py: Update Fedora Kickstart URLs

Khem Raj (1):
  lrzsz: Use Cross AR during compile

Marta Rybczynska (1):
  python3: upgrade 3.8.11 -> 3.8.12

Minjae Kim (1):
  git: fix CVE-2021-40330

Peter Bergin (1):
  systemd: add packageconfig for wheel-group

Richard Purdie (2):
  scripts/oe-package-browser: Handle no packages being built
  reproducible_build/package_XXX: Ensure SDE task is in dependency chain

Ross Burton (5):
  vim: fix CVE-2021-3796, CVE-2021-3872, and CVE-2021-3875
  vim: add patch number to CVE-2021-3778 patch
  vim: fix CVE-2021-3927 and CVE-2021-3928
  gmp: fix CVE-2021-43618
  openssh: remove redundant BSD license

Steve Sakoman (1):
  Revert "vim: fix 2021-3796"

Wang Mingyu (1):
  openssh: Improve LICENSE to show BSD license variants.

Yi Zhao (1):
  oeqa: fix warnings for append operators combined with +=

 meta/classes/package_deb.bbclass              |   4 +-
 meta/classes/package_ipk.bbclass              |   3 +-
 meta/classes/package_rpm.bbclass              |   3 +-
 meta/classes/reproducible_build.bbclass       |   2 +
 meta/lib/oeqa/runtime/cases/ksample.py        |   2 +-
 meta/lib/oeqa/selftest/cases/imagefeatures.py |   2 +-
 ...mpilation-using-autoconf-detected-AR.patch |  36 ++++++
 .../lrzsz-0.12.20/autotools-update.patch      |   2 +-
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |   1 +
 .../openssh/openssh_8.2p1.bb                  |   2 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../libxml2/libxml-m4-use-pkgconfig.patch     |   6 +-
 .../recipes-core/libxml/libxml2/runtest.patch |   2 +-
 meta/recipes-core/os-release/os-release.bb    |   4 +-
 meta/recipes-core/systemd/systemd_244.5.bb    |   2 +
 .../docbook-xml-update-catalog.xml.patch      |   2 +-
 .../git/files/CVE-2021-40330.patch            | 108 ++++++++++++++++++
 meta/recipes-devtools/git/git.inc             |   4 +-
 .../{python3_3.8.11.bb => python3_3.8.12.bb}  |   4 +-
 ...is-glibc-specific-use-raw-signature-.patch |   2 +-
 .../0002-musl-does-not-provide-printf-h.patch |   2 +-
 ...s-not-provide-canonicalize_file_name.patch |   2 +-
 .../0004-Fix-out-of-tree-builds.patch         |   2 +-
 ...est-wrapper-to-support-PTEST-formats.patch |   2 +-
 ...port-dictionary-byte-order-dependent.patch |   2 +-
 ...aklib-fix-testnum-and-teststr-failed.patch |   2 +-
 meta/recipes-extended/cups/cups.inc           |   2 +-
 .../slang/slang/terminfo_fixes.patch          |   4 +-
 .../unzip/unzip/avoid-strip.patch             |   2 +-
 .../unzip/unzip/define-ldflags.patch          |   2 +-
 .../unzip/unzip/fix-security-format.patch     |   2 +-
 .../unzip/unzip/symlink.patch                 |   2 +-
 .../zip/zip-3.0/fix-security-format.patch     |   2 +-
 ...ovide-a-default-version-that-doesn-t.patch |   2 +-
 ...20210919.bb => linux-firmware_20211027.bb} |   4 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 ++--
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |   2 +-
 ...spection.cmake-prefix-variables-obta.patch |   2 +-
 ...cy-parallel-build-of-WebKit2-4.0.gir.patch |   2 +-
 ...trospection-files-add-CMAKE_C_FLAGS-.patch |   2 +-
 ...-replace-krb5-config-with-pkg-config.patch |   2 +-
 ...tibility-by-renaming-atomic_init-API.patch |   2 +-
 ...cal-__atomic_compare_exchange-to-avo.patch |   2 +-
 ...001-clock-Do-not-define-own-timespec.patch |   2 +-
 ...plicit-tag-options-to-libtool-invoca.patch |   2 +-
 .../db/db/fix-parallel-build.patch            |   2 +-
 .../recipes-support/db/db/sequence-type.patch |   2 +-
 .../gmp/gmp/cve-2021-43618.patch              |  27 +++++
 meta/recipes-support/gmp/gmp_6.2.0.bb         |   1 +
 .../libgpg-error/libgpg-error/pkgconfig.patch |   2 +-
 .../recipes-support/libpcre/libpcre2_10.34.bb |   2 +-
 meta/recipes-support/libpcre/libpcre_8.44.bb  |   2 +-
 ...1-reading-character-past-end-of-line.patch |  62 ++++++++++
 ...28-using-freed-memory-when-replacing.patch |  83 ++++++++++++++
 ...eading-uninitialized-memory-when-giv.patch |  63 ++++++++++
 ...llegal-memory-access-if-buffer-name-.patch |  86 ++++++++++++++
 ...ml_get-error-after-search-with-range.patch |  72 ++++++++++++
 ...nvalid-memory-access-when-scrolling-.patch |  97 ++++++++++++++++
 .../vim/files/CVE-2021-3778.patch             |  24 +++-
 .../vim/files/CVE-2021-3796.patch             |  50 --------
 meta/recipes-support/vim/vim.inc              |  10 +-
 scripts/lib/wic/help.py                       |   4 +-
 scripts/oe-pkgdata-browser                    |   2 +
 65 files changed, 747 insertions(+), 125 deletions(-)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2021-40330.patch
 rename meta/recipes-devtools/python/{python3_3.8.11.bb => python3_3.8.12.bb} (99%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210919.bb => linux-firmware_20211027.bb} (99%)
 create mode 100644 meta/recipes-support/gmp/gmp/cve-2021-43618.patch
 create mode 100644 meta/recipes-support/vim/files/0001-patch-8.2.3581-reading-character-past-end-of-line.patch
 create mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3428-using-freed-memory-when-replacing.patch
 create mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3582-reading-uninitialized-memory-when-giv.patch
 create mode 100644 meta/recipes-support/vim/files/0003-patch-8.2.3487-illegal-memory-access-if-buffer-name-.patch
 create mode 100644 meta/recipes-support/vim/files/0004-patch-8.2.3489-ml_get-error-after-search-with-range.patch
 create mode 100644 meta/recipes-support/vim/files/0005-patch-8.2.3564-invalid-memory-access-when-scrolling-.patch
 delete mode 100644 meta/recipes-support/vim/files/CVE-2021-3796.patch

-- 
2.25.1


