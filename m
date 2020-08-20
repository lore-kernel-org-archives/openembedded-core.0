Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.103495.1597892823050052171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 20:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=oVaMYDLi;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.194, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f194.google.com with SMTP id h12so472334pgm.7
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 20:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=q6SwzukIGcxPFyO6js5BlgPrDffrpZRFzJ4HpsBJDyw=;
        b=oVaMYDLiIhnnDKCysHGB5wJAwOvwEqtogaxqiL+NBZZYLCiaFW7lBCwdC7qST0IKES
         s9mzbA85n6Bf7x2kFwIZuwd/VvQ68c+JVZE5cngG0/PLDy9XTr5ALRHdkiBE+v1W6PY5
         Mj2RT+kpdcEmuFEL6hNf5U/u9l9NwkDaCa8tybIhAWf4cshuf7c5dMpy8jbo/smC27HV
         14sjr7zy5QWn6SO+wGzIdvRK5DrVMHx9i8aXsMXUo58+Cw9q/C50/VMBOixs6zXGE+Wp
         UN6zCP9qRO1AiuNX6vAYZrOB/939ZI2lVGI9OIFEyTkyS77TEC+tLjhB4cGBpfFonCs1
         MGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=q6SwzukIGcxPFyO6js5BlgPrDffrpZRFzJ4HpsBJDyw=;
        b=V1N/6+S0P03XAg0bGXHfGtxDdGfElQ9JAY61lOM8eKBaeEQyLqIBPnT6Fh9sz/wnJQ
         /WXMFOteC8PU/shv284PqNIc/U7kpL5gaEN8KquxGPCnomdcA8ZZ7T3KzTKE6gphIKH9
         qt2xoIMKVkPLdmMR/sJPXd8L/48IhGCvJOHSuv7FDyIJKSU19PwWCETwhywxuNfFHQfD
         aCe8MyoOrxM+/xdAyaL5q/5Lwy7EWvkOB61bK6Ae9Ld+48velztTMMYyQyBy3HpKHgJ/
         PL/N5Rx9vJUj6d34BBF6n/6STmJ7AQ3KFMwpeJphK3bzXPTVcncTwgl3plOUmrbJiVcm
         yIFA==
X-Gm-Message-State: AOAM530ZYnALpvna+Hcoh6d0L+27/4yJ6ibJslEMGCniFdRLPTD6RAFK
	bou1HvpZ7yBCM6R0kHbDzVckUkH9/na5xK/rL0E=
X-Google-Smtp-Source: ABdhPJwdAzXyq42AbHh2QiLJ/LM60V/EQ532h8a14LvDmGDFtcUmMCh2arYxDwIyDe2+4u5eJwe2dg==
X-Received: by 2002:a63:584e:: with SMTP id i14mr1020720pgm.433.1597892821839;
        Wed, 19 Aug 2020 20:07:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 22sm587179pgd.59.2020.08.19.20.07.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 20:07:01 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Pull request (cover letter only)
Date: Wed, 19 Aug 2020 17:06:50 -1000
Message-Id: <cover.1597892728.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit b95d6aeafb70765e22d2e1254e749a48f508d489:

  uninative: Handle PREMIRRORS generically (2020-08-09 09:26:54 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Bruce Ashfield (3):
  linux-yocto-rt/5.4: update to rt32
  linux-yocto/5.4: update to v5.4.56
  linux-yocto/5.4: update to v5.4.57

Khem Raj (4):
  glibc: Bring in CVE fixes and other bugfixes from 2.31 release branch
  gcc-9.3.inc: Mark CVE-2019-15847 as fixed
  go: update 1.14.4 -> 1.14.6
  go: Upgrade to 1.14.7

 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/0016-Add-unused-attribute.patch     |  31 ---
 .../glibc/glibc/CVE-2020-6096.patch           | 112 ----------
 .../glibc/glibc/CVE-2020-6096_2.patch         | 194 ------------------
 meta/recipes-core/glibc/glibc_2.31.bb         |   5 +-
 meta/recipes-devtools/gcc/gcc-9.3.inc         |   2 +
 meta/recipes-devtools/go/go-1.14.inc          |   5 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 10 files changed, 24 insertions(+), 363 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0016-Add-unused-attribute.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch

-- 
2.17.1

