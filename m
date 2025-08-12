Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68B9CA0EDA
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 05:13:21 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.67184.1754975596700260642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 22:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EtMSiJgF;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b3f80661991so4284608a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 22:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754975596; x=1755580396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV3BPP0c9wixjtsY2qibF/ESLBUZOO0RwwNk5vdLrlA=;
        b=EtMSiJgFR0eOONiv+Qdvr++O9QAa7OLY7/Pgkx4TC1WQAPemIF225c4HQktwNSxXaj
         4cIv5gCqz57+r08i3mbUCYcBMuGT1ziG06SPGKsgXVfMUdmJ0yBrwPKOCMZhM5okwo+T
         9sozhGJR6OXSe80x/Ua/p0BYPcju+5p2ukf09FhIVL3fGQjM7TlDsD5Tef+0qsV1YbZt
         KoGVUtmEMZ7nlrvpDi/zGTx4RmG70xePQzIc6rDrX8Wd9q2vVkEBcpt6cikufcoJK+Bc
         uzKJefvtFBI5BKxICOZ3dRkVS+ButganrI+jQzAUMmUrNT/+MVCCZR7t6LAPFua5OzLp
         r6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754975596; x=1755580396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MV3BPP0c9wixjtsY2qibF/ESLBUZOO0RwwNk5vdLrlA=;
        b=AhW/RZQ9KSrsAwO58htU8tt+s06gda31SysKjWcRUytoB/g2qLvQaiQFSkhJTQ7x5a
         5CZNt1Qplc560/UPYvjOetYDmymIHgvzKSo7suwDw7HmgIRSTJtGXjZlkgw91o13VJdM
         nPAHB4AfMVoxkKk3tnqD4/mmkjxjSZvOdRFxnwwJsIVXz41MUSk7NCrAsCytP3Ug9V5s
         /08gercFFVE4MkqbGgqXnKMw05yZLqswgXloUJxYgN7ZU/FMF38Qt/rzezCTKj2ZWf1H
         b6J6C/MFSoqz35DEOutd7AgWEmOqO8g9zkmTeKCYRDKlUMHGVe2TEeaJDUKufXmhw0Td
         sO9w==
X-Gm-Message-State: AOJu0Yyoqof5FPWQBzgusJXE4IyGpC+dnU56iIJMbiwMLo71l80cFihh
	KCgYs6NpFl4agcqHN+Ncu5NjkHsBImD0vdP79v4bMOkJKby9UBi8UQO/wwX39od5eVw=
X-Gm-Gg: ASbGncu3vOykXNZKHrAdr5Rk6pcSTNB2A6zJr7DetFxR5J8NRwiWMQHZak8el9qpmZ5
	JKznZlqsS8D9VDq9guAS27p++LwpybOAKUOCZNOMgfRGS5xgx9Dfxcjf/cmXQ7F+SHO5SqPAOPH
	q40C4jf2wq/YDIdzMMdb9pfHzyhiEBvfJRBftF6xXKqLqcXFjIzTMWJaqcQUGIM8GiSju5UdSSs
	hJP5QtFpfHM30kG27XATnDC89rqieOsf0oE7HGJZnHl5azLrn+ckwYNdk+kCHpxNK6AUR3x7F2u
	gc56bCvyFTvXzOtJKef5UTwLP/ThMDVz147qzK36i/nqZcX33GUeakAdickUtEn3o2A/y7OJouh
	dK04G/htllvlZzgjCMz6nww==
X-Google-Smtp-Source: AGHT+IETZhZx5tFi5AxEZr35DOh4+JzOe50MJX9Kcd/y42JUQSBrr9ZSlHOoZ6xiUHR4D3DkgyOHRw==
X-Received: by 2002:a17:902:d4c4:b0:23f:9718:85f5 with SMTP id d9443c01a7336-242fc38a2efmr33310745ad.15.1754975595753;
        Mon, 11 Aug 2025 22:13:15 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ee1b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2423783a84bsm257016805ad.51.2025.08.11.22.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 22:13:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/3] zlib: Always use GNU ld for linking
Date: Mon, 11 Aug 2025 22:13:11 -0700
Message-ID: <20250812051312.4067998-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812051312.4067998-1-raj.khem@gmail.com>
References: <20250812051312.4067998-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 05:13:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221753

Linking does not yet work with LLD

Fixes
aarch64-yoesdk-linux-ld.lld: error: undefined symbol: gzopen
>>> referenced by minigzip.c
>>>               minigzip.o:(main)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add upstream defect information

 meta/recipes-core/zlib/zlib_1.3.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index e62c50c5df7..a313e5aed10 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -20,6 +20,9 @@ SRC_URI[sha256sum] = "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b
 PREMIRRORS:append = " https://zlib.net/ https://zlib.net/fossils/"
 
 CFLAGS += "-D_REENTRANT -fPIE"
+# zlib does not build with lld, keep it until https://github.com/madler/zlib/pull/936
+# is addressed
+LDFLAGS:append = " -fuse-ld=bfd"
 
 RDEPENDS:${PN}-ptest += "make"
 

