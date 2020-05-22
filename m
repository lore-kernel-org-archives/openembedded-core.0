Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.13879.1590157583334032822
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 07:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u+zc/Un0;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id n15so5040064pjt.4
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 07:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=WvdrRT4+tScWMg28MkvD0EHpYQFPuHvZrmEznIHLWBw=;
        b=u+zc/Un06L15O7mFxPMhK6MtRadKv2KW7MFuksyyLA9vBGpe4GPQibpIBXySYQtPQH
         uE3AQJWy4GH6C8bR1wZN9RpVH8mGjqsQ90Jk61pXPAjTmYOZ4z/eRy3gZgZQg2QPf/F3
         gVT5SCdSyHkonoDPVjz305fN/YOYSh6phUbQjtiv1lfnt9nbJEY6qYR0heo6feefd+0Z
         drA+FEX4GG7LGYScaUBPxTQ7/jDrpsSqgw9O4bbr4WYGWJiuXw/vVOM0oXN2YykXO9DQ
         Vx2iI8k3UHtZlGjUIoKOqQKeEUOOPZimn40GcFDxiIyWWkqaSpCWZs/XDLAZz2CUrY2C
         jLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=WvdrRT4+tScWMg28MkvD0EHpYQFPuHvZrmEznIHLWBw=;
        b=E01nGufyDeMwjR/e3M+pUWsMlpxkLq9cJ1Jy0JZpltlBzQ+FH7g2M4Eon4uH60/dg8
         G+Nf+EAoRPJASB2lDaTcsmKaC/JjJCKmTRIUtujAgQ6BG+/3z2abXbepM/9OZ7RUquam
         j/j4H8JR0P3TaFQC2pQudYzdz1VhUwony4S4kKawLGMWmy+Z/xLG4muL7dIAmtbDNUlW
         6ElgyTChcUcsyLIU7uSGKBAPYOg843YxF6Kywd4JCThCaIV4f7zkuCjw6gWSMQuUKl5f
         kRNMvR2t7hFKYG4vostnWqJRN/U0aQubpJ6u7QV/tb6rESNrx6SHWOp1iEoBCFcqp83X
         dwNg==
X-Gm-Message-State: AOAM532RYEzf1biaEfrSDtnTVpJh9fF0iFPvRWutN2bMP0k7MlZ7khEj
	ypXaXW5Rg6PRDrkkGBwoimVl0AWq
X-Google-Smtp-Source: ABdhPJyRvretTKV+9dcPeH7zBrBvmgob/p9SA8MTvjAnmVZ3iU4TX4RqAytdCKaSnRN0R3GtsHWkUQ==
X-Received: by 2002:a17:902:bb85:: with SMTP id m5mr14598439pls.23.1590157582485;
        Fri, 22 May 2020 07:26:22 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:2019:1800:ef81:a76f])
        by smtp.gmail.com with ESMTPSA id v75sm7347763pjb.35.2020.05.22.07.26.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 07:26:21 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [warrior 0/8] Pull request
Date: Fri, 22 May 2020 07:26:09 -0700
Message-Id: <cover.1590157490.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Please merge these changes into warrior

The following changes since commit ae341aed81be28232cc34daf4684bc0922f17699:

  yocto-uninative.inc: version 2.8 updates glibc to 2.31 (2020-03-26 07:04:11 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/warrior-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/warrior-next

Adrian Bunk (3):
  git: Upgrade 2.20.1 -> 2.20.4
  python: Upgrade 2.7.17 -> 2.17.18
  openssl: Upgrade 1.1.1d -> 1.1.1e

Alexander Kanavin (1):
  openssl: update to 1.1.1f

Denys Dmytriyenko (1):
  openssl: recommend cryptodev-module for corresponding PACKAGECONFIG

Jan Luebbe (1):
  openssl: upgrade 1.1.1f -> 1.1.1g

Lee Chee Yang (1):
  cve-check: CPE version '-' as all version

Richard Purdie (1):
  openssl: Fix reproducibility issue

 meta/classes/cve-check.bbclass                |   2 +-
 .../openssl/openssl/CVE-2019-1551.patch       | 758 ------------------
 .../openssl/openssl/reproducible.patch        |  32 +
 .../{openssl_1.1.1d.bb => openssl_1.1.1g.bb}  |   7 +-
 .../recipes-core/meta/cve-update-db-native.bb |   2 +-
 meta/recipes-devtools/git/git_2.20.1.bb       |  11 -
 meta/recipes-devtools/git/git_2.20.4.bb       |  11 +
 ...tive_2.7.17.bb => python-native_2.7.18.bb} |   0
 meta/recipes-devtools/python/python.inc       |   6 +-
 .../{python_2.7.17.bb => python_2.7.18.bb}    |   0
 10 files changed, 51 insertions(+), 778 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2019-1551.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/reproducible.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1d.bb => openssl_1.1.1g.bb} (97%)
 delete mode 100644 meta/recipes-devtools/git/git_2.20.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.20.4.bb
 rename meta/recipes-devtools/python/{python-native_2.7.17.bb => python-native_2.7.18.bb} (100%)
 rename meta/recipes-devtools/python/{python_2.7.17.bb => python_2.7.18.bb} (100%)

-- 
2.17.1

