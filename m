Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC40C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 15:09:07 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.13465.1638976146550482116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 07:09:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=V0I9SRPg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id l64so2283804pgl.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 07:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SkQQ/Z8/d0SXDbMSWRfOpYW2TwsYiMw1oQim6Km1eKQ=;
        b=V0I9SRPgcGRHDQmKCEFsuepKdVfeDd26xJ+CuEpFA0mDcB0SIlXVuG6o4YikRFz5LM
         OH8apg5SdPA/DiwhcWaGAczMQpaSneIorZPD8M/kpMKz0IDvaVh9QX9wOUh3NwG/BkgJ
         qs89rJkk/1UebhsWqJxA8plAplwCPJt0CDwBCD2XitGTblFKIv2fXx+Z08HSuzlLL/9G
         PreT6LvQQtyeVVo8p/iN1sFi4fN8mC0ZQJ5EN8RH5a5+kO9TCWEkfCXNsxjR+z2LSWpf
         K/eRLagNSBthSBwNllzrFunm+8UOrblCMpyXWi3sfr6kAs1cJj2Wok330xeWaLDrGIE/
         tcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SkQQ/Z8/d0SXDbMSWRfOpYW2TwsYiMw1oQim6Km1eKQ=;
        b=iVLd7QrTT78RsDpD6liUq3mTJtlI5VOb9erteEeUidr2SePLCdpnHvT8QLSPJq8uFg
         HgJVROIrEP4ngkx/PYH49qB4cAa1Pa90EzxqAhy/tbGxQj3bOYQ0TYkqhYjbjVVbcQz9
         EoDqi/lFOXhixbxUzJYZN6r7SGTplhfGoz7qY32dGiAHwdLa7Z5kmSP+Z69tJrN73LT8
         1gXJ18BhVnTxxiILKFoApEIl0NFwMEavWYBUPUslMRqbUJPmjLVf68fthUvwXFPx38lH
         q/30LN2ge/zZoSS8La6Dgk8ofQMaUUnUXTPpqaQqpFNg2Rmw7xpy3/cfvhGP+VrPDANH
         SBDA==
X-Gm-Message-State: AOAM5309N+icNNrhiXBRLoOnBha2PhUCX81yL0vRjpX/eQH1U6WBmIjy
	SjeVeg0P5FH7qdDBAckKgRZLt+34URbZ1FVD
X-Google-Smtp-Source: 
 ABdhPJysodJxNnWJJaI/F+n2uBOhevTqI6UVRYdDbSQLJwvDoOFG+cGTxIryzApKS6dIMeavQ4mThQ==
X-Received: by 2002:a63:8749:: with SMTP id
 i70mr29100722pge.379.1638976145136;
        Wed, 08 Dec 2021 07:09:05 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y31sm4475537pfa.92.2021.12.08.07.09.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 07:09:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/17] Pull request (cover letter only)
Date: Wed,  8 Dec 2021 05:08:53 -1000
Message-Id: <cover.1638976040.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 15:09:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159360

