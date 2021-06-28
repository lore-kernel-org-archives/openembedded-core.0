Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.12421.1624892753181458003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 08:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=JYwykUWg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id 7-20020a9d0d070000b0290439abcef697so19074470oti.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 08:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=134MzwHYwUHsHU3Uz72jT8RhtsV+iOd4u8LDFfyKMas=;
        b=JYwykUWg+UtYRYCA+yCcsvn3KQG2YgODKbAJfzqyLOil49HVzv5BrGGMMlZ5YCHgrK
         kf2PzK28nELnoYv8KZr6J48eLN2e82f6PG7WDWczVfyHtQ2Epu6esPQ59XlOVX0HnXO3
         5DlxmdfM5ZB0zWJsEqBzQs/yS3cgxLXzsig3I7cQSsDDwZ6iAE83++i8eEhTnxG/wdsq
         nKSN3euuZT4lAnNRR+llt5rjEdGbx6h8EnqVa5vTUfEJzZBrwTRH9YKIv7AlykbkWP/g
         b6utgpEokDib3d2JwgFqD7lJImgL8+uegkKhOkmzHvoPxAGsLS1vIZBduRoJyEWY1sZG
         Gpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=134MzwHYwUHsHU3Uz72jT8RhtsV+iOd4u8LDFfyKMas=;
        b=SxTkB62/sQpgpoKr0WFJFj2EN+pGCJEtraEqowLduxKOkSjGQKQ97FurUm0rqo6qWE
         /KJ3hvjZM7dcO0pNfVODqB7oSavTOGqTwuIS8fn5eUaQ93E/vo3fXlD010HuPZeheLCz
         TBTeGjE5jviFP+r4PyA1IZP3thk0xEFLETB4HpEG/KPBdqUbXmobCRfW0dAzz93Vv7Rf
         KdbhzcaHKZdMr2z0dkYTT2et8g9UMdIMUzCB1AQ8bfMTpS+pcv3+IA7S8vMNyTsmCvuH
         1LOFlxN3k00JhvEtZvH7hFNUhl6xfaWZSEUH5XRmGnT+gb+NtqX0q3Q9UjxH5OkvYAkq
         AWZQ==
X-Gm-Message-State: AOAM5301s6G0LMH4XvgdMqsOYlUJ1xKPTsVJiTd86wWmcXYfUM79GHB4
	qY+K5sJb3GlFuV8fyEtclGzpzQd59Ok8sg62iU4=
X-Google-Smtp-Source: ABdhPJwrbrY4pKBUm5CkCGNXN7NBmYp6OJQg9StBJTl6QhEJOJhr5PheOSA5jEnfEfXQVJZCUhVRMw==
X-Received: by 2002:a9d:6951:: with SMTP id p17mr12449oto.151.1624892751909;
        Mon, 28 Jun 2021 08:05:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id c21sm2095892otp.8.2021.06.28.08.05.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 08:05:51 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Patch review
Date: Mon, 28 Jun 2021 05:05:17 -1000
Message-Id: <cover.1624892565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2291

The following changes since commit ac8181d9b9ad8360f7dba03aba8b00f008c6ebb4:

  Revert "python3: fix CVE-2021-23336" (2021-06-19 13:11:58 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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

