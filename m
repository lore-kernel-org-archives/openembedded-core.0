Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.581.1605901582979487253
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 11:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MaU+xozS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id v12so8842116pfm.13
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 11:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=06pD66zRkGGKtMAnLigOy4SoSXYEKMF0Jm+aM9No0vE=;
        b=MaU+xozSkVzQ9IXbCXIS7wFcAQNxmQMkYaUYPeiNYmjIrP3ndkI+G31eYyg3EzBUg8
         OkhqQfhqUApfbUHAErxs/iSxrQGYGmbe6IxgKgsx6/rCG2bZQy9l6gKu+8Iy01/nGDR0
         HeUPHKqElsuw0GuzUWUwtjwtBbdxEpuHe4tWna8WaWEuHsRDav+8/akGaTyLj/xhm3D8
         M3Z06e0r926r63cF8F/KCWm/x+G/4epPnr4qXvS2/s2vSrwEmZTZwwPbqM0Vktea22ni
         VCQXJfQ8dXI5DWOCOQ/BSCIE/J2wSaoTWdVkZf01UBHgPwKTZSNeKKYkVczCuSA6ix9N
         ZHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=06pD66zRkGGKtMAnLigOy4SoSXYEKMF0Jm+aM9No0vE=;
        b=af9BnvSYdmq/WASvaTeDA6KPtk0egjf8oSLMA07oElvG9cotUoJMXOrznH00VS8x6W
         TdJsl14rWKjaGgSHBA4Zk5Co2BbmjNc9NW64TQzKgnz0kQK1QS4eE0RMA3J971bXBRFY
         Sa5jBa+NVGcSj8U3LIX7nXnVxkGfS0vursnwNQ+LjjOakaoLjKV7mpYlUsuGZVv9TnS4
         jwp4LTdKvA6H+tnwqDZgKn+D+oJs/j8A5rnlSaLA2ZT0uScXdbsgeUff16r6KU+Xs/gc
         JG+lXwgaX2TRPMl8gfMuwxlEdO+GkQ3pAhOsQ1KUYE8WUULRLz6tnnE7Ot8eL/TWXgG7
         3B6g==
X-Gm-Message-State: AOAM533j/9aLYB+bpv/9QB/r01oXjgzDj651rxjnNjqC8Bnh2utD7EiP
	rizZ1wV7oUOWVy4kJ8I7aQ94vB0EWpagcu+u
X-Google-Smtp-Source: ABdhPJwCpfl5c3OL75MelYbp/oZmhWcfU5SKif6NyXzftTdjXn0mBJAN30SY2/JIo1VKk8ucY3cMzw==
X-Received: by 2002:a17:90a:e604:: with SMTP id j4mr12538941pjy.19.1605901581904;
        Fri, 20 Nov 2020 11:46:21 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s4sm4701945pjn.0.2020.11.20.11.46.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 11:46:20 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/9] Pull request (cover letter only)
Date: Fri, 20 Nov 2020 09:46:11 -1000
Message-Id: <cover.1605901407.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit b4a92a20a683a74423fd5a833d5c016f63dba2b4:

  freetype: fix CVE-2020-15999, backport from 2.10.4 (2020-11-13 05:57:16 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (2):
  ptest-runner: fix upstream version check
  glib-2.0: correct build with latest meson

Anibal Limon (1):
  ptest-runner: Bump to 2.4.0

Joshua Watt (3):
  classes/reproducible: Move to library code
  lib/oe/reproducible: Fix error when no git HEAD
  lib/oe/reproducible.py: Fix git HEAD check

Khem Raj (1):
  ptest-runner: Backport patch to fix inappropriate ioctl error

Mark Jonas (1):
  libbsd: Remove BSD-4-Clause from main package

Mingli Yu (1):
  python3: add ldconfig rdepends for python3-ctypes

 meta/classes/reproducible_build.bbclass       |  90 +--------------
 meta/lib/oe/reproducible.py                   | 104 ++++++++++++++++++
 .../glib-2.0/meson.cross.d/common-linux       |   2 +-
 meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
 meta/recipes-support/libbsd/libbsd_0.10.0.bb  |   3 +-
 ...-runner_2.3.2.bb => ptest-runner_2.4.0.bb} |   5 +-
 6 files changed, 114 insertions(+), 91 deletions(-)
 create mode 100644 meta/lib/oe/reproducible.py
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.3.2.bb => ptest-runner_2.4.0.bb} (87%)

-- 
2.17.1

