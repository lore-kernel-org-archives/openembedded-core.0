Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC088C433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 23:00:00 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.4185.1651705195413466501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 15:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=p4fhNT3a;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id o69so2535268pjo.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 15:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HAQ/yb1bI+f5ICTIcbpu7YSA4jZ2j2ls6ZuG676gR1Y=;
        b=p4fhNT3awGmCyACHrqliEoe5KTd3alw4iAAlZ90nIsj9T0v/0+dDNmS5qyKS3TigJN
         Ahy3/DTMCXeewlOkfT4gd5zXk55Ke3YGOIVmRf1lFPETwOt7LI8TpRc06tvK+WZpkr+t
         VYGSKWmm+26edixt2qUOYT6vqzzpayYmkD5y+14QTCq12VmR17Wtmt/bcCuSwipdfO8J
         ylLYFmNeNYbgDYHbnnqZOheyYAjAVhWNsCysu8hs1YzDo1bVfMOlplDJ/LgBMy8ip1CB
         k5FMeO+glVzBUZLWw03mxMGuecmkj8lbw3h5KaeECDqJoNEh0RAT+QtzkvQLzNDlInvO
         I9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HAQ/yb1bI+f5ICTIcbpu7YSA4jZ2j2ls6ZuG676gR1Y=;
        b=BAljLnMcAgHA/jYVoVal7PXZjJy6Hy/ozGB01HMAQUJVVy2gpNUiJtapYviK4mgKj/
         W/G/wLeMOWTGBvLybaV1vOMSYCGlqzMXbfC/g64TvX5fq44Q2wUDoEuLdo87wP71VhBN
         NH+jLtEPr0T98Vo4INmJbMPazvmfNVBKPLlGgjvU4F2S+LyH4kkUeIe6y24Rkz43y8ci
         i/kvdvAXjeklQFw8/h62JqwvmjB8KfBHK71Xa2wq3yFqLapf5+/2ybphnB6NnLg0uVV5
         62saZSYa27I3XVVbE5+kCbhcaPWnPM09XxFJnQ5LR16V8DuSCqPag2lr2Z8nepqVd26e
         wDYA==
X-Gm-Message-State: AOAM532eBR/K7xBG7HjpzB7ooGbBkdGCZGYmOi7Et5+oJmbROoMEAcd/
	5yYqjAhmo0zHoGgc4qu2dYosDI+ubxhj3M+0Cpo=
X-Google-Smtp-Source: 
 ABdhPJz0pvoN2HFIuhtKwAXMk98WRck4RhQwTiB9OF0XbwO0nYP59qo5gocsz19Kikp4+7ukdoZgvA==
X-Received: by 2002:a17:90b:180d:b0:1dc:6c19:afd3 with SMTP id
 lw13-20020a17090b180d00b001dc6c19afd3mr2263922pjb.84.1651705193885;
        Wed, 04 May 2022 15:59:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z3-20020a170902708300b0015e8da1f9e8sm19552plk.77.2022.05.04.15.59.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:59:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/8] Pull request (cover letter only)
Date: Wed,  4 May 2022 12:59:44 -1000
Message-Id: <cover.1651705136.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 May 2022 23:00:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165227

The following changes since commit bb3fc61f0d7f7bcd77ef194b76f4fdd8a7ff6aa5:

  scripts/contrib/oe-build-perf-report-email.py: remove obsolete check for phantomjs and optipng (2022-04-27 05:00:00 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Chen Qi (1):
  cases/buildepoxy.py: fix typo

Khem Raj (1):
  busybox: Use base_bindir instead of hardcoding /bin path

Paul Gortmaker (1):
  install/devshell: Introduce git intercept script due to fakeroot
    issues

Rahul Kumar (1):
  neard: Switch SRC_URI to git repo

Richard Purdie (2):
  base: Drop git intercept
  uninative: Upgrade to 3.6 with gcc 12 support

Ross Burton (2):
  python3: ignore CVE-2015-20107
  bitbake.conf: mark all directories as safe for git to read

 meta/classes/devshell.bbclass                 |  2 ++
 meta/conf/bitbake.conf                        |  8 ++++++++
 meta/conf/distro/include/yocto-uninative.inc  |  8 ++++----
 meta/lib/oeqa/sdk/cases/buildepoxy.py         |  2 +-
 meta/recipes-connectivity/neard/neard_0.16.bb | 13 +++++++------
 meta/recipes-core/busybox/busybox.inc         |  2 +-
 .../recipes-devtools/python/python3_3.8.13.bb |  3 +++
 scripts/git-intercept/git                     | 19 +++++++++++++++++++
 8 files changed, 45 insertions(+), 12 deletions(-)
 create mode 100755 scripts/git-intercept/git

-- 
2.25.1


