Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.955.1599081245628926799
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UvEiOJWz;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id lo4so686653ejb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RbXJLNZCLZ/WGKONBqQ9sw+247l5vCAYETa/bhX2llI=;
        b=UvEiOJWzhJpZZ/ny4RnrOwIu3TTzrT/692bofKWlZPBrOiEPXu6H/SRAIQKcj66W24
         DvqIVRdfZU/LObUNkWfy8MUq6i6jhUfDsQsmA2RfSG6HuLXV3zVFIDbFrDSQCoEjdiH2
         J+dU5wYCoNihWjB7H5WoHViW4p7kWx+ZmLUK52RjguuelJFLoKda+wxASQkHyIkqqS7L
         9hHNotpumETiMLg7pqYROtbHFrmdGNuOys9V4Tsdg7v1B/vBhbSWQJaD7nGmu918oMQ9
         8HTi/uB4f7ZmbbRdh3T+dcf7M2QK11vD9O6FWixR8I/kaTVAsEUjJ74o+M1u/SD2uIwq
         vCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RbXJLNZCLZ/WGKONBqQ9sw+247l5vCAYETa/bhX2llI=;
        b=UaivAYAMzABTiv+4NWVqpPoYz6aSXIGWDurZVTHG/m5U5a1YbrSOS7QD8LO25lPgTW
         BPqxBAx1G9ZtT9mC3rmdF+wg7k30wk/rk1nijhk/YPqXKyHCGtu4BsG/aavNyKRaq7aK
         ecWXqGhxImjCRC6J9MpJW1xiSDUB+uM/5c/tsFmo3rQhsMXUKTgoImyh9v8y0FJFvde9
         No+WjSARE2JN8w7+Nnt9ihwlbzWpr/8h5hrQZdd4OHlv6zh9o+2lOO5kYrfmTaKimShi
         V6kN+LX7ELSxV5b2cYe0UfHJCKAJArqQ+SHaXA8mDAcn8ohkqSf+tjwQSXZcsBIiA6Nk
         3Qqw==
X-Gm-Message-State: AOAM530j4/nLsMPc4Bb3JuPhMEPiPNZvdnRecjXqKf8Y7xENQlJu63Sk
	9x506itkrQkqfIlmfmmOV8VBziW9St8=
X-Google-Smtp-Source: ABdhPJyvpTnfxqSP0qQDNmESVampO2hGiQK7IfNRMHtX2BFJf5y8VJYgOyZaVnR84TUuS2NCWuMbsg==
X-Received: by 2002:a17:906:2717:: with SMTP id z23mr44452ejc.19.1599081243818;
        Wed, 02 Sep 2020 14:14:03 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:03 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/23] libuv: upgrade 1.38.1 -> 1.39.0
Date: Wed,  2 Sep 2020 23:13:16 +0200
Message-Id: <20200902211330.4853-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libuv/{libuv_1.38.1.bb => libuv_1.39.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.38.1.bb => libuv_1.39.0.bb} (90%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.38.1.bb b/meta/recipes-connectivity/libuv/libuv_1.39.0.bb
similarity index 90%
rename from meta/recipes-connectivity/libuv/libuv_1.38.1.bb
rename to meta/recipes-connectivity/libuv/libuv_1.39.0.bb
index 874546373a..b6ce4757fd 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.38.1.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.39.0.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRCREV = "e8b989ea1f7f9d4083511a2caec7791e9abd1871"
+SRCREV = "25f4b8b8a3c0f934158cd37a37b0525d75ca488e"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
 
 S = "${WORKDIR}/git"
-- 
2.28.0

