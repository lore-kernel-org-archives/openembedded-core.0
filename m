Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.6013.1615541523188613701
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 01:32:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JMfkkPRL;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id ox4so36448871ejb.11
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 01:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sn+5pojm4i0K5IEms79AJ+ti8oGIv8cLRHnkimWcH4s=;
        b=JMfkkPRLySFtliwxMqwAre5OAU7J40v+ccNIQ7OQxKZF/fCELnMidhQNfOLJtm2dQM
         f3aq2Ewn454zMtpa69o6/y75e4aVwFXy0QdfLYfPjZc0RHpqRFPedTqQ4gLY+0Qmdxcy
         le0Dn+xsK3AhbGafLusyMXPrv1rYd9vyUQDR9lI4tRo/hKKMWGVHAd1o8ueKztazIi4G
         UycdDBO12kEMGuo3XbBjji4hhQSUPf8emQ7wOf7IFlsLIiu7L2FPT+4NCXI4M9JOOec8
         IqW8x7lKNGrle0C3O1vQ6IBORa9UwdKVKKh30NsO7dEnBIDS2dxkNnab3Fgudc1tOeuh
         Ji6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sn+5pojm4i0K5IEms79AJ+ti8oGIv8cLRHnkimWcH4s=;
        b=jVmfPHST5mg0phgB8N6vaywcTpPtM9OewLP9XhMkbbyLJ3ek7Kv/WYS6Db2LHV/ZNJ
         xSpSgJk8zaOf+6vwSnolK4bvGFqpzX3msvLb2fO7VjxPGnUF4IQLki4l0jsQpsG0Pdvo
         n7SiRaNcsIZL07uv3cR8duNQzV3YYVgQOJ/t0Im8/nyR2c82Amfq5iqsIOSl5Ic1j3WK
         MUD8xuaFzhNWPRuCbCt9IirFb1YuEQcSc7Sbm4KkaN3qYkBcXs5vChHvGttyJkAD3Nri
         dVgdXWSBi6ttv3l6S5pVsyEiAN8lpOqq7Bz+k7MwLSp4nlJke2OfveYJ6Ny+CnFXbl4w
         kxhw==
X-Gm-Message-State: AOAM532pLnBNoH8e2j1IMDvpTodPZuzCNScY1yjIlYHdD/onw/kN4CLD
	AnzW35DBh3R3yxOlcRlk73nDMXzPngtXSQ==
X-Google-Smtp-Source: ABdhPJyOmtBt7avEczPJqKjZiPefLAiXlMuP9uY8GncrmPjVFuW803biwlHUKq4I9xCZwtYuYNAymg==
X-Received: by 2002:a17:906:f296:: with SMTP id gu22mr7449842ejb.20.1615541521757;
        Fri, 12 Mar 2021 01:32:01 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id a9sm2635831edt.82.2021.03.12.01.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 01:32:01 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 7/7] poky.conf: remove wayland/opengl from distro features, as it is now oe-core default
Date: Fri, 12 Mar 2021 10:31:39 +0100
Message-Id: <20210312093139.318889-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312093139.318889-1-alex.kanavin@gmail.com>
References: <20210312093139.318889-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-poky/conf/distro/poky.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index 4e416c0c85..24e046c60a 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -13,7 +13,7 @@ TARGET_VENDOR = "-poky"
 LOCALCONF_VERSION = "1"
 
 # Override these in poky based distros
-POKY_DEFAULT_DISTRO_FEATURES = "largefile opengl ptest multiarch wayland vulkan"
+POKY_DEFAULT_DISTRO_FEATURES = "largefile ptest multiarch vulkan"
 POKY_DEFAULT_EXTRA_RDEPENDS = "packagegroup-core-boot"
 POKY_DEFAULT_EXTRA_RRECOMMENDS = "kernel-module-af-packet"
 
-- 
2.29.2

