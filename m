Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.12624.1596464835947667925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=W/4yuPFs;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id r11so10270197pfl.11
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 07:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=BCv8fqz+CkgJW9XQMvXMOf9nLGF/a9jOoVUeCmIPsjI=;
        b=W/4yuPFsMhodlm7YWSWcy9Uf+kq/4s3hOUBeh/dm2vIhSTIL+rqQbUhasI/pLeP+zF
         HvV7QpKOF5XL3QMOjSAy4aLW8exhbC8BFDdl/xUPHvt6IKNq88CXjxc4NL1QN5snG+CR
         P+8sDnn3RkX8rm/JuqaCNvjmwoDq2VQ2IErJnuQmNGZRArzlyY5c8dUlitd+YX3G2HXM
         81oqunXFns+5G02taxXdstsk1pDmmlskLC8A+wQzilrzDObPBFDLPASOdcsGTGrAfrnA
         skeyznVGHKLZ1BPYEFkSw0ygbp5neCy9SkTqpKgBsd7alXbtKJ1anSPLgBQ6ldLSNooy
         TkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=BCv8fqz+CkgJW9XQMvXMOf9nLGF/a9jOoVUeCmIPsjI=;
        b=b/eDOXB2m8TgCsQazSrNShKghrtHSRn3htE/UEMdz2LGJaMvZpywmxi16oVmeZrEO8
         vHvOvVEudo0tLxCt4ZS2M58KdUc8tmn4tmaNNxv3c5NXf/bDwDQllKkRYDSArb5Y1h7K
         ZnI4CggvKEaE9gnNx2PGgH94yXnVcH3yG5V+LuF0YnPKEYXlJLDnV+bW9jLCdBIadUbb
         QpiDVRvQnDi1qB5yL8+zZxx1YWsEJ3Er4e0CGiu7lJxtUSMekPu6uUfCPBnYMjpKeg+G
         0B5PD1aUD1Pa/DL8B43eseTUkqqWazTCPy3Edbeso+9IVZiXnF654RASuXtmfnl+iT5/
         7DFQ==
X-Gm-Message-State: AOAM530+NufKHibTkI7ieaHoagWbqRl6nLijtwz2ixnGAIqB6vtLqVZZ
	QajpMx9SheD9LU9SiGcmN/lfet0OKJ8=
X-Google-Smtp-Source: ABdhPJwPzzr4luxi9gwpmP3jEEGOyFBm7NwgcBo1r2jrZMsRzG0zw2JQ6VMxt/ZeI0RmYU64gp1w7g==
X-Received: by 2002:a63:584c:: with SMTP id i12mr15440872pgm.313.1596464834803;
        Mon, 03 Aug 2020 07:27:14 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r15sm10913729pfq.189.2020.08.03.07.27.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 07:27:14 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Patch review
Date: Mon,  3 Aug 2020 04:26:52 -1000
Message-Id: <cover.1596464561.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back
by end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1224

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

Changqing Li (2):
  layer.conf: fix adwaita-icon-theme signature change problem
  gtk-icon-cache.bbclass: add features_check

Konrad Weihmann (1):
  cve-update: handle baseMetricV2 as optional

Lee Chee Yang (1):
  checklayer: check layer in BBLAYERS before test

Matt Madison (1):
  cogl-1.0: correct X11 dependencies

Steve Sakoman (1):
  glib-networking: upgrade 2.62.3 to 2.62.4

Viktor Rosendahl (1):
  boost: backport fix to make async_pipes work with asio

Yi Zhao (1):
  bind: upgrade 9.11.19 -> 9.11.21

zhengruoqin (1):
  gnutls: Fix krb5 code license to GPLv2.1+ to match the LICENSE file.

 meta/classes/gtk-icon-cache.bbclass           |  5 ++
 meta/conf/layer.conf                          |  2 +
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
 13 files changed, 229 insertions(+), 51 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.19.bb => bind_9.11.21.bb} (98%)
 rename meta/recipes-core/glib-networking/{glib-networking_2.62.3.bb => glib-networking_2.62.4.bb} (88%)
 create mode 100644 meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch
 rename meta/recipes-support/gnutls/{gnutls_3.6.13.bb => gnutls_3.6.14.bb} (92%)

-- 
2.17.1

