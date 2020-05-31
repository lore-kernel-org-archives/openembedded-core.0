Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.17506.1590940428919956469
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Utc/iJng;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id k8so5424394edq.4
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p2SAJ/xm5f2vDZpvNkfqTXW+No/P1KJcMwxMPUU3vMU=;
        b=Utc/iJng1CA6LV6piO1LAHJFoMX9UUzc0OJMEXfDJe6A46VXdO8gvuly66YhC6HwYv
         eScjDt4BKRiaLngx6I9mmDXaKFX4h7La1l1VNw31OZ+GW9SnhJoiOZm0n6T05cf3vNqa
         byf3gwzcaN7tuq+g48kcuaO5oTCjaZJozOR0cLIXOtJda4zok0BJQ3Df9Uty//hdFTxf
         H0Mnc8N3+8FHKDUxp6OW9c1gm8H4QAB/63k6XVv9H2va7kr+XrMFHajJQReGY/nu76Ra
         Rzd2LNxn5Oq5np0HBU+ljQc+ccVBTOggPTKq+TLKqxUbOQsps0gqCki4WkntW+hdIjyJ
         38ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p2SAJ/xm5f2vDZpvNkfqTXW+No/P1KJcMwxMPUU3vMU=;
        b=EsksnTZT7qbiPghrZWV0wZSDcV8+X9fsTCFz/Uz8UM/ho3kkwb2R9c989hplQE3SiV
         IngZOw0kIGA812k3xe8CLWcuwusmnRhlEOPeu8nUjTbUTVYAdcX805ERPpjuA9HlcLNl
         gC8AhTc7+uNz/uaEbiW2FMXWEPsz60iBRkA1QcKr8uKuKD88kryorK37JiM0T3R57BIV
         G2oAdn97jkXqmf06eeFQqg+PhrD38ac7OdTYMuQL8bandhPV0a/xdyipMwLCML1sTBe7
         9W/wMPm8VvjTZ9hZaHQcao27IxOxezCwM3fv6cD9USgMQhmAoCWRg5UBDetSC+PnCHuK
         42VA==
X-Gm-Message-State: AOAM533hVVBA+GXC99vI0sbJ1I6Qb6ynfvF2xlMv5qScKD5HrKWhooaM
	t7jrWr4buScOCPjlz2VfSlSxJYfZ
X-Google-Smtp-Source: ABdhPJyGVFmXnMNiaQqBbXjs4YtDwH52NmYCmw6iSHDqJJGAVLYQR39GwBW6WB3SazmrdkMLbJ7/5g==
X-Received: by 2002:a05:6402:1775:: with SMTP id da21mr18134350edb.271.1590940427324;
        Sun, 31 May 2020 08:53:47 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:46 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/70] msmtp: upgrade 1.8.8 -> 1.8.10
Date: Sun, 31 May 2020 17:52:07 +0200
Message-Id: <20200531155254.10283-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../msmtp/{msmtp_1.8.8.bb => msmtp_1.8.10.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.8.bb => msmtp_1.8.10.bb} (86%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.8.bb b/meta/recipes-extended/msmtp/msmtp_1.8.10.bb
similarity index 86%
rename from meta/recipes-extended/msmtp/msmtp_1.8.8.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.10.bb
index ca359a1507..42cf6309e9 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.8.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.10.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[md5sum] = "016e432d12e12dc5d73960e2bc67f0fb"
-SRC_URI[sha256sum] = "eccb53e48f025f7e6f60210316df61cf6097a491728341c1e375fc1acc6459e5"
+SRC_URI[md5sum] = "168430e48f351b5a157ad930d7db3ecc"
+SRC_URI[sha256sum] = "caba7f39d19df7a31782fe7336dd640c61ea33b92f987bd5423bca9683482f10"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.26.2

