Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4334.1792537066864803063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 15:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=FuYuczFw;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so1081295e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 15:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792537065; x=1793141865; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PseoKtMibSYTOej4yJRKiHYG+y7aQ4SxQ2CcFs9yLAA=;
        b=FuYuczFw9LccQYZQoxoD0RNHsWjpbKj1tGfQ0tT/u8wH71Rf1hdThieS0mlZrLl36J
         zh4BMNIigMIMSqDDZp+tGCahZLhakANLygFxeB+Mk3mnOic6+8RoBtfM96NdufMZvA3Y
         Tq6LovmACp9FIOr2Rft4PyQKgyefh0xIl+s19pmIYW6tNsUGWVjxmD9CW4bAaUZaXJAH
         /pQvYb14qmF0NYfAGRyJGUMfp8Nks19RM7rahNICrIx/WG52KOCGEigfK8dZqlUWRysO
         XOlKdk4G0yom9S5LQcYyxZSUNc2dVWfJpczCIfnVwFeGVZJHEfj6VnqBu+qgqoc/va9O
         GCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792537065; x=1793141865;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PseoKtMibSYTOej4yJRKiHYG+y7aQ4SxQ2CcFs9yLAA=;
        b=OFrbgUE3CYQIwvctiXepP4vVnjiqm4zFi8v6YKWC3yAI95VFe4mBpwvZK7ayOayG5q
         v6NIgFhOyTeZbO7CVP50M/Ji/M1NP8yr8GwQMRcgrRYGcxcAlunUXontc2FJEPwzeFgO
         XczBTdwiKN96vGjThsov+pBIRNaepHcjRFtO3FtD/TJD3fzduubkSYimsM7AY30x+Ub4
         w5GTD+4YHOeIw0puImgn3t+lEbO7ZH+AYCHkgd1gIR2tHh4wPbP29u7sZx/8FbiJ9n5T
         4dBLlBEUvih7VE3reeYy9oAlPwiywIf8bfRTY/hg1JaMWqOOtEcnBk/hZQMyV6imFUAK
         e2ww==
X-Gm-Message-State: AFq9FYJG2ynuNvCSeiZBT+wuN6nig0lh9RHJoTZ7PFMD5IPDp5napdA4
	DxQmkNfoSORTgKtn7KoZxgl14uDd4F9oJyIYmec1wTvPiBX42sia0t2ptrXl51oNVnzUQ2bY7DC
	xhitGyJA=
X-Gm-Gg: AYBFou2XthYlrqHibfkFbq2n8XN9otGnCwtSPX6g1feli/zdq1FUauXuz4sAVDnIys1
	3lzxGFggYf3zK57pbrVNjD6Y9EcmtsEvlXR/xVEPkRcjmIqKG21dOtK+JieQ3HNGAVUI+yNAa7o
	Eg4aezmshXxK21usroNzdZYTSsEH4ywz5d8dW+NiWgI1Ue1itewCpgIvUfk/HMRJe19uwUZDkt/
	1yfmPgXn+FIBy1T1dqZ/mS9KMBIeXgIYX9boxP3QBV4yJIqrkMSQDLxUaay5gTgUDMT+M/eP4OL
	DGebeYGcBq0zA0wLFChMvJIpYEre613ciZPCY/JGJRXndFA6BF3rzWNkOR6gShlGm5NWz4HUFmW
	BHR0nwdjIUYLgWG7F3JpKMOROtSJ3KKEwPviBrRFmW4RSyq7tzcyPnSNwuBvrrHz+c0FNoB+dgt
	RIAfhrrtLgHZ6CrLQEqlB6lgxjbSsRq4xLgAmMHAhN4NtK8gGSBhN6aU4rU+pp0fIHyDmjzs2o+
	1KVEuc/TlVyCC2143QZg4Goat1uf1/W1Gd3kOP1EvJkctIZUKowE90aSbEJqg0u0cfK5fcwCA==
X-Received: by 2002:a05:600c:310b:b0:4a1:e7c2:9f48 with SMTP id 5b1f17b1804b1-4a1fdaef8c6mr3182325e9.10.1792537064788;
        Tue, 20 Oct 2026 15:57:44 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd629bbsm10699895e9.5.2026.10.20.15.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:57:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][blacksail 00/17] Pull request (cover letter only)
Date: Wed, 21 Oct 2026 00:57:33 +0200
Message-ID: <cover.1792536987.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 22:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248314
Content-Type: text/plain; charset="utf-8"

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1792189264.git.yoann.congal@smile.fr/

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4944
* oe-selftest-debian failed with 16455 – AB-INT: Can't clone file://oe-core in devtool tests
  retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/5079
* oe-selftest-armhost failed with 16456 – AB-INT: "unparsed line" error in devtool /tmp/ clone of oe-core
  retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/23/builds/5110

