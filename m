Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.25223.1591602521363074652
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KWw8UTNJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id mb16so17165328ejb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1DPiYYhn3IJwuZRxhY5Buh17IlFvYd+S7UyeuEt0TdA=;
        b=KWw8UTNJ+egJi1RkgHRD/BzSLgMrON+quK09sN7n4ccX+7rp6Wpy9PrUAt394vCvKU
         kdFNZmdJ1ky/mup1t2vynzbjhuv0hgTx+gDUH2bYlItw93Kn2Kgx5Kgfz+eh37q06XuK
         dLHThb7s7x6jZLzNavikiV281c1YwfCmW+NNT2QGBDyetD+vtKbnt1ZgNTvdR5Py5ehH
         3P03y8m4FU7ss3qObSjTkcsaIDeG2JZZEPhgYzO4ef0GAYKG/EgRpJUDFkFxGwO7dloM
         jW2wD7g+LQeex33lbVWZebla3eyUBRnEShOUXx5NutekvIwmYI/+bIav4SHMzLiF0x0l
         FxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1DPiYYhn3IJwuZRxhY5Buh17IlFvYd+S7UyeuEt0TdA=;
        b=SBekMUet9YX2at5xDGH3cWbJPTPrKbQc7qsZEw/px8mEhxuFcEXuNkXU8yUDQN0Da6
         CSGNCc6MukUtB0WpQmXZSjYoil3XjpLmFGRKmaT91zF6jaDVxVRRot0j3/nq6Ezgl0Qs
         lvNjObDjJ+1JDG69CVaCuv5mRxkC/81C+MveA+Wqo5Aq3uWhCFSF2ZXyNXeWZLQuzZoO
         0CgOdsNBATbgkp9IlM4BuGrgIHSSDk+F4B+IwypUP4AeIgLU950lLSwB2Ti7YACmhxRf
         2i6eg8vkScCbg8lmbcl3fQkJ6O1ITbxOZJVUIPt2s5eBFLrKwLDK/NCvAmBJBM/ZYfmG
         SHYQ==
X-Gm-Message-State: AOAM533K6dthm7Z94pUcyMOhH6uBqOGL4KhmzIJlgD4nr6bQAyGGBf49
	kRYleMJ+QntnoaS5NZ6oLMaxy1LlFUM=
X-Google-Smtp-Source: ABdhPJxDQnJsuMbwODhrqr2HhydyIWX1MBTkD5tDPXk/Ey93o83C3wMTQcW/eFFJDwOz6y55650g+g==
X-Received: by 2002:a17:906:e2d5:: with SMTP id gr21mr19038457ejb.219.1591602519672;
        Mon, 08 Jun 2020 00:48:39 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:39 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 30/42] git: upgrade 2.26.2 -> 2.27.0
Date: Mon,  8 Jun 2020 09:46:47 +0200
Message-Id: <20200608074659.7051-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/git/{git_2.26.2.bb => git_2.27.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_2.26.2.bb => git_2.27.0.bb} (51%)

diff --git a/meta/recipes-devtools/git/git_2.26.2.bb b/meta/recipes-devtools/git/git_2.27.0.bb
similarity index 51%
rename from meta/recipes-devtools/git/git_2.26.2.bb
rename to meta/recipes-devtools/git/git_2.27.0.bb
index ae7aa267bf..8022659ad7 100644
--- a/meta/recipes-devtools/git/git_2.26.2.bb
+++ b/meta/recipes-devtools/git/git_2.27.0.bb
@@ -5,6 +5,6 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "e1c17777528f55696815ef33587b1d20f5eec246669f3b839d15dbfffad9c121"
-SRC_URI[manpages.sha256sum] = "b3c6cfc980f3c593d0cd0c63e0c97d6f1cafe7b72321fc3a94948758b9529c5b"
+SRC_URI[tarball.sha256sum] = "77ded85cbe42b1ffdc2578b460a1ef5d23bcbc6683eabcafbb0d394dffe2e787"
+SRC_URI[manpages.sha256sum] = "414e4b17133e54d846f6bfa2479f9757c50e16c013eb76167a492ae5409b8947"
 
-- 
2.26.2

