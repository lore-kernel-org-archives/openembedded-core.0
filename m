Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.23215.1599747463173153121
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 07:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Rp3HluUc;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id u3so85998pjr.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 07:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eduQYbyVukeHFADfXnw0Qku51fJbny58Lx0QI4fuNIM=;
        b=Rp3HluUcJL0AwNIie1rn36KvLSX9HaUhLTahKhg2IB1joK78V3pM23SkgmgWiysBqK
         K9F04u1FIZAqFo8D2JomQ0tVdpEZauu+uzZpMstLN6mR2EUhhZnUinvwvFBGwKHJciAQ
         gfBeO9vi9hr/CqZCEcmKkFV79mM9128E0rIko7eAMzs4DegAKIttLbnZduy3qEXw4hk6
         fJBLrvv5VqwXyhLR7vApd2ecC6wDhSUYWOMUnZcFvSpxeOW34dX5N3QQk8gaxgFRTAtB
         uSQZoTpN1WkvrBuLcqWNmnKa5zBJmaD9DtmFV6MMIyurFAIYfdzf5nXWNxT/lERQEuIk
         ahgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eduQYbyVukeHFADfXnw0Qku51fJbny58Lx0QI4fuNIM=;
        b=EL5m0qKtYeNauWC1RA6qn1eVx+6VEiJL4S/nXpOKHtEVokIJJwzhsEeC7P27TGp0kG
         9NwP54DedLIexPWg1zESdytRu4Cvl37S2rRdIJkywwqge0SiQIoYZ/aZyag3E9W2u+I5
         Cj5mzb31nVbMd1K4Eoiuq5mj0n8VwfOYzMeK6V1kofkd5FVZhEzzyFaHtD06zH+BwLqt
         ggOuuemiB0pK/ingYE00O/ObIqKGu0Q4wF78pQNPVRvyd3db9vu5K41RFBLQojriKP70
         OvIBZxw5o9wUItnWNPqzPoWzHHtPNp/9+o4gjK2hpN5p97K1Jwj0Tw7ZcKV3QFBofWN7
         h+YQ==
X-Gm-Message-State: AOAM531sPFPvA2IlrGML6vVlusbxw69A55ay50LknZGSCtpxScbD7ltq
	No626iQy4/JEG3TbonsfAHpOpdNPrAmxa810
X-Google-Smtp-Source: ABdhPJzHLd4to6UzCX/EgtfLIu/Kf8LS4EUiTMM3XTzjd5AGCS14zkMCRQXrIiIGySo7Yf28g8G2pg==
X-Received: by 2002:a17:90b:364c:: with SMTP id nh12mr163012pjb.182.1599747461864;
        Thu, 10 Sep 2020 07:17:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id nl10sm2100362pjb.11.2020.09.10.07.17.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 07:17:41 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/18] Pull request (cover letter only)
Date: Thu, 10 Sep 2020 04:17:24 -1000
Message-Id: <cover.1599747323.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 0d4d0df6084cce3c3d9051db88f3199a030d3352:

  linux-firmware: update 20200721 -> 20200817 (2020-09-01 05:45:54 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Anibal Limon (1):
  recipes-kernel: linux-firmware add qcom-venus-{5.2,5.4} packages

Bruce Ashfield (1):
  kernel-yocto: checksum all modifications to available kernel fragments
    directories

Joshua Watt (1):
  oeqa: sdk: Capture stderr output

Khem Raj (3):
  json-c: Fix CVE-2020-12762
  util-linux: Allow update alternatives for additional apps
  json-glib: Backport a build fix with clang

Martin Jansa (1):
  devtool: expand SRC_URI when guessing recipe update mode

Michael Tretter (1):
  devtool: deploy-target: Fix size calculation for hard links

Nicolas Dechesne (1):
  linux-libc-headers: kernel headers are installed in
    STAGING_KERNEL_BUILDDIR

Rasmus Villemoes (1):
  cml1: Move find_cfgs() helper to cml1.bbclass

Richard Purdie (1):
  selftest/prservice: Improve test failure message

Ross Burton (2):
  package.bbclass: explode the RPROVIDES so we don't think the versions
    are provides
  insane: improve gnu-hash-style warning

Steve Sakoman (1):
  sanity.conf: update BB_MIN_VERSION to 1.46.0

Sumit Garg (1):
  insane: fix gnu-hash-style check

Vijai Kumar K (1):
  wic: misc: Add /bin to the list of searchpaths

Yann Dirson (1):
  package: get_package_mapping: avoid dependency mapping if renamed
    package provides original name

hongxu (1):
  sysstat: fix installed-vs-shipped QA Issue in systemd

 meta/classes/cml1.bbclass                     |  10 +
 meta/classes/insane.bbclass                   |   5 +-
 meta/classes/kernel-yocto.bbclass             |  16 ++
 meta/classes/package.bbclass                  |  18 +-
 meta/conf/sanity.conf                         |   2 +-
 meta/lib/oeqa/sdk/case.py                     |   2 +-
 meta/lib/oeqa/sdk/cases/assimp.py             |   2 +-
 meta/lib/oeqa/sdk/cases/buildcpio.py          |   2 +-
 meta/lib/oeqa/sdk/cases/buildepoxy.py         |   2 +-
 meta/lib/oeqa/sdk/cases/buildgalculator.py    |   2 +-
 meta/lib/oeqa/sdk/cases/buildlzip.py          |   2 +-
 meta/lib/oeqa/selftest/cases/prservice.py     |   4 +-
 meta/recipes-bsp/u-boot/u-boot.inc            |  10 -
 meta/recipes-core/busybox/busybox.inc         |  10 -
 meta/recipes-core/util-linux/util-linux.inc   |   3 +
 .../json-c/json-c/CVE-2020-12762.patch        | 231 ++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.13.1.bb |   1 +
 meta/recipes-extended/sysstat/sysstat.inc     |   2 +-
 ...o-instead-of-cast-to-convert-pointer.patch |  33 +++
 .../json-glib/json-glib_1.4.4.bb              |   4 +-
 .../linux-firmware/linux-firmware_20200817.bb |   6 +-
 .../linux-libc-headers/linux-libc-headers.inc |   2 +-
 scripts/lib/devtool/deploy.py                 |   8 +-
 scripts/lib/devtool/standard.py               |   2 +-
 scripts/lib/wic/misc.py                       |   5 +-
 25 files changed, 341 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-devtools/json-c/json-c/CVE-2020-12762.patch
 create mode 100644 meta/recipes-gnome/json-glib/json-glib/0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch

-- 
2.17.1