The following changes since commit e182a0c4b91fd459c1f9dece0c7c23f7f9eaa7ab:

  recipes-support/gnutls: disable slow tests for RISCV64 (2026-10-06 22:31:54 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/blacksail-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/blacksail-next

for you to fetch changes up to a4461e117c1c501b7021d20c1380e4187fcda4c1:

  barebox: inherit upstream-stable-release-point (2026-10-16 14:49:39 +0200)

----------------------------------------------------------------

Daniel Turull (1):
  lib/oe/recipeutils: honor stable_upgrade for UPSTREAM_CHECK_COMMITS
    recipes

Darsh Kelaiya (1):
  python3-click: depend on python3-shell for shlex

Frieder Schrempf (1):
  sqlite3: Fix host include path leaking in with readline/editline

Hemanth Kumar M D (1):
  gcc: Fix for CVE-2026-102010

Jaipaul Cheernam (1):
  kea: Upgrade 3.2.0 -> 3.2.1

Kris Gavvala (1):
  nasm: fix CVE-2026-6067

Lucas Stach (1):
  barebox: inherit upstream-stable-release-point

Mathieu Dubois-Briand (1):
  libpcre2: Remove testoutput3C file

Peter Marko (7):
  popt: patch CVE-2026-18743
  popt: patch CVE-2026-18739
  libpng: upgrade 1.6.58 -> 1.6.59
  expat: patch CVE-2026-102633
  expat: patch CVE-2026-77214
  glibc: stable 2.44 branch updates to 34106fee69
  go: upgrade 1.27.1 -> 1.27.2

Richard Purdie (1):
  python3-mako: upgrade 1.4.1 -> 1.4.3

Ross Burton (1):
  tcl: skip timing-sensitive clock tests

 meta/lib/oe/recipeutils.py                    |  25 ++-
 meta/recipes-bsp/barebox/barebox.bb           |   2 +-
 ...-qualifiers-to-OpenSSL-X509-pointers.patch |  49 -----
 ...se-a-runtime-safe-interpreter-string.patch |   8 +-
 .../0001-mk_cfgrpt.sh-strip-prefixes.patch    |   2 +-
 ...er_unittest_support.cc-do-not-write-.patch |   2 +-
 .../kea/files/fix-multilib-conflict.patch     |   2 +-
 .../kea/{kea_3.2.0.bb => kea_3.2.1.bb}        |   3 +-
 .../expat/expat/CVE-2026-102633.patch         |  68 +++++++
 .../expat/expat/CVE-2026-77214.patch          | 106 +++++++++++
 meta/recipes-core/expat/expat_2.8.5.bb        |   2 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/glibc/glibc_2.44.bb         |   3 +-
 meta/recipes-devtools/gcc/gcc-16.2.inc        |   1 +
 .../gcc/gcc/0026-CVE-2026-102010.patch        |  71 +++++++
 .../go/{go-1.27.1.inc => go-1.27.2.inc}       |   2 +-
 ...e_1.27.1.bb => go-binary-native_1.27.2.bb} |   6 +-
 ..._1.27.1.bb => go-cross-canadian_1.27.2.bb} |   0
 ...{go-cross_1.27.1.bb => go-cross_1.27.2.bb} |   0
 ...osssdk_1.27.1.bb => go-crosssdk_1.27.2.bb} |   0
 ...runtime_1.27.1.bb => go-runtime_1.27.2.bb} |   0
 ...ent-based-hash-generation-less-pedan.patch |   8 +-
 ...3-ld-add-soname-to-shareable-objects.patch |   6 +-
 ...d-go-make-GOROOT-precious-by-default.patch |   2 +-
 ...ut-build-specific-paths-from-linker-.patch |   4 +-
 ...est-skip-when-cpu.max-is-not-availab.patch |   6 +-
 .../go/{go_1.27.1.bb => go_1.27.2.bb}         |   0
 .../nasm/nasm/CVE-2026-6067.patch             |  36 ++++
 meta/recipes-devtools/nasm/nasm_3.02.bb       |   1 +
 .../python/python3-click_8.5.0.bb             |   1 +
 ...n3-mako_1.4.1.bb => python3-mako_1.4.3.bb} |   2 +-
 meta/recipes-devtools/tcltk/tcl/run-ptest     |   2 +
 meta/recipes-devtools/tcltk8/tcl8/run-ptest   |   2 +
 ...ts-stream-per-test-results-to-stdout.patch |   2 +-
 .../{libpng_1.6.58.bb => libpng_1.6.59.bb}    |   2 +-
 .../libpcre/libpcre2/testoutput3C             | 174 ------------------
 .../recipes-support/libpcre/libpcre2_10.49.bb |   2 -
 .../popt/popt/CVE-2026-18739.patch            |  92 +++++++++
 .../popt/popt/CVE-2026-18743.patch            |  97 ++++++++++
 meta/recipes-support/popt/popt_1.19.bb        |   4 +-
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |   4 +-
 41 files changed, 532 insertions(+), 269 deletions(-)
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-Add-const-qualifiers-to-OpenSSL-X509-pointers.patch
 rename meta/recipes-connectivity/kea/{kea_3.2.0.bb => kea_3.2.1.bb} (96%)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-102633.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-77214.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-CVE-2026-102010.patch
 rename meta/recipes-devtools/go/{go-1.27.1.inc => go-1.27.2.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.27.1.bb => go-binary-native_1.27.2.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.27.1.bb => go-cross-canadian_1.27.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.27.1.bb => go-cross_1.27.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.27.1.bb => go-crosssdk_1.27.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.27.1.bb => go-runtime_1.27.2.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.27.1.bb => go_1.27.2.bb} (100%)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch
 rename meta/recipes-devtools/python/{python3-mako_1.4.1.bb => python3-mako_1.4.3.bb} (88%)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.58.bb => libpng_1.6.59.bb} (97%)
 delete mode 100644 meta/recipes-support/libpcre/libpcre2/testoutput3C
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18739.patch
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18743.patch

