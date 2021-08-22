Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.9590.1629636696851860802
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AO+oj8xh;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso12132427wmc.5
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kiI9Ta1DR4GBySOT6M9dcz5YZBs9NdAGcSxwAUGP26Y=;
        b=AO+oj8xhIXSOuxPEgfHh4KqlkbjktRi6u+lDQWn5hdJog9uxOZ6cRyrtMrnsfacdnq
         v9exSxKYKj/lzcPfmJZLu4NXhBW79H5g9QVQJc0ovF3mMndCt6lO4d/QJPFbv5TLUyFk
         9/HHbJZhggRTS0oRmHkE8JjOkXmD3pT55513jpI0wvuamK6NsQFSluJaiZOZdw9GsEk+
         2oSoaa5LZInAPCgGAUkyq2E/DF1dViHLHcazdU8piQ1T4tVvlZgPJKZ1Y7jCF1fL34X7
         JFwMZG7OwRNjmSE+Ypo1YTeHB/J9hootOFO75huyz1YfHQbXG419NZAS3a22N2F/VAzt
         kAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kiI9Ta1DR4GBySOT6M9dcz5YZBs9NdAGcSxwAUGP26Y=;
        b=lW7iMNWvIjX4/GP9GjNXkxvcjmV7AQ0AwE4WTIdIh0TVJR1iKmWVMZdqilj9DyK7oJ
         DSsLt9+0386su28k4VmxQSGtwbdf39OpWsCWAUsRysbroGKTA1TfShFaGs8OGaCBRQ1w
         qyfsLIXWNIQxTpLUAK5SVSo3PKeNJ+cNipf46wGfPl5noT1y0U0QxT/h075T0MeKCtad
         b/OGdMJB/IouWMLfrPdwzpTOm0GJHTihynU054phIwNXJadusO68cgzns/kacYTAc0FB
         YUABxtZLcSITQmKlIEC+ctviIMw3zX6RdyBDhGBs1+mdtY4ryo7ewA62BAnFCw4EiZWC
         OFMw==
X-Gm-Message-State: AOAM531mEQb5eM+jsldtxxH9g5P3whkGi+cQxzEN+GXZd9lDZf0aqhHx
	dofQzJdFYUSrfEu9UhM/NCLbmsPMFxruvg==
X-Google-Smtp-Source: ABdhPJwBLU6JXpSPQVpzoOXy724S/XKnp8P1WSSL+HzZp5v2LmhSFBnVQuHgXKpfJKrgi4G2w7cN1g==
X-Received: by 2002:a05:600c:19d1:: with SMTP id u17mr9769795wmq.21.1629636695547;
        Sun, 22 Aug 2021 05:51:35 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:35 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 36/55] epiphany: upgrade 40.2 -> 40.3
Date: Sun, 22 Aug 2021 14:50:44 +0200
Message-Id: <20210822125103.310416-36-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../epiphany/{epiphany_40.2.bb => epiphany_40.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_40.2.bb => epiphany_40.3.bb} (93%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_40.2.bb b/meta/recipes-gnome/epiphany/epiphany_40.3.bb
similarity index 93%
rename from meta/recipes-gnome/epiphany/epiphany_40.2.bb
rename to meta/recipes-gnome/epiphany/epiphany_40.3.bb
index a7ce16259a..c5dc0baefa 100644
--- a/meta/recipes-gnome/epiphany/epiphany_40.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_40.3.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "75119e22065657cf70ef2b603d4f73835573bd034f1e618c0f662478fd6c6835"
+SRC_URI[archive.sha256sum] = "dad138b9f2d55de271128fca38b61f53fd980c587d29e1ba6b508fff3b19f564"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.31.1

