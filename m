Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.8865.1596638985904444512
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 07:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XsI7nAgi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id r4so14739530pls.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 07:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=WIp2intTmQWtSC+4nJ+ifWwdJApTrNYn4DD45aLMneU=;
        b=XsI7nAgi03BabaFMrIcEuohGtOGs8BcE12z0lwTOIOfrHDW9jiAeRiI6CKTZMMvM6b
         56N0DOuhKT0iwW/lk49hlYUveZW80zHdEx1xRbxXIJ18oCVOaqeNVDzsyhxi7HgmXj3/
         IOu+oxwl6T42shNqxVhr7zzWQzq3GZQ1GZsEuvzBrWnavWY2bR/AYYH2qAnEnrqpQLhJ
         CBXbJrg6x/RYEgnGVkLJg2S3TJVpOa0MaU/ElAhPV9tOTYJKeiJa34DknvPdUSe5mQ0l
         5jvotvR67i49xZC6OdC7EdVz8KWhq6hbOAUwTjQzY5aaUQ55hHWYGIA3rReGaveb+tWw
         LTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=WIp2intTmQWtSC+4nJ+ifWwdJApTrNYn4DD45aLMneU=;
        b=flDRW5Tm4nn7YGUJ5L+MXx/WMAxytSJZccLK4An8hSeg0Hn6bPiuL/SNCN8xcvm5YH
         uYoXkdRJLdR1L2Pq35auC9zotSUOjYnxDwYja5JPAW5Ek4DEOYuix3qmWnfkxfU7yyvG
         tH4D0D2bcebfiTErwOWur8t06vtXaD9UnoP1Jn/1PjsZPX79mFhK5bA0MCndr5DmM2xe
         jnpYIYQ22nmzaUrv31nONJ2Ywbr9VGObmuj1QRATR/rZrE3KlDyrOzRYYxIcJiySOLw8
         v5w2heQJUpH8Gli/kzEDIbdpKYCMW4p03HovFB1IzgdJwp1F63SkygBkVKB9lbNZsH3e
         YAow==
X-Gm-Message-State: AOAM5300Z/s2zm+5n5feYJdYllmBEV7GEzqJV6Nw0HgbwM0xeKxyn4Re
	5PHytWhkwCjuU9ELsWhuOd6c11KNARA=
X-Google-Smtp-Source: ABdhPJz+uh9k7VG/BI7LyHaScVS41Y940kOEp5ZYRhwiYAVUaHp1DBmSb20oA98HZq8512Fv2vLjsQ==
X-Received: by 2002:a17:902:9309:: with SMTP id bc9mr3245531plb.51.1596638984731;
        Wed, 05 Aug 2020 07:49:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d81sm3879721pfd.174.2020.08.05.07.49.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 07:49:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 00/11] Patch review
Date: Wed,  5 Aug 2020 04:49:23 -1000
Message-Id: <cover.1596638643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Sending a second version since there have been a number of comments
on this series.  Please have any further comments back by end of day Friday.

Version 2 drops the following patches from version 1:

  layer.conf: fix adwaita-icon-theme signature change problem
  gtk-icon-cache.bbclass: add features_check

And adds a revert of:

  gtk-icon-cache.bbclass: add runtime dependency

The following changes since commit 7ce425fa1295a9dca48f8474be58db3ac8aa540d:

  glibc: Secruity fix for CVE-2020-6096 (2020-07-27 12:15:56 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (1):
  gnutls: upgrade 3.6.13 -> 3.6.14

Andrei Gherzan (2):
  initscripts: Fix various shellcheck warnings in populate-volatile.sh
  initscripts: Fix populate-volatile.sh bug when file/dir exists

Konrad Weihmann (1):
  cve-update: handle baseMetricV2 as optional

Lee Chee Yang (1):
  checklayer: check layer in BBLAYERS before test

Matt Madison (1):
  cogl-1.0: correct X11 dependencies

Steve Sakoman (2):
  glib-networking: upgrade 2.62.3 to 2.62.4
  Revert "gtk-icon-cache.bbclass: add runtime dependency"

Viktor Rosendahl (1):
  boost: backport fix to make async_pipes work with asio

Yi Zhao (1):
  bind: upgrade 9.11.19 -> 9.11.21

zhengruoqin (1):
  gnutls: Fix krb5 code license to GPLv2.1+ to match the LICENSE file.

 meta/classes/gtk-icon-cache.bbclass           | 19 +---
 .../bind/{bind_9.11.19.bb => bind_9.11.21.bb} |  2 +-
 ...ng_2.62.3.bb => glib-networking_2.62.4.bb} |  4 +-
 .../initscripts-1.0/populate-volatile.sh      | 80 ++++++++---------
 .../recipes-core/meta/cve-update-db-native.bb | 13 ++-
 meta/recipes-graphics/cogl/cogl-1.0.inc       |  2 +-
 .../0001-added-typedef-executor_type.patch    | 54 +++++++++++
 meta/recipes-support/boost/boost_1.72.0.bb    |  1 +
 ...se-to-GPLv2.1-to-keep-with-LICENSE-f.patch | 90 +++++++++++++++++++
 .../{gnutls_3.6.13.bb => gnutls_3.6.14.bb}    |  4 +-
 scripts/lib/checklayer/__init__.py            | 14 +++
 scripts/yocto-check-layer                     |  9 +-
 12 files changed, 225 insertions(+), 67 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.19.bb => bind_9.11.21.bb} (98%)
 rename meta/recipes-core/glib-networking/{glib-networking_2.62.3.bb => glib-networking_2.62.4.bb} (88%)
 create mode 100644 meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch
 rename meta/recipes-support/gnutls/{gnutls_3.6.13.bb => gnutls_3.6.14.bb} (92%)

-- 
2.17.1

