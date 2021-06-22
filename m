Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.7597.1624360898420989253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BDvi8kTy;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id hq39so6913423ejc.5
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5/XINCvWnv7HDnms6uauQgnauCgiAnDg6GqOhANpdpY=;
        b=BDvi8kTyvhw2/TBVdZLjsOm1HsL8Te/oSp7RZWxL9v9vYHUXvPvrlZwkGMnRs/A9zB
         EWdWfonTx6BsqSHcwUGGCfIfIDbE7Zm4zKVqJE/hXCt7IYvmbvnuzQxbyd6tzNBE0+Wb
         1hR8OgaX7xore4am9WjQYoTlwm8/mrh6h757rKVyd/fhsbrZotw1iYJCfSNULB1Dlodf
         O0utNXKuzsT0p5GFpR/1UafteYaHsKRP1lWdkeZRpLR3g7l3V2IxNacXyrBado03XKHc
         /c4BtN5qwzzUsoSOxfPqVbdqwgOA41GlCNfQ+eUkrOtReKRfxn5WKUGBozNJR5JD+LQl
         zSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5/XINCvWnv7HDnms6uauQgnauCgiAnDg6GqOhANpdpY=;
        b=EwaK+6yn09ESb/ZOgM39dW8z/7KE/5wTfPxgrEdlsFnWz2sQIqF/qosVrDiiUX08+S
         RKMm7xBqQH2s5HeHgYG+f1h2KRcOqMfVPCqE4VDvRLWv2nKt4SLo25oiaivWF26uuDTO
         IpjiDd7s1UNmGSRKLayrvLLS3M7O/Tb8fapDX9Y+PV8qN7hetA5K2ZybbhgmIWEF8tCB
         m9p3hMT6yFaAilat9zRfWhUu7HEYIlWv4YK0/97HuByI9KIOUi9KfmiMCR44QjmlL2Ze
         UBSvNvJ1Ug8po7+U9AChRSwUfysSFVDqIW4QXPtZHzs07au9K83PbLhRXuPQ46GL4oYg
         ebqQ==
X-Gm-Message-State: AOAM533odI2IZZW5GMtEG/y3883LfgoTEitRMl5OFs3xcGe/idPd2uK2
	Z9D0EN0m0g9lGR6vtrMYYaJHI2fcxb20Eg==
X-Google-Smtp-Source: ABdhPJwP0gW+wODcWg3N1ea12AbwdMFVQQN9UFTwoHmpIHpQCQBkA+FnN4R8hI+3Of7FWmTl0zToig==
X-Received: by 2002:a17:907:7ba3:: with SMTP id ne35mr3351394ejc.12.1624360897067;
        Tue, 22 Jun 2021 04:21:37 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:36 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/19] gdbm: upgrade 1.19 -> 1.20
Date: Tue, 22 Jun 2021 13:21:17 +0200
Message-Id: <20210622112126.2026646-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622112126.2026646-1-alex.kanavin@gmail.com>
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/gdbm/{gdbm_1.19.bb => gdbm_1.20.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/gdbm/{gdbm_1.19.bb => gdbm_1.20.bb} (90%)

diff --git a/meta/recipes-support/gdbm/gdbm_1.19.bb b/meta/recipes-support/gdbm/gdbm_1.20.bb
similarity index 90%
rename from meta/recipes-support/gdbm/gdbm_1.19.bb
rename to meta/recipes-support/gdbm/gdbm_1.20.bb
index cd2617b130..51f9d17e49 100644
--- a/meta/recipes-support/gdbm/gdbm_1.19.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.20.bb
@@ -13,8 +13,7 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
            file://ptest.patch \
           "
 
-SRC_URI[md5sum] = "aeb29c6a90350a4c959cd1df38cd0a7e"
-SRC_URI[sha256sum] = "37ed12214122b972e18a0d94995039e57748191939ef74115b1d41d8811364bc"
+SRC_URI[sha256sum] = "3aeac05648b3482a10a2da986b9f3a380a29ad650be80b9817a435fb8114a292"
 
 inherit autotools gettext texinfo lib_package ptest
 
-- 
2.31.1

