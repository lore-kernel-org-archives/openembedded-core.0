Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.4414.1623220617327898307
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dS4B3Do1;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id c10so36629279eja.11
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 23:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=itY+d9fCpPTHsdeuucB7l1hvcdO7cjXtpnPyDsbuI1Q=;
        b=dS4B3Do1gb7mx35OUdg3ua28xp0hYwBAALY8QcTin5O3unxrTkMRYWQLsesIjcetwu
         l+yVi6E+JjI8CxymsaeInfZPzwygoFtCoPYEefOUfjj9RKQhlxfyQHxrL/eqjE4nVLpj
         hWc+RSsCsYNjH/ZpHG3LePMtVuobM15iA4OhheVSvGRYiK4AxZQqjOoRZv73tnnOitgK
         Wk8aZB52NlbBuRWTSI5M6JxAz63KMXxseYCDiq/0IcGQrvO0azGZqyBB1Y0n7aeGTqm6
         3Ap2yy3I5jx+970YHPM6pZ5Zi00DHKDe79YNrc5D6Dc3rAIadzkqJAXVjaxRt4QNwdiM
         1OiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=itY+d9fCpPTHsdeuucB7l1hvcdO7cjXtpnPyDsbuI1Q=;
        b=oQy3D2n46CTBE9wFEZi9TNqX23F+hgn1aiDm/KCW0P/cXyhYxjJzS3O1sMX7ySV+gB
         pSZPG4IUy0IKvNeBFnuEX4IyJ5HpE+sBZFTM0NxkyhRTEl4t1vJg/vE9pfu1NCtKBmZk
         Kv+/+3EbxpedQtBRd8HKHV/MyrPLeL+b5SbbMs8ce861DjtPxn7XgfPA0fVRRl16yXjL
         gwFDVlX/02J14oBLW5BbJXssYUmAel4gqSfmTIk9RU+VdAE12rpT/QmqI3Lx2wf6JGYy
         9Auxebfk7wt75olytVIOOzjV+BapIZIYMu2VCYy510NvGXyUctHDYgyANo5sgOpjQdI4
         Yb3w==
X-Gm-Message-State: AOAM530ZiVrAQ9/N1Zi+g/uCD15ZeFX47YyvNNgTSW2krpumT5Nu9uHD
	iZo6ela1SzlJe/tk43S+5pw5sxJkk/CaSA==
X-Google-Smtp-Source: ABdhPJy934q453qnVlXM366xT0Xpand++TZLxBlgqerXG+9U9ELDdvbwKAgcjXPwe7TivC44V+OLpQ==
X-Received: by 2002:a17:906:22c8:: with SMTP id q8mr26303554eja.12.1623220615212;
        Tue, 08 Jun 2021 23:36:55 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id n2sm717691edi.32.2021.06.08.23.36.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:36:54 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] epiphany: upgrade 40.1 -> 40.2
Date: Wed,  9 Jun 2021 08:36:44 +0200
Message-Id: <20210609063646.3400519-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

40.2 - June 4, 2021
===================

 * Fix some memory leaks (from !958)
 * Fix memory corruption in history dialog (!960)
 * Fix crash when checking for modified forms (!962)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../epiphany/{epiphany_40.1.bb => epiphany_40.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_40.1.bb => epiphany_40.2.bb} (93%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_40.1.bb b/meta/recipes-gnome/epiphany/epiphany_40.2.bb
similarity index 93%
rename from meta/recipes-gnome/epiphany/epiphany_40.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_40.2.bb
index 2242e9d010..abd4ad057c 100644
--- a/meta/recipes-gnome/epiphany/epiphany_40.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_40.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "696a426b1702774af8d0f056828f5d9ff9350507aba7f4c7e3e499f07a581ad0"
+SRC_URI[archive.sha256sum] = "75119e22065657cf70ef2b603d4f73835573bd034f1e618c0f662478fd6c6835"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.31.1

