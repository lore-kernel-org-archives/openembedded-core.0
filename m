Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.6406.1623744777485589984
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hR6nLdcn;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id h24so21078486ejy.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Iev/gQy0GPeh8zbCBd+oQSMf7B/O0/YfOw37hOCjpM=;
        b=hR6nLdcn9HA0aiZTzI3PiwVVaU4sgsKOcZ7Ju1tj36Qkv5eJFMzL9D+nKteAAIfHS5
         trLWqv9bARXDNvXF2+PcdbGRMNNGVdydHr5g6p32MDovGKIfuxmgva0Pbxe9AkFx2odo
         Q0O7mTgbg2SQfGoL/Wn1SiLq2ZjEy8QonFhNZloNTDmGyuFk4/2Ia57tnz4U7Z7P244N
         O97Sa92+bPd5wMBq5hGzLjV9WfIjHChRb9ubUKD9e1k1FFmxRNrfJyW2DUGbDlibwvWW
         oEBQ61dWGjxMmxyt1v5s+yXUKFyAg4hLNofAzqWHt9Ty+GG0yZuAkZ5vTlZ9bj40JJn2
         B0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Iev/gQy0GPeh8zbCBd+oQSMf7B/O0/YfOw37hOCjpM=;
        b=ZRtsSA245BNQ8OVNfBvwhr1L5gMm/yXR1hABGlljI8SzvVmQXQoH2ypxd2+YeJg6V4
         MXjQdJTRCphjB1WmJIZV0EBYUlWbzxI/p7MJ9cFy6fjSZ5szRuzC+BZokukP0IXqMJWb
         4srHZf97CoroL1MPkDgcgekIHRxLjhS7EDUktO8v3DoqBmYAuGTnbQBm1P/RR7GGXc49
         1De2dzgWFD2hCNbKl8Z1FfgOQhS/YzDRbfJqACei74Phiazb105utY9xGFhLyquu77ig
         7cdUnwtlD2LwMqK/+wlVgwfi4M9ri7JcUColEHKH6jKWziw2yxY4ynkIzT4VLwEGVsHg
         +4cg==
X-Gm-Message-State: AOAM530Tr5Wii+80lI/7l//g4WiyIdz5PAuELBMlkVfK/HGUBRuPUm74
	06lGSWCtMJcVGkqgXPOmpDAF4mAaij6GYA==
X-Google-Smtp-Source: ABdhPJxr8mDBXlNkrd+H/wf9tOQH+vAGDpWp+HDMfjSKCYSmBM4bt1vqN/SgEf4gN5RQLxXx4latIw==
X-Received: by 2002:a17:906:179b:: with SMTP id t27mr19122768eje.70.1623744776076;
        Tue, 15 Jun 2021 01:12:56 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:55 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/31] gptfdisk: upgrade 1.0.7 -> 1.0.8
Date: Tue, 15 Jun 2021 10:12:25 +0200
Message-Id: <20210615081240.1734087-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../fdisk/{gptfdisk_1.0.7.bb => gptfdisk_1.0.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fdisk/{gptfdisk_1.0.7.bb => gptfdisk_1.0.8.bb} (93%)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb
similarity index 93%
rename from meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb
rename to meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb
index a697b74f98..16fe540968 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb
@@ -10,7 +10,7 @@ DEPENDS = "util-linux"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-gptcurses-correctly-include-curses.h.patch \
            "
-SRC_URI[sha256sum] = "754004b7f85b279287c7ac3c0469b1d7e0eae043a97a2e587b0560ca5f3828c0"
+SRC_URI[sha256sum] = "95d19856f004dabc4b8c342b2612e8d0a9eebdd52004297188369f152e9dc6df"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
 UPSTREAM_CHECK_REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.31.1

