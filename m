Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF280C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 22:40:36 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.10214.1702420829552663036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 14:40:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RwQj662q;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6d9d84019c5so4666947a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702420828; x=1703025628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kX1lUijSqszlGk012rw6Ll7kKA9vj+C9G+pv0mCiWRs=;
        b=RwQj662qu3y3WrBy3PFwWppW6yQME+6Kj72W/H3LAnSp7e9xgG9OSPPFp/FInZej/+
         9shUNx1dLbtBIGltGR4HkbA4IAV+Eew0qiKDasQnIoGFTnc2i8tzUhsNqX1gpD9BepKu
         IeCzutK7ExutijZZmYvplN3158IBH1M+wFN6d3VUK6YWKiX8gKcfOoSnFztSnd+p2tjU
         Ta8TgaeZtU97AAj3D0yyNvmSQhk4L2b8XOZp/T5m49fRDXs2AC2g2iPkcEx+gczRwUFO
         Oy4kJM5dmpibD/b6xhpmMs264syoP7M5XTOHh+ZyxoozgFUAh1au+s2xQPShjST87C7d
         kqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702420828; x=1703025628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kX1lUijSqszlGk012rw6Ll7kKA9vj+C9G+pv0mCiWRs=;
        b=l0BblQ0shfA41SDlPwvdz+kE0a7hE4hF77ZtQRQKePTVxpS7Zuo9RIJAqMOywWtR9V
         E0ZyuXFqiJ5M8TE8AZU4bgLv7YjB8DgfXBDWOuk7wNRrBla9kuD0yeKUCwitSXxO0aOR
         A8SEWTUZIMTH1VN4+d00eKb6WO5uSr/Jd3WxFHs82BEHNQu+w1YXIeySEmILI9oRJMBe
         8hvzQsTsREZysHnz4H5ytZYBcCDw3X5Y5q6dBRalsKB8FX0zqp666uRtlSph26KlI31H
         E/6YUnt/CKZ/qs9amNdbQBq+aAVqU/lMr4bcCw4G+Pwhy8+RnwPkB7Oa8fANwvWrhQhy
         EYng==
X-Gm-Message-State: AOJu0Yx9h3Ipg0uY/eraQ8v2tU2xGfWBA6VLaN7w/vve85QXwr1qPeFi
	pX56a7XscgtabREmsy7lxpvOMl3jZ4RuBpAmGBQ=
X-Google-Smtp-Source: AGHT+IEovMiZG5lD07EcN33bxl+4eFjDBBeoujXQ7LT1tnr19IETnD28TsSZMM0b05ZskqIkgUiqWg==
X-Received: by 2002:a05:6830:a92:b0:6da:11f4:3d87 with SMTP id n18-20020a0568300a9200b006da11f43d87mr5880939otu.29.1702420827884;
        Tue, 12 Dec 2023 14:40:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006d0951e74cbsm3847974pfo.178.2023.12.12.14.40.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 14:40:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/5] Patch review
Date: Tue, 12 Dec 2023 12:40:15 -1000
Message-Id: <cover.1702420654.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 22:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192246

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, December 14

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6324

The following changes since commit 09ecafaf0e128c4dea062d359de37cbef461aed2:

  native: Clear TUNE_FEATURES/ABIEXTENSION (2023-12-07 08:09:37 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (1):
  gstreamer1.0-plugins-base: enable glx/opengl support

Archana Polampalli (1):
  bluez5: fix CVE-2023-45866

Mikko Rapeli (1):
  openssh: drop sudo from ptest dependencies

Vijay Anusuri (2):
  avahi: backport CVE-2023-1981 & CVE's follow-up patches
  gnutls: Backport fix for CVE-2023-5981

 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  10 +-
 .../avahi/files/CVE-2023-1981.patch           |  58 +++++
 ...023-38469.patch => CVE-2023-38469-1.patch} |   0
 .../avahi/files/CVE-2023-38469-2.patch        |  65 ++++++
 ...023-38470.patch => CVE-2023-38470-1.patch} |   0
 .../avahi/files/CVE-2023-38470-2.patch        |  52 +++++
 ...023-38471.patch => CVE-2023-38471-1.patch} |   0
 .../avahi/files/CVE-2023-38471-2.patch        |  52 +++++
 .../avahi/files/CVE-2023-38472.patch          |  44 ++--
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 .../bluez5/bluez5/CVE-2023-45866.patch        |  56 +++++
 .../openssh/openssh/run-ptest                 |   2 +-
 .../openssh/openssh_8.9p1.bb                  |   2 +-
 .../gstreamer1.0-plugins-base_1.20.7.bb       |   6 +-
 .../gnutls/gnutls/CVE-2023-5981.patch         | 206 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   1 +
 16 files changed, 526 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch
 rename meta/recipes-connectivity/avahi/files/{CVE-2023-38469.patch => CVE-2023-38469-1.patch} (100%)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
 rename meta/recipes-connectivity/avahi/files/{CVE-2023-38470.patch => CVE-2023-38470-1.patch} (100%)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch
 rename meta/recipes-connectivity/avahi/files/{CVE-2023-38471.patch => CVE-2023-38471-1.patch} (100%)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2023-5981.patch

-- 
2.34.1


