Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82824C352AA
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.3400.1650422592742878196
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 19:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=0cdTlRjY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id bg9so275784pgb.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 19:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2YYVXKKq80kp4XAh87ueXtWt/wcYXuAdnR4hAWUH17g=;
        b=0cdTlRjYpeSrykBClyTKsBCZfDODOvNe/NtuC+J52WrL2BW3psirAdn9xnmo+9Aelf
         KPhoq+NHz/1VN5fFeZx/SSsg2SbDNkiEGOgvMZtqw715BFw3SaoLFr5ysesWpA9gZm1w
         skf6r0hbKsR4DU4XdNRPEZ6LN0NDjBXw2FDpu8jSMSY/x1OTQNvkZpYYRAlUycYTn4/M
         J/7lzup5xe5KTlsZ2IMhT6LiB2PRe/Y+7WVJAA1X5y7AleH6a4lsjbW9oqFnlwJ7Kmhl
         iYZtOCjXcSjzNM7IzwdRDzpAk4Jlih8xHhgKByijKHL5w3gNXLIkYT0E4dawlLG9G04X
         t02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2YYVXKKq80kp4XAh87ueXtWt/wcYXuAdnR4hAWUH17g=;
        b=mzkMspzvKwzCSN1liofgU2+jr0K38eK9H7XFDyXFx9+M/5AIQbtDa1gfTGDt476gCQ
         LOiWonbLMoum4g0YP09+vQQHLMYwQj/PL9h/PX/iBMFSt/LMAH3OmWwHAscVWUGi3NWE
         i8d5uf8vWU/KCiiWsZdXtm9N+ollHhrvLs9smdfgq62jZIY41iFKXGhjQanoN2XYMvaP
         kQ/IsBo86PLer0DhgvKxlLhHLZy5IdsuUrXml5gPw+3CamfLfZ+U5FsjH1RJnA+jUwFi
         hjhWdoXMdqg8asMAae3WuAvNfnwlWep9Z+5gqkIB8rYVCuu4+CM+otRC6fFaNmUGYQWq
         Bj4g==
X-Gm-Message-State: AOAM531knWNkWNDO/xaeISQznt5CS4W98KZ++E8i5IlunwubvO2wC6aP
	tBsPzErqRvBio+qKiIETpKOQ0gDYT0e7OLnXKaI=
X-Google-Smtp-Source: 
 ABdhPJwvFo90EW0m28CY7pLQDT11etAH4a/3DE93M91vgE/KGMnDJInHtazqQpzj/gxUrI3ihSSpmg==
X-Received: by 2002:a05:6a00:23c3:b0:50a:9343:44e2 with SMTP id
 g3-20020a056a0023c300b0050a934344e2mr7115106pfc.37.1650422591534;
        Tue, 19 Apr 2022 19:43:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 83-20020a630656000000b003aa5bfbeb88sm947508pgg.57.2022.04.19.19.43.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 19:43:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Pull request (cover letter only)
Date: Tue, 19 Apr 2022 16:42:58 -1000
Message-Id: <cover.1650422444.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164652

The following changes since commit aa762b7ca2417b80dd114a4ab263d69074912f82:

  tzdata: update to 2022a (2022-04-04 04:22:32 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexandre Belloni (1):
  pseudo: Fix handling of absolute links

Martin Jansa (1):
  license_image.bbclass: close package.manifest file

Peter Kjellerstedt (1):
  metadata_scm.bbclass: Use immediate expansion for the METADATA_*
    variables

Ralph Siemsen (3):
  gzip: fix CVE-2022-1271
  xz: fix CVE-2022-1271
  apt: add -fno-strict-aliasing to CXXFLAGS to fix SHA256 bug

Richard Purdie (4):
  vim: Upgrade 8.2.4524 -> 8.2.4681
  git: Ignore CVE-2022-24975
  pseudo: Add patch to workaround paths with crazy lengths
  libxshmfence: Correct LICENSE to HPND

Ross Burton (1):
  zlib: backport the fix for CVE-2018-25032

 .../recipeutils/recipeutils-test_1.2.bb       |   2 +-
 meta/classes/license_image.bbclass            |   4 +-
 meta/classes/metadata_scm.bbclass             |  10 +-
 .../zlib/zlib/CVE-2018-25032.patch            | 347 ++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |   1 +
 meta/recipes-devtools/apt/apt.inc             |   4 +
 meta/recipes-devtools/git/git.inc             |   5 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 .../gzip/gzip-1.10/CVE-2022-1271.patch        |  45 +++
 meta/recipes-extended/gzip/gzip_1.10.bb       |   1 +
 .../xz/xz/CVE-2022-1271.patch                 |  96 +++++
 meta/recipes-extended/xz/xz_5.2.4.bb          |   4 +-
 .../xorg-lib/libxshmfence_1.3.bb              |   2 +-
 meta/recipes-support/vim/vim.inc              |   6 +-
 14 files changed, 515 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
 create mode 100644 meta/recipes-extended/gzip/gzip-1.10/CVE-2022-1271.patch
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2022-1271.patch

-- 
2.25.1


