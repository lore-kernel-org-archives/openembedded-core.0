Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.26070.1588523193832578775
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 09:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rE4l3oBx;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id u127so6034466wmg.1
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 09:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kR0lBFMYlXv6uxBopZJ4/htJy5N6Uc8Zys6757OsU/Y=;
        b=rE4l3oBxFJ8rnwLxdXLfPSW+3RUhit7CC+aseEr555Y44pxuLJ53CvxXRrsE8OLZUW
         W59tac0pJ9VocbW3AESfsTZ7euSO7UnUyc4d2vjmpLSCEMc3+NH5eREaty7IdDMP+W69
         Eg7sywPHybMNHILz2Tn+o1QSdYi4u7MNdUaHPEegjsuHffnXB/T4xWSVZt01N3bzaypd
         GUvSRhSVNr5Nl/Jltf5wu5vKF5Pg9Fy19boEjE5V91pTdexcPi+pzEb6ZYTK5+3RmG8A
         XsFe7esDrLdNPGZm+IEHAOPFBAJoKVm/b2S6lvDes9sgzHsO18tPd4xZ3WAFVSDLPW6x
         T8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kR0lBFMYlXv6uxBopZJ4/htJy5N6Uc8Zys6757OsU/Y=;
        b=SdNadlW3uuW9fI5M3PI+KJ86poSdYsWARF+g7/ow6fSI2Gh71yGS/tzvt3qM3bbSZl
         gxN5QwJx6A4VFCz1bg8urFNCebhA9Dqb+XKQlS/O48Rb6DJAXR1ZbExF5cFnF3xHQXX1
         kv2mqIS70+2AMxccgXsNEOuHr61OE9a3GA00IHwR2t3GXFpxNnfaTcYFjAmnB9AmqSrm
         NWH8wK1/Q0kYzY7gIHuEgmvkEtwf2mO7lCkqg+JCkyxSGP8kZw9PN+SeyhqcWg+RGFiX
         wSihY79cx+KOx1vn36funLpNtfkBgPE++kcHOZTh3FZdERpOfVcdkbNrsdVgNoOAAsJQ
         Jxgw==
X-Gm-Message-State: AGi0PuYkzgiXZIWdAANfY6PAGEq44hZ9cXKmuwgYt2wj+AtV9TzTe+4O
	DA+4TPf7B5VxKgFp62QS12DE6RTm
X-Google-Smtp-Source: APiQypJemvBnoTVPgA1Pxuf1tf0qJFnKVzD7+4jh+NJTL50pXbRtinJjZEIPW2qZ6pa1VbnC5Y+74A==
X-Received: by 2002:a1c:4985:: with SMTP id w127mr10008155wma.100.1588523192029;
        Sun, 03 May 2020 09:26:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id q18sm9079532wmj.11.2020.05.03.09.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 09:26:31 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/17] glib-networking: update to 2.64.2
Date: Sun,  3 May 2020 18:25:46 +0200
Message-Id: <20200503162559.946-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200503162559.946-1-alex.kanavin@gmail.com>
References: <20200503162559.946-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{glib-networking_2.62.3.bb => glib-networking_2.64.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.62.3.bb => glib-networking_2.64.2.bb} (88%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.62.3.bb b/meta/recipes-core/glib-networking/glib-networking_2.64.2.bb
similarity index 88%
rename from meta/recipes-core/glib-networking/glib-networking_2.62.3.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.64.2.bb
index e9596ce1a4..8300d20e0c 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.62.3.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.64.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "a758ca62bd54982a798b39c744cbf783"
-SRC_URI[archive.sha256sum] = "8ca1f86f23a76b5c7640624f7d5490705c78e81375e1741c9a1c41ce7f8f7ff7"
+SRC_URI[archive.md5sum] = "7f8c7ffe2616be4ef4232f2574353dab"
+SRC_URI[archive.sha256sum] = "45def0715c551f9b0b41a4e4f730ac95f3d5d4f3de8162260fbf9421cff695a7"
 
 PACKAGECONFIG ??= "gnutls"
 
-- 
2.26.1

