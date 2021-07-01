Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web08.7539.1625148030054564581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jul 2021 07:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=unhZVZ1R;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id 22so7342540oix.10
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jul 2021 07:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VNdwksFBlS1nheRc4dm/+w8F+RskstkxpHMAk+Ia9ic=;
        b=unhZVZ1RJIbAj4Dg/V+Gw4hpTfLPS3Z9KGrVd84hZM7sZkb1PUNYH0+WHhRy3l0pjm
         cmzM5BtX3kQHPDhI9XAfQvwG3TRCYZGmtj/IBJ4IwCNX7IlwGCdN0/kaF6UtG7Ax4/DD
         6v52QqEY3PJc1S2gmw4yVi0lU9eIK+Qfph5ImHpwqkENsknYTi6ZW4LYCS/q8DuqVjWd
         SJVkldlmJu2QqRp/P1Kz983IzDQdpRj2UHgpO9QbFRhFHqig7Qtmrmxh5PsHf9MJJ4gi
         i7aGC7RWkC2OCDAmYiTWOgvbSiyEg6WOVZmuu7AJclU8bbUgzj1lKpBmB6EW1JLnf2sb
         Yb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VNdwksFBlS1nheRc4dm/+w8F+RskstkxpHMAk+Ia9ic=;
        b=aymcb7Rg31kJknJqB9pm1IENVIrEwu4io3znywOYpCtur2yhZYhF1nfoqXpdXy7E4s
         MMqy8L9hdxh5OvOEko9DXQiYfsr2Ya9khP12Io0mq6sE/nsROdrj0y1LacyoNJOmQcsN
         NY4wb3DkczN1aTAtNXALedSv73o88rJgamQuRiIttxJBwR3pDTFIV4c++jzYM3Gjf9Ku
         Y9G2vaVoqdWswbdl6zOScvyqb1XuhDj6EiiXuTxiR2/85h1d9me0smaTo27sOl87Ksya
         Qs33605MDmKBeTH27qvM4ZlBZZNqP1+INPjgXyqR1TrvSBA6XBCXk24BlUGADPDifz12
         jZ+w==
X-Gm-Message-State: AOAM533CE1Yk6kmVKN49gZLH3Jy37Z9AuRJHKuRGwCpYtf+4lRa4MvuU
	bQfGiqnsXJlrwLeY6+u4aA8saF0DdOLJcS4OA2M=
X-Google-Smtp-Source: ABdhPJxlOjByrr/nhjBJaQR1sNmg6nPheVXR8jjk2DfmP8SfqJoucEVvoJR+Vjb9KTm29bgxWRIbSQ==
X-Received: by 2002:aca:4482:: with SMTP id r124mr30046539oia.153.1625148028843;
        Thu, 01 Jul 2021 07:00:28 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id n16sm4433953oor.47.2021.07.01.07.00.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:00:28 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Pull request (cover letter only)
Date: Thu,  1 Jul 2021 04:00:07 -1000
Message-Id: <cover.1625147867.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit ac8181d9b9ad8360f7dba03aba8b00f008c6ebb4:

  Revert "python3: fix CVE-2021-23336" (2021-06-19 13:11:58 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Jasper Orschulko (3):
  expat: fix CVE-2013-0340
  libxml2: Fix CVE-2021-3518
  libx11: Fix CVE-2021-31535

Michael Halstead (1):
  uninative: Upgrade to 3.2 (gcc11 support)

Tim Orling (10):
  python3: upgrade 3.8.2 -> 3.8.3
  python3: upgrade 3.8.3 -> 3.8.4
  python3: upgrade 3.8.4 -> 3.8.5
  python3: upgrade 3.8.5 -> 3.8.6
  python3: upgrade 3.8.6 -> 3.8.7
  python3: upgrade 3.8.7 -> 3.8.8
  powertop: fix aclocal error too many loops
  python3: upgrade 3.8.8 -> 3.8.9
  python3: upgrade 3.8.9 -> 3.8.10
  python3-ptest: add newly discovered missing rdeps

 meta/conf/distro/include/yocto-uninative.inc  |    8 +-
 .../expat/expat/CVE-2013-0340.patch           | 1758 +++++++++++++++++
 .../expat/expat/libtool-tag.patch             |   41 +-
 meta/recipes-core/expat/expat_2.2.9.bb        |   12 +-
 .../libxml/libxml2/CVE-2021-3518.patch        |  112 ++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |    1 +
 ...20-8492-Fix-AbstractBasicAuthHandler.patch |  248 ---
 ...le.py-correct-the-test-output-format.patch |   24 +-
 .../python/python3/CVE-2019-20907.patch       |   44 -
 .../python/python3/CVE-2020-14422.patch       |   77 -
 .../python/python3/CVE-2020-26116.patch       |  104 -
 .../python/python3/CVE-2020-27619.patch       |   70 -
 .../python/python3/CVE-2021-3177.patch        |  191 --
 .../{python3_3.8.2.bb => python3_3.8.10.bb}   |   19 +-
 .../xorg-lib/libx11/CVE-2021-31535.patch      |  333 ++++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |    1 +
 ...2-configure.ac-ax_add_fortify_source.patch |   70 +
 ...003-configure-Use-AX_REQUIRE_DEFINED.patch |   29 +
 meta/recipes-kernel/powertop/powertop_2.10.bb |    8 +-
 19 files changed, 2357 insertions(+), 793 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2013-0340.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3518.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2019-20907.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2020-14422.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2020-26116.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2020-27619.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2021-3177.patch
 rename meta/recipes-devtools/python/{python3_3.8.2.bb => python3_3.8.10.bb} (95%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2021-31535.patch
 create mode 100644 meta/recipes-kernel/powertop/powertop/0002-configure.ac-ax_add_fortify_source.patch
 create mode 100644 meta/recipes-kernel/powertop/powertop/0003-configure-Use-AX_REQUIRE_DEFINED.patch

-- 
2.25.1

