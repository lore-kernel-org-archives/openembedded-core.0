Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.13806.1629891510727663602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 04:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bqBc34/j;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id h13so35991505wrp.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 04:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UZihiEr3Q6DZjtBqYRaNRtBLgDjJ13akt339Eb/GSUg=;
        b=bqBc34/j5S1GCNUOaRN3mlTYIim+SQIiLnFW2dGQuzI3rNQ91wpkSXcD33LuIPkQwq
         tIp19TBLXOHI776Uug3AwYhQPN3qEGuHMHMoIje8J5v5qwAb06BDAiXHR5GZ37v+Gp3g
         z2SB0sb2/+gGDott0DMDjWnQSGKSHC6WFdSHGi1uFI2AUPIY3DFiwZMePhLaQwQ5qDyd
         R6y34NWG4G7TZBsyRIk2eXAWIz+4TZHFd4J3pBCO7xMizxNPHJMGbpNpqkJF2SnP/qMt
         FJinP7IkoAzwkg4jlX7UzL0k+rp7RzTMEh4y57DyqeWJ4kIK+wv/fNbcGAregLYwmuGn
         atMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UZihiEr3Q6DZjtBqYRaNRtBLgDjJ13akt339Eb/GSUg=;
        b=Fzgc8Z9DZfw4thAMZM1GJ2Ss58h2j0S8b9Rp1sczR2TFTuCOrQtraTPEqFPzF5kIXm
         t+aZA4UIGBLQJc8WNC/fdh+xdk3b5YK2SFIwEiDN4bpWaWCvm/SuUYivxTuPY2v9sMbv
         wX0wYkkLGnr+FqsO5yV9RK4lYYgCQLq6CJGBpbesJ1ErCv3eKu7nxuXk+xfmqeVxVFCx
         xeBnK5PsAPhTSAWsPRxn08rO4a7C17AZCHmAP1r9od0w78m4ohuJvZUcYCh8SuEij/wg
         b71fcf4DVvfLmWvMXTyEzHi6JwYNyiQ5MyVW8MLRWImGXOqphbU1rIwqm4DJIPFd/VqH
         /AWA==
X-Gm-Message-State: AOAM5316oNtTf7y2TNkNST/KaobCTO7MQvJMdbJsHg8FvyFSXOXlEV9U
	+FNGwSk40wFwbdV76quUIb7qiji+dfVTTA==
X-Google-Smtp-Source: ABdhPJxMWh8XBK6y0sSp/n4NdoujH3xsqvOyOul2SnyYbJ0ktgAY5TyCfFl8dmS9ID2L7g10GMuhPQ==
X-Received: by 2002:adf:fd0a:: with SMTP id e10mr7735498wrr.2.1629891509383;
        Wed, 25 Aug 2021 04:38:29 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id z17sm20790217wrr.66.2021.08.25.04.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 04:38:28 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/16] bluez5: upgrade 5.60 -> 5.61
Date: Wed, 25 Aug 2021 13:37:56 +0200
Message-Id: <20210825113804.779395-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825113804.779395-1-alex.kanavin@gmail.com>
References: <20210825113804.779395-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../bluez5/{bluez5_5.60.bb => bluez5_5.61.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.60.bb => bluez5_5.61.bb} (95%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.60.bb b/meta/recipes-connectivity/bluez5/bluez5_5.61.bb
similarity index 95%
rename from meta/recipes-connectivity/bluez5/bluez5_5.60.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.61.bb
index defa0c15cd..b2e5dd66a9 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.60.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.61.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "710999580d01ee59ec585e5e7c07fd94eddedc001aa26fe7464c546f9d945304"
+SRC_URI[sha256sum] = "83afd6c52179554bfeabbcb538fec2eb6be90a8ac3c40871b49d7ad8b49c423b"
 
 # These issues have kernel fixes rather than bluez fixes so exclude here
 CVE_CHECK_WHITELIST += "CVE-2020-12352 CVE-2020-24490"
-- 
2.31.1

