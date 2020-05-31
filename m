Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.17609.1590940433741509750
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RuQkQ6zh;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id o15so6834685ejm.12
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8HSj8EkIJwy4T1YKa5bP74ogM5It5kSKh8CVL+cWGO0=;
        b=RuQkQ6zhrL6eQNPcApYa9cAnJPFeszeFB+Xg8T6dNI8pQXR7SsQ48iB2RgCJuK0lIS
         /ZovyqfqBha39dJkFYaQGiYVnU0s7RrkpAvzFMWsz7KjkERhOAL9Ac+vf3/PYeMSuSE6
         ALckV3mjSJh2XiTwxy0+8ZEaLCO6oQr413tYwoe4/hW8C4nuGdaGuA6kfu8Z5DV19+Sj
         wHjSLE8/nNyzB0Xu7LJIbQeel2XtOHKMlR+CxpHosTc/iQgHJB39H3UyKSg3BS5LvSTd
         yYNOvJ1iK0GirJNJBNs+cyBlmGmOqpseujByK7n4XyknwcVLxpqwt76teeq9JfUJECW5
         pgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8HSj8EkIJwy4T1YKa5bP74ogM5It5kSKh8CVL+cWGO0=;
        b=ETe9aihwjfYpQ4soWX1pd8jzsC6fMfDX21A+mubGNTZ8cs4ZFBIyt7P10NDGP2Vkwj
         6aNF9rbRHbYEcyfmgHM9Dnl8N8FAvfDUultWRDxoMLJ3PXTzBg1U8AUh2yRqpEyB+Cyg
         BpgAf3UQCqgsuLLl2CKGUy12EanVVSDX+UND/YYEXEterGRkgC1PFJ0v7C8tFYSTVUcl
         fqc3wRTddoiYRhalvqJ/zNtJ+msoz8nRZElu+P63hdxN4wXnHsnsn7nz0oSWwHbHyopM
         P4svM+T6bnn8FreYOFBlIVwgYw/PggVqurx7XyII6XNFEgrmbN/WWq1M18gNHIabF/+Y
         2fPA==
X-Gm-Message-State: AOAM532o7P4kgcpuehuDhfMxCJ27o2EOGdLr8Kp1TVCIRa+7amEFrQm9
	FxoPmB0uoYMd1/gAd1T8Pi2sIjtu
X-Google-Smtp-Source: ABdhPJzDHoDL3uCM3N9hxiPaEXHlfG3yXCnXD7TNjSkNE2bF2CpMt30iGUU4j5D/kK9fIbmidS8G0Q==
X-Received: by 2002:a17:906:594e:: with SMTP id g14mr6236456ejr.52.1590940432127;
        Sun, 31 May 2020 08:53:52 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:51 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 29/70] cogl-1.0: upgrade 1.22.4 -> 1.22.6
Date: Sun, 31 May 2020 17:52:13 +0200
Message-Id: <20200531155254.10283-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb | 6 ------
 meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb

diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb
deleted file mode 100644
index 8e61c19f5d..0000000000
--- a/meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require cogl-1.0.inc
-
-SRC_URI[archive.md5sum] = "31755015a865c4af51ac84f6e53af8ab"
-SRC_URI[archive.sha256sum] = "5217bf94cbca3df63268a3b79d017725382b9e592b891d1e7dc6212590ce0de0"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb
new file mode 100644
index 0000000000..86bbdbff69
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb
@@ -0,0 +1,6 @@
+require cogl-1.0.inc
+
+SRC_URI[archive.md5sum] = "7bcc01edb5462d4d08d01bf893feddb0"
+SRC_URI[archive.sha256sum] = "6d134bd3e48c067507167c001200b275997fb9c68b08b48ff038211c8c251b75"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
-- 
2.26.2

