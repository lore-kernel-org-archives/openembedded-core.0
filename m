Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.5136.1631060453001951490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 17:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=suQ8oWi+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id d5so452024pjx.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 17:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5jlX/F2wyFSz/ZKH+Wxn8LvmpcnXZnDN3Pa5GdsqGNs=;
        b=suQ8oWi+RBHRLRr8ryRSyQf2XCdgul+3Mo4FWhdaP+wvp531MynLelc7I3Z0WCS9JG
         TDxi4LpbayPIcsAX9SlKVptnPsLEAnn19ggRJmtFmDPRt1nTtw6EOgBpqyzHE8ozT+Q1
         ribbRlYAky6KE53gOUyvnzN6ec07Hr0K4JcklA2xvX6/JU6EOsHzzu1OKp58PCRqZSuA
         vDNI5tJxcPV1TkZ/lfEnSjBeF2etzeW0c3+wtlZoDo4iwMk73rlTUO/qpJdocT6gl+GC
         oqITabZrCWsClouEcs6okgStwpPRaVNoidvs+OqLDLc5DWJAcjWZGE+UQRjAvG1l6DDq
         i37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5jlX/F2wyFSz/ZKH+Wxn8LvmpcnXZnDN3Pa5GdsqGNs=;
        b=gJxXnqegsa5MG/ktSsrk5T7pA0N2aAu4olw3bA7x4g8ohLIWPduTDVX+KD3x4qcq8K
         j6yHCdmOhL6vgP+p8zY6HkdYmpxGfPaIdkR60i/TUQU2+J121vblF3I6ewMAy/xPyTaw
         mWAqqXM4RTGVJyViCYSnZmiGvXVyOjaV6C0urSQPUbxpkoBN/g8kzakL4wwxyGFwoxQv
         2BkoaR9E0PR9PjdF9PALeXazplRLXTTFcl9xYQjOS6z78s8bn7PvdcD4KZOOG6liHyFq
         OMwnv0/YjXhpuBcYzheAENaMGvzRLGYrG80pwfC48IQZGPVgAELaKZh1H6jEA7TnguzI
         iHhg==
X-Gm-Message-State: AOAM531oIfoYmKxrnFfRdKbklNznR9Jml/AAQ+8t1x6ELS3EpGWEr9j5
	LNfPbDMkwS3N5Q9CepfTDVkkVmRsQX1Kxotq
X-Google-Smtp-Source: ABdhPJxcKj5oiOOYy7vuONApZEgi5PCNvxG70CvWZ+64mQhfMw4hvmc0hyY/ZEQtXD0GQA+jk/kEog==
X-Received: by 2002:a17:90b:1645:: with SMTP id il5mr1031165pjb.57.1631060451645;
        Tue, 07 Sep 2021 17:20:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id t14sm271924pga.62.2021.09.07.17.20.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 17:20:51 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/5] Pull request (cover letter only)
Date: Tue,  7 Sep 2021 14:20:23 -1000
Message-Id: <cover.1631060197.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

*The following changes since commit 448e0271ed831582bb5833486fc17b131676fb53:

  selftest: disable virgl headless test (2021-08-27 04:58:08 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Andrej Valek (1):
  vim: add option to disable NLS support

Armin Kuster (1):
  lz4: Security Fix for CVE-2021-3520

Matt Madison (1):
  layer.conf: fix syntax error in PATH setting

Richard Purdie (1):
  sdk: Decouple default install path from built in path

Ross Burton (1):
  cpio: backport fix for CVE-2021-38185

 meta/classes/populate_sdk_base.bbclass        |   1 +
 meta/conf/bitbake.conf                        |   4 +-
 meta/conf/layer.conf                          |   2 +-
 meta/files/toolchain-shar-extract.sh          |   3 +-
 meta/files/toolchain-shar-relocate.sh         |   2 +-
 .../cpio/cpio-2.13/CVE-2021-38185.patch       | 581 ++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       |   1 +
 .../lz4/files/CVE-2021-3520.patch             |  27 +
 meta/recipes-support/lz4/lz4_1.9.2.bb         |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 10 files changed, 621 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/CVE-2021-38185.patch
 create mode 100644 meta/recipes-support/lz4/files/CVE-2021-3520.patch

-- 
2.25.1

