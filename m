Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.5561.1589858123577073980
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 20:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DV3eoIIo;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id c75so4748945pga.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 20:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PrW6BrqanR7IK8ld5fQpW4bfWj6Tvtui29Mah8wZfoU=;
        b=DV3eoIIoVv83uVg0zRQG5XfFH+kAT6CZr6eMC49qWxGCYQDkcs2yF8HJXX3KG8Xoav
         NQVhkInEHw1rnfaoTJUXD94i5UAFFKzzMzdFfCx+z1hGzvp4McyH8FfarydQVmRsa76A
         QXrJ7eehYZu9gE+l1BFjx1tvmB/6SB+qybhVS9TLEKdjBgdl6xpd5gL7s/IQZ+Vye3TW
         uHvy/8Amxq8llbuDrTtDkp8choPg6ixEhpEvJz02EPgEHxEcrvcsaHDpe3qOwJGFgQiP
         oFejF1WPcqZ7vz2NY2eCbccbY3yjFK6Hxrl0LyjcPJZkCYkIizSdbu+oB5oNMgtR2yXT
         cNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PrW6BrqanR7IK8ld5fQpW4bfWj6Tvtui29Mah8wZfoU=;
        b=eC7LSPkJdGa3mhLeC9XzZQB31fonMrf1Py2aaCgkLS00mfLt8u/giXHrwVaNTY43XI
         77oj3CnRR4Z6yEwi8A3S33pCm0a7WfOQv1JwiF2w5UvPL0NbvLG97JRCUcqENcwg3TdM
         yx4ATWGBCmRkDptG5bSAeRgVKhCGaAvuPmIMt9owcTgetURsnVUfMqLbezeTOji9K+Nm
         TAcMkZcmaocWc561qu+DFXcJ+/c4rb6Dpg4+AdC6JADhNyRLZ5nlyg5jt562cp534Cul
         sL7DoOj588xBqu/TJGMFOend7SZ4CyxicTNQpSaV8WVCrCChhLx7cqfWHma+1MkSJGLv
         DURQ==
X-Gm-Message-State: AOAM531OJkd3bq0SWIdnHu4fRgIINBkoCeLzD3No+dGg23WPABoDkrg4
	qyJSgHtFyeyCw/zk4UXcebwFsGPpzLU=
X-Google-Smtp-Source: ABdhPJzP1G9FjtGzv6gMnvbaFrlJ0LJAmeb2EdODovlIe3MY6NQA+8Hl1yLkCOoSWpFjFCcLAlPUoQ==
X-Received: by 2002:a62:2ad2:: with SMTP id q201mr19729998pfq.323.1589858122799;
        Mon, 18 May 2020 20:15:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id a5sm4545706pfk.210.2020.05.18.20.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 20:15:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] libxcrypt: Upgrade to 4.4.16
Date: Mon, 18 May 2020 20:15:19 -0700
Message-Id: <20200519031519.401004-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519031519.401004-1-raj.khem@gmail.com>
References: <20200519031519.401004-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{libxcrypt-compat_4.4.15.bb => libxcrypt-compat_4.4.16.bb}  | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 .../libxcrypt/{libxcrypt_4.4.15.bb => libxcrypt_4.4.16.bb}      | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.15.bb => libxcrypt-compat_4.4.16.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.15.bb => libxcrypt_4.4.16.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.15.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.16.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.15.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.16.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 2d2a0b03e3..da7607aef3 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM ?= "file://LICENSING;md5=3bb6614cf5880cbf1b9dbd9e3d145e2c \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "823437d015cd4ab4d100ed205f218681b03ae45c"
+SRCREV = "4ffa4d38396c334a1e002427c22281b047a3d6a6"
 SRCBRANCH ?= "develop"
 
 PROVIDES = "virtual/crypt"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.15.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.16.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.15.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.16.bb
-- 
2.26.2

