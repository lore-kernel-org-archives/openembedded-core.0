Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.13901.1609368267852259304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 14:44:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=r91AszHG;
 spf=pass (domain: konsulko.com, ip: 209.85.222.170, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f170.google.com with SMTP id f26so15218808qka.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Dec 2020 14:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FcOwQ4CsvVrbZ2GanyKEMzDe2/QC1WRdQrmGQA1Tv7E=;
        b=r91AszHGZg4uGu/XjwpisBtferzv+L2oyxDq/1KwTSfJypFlNwvR9Ak8DomNed7i6n
         xrKxwyi1BKLqTbL0v4PXDrpOIeWqPb2lTUVpxQiYV5k7NVZ+/uPC2WbvmUi/cnHNP5M4
         /Fsl86zZaqSg4KJJVxfwIJch79QEMVaMEsvpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FcOwQ4CsvVrbZ2GanyKEMzDe2/QC1WRdQrmGQA1Tv7E=;
        b=U/TzmOo/JMwSM9vT83xCW8QXNWE2us0ki0DCGC76flolNimIgoIBUaN9pIuoIE4d0e
         VJ7rE7yVFHTumy/8vs2I6yulIH262eWdX32cpz7M+ShRBLJHLCcma6YD5yAlQ4n3mn8R
         HwiqbCZj4A9FtcrEeat76C9vfvMk/W05vt0fynHMwh5qcAVGAiiXrF05PkS3EhBVRo9e
         U5pJbiLUJUomkB/X7vswizboAU3QnBTCq/oH9aeijImmU3PH/MG9Q6Gkg3LTLLu5AESJ
         X4fKnL9CerE5W5YzCnjSiG6jb9fTY91Tf8dHhYPFjA0ZLFuqu3cdKJVWbAjDqSNLSNJh
         OGmg==
X-Gm-Message-State: AOAM531SSigPPNNzT1noOF95xr5UYpWNqPRkvNoegiMOYMTuwTKKnQ6P
	TASwBAW06btRos7UH0gl3u4BYAmC76fvwA==
X-Google-Smtp-Source: ABdhPJzLCGofptXfSX6Y6xBcNjL0AnJy+6Vg1P35Cj6ZZwl4BB5MfTgT5Ftdst9IYUvcMQ0Xdh3PvA==
X-Received: by 2002:a37:a80f:: with SMTP id r15mr54582514qke.289.1609368266724;
        Wed, 30 Dec 2020 14:44:26 -0800 (PST)
Return-Path: <scott.murray@konsulko.com>
Received: from ghidorah.spiteful.org (198-84-179-103.cpe.teksavvy.com. [198.84.179.103])
        by smtp.gmail.com with ESMTPSA id a77sm28315573qkg.77.2020.12.30.14.44.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 14:44:26 -0800 (PST)
From: "Scott Murray" <scott.murray@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] A couple of CVE fixes
Date: Wed, 30 Dec 2020 17:44:16 -0500
Message-Id: <cover.1609367977.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A couple of hopefully straightforward fixes to knock some CVEs off the
unpatched list.  The grub change does not add a patch but fixes the existing
"CVE:" line in a patch so all the associated CVEs will be picked up as patched.

Scott Murray (2):
  grub: fix "CVE:" line in one of the patches
  patch: fix CVE-2019-20633

 ...low-checking-primitives-where-we-do-.patch |  2 +-
 .../patch/patch/CVE-2019-20633.patch          | 31 +++++++++++++++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb    |  1 +
 3 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2019-20633.patch

-- 
2.26.2

