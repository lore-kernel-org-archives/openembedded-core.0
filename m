Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.3076.1602645266466291636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 20:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=G6Hga4bf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id b193so1078100pga.6
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 20:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=Z8I5YUpCgSWsf/l/xrBGMYYVqcngCfwxy5i+PY9u3tI=;
        b=G6Hga4bfXgs3zidQOHNn3bAg3cesJQfnCqQ4/w5NXzGf/4WeXLwmCnndZSR9iuHsZ3
         uabOIMiSLckid+6ODs8l/j+SFKf0n1840I4EL5oy0/zgXM5lY4MzDkIbPEhHg5Ecs1Hv
         nrxp1HlSpr/zypy/Lcs8vzT9oqWCBOUgHgqB1m4fVLcPvXSYYXbUoYNfOuQIZhxpq1Yv
         i5CD2wSFq0taOeqc6pZBYsvYZE41fAFetBWztbUFSVng0sGZu40sQqQxOr1dgasYUp3m
         YEHsj0C3IGqwSH0/ha4RuSq7bCHsImaZ9NscPD+XTz3f7ahGIicUhm4QBm3IUf98ctRe
         GV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=Z8I5YUpCgSWsf/l/xrBGMYYVqcngCfwxy5i+PY9u3tI=;
        b=WvyColl0Ug5W/grr1ikz1D5dHhC6e+6+aN5RjTqg+X2sj1Mm3qAcbV3wMVUjRa19CF
         v0ws1bJ+GQuH/Vy5inT01bqCSKjGPiGxHvYJK63s8zoF5NiBWruCkjYxLZKMqhATZqRI
         vA8VuFWlmXMXzBkqaxQPSO63E/zozepO1qOn2NGJxztiorkGj7gmX9xCgasplUA1KXy+
         PRL+K10WkABuGgAbpZswUHwT4E63S+QMrUYPqCPPk6zrTSVkEikfTBeevCFHmM2DqqaC
         JA37Mlpn74XEGvZNJBlfmEmNkI2+8Vg4qpPUtGYeuyNxbYTU7JVocq0OY7KvzfE760/P
         JFpw==
X-Gm-Message-State: AOAM532RMS7IL4mGs3f0feGaW0aFjPrU/t7s0ydbWp1V3l84UjMDEj0k
	Gg8BeZv+9DbfhYodpOnqRiyUy08r6TSxdddR
X-Google-Smtp-Source: ABdhPJxrQtKr/GvTFI2pRx3RxSkdccCwq+DbwiP0sXOsE0EfULeX82fQJiZIIydHlvEZX9AsKHliwg==
X-Received: by 2002:a62:1406:0:b029:155:7e44:ddf7 with SMTP id 6-20020a6214060000b02901557e44ddf7mr2437993pfu.37.1602645264785;
        Tue, 13 Oct 2020 20:14:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u22sm1173594pgi.85.2020.10.13.20.14.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 20:14:23 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Pull request (cover letter only)
Date: Tue, 13 Oct 2020 17:14:14 -1000
Message-Id: <cover.1602645171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit 552739383321bd9b4780bd0026d6107ece530522:

  perl: fix ptest test count (2020-10-05 04:29:40 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Bruce Ashfield (4):
  linux-yocto/5.4: fix kprobes build warning
  linux-yocto/5.4: update to v5.4.67
  linux-yocto/5.4: update to v5.4.68
  linux-yocto/5.4: update to v5.4.69

Joshua Watt (1):
  classes/sanity: Bump minimum python version to 3.5

Marek Vasut (4):
  lttng-modules: update to 2.11.6
  lttng-tools: update to 2.11.5
  lttng-ust: update to 2.11.1
  stress-ng: Upgrade 0.11.01 -> 0.11.17

Richard Purdie (2):
  glibc: do_stash_locale must not delete files from ${D}
  libtools-cross/shadow-sysroot: Use nopackages inherit

Steve Sakoman (1):
  Revert "lttng-modules: backport writeback.h changes from 2.12.x to fix
    kernel 5.4.62+"

 meta/classes/sanity.bbclass                   |   4 +-
 meta/recipes-core/glibc/glibc-package.inc     |   1 -
 .../libtool/libtool-cross_2.4.6.bb            |   2 +
 .../shadow/shadow-sysroot_4.6.bb              |   2 +
 ...ownership-when-installing-example-jo.patch |   2 +-
 ...ess-ng_0.11.01.bb => stress-ng_0.11.17.bb} |   4 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +--
 ...ckport-writeback.h-changes-from-2.12.patch | 128 ------------------
 ...ules_2.11.2.bb => lttng-modules_2.11.6.bb} |  11 +-
 ...-tools_2.11.2.bb => lttng-tools_2.11.5.bb} |   4 +-
 ...ttng-ust_2.11.1.bb => lttng-ust_2.11.2.bb} |   4 +-
 13 files changed, 36 insertions(+), 162 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.01.bb => stress-ng_0.11.17.bb} (83%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-backport-writeback.h-changes-from-2.12.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.11.2.bb => lttng-modules_2.11.6.bb} (81%)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.11.2.bb => lttng-tools_2.11.5.bb} (98%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.11.1.bb => lttng-ust_2.11.2.bb} (93%)

-- 
2.17.1

