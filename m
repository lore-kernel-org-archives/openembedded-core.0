Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8A6C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 22:09:29 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.2373.1645654168217776865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 14:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MUc2evs7;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id gi6so273106pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 14:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AMyiqvnqU0saM0kuZ4epVmfcBaXHP2UEUfD/Pu9PW54=;
        b=MUc2evs7+IKoCloUjG/D615dVvz7pOvvb/byNYBeCZRtsyMHFVFbHHuTO/aaMM0CON
         TS4UMViQQNctWqsOfepHG3tfaU/tHf4i7LB9QNDHJyOsDarAqh3FHUncEQC+6l9l6CKl
         Mu9FC5tkSUCx/5XP0lmqPZhHpgU8euyj9LF/qSSv4eWSS0YFMvuuxZaV0UTSQCVVXg1y
         MwnkhlSI2npCw3uCDEzi0lOCADDJTJkFSsC62gTlySKRaEQ7oqarcTOuE2nZV5nTxdOl
         7mOcMXQdjePTm5j6taDFo6k/ZVbASZyhW3Gy9Zvd/DOol9FEuqq7fyQ4GC/GkztU4Ycz
         W1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AMyiqvnqU0saM0kuZ4epVmfcBaXHP2UEUfD/Pu9PW54=;
        b=6MTzGqfLyI54UuliLNEQERrM/75x9ZEckdfBCJpep7SJ5MecK4H4AIXLPd3nnaglK0
         L97TSoksOLuP++oNIYa6me/Upih7/B/D+JyDHJfo55iE2g6PtraXv22T4W/pYWkCKOTE
         t0iB7vsPyOgbNZG69cLsxN60ExJQ6j/iKqIe3rx9X6sjoWB652/bi+T+6ogkAyoAMUAL
         HY2rsHVhKjNPLZDnev7hK8E0wvYvPj/L0AqflguvJGqe9aoUqobYasNc2IPt6FcnGJ+G
         vPUXsUkCR7baeIwPno/GyK6QhgZLUHU5U7O7FndiN8HeIMw/1SSy1oIyQ9HEsH6HwXSY
         qO5g==
X-Gm-Message-State: AOAM530BCx2V6jTdaI5yncmsbn3gS8MKyS5YxebYUJANS8ENG/FQuSmO
	Bu0FEGa5whxhYNs2aVaN4E03qMH0o2XlGw==
X-Google-Smtp-Source: 
 ABdhPJyHc8IsydBK8vRGTTpe4SjSmNd5fOLuvwbVWkqA/9EmHg0O0W0c6czsdkGEB5Nl468NfyLMOA==
X-Received: by 2002:a17:902:c945:b0:14d:7a50:8746 with SMTP id
 i5-20020a170902c94500b0014d7a508746mr1782122pla.31.1645654167201;
        Wed, 23 Feb 2022 14:09:27 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:16be:5024:1d60:b2cd])
        by smtp.gmail.com with ESMTPSA id i3sm454465pgq.65.2022.02.23.14.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:09:26 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 3/4] python3-flit-core: SUMMARY DESCRIPTION HOMEPAGE
Date: Wed, 23 Feb 2022 14:09:12 -0800
Message-Id: <20220223220913.2057644-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223220913.2057644-1-tim.orling@konsulko.com>
References: <20220223220913.2057644-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 22:09:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162279

Add SUMMARY DESCRIPTION HOMEPAGE and BUGTRACKER definitions.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-flit-core_3.6.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb b/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb
index d0b88c3fa50..6dfacafd31c 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb
@@ -1,3 +1,10 @@
+SUMMARY = "This provides a PEP 517 build backend for packages using Flit."
+DESCRIPTION = "This provides a PEP 517 build backend for packages using \
+Flit. The only public interface is the API specified by PEP 517, at \
+flit_core.buildapi."
+HOMEPAGE = "https://github.com/pypa/flit"
+BUGTRACKER = "https://github.com/pypa/flit/issues"
+
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41eb78fa8a872983a882c694a8305f08"
 
-- 
2.30.2


