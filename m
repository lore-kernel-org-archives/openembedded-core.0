Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.17504.1590940428015010811
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z5nQNGdS;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id z5so6893501ejb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xXjoEzTUgvAPtxFfI8/hXs0AWkfrujsQrWaN9B2q9Rc=;
        b=Z5nQNGdS3+JspwLffvibLpssKRgg+72HoF2fHd0m5K1UWRbfju69pWB6pJ0NCz3Jrv
         Ut78CmJJ1iV3UdKMserVmoK2MbzPrq7TECMKQs3meBJ9rKUMb8SwSx8NiwGz3irEIoQH
         ya0j8ASBQA1puMGI/9JoY2TpcWTiFbtY4ojoKcvAEO1NPJphwI2Fw9qy/G0BbDKitWWt
         CnX2YxbMamVetlwIPjDps/se2SIcYneKLQOvr7mFZI0CPwu/W4ozP7i0SyZQYE+b5Ct0
         4oDqBogTjiqhswImnJY2CWHRwIITnE/xXJyG1utz7gpjlXmAdpKtXlw+w7bUgQObNHwR
         qzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xXjoEzTUgvAPtxFfI8/hXs0AWkfrujsQrWaN9B2q9Rc=;
        b=Pbua88FsBdN9X1mKgs33aJUKLeWaqBKusqxLCB1JwR5IvlMr0wJFTVn0bGpqtreFEd
         wisc8HO0d4D1TMgiWESMAik8EK9gE1KrCn78lbeWkN2gmgc6my96/oZNRwRso9aDdhEU
         3554MOYBLJ9CTM2pi8CD1gcAv8m5vWo/f3FzP9Hhuv3ylVRlN7OuyTvQLsmhApl8gvDq
         W9chZ/nwZS4beubCi41Fr/Nwq+vVOUCPB+BqhIFpMXDJpYgrnQvUGkYQLhD7zF3+4252
         phi5pYuD1XwKmW2+LqsbB8UWEHxoj01ajkG8CE21w36nOnkcm7MHQ1kRKhXfgZAeMuNM
         bTBA==
X-Gm-Message-State: AOAM530hiC/I452P6uKGqBll2hwisGuzm+4YxxUHpJaRxvMExvzcH+Bi
	1oZZe9MU221Vs0U2DNZJG4stNphh
X-Google-Smtp-Source: ABdhPJzjol5oGj9pP30aRtV+KZ4f68W9sKoONl7BHDoNSr8c77rcLgYbfOwc+0O0IPokQ+MKWB7Fiw==
X-Received: by 2002:a17:906:148f:: with SMTP id x15mr15393504ejc.85.1590940426376;
        Sun, 31 May 2020 08:53:46 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:45 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/70] man-pages: upgrade 5.05 -> 5.06
Date: Sun, 31 May 2020 17:52:06 +0200
Message-Id: <20200531155254.10283-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../man-pages/{man-pages_5.05.bb => man-pages_5.06.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_5.05.bb => man-pages_5.06.bb} (87%)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.05.bb b/meta/recipes-extended/man-pages/man-pages_5.06.bb
similarity index 87%
rename from meta/recipes-extended/man-pages/man-pages_5.05.bb
rename to meta/recipes-extended/man-pages/man-pages_5.06.bb
index b95872eb4d..0d632e6170 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.05.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.06.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=794f701617cc03fe50c53257660d8ec4"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "cdad5deb15117e60a6d9e3a6bdc035b5"
-SRC_URI[sha256sum] = "43c33d2eea9ba989c18eef90298cf6d5521ff038deb51cda0ecd0fdc3cec2b7d"
+SRC_URI[md5sum] = "ebddb52ea013c160f07fd0a4a7e9266d"
+SRC_URI[sha256sum] = "da4e939c624bec4bab8ca1702e5f54bbc70505090d90967fd5e12bc1453f19b0"
 
 inherit manpages
 
-- 
2.26.2

