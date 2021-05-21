Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web08.9255.1621603773223826462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 May 2021 06:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SZ7+/hAs;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id e17so7592581iol.7
        for <openembedded-core@lists.openembedded.org>; Fri, 21 May 2021 06:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d7B6fQbuVDDt8CMYtDgIclnQanGfSSTluca8SKK0Yu8=;
        b=SZ7+/hAsrCt1tAqcR1z4BHRuwO0idHHUMxcvRkTsN4n3XeGZ0TFSxdqr4eY8kL81gn
         ISh288oFXzRLxdfGlsRrG7bw3snG98p7+zez6OI4wjgreHy/5PMHHtkSVcXFkBt9bMil
         HPlOQYAny8pkfMrgLXMJpBsJqCaJHWnRiVYzwzm9M2PUDP0ghvzFOVRsHuLq+c6KuTKx
         4+YvEkLALTMOClJeUrrNx3xFOjTXZ+r34uLdScrnbtwFnnk/ooTXbr2m4WChj4zjBbXy
         E6O9MN8zoSzMZ1gA79UZ2nSM+y0quEij5rUD9FBjYybofpnsF+kTVB4aE8z19SPsRW0f
         fcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d7B6fQbuVDDt8CMYtDgIclnQanGfSSTluca8SKK0Yu8=;
        b=FgO3bUIEv6/ibGkJGPbtVA7s1LyzLmEvf8sxO9yWLhrqTb8SSBCDQWU2jBTncePp7w
         ClZsrF12t1459eoyGCD7tRxUO28vV7tbc0mYdsUfIjRh0qjWZP2N7rNi8sHgSdvVYSOs
         O8dmLMmMle6OwBHCU4CiNb+4QMu01hfOmNQs+S5M9cRTfODOtcXstDv4f2V89ZfkWVLQ
         5qbqt+Rje9CD4yXNrQ0TfYnM31E3BpRXgDUN2DZVrSo7v80Ui7vDltWt3GPJkCKYFwrc
         ZkOa3MLQpdBTr2W7LoSFu5kivUeM3oz8RLXJvUrgzPXd3ACMjNIGPzKr4rL7U70XrztA
         ytcg==
X-Gm-Message-State: AOAM53289M6vBNOkZfbcEC41HQ3ODEFuW1OPHfIoShmqPKk2XzbxbfcN
	OLpavf3T8ubO2JzyFaEarsoeUXyqCf1YCt20
X-Google-Smtp-Source: ABdhPJwP0karZP967kHIHew8jspqjzF/br0Capd7JgZfvBGONtAwoA7Y4dMG78vREvENlwkUyRha5Q==
X-Received: by 2002:a5d:8481:: with SMTP id t1mr12543565iom.39.1621603772286;
        Fri, 21 May 2021 06:29:32 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id f8sm1165202ilr.12.2021.05.21.06.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 06:29:31 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v3 3/5] rust.inc : Changed target cpu for powerpc to "7400"
Date: Fri, 21 May 2021 06:29:12 -0700
Message-Id: <20210521132914.140884-3-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210521132914.140884-1-vinay.m.engg@gmail.com>
References: <CANNYZj-yODhEEFErtUxBeiw3O1YvEfV-hGOOW_uPNvo6x8mNYQ@mail.gmail.com>
 <20210521132914.140884-1-vinay.m.engg@gmail.com>

While executing rust-testing observed some ui testfailures due to
below warning message.

'powerpc' is not a recognized processor for this target in rust

So renamed target cpu for "powerpc" in "llvm_cpu" to "7400" as per
default tune for qemuppc.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/recipes-devtools/rust/rust.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index a1223f45e7..ee3176b559 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -290,7 +290,7 @@ def llvm_cpu(d):
     trans['x86-64'] = "x86-64"
     trans['i686'] = "i686"
     trans['i586'] = "i586"
-    trans['powerpc'] = "powerpc"
+    trans['powerpc'] = "7400"
     trans['mips64'] = "mips64"
     trans['mips64el'] = "mips64"
     trans['riscv64'] = "generic-rv64"
-- 
2.17.1

