Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web12.160.1617899534794482794
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ZKnOIIZO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.46, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f46.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so2870194otb.7
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 09:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5yKOZVwKlB3g2m7J1HWDBR2RBFno/tJ8JZUtJCmAh3k=;
        b=ZKnOIIZOyRqmqXmrcVMnCWA/K3WYz12z7+E4GBdvYFxI6sR6xeFVleFJaO6cHol8B+
         kGzjlZDh17oEvL7wPY1ZaXBxdbXz++FO6L0q4SYnh9btAtpuNoiaA+hXZnfXHpQPPb4p
         UBTFzQUqGvu6ncfxQUjQyTozp3aq1yPyMZ6EN3yxk83sbyqbbRrLgL030Dw540zF4E2s
         lQkynu/3w2/n1dPYS2MkP645KqSB4XRrvsoOOsAOyKncGX21cY91iBctfiEl5KM3FkPB
         rTzsiYRBiACubA3rmHESdKvM1y6ZGLwro3ykCmHvuu9Cyefovl9zPKuspqgK0dQo2tj1
         V6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5yKOZVwKlB3g2m7J1HWDBR2RBFno/tJ8JZUtJCmAh3k=;
        b=dVbv5zYBIpNkBMwWLtepdrx+dsS+YEKM8gpWO4Yb6Ea+g0os6isMdn70n3WvdeoRVu
         jYNTciFcThvyhqzilmN2hL9sfoXjruvVNyLKv6uk+QATXt/u9xMJeFKLasmcdwJU7ERF
         Dj7t4M2rQZEgL1TeDx0EYBQ777znWGho3kIr1c1pgcTa2FqtkpJJn+GG0DF1c3tk69E4
         JxiRkGekXuYkki3w4wWzeehX9Br4y15uUZY8rHh8/F5m5xSxGq3ycFlmJzbZhIRbd9R+
         TqXLrYrfFbJbpIau2LcXNZ5RL8+a7QxcDUD0y2QSTmioq0m77lmX3e2oj0VeahEkYa3o
         AHyg==
X-Gm-Message-State: AOAM533PxAlkimZRVI9EMm6y3szpg/UQJCDeDnmyH9+IN01SP0EP9B2V
	4Al0D01ama5AFcG+kv/CrcHj9cpdXC9yk+kFvoM=
X-Google-Smtp-Source: ABdhPJz0pCPNv1SVyJzGSL+uAgh1z0zjwJqOOBIgQ1JSCIQS6wudiUOIeHrH+W0SsDtVJYwEdq3nzg==
X-Received: by 2002:a9d:1b8:: with SMTP id e53mr8300601ote.97.1617899533708;
        Thu, 08 Apr 2021 09:32:13 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id j10sm5546705oos.27.2021.04.08.09.32.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:32:13 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/11] diffoscope: Upgrade 168 -> 172
Date: Thu,  8 Apr 2021 06:31:07 -1000
Message-Id: <f4a792560d0c803a8bb7288a6a9cedc28101c115.1617899121.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617899121.git.steve@sakoman.com>
References: <cover.1617899121.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

In particular 170 includes rpm header fixes which stop the webpages
for rpm diffs breaking web browsers and are important in the context
of the autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 275738c3f2116de9b812b46e00d80b4de6975d7f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../diffoscope/{diffoscope_168.bb => diffoscope_172.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_168.bb => diffoscope_172.bb} (88%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_168.bb b/meta/recipes-support/diffoscope/diffoscope_172.bb
similarity index 88%
rename from meta/recipes-support/diffoscope/diffoscope_168.bb
rename to meta/recipes-support/diffoscope/diffoscope_172.bb
index 00a8195c84..eb85d6c854 100644
--- a/meta/recipes-support/diffoscope/diffoscope_168.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_172.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c6f1dc3e75b7e2e5ceac4f857fbd2ee0ddb3f0169c2b39ea9187af34208e98de"
+SRC_URI[sha256sum] = "5ffe7f38555c6409bc7e7edc277ed77dd78641fe1306fc38d153dbbe445ddea4"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.25.1