The following changes since commit f61fcb6e176f19f1e768ce63a693f238713c8887:

  openssh: remove redundant BSD license (2021-12-02 05:11:21 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Dhruva Gole (1):
  scripts/checklayer/common.py: Fixed a minor grammatical error

Eero Aaltonen (1):
  cmake: FindGTest: Add target for gmock library

Jate Sujjavanich (2):
  libdnf: Backport bugfix for upgrade calc
  dnf: Backport bugfix for upgrade

Khem Raj (1):
  libunwind: Backport a fix for -fno-common option to compile

Neetika Singh (1):
  glib-2.0: Add security fixes

Pavel Zhukov (2):
  busybox: Fix for CVE-2021-42374
  busybox: Fix for CVE-2021-42376

Quentin Schulz (1):
  README.OE-Core.md: update URLs

Ranjitsinh Rathod (2):
  ncurses: Fix for CVE-2021-39537
  libsolv: update tag for missing CVEs

Richard Purdie (2):
  buildhistory: Fix srcrevs output
  oeqa/parselogs: Fix quoting

Ross Burton (1):
  vim: fix CVE-2021-3968 and CVE-2021-3973

Steve Sakoman (3):
  bind: update to 9.11.33
  bind: update to 9.11.34
  bind: update to 9.11.35

 README.OE-Core                                |  10 +-
 meta/classes/buildhistory.bbclass             |  30 +-
 meta/lib/oeqa/runtime/cases/parselogs.py      |  14 +-
 .../bind/{bind_9.11.32.bb => bind_9.11.35.bb} |   2 +-
 .../busybox/busybox/CVE-2021-42374.patch      |  53 +++
 .../busybox/busybox/CVE-2021-42376.patch      | 138 ++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   2 +
 .../glib-2.0/glib-2.0/CVE-2021-27218.patch    | 129 ++++++
 .../glib-2.0/glib-2.0/CVE-2021-27219-01.patch | 170 +++++++
 .../glib-2.0/glib-2.0/CVE-2021-27219-02.patch | 249 +++++++++++
 .../glib-2.0/glib-2.0/CVE-2021-27219-03.patch | 131 ++++++
 .../glib-2.0/glib-2.0/CVE-2021-27219-04.patch | 298 +++++++++++++
 .../glib-2.0/glib-2.0/CVE-2021-27219-05.patch |  54 +++
 .../glib-2.0/glib-2.0/CVE-2021-27219-06.patch | 101 +++++
 .../glib-2.0/glib-2.0/CVE-2021-27219-07.patch |  76 ++++
 .../glib-2.0/glib-2.0/CVE-2021-27219-08.patch | 101 +++++
 .../glib-2.0/glib-2.0/CVE-2021-27219-09.patch | 100 +++++
 .../glib-2.0/glib-2.0/CVE-2021-27219-10.patch |  59 +++
 .../glib-2.0/glib-2.0/CVE-2021-27219-11.patch |  63 +++
 .../glib-2.0/CVE-2021-27219-reg1-1.patch      |  36 ++
 .../glib-2.0/CVE-2021-27219-reg1-2.patch      |  38 ++
 .../glib-2.0/CVE-2021-27219-reg1-4.patch      |  38 ++
 .../glib-2.0/CVE-2021-27219-reg1-5.patch      | 100 +++++
 .../glib-2.0/CVE-2021-27219-reg2-1.patch      |  49 ++
 .../glib-2.0/CVE-2021-27219-reg2-2.patch      |  43 ++
 .../glib-2.0/CVE-2021-27219-reg2-3.patch      | 232 ++++++++++
 .../glib-2.0/glib-2.0/CVE-2021-28153-1.patch  |  27 ++
 .../glib-2.0/glib-2.0/CVE-2021-28153-2.patch  |  42 ++
 .../glib-2.0/glib-2.0/CVE-2021-28153-3.patch  |  57 +++
 .../glib-2.0/glib-2.0/CVE-2021-28153-4.patch  | 265 +++++++++++
 .../glib-2.0/glib-2.0/CVE-2021-28153-5.patch  |  55 +++
 meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb |  24 +
 .../ncurses/files/CVE-2021-39537.patch        |  30 ++
 meta/recipes-core/ncurses/ncurses_6.2.bb      |   1 +
 .../cmake/cmake-native_3.16.5.bb              |   1 +
 ...ndGTest-Add-target-for-gmock-library.patch | 255 +++++++++++
 ...ackages-in-upgrade-job-RhBug-1728252.patch |  60 +++
 meta/recipes-devtools/dnf/dnf_4.2.2.bb        |   1 +
 ...job-goal.upgrade-with-sltr-as-target.patch |  58 +++
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb |   1 +
 .../libsolv/files/CVE-2021-3200.patch         |   9 +-
 ...0001-Fix-compilation-with-fno-common.patch | 420 ++++++++++++++++++
 .../libunwind/libunwind_1.3.1.bb              |   1 +
 ...rash-when-using-CTRL-W-f-without-fin.patch |  92 ++++
 meta/recipes-support/vim/vim.inc              |   4 +
 scripts/lib/checklayer/cases/common.py        |   2 +-
 46 files changed, 3688 insertions(+), 33 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.32.bb => bind_9.11.35.bb} (98%)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2021-42374.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2021-42376.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27218.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-04.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-05.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-06.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-07.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-08.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-09.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-10.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-11.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-reg1-1.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-reg1-2.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-reg1-4.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-reg1-5.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-reg2-1.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-reg2-2.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219-reg2-3.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153-1.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153-2.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153-3.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153-4.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-28153-5.patch
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2021-39537.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake/0006-cmake-FindGTest-Add-target-for-gmock-library.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0040-Keep-installed-packages-in-upgrade-job-RhBug-1728252.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0040-Mark-job-goal.upgrade-with-sltr-as-target.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind/0001-Fix-compilation-with-fno-common.patch
 create mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch

-- 
2.25.1


