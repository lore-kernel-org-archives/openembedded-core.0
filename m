Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.12879.1628100056764618193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 11:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ORKZ0uze;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id s22-20020a17090a1c16b0290177caeba067so9971950pjs.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 11:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vnxHymvD64PMiaDgXy+z30HF6zURv/lGbm5N2TRgW0s=;
        b=ORKZ0uze1WjsguRo410J7P93Ji5effo3wJ/h5n32wi41ZI5uSlJaaWQscozPk9iyBv
         2NLHYpRyUWJ/MwnFmh9oV1uWkKFFYAgWh518kHy+TPCfI4ImIiW5tGPUIchXRDsqvgpR
         lsr7S5At0mfvtOkf9nPtgDvYHcedEMwd+67JS42YIPidXAbbiOfM0BEFIQGYEzxbhgB/
         5jrAKV2x+YXzjeJFNazzCrNtT8RXG7kYWo5Ij2I82e1Clv5JVmV2xx0306F3EP6yITwE
         rQPU7Y4HfnnMFji6jWjaYPEb+7DozuEp6nGhD8zLlOEdbF+taT6OkauuMvQ7jB1tewA2
         vkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vnxHymvD64PMiaDgXy+z30HF6zURv/lGbm5N2TRgW0s=;
        b=feZx13dcqQMVy3VgE1jZf+glgD5Lt7ZCrS9s/zAQ0XsDp/89JVVmyKTO6uoy+3B3S1
         tZsNsBrA/RRQPFfY0KNWaNYQ+Bnyn7epR6p/vSuiQifzAutvNMnRPrvxfkmnE9m+5BE0
         nYvYBvIcK9bnIRoTYVeqD+Vy2z7gN1E1LJCTEL1VPlkbqr5yutrINwGlTMCwImrCBsVM
         PH/W3lm+gughLyoVvocNNhia7aAK2UFaI/jOmC7fZXeiFW4+O9WS2BWwMXY86VuHoRX9
         UZT0hi5/kxGbt88nF7PvBlvXJFBuWL2WIJy+dDJN05IqiOMmQAixL0da5NFk12PVUaBd
         fYgA==
X-Gm-Message-State: AOAM530iQx4rsRPP5F9j2oovmUY7l0/SfmJu5JFgFjJ8GgDWu68FzDxi
	UT4bZI2i88C6qnxqlptjhVaxDHFMDbMKvw==
X-Google-Smtp-Source: ABdhPJzPwWbf5w0w25iUW3oOukJKMevdigbNBhxq15G+GeIIzpSxQIZG0aATenec67Hx8vpzbKmVWg==
X-Received: by 2002:a05:6a00:b85:b029:332:1865:fea9 with SMTP id g5-20020a056a000b85b02903321865fea9mr757000pfj.45.1628100056107;
        Wed, 04 Aug 2021 11:00:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id p8sm3586094pfw.35.2021.08.04.11.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 11:00:55 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] toaster-managed-mode.json: Correctly specify term with new override syntax
Date: Wed,  4 Aug 2021 11:00:50 -0700
Message-Id: <20210804180051.1865715-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210804180051.1865715-1-raj.khem@gmail.com>
References: <20210804180051.1865715-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/manual/toaster-managed-mode.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/manual/toaster-managed-mode.json b/meta/lib/oeqa/manual/toaster-managed-mode.json
index d8bbbece4a..1a71985c3c 100644
--- a/meta/lib/oeqa/manual/toaster-managed-mode.json
+++ b/meta/lib/oeqa/manual/toaster-managed-mode.json
@@ -136,7 +136,7 @@
           "expected_results": ""
         },
         "3": {
-          "action": "Check that default values are as follows: \n\tDISTRO - poky \n\tIMAGE_FSTYPES - ext3 jffs2 tar.bz2 \n\tIMAGE_INSTALL_append - \"Not set\" \n\tPACKAGE_CLASSES - package_rpm \n        SSTATE_DIR  - /homeDirectory/poky/sstate-cache \n\n",
+          "action": "Check that default values are as follows: \n\tDISTRO - poky \n\tIMAGE_FSTYPES - ext3 jffs2 tar.bz2 \n\tIMAGE_INSTALL:append - \"Not set\" \n\tPACKAGE_CLASSES - package_rpm \n        SSTATE_DIR  - /homeDirectory/poky/sstate-cache \n\n",
           "expected_results": ""
         },
         "4": {
@@ -2569,4 +2569,4 @@
       "summary": "Download_task_log"
     }
   }
-]
\ No newline at end of file
+]
-- 
2.32.0

