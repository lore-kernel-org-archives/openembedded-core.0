Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8815C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 15:23:12 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.143802.1719242586254214356
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 08:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TDVvmbAn;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-25caf76158cso2463167fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 08:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719242585; x=1719847385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7T3ggPzHzoJxsuweGARlduUC/tLeCFRcx8gbgl85F/k=;
        b=TDVvmbAnaB/KIBNJg5Z+cNZkclAirJCagb3dzvWfQeXLblbr5EmoiQwKAnT17Cq5Ir
         d1fr2f67TunSS8LKz8jgYVfM+/cvalXMB+YvTv95BvkX6WZm+wxYySGDVJigpzU8du22
         JMAmKOYVukQkm4bzPtglXTyE46x7E5maNakKxsr1JncE12VvImpMVXU2kDMT7KbcXAoQ
         jzMgQyOHsqE0SBhUjwpi9duoW+m7JV7KIiWEOZl09S8DHL5AILppa3mXP4T131ktL9ZQ
         6L9dd9y7FkKflJ4n4Mt7rRqpDKnJaZq67U5lBLSkPAkiZECTZrzoa6HldEhZdKf1uFIc
         iOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719242585; x=1719847385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7T3ggPzHzoJxsuweGARlduUC/tLeCFRcx8gbgl85F/k=;
        b=sXKhbXBq2xUMhmQ6EaNw3KsWHiWnWheE1J6kuUjQzVKOpBuqJrf5nuOoT1BISXbok8
         Qk+q7E2OLHPF3pYSffABH7Iayz33A3Na4RgWLNhugqZxQgN+gR3Ck+n4cyqR4ziN014G
         2tu2vR37o56H8n2H5Pl5UGnihYeuNemRnluiEq52/zzyVA1VNIUCFGzm6FJGlXN7XEtj
         /DyeduOwlDApv+is90+6jbrbiMkt+M6+TLJSCkxItMXhBJZIP4Hr6rliYxmuP0L3ZlP6
         s1ilfyX5dxCmV1E8cfczgXtpCrGSiAABfzesnkXpbK96gcMtkC+RUw8SDarCN5oSFhVz
         N86A==
X-Gm-Message-State: AOJu0Yy5JZelre7+TalIAzv2ZHoan8a5NQgnKxd7ACv5V9ktc0+Q2fFt
	KoMOKtyWMGD85WSMioQLC7ROyXs9NhRKXoRI1Ds+dfjB+nUYNRe/oH1Naw==
X-Google-Smtp-Source: AGHT+IEfwHSFzIz6CjHaJYRxbajxyh0/FAlO2VE4alN4SjOGbGKdpg5m5Mw2Jaint5eGOEZ9/+QPuA==
X-Received: by 2002:a05:6870:b623:b0:254:997e:ea4c with SMTP id 586e51a60fabf-25d06c8e1b8mr5098835fac.31.1719242584899;
        Mon, 24 Jun 2024 08:23:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd4b80c47sm1890279fac.39.2024.06.24.08.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:23:03 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 10/10] Switch default spdx version to 3.0
Date: Mon, 24 Jun 2024 09:20:39 -0600
Message-ID: <20240624152236.1019980-11-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240624152236.1019980-1-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624152236.1019980-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 15:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201100

Changes the default SPDX version to 3.0

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 19c6c0ff0b9..b604973ae0a 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -5,4 +5,4 @@
 #
 # Include this class when you don't care what version of SPDX you get; it will
 # be updated to the latest stable version that is supported
-inherit create-spdx-2.2
+inherit create-spdx-3.0
-- 
2.43.2


