Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.12709.1617719234675244156
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 07:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=SHMd4YmK;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.176, mailfrom: steve@sakoman.com)
Received: by mail-il1-f176.google.com with SMTP id p8so8883746ilm.13
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Apr 2021 07:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Mak7459Ba0RHNaGrohhEvKSl8hWbtSo7POXb8iXO4M=;
        b=SHMd4YmK3JPXRqVd1DnMPYKxPWx4cLDZO9MlqmQVjPKWnhNSz4Bz1LdBG93gFKLPHt
         r+/3AeqNak+6BR4yfWe3XHlYfVWpS3Ek99ipMPbnVK+Dn2ZaIJXjlLZ0VANJ7USy/qKw
         P6Fx5RhNJtbL8MqQt92jUsCS9KDTZuUStlf/kjriSqNpo1Q/f7llYfuc6i6BIQS+KCDn
         g5TQvjD1f1ggYmj+JsNnF+UF+uOW1A3aDEPH5rJGBk3LKoWNvQGMHtltkoufTBZr73ys
         dBp+AIwuOJGsMzYoNkxVTh6Na7Cf2ZaWqQAQPw5yvzy1e7QGCVq1AIvV4Jgn+zGw5zjx
         30HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Mak7459Ba0RHNaGrohhEvKSl8hWbtSo7POXb8iXO4M=;
        b=itZmySQpGkn7Vnlzeqg30q5p8bbmEfgY/JXiBfRIGcs29O8V3I94EzLKvqungEkOLo
         8OpBRfz9yd3ny6IHSxutUEDZSiv4zwEyDaB3IhqfHEFkzxXceoFpWmcid1tx2N+FaJin
         gcv/YLDHLAH+l54W3ssrlEo6qf4A8TW9O932T6VNsHXekGQqGxaPfxW1SnTO1BUlcjdP
         aK7nuJp9KI/invEQZnINGHRrFgOyrCJ/q4UdlXfenJ/UKVau2YogVQfDcPgazC0lSHuQ
         5sFC7Tl37ic0JUfq8Fu4fhGWQN6MAMRk5cInwnqfdrfs6GvdL3D2UQbXyfMguezBweWe
         ypTA==
X-Gm-Message-State: AOAM530ihOAUESsLl+mgtZFRvmQxAWdyDeFeKEhMJ/Xrxkdl2fOAxgwA
	YagkQ/SybYD3xIYArJOOx0V42qM0EsV4CRhurcs=
X-Google-Smtp-Source: ABdhPJy1znfmsLr3IEjoD92pELmKzfk5N5fb0r31C1Jgo70YNS45BSl2pvygnF86RQr3mXIyLpIhYw==
X-Received: by 2002:a05:6e02:1b85:: with SMTP id h5mr24068615ili.134.1617719233588;
        Tue, 06 Apr 2021 07:27:13 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id z12sm12902277ilb.18.2021.04.06.07.27.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 07:27:13 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Pull request (cover letter only)
Date: Tue,  6 Apr 2021 04:26:48 -1000
Message-Id: <cover.1617719029.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 707036d4ec12ef1a260adcef78627b26e32e6540:

  linux-yocto/5.4: update to v5.4.105 (2021-03-24 04:30:32 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

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

Robert P. J. Day (1):
  bitbake.conf: correct description of HOSTTOOLS_DIR

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
 24 files changed, 840 insertions(+), 42 deletions(-)
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

