Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A21CCA490
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 22:37:04 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23200.1792363020883182897
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 15:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DX+sc8Pj;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e987b4a710so11256595ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 15:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792363020; x=1792967820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XA4Yvp5dnacGYIL5ySdjfBfiVSd9RvQ/yptcAoqJ8ys=;
        b=DX+sc8PjNdM9x3JPA7hL7MfMruxl9ZH3hppv/hqo8OUNDK7mP6u3iJIsTRYckmtFor
         zgEnQ26d+uK67nHcX8nE6j5T+6FOJNndCZIG+cueKQcE1/pDgrnGxB575XB9CFUKmbxR
         QT3kQCm6Sd74rLGRsBGnUVTu7iX3Wm+jEQuZX7OmlVJMnSNh1+OS23fSMdBOdW971uyg
         vuRMCxRj4zHkD65fE8BQMHqIlYHngdXhHDXfUKa9wMiR0izwqsQr1nV0O5bjbmU7EQ2V
         hcUXt+Ntkq1vou3oByEvVJ3q0rxRYb4IEL6w5OKlCSXoExETq/LPxPKkd1ff4/buz0qe
         L94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792363020; x=1792967820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XA4Yvp5dnacGYIL5ySdjfBfiVSd9RvQ/yptcAoqJ8ys=;
        b=p/WMXlpU1TFXSxzZFpacy67KdA3VDk1Ns2wgdOoMKS7yp15RztX8bVXDCWNEiZiuo5
         2FZlMOPgzUZmR74SSJweI2zI5i2td8rlAFhPPU72lCEQ5eiY/AF3gYv+jvXntLejnzrT
         yZJe/HSHAoq7xqIQX+ILbd3YSk+1NjGYhrUs7+51QYxdVGX3qqSuVYUw432H+Z3nogNg
         3CWSUig5wtMoBgqtdcmwc9OhP6Nxu07mq+PP3x/ANPuQXvHTCKgfxa+sJrrCQaGZwmzA
         kLSNUozsHpqrzSqdcx0OqFpURZU0qrt+sIimgBGExtFwzxo41owflu1AFmtk4WRQZ6n6
         Wh7A==
X-Gm-Message-State: AFq9FYLxIVBKVXIfEQD33GL3qVSAz741Nt06RPtCu9giF2e8tFzgAdxc
	C89f4g6usoKsAfzCbalmWoDv8IMKsXW+AJ2cQLIGJiu4k4D1p/iplFhvD6yEhg==
X-Gm-Gg: AYBFou1Viu/RMkOsQ2rky5yAGeMBk2uVk7o0m9jI/3Le7nfCrulhPm+8RVXb9uVEECX
	J8Fwo6MTuK9mIhy6LQeJxXntgkZUet+23la+wmQMR940uVYYjqs0l5atsxFsypnuPW26jbdyPMD
	OSK5Lqw7b1UwH19JUJHI+sh65v97ayaAUvrWdMFWeMZA4fkrkP5VHkRo75fi+mKj+9RRbTet49z
	wM01pfMg2mwBcXMUzyyUqgam7wF8TyknRcgI8oAvoWTjekh8gxSprsEXVDLOizJwxCY5q4dDVw8
	nD8l0VzcvMouvjnTOhTD3C+sJ2Hyxas4xEZZmz4ZcuVI/nbWtq4Dy4sBoDrMxyK8hA8BU/p41zc
	e+ohC1YoBEtPCd7ny/TVDYiu5MwaAdC8XGkFSq9VuzPH2PgNs9cXWvh5FWy0hGSekhdoh4HrJg7
	oNXjHM3Cc2TQCciR5t/wTujbIptl+bsU4tegh/d84js2G4K797WABwbWUKcxXXavyb7uyOaYdh+
	8X98iWKfC+N5YwIKNOPwOboP3cMP3Ka9D+jcbCbMro0MEBfjA==
X-Received: by 2002:a17:90b:48c5:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3acef4e131cmr3647685a91.30.1792363020189;
        Sun, 18 Oct 2026 15:37:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac940055f5sm17875989a91.0.2026.10.18.15.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 15:36:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 5/5] librepo: upgrade 1.21.1 -> 1.21.2
Date: Mon, 19 Oct 2026 11:36:43 +1300
Message-ID: <20261018223644.291257-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018223644.291257-1-ankur.tyagi85@gmail.com>
References: <20261018223644.291257-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 22:37:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248114

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/rpm-software-management/librepo/releases/tag/1.21.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../librepo/{librepo_1.21.1.bb => librepo_1.21.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.21.1.bb => librepo_1.21.2.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.21.1.bb b/meta/recipes-devtools/librepo/librepo_1.21.2.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.21.1.bb
rename to meta/recipes-devtools/librepo/librepo_1.21.2.bb
index 9cefbfd48e..ab60e76b6e 100644
--- a/meta/recipes-devtools/librepo/librepo_1.21.1.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.21.2.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
            "
 
-SRCREV = "86ed082e25bbd1901d21d75924297c7697b33307"
+SRCREV = "f892f216a8f7934f32846712f56a27f997b300a3"
 
 DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 

