Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web08.9661.1623423021751871833
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jun 2021 07:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wdJqNTow;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.45, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f45.google.com with SMTP id o5-20020a4a2c050000b0290245d6c7b555so759977ooo.11
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 07:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o3W8gwOgfChAzNM5UnG38e2E1KZQhxgliA+WbCB6ddw=;
        b=wdJqNTowwUwKWRs0RtnH9cbXjoala8z7ycyjzEKd3yVZSP2XRIQYYavjfleuFiA8aq
         b0WpN/Nudz4IUiDHC1qbeKyLBzs+02XPyMfuFSvgOqaJ9WtjrCqjKVWffKSqH3o4Quqc
         Rxzu2CPvPtyCfJaDPDdWSzHRyMFjNN5ZPNI2dybH4H4hS3+5lbeSVNDBAHwjwDofmUmI
         uF8IgLu2TXD2LvJwecZx/1Pwo/MloK+oE2JBn61pwawKonWlkAOACZC29zareqkdkuCS
         ssXNyNKqgTRpIupM+7eJ/skuc50gbmzMrX6ni6fq+SOusysz0xeIki0BRkSfzr0qOVXq
         b1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o3W8gwOgfChAzNM5UnG38e2E1KZQhxgliA+WbCB6ddw=;
        b=lHXCQ0yyxPibNPnzK3o8yUP6S0mZ7jBVHhrhHCO3dy5OOmTJfHyroRPmwEoOKvIExB
         Ib6kOAux9xDF21AVjVgN0hTl4KHFllDdHZZSxg1wFBsmeFqvRnwupayv3JntsCrR+L/j
         xz2Y9YsQX5KAvuRFq8J4vNi9MUwHKQsxNxjEwsesRTKnPdRtgUIbdCuSuA7anC+/3eIl
         gGw/1O8ev3rjsP+i+vtCqVFcJ+qZJP4L/kxxPPtWlXSBrEyEqSWOPMSCsT9BZr7DBGd7
         ec8URdPFv1lE7A6P8F0pvg6yWqrKXtPxjBKn7hf6/WzLK6zgrZCKLL5NEh79/DHnVvl7
         Zf2w==
X-Gm-Message-State: AOAM533Two8IHsTmE3BLyeql5WlQ95EdJQZ8qRA+ZA7n20JRKkpnsZMs
	5d8NLb+IvPrEmzuYEJ8NVdWWar3ez2mg3KLoDZc=
X-Google-Smtp-Source: ABdhPJw2LgDDEJJ33+GZTNak+yG1iJoXwX/Z9OOF+xKn64BfTg64+tdzhpI+DA4NFzsF4c+VjQWnJQ==
X-Received: by 2002:a4a:a9c8:: with SMTP id h8mr3423073oon.1.1623423020492;
        Fri, 11 Jun 2021 07:50:20 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id o26sm1359486otk.77.2021.06.11.07.50.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 07:50:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/6] Pull request (cover letter only)
Date: Fri, 11 Jun 2021 04:49:56 -1000
Message-Id: <cover.1623422922.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 090452c5284181f18c32dc33887f4dda20c48004:

  Revert "busybox: make busybox's syslog.cfg depend on VIRTUAL-RUNTIME_base-utils-syslog" (2021-06-08 04:32:17 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.120
  linux-yocto/5.4: update to v5.4.123

Klaus Heinrich Kiwi (1):
  kernel-fitimage: Don't use unit addresses on FIT

Lee Chee Yang (2):
  libxml: fix CVE-2021-3517 CVE-2021-3537
  gnutls: fix CVE-2021-20231 CVE-2021-20232

Ovidiu Panait (1):
  kernel-devicetree: Introduce KERNEL_DTC_FLAGS to pass dtc flags

 meta/classes/kernel-devicetree.bbclass        |  7 ++
 meta/classes/kernel-fitimage.bbclass          | 32 ++++-----
 .../libxml/libxml2/CVE-2021-3517.patch        | 53 +++++++++++++++
 .../libxml/libxml2/CVE-2021-3537.patch        | 50 ++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  2 +
 .../linux/linux-yocto-rt_5.4.bb               |  6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++---
 .../gnutls/gnutls/CVE-2021-20231.patch        | 67 +++++++++++++++++++
 .../gnutls/gnutls/CVE-2021-20232.patch        | 65 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |  2 +
 11 files changed, 280 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3537.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2021-20231.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2021-20232.patch

-- 
2.25.1

