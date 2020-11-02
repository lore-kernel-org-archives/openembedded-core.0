Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.1150.1604335772261165611
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gkfwwt/Q;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id a15so6208387edy.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I/a9J3oJlp7ZeLt0K5IiP7UnyAsQWJz/rRYtMKnO1yM=;
        b=Gkfwwt/QMS7t3WpbZ0Qg3mtOdW0ktMxxbJtijPXuaV3ioXwrXAY4lGTo34D/TqS9ga
         HFJDlpeifnmRIUrJwS/eN2tJXy7LWNAYrD3R81pGVxd/JKCb6cAxiWG+88NaA3J5onJN
         M/PpL+x2AnlbHcHcDC1PL+N4W6cWdwGWvB7g+vabhvzNE2IU4uxQ0BisqJ/FovyNTB3q
         8irAyN/FH1alwUUD7ckpB7/hmOKFQ7lVkCESjMq0BBLXLADGGSeViK+W1vysA1TjvLYC
         obaNTgobo2qrosTGEosP4Zw69uiZO6lFFrva7ITqBB2/kZx0PqmooAY9CsYaA9d4XVTO
         6V6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I/a9J3oJlp7ZeLt0K5IiP7UnyAsQWJz/rRYtMKnO1yM=;
        b=J8rjrnDjyLWpEEyu6Ut2lO6tKfW/Swx3CpGX31wuMYot3pPs61RNzDbXheax9GBKTy
         PIwprOCHoapDa/xpWsq3L64EmHfQQopyzj0Wc1QRf2Y+GMDNuqW1Reb0L3ZCfnm2WqWO
         LeLx4iTV07xjkBDGNBiL3JNm+4Tvkqdk1WhL2Yw8XaUotSaxF9n9HpNO7CnOhM35eN8+
         Y+8KMf1kMwjOBkixZmUbrb7X7sBzWjuaZJmPydblvOkVprIF0GWXp1xe1KIv4mmtJhV/
         UikHoiikioOfqveia4lG+ic485UdfBi5Qom2HSWNSur+zHkW2BqDKDGSdupFPLILLdTy
         ROGA==
X-Gm-Message-State: AOAM533Q06mYGk+oHrVCbl3wUIvFo/sMftIny4Yl19evwByzSLAddkat
	Kepixthd+PmfLLuR5PSXg4cjZY7kMfiLgA==
X-Google-Smtp-Source: ABdhPJzOEZMdfePCQ3yL0w0kUwN2Ilio5SEHA/Hu7ouAS45yUbbS3C0j7hjmi8/XzI+RGvUfOAQgNA==
X-Received: by 2002:aa7:c955:: with SMTP id h21mr17780367edt.315.1604335770584;
        Mon, 02 Nov 2020 08:49:30 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:30 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/80] createrepo-c: upgrade 0.16.0 -> 0.16.1
Date: Mon,  2 Nov 2020 17:48:02 +0100
Message-Id: <20201102164907.27572-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{createrepo-c_0.16.0.bb => createrepo-c_0.16.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.16.0.bb => createrepo-c_0.16.1.bb} (95%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb
similarity index 95%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.16.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb
index c6d8963072..942741023f 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "bac48ace91c51abe37792415e75452bbabd44d93"
+SRCREV = "634141eaefe0cc87466dfb91b07b64facce4384b"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.0

