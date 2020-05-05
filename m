Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.1489.1588648796824791347
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GxxGK8Fu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id s20so251790plp.6
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=WhI+g0Bct4h543eCNB3s9wPh98+uRZv2zfSlgPYXnig=;
        b=GxxGK8Fui11o2TyUewH2eVRVU5paqpbLpziJGWA9mT64g1Cfa2jADD5JVy/Rx1l/EB
         28gh+aTPL7OJ4pB2RD04S9j8SMuy/as44GdrhwnO2FJ9IFkaKeOhQ2cAP0Sc6TSptOOy
         4pp48EPM5AueFz9cEh7LEsyKzA2IojwWguqY4MvyGyyy8Cy9irKsyftnUx5VtZID8z37
         Ov84uOVMbmzr80scKOToICgU7PPZVQva/x3hIu9PkWJV5iqgFOKnKECkcOwjC24Re734
         v2ail8aJNQjbIyCEDSMCYDzOrsqX9ZEfLLlENiNy8QuwWvtkQhLYXOq7PPMEZ8TP7kf6
         jupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=WhI+g0Bct4h543eCNB3s9wPh98+uRZv2zfSlgPYXnig=;
        b=l/dJmFEoKAoW2qG3S4FTR+Kwg4fxh34og/1UFlhNMmweAvFld4Udr2V7d5uNGi3Jfq
         sd2VI+aeQYPmiCc/Lbzkgcoqx5tnRFrYteylzgV9pDAt9+fHi63uJVC/HkYs+o7iLP80
         /Bz38apmSGKl0IsOJgWmN6j4hwlsm0G7W8M8nOHpts+ap165cxKQOnzFu1rvnHfnku2P
         S7tGNCS2rEcY6gYu8ki4hqXKUI0jhnJpIMieh5qaFR/GKX12gMFMJr/6ektaRqrvuMp9
         kKTBFKB/Fe8yHNwsh/to8rnk6ovM7fcP+jLOTWQQDa+4Jp/0XtWjhnxKKo+ibNvyOxvz
         1i6Q==
X-Gm-Message-State: AGi0PuZrAYz6uFozwFPbXYw47RhgquUcF/rewP9hzQnsz4UdUEOj/8Jo
	/I6KdhSyuK9YRp/2AjjL9X8S0MM3Ci41HA==
X-Google-Smtp-Source: APiQypIX5dtZNOL4IGEPIdKkloZsmW92QmvAGzWFJjvlbMfo+bIOtonDiWqTk9EoOlYc1p5gTDcSlQ==
X-Received: by 2002:a17:90a:208f:: with SMTP id f15mr421891pjg.60.1588648795913;
        Mon, 04 May 2020 20:19:55 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.19.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:19:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/28] busybox: Correct the name of the bzip2 license
Date: Mon,  4 May 2020 17:18:57 -1000
Message-Id: <be67faad412c47fb739059bd401322271f2cd7c8.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The common bzip2 license was renamed from "bzip2" to "bzip2-1.0.6" in
commit 669600ef to match the official SPDX identifier.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 344e891f7a..6cfdcd7344 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -7,7 +7,7 @@ DEPENDS += "kern-tools-native virtual/crypt"
 
 # bzip2 applet in busybox is based on lightly-modified bzip2 source
 # the GPL is version 2 only
-LICENSE = "GPLv2 & bzip2"
+LICENSE = "GPLv2 & bzip2-1.0.6"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb"
 
 SECTION = "base"
-- 
2.17.1

