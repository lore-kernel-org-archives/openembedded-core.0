Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.19473.1608974899194560601
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fC3Ssvoy;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id ce23so8296283ejb.8
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n8ANH3VNzJ6spOYEoxjaLTaGkrPvAAm9anG1z4wgPuU=;
        b=fC3Ssvoyuvwz9TQeaF/ntA3pFSuF7C9GP+f3Ts+v7nUfL7sORndao8N1rcqYhUwJQj
         8oKe1o1uU8OD7H9HPeVJ3ulc1MLnCTan4zTCqrCQDyXuVzzAiphg8Al3Fg+AJabIaNKf
         kgHdMBGIvhKuJq5g+P1bni+F/8ynZMZ8hF9PzbFufVAe198oMLSlkgKPkGE80PPKWjim
         4VJAZIG4Ffg0Lq3HN2xuubu6sl5UMWikhxUGznU2oDRSaiGZOy5FEqVNVCQRmQivOsWm
         5VULuL+CLLgYYvuxQdysJDIfWimxaX1vu1Az9ru21uoGpljhyOCFm3CtrtfXY+o2RQmv
         aHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n8ANH3VNzJ6spOYEoxjaLTaGkrPvAAm9anG1z4wgPuU=;
        b=gpWcFXvQdfmbLOhWFHhEnEfWSUmPrySCcvOreGSEW1QoduW4qtEEIC+lVQmLAAfDam
         pCIVB7N/6TJFm6LuANDX22YN3+MqVBWcvIEhC51XSJdJLxzkcqE7DBBsTWeecXS9P2Ek
         zfkBQm1Ij6WN1vSzwvu1SpGZqMEL596mUKeTvz8NHDAAO2VCrPzQLiJjgtWy7ax3Kmye
         VyJcmHmPpZ4EfxU9/m2R4EBEfHatBmDH4JzrMQP3+UzBfXHgP2xws0QZvY739mX7dcOf
         Sph1Nby7mmszykqUE924+GleRElwQdsbZTlT6emfYw3gq6zX50htTJFerVp52/+i4YRx
         TFow==
X-Gm-Message-State: AOAM533z//Xl7oGLh2iefJfJH2ft8hJ6cUB22zM195DcyZJkExksDj2K
	Z7pHRuYg3hugWdDa8KCLiivIav9ZTls=
X-Google-Smtp-Source: ABdhPJyuoJFJcj3LSG+LaiBjoCoAHiWcubzf7DTvGcaGLZz/2skI3EIJdHmB3c6EE3HwpLk5IyTYrQ==
X-Received: by 2002:a17:906:c289:: with SMTP id r9mr33106725ejz.311.1608974897870;
        Sat, 26 Dec 2020 01:28:17 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:17 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 45/48] vulkan-tools: upgrade 1.2.154.0 -> 1.2.162.0
Date: Sat, 26 Dec 2020 10:27:29 +0100
Message-Id: <20201226092732.52323-45-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{vulkan-tools_1.2.154.0.bb => vulkan-tools_1.2.162.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.2.154.0.bb => vulkan-tools_1.2.162.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb
index 0fc3494eea..972859c934 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb
@@ -5,8 +5,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.154"
-SRCREV = "10d757bb1072416ddfbe4c24b43d4cd2f808a5c7"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.162"
+SRCREV = "9e9d7c24ed8b321815f77f31c100bbf9462193b4"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

