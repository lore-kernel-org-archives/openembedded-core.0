Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BACC433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 15:20:47 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.9699.1638458445941592680
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 07:20:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WdeWO7iO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 133so9228307pgc.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 07:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vMDeFWu3KTi8m8qVcv/rrQyR7zb9OD8QAvuGwsEoOWU=;
        b=WdeWO7iOMDENxkGOvTFnkzIPPTB+SU5R9uCvbhDwt9fJMnY9fGeXjMyCDughv7pG3W
         dL5MbCgwt61gNxPnTjzR3D9gEBuGELHAdW3oj5RkRPBVjq0v7bVOb1zBdk5QlpN62XjL
         G8yWFghT6v9lQApga0VC0ZZEjvSTlucmq5+DEihBfg2Rz6r7Hf9tvBe3UwByCSkt/7pM
         Y8N+Baw3+isV72zvOXU9tmh5y3TRSvFze1gWDwAoEBIqaiN2gO51AQLmiQjwHIQA7Puk
         chTI7AEsqYp0N0JkjauIFYTRH0ALZAdgP0u5Esawzt6gaYveSKSgIF4s9yl1X7DikfXx
         SCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vMDeFWu3KTi8m8qVcv/rrQyR7zb9OD8QAvuGwsEoOWU=;
        b=YFa2fMoIEmSC4sgbSzjLCRLngc9FNlaHU8Srg3J9HYTXa+g7J7OS8V4G699qHuoXo+
         M2p4+/KScrxl4qliQXjyYOm5nMFgZhxqud44wZ/HGfFiTK3XwhrISmernS+qXpzO0T+g
         9e/wuHh4dlfmmpaaiOQs6qQqnK2dNlmsIbgE0/iItHjxPH3x4KFx2XOCeJddQMagbA34
         C9GbdHafPWHGeAtZfumIMEFEH7xCUET3OCwKtqTXyIOt+IXMwXvLxFRvMeSOuJPwKzls
         EP/9ULWU+7GmWKFFe1FSYjuAWkgv/seW91i9H/R9umIA3f5on8WcM2c6e5YR1d99c+3C
         gPGg==
X-Gm-Message-State: AOAM533PMbFMv3ZHAeUyxHxvILJiYQKFtcW5QlgzZbz1vVKWgWJj1dh0
	c7RQdmN3wrWBTrtEUGxRCrwXmaYS90Y4ZGySHeo=
X-Google-Smtp-Source: 
 ABdhPJwp47pBBZIEv+Zx4DdRM5tfyuH7s6vlIWNRGtPmwkqfuhaNGDUyEwq+4xGAdx2BolLTLPC35w==
X-Received: by 2002:a63:8749:: with SMTP id i70mr9796185pge.379.1638458441338;
        Thu, 02 Dec 2021 07:20:41 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g14sm7994pgo.88.2021.12.02.07.20.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:20:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/25] Pull request (cover letter only)
Date: Thu,  2 Dec 2021 05:20:05 -1000
Message-Id: <cover.1638458103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 15:20:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159091

After some discussion with Richard on #yocto irc we've decided to drop the patch
status updates from this series.

The following changes since commit 44b1970c40e9d73f6e63fb10cdc55837a26f5921:

  build-appliance-image: Update to dunfell head revision (2021-11-15 15:00:44 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (2):
  linux-firmware: upgrade 20210919 -> 20211027
  libpcre/libpcre2: correct SRC_URI

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
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |   1 +
 .../openssh/openssh_8.2p1.bb                  |   2 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/os-release/os-release.bb    |   4 +-
 meta/recipes-core/systemd/systemd_244.5.bb    |   2 +
 .../git/files/CVE-2021-40330.patch            | 108 ++++++++++++++++++
 meta/recipes-devtools/git/git.inc             |   4 +-
 .../{python3_3.8.11.bb => python3_3.8.12.bb}  |   4 +-
 meta/recipes-extended/cups/cups.inc           |   2 +-
 ...20210919.bb => linux-firmware_20211027.bb} |   4 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 ++--
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |   2 +-
 .../gmp/gmp/cve-2021-43618.patch              |  27 +++++
 meta/recipes-support/gmp/gmp_6.2.0.bb         |   1 +
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
 36 files changed, 712 insertions(+), 96 deletions(-)
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


