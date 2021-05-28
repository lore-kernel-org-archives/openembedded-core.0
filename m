Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web12.10298.1622218159294823109
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 09:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CS6EbSw3;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id z1so3813364ils.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 09:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d7B6fQbuVDDt8CMYtDgIclnQanGfSSTluca8SKK0Yu8=;
        b=CS6EbSw3krFG/7c/ZqoQEuheOwNVpN/Ww51oyrSwoC7HlJ96noe81xp6YMddZ6TxHO
         tDeqBt2a1Zpv9BJ4TL5WImhQ/vBKXUObL4+CM6slTpniLkTvOJOv+my0lU9fydydpSNx
         plGmIl/2N6ale7zdqLxGfPh5ZUXw+vdgtiC+IyaI+hdDpjHYT7PlK4L0L+V00XzyOcO2
         IpHMOag1mWMz+j98nQeiT0oRI9zLL6q1dKDHER0fIO+bYd1PaEWZZ1scIgVsTqZilEgh
         F0MeYQbKjGOWPszd2uoiOOewun4JW1WZ8AanJceLNNALZ+rTx7ZyEUB0jdxuqXypMMg/
         6vWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d7B6fQbuVDDt8CMYtDgIclnQanGfSSTluca8SKK0Yu8=;
        b=BcVcoSDlOwQ8I7EaegLtSKCTuSGJ57GeiXhSrHVbfvRyHmBcaNkN7xWdA9kQ39jPje
         4DuAgImtcjNHC7SXiHWRWprguR45VPmccbs6VCg5l3RPrChjECblej0mn8CK7QmVXk+q
         SU5M+IOZSiPWtln32I0oMJchfsrEBnl2oaWh9wwvctyoMA2c1/XFOdGu5w7ZZXYV9cYH
         dzy0UogH2CqATS8vK6saimfuW9Nt5XhftA4ReO4RWt6O393vqmL7oH+P2YxeDJtad6gu
         xd1KVfGm2kvZOk16Mjh4fXmNETKQaSinKNDVAprtTfLBPj659rF/unSqVKROHptyAoZw
         S7gg==
X-Gm-Message-State: AOAM5316PE5tD/5fjoJ0NkYq2WR5Fb8lCf+ZjMWwjoZsC8wAM9t1KpzY
	tagoqpIeSKkEf25MenXHY6RokLsXi2VKkOdv
X-Google-Smtp-Source: ABdhPJxhye3PIwlSxO5TSRwFSY4J8UkvP84Q+sXSBJphC3D8r7NqA1gBT45k/HVtxhFM7VWf3YB1Gg==
X-Received: by 2002:a92:d983:: with SMTP id r3mr7896472iln.262.1622218158352;
        Fri, 28 May 2021 09:09:18 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id l21sm2975022iol.22.2021.05.28.09.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 09:09:17 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v7 3/5] rust.inc : Changed target cpu for powerpc to "7400"
Date: Fri, 28 May 2021 09:09:06 -0700
Message-Id: <20210528160908.394290-3-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210528160908.394290-1-vinay.m.engg@gmail.com>
References: <CANNYZj_RNDuTY2+dMuQBAByh_01Yj7_nWwwv2iO_sU-r+qvw_Q@mail.gmail.com>
 <20210528160908.394290-1-vinay.m.engg@gmail.com>

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

