Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web12.1072.1617290885504960513
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 08:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Jf6PvMmn;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.175, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f175.google.com with SMTP id a8so2123769oic.11
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6bn6fT3QYY+mQPGDXL8SpX0NYF4x7UYN1zOPxXScdAA=;
        b=Jf6PvMmnRhkXQiUzdIyd/1j0OFGdBVwpC/2JX7BpzFCrOssk1LO/cdZNr5VtCIV6ic
         sGtc7l6yNMQ9B1sZTCpXnVq+V/yTr822JEBpEsUfXcFRLXjetf2W7eUzgIDOSQILG1FI
         H3zwEeL7agzwkluAwnSMwFoXr6BqS/sU4fZZGImodgsWOxQxh9Awe85S14uK2oWSGMXW
         XeyJyLspu8gOLR201RvCvp8RUD/f6Q1mRe85ouA0G7gc3/SfXUAZzjNo9JkWLEj8maNv
         fQozPhl/y/uiR0dWfF/gRlWFQayHjEeJ1IPktucjpePQyM1W+boUTTexx7FBpG0vTbcY
         +FMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6bn6fT3QYY+mQPGDXL8SpX0NYF4x7UYN1zOPxXScdAA=;
        b=CfrCWQ0g25d2KtshdK+Hdd3OuzBsIa7PEXBWu0aSy3JE/HTLfauxVPY5VxdQg1+dkg
         3wwTfVMGOPfCbRj7PpQasP+fnZ3Agj1RoCT1BbOAr2QKtzPTkl8b8rmLqxn1n5Z3whL0
         eay8M3RldJd7FFgHSpVXUqUyxt0VVDYBv6b/uUDMGRuM+/eX0NHhcmMd3nvMXVddANwL
         yC758ci9+ERHj74Pr6DviRWLSQHzSw5S8mqScaUFaUgisM3E+7PbrsA6c/LL1RFUrtID
         tiXmSa81WhA4PbXspNx51chxt+q4wDnNXUcOzeJpXISR7qigppRQ9bZMjO0692caDLEu
         FNeg==
X-Gm-Message-State: AOAM530qTJiJLlT9FnqHI2tJxSanRPRAe2CJc09uWDE3nxSPzjhHitP/
	loXHQH6qQnK137HZixOtsbn0Alovtjl5u45jSJ4=
X-Google-Smtp-Source: ABdhPJzgbQIWlpmh/JPH/fBV0UEvn0rgK0xQ4aSwj6bNnzEbccl+uXt+TslkHn+dNBDqFiDyfMrY5A==
X-Received: by 2002:a05:6808:b3b:: with SMTP id t27mr6338702oij.131.1617290884225;
        Thu, 01 Apr 2021 08:28:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id u7sm1159610ooq.13.2021.04.01.08.28.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:28:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/15] Patch review
Date: Thu,  1 Apr 2021 05:27:29 -1000
Message-Id: <cover.1617290309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2019

The following changes since commit 707036d4ec12ef1a260adcef78627b26e32e6540:

  linux-yocto/5.4: update to v5.4.105 (2021-03-24 04:30:32 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Anton D. Kachalov (1):
  run-postinsts: do not remove postinsts directory.

Bruce Ashfield (1):
  linux-yocto/5.4: update to v5.4.107

Catalin Enache (1):
  connman: fix CVE-2021-26675, CVE-2021-26676

Christopher Larson (2):
  buildhistory: add missing vardepsexcludes
  image,populate_sdk_base: move 'func' flag setting for sdk command vars

He Zhe (1):
  cryptodev-module: Backport a patch to fix build failure with kernel
    v5.8

Khem Raj (1):
  documentation-audit.sh: Fix typo in specifying LICENSE_FLAGS_WHITELIST

Mark Hatle (1):
  populate_sdk_ext: Avoid copying and producing .pyc files

Michael Trensch (1):
  linux-firmware: Fix packaging

Mikko Rapeli (1):
  openssl: update to 1.1.1k to fix CVE-2021-3450 and CVE-2021-3449

Mingli Yu (1):
  libtool: make sure autoheader run before autoconf

Minjae Kim (1):
  git: fix CVE-2021-21300

Naveen Saini (1):
  cryptodev-module: fix build failure with kernel v5.10

Robert P. J. Day (2):
  bitbake.conf: correct description of HOSTTOOLS_DIR
  packagegroups: delete useless "PROVIDES" lines

 meta/classes/buildhistory.bbclass             |   3 +
 meta/classes/image.bbclass                    |   2 +-
 meta/classes/populate_sdk_base.bbclass        |   7 +
 meta/classes/populate_sdk_ext.bbclass         |   4 +-
 meta/conf/bitbake.conf                        |   2 +-
 meta/lib/oe/copy_buildsystem.py               |   6 +-
 .../connman/connman/CVE-2021-26675.patch      |  62 ++++
 .../connman/connman/CVE-2021-26676-0001.patch | 231 +++++++++++++
 .../connman/connman/CVE-2021-26676-0002.patch |  33 ++
 .../connman/connman_1.37.bb                   |   3 +
 .../{openssl_1.1.1j.bb => openssl_1.1.1k.bb}  |   2 +-
 .../packagegroups/packagegroup-base.bb        |   1 -
 .../packagegroups/packagegroup-core-nfs.bb    |   1 -
 .../git/files/CVE-2021-21300.patch            | 305 ++++++++++++++++++
 meta/recipes-devtools/git/git.inc             |   4 +-
 .../libtool/libtool-2.4.6.inc                 |   1 +
 ...-sure-autoheader-run-before-autoconf.patch |  35 ++
 .../run-postinsts/run-postinsts/run-postinsts |  10 +-
 .../cryptodev/cryptodev-module_1.10.bb        |   2 +
 .../0001-Fix-build-for-Linux-5.8-rc1.patch    |  49 +++
 .../0001-Fix-build-for-Linux-5.9-rc1.patch    |  42 +++
 .../linux-firmware/linux-firmware_20210208.bb |  41 ++-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 scripts/contrib/documentation-audit.sh        |   2 +-
 26 files changed, 840 insertions(+), 44 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2021-26675.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2021-26676-0001.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2021-26676-0002.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1j.bb => openssl_1.1.1k.bb} (98%)
 create mode 100644 meta/recipes-devtools/git/files/CVE-2021-21300.patch
 create mode 100644 meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.8-rc1.patch
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.9-rc1.patch

-- 
2.25.1

