Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64410C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 19:34:48 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.3385.1645472087089622496
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=pw3X75v2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id ay3so4860125plb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=StQ+ezjiwtOhy/WiAwgiiFukiC/GULFG74l6vRzAcUU=;
        b=pw3X75v2AX5s7cJ5qfo/qvxrZZZ+53/cQorSFURRl4vthv//UG31aHpT+UdZEwMPAY
         PXjsSJmoxK/8IAGkwReySa71Di/O+4F8NiTDaKcpkCb09WiFWINYeD7Jg8v+b2YtiTAB
         tzGJXm5qUuwPrfR34NW3jAHluy5oCRsTW5pGVkE61x+ELRtR2mWaP/doy/jRCbpZIxwP
         HKLeWbTnGkfXqPBPgr503NoIB9k3Qld6nU47J7607H6B8wqF0EKm+EdQQXsGniZQ+BRM
         /d9yEqb2Q0Gg5gObzZYg6rdA8gZTQQj/P3YMM6Y6Zre/AbvBBEvow4dA3h73yfdbUK+e
         HUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=StQ+ezjiwtOhy/WiAwgiiFukiC/GULFG74l6vRzAcUU=;
        b=GxFzkh6JDvJjciramsuUzgsgTQIHKgXRc3JLkiIe9p/0m+q+qnU3p1nT2FvF07k+gp
         zQVTH8VxpZL/2RrjyyK3La+s764ljirgSY+kCiMrU2FayhwuCGs5SltxisSCCSqZLB8j
         ePAebbNfuRJmCLN3Tzci/CjjhxFDhqrqcWwB/FO9xSU34I33jNcN0NlDV7D8M9hW/VKW
         IsxywSwLi65crMnLmEFENJuuVmK0rGvpU2pTTqb+CUX5gaSU9K6BUuJARr2hNz7BilG6
         cKCnAGuLzgQJe+hwgp9rqbtojb47GLjbiH4pms3oY1kN7vtTjRhVCVENjjw8iaeS3yEv
         L00w==
X-Gm-Message-State: AOAM532hgI+OnXp2hF2nY6cV/wyE22lswfENILK+kJhSI5S8DqGQdm9G
	bGW8jB8fAA4OntIK23fS6UV6Cpo6SI5mAfgw
X-Google-Smtp-Source: 
 ABdhPJyz1dAdt2+RX60UKPXxUt7G+29kA/eCG/6g6wbNR0nkSgvjFQFiFXfbz219uetj6p/E4PTpzA==
X-Received: by 2002:a17:902:a611:b0:14f:9d5d:950a with SMTP id
 u17-20020a170902a61100b0014f9d5d950amr9973225plq.69.1645472085821;
        Mon, 21 Feb 2022 11:34:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s2sm14286657pfk.3.2022.02.21.11.34.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 11:34:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/8] Patch review - vim CVEs
Date: Mon, 21 Feb 2022 09:34:21 -1000
Message-Id: <cover.1645465376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 19:34:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162067

There's a fairly constant flow of CVEs being reported for vim, which are
getting increasing non-trivial to backport. There are currenly 26 CVEs
outstanding for vim in dunfell.

This has been handled in master with a number of version updates. Since
vim is a fairly stand-alone package it seems to make sense to also follow
this strategy for dunfell.

This patch series backports the vim version updates from master.

I'd love to get some feedback on this approach.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3256

with the exception of a known autobuilder intermittent issue on oe-selftest-ubuntu,
which passed on subsequent retest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3193


The following changes since commit 81fab225daf798792c139f669f5bfd96d9fd25a8:

  ruby: fix DEPENDS append (2022-02-21 04:52:33 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (1):
  vim: do not report upstream version check as broken

Richard Purdie (2):
  vim: Upgrade 4269 -> 4134
  vim: Upgrade 8.2.4314 -> 8.2.4424

Ross Burton (4):
  vim: set PACKAGECONFIG idiomatically
  vim: upgrade to 8.2 patch 3752
  vim: update to include latest CVE fixes
  vim: upgrade to patch 4269

Steve Sakoman (1):
  Revert "vim: fix CVE-2021-4069"

 ...1-reading-character-past-end-of-line.patch |  62 ------
 ...src-Makefile-improve-reproducibility.patch |  13 +-
 ...28-using-freed-memory-when-replacing.patch |  83 -------
 ...eading-uninitialized-memory-when-giv.patch |  63 ------
 ...rash-when-using-CTRL-W-f-without-fin.patch |  92 --------
 ...llegal-memory-access-if-buffer-name-.patch |  86 --------
 ...ml_get-error-after-search-with-range.patch |  72 ------
 ...nvalid-memory-access-when-scrolling-.patch |  97 --------
 .../vim/files/CVE-2021-3778.patch             |  61 ------
 .../vim/files/CVE-2021-4069.patch             |  43 ----
 ...1e135a16091c93f6f5f7525a5c58fb7ca9f9.patch | 207 ------------------
 .../vim/files/disable_acl_header_check.patch  |  15 +-
 .../vim/files/no-path-adjust.patch            |   8 +-
 meta/recipes-support/vim/files/racefix.patch  |   6 +-
 ...m-add-knob-whether-elf.h-are-checked.patch |  13 +-
 meta/recipes-support/vim/vim.inc              |  27 +--
 16 files changed, 33 insertions(+), 915 deletions(-)
 delete mode 100644 meta/recipes-support/vim/files/0001-patch-8.2.3581-reading-character-past-end-of-line.patch
 delete mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3428-using-freed-memory-when-replacing.patch
 delete mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3582-reading-uninitialized-memory-when-giv.patch
 delete mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch
 delete mode 100644 meta/recipes-support/vim/files/0003-patch-8.2.3487-illegal-memory-access-if-buffer-name-.patch
 delete mode 100644 meta/recipes-support/vim/files/0004-patch-8.2.3489-ml_get-error-after-search-with-range.patch
 delete mode 100644 meta/recipes-support/vim/files/0005-patch-8.2.3564-invalid-memory-access-when-scrolling-.patch
 delete mode 100644 meta/recipes-support/vim/files/CVE-2021-3778.patch
 delete mode 100644 meta/recipes-support/vim/files/CVE-2021-4069.patch
 delete mode 100644 meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch

-- 
2.25.1


