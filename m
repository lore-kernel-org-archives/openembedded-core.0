Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD856C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 23:51:28 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.2772.1653004285507471183
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 16:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=FkesBgE7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so6537243pjq.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 16:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JUHP8BQQgGMJi8Pw1F+BbyA+9OHMs++ZYfUSb9i/HYA=;
        b=FkesBgE760Hf4zWDYKdF/TvcbXhE2Uhi9pvsAfnpNjVAmyTMr7Pzua7EXJqKLn/jFj
         dS5dpXP6PffFEy4KNc2pcyyR9f91fo4hOlLy8QEemfRYwgnQQCGkjIMwewNHiZn4n4lO
         xrq0u24DmnkCXDjsA2wrkFonowRxeozdc+Qw3vXiww64iDWiVtykQClnRnM/Q7VgvblN
         1xTXWYxGsDLTkPnE135EcHl38+efTRj7zqiLas0jhTGbDtczDSqkM0DPn7v9xc7SloBk
         yE8kx+gVSI7yLZudaOJKo5rG7r/LQdFhF0jhwoP0BMpMJeRlX+qsEpZAdG4mWGSvKOOq
         KFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JUHP8BQQgGMJi8Pw1F+BbyA+9OHMs++ZYfUSb9i/HYA=;
        b=wbvkd2IZEOvyoT5QN02HgHYrfsWwMpZXjEcaCYWp4OkiljCgSRHAgcOHunoy5z10vt
         emL6NGG0f2f0a2uR7GbOHIxdrA2pPBvOsEmhTIi4Zax8knVAJnWF+yRF9CuQ/BImWTZq
         U1mzBnsD4X1bEeig1feP7W+Fd74iA0QaDpOamPpQvcdJf4BjDw2eGwTsGNjSxZoxCGmU
         f1dEvsgyXpPfFcyaatM96GOsg1MIPaWiCsehASusiXJC4IizXwn73F7xEskuHmaRI4is
         fkxiRMAthHkyTF8j9n4cWoi5lNXaELqMq5x19o3jjaCAOBMaky7g8yhU/GYXqxnCR3ut
         3m+A==
X-Gm-Message-State: AOAM5316xMMR66Kc6N5OgS6P1t3yzBLaQX7GeljqJUccaxJbtjcy0cLK
	Dgd1ed+duhxLzW6bsCTYQLHSoqlochEKR5pK
X-Google-Smtp-Source: 
 ABdhPJyNW2Hg9G5OGn+oHlwYKsM6i0cNXLioBu19fPoOR37CMXwNhSIPjXqgHc8ooKjBEo3zfy+CSg==
X-Received: by 2002:a17:90b:1b0d:b0:1dc:672e:c913 with SMTP id
 nu13-20020a17090b1b0d00b001dc672ec913mr8360672pjb.102.1653004283870;
        Thu, 19 May 2022 16:51:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j64-20020a62c543000000b0050dc7628158sm261674pfg.50.2022.05.19.16.51.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 16:51:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/9] Pull request (cover letter only)
Date: Thu, 19 May 2022 13:51:15 -1000
Message-Id: <cover.1653004202.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 23:51:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165912

The following changes since commit 0f6ae13d76129d96f788b7ede312cfc361ee2bda:

  scripts/git: Ensure we don't have circular references (2022-05-10 08:23:12 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Dmitry Baryshkov (1):
  linux-firmware: upgrade 20220411 -> 20220509

Konrad Weihmann (1):
  linux-firmware: replace mkdir by install

Ranjitsinh Rathod (4):
  tiff: Add patches to fix multiple CVEs
  freetype: Fix CVEs for freetype
  git: Use CVE_CHECK_WHITELIST instead of CVE_CHECK_IGNORE
  openssl: Minor security upgrade 1.1.1n to 1.1.1o

Richard Purdie (1):
  vim: Upgrade 8.2.4681 -> 8.2.4912

Sana Kazi (1):
  curl: Fix CVEs for curl

Steve Sakoman (1):
  selftest: skip virgl test on alma 8.6

 meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +
 .../{openssl_1.1.1n.bb => openssl_1.1.1o.bb}  |   2 +-
 meta/recipes-devtools/git/git.inc             |   2 +-
 .../freetype/freetype/CVE-2022-27404.patch    |  33 ++++
 .../freetype/freetype/CVE-2022-27405.patch    |  38 +++++
 .../freetype/freetype/CVE-2022-27406.patch    |  31 ++++
 .../freetype/freetype_2.10.1.bb               |   3 +
 ...01-Makefile-replace-mkdir-by-install.patch |  84 ++++++++++
 ...20220411.bb => linux-firmware_20220509.bb} |   9 +-
 .../libtiff/files/CVE-2022-0865.patch         |  39 +++++
 .../libtiff/files/CVE-2022-0907.patch         |  94 +++++++++++
 .../libtiff/files/CVE-2022-0908.patch         |  34 ++++
 .../libtiff/files/CVE-2022-0909.patch         |  37 +++++
 .../libtiff/files/CVE-2022-0924.patch         |  58 +++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   5 +
 .../curl/curl/CVE-2022-22576.patch            | 148 ++++++++++++++++++
 .../curl/curl/CVE-2022-27775.patch            |  39 +++++
 .../curl/curl/CVE-2022-27776.patch            | 114 ++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   3 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 20 files changed, 772 insertions(+), 7 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1n.bb => openssl_1.1.1o.bb} (98%)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2022-27404.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2022-27405.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2022-27406.patch
 create mode 100644 meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220411.bb => linux-firmware_20220509.bb} (99%)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-0865.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-0907.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-0908.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-0909.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-0924.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-22576.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27775.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27776.patch

-- 
2.25.1


