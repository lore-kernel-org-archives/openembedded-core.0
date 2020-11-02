Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.1157.1604335783085760955
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wnq76935;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id p5so19840386ejj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bexxadh0B/uugKrRH7CKPWH21KLTdGmV2jTeenJpF0Y=;
        b=Wnq76935d71AGPZzryVjhh4ZWEhnGivS2F1/s2BkzO0X03XRa7QHb1kFCkz0uCz0fh
         WdzXaobq5DrZjGQxx6oonpH2ljjwayGj27TYuNKTpyk6WED8ngZT9EjQj24Qy21NP/C9
         N+SoX26PzwxV6Eo8mdcbkbR/l9NsjigvK+Yafnp+YIRYrilJrVp7ZUcITkIf/ig1gk1Z
         RjdNMx5mDLVmIDUo7YsyB+olswJc4v8IiDkGVPJTuf8ipHHSQ0deKN7HcCXkZqgpg7Au
         6BjikrM2uAO197EtloC4i8j8ThvCYjrY9wyrpWYEj6xOyoEGAL4rtb7gzxppgd8Q2mXy
         fd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bexxadh0B/uugKrRH7CKPWH21KLTdGmV2jTeenJpF0Y=;
        b=B0hEc6jcm3bPXrvOCXoG60SQek4d0QQcr/kU6HuF6S2LXgqddO+Gz/ArZMQDFw9d5X
         aorynwwBN/APFF0rYsep1mXIa0EW9aK/8SYt+dsWE1souGG0OqsbaHw5HWeT79KgVyYk
         H5oA+8smbiiX1boNuFvCnBnArdHz5namc84mxBQP1CTCRefIlNlJrDihglOJkXXAtwcB
         HrJMLdmxMD9xmtNfOnAOjIc4jPVMT/ztJkxVDoMVzWhWduyJ0bM4s+OhsbhV36Fu3CcK
         lydsggQ82zDavOOSPz3M3zptc2n5xBaA8D7pOtsAGhZlm01LEXUMinDfASigc3JbMYBd
         +WeQ==
X-Gm-Message-State: AOAM531GTHiT5WWR4H59hh5QT4mkSuTFXObDA1vLQfB8bz9ZQGYYjE3R
	cTfhGDYFNG2Kn9aPZBhm4rQbKOGq/zHhaw==
X-Google-Smtp-Source: ABdhPJwJ2Jx7svgKoeWU9T9ghDSd7ru5ISqTSSezYunuf/glUhoboWddx8rLSksJFBrT6k0HC3PKXA==
X-Received: by 2002:a17:906:4dc2:: with SMTP id f2mr10527081ejw.446.1604335781475;
        Mon, 02 Nov 2020 08:49:41 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:41 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 27/80] i2c-tools: upgrade 4.1 -> 4.2
Date: Mon,  2 Nov 2020 17:48:14 +0100
Message-Id: <20201102164907.27572-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../i2c-tools/{i2c-tools_4.1.bb => i2c-tools_4.2.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/i2c-tools/{i2c-tools_4.1.bb => i2c-tools_4.2.bb} (91%)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.2.bb
similarity index 91%
rename from meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
rename to meta/recipes-devtools/i2c-tools/i2c-tools_4.2.bb
index c5761170aa..7a53151d0e 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.2.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/${BP}.tar.gz \
 "
 
-SRC_URI[md5sum] = "3536237a6b51fb10caacdc3b8a496237"
-SRC_URI[sha256sum] = "ef8f77afc70e7dbfd1171bfeae87a8a7f10074829370ce8d9ccd585a014e0073"
+SRC_URI[sha256sum] = "7de18ed890e111fa54ab7ea896804d5faa4d1f0462a258aad9fbb7a8cc6b60cc"
 
 inherit update-alternatives
 
-- 
2.29.0

