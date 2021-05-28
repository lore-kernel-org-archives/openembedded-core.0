Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web12.10064.1622217202386487933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 08:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k2EBALk8;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id g11so3735341ilq.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 08:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d7B6fQbuVDDt8CMYtDgIclnQanGfSSTluca8SKK0Yu8=;
        b=k2EBALk8+0jnPnX4xw1rigySD8T1YLKWl0W0fZQXWFYnDM9B54RWpR9BJAgFc+Fmnw
         k7l9c75RCzKySn9roWS9AhMzbX3zVpDQCUXSS/DZQbDpJ2L9qNnCnqt+kIo6Lcz2pIN9
         n9VtBwHvis0fzCAdQE4uOSkVM6Ufe4obgiRr4/M6KHHax3DZWIrM9VyINo+DAvWcSSRq
         keElMGBCZrgAGZJQ4cQyhRNBlL4/RMXdi0tKkIvsIlQmeELjcq3XwHgGEvX7tllseN18
         C38g0ju11LkkxNCptmswvbDpZBV7FvjKkRdoOM0S30fH2PNUlyAlyO3Cw3WiL4Mdh0VM
         3YTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d7B6fQbuVDDt8CMYtDgIclnQanGfSSTluca8SKK0Yu8=;
        b=b0F9yVeEFC7xLTBP3Xt4DE15Rz7TswRe+zVSwkpvD53Xo1fromLdPikGA5FBCNFLGa
         Vvg6Thks25Yvim4r/U9klDKjmX+RRUP9gMHu9+rhlPy7sCa7gbpW9utU4E+YRLW4sp04
         x2PCUFwxapswFjZI6hHAlROGxvgKFCpjG5ZkYPiw8lsTc7CDpU/Hk3XjXEUi3HckWhzK
         7TaSm8cXdi+wpZw5WYNmgSptOeAA3WjMuCmTIkcujNuDpeDX0wQmDeZrjrHlUfSpHKQD
         K2zWTU5htbzSeMDhtADXW0InuE4FD98bmT/atcn/rpVSHYzPOu0+vFxq/yNgvwf2eM07
         2Llg==
X-Gm-Message-State: AOAM531UfWwK9RCljeLEBpXIQsHlC66n8zpfOiocMHYzMu8+GaSwe5t7
	nbwPgm3ODNmP30NrHzeGij+kt54oMdMQOcVc
X-Google-Smtp-Source: ABdhPJwY8I5pXA0i9FRMVnrwFV5B7zU9AnVbI/r0jfjrpvASXojGNDStjnfjtMjS6CKb4K9yAlw0WQ==
X-Received: by 2002:a05:6e02:156d:: with SMTP id k13mr7708648ilu.149.1622217201374;
        Fri, 28 May 2021 08:53:21 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id z8sm3367965ilq.30.2021.05.28.08.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 08:53:20 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v6 3/5] rust.inc : Changed target cpu for powerpc to "7400"
Date: Fri, 28 May 2021 08:53:06 -0700
Message-Id: <20210528155308.354567-3-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210528155308.354567-1-vinay.m.engg@gmail.com>
References: <CANNYZj_RNDuTY2+dMuQBAByh_01Yj7_nWwwv2iO_sU-r+qvw_Q@mail.gmail.com>
 <20210528155308.354567-1-vinay.m.engg@gmail.com>

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

