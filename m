Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.9822.1620227938626918376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I+cFzwU2;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a4so3487726ejk.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dYtYlzLiEMz3AXqUv/ppRaboU72SfTIRdyV0BvdOKTo=;
        b=I+cFzwU2lW/dh5EnOGFGB+lQsqBt7HEWoEhAE3biBGf4/WDCdZriEfZsnXMW6Q/yY6
         gQi/lVzKaszCad8lJPtUVM/cbz8zGiSa4V7J3B6OMzzjqv1XVLo6JaPtn6d/95ykbkM5
         RPi6lhli+LnMZG1oUqP83fiC4We0KKFQlNMsXdoVzwv/c+Wp2BtkGR6AlJGT3xEgeuNn
         HqqXmd1hUopQDkuPD/aMjBzaLIDiMTWd+iPRQIPXFedNvaBigw82aXN143VbjFWFUUYc
         dnDTwzwcAWl5bY2zE/vb5OlxRtCmc005InPll0Rvgf1WK+mM/9BxT6bO9QoOIcZU+Vd0
         yAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dYtYlzLiEMz3AXqUv/ppRaboU72SfTIRdyV0BvdOKTo=;
        b=URgJALttiMvo4fmN1/ejFmMO0q5LU5GAUW50AYilNl7QttgpLponEZI9ir7XNJonEn
         lIdPdkoUJjN65aLzlzhkXfGUbMKJMQKaepQVoFrJupsrwkWlC/5BhgPdM7sZr5nr8wEF
         0kaUgNTK+WxIhXGDl755I1LUnrvPhvxuiuHPGaK8b5J5Da3Zx0iS/mt9T37FhN/ZREd6
         Fhl0YF3Tj9xte8M3kvFSkaz7HXwgbSK6yNeiKMQND5ZhjKZeu6lkfMrr8VZi5bHGGa0Q
         HQO5T0nwihTiKQM7TsOFbriSnmqbIMQQPFUZ0p5Bif4hC8NK//ySbpbiGEU3hu4S8X+8
         RcWQ==
X-Gm-Message-State: AOAM532vcYMuC+nDDm1p0EgbhmroTqpLgscW3vJwjLHD3VUQs5tioQ8s
	bZqQRS98YKNaF28mWFb68FwgX38vG7mfjw==
X-Google-Smtp-Source: ABdhPJy5coZTWpHVOQW9aCzR2nWsAA1oPlSu9knjN8G4/Reg4x+GFeMUfYT6kGAQD4lJcXdOyvMqxQ==
X-Received: by 2002:a17:906:90cf:: with SMTP id v15mr28135589ejw.432.1620227937273;
        Wed, 05 May 2021 08:18:57 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:18:56 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/61] go: correct upstream version check
Date: Wed,  5 May 2021 17:17:51 +0200
Message-Id: <20210505151850.660512-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/go/go-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index c368b95b69..ad77caeea4 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -17,6 +17,7 @@ inherit goarch
 SRC_URI = "https://dl.google.com/go/go${PV}.src.tar.gz;name=main"
 S = "${WORKDIR}/go"
 B = "${S}"
+UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
 
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
2.31.1

