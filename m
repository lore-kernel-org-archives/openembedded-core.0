Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.21902.1584839898309837721
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2020 18:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qN18NMzt;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id z13so5312419qvw.3
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2020 18:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xXbPzYA4GnyqoLjL2aAl9g9R6TneG9J37UCitk6Ysdc=;
        b=qN18NMztO43At1g58cxvKfuH5YIniY5tMSKlO/kSUx22Npi8JTEidp3aN8F200ZRZt
         pNY2Yw4zb9b+IunmcAzB0KQjiCPMyYQrTDC8Mhuu0kYQgbdp9d/aH3MQWivpao0URy2V
         eWD14H7B5zA5cNIx10QrokNH3wa778egQNYgcbFzweis22J/+qKoD6tyX1J2dBNuvgQC
         fUKpZ84h9hult2axe1x88m3EU01L2UnFbAhlooi+bn/t2gwisnjqDc7LKiH/NLxxKI5v
         XDc3+PRZ1mCfN/IGVW+S1ga0sNtVwe8eH70oFR2zTrg/fB+9RfUtoR3lrfrchlygldIK
         7B1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xXbPzYA4GnyqoLjL2aAl9g9R6TneG9J37UCitk6Ysdc=;
        b=EOMvDdHtdoK6+uWoJe2F5inDpqaVMwVI5LPBP+u5fZZ1JBjG/1wn6ThCoDp3bwpqqc
         PjmuRtGBYrpikkltLnNqFFRUqwS4Q6M2XcNY/s4Fu30xhPqzf5srq138B7mAY7zYFafJ
         4eprVsE6dPKNUU3/qDu4xbnGwsrplIXAaLhZOgEUF7KY9/fkDluYTx0pdJYs0O+Hxb7F
         sh9KPdraAIbYKbTsNqOd0C03+pqPLqAhBYha/DYeu9WxTyQwNvYUaUeP/TRwJQxWFjRT
         2oJlbfCnQzZKMACjDQZ8SCrXWYyEvI+jLJrd18ArsvMrU+pL8SwygdUoFOmwXzGPMM+y
         4i+g==
X-Gm-Message-State: ANhLgQ2hu3MsXZOvBulf1+rxlvEylw02vK+PCJ3K1igOVvrRFl7YvIky
	jD2a/V31LG6cd4c9x6NKFA0=
X-Google-Smtp-Source: ADFU+vu5wwiOVIfzbrcNXDgH2pk5ykL7ZKqVylTe0XORIlF0SxSprWFx6yj6UsRBJs6IhLBl2MDNFA==
X-Received: by 2002:ad4:420c:: with SMTP id k12mr14823047qvp.39.1584839897451;
        Sat, 21 Mar 2020 18:18:17 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id q44sm4536614qtq.11.2020.03.21.18.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2020 18:18:16 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto-rt/5.4: update to -rt16
Date: Sat, 21 Mar 2020 21:18:11 -0400
Message-Id: <789c899b1058fdd0a9053c68d174c7b4d36802ae.1584839764.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1584839764.git.bruce.ashfield@gmail.com>
References: <cover.1584839764.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating the latest v5.4-rt release:

   2659f7a7212c v5.4.26-rt16
   60c22c68d486 v5.4.24-rt15
   efa03618228 mm: Warn on memory allocation in non-preemptible context on RT
   908775cdf21e v5.4.24-rt14
   b4edc32e2e46 v5.4.22-rt13
   49a5b8ead027 tracing: make preempt_lazy and migrate_disable counter smaller
   8f2ed8895c0c drm/vmwgfx: Drop preempt_disable() in vmw_fifo_ping_host()
   b558bcd37e5d bpf: Update the "bpf: Make BPF and PREEMPT_RT co-exist" series
   d197132b1dd5 v5.4.22-rt12

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index a02a4a14ed..446eae2be6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8908d882dee239b858bd3b42f0c951a35220efb1"
+SRCREV_machine ?= "2659f7a7212cd80e2b69b2e5e8ceec8bcffec6aa"
 SRCREV_meta ?= "9fe365b9395a05831177ec309e9857962b2496a9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1

