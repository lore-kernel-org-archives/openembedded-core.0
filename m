Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.16774.1591198484499993633
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 08:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=S6MEPyzk;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id t7so2016773pgt.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 08:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=SGzc7d3P16Rb3avBhCAOfU1dkdqFBXnbr31inUdKzqM=;
        b=S6MEPyzkCIwu1kwFeexYlv0TVpvPVmR8OWFoMkDIVwFqfewf8rDcwWQwj37UIPKVYm
         KdNvugtN3g7a+AqVUJhSySTRTdiFcJ6pLLa/yItDxG6i6V8YMpXY2wHeYX8BsTD9S6nz
         rv+MwvrldMLjSAf3v7ha8uyLeWPPtEWP/vNY5eLsTDx2O8S7YvpXWwVGkZ8dZ6SzbN4H
         uQxRLHq/AuEX8c7fVL1jMmCyzpV7vAiW/cu9pgqel5QuftadIDPUNn49Sbk6kCKk5PTj
         ggcce/sccUNwmMmWpmsxVgqrDAMdVAsl5AdSGvApZSZ5kh5+1nqDUH1KKvBQa30ed0Ep
         LdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=SGzc7d3P16Rb3avBhCAOfU1dkdqFBXnbr31inUdKzqM=;
        b=KRSFxri2/eHGVNKLriroldRyajQEW7ufF5ygjg6sPFM08MiO8EMKtZWUUI6mspU3Qd
         N3gMIxGUXOkfn6Udua/6UK1V2K1vQBqpguKwo8CO8XtrTPgHLJ4aZhE9Uxyfvqt7g9Im
         VsFO3iIXOv+y8tk6kX/2VS8jjM+jdjQX3e6/gePcNhRynI0Ov4MEz0N0fy7mg3SoL7V/
         stygy8B0MB16RhLISjKHcdNHCtKpCWg1FnAQL5GLMh4CqlslSRnfrEOKHa8LpMoptIUb
         XCl68b23p+HFFUlptXxBjush2gpPMljvwieopAYzegIZLtFLfhzR6sAVrZ9Mm0X/TLSO
         XCpg==
X-Gm-Message-State: AOAM530nGmZuQ2OenoAhqzSjRGGunma7DhwStYuVnhkXMACauNaiBC++
	RWXyV1C4SRxcXvfZKUiDKKYKOQRU4KM=
X-Google-Smtp-Source: ABdhPJxh6EluMODZQZkfixaOsrHazdsOXyclYxv7b/z1ePwwo5Ibj4NaQOE4ByInCR0XLr5OOJwilw==
X-Received: by 2002:a17:90b:1098:: with SMTP id gj24mr273024pjb.83.1591198483268;
        Wed, 03 Jun 2020 08:34:43 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id np5sm3187660pjb.43.2020.06.03.08.34.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 08:34:42 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/5] Patch review
Date: Wed,  3 Jun 2020 05:33:57 -1000
Message-Id: <cover.1591197295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Pending final approval for an exception to LTS policy in this case please
review this patch series and have comments back by end of day Thursday.

For details on the motivation for this change see:

https://lists.openembedded.org/g/openembedded-architecture/message/1085

The following changes since commit ef5af31f406076107402694f5d6afb27b240eba6:

  linux-yocto/5.4: update to v5.4.43 (2020-06-01 07:19:09 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Joshua Watt (5):
  pycryptodome: Import from meta-python
  pyelftools: Import from meta-python
  python3-pycryptodome(x): Upgrade 3.9.4 -> 3.9.7
  python3-pyelftools: Upgrade 0.25 -> 0.26
  layer.conf: Bump OE-Core layer version

 meta/conf/distro/include/maintainers.inc      |  5 +++-
 meta/conf/layer.conf                          |  2 +-
 .../python/python-pycryptodome.inc            | 26 +++++++++++++++++++
 .../python/python3-pycryptodome_3.9.7.bb      |  5 ++++
 .../python/python3-pycryptodomex_3.9.7.bb     |  9 +++++++
 .../python/python3-pyelftools_0.26.bb         | 14 ++++++++++
 6 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-pycryptodome.inc
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.9.7.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodomex_3.9.7.bb
 create mode 100644 meta/recipes-devtools/python/python3-pyelftools_0.26.bb

-- 
2.17.1

