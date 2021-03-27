Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web09.1461.1616886244011879639
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Mar 2021 16:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iwvIOiWU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.41, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f41.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so8729704otk.5
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Mar 2021 16:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gIGKaGaULLAbwzzUdre3RDiQ3/C+kF2QoNt9M7xg1HQ=;
        b=iwvIOiWUWo5AtOjE5V2Jc+a2xBevAb74lPFDEHajn5+9z/k4p+yYQfB6vnjHQ+gdnY
         JBKlD6G9Q5uX+9O/P5ZWKuegbID1MnZcd7PA95SLbZXDf3gYrrLQv8IJvQzCsxWrEOdo
         Ke4rJiNC4h9gEAZLfb54LybjXo8VTOywEjjpUEGE1b+Rt3D1M+4Flv4yf6gvibrjzaqZ
         L4ZWLJCKwpJ/eJR87c1TKPWBIr5lhiLD3eMpYOpY6r6Htzv7mdVq7dSunxLwps3iHDc5
         9Iq4YyKujw77om1QEaKDLgLpRRU3qTg8mypd9tjiqi3A0Ivcz+msxbw0fpTZTpdtbSgr
         wvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gIGKaGaULLAbwzzUdre3RDiQ3/C+kF2QoNt9M7xg1HQ=;
        b=D966f01iaFoyruYGQpERDYLmjqNjn4C4G2vSNkuCYj7meIdrACtJF9FOLmQu39I+zy
         Xa/l0ylCdJfeIAclhzkEf5yc2dGCsGaa/YIfnT4+Atd7T55XOigCwIZFPsuIxQ5eYX2y
         o4qn3Qp5SrhNPbQWyPShw2GFlScq+Vwcv5OQscgAXOyV/+apOZlcN6w+nkTVEUg7DrM3
         n7IHSB9nCrh9h40/TegH6fLBqQjShVvqvVqceeU6m7OmRggXh/6pG5f/d9RWHiA0TB9N
         9A2W9NIiQhwHAIM/Q/u0zmYYolqoZWE/+rzNlVYughFUmYb1bgQL1I9n0hC9HjlVe5Ls
         ovyg==
X-Gm-Message-State: AOAM531ojg0qz0SR64HJhE2uK0sTZdh1h+60qe/pt5l2JQZON+vr7WqU
	wbG/OphuZZgA9Fhyapu5p+hz1lZMGobwYgat
X-Google-Smtp-Source: ABdhPJysGJM/A1YkEKHZq7MbJ6b6wxk4ljCoTUpVT9FIz17NQIVcKEMjsU3FIHdnzu3XctgUkyh4jw==
X-Received: by 2002:a05:6830:1d4c:: with SMTP id p12mr16685895oth.96.1616886242465;
        Sat, 27 Mar 2021 16:04:02 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id b9sm2836772ooa.47.2021.03.27.16.03.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 16:04:02 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/21] Pull request (cover letter only)
Date: Sat, 27 Mar 2021 13:03:42 -1000
Message-Id: <cover.1616886143.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 7c88d52eaca62237afcda606a3078ec483992213:

  cups: use /run instead /var/run in systemd's unit file (2021-03-11 05:00:02 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alejandro Hernandez Samaniego (1):
  devtool: Fix do_kernel_configme task

Anatol Belski (1):
  glibc: Pull latest 2.31 HEAD

Bruce Ashfield (1):
  linux-yocto/5.4: update to v5.4.105

Chee Yang Lee (1):
  initrdscripts: init-install-efi.sh install extra files for ESP

Chen Qi (1):
  populate_sdk_ext: record METADATA_REVISION

Denys Dmytriyenko (1):
  maintainers: update own email address

Diego Santa Cruz (1):
  iputils: fix various arping regressions

Dorinda Bassey (2):
  meta-selftest: Add HOMEPAGE / DESCRIPTION
  devshell.bbclass: Exceptions displayed within devpyshell

Douglas Royds (2):
  cmake: Fully-qualified path to ar
  externalsrc: Detect code changes in submodules

Lee Chee Yang (2):
  cve-update-db-native: consider version suffix when update CVE db
  cve-check: CVE_VERSION_SUFFIX to work with patched release

Li Wang (1):
  linux-dummy: add empty dependent packages

Martin Jansa (2):
  iso-codes: fix protocol in SRC_URI
  wpa-supplicant: update CVE-2021-27803.patch

Petr Vorel (1):
  scripts/verify-bashisms: Update checkbashisms.pl URL

Richard Purdie (1):
  selftest/wic: Fix dependency issue in rawcopy test

Robert P. J. Day (1):
  bitbake-whatchanged: change ending quote to proper period

Stefan Schmidt (1):
  systemd-conf: do not ask for DHCP if configured on kernel command line

Steve Sakoman (1):
  Revert "sstatesig.py: show an error instead of warning when sstate
    manifest isn't found"

 .../recipes-test/aspell/aspell_0.0.0.1.bb     |   1 +
 meta/classes/cmake.bbclass                    |   3 +-
 meta/classes/devshell.bbclass                 |   1 +
 meta/classes/externalsrc.bbclass              |  16 +-
 meta/classes/linux-dummy.bbclass              |  26 +++
 meta/classes/populate_sdk_ext.bbclass         |   3 +
 meta/conf/distro/include/maintainers.inc      |  40 ++---
 meta/lib/oe/cve_check.py                      |   7 +-
 meta/lib/oe/sstatesig.py                      |   2 +-
 meta/lib/oeqa/selftest/cases/cve_check.py     |   8 +
 meta/lib/oeqa/selftest/cases/wic.py           |  18 +-
 .../wpa-supplicant/CVE-2021-27803.patch       |  12 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/glibc/CVE-2019-25013.patch          | 135 ---------------
 .../glibc/glibc/CVE-2020-29562.patch          | 156 ------------------
 meta/recipes-core/glibc/glibc_2.31.bb         |   6 +-
 .../initrdscripts/files/init-install-efi.sh   |   5 +
 .../recipes-core/meta/cve-update-db-native.bb |   7 +-
 .../systemd/systemd-conf/wired.network        |   1 +
 .../systemd/systemd-conf_244.3.bb             |   3 -
 ...rtially-fix-sent-vs-received-package.patch |  39 +++++
 ...fix-f-quit-on-first-reply-regression.patch |  39 +++++
 ...rison-of-different-signedness-warnin.patch |  37 +++++
 ...ccess-when-unsolicited-ARP-mode-dest.patch |  45 +++++
 ...ional-timerfd-to-control-when-timeou.patch |  94 +++++++++++
 .../iputils/iputils_s20190709.bb              |   5 +
 meta/recipes-extended/sudo/sudo.inc           |   2 +
 meta/recipes-kernel/linux/linux-dummy.bb      |   2 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +--
 .../iso-codes/iso-codes_4.4.bb                |   2 +-
 scripts/bitbake-whatchanged                   |   2 +-
 scripts/lib/devtool/standard.py               |   7 +-
 scripts/verify-bashisms                       |   2 +-
 35 files changed, 401 insertions(+), 363 deletions(-)
 create mode 100644 meta/classes/linux-dummy.bbclass
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-29562.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-arping-revert-partially-fix-sent-vs-received-package.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/0002-arping-fix-f-quit-on-first-reply-regression.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/0003-arping-Fix-comparison-of-different-signedness-warnin.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/0004-arping-return-success-when-unsolicited-ARP-mode-dest.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/0005-arping-use-additional-timerfd-to-control-when-timeou.patch

-- 
2.25.1

