Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.11670.1631632968228081108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 08:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NWpPB8OL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso18931555otv.12
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 08:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LXSWowqojFcS30vDdpNLULTVIOz7R6MXp0do78Sozqs=;
        b=NWpPB8OLJD3PtRWI2n5dwAiv1+/Yb72yMZZdOKNOOrABlaKOVYNYEIDzgRosQvOP+5
         tBZAfewBDefBf+vkGUYzEN/8NGG3bCN2U/cpik+eTSwYQBYY7WAj+Adto4nnZ1bGVmcR
         LRPdNTz/8CcijJiEiVMearqoJ3DQ/htiejbkhZ+vzRX/H+zFmtkV/yt9qpU/XnbeLIBu
         +ndPTSR9Y5cyeWHZr3OGfLPuOPyq9C2PaKcyL8TgMxcQhKJkS7zXYKKPwMTV9Jn5b/PD
         avVbIaksnoYkDNjwaL0wjSI1kB7IdG27da9+UC+wULNkt6edBSVUajuVgfJCTZXFgBU1
         Pwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LXSWowqojFcS30vDdpNLULTVIOz7R6MXp0do78Sozqs=;
        b=bfhQh/Qd2NQZgCbfcBfI2EIBr+6caQHiVLo0lnx867KbrLBEYpgWPmYYnYc4OGo7w8
         27CTmpSqBWVyMn1CUS89VOiu/Z9S5YNHZo3/JJle1vyx9dztjMsaC3dj31/ehWrqM1sY
         LljKYBKMErY/aFjjWzlV02k+gxuvTjV+AZDnGdMRsC2r+1PQV7EI0aZ19ewYUK9bCd91
         zwJbc73lKFG29Mxq5/964FfQlVMfFG2lT83gvYBVerZtX7MaqX6yzhDHdnsl1iGdqMwS
         rmx0GtGhVk9KOqllS+bzp0Qt9eVebZtrrgmZUKzWyhm/ewMsk2mj8k0TgxiXVJq7y0bc
         n6Zw==
X-Gm-Message-State: AOAM530+xQ+HSJN+AZhIQhzGJfExYpqV+c+Yh5F1TiiAEiJztmXGPHPQ
	F5B7Fd6zUpvRTqkrz5Y52ztQHOs5BgOqFYSo
X-Google-Smtp-Source: ABdhPJxL/tpJM7HW2n5+Ieece8LSc0kyEFdGjKSSevoDruM9TQ2ZZbJC/Xgm+MEvCl2UF44Hi+xK/A==
X-Received: by 2002:a05:6830:1657:: with SMTP id h23mr15169011otr.315.1631632966792;
        Tue, 14 Sep 2021 08:22:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id y11sm2675467otg.58.2021.09.14.08.22.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 08:22:46 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/9] Pull request (cover letter only)
Date: Tue, 14 Sep 2021 05:22:19 -1000
Message-Id: <cover.1631630433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit ed52bea54f135b7b5367a24bb3861d9bc0c53117:

  rt-tests: set branch name in SRC_URI (2021-09-10 16:21:30 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Armin Kuster (2):
  xserver-xorg: Security fix for CVE-2020-14360/-25712
  go: Several Security fixes

Ovidiu Panait (2):
  dbus-test: Remove EXTRA_OECONF_X configs
  dbus,dbus-test: Move common parts to dbus.inc

Richard Purdie (2):
  flex: Add CVE-2019-6293 to exclusions for checks
  go: Exclude CVE-2021-29923 from report list

Wang Mingyu (3):
  dbus: upgrade 1.12.16 -> 1.12.18
  dbus-test: upgrade 1.12.16 -> 1.12.18
  dbus: upgrade 1.12.18 -> 1.12.20

 .../distro/include/cve-extra-exclusions.inc   |   4 -
 ...s-test_1.12.16.bb => dbus-test_1.12.20.bb} |  42 +----
 meta/recipes-core/dbus/dbus.inc               |  34 ++++
 .../dbus/dbus/CVE-2020-12049.patch            |  78 ---------
 .../dbus/{dbus_1.12.16.bb => dbus_1.12.20.bb} |  40 +----
 meta/recipes-devtools/flex/flex_2.6.4.bb      |   5 +
 meta/recipes-devtools/go/go-1.14.inc          |   9 ++
 .../go/go-1.14/CVE-2021-33196.patch           | 124 ++++++++++++++
 .../go/go-1.14/CVE-2021-33197.patch           | 152 ++++++++++++++++++
 .../go/go-1.14/CVE-2021-34558.patch           |  51 ++++++
 .../xserver-xorg/CVE-2020-14360.patch         | 132 +++++++++++++++
 .../xserver-xorg/CVE-2020-25712.patch         | 102 ++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.8.bb       |   2 +
 13 files changed, 624 insertions(+), 151 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.16.bb => dbus-test_1.12.20.bb} (51%)
 create mode 100644 meta/recipes-core/dbus/dbus.inc
 delete mode 100644 meta/recipes-core/dbus/dbus/CVE-2020-12049.patch
 rename meta/recipes-core/dbus/{dbus_1.12.16.bb => dbus_1.12.20.bb} (75%)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-33196.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-33197.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-34558.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14360.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-25712.patch

-- 
2.25.1

