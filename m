Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E74C27C51
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 18:12:26 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.3632.1716833541152681213
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 11:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lAKDBOs9;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a62db0c8c9cso5098766b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 11:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716833539; x=1717438339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjqJ+Wtdq3Cy907nw1PP+1WJZVbCOYtrMdr/N3R6Q0A=;
        b=lAKDBOs9UBL6XbcHq/bi2FGbO4m9A4s9tIB5q384Al/A3l2n9qigKFSgnlq2ENJiG3
         M50+y11ZUQWvpp1DuAb9OKxXCulbaaM0lo0HwjtOvviNJ1hUvrrr1OomEJFl0XD0pP0f
         WBu7KtT1WgIPGwsTH3/hZBC5+mGSCeyfMOO18MnJH0sp3CcPJIhDtFXD/846Hte/6aiQ
         BMMj6pHY04H5OrINxksEr6zBMtosE8Yi3sIY13RuW8rqHulf8plqKXxuXUJle1Ks+5x2
         DGY7ZDXJ8mqUApE2MS5jHK3Ma0FMWQZONG8b28b7FIaBWhYsPAwFY4h0iD9C4VdSlxSS
         VVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716833539; x=1717438339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjqJ+Wtdq3Cy907nw1PP+1WJZVbCOYtrMdr/N3R6Q0A=;
        b=F9D1ubVfvWJqVlZw3JtjM6CMj5MOon275M1iRj87aHx12i5P6G8sAPU0/ya3CzcLqS
         6VVx9qH8XA/RS9NbvkSN9OIqPgu8k22RlCzIjOKzT0K7Z4k2vNibBLgN1TYA+y2dHpso
         UoJkIEjkBhDj3PwnpqMg91ta1NDV4DXmwTCaDvsiWCa+2Rhuc81geTGVL/PK5bTQ4S7s
         u21VEI+2tngVxvxAlabJWtcY++TrjQEfKBSPkTSeED9tfQt81wR28rFVpdaWGnISBLa5
         2UqAYlmJtqKrO1TFuYpA+YAGASHGbMBWnvA1dnxmi4DxHUy2gsu8BLWDKXFsA2MAkopX
         CU1w==
X-Gm-Message-State: AOJu0YzPgJt+0qsWRDY5fPBEBaydjA+WuXo6dIMd+DYiG38Thp9BshiQ
	FwcmlsRYkwpPgwQjjlVz6pyKxBwwhtlk70s84SIjuY30ccPkt0TN26PatQ==
X-Google-Smtp-Source: AGHT+IGVbxAWB5IGzwRYRt764gQZ94gobyIraDBLNTHQxyNRiQE43OCtQzumjuLToiomVib5Y8z0zQ==
X-Received: by 2002:a17:907:11ca:b0:a62:b597:6c31 with SMTP id a640c23a62f3a-a62b5976c75mr749928466b.12.1716833539323;
        Mon, 27 May 2024 11:12:19 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc50064sm510272466b.107.2024.05.27.11.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 11:12:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/13] libgit2: update 1.7.2 -> 1.8.1
Date: Mon, 27 May 2024 20:12:03 +0200
Message-Id: <20240527181214.1778037-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240527181214.1778037-1-alex.kanavin@gmail.com>
References: <20240527181214.1778037-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 18:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199919

From: Alexander Kanavin <alex@linutronix.de>

License-update: additional MIT-licensed components

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libgit2/{libgit2_1.7.2.bb => libgit2_1.8.1.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.7.2.bb => libgit2_1.8.1.bb} (68%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.7.2.bb b/meta/recipes-support/libgit2/libgit2_1.8.1.bb
similarity index 68%
rename from meta/recipes-support/libgit2/libgit2_1.7.2.bb
rename to meta/recipes-support/libgit2/libgit2_1.8.1.bb
index d1629c0c0ba..618a4ea6ea2 100644
--- a/meta/recipes-support/libgit2/libgit2_1.7.2.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.8.1.bb
@@ -1,12 +1,12 @@
 SUMMARY = "the Git linkable library"
 HOMEPAGE = "http://libgit2.github.com/"
 LICENSE = "GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause & Zlib & ISC & LGPL-2.1-or-later & CC0-1.0 & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5bdf47bbc9a39dc6ce076d59e322dc17"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8eacfdc17c8f4d219e131a073973b97d"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.7;protocol=https"
-SRCREV = "a418d9d4ab87bae16b87d8f37143a4687ae0e4b2"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https"
+SRCREV = "36f7e21ad757a3dacc58cf7944329da6bc1d6e96"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


