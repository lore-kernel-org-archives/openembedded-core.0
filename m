Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.319.1611254583687873511
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 10:43:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BHHAUq2A;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id y8so1775340plp.8
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 10:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dn6DhcQd4KBghfGTtn+IfYRg7E/mKt0sVCC6xuTIVJY=;
        b=BHHAUq2Af2lulj/gsSApNWjDnBnCSQQZd/aU8OizOg86OXdBVmQYAKi4Hq5qamYMCo
         tiuan+EgUuZDeE9fpWINCmiHQ0M87nKEnHNzCwbpdPjAlXR+DUv8ops9VhoS54CJN3HP
         Vv5xTj0ndCg5kvICQyz4v+ybPinGwWG3GMroIukngwf+54pe5XErnJW/fKS1tcF4ISB3
         OS3T94C8K8l1tfdL0YuTzsF/+DNw2TqyE6ZGQPewbTyTJRpgAV4CWB1UeCdA78kRk7PX
         6cJuD1eLttEQ4GasR42z+UrfKvvYUxiM6Z1ihG7T5wzTRCA3T+4Wr9MZLjEG80rHDK8D
         vgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dn6DhcQd4KBghfGTtn+IfYRg7E/mKt0sVCC6xuTIVJY=;
        b=f7X6KyMW78yrSbdfPmjOBjsP4WR43THIjunNUmKPuvUX/uItN4dIMr0zhjTcs9oWN9
         rkjEPIjMo5rAIl1SSyfnX1Od1n3Blv+VtclhEujEx4YeoqbvH3AVbgSJvcQOw9Uv/ri2
         ROC2OvTTDIcX93JuGTpuVLNRcHevKL82n/XLciTeYFfPwC1XUdlORHJW+urA74bi/7GJ
         KXWcAMxgoomsSIBbT8de9B9fxHVkg+iGYlDfuMv8xFtgQODUZkpTaBequ7oX3Z54zmES
         VL+/ALYB3Oo4/gsNn8MjG7wXJeT1lOIjRw0g4cIOz/fAfdQBdhLXZdX2yGrqD+vxCAEv
         od8Q==
X-Gm-Message-State: AOAM531dfmu2J52jmAlH1Aa+ZD9nH+UAouk3xalp3RnC+PdYKKw4IRYD
	osJRs6Iihai/UPDQZJdapJFhDfU6n50dwJwXrQA=
X-Google-Smtp-Source: ABdhPJwXxQ8c4SuiXjchKDS1lztL70x83K9U5nFSs2plQPLMHQkdEFhWW8PWLY4v8Z458axdOAcVOQ==
X-Received: by 2002:a17:902:d48f:b029:de:8c5b:656 with SMTP id c15-20020a170902d48fb02900de8c5b0656mr1020472plg.51.1611254582363;
        Thu, 21 Jan 2021 10:43:02 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id k15sm6096237pfh.40.2021.01.21.10.42.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 10:43:01 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/18] Pull request (cover letter only)
Date: Thu, 21 Jan 2021 08:42:40 -1000
Message-Id: <cover.1611254395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 72431ee8de5e3a53d259cebf420a7713ac9e1f14:

  mobile-broadband-provider-info: upgrade 20190618 ->20201225 (2021-01-08 03:57:37 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Adrian Herrera (1):
  scripts: oe-run-native, fix *-native directories

Andrey Mozzhuhin (1):
  toolchain-shar-extract.sh: Handle special characters in script path

Armin Kuster (2):
  xorg: Security fix for CVE-2020-14345
  glibc: Security fix for CVE-2020-29573

Bruce Ashfield (1):
  linux-yocto/5.4: update to v5.4.87

Chris Laplante (1):
  systemd.bbclass: improve error message when a service unit specified
    in SYSTEMD_SERVICE is not found

Joshua Watt (1):
  classes/waf: Add build and install arguments

Lee Chee Yang (1):
  curl: fix CVE-2020-8231/8284/8285/8286

Mans Rullgard (1):
  boost: drop arm-intrinsics.patch

Marek Vasut (2):
  meta: toolchain-shar-relocate.sh: Do not use $target_sdk_dir as regex
  meta: toolchain-shar-relocate.sh: Filter out post-relocate-setup
    script

Michael Ho (1):
  license_image.bbclass: fix missing recipeinfo on self

Mikko Rapeli (1):
  zip: whitelist CVE-2018-13410 and CVE-2018-13684

Robert Joslyn (1):
  ppp: Whitelist CVE-2020-15704

Ross Burton (1):
  waf: don't assume the waf intepretter is good

Scott Murray (1):
  glibc: CVE-2019-25013

Thomas Perrot (1):
  go.bbclass: don't stage test data with sources of dependencies

Tomasz Dziendzielski (1):
  lib/oe/utils: Return empty string in parallel_make

 meta/classes/go.bbclass                       |    3 +-
 meta/classes/license_image.bbclass            |    3 +-
 meta/classes/systemd.bbclass                  |    3 +-
 meta/classes/waf.bbclass                      |   18 +-
 meta/files/toolchain-shar-extract.sh          |   12 +-
 meta/files/toolchain-shar-relocate.sh         |    5 +-
 meta/lib/oe/utils.py                          |    2 +-
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb    |    4 +
 .../glibc/glibc/CVE-2019-25013.patch          |  135 ++
 .../glibc/glibc/CVE-2020-29573.patch          |  128 ++
 meta/recipes-core/glibc/glibc_2.31.bb         |    2 +
 meta/recipes-extended/zip/zip_3.0.bb          |    6 +
 .../xserver-xorg/CVE-2020-14345.patch         |  182 +++
 .../xorg-xserver/xserver-xorg_1.20.8.bb       |    1 +
 .../linux/linux-yocto-rt_5.4.bb               |    6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |    8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   22 +-
 .../boost/boost/arm-intrinsics.patch          |   55 -
 meta/recipes-support/boost/boost_1.72.0.bb    |    2 +-
 .../curl/curl/CVE-2020-8231.patch             | 1092 +++++++++++++++++
 .../curl/curl/CVE-2020-8284.patch             |  209 ++++
 .../curl/curl/CVE-2020-8285.patch             |  260 ++++
 .../curl/curl/CVE-2020-8286.patch             |  133 ++
 meta/recipes-support/curl/curl_7.69.1.bb      |    4 +
 scripts/oe-run-native                         |    2 +-
 25 files changed, 2207 insertions(+), 90 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-29573.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14345.patch
 delete mode 100644 meta/recipes-support/boost/boost/arm-intrinsics.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8231.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8284.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8285.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8286.patch

-- 
2.25.1

