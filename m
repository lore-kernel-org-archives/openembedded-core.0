Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.17072.1621247753065794123
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 03:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pxREnYCN;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id y32so4328880pga.11
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 03:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d7B6fQbuVDDt8CMYtDgIclnQanGfSSTluca8SKK0Yu8=;
        b=pxREnYCNUfgGEdOJ3697AaF/hyFvzk3KCW1I1nmm7PL0li8pyKkgZTPlYCCPfOm/Uf
         mgqo0slI0P85L6yj2zIbSU3idoNnAK1KKiXJLUhCkyu1dxoZpEJv/W3zcMbFf37k6btG
         RzX3z6PlYFUqE5wt1ai1yS5Si4vdK+LN7rbN7chdonIIKJ5lfiC+wq5K8nQdl2hGGtYW
         G/EhVwwc3LA7RH//VAgJjWo/GGG34Lh+KP+hiPA7wKQLyxUePzVD6KiNr5eT2h/mIMV/
         gDW9Z9uuNEGpHioaWVnGBmx9gzha7DNS+RaU2y0gkQ36+BXTuxzr+v3BXSVn1MZp63tZ
         l7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d7B6fQbuVDDt8CMYtDgIclnQanGfSSTluca8SKK0Yu8=;
        b=Tku697I5aDDn0S9mkWEetpWXxXvMB0Q5s3ASBlYPmF7JW2rPrECrOAIM88odJOg2to
         ICZ3MzoG3naMba8DPdMAtI6TmBiLNfxpCCuSJUitKMLxhz6B4uBVdmYDDyvJJK+XAjZk
         rMV3fQg4BSOgJ6aVNMpZSh1QLJDAOAicgYMRpftsYKUxNB2q6ehY8nQf6g65bSALv42O
         AdKV33fQc4mpsqRhEru250qFpkdkccWQj2IjwSNw2kKOSlg8Ip+4vqHsK+/AtKZKiDMM
         OXROpP/VQwjm8KZ52sBlqFf4fzzqy2fo6PzSe6ks4YjqpaeZQw3mwwKvlLv6Sm6H0mak
         /Rzw==
X-Gm-Message-State: AOAM5332GOtJ5f5+i1sqRqP8co/O5CbVYZ+3Tk9DnnvN3YiZtLD+0T9B
	AGQihvjIiHm+IoRxtT771lG5ARmDZaS8iB/K
X-Google-Smtp-Source: ABdhPJy2k0D2F56Om9J/P4kg9o5V6ZL2fY6uYMBCIc5grFUeSj9sE/sh0GCs3vntnXtQqdOKeNdR0Q==
X-Received: by 2002:a63:344c:: with SMTP id b73mr17585685pga.79.1621247752258;
        Mon, 17 May 2021 03:35:52 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id m20sm14903365pjq.40.2021.05.17.03.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 03:35:51 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Cc: kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	alex.kanavin@gmail.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v2 3/7] rust.inc : Changed target cpu for powerpc to "7400"
Date: Mon, 17 May 2021 03:35:24 -0700
Message-Id: <20210517103528.24434-3-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517103528.24434-1-vinay.m.engg@gmail.com>
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com>

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

