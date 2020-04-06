Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.133.1586192556582003340
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 10:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=MwdTOUr4;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f45.google.com with SMTP id y20so147135wma.4
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 10:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mVutJQ/eFYS9wLuZ3dGkOTNiiy6kH51Fn2PQkRAMJ8k=;
        b=MwdTOUr4SFBSKohJgPJW8LMynjHPZ4HfmiF0mmAQamRbCQsJ0uAEficWfDLW8mDyU1
         4jr5p2v9Qa1ebTEtNynG8c0fOjq4Vqr+Hb7oYwXKnmPAk/ATeQIY0durQGWjaap2neIK
         CTsae8bxdiVE3JcOD7CbMx1aOFxU99WIYx1oTdqn4XKIBDmWfB1oFKKOs53HzqG6ZdF0
         Ine57SzCzabrONumBTF8LnLUDlfdTb73OFGxaY7wVhMxveQRFnNK6vGJcMqzn2yb5yAq
         RfP1U0geu7HMaQLn+HLc3TvY9B99MiD+XUlkAenNDJWseF1jNiYpo669uOnfh1F36oGj
         9D/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mVutJQ/eFYS9wLuZ3dGkOTNiiy6kH51Fn2PQkRAMJ8k=;
        b=tNy9egNM436d7aJufynDJo56UqsKHneyRGfDOyh9Vj7OArCCUCRra5Ila5JH2iVxsO
         mnSRWL0MP/QjeWsxpIh7BzPUzxB3qBbBMxlm+Loly8cHhkxMobQ8MkJlIiMrs6RwsPZM
         Y5BUOSg/rcQoy7YY+KdQJIu6Y04fvfjBnZ/Ak4dq0HxTlwPPCWEx0I5e1MzzZLu7FqM2
         UScnVhBNIO8kqfYpSy59kKAoWEz4Usm8FO90hOlagYf+GQcsueqBQ2eI1YA3PCSjKVDC
         88RbV/kJd+Cokgnqcy9F0PSNRAOzoq5XYLtgRjmtA7a7jjISmO98+fggWfyOVxkOhvIm
         Zezw==
X-Gm-Message-State: AGi0PubXhhF+hD7nUaPQGsVQM7GF+UPZHuXVMtBUK6LDzwC1YVxqiHgb
	zAuf4FF9tweh1yMf2oo/YFVPPw==
X-Google-Smtp-Source: APiQypKbegjpe1Vo5m2s0v4j9BrnL4sSPVw/NdY5zden+csSpzzP7FEM/nFO7PJ6V1rAsIm/yJj+bQ==
X-Received: by 2002:a1c:bd8b:: with SMTP id n133mr82594wmf.175.1586192555033;
        Mon, 06 Apr 2020 10:02:35 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id u17sm30614386wra.63.2020.04.06.10.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 10:02:34 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster808@gmail.com>,
	Jerome Neanne <jneanne@baylibre.com>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [OE-core][PATCH v2 1/2] qemuboot.bbclass: don't redefine IMGDEPLOYDIR
Date: Mon,  6 Apr 2020 19:02:28 +0200
Message-Id: <20200406170229.25363-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200406170229.25363-1-brgl@bgdev.pl>
References: <20200406170229.25363-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This variable is already defined in image.bbclass and there's not need
to redefine it here.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta/classes/qemuboot.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 54044c38da..68f7a03619 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -83,7 +83,6 @@ QB_DRIVE_TYPE ?= "/dev/sd"
 
 # Create qemuboot.conf
 addtask do_write_qemuboot_conf after do_rootfs before do_image
-IMGDEPLOYDIR ?= "${WORKDIR}/deploy-${PN}-image-complete"
 
 def qemuboot_vars(d):
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
-- 
2.25.0

