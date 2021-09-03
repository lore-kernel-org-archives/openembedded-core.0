Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web12.4953.1630678279798834525
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 07:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kVXN5Xv5;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.174, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f174.google.com with SMTP id c79so7003542oib.11
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Sep 2021 07:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZtrTTUFLxxB6mi/RGQp9N5+s64F8tyVCdvEqPqXTC5k=;
        b=kVXN5Xv5F190zH+/h6evhxNtvDbhKdLNeRFktbV5Rxjj0KfKqN14G+oqU8WQ6dHI3o
         5XX5Ewp9DPsmQzqXuHmwLa02u1n7w7pXS0P0696aalJ7p7WH34Wo8xVjO7YhE9VhrbDs
         16/ghN3tGX4vngDPkXqLqNMYY8dMJNSTlxDimUS0Pqe3MjNcNhb6iK01T+6Der1/48b1
         0D2xS22shMe7mA+x4XZ5B+OEhvLq3S7EhZKa8N0MOyKfvc5u0dViSGB1l78IfMl/q74r
         7qO5BKv+sW3812u20o6vYjTov61AroH4dsNN0+QVk/5z11phqXgxLWAUdddA7W/lyZKH
         Zo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZtrTTUFLxxB6mi/RGQp9N5+s64F8tyVCdvEqPqXTC5k=;
        b=kTaaTenOZ5Y1kx93a+6pqnKcSzoNQjNTGrqy8mF+xqjmsfYrXc6/NYyM7//GT05gcb
         Br+OSgIf2la9keZCYSbV62TBkzdSTuAWh/CrYtTbIrxaS2+D978RAYJIha7/Alp77R88
         dDe5arlJnZz5ldAo1lfGmvDhh7wl6+JpvDMxY5aEpO0XxJGUdnuwB6sBAFya5Oih7IiH
         WnA7JfSTAsXrWL11YIUAeD31hewZCe7pgP1IAI+pHD5GIOvW98NXrRercMcr0oj6nMj6
         FeZaBEJkP+rzgiLJvggJDbeNrLhtoqbvWTNUv2/s8U27sZ8taR3kxbv1r9U/nL9HncC4
         YEuw==
X-Gm-Message-State: AOAM533/jkDAtewEprGyejir2H7lFdt7J4lOf/+uKU8R/A25IgTYnujS
	BNjvZBcsaNxG83G/vQAJcSeP0W0CVVL+4TlM
X-Google-Smtp-Source: ABdhPJw6fUhyMbGtOhKBEV5sNPD4gCs2+zOQZ5yZZ7kYIAwkEBUCtvQBtypyJtPkBJBZiObMyn5Lmg==
X-Received: by 2002:a05:6808:14ca:: with SMTP id f10mr6483337oiw.131.1630678278317;
        Fri, 03 Sep 2021 07:11:18 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id u14sm998007oth.73.2021.09.03.07.11.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 07:11:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/5] Patch review
Date: Fri,  3 Sep 2021 04:10:48 -1000
Message-Id: <cover.1630678081.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2540

The following changes since commit 448e0271ed831582bb5833486fc17b131676fb53:

  selftest: disable virgl headless test (2021-08-27 04:58:08 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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

