Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.772.1619107498399205540
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 09:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=LjT6CCd7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id o16so10161239plg.5
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 09:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/uh+Pv68WyszpK/PPSPDu9gqHBlCIbKJE/yQ628PWog=;
        b=LjT6CCd7V0X1IxqPuW0hOD0J3DR6luhjkL7HXmGfEOlh49hw60l5A7XLW0WDv+l8r3
         G2NvTFuPGBQJGaY4pz9NhBIyNEf0+5h2J7Br+UEIk4qi94ZJXUl0h2Soa16Ye+sU62bM
         7/4Pc/YTXeCJDX2P3FA6leSYuBzWNTsZyOmnLvG5TQyOXiSEjx3BCiTgjkfkgA0vACRr
         yLeYV/EZ/hm6BDTgG/algMRScdfPr6+LLuJpQ4VHRssVUXxNDk6uTVXZzZbMLwDa3aTa
         zBkJEmy129JVgtL1zCmKvtLj6cstxIj2XsvdBZXXQDW6uWAiuc19bSZkDnekEoc5Gke2
         xfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/uh+Pv68WyszpK/PPSPDu9gqHBlCIbKJE/yQ628PWog=;
        b=mnXqyHwU7IW3JaTME8Y3BSMUJgBMn3v+nwy7CGK7sLjJCOcz1doRMWU/2ZGKtuZtJ3
         /bauiL45MS+faYOPrKGu3GAFRilU1M/G8CVrR9N8gcQ3XaJkZkjfu6Vg+HSzbxGg5o9E
         BAeCLb1JyTTpokejaZ5FqzBApFCCKocxTCAD5TsaVac36sIXLiBnoxUuysOvs6ey1Swu
         6gXxntVFjyU9/aD99+GGqTv8/TpFcPE12VOdDtRZ0oQhQQzOs+KNSM5JnIeYtLli8U5S
         6B/oWFkNuqTUJp55Ku0JuOFUrwlxxAelEGjp0v7cXAbHYEz6MQlCHIAaDEieSpedcJvi
         gnPg==
X-Gm-Message-State: AOAM533AkE0Kx5PoDalOuzGLQ128t8UqfiYelKbyx7zOm9/ACRTpl2Xl
	45wyvZgA9lj0iaVnt22laeqdIF8hM4Hr2mQO1ls=
X-Google-Smtp-Source: ABdhPJx9ke4WAr5x/kV8wSbrMHLlO+7DjwAGJAxSXrsSqUd5QHkcZghOR6eNX87+wjtq2MtWgakRVQ==
X-Received: by 2002:a17:902:8601:b029:e6:7b87:8add with SMTP id f1-20020a1709028601b02900e67b878addmr4185730plo.3.1619107497280;
        Thu, 22 Apr 2021 09:04:57 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i63sm2568309pfg.112.2021.04.22.09.04.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 09:04:56 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Pull request (cover letter only)
Date: Thu, 22 Apr 2021 06:04:22 -1000
Message-Id: <cover.1619107396.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit a3de6239e98efafe3668396e69133ffee3d9b27f:

  build-appliance-image: Update to dunfell head revision (2021-04-13 14:12:06 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (3):
  selftest/reproducible: enable world reproducibility test
  selftest/reproducible: add an exclusion list for items that are not
    yet reproducible
  selftest/reproducible: track unusued entries in the exclusion list

Guillaume Champagne (1):
  image-live.bbclass: optional depends when ROOTFS empty

Mike Crowe (1):
  curl: Patch CVE-2021-22876 & CVE-2021-22890

Peter Morrow (2):
  goarch: map target os to windows for mingw* TARGET_OS
  go_1.14: don't set -buildmode=pie when building for windows targets

Richard Purdie (3):
  selftest/reproducible: Sort the unused exclusion list
  diffoscope: Upgrade 136 -> 168
  diffoscope: Upgrade 168 -> 172

Steve Sakoman (1):
  selftest/reproducible: adjust exclusion list for dunfell

 meta/classes/go.bbclass                       |   8 +-
 meta/classes/goarch.bbclass                   |   2 +
 meta/classes/image-live.bbclass               |   2 +-
 meta/lib/oeqa/selftest/cases/reproducible.py  |  80 ++-
 meta/recipes-devtools/go/go_1.14.bb           |   8 +-
 .../curl/curl/CVE-2021-22876.patch            |  59 +++
 .../curl/curl/CVE-2021-22890.patch            | 464 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
 .../{diffoscope_136.bb => diffoscope_172.bb}  |  15 +-
 9 files changed, 620 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22876.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22890.patch
 rename meta/recipes-support/diffoscope/{diffoscope_136.bb => diffoscope_172.bb} (46%)

-- 
2.25.1

