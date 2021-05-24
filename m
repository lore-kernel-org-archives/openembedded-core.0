Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web12.26350.1621876576567715717
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 10:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l/GBVNli;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id b25so10243273iot.5
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d7B6fQbuVDDt8CMYtDgIclnQanGfSSTluca8SKK0Yu8=;
        b=l/GBVNli3gfz8RaLZ7iagBL3WtvKyyHdtSUERX7dOStQQqslVUGSK5J7r2D+DXdY3j
         5XcP8hQ8IF6IViQaNTCKAUMZ1O7Wz1SvPSI56SotRWcqjG0dl+6Hc5x4wvbJ/4200qcG
         tdAVU9dPP6QXGtoipx74pUBLvAo6F7/nFgK5l6A1Cjx4ouQI4SW96AvsGDm3BFfb9JVz
         jnLwSdAeDryzuQ1NN8CGC+OnRMuCM0gGAj1zJTu/M1S5r3mRYhupBavJ2T+oN9nG1A5N
         9WrAJZVLY5MxeiHkeZInl+W3wOwPH+f+GJeQFhTwpApKq3ibNMYT5N05ziasw2igUQ6N
         05qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d7B6fQbuVDDt8CMYtDgIclnQanGfSSTluca8SKK0Yu8=;
        b=F+OgGCIymjUPAQHx/Tkbngbx7yatsyLSPFV6VceQ0a5lkZN7qPBPz6XJIpn3rfME4J
         PAuaqMFbl72RhPcLxplcrRUGw+tsxbpzM58Dt6efsCXW/QdhSQzZbhFmQ6LJqKg4PHNP
         2++Wm6tXdY3X5Si7TDusGLY0rFT1Xxn25WeP+C5FV81qorqdb+KEbS3KRWdQYyUjvzYG
         70eUHuYUNWdeP7LGljtr5s4GLVEKzKX1IxQAeA7SYlxuVcCcJA4jt26f2qQneuRbN6zq
         mxKw+creS9ptSMRwyjbPPQo6yuUDVWKGTghH08lG2wuqjEL9SwwoczuTv++aZbIlE9TV
         WTLA==
X-Gm-Message-State: AOAM5303OrTAsamkFAAs47SOz77eTeMPmIx9BLoj+9lpYc7irFmCxd/O
	vI0N8ZVlfChWKXXnciqMV53DcBM6cNyeW60s
X-Google-Smtp-Source: ABdhPJxwXJy7B/IddEiXSpLOFgfcsYwfGMBy/iDwLRAOwhZwq+WQIJ9j0fQ7w/7llZg4sfJ8zmSyNQ==
X-Received: by 2002:a05:6638:13c4:: with SMTP id i4mr25812342jaj.37.1621876575624;
        Mon, 24 May 2021 10:16:15 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id j2sm11424103ioj.20.2021.05.24.10.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 10:16:15 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v4 3/5] rust.inc : Changed target cpu for powerpc to "7400"
Date: Mon, 24 May 2021 10:15:57 -0700
Message-Id: <20210524171559.190239-3-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210524171559.190239-1-vinay.m.engg@gmail.com>
References: <CANNYZj-v-hcO19SSkYgYKSeOBj7f1u4zvSRkfcx5UAm=ndye_A@mail.gmail.com>
 <20210524171559.190239-1-vinay.m.engg@gmail.com>

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

