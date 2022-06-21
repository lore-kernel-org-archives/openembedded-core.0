Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89EA7C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 20:17:06 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.48352.1655842612433487191
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kd9x898Z;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id h23so29787086ejj.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 13:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hhUHxddf3/je86wjbrSnK+VYORDqsCep2CqIPgXjrYQ=;
        b=kd9x898ZUEWQfapV57V3mITorijsWn3ifAymwafhZxQBHTBZO4WEZR5/CTZJ8M6pI1
         eaA7tlpe9BjH46TBYWqNLY9/sfimZMjCnRv85vPMqQs4p7gEYFAw52SGJPeEKu5cWR5s
         Fgn9fBUpJeav/BIa8b5eB7pAhI+S5PnQqIRmRcHCftOlgsd6zwFjc96808EPewmk3ebl
         TeuiLZ8OodP1DFELKVX60Z8TzksAOftIo5Tt5J0TRYdblaP2NN1fZTVTpAvNdqi8etGS
         k48FdgxhFtpgNmpvMj+LmnrLPwsgKXHG0yRS6+UCcg8KmX9OHjW0NwhDkF3gomll9IaQ
         ASJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hhUHxddf3/je86wjbrSnK+VYORDqsCep2CqIPgXjrYQ=;
        b=JRQC+r78SCLrPdd3rhkFeHomUkW69mcLujAxjMwZM5KTAYqvrBpr1ABf+wGtKuW/+c
         t8fhwJnB6sK++K0ZL+X1sPRTldZ5jf9tvRTbKN6JnY01CpeIAnT3dfpDuHTlSNJ0110R
         k7AT4/NFufcuvJCApDLRYO6SjAJKhz0WaCPWafzrn56R+3rt0xvG5mbrkr4hInsjoJVy
         2KEL1VzxbVkjlkTR8DCCKk5FVoW71dh880/vCjGic+wBXXXA9oP3OZNgm8hCQmF/suG4
         9bdxEbb9+t5RmMrO/A8PZblHiwQTpL84CN5kTEBM8YHyA2f5ohEijOLWoek12T6GUrxR
         lBHQ==
X-Gm-Message-State: AJIora+vY/yp5wEMCdVto2oQGNT9WA9/CwnXb4ZyKqmWNYfTOzHXE2dl
	HVUOCASgyvoZ/PbcxoahXiI3Z1QEdByLOg==
X-Google-Smtp-Source: 
 AGRyM1vCHv5wTDDiLD59eAigXgUIB5GMgkbFY4r/uBB1yelCe95BiFU1tWlsU6cFrKyrw1ixhhcqpQ==
X-Received: by 2002:a17:907:6eab:b0:722:dbb8:8e2 with SMTP id
 sh43-20020a1709076eab00b00722dbb808e2mr7061307ejc.746.1655842624510;
        Tue, 21 Jun 2022 13:17:04 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a056402238800b0043590660f16sm3420890eda.35.2022.06.21.13.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:17:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/18] wireless-regdb: upgrade 2022.04.08 -> 2022.06.06
Date: Tue, 21 Jun 2022 22:16:35 +0200
Message-Id: <20220621201637.1378306-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220621201637.1378306-1-alex@linutronix.de>
References: <20220621201637.1378306-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 20:17:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167184

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ireless-regdb_2022.04.08.bb => wireless-regdb_2022.06.06.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.04.08.bb => wireless-regdb_2022.06.06.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb
index cd42039680..2eba4f873b 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "884ba2e3c1e8b98762b6dc25ff60b5ec75c8d33a39e019b3ed4aa615491460d3"
+SRC_URI[sha256sum] = "ac00f97efecce5046ed069d1d93f3365fdf994c7c7854a8fc50831e959537230"
 
 inherit bin_package allarch
 
-- 
2.30.2


