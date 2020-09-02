Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.957.1599081247323892983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NPdasjuf;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id m22so661787eje.10
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ma+Bq/IioUyrlvXro9P4Qpl2RYw7x13ir8e5nSRHFXc=;
        b=NPdasjufgKnxHd4gKxzn6diUcCopg0EQ3XSaY2IdHE5k9yOyEt36k0nu9vHW5kPZwQ
         /NMUNjsYbJG1WCsmOyZxv6jzevvIiLasZ3yDKF6UG3XVmHCLZ+WCmCS8sKHiWjbKhXbX
         JnvIscz5cMaLK6MXhk1BDGUQtF5ySGOPT75CRZ4J1cRts+mQS1Y1LucQonKgdmPKKdib
         h/cGIj+DeXW+4qidREmFRjaYbB6+/Tk4sCfmxGoXi5TUpOm4wh3GLI3MBr7Ocppe4QIC
         ktqe6a++/N3HG+5LX5SO2oz451kTwPFX2z485ElepQdaxJoAIk1Z4cq8+vSD/bHye5xk
         hJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ma+Bq/IioUyrlvXro9P4Qpl2RYw7x13ir8e5nSRHFXc=;
        b=MBLrBCBz0GDGNN+5f1PH11/PU/0N0pBpyJ56OoiJ8yPpwFl8Dx1SLF6VGg9oAnOINc
         lB03DUgCc6L745ebCe7Hqq2FJZvFw2xC8mLtegsbzoMhBZtVzTwmeWYe6LZ5cjjkZXQS
         xtus2OcbySQ2ib8LrT6dxObe8wmVvWiI/Zzbw7E5kru++rHH6IPe3GHOa6B/4yG5tgrt
         P7e6YRFqrI9XaWvhgI30qis2TJu3TWulQIOzKD1FFaXrXpnhhUT+wImtKzo6Inkg/vRg
         ZgCnxjcAgZMJdgA7FMGmoUeNKuL3ZCgyNfD+hbCVqdHinKlvONBhcsgP7NN4V8D+yg+r
         cbjQ==
X-Gm-Message-State: AOAM531LBswk/oQZwPAPTVbTJJTSD9XSOeZSzgVG991abMaDWIBzu22W
	+FHLqLf+HDQCGRiM4bJ0VgyXypQ0WY4=
X-Google-Smtp-Source: ABdhPJy/TNlvxVqQEIkMo+IAscfrBYR/KwfIuyeV4VyFrnqFD9o4ZdUaxWLX0aEN67wpDqySagWlKA==
X-Received: by 2002:a17:906:924d:: with SMTP id c13mr48886ejx.518.1599081245514;
        Wed, 02 Sep 2020 14:14:05 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:05 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/23] ninja: upgrade 1.10.0 -> 1.10.1
Date: Wed,  2 Sep 2020 23:13:18 +0200
Message-Id: <20200902211330.4853-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-devtools/ninja/{ninja_1.10.0.bb => ninja_1.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ninja/{ninja_1.10.0.bb => ninja_1.10.1.bb} (92%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.10.0.bb b/meta/recipes-devtools/ninja/ninja_1.10.1.bb
similarity index 92%
rename from meta/recipes-devtools/ninja/ninja_1.10.0.bb
rename to meta/recipes-devtools/ninja/ninja_1.10.1.bb
index bdc6365052..eefac4166a 100644
--- a/meta/recipes-devtools/ninja/ninja_1.10.0.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.10.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "ed7f67040b370189d989adbd60ff8ea29957231f"
+SRCREV = "a1f879b29c9aafe6a2bc0ba885701f8f4f19f772"
 
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.28.0

