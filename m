Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.37492.1628865144178072130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 07:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=aZ/oOXY+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id bo18so15623821pjb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 07:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=COgQSgFzLh3pdzg/QQwUDx39hCxpPCyclU/BOlAGW0M=;
        b=aZ/oOXY+O71IwD5jbzypFPqwCU0Fy+H6SDAXNFWLqxaKMDvVcBAKbAQPoauArwsHXF
         Mb5H4S+INrOpJubZ62KKqdie/bIUces/NYgDFcKtzHwtWMmn3fMvMp7XhWCIZMrZU7n5
         YpfjtnHLrfGmUWk7vi/wnyCz4KMLEQMAzzBUJ/tXkhPyh6Cw5wsDVAAxONEuiWlBeQ0j
         dqCgErWPfuwsWMF+jxug+7LAwPWTC0CSbMIXMbEgrpCu2c5sS7Zl5awKjVI6KPBflCDA
         ZZ/M/vVfyUP/H7vabne8DNX6MbvFpRwxnVhu5uMPLeLeWLc7yHeQiZCl1TvbTv4Ele4F
         u0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=COgQSgFzLh3pdzg/QQwUDx39hCxpPCyclU/BOlAGW0M=;
        b=t5zN3bEFy95DD/F1iRao4v2zUflXFVG7NlEk3S3hBe1iFz0LRKAsu1M9pr3g2IgueG
         5L8q3rJf5ka6RlFxqEksENGk47NMsAjQKvHg/M5Xyx+X6qtvxslNzcghwT3/CZST3UeV
         0YpDGHNMPNQL5GghqI2v4F6E3+Gd+DyV1QGP85GNHp0Lvk+sTjntofWcpwjlwc77vFIs
         vb68eO7cI4iHiJa4EhQ8199SxG6GQh0aqJUqEOUAvBU0FBEzBajsPigByBufCUbjBzrb
         kYu5SN1RbLGsNndHogBFcsvRro6WH4GPCSVhsBaXKhnTDKfUAe+epFnY2Cogn47lwAvj
         Dnlg==
X-Gm-Message-State: AOAM5300gDt/ME+B1ZXe79t+0TOfxR8ugSI5X8zH8vbSbZxDZPfyQvE2
	M5QBcRHe6b5WRBqDLu3ir5xXgIfOPzfPmq3R
X-Google-Smtp-Source: ABdhPJzctdNmKThr+bbtPb2JefV9XznwYME18MHSOnc7R+53gtuf70byFNEc6KYIrqv0UEw9QQUFGA==
X-Received: by 2002:a17:90a:4d8e:: with SMTP id m14mr2937600pjh.106.1628865143316;
        Fri, 13 Aug 2021 07:32:23 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id nl9sm2113182pjb.33.2021.08.13.07.32.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 07:32:22 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/17] cve-check: fix comments
Date: Fri, 13 Aug 2021 04:29:53 -1000
Message-Id: <b8abb45a02caf71ce843f4bf3bd762cf3b0219ec.1628863869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628863869.git.steve@sakoman.com>
References: <cover.1628863869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This implements various fixes in comments in cve-check.bbclass
In particular, the "whitlisted" typo is important as the "whitelisted"
word is going to be replaced in a near future.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5eecd2bf942254d08c252388594e5ec7ae330f45)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 8e7e3c60ff..03aafc5a54 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -20,7 +20,7 @@
 # the only method to check against CVEs. Running this tool
 # doesn't guarantee your packages are free of CVEs.
 
-# The product name that the CVE database uses.  Defaults to BPN, but may need to
+# The product name that the CVE database uses defaults to BPN, but may need to
 # be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=libtiff).
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
@@ -56,11 +56,11 @@ CVE_CHECK_WHITELIST ?= ""
 # Layers to be excluded
 CVE_CHECK_LAYER_EXCLUDELIST ??= ""
 
-# Layers to be included 
+# Layers to be included
 CVE_CHECK_LAYER_INCLUDELIST ??= ""
 
 
-# set to "alphabetical" for version using single alphabetical character as increament release
+# set to "alphabetical" for version using single alphabetical character as increment release
 CVE_VERSION_SUFFIX ??= ""
 
 python cve_save_summary_handler () {
@@ -230,7 +230,7 @@ def check_cves(d, patched_cves):
         return ([], [], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
 
-    # If the recipe has been whitlisted we return empty lists
+    # If the recipe has been whitelisted we return empty lists
     if pn in d.getVar("CVE_CHECK_PN_WHITELIST").split():
         bb.note("Recipe has been whitelisted, skipping check")
         return ([], [], [])
-- 
2.25.1

