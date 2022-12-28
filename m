Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FE7C63707
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:43 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.176139.1672213062505309065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kGzh/o4/;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id bk16so1009539wrb.11
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljlLm/Af9tJWagqc2v6TmO0BRER60FiGrDRUTm+0b40=;
        b=kGzh/o4/aPBM3A9N0N+NhfUF5hHOBj+QnScwsTLsAMCiDyv4Dyw4Uz1wJmGp5oPY+Z
         8kAr1MPgiotcquJpAiyXwTug0XZJCKzTBqPM9K8j9B3jCStdwxfHvfwpsjHpvQmzQnBc
         hmEBNIeZ2E/obEoqHmP51FhzMOwZ10K/hVf38gFbK7feJv4oyVI4/M+Yl29RsmFQZu76
         v4n0ul6oqnmajEn8Gc/oxmxZ7EfaNXZis4lNWeAxGXUpSo2rxDFgSbDv4dwROxXuYeBl
         m9ujbz3Vzr3AbRIV07qdofnEvli2XFVM6meW3z/VsJW01pN3aVjw7CSeddqpZ5x08vCf
         lsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljlLm/Af9tJWagqc2v6TmO0BRER60FiGrDRUTm+0b40=;
        b=OuOeyKT86TMEBff0VL09HBoYRIkqctqUBfiQUXjW6ctko4F/P0Sj7rNnma/iyljLQF
         QHHbA/YU350lv1DSR/vLbqD/g5wt4V3R/bs0z5Ghrs+rEjOGAnARBnOl74TdwczjRej3
         FbMiQLM3Y8mfCX4+3qyG6Bio1SBywIP+CqzoB/qcyG+CIPpCYLeENtlv/LbAWYuviJG2
         Tit2NXB7+2JMi25SmtNd50lssihtFc+Nl5wyN3fDN4ur1SfoL+Fm9waUKbzDzQqT3TAT
         46f+m+iuRp4NH+bgDBONiLvHKvKZOaxXk+VWibpSZg29kHY0Q4mBJadmEtFi3I2UfX5P
         PYYA==
X-Gm-Message-State: AFqh2kpmiznMs7KWda2RH4RaMlMXaWMz0W1VclFQSeSz0tBpXcg8MMq1
	HjKwZXMJVBEiwmNCkehox5NSc7qDniI=
X-Google-Smtp-Source: AMrXdXvSes4QdWsMODiQ8dT+NboIwkS4k30hcsOoNFOPUSii6q07e5Hp2zb+miwZZz/Vxt2s90pxMA==
X-Received: by 2002:adf:f84a:0:b0:26f:63ec:eb82 with SMTP id d10-20020adff84a000000b0026f63eceb82mr12610323wrq.19.1672213061019;
        Tue, 27 Dec 2022 23:37:41 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/25] libxscrnsaver: update 1.2.3 -> 1.2.4
Date: Wed, 28 Dec 2022 08:37:13 +0100
Message-Id: <20221228073721.3454255-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175057

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{libxscrnsaver_1.2.3.bb => libxscrnsaver_1.2.4.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxscrnsaver_1.2.3.bb => libxscrnsaver_1.2.4.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.3.bb b/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.4.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.3.bb
rename to meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.4.bb
index b52fd00f1a..b69727b696 100644
--- a/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.4.bb
@@ -19,5 +19,5 @@ PE = "1"
 
 XORG_PN = "libXScrnSaver"
 
-SRC_URI[md5sum] = "eeea9d5af3e6c143d0ea1721d27a5e49"
-SRC_URI[sha256sum] = "f917075a1b7b5a38d67a8b0238eaab14acd2557679835b154cf2bca576e89bf8"
+XORG_EXT = "tar.xz"
+SRC_URI[sha256sum] = "75cd2859f38e207a090cac980d76bc71e9da99d48d09703584e00585abc920fe"
-- 
2.30.2


