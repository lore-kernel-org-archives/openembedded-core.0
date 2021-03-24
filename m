Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.178.1616596773330607940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=urtHE9jE;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so1270268pjb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U3MRpsfzTukn7jnulnyk+R/nlPhmooMLDkUcr2yUHLs=;
        b=urtHE9jEeprzCDtvhL4c1egLaBxlhiPyYVbWgf+mL3FeFivTgwfRsd/lBKUUPN2zO6
         2Yx5r7dMHSO9a2a6KIubY+wTjUsLvbWppXrAFaHP4Gm/dybsbX/ZQ3bmS56xRd2iCREU
         pwFzLzSWGaRxsfigqxa52pSJxW35yG/jVzuYG7HRqO5U3y5U/Te64q7UuQoBc1RFBjeH
         ah60YMQPV5AcEIaCrk0wvH4w1xpFrh859aUQRQAHh4hC+pbI2N3xKsMGT5XhPBoEK+Yg
         8TpKe+m99vTuM7kabwF3/DZTbNYSRqd0GQ/OdICS3SFKe3KBeVFLO7Xe3v9EQVAU7yyn
         C9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U3MRpsfzTukn7jnulnyk+R/nlPhmooMLDkUcr2yUHLs=;
        b=BzT9c+8R6e8dZW/xI/TL20BMShaehgPXM5uJAgBbvgP5uW44pJcFe8Sb0Yct5kU9zD
         hfHC7Ou99pPPuG6Dtix4v9uLi/+ZU1+OVXQFTkXDBLEht2oNYn6Fd4L9NNMXALB+aS7w
         8gjfpTtiDC6zznkP7TnuPQoamG3r9XREBTyZYaH16JKHmaXSvfkG34uvma4FWtcAziV9
         o8LV3BERNzxZ7bE/zUOgL4mcs/aaVr1nSch1aNHGJp9RcowDgYs8evej5xEWcbwt7gfu
         +CbTFlZPlq7gstFhruEcaN4sODPNCtbKNBEWqrhIV+oMwtHdXooVjU0TOmoypwyUfLVf
         wMOg==
X-Gm-Message-State: AOAM533olBRpxxFROeRj7VUyLfKkYdn9MBYGhEod8L5fyUow+qrXZNE0
	InnUTiG1girLhTL0rnf4zdKcjctDHrzf3IlH
X-Google-Smtp-Source: ABdhPJxz6bK5wrP81uRRdNcDZakemHeExChkdTRqAHVZ1wcBc7iqPCLrHRsY6xNDDUhD7ARbyrHDZQ==
X-Received: by 2002:a17:903:30cd:b029:e6:a1fa:403b with SMTP id s13-20020a17090330cdb02900e6a1fa403bmr3765173plc.43.1616596772168;
        Wed, 24 Mar 2021 07:39:32 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.39.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:39:31 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/21] Patch review
Date: Wed, 24 Mar 2021 04:38:55 -1000
Message-Id: <cover.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1992

The following changes since commit 7c88d52eaca62237afcda606a3078ec483992213:

  cups: use /run instead /var/run in systemd's unit file (2021-03-11 05:00:02 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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

