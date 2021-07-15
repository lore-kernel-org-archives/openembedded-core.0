Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.1818.1626309854256812628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 17:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mYRv92cH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id j199so3537582pfd.7
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 17:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QKjFQhS3uC0GgR3TVZpYDLs3Thp8ufWOZBqOsy0c4v4=;
        b=mYRv92cHhBjwhK23iTOmzhydg3CgwBzqCjcXE4W7KfCCjlcJ+EiaiGVB18WEX5QM6S
         mG+gVky7C8J8S1Emi+UquyEuPeVmJbNOhT/FsnE+tDQyG4xOrmWkorxctGWXHbI/9d0n
         TBYeihzQ7QjVy11nEQ90L5Ztto1XrGDwk7xvN+YZOtkaYTWxg4ySVQPXO1GUim1VmCuv
         rDmANKNyj3XQPpi/YV17TB+dE7XXCM5mJyXj8BQfB9sG+sPBeyxauNx4HPLPUFLtBQ44
         rSi2CZ0fZ7WutNMiB4oYsu8gRR+z1zr68QePHME2cdoJD2TOL8FglzolJbh+7yna7L1I
         Mnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QKjFQhS3uC0GgR3TVZpYDLs3Thp8ufWOZBqOsy0c4v4=;
        b=ml3nDoxeH+mmyJR9Ibl2yGdwVGAEImv3opGSN44n/7oKDJ89e0IO9FA1+z0GReb2D1
         UH61aqr26oZsD+zTadol+gLIzcuYGS/kD8xrzUYWY4vXdOlxFVDrfhkXyFzCPTDAKmLL
         T42tv0sKuqsoMZDl0rNSASW43htCb+1gD1OYZkmu2A2o0a01yJbhOsc3dYuklG6sqY8O
         ZKDBQY38UKuQMF0AQvbYL90fv+l/aMP533um2Bz7mASAJp0ecGgpTldDDL6NFxhbljwp
         KrDL4/NP2DRbJ7lL93MA9VUvAxENS6CUFWuxpwmOHkTU5KyvCbPEvp+Gi3Eqjoivosx6
         5quw==
X-Gm-Message-State: AOAM532R9oYlrF/1pI2xlM6sYL9KmWZCLvY4o1cmBvT12OvyC/IGLO5H
	PNtZwVGDZ9UGzGgyAeoxp4SLRoQ7Im7MxNpL
X-Google-Smtp-Source: ABdhPJz3XsyzjdYYCx4IpLdf1fWAaldK6JP176PZn9ZKwGn35Qpq78A6KBMNMZxJon75aMP4HDgsIA==
X-Received: by 2002:a63:eb04:: with SMTP id t4mr829758pgh.84.1626309853197;
        Wed, 14 Jul 2021 17:44:13 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j6sm4354273pgq.0.2021.07.14.17.44.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 17:44:12 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Pull request (cover letter only)
Date: Wed, 14 Jul 2021 14:44:03 -1000
Message-Id: <cover.1626309787.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit c96bcf97272f243df14598c84a41097746884b65:

  oeqa/selftest/archiver: Allow tests to ignore empty directories (2021-07-06 04:37:02 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  bootchart2: update 0.14.8 -> 0.14.9

Chen Qi (1):
  busybox: fix CVE-2021-28831

Khem Raj (1):
  webkitgtk: Upgrade to 2.28.4

Marek Vasut (1):
  update-rc.d: update SRCREV to pull in fix for non-bash shell support

Minjae Kim (1):
  dhcp: fix CVE-2021-25217

Richard Purdie (4):
  webkitgtk: upgrade 2.28.2 -> 2.28.3
  dwarfsrcfiles: Avoid races over debug-link files
  oeqa/selftest/multiprocesslauch: Fix test race
  report-error: Drop pointless inherit

Steve Sakoman (1):
  glibc: update to lastest 2.31 release HEAD

Tim Orling (1):
  python3: upgrade 3.8.10 -> 3.8.11

Zoltán Böszörményi (1):
  tzdata: Allow controlling zoneinfo binary format

 meta/classes/report-error.bbclass             |   2 -
 meta/lib/oeqa/selftest/cases/oelib/utils.py   |   3 +-
 .../dhcp/dhcp/CVE-2021-25217.patch            |  66 ++++
 meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb  |   1 +
 ...ss_gunzip-Fix-DoS-if-gzip-is-corrupt.patch |  51 +++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   3 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../update-rc.d/update-rc.d_0.8.bb            |   2 +-
 ...tchart2_0.14.8.bb => bootchart2_0.14.9.bb} |   3 +-
 .../dwarfsrcfiles/files/dwarfsrcfiles.c       |  13 +-
 .../recipes-devtools/python/python3_3.8.11.bb | 362 ++++++++++++++++++
 meta/recipes-extended/timezone/tzdata.bb      |  10 +-
 ...build-errors-due-to-WWc-11-narrowing.patch |  66 ++++
 .../webkit/webkitgtk/CVE-2020-13753.patch     |  15 -
 ...ebkitgtk_2.28.2.bb => webkitgtk_2.28.4.bb} |   5 +-
 15 files changed, 571 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2021-25217.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
 rename meta/recipes-devtools/bootchart2/{bootchart2_0.14.8.bb => bootchart2_0.14.9.bb} (99%)
 create mode 100644 meta/recipes-devtools/python/python3_3.8.11.bb
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-clang-11-fix-build-errors-due-to-WWc-11-narrowing.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2020-13753.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.28.2.bb => webkitgtk_2.28.4.bb} (97%)

-- 
2.25.1

