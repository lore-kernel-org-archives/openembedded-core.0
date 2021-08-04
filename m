Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.12800.1628100056254349897
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 11:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t/5FRPkO;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso4714064pjo.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 11:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qvPR4S4FVvnDo6YWm7YI1K777QapP8YTDq///XRFKs8=;
        b=t/5FRPkOnKa67HpQNi9MObuGL8xpgE4t9SGUl4SdcHLKw1sUBvdtnvBM5RRR8KfesN
         ZtwGzKUSpKCYuDlCvqz7tIHtcfwt7YQyJ7J5UdYgG6uSzSxD+LFwd7IYZXOeQ1lkcBZW
         gIfC4cnEz5Lkr5Lr6o8XHLESE7IhHNLM+hopQ8nLLrRWxI9RdSqrmbHtUHU5S5qrkwc2
         tT0qjfz608IDEpKoSDwC+BoonvixSxrTnWr5LvUPUkmh8UjR5KeBed7JGIwcZwAEWxaP
         Ave9e7l4mLJj7m/UErDxpfSx1i4r+cleY+gJGtvpX2+4X4Mlvw34egjUEVJED2lJ1pE3
         5VbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qvPR4S4FVvnDo6YWm7YI1K777QapP8YTDq///XRFKs8=;
        b=XrJ5wrZc2osfFLLbQAbORRMJfIF2rhabUNdxoD2ZLvmOOePbJ/vD8UoGn7XXm4+KGo
         vjT3EjqLf8k5BrYg860EN/dK1QiHcG0OJapyGb925cU5bQIiuqvSr4+ef8ZFxE4gRQG1
         riG1Os48GHSSanXQdn7Qd44d/VCCXMOES42mC/v0RhiZ5xqir7J7D+TPb29ShDRdcTcS
         YdcT6UHzD96Jta3l1RVjaRr9AQlhWSWOkZTlopSSwMwfY41LsHDf3QNaGVuQQ8k2IWHB
         I73nQch4MrngCD7Lpx3YzMEJYK4+NcG3MuV0uSW2F2Lm2MThsVEOKpt9wxo5dXeqOAkK
         ObUg==
X-Gm-Message-State: AOAM533AL7gOT3t/7+fx9SzQXxcTJLfVCuR/DAyDdlDWkyRlh/1My0aP
	UG339Rla/cm81CBqGA7wvkvo4tTXOmFMDw==
X-Google-Smtp-Source: ABdhPJx7fVnrxo2J/TJq6Ek2j1cIz21BieXNBPmCPPKaR1GzUP3/ZKKz+r8yRGOdbaYXbbl7x1nUxw==
X-Received: by 2002:a17:903:308b:b029:12b:c7ec:998d with SMTP id u11-20020a170903308bb029012bc7ec998dmr328525plc.78.1628100055358;
        Wed, 04 Aug 2021 11:00:55 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id p8sm3586094pfw.35.2021.08.04.11.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 11:00:54 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] libssh2: Fix syntax for using ptest override
Date: Wed,  4 Aug 2021 11:00:49 -0700
Message-Id: <20210804180051.1865715-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libssh2/libssh2_1.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libssh2/libssh2_1.9.0.bb b/meta/recipes-support/libssh2/libssh2_1.9.0.bb
index 9ae736d25a..a0cbb6af6b 100644
--- a/meta/recipes-support/libssh2/libssh2_1.9.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.9.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch \
 "
 
-SRC_URI:append_ptest = " file://0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch"
+SRC_URI:append:ptest = " file://0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch"
 
 SRC_URI[md5sum] = "1beefafe8963982adc84b408b2959927"
 SRC_URI[sha256sum] = "d5fb8bd563305fd1074dda90bd053fb2d29fc4bce048d182f96eaa466dfadafd"
-- 
2.32.0

