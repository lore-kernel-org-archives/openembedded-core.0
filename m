Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.8452.1618836378409606186
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 05:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cx+AJLB0;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id r9so52700531ejj.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 05:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jos64smipTcJZZWUHU4GWxHtDILaagUA/4wvNZxMMNs=;
        b=cx+AJLB02Wes7El+7wWGHlpb784oz6mFn4yMg7WW00unBqMOyx2Dgr9FOmfjCvQhvc
         VXoBNeyiN8uAz8arpRgoCZC3tpYEEIvkRDNBeh9t1iwoHTgFz5kCHJ9gzs0SpUaOTHKL
         u1nCyN6q17cp3UBVJxAGL6WUlfexsZxt6aNwt+ycg7OGCtt74sySJY0wyhmZMgMLoTm0
         kSiyzIvMCKGPMHK+MoG6tIHFt6vvxyP9hwwyfHaSoaJ+R2854knDrhCazwvbrjaKhQvt
         oJOoC7ugaUqExrN29FIb5pAmXl+ywMI+MGo1SxRTOrHZx4Ko3yQdt90SZCBEpjWHuamO
         BpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jos64smipTcJZZWUHU4GWxHtDILaagUA/4wvNZxMMNs=;
        b=f1cjL6r8JYDUE7ZUYI4lN8MPo4oLFXpS3E/sdCLGiYCEYDM3aGmWitLWmIUfNAqK0K
         ppjLb37YhhGnRPJ268O4oPPOd7gC9FXODJoaBrcyFp6ajKEiq3xT8xK2+iN9ASYs/wlc
         OdtG+U6KyTQdwdPEQ16Lng6vJ0ENXm+tMw7fz+bgO6MV+e9uFoMnD6SzfuVnHFG77DuM
         z567kVJnBOFl909JXAFH/7K+cKYwP+wYjTShxZPOkMD5XjtDN/WNEhJ+GZtAwJkYCEB/
         koqUZCmBQhxAITWq7XMbdgG6NMJSeOtPx9xIVL27MFgLwmZzKGjQkcsLHEBTPyevn9t+
         TsUQ==
X-Gm-Message-State: AOAM532Ru1iYfl0rri13dEs72BY1wZ2chtcujt76mxv48jaq59JIVx/O
	xERsVDQ1XVi98N3lCxPfA6zOqhCswW24Gg==
X-Google-Smtp-Source: ABdhPJzR9G1mMxa1KmGAmIvQy83n1W3cpNzgIt6tbofJVpfjDXEBAxZMFOZNaniV424z8uc9eqcIzQ==
X-Received: by 2002:a17:906:7714:: with SMTP id q20mr3178966ejm.167.1618836376836;
        Mon, 19 Apr 2021 05:46:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id jt20sm1444612ejb.79.2021.04.19.05.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 05:46:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] maintainers.inc: add libmicrohttpd entry
Date: Mon, 19 Apr 2021 14:46:04 +0200
Message-Id: <20210419124604.584629-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e1b1afcd7e..9d4e2ea741 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -350,6 +350,7 @@ RECIPE_MAINTAINER_pn-libjitterentropy = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-libksba = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libmatchbox = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-libmd = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-libmicrohttpd = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libmnl = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libmpc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libmodule-build-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
-- 
2.30.2

