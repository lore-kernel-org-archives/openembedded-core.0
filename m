Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8D4C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 20:01:48 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.11652.1653508897791081008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 13:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4JRjU+Cl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id c2so19498546plh.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 13:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7cccsuksp8q9ytsu3PHil+WbhJ6D16LMjQGw9X4xIfs=;
        b=4JRjU+ClR43BfsMzLBbXWA8DSpxcNIw1ZZAnbQ7CaLPevAglnp7DTfk5rK5VrhQcBJ
         RW+AzpVElfb5CEEIDaFs3/9VKazR09Ds30Cu9QMbZQJtJspf21pqcVnZpKWoiBpH7GJB
         WSX3waFzQc98O6Bl26sC+nuYKxzwWEzJEFtv+xWL9fu2pru/4OhSPKp2adOzFkOH/fII
         oVf0DujcmUZYdexkq21lQ5ZLxxb9nwluydEIqBiBuwF0TNtVGJNzqhjLmLxSQZXiThiy
         ALMS2cbUiI36DhYK42SbNUfD7jEq5gDl8qDfgeKVhuD4amLevXEANyNkZTMYqSs1MoGX
         BCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7cccsuksp8q9ytsu3PHil+WbhJ6D16LMjQGw9X4xIfs=;
        b=HEU7PPUucTTMZ9X/ri8pCttdzmrWy5qbepMj+ykSGhqi+hNyfgPd1+ayoh/f2379US
         xyRQfxhS61k25OH3Q6vW+7ahlzCo57EdoDRv+CtvgomT9U4rdVdwaMckekjT+KRDwgil
         2lKD/8bi00NIFVfav+M23WGRst6TGJNKu0B92I7SY7iOLWhy8R8Kozw/dCbJ9IoSaG5V
         WQWiY+YSW8zhR6rHTsAZaVwNm/SBr4S7moptlCaxJXMVcY5WAPJNdLvgyS185N8/PtBO
         Xa8PFAvPeHXodEdYKz+aKVxUJvJTXkteIXJpexgbjTjfMps6IiBvgcFeWfV69sCYp5v8
         6quQ==
X-Gm-Message-State: AOAM532wujrY4Jtj6DKCqkH0BVHr0pXoCFYVVSa5dYLzS4RnQoG5ybVd
	gc2MgIMIlAB1Tkne/Q15drF9kzHKdI0QmHz9
X-Google-Smtp-Source: 
 ABdhPJwjypvpSZGIWvzYOnyQMlggWg2ONiJz61ZswWdIBIwCVgYHoYkD2mBBM6PCCNFaqWhrK535uA==
X-Received: by 2002:a17:90a:ba0b:b0:1e0:97b4:e0ad with SMTP id
 s11-20020a17090aba0b00b001e097b4e0admr7770335pjr.19.1653508896259;
        Wed, 25 May 2022 13:01:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t29-20020a62d15d000000b0050dc7628151sm11806441pfl.43.2022.05.25.13.01.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 13:01:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/9] Pull request (cover letter only)
Date: Wed, 25 May 2022 10:01:12 -1000
Message-Id: <cover.1653508779.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 20:01:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166170

The following changes since commit ec9e9497730f0a9c8ad3d696c8cdcec06267aacf:

  base-passwd: Disable shell for default users (2022-05-16 13:59:44 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexander Kanavin (1):
  mmc-utils: upgrade to latest revision

Claudius Heine (1):
  classes: rootfs-postcommands: add skip option to overlayfs_qa_check

Marta Rybczynska (1):
  cve-check: Fix report generation

Richard Purdie (2):
  staging: Fix rare sysroot corruption issue
  selftest/imagefeatures/overlayfs: Always append to DISTRO_FEATURES

Robert Joslyn (1):
  curl: Backport CVE fixes

Samuli Piippo (1):
  binutils: Bump to latest 2.38 release branch

Steve Sakoman (1):
  python3: fix reproducibility issue with python3-core

wangmy (1):
  librepo: upgrade 1.14.2 -> 1.14.3

 meta/classes/cve-check.bbclass                |  18 +-
 meta/classes/rootfs-postcommands.bbclass      |  10 +-
 meta/classes/staging.bbclass                  |  24 +
 meta/lib/oeqa/selftest/cases/imagefeatures.py |   2 +-
 meta/lib/oeqa/selftest/cases/overlayfs.py     |  36 +-
 .../binutils/binutils-2.38.inc                |   2 +-
 .../{librepo_1.14.2.bb => librepo_1.14.3.bb}  |   2 +-
 meta/recipes-devtools/mmc/mmc-utils_git.bb    |   2 +-
 .../recipes-devtools/python/python3_3.10.4.bb |   5 +
 .../curl/curl/CVE-2022-22576.patch            | 145 ++++++
 .../curl/curl/CVE-2022-27774-1.patch          |  45 ++
 .../curl/curl/CVE-2022-27774-2.patch          |  80 +++
 .../curl/curl/CVE-2022-27774-3.patch          |  83 ++++
 .../curl/curl/CVE-2022-27774-4.patch          |  35 ++
 .../curl/curl/CVE-2022-27775.patch            |  37 ++
 .../curl/curl/CVE-2022-27776.patch            | 115 +++++
 .../curl/curl/CVE-2022-27779.patch            |  42 ++
 .../curl/curl/CVE-2022-27780.patch            |  33 ++
 .../curl/curl/CVE-2022-27781.patch            |  43 ++
 .../curl/curl/CVE-2022-27782-1.patch          | 458 ++++++++++++++++++
 .../curl/curl/CVE-2022-27782-2.patch          |  71 +++
 .../curl/curl/CVE-2022-30115.patch            |  82 ++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  16 +-
 23 files changed, 1362 insertions(+), 24 deletions(-)
 rename meta/recipes-devtools/librepo/{librepo_1.14.2.bb => librepo_1.14.3.bb} (94%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-22576.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-3.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-4.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27775.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27776.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27779.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27780.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27781.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27782-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27782-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-30115.patch

-- 
2.25.1


