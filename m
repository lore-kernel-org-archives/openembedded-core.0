Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A4DEC01B0
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 21:07:53 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5647.1774300069926363977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 14:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jrwN7j4x;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso4492465e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774300068; x=1774904868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0VGBHfbciPrBRtSIxnlhNNXDAuF0oE6ps5EJGBcEkhU=;
        b=jrwN7j4xdaHjuax4C0yd3t+V9lpEiOpilGqRx2+tBzbEi3U2SnHVrgLfNUdPEE2owx
         V883WsTlI1R3cnBoRL4rZBt7in23WHSg8XNpadlShjppLgrKUUiFmxC/Y1Er82TROm8H
         kcqzVnW+dzZwa6d+vEQNkILjiVYq3esG1gIX15iA/M1MJHwP9eAX6yxrPFdp6qJzzAwl
         0e19Ul3ZJ3zo38aQPbLMkX6RX9wD8mU+cBCroLQDJe3IXB1QQnLKL9BL4KecBtc61GU/
         61ADsKHz6VGOjD0kDMPd41J1u/N2ujvqGXGwqGSqWyExarJzZd4sQb3HZ4CA/3YHr/wF
         uHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774300068; x=1774904868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VGBHfbciPrBRtSIxnlhNNXDAuF0oE6ps5EJGBcEkhU=;
        b=aznPHooG+Rdz0whx0zD7QU4dyaS2NFqCYqRg3GORyFuklfi/z7n76B7LiMu9wcUb20
         jJQX/kozsV3eKEkLH//wNdKfPuEy0EtYK/aTdeihnY3yaiKS8YIuUqjJTyM8PSldkuJM
         JrmnN7R5LflEBlJ+MqPvy9qVcUZK5i/eyj4JMBp0tyNhEfCVBhgTtkGGpMBPqbeaP8HV
         3clzjBEpXyzmpOy5gXKfdo2wJL/s15f8pQMHDllKH3WA60OnT2xJNX6f6xjn9TbdLW7R
         OWt/jSVDqhA8Mp47wgMuewtSlXaLvP1sj5G/au/sOwiA2AveZ9dwB0fpwQhV5QoJv9JL
         NkMA==
X-Gm-Message-State: AOJu0YwElVzEy0113lpbek2XUtEeyJPJmQyK/DkNMDajsxeKpgz/jGvy
	9Sx00NFjrHUAlmcjtKQmXYtlXLr/owlR1On1ZTtBxu5s2i6AFkLxOBp7coyh44rt
X-Gm-Gg: ATEYQzygyQAMaxor9n/cfb8lY2yFq6L0lfCaDWmzHY0ednSmuzs9qCLhe1S3I/hohxY
	f5MkNWcN6f8Yio46N6REKYRshnP+JhuP0EEQhAZytYJrNAHHnHj5chOTva01PDWsvlfCNxqu5R5
	OB+jkBusbev8Y92Ly8WUNhkQjo9DMes17zZH9P4D1HVt0jMMtKVLT7d4iiK1c72g515QfH+0llF
	6GHwG3uMVAOZETfpRhLBiZ4/xO95TA2pwHukvYaDU07YAZPxxCSL07q87SJJtHc6T82ozzHUPfh
	zU7hSsxr8xdhI2dN8Wal7l/oEtECDY0vjp+okaRp3xVny+c+sEjTjA5lI7jnxAuV4Ps3/3bRdoP
	YPiP3jpFcSQltwV7XYCn6hlP8m8B+KGpe4E0HM0DehA6iRbffhq5tcVJSUArraJn+nz2vNJ+Qkd
	Q+C+3k+mEYtEDNyXnxQcF2uQJTAnFILeL9nhwHRV42Q7bMQoihTzhk
X-Received: by 2002:a05:600c:4707:b0:480:20f1:7aa6 with SMTP id 5b1f17b1804b1-486fee231cdmr183376035e9.21.1774300067611;
        Mon, 23 Mar 2026 14:07:47 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487113c4eb3sm853495e9.0.2026.03.23.14.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:07:46 -0700 (PDT)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH v13 0/4] SPDX 3.0 SBOM enrichment and compliance improvements
Date: Mon, 23 Mar 2026 22:07:41 +0100
Message-ID: <20260323210745.1337169-1-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 21:07:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233763

This series enhances SPDX 3.0 SBOM generation with enriched
metadata and compliance-oriented controls for current master.

Changes since v12:

  - Respun the full series from scratch on current master to eliminate
    cross-patch churn introduced during a previous rebase: patches were
    modifying code that later patches in the same series changed again.
    The net diff is byte-identical to v12; only patch boundaries changed
    so each commit is now self-contained with no overlapping hunks.

Validated with:

  oe-selftest -r \
    spdx.SPDX30Check.test_packageconfig_spdx \
    spdx.SPDX30Check.test_download_location_defensive_handling \
    spdx.SPDX30Check.test_version_extraction_patterns

Stefano Tondo (4):
  spdx30: Add configurable file exclusion pattern support
  spdx30: Add supplier support for image and SDK SBOMs
  spdx30: Enrich source downloads with version and PURL
  oeqa/selftest: Add tests for source download enrichment

 meta/classes-recipe/cargo_common.bbclass |   3 +
 meta/classes-recipe/cpan.bbclass         |  11 +
 meta/classes-recipe/go-mod.bbclass       |   6 +
 meta/classes-recipe/npm.bbclass          |   7 +
 meta/classes-recipe/pypi.bbclass         |   6 +-
 meta/classes/create-spdx-3.0.bbclass     |  17 ++
 meta/classes/spdx-common.bbclass         |   7 +
 meta/lib/oe/spdx30_tasks.py              | 278 +++++++++++++++++------
 meta/lib/oeqa/selftest/cases/spdx.py     | 104 +++++++--
 9 files changed, 345 insertions(+), 94 deletions(-)

-- 
2.53.0


