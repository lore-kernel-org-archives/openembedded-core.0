Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.47507.1622484973213060693
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 11:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UEHV3MO1;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id h16so3190217pjv.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 11:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ar6VynDt1Xe3NXKnUapUgeMdr/ZPL4N6/W7UTUR3/oM=;
        b=UEHV3MO1TlhJg8SE4YZtpMscshyp6BgaIuURz8YWGlM0Q5ZL6k8EDxqw9O7COOey6y
         LD28QaD59FaQ4MxAmjU/2D3CekcvWgGrqaCFQqyJl/iQcAqIQiGgWvedPuAmKhIbONAR
         Xa3rfmt9Nu2rjjr4FvmeBG65ubsJp4ACuvPbSnw6jLMzsySSsodlqtTMDSswtGCCqpPe
         iAQ5+cR/9Gxxb9acGZHocKj5YrIP6pHdl1rWdOUBY9rfdudlZsEQBZ4RNN4Dge3LvYTX
         nzS/C6b7NDRc26TFdlMFSm6XBns1fBo0PFO8gORDRcbWPUG3q7KRNyt1RalBnUjV0Ich
         QaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ar6VynDt1Xe3NXKnUapUgeMdr/ZPL4N6/W7UTUR3/oM=;
        b=CT249IseifbXBCy63o62uFuckyxA263sGKAxW/JUKOe3xsAcx9p+SK3C9ut70DwL7w
         /MWH2kBIhVPqygUH7pzr1eUSV0Q3qTcMyZcl2hsyV1xUMOFTgostuB0ZqqiHtEqYOqxR
         XVzBk7iUPJMrahyjNGJq/Mv4eGZVa3/sIFouzcDWR3QBxlbd5eCPLjlP9LVWqEbPtqda
         ow1dqBsWNEq93aru5JViRe7VTuz3lb1Vxz2abD6v40zVW0uhwuaPylkaJ51mFLs3r+ke
         IadTKyc+XEexu4ZTg7RnFRwEL6CxFx76HcZxh2axF0g7cyOuQzdrlOII+4R2SdIP4Ma4
         qLFQ==
X-Gm-Message-State: AOAM531O3mQLqFU10p+eGCTdsUYlMB+eYsUtmXXXplNhn3S/MaiFf00x
	yUSW+5ytBYusw4u/4Gm823WfKgnLRnZIUw==
X-Google-Smtp-Source: ABdhPJxLYYmluKmPHW7rfeXYbbDMMO7hScaOPA6IGrsFAbrLSY7gybEyxsAbqWKbCwwMLcXHZvMUqg==
X-Received: by 2002:a17:902:eccb:b029:106:def0:2717 with SMTP id a11-20020a170902eccbb0290106def02717mr2051087plh.66.1622484972651;
        Mon, 31 May 2021 11:16:12 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from kona.dnls.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id 4sm103876pji.14.2021.05.31.11.16.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 11:16:12 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [v2][PATCH 2/3] kernel.bbclass: link in kernel-features
Date: Mon, 31 May 2021 18:16:08 +0000
Message-Id: <20210531181609.963494-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210531181609.963494-1-akuster808@gmail.com>
References: <20210531181609.963494-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>

--
V2]
rename kernel-kfrag to kernel-features
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8693ab86be..493136dfb0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,4 +1,4 @@
-inherit linux-kernel-base kernel-module-split
+inherit linux-kernel-base kernel-module-split kernel-features
 
 COMPATIBLE_HOST = ".*-linux"
 
-- 
2.25.1

