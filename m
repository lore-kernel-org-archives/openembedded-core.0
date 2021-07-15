Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.8397.1626358110230847955
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 07:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=l7r8/HuJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id m83so5377016pfd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 07:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WCfRoGMyRQsOkpcyTfwPr8iDW56jirILMffN02f0Xbw=;
        b=l7r8/HuJpKeM40iLxnhVppY6/nhGO893FfQaFJgdMHT4TUd6CtaQrYFI0x8myHbyj7
         1g33GbmhrHE4xSeozmSZXQU9DG1SvT2g3MuNPXGlQDeiDdxeppg7RTI6MyvQJeMjCLv3
         51BnEeZ0N9ZRDB4ZtEscQHeoMHuPyG6lBlk7crrz6zUM7VlUU7UBn+ZJQaOk7VNus6ww
         FeBfuFSXuazg9f4dwOHGkpCOVARNyKKgOppkNWhxaqRuCGdrVQPK9UzU3Fo5hbCruxRw
         WRqRsl6RA0V/0BBbT+0CqMRXn0bcIzlv/RIJdxYmURTNNk6PkmzfRRn6WU1vKB7/XcXX
         Aq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WCfRoGMyRQsOkpcyTfwPr8iDW56jirILMffN02f0Xbw=;
        b=DSgnABsCMlm0F0RZI3jG+hBgFolLJv85CmSq+qxKZB/jOb5DkZnLoQBKgn5ek2fS3/
         lAp75nNhal70hyQZBycayum6hbFY0yaz4R5n5rolInvbLrR9N4LqzyTCR9bq1Aer9pNo
         bt4LAhp9IRBzhymCsJK26xr+/nq5b4lT8TXkN811wAlYjjyIJ9k3ox2Z8n2CbHwuEU6B
         JAw2Go8yZYj1ipLTIsOVx2hUAE2f7ugpfPTvg4r/aB3NA3n46lyHYUS4EgWmrMJtmL2n
         NQraA9UGVzuh40Spyvb4SXry47PC0pmPkzGjfDnBteHCZRhTG63ttTLN0ZGVwCm3eTSz
         JM5w==
X-Gm-Message-State: AOAM531VfaEQBBCJVBa7GLgA+k0PhXbCldESv1d2qcVWPUisxiURgGKl
	HEnep/qpgXc6y0F9HzfJDCsg0oZzvphdFb6n
X-Google-Smtp-Source: ABdhPJzuVh+U4LxWGl4NlX8XXV4FwU1Spjen1XnvBF1dmjHEnZhWkZTaRvz4A1zgWu3v3pr/qK2A8w==
X-Received: by 2002:a63:5cb:: with SMTP id 194mr4766125pgf.146.1626358109096;
        Thu, 15 Jul 2021 07:08:29 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u185sm6915353pfu.49.2021.07.15.07.08.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 07:08:28 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Patch review
Date: Thu, 15 Jul 2021 04:07:18 -1000
Message-Id: <cover.1626357703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2350

The following changes since commit cfd74f2bae51413d9c327e0f08ecf751325c2d74:

  report-error: Drop pointless inherit (2021-07-11 06:19:43 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Andrej Valek (1):
  busybox: add tmpdir option into mktemp applet

Richard Purdie (3):
  pseudo: Add uninative configuration sanity check
  pseudo: Update to latest version including statx fix
  sstate: Drop pseudo exclusion

Steve Sakoman (3):
  bluez: fix CVE-2021-3588
  gstreamer-plugins-base: ignore CVE-2021-3522 since it is fixed
  gstreamer-plugins-good: ignore CVE-2021-3497/8 since they are fixed

 meta/classes/sstate.bbclass                   |  2 -
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../bluez5/bluez5/CVE-2021-3588.patch         | 34 ++++++++
 .../0001-mktemp-add-tmpdir-option.patch       | 81 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |  1 +
 meta/recipes-devtools/pseudo/pseudo.inc       | 13 +++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +-
 .../gstreamer1.0-plugins-base_1.16.3.bb       |  4 +
 .../gstreamer1.0-plugins-good_1.16.3.bb       |  5 ++
 9 files changed, 140 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2021-3588.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch

-- 
2.25.1

