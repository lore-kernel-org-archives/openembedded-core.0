Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.6013.1626265586432971726
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eXUmvXRW;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id y21-20020a7bc1950000b02902161fccabf1so3787728wmi.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SGvxLviQkFcOPjhnssqwnPhVLrIjXQEIZ96jWFl8rXU=;
        b=eXUmvXRWvxQS8tsg30IuOj3eQx72BWKL5MGMSaN8OXpMZ1I2aEOrZnNq6HeleW56FZ
         Qcl4IeaZQwtqBjlgVXZhhyXRnNegewCeui+1XpNvcDaYGP70JQqW8/fx/xR/Z2zW2MvW
         ZlUUpFRoIiSSBPpnJCDq2StSSAcMNb+5Ntj/DGn+uaKgzt4/YQPUhYpWNtoP4Jy2rqHZ
         Q/W5XtdrquJcq/wKdShdHmu9vgV/iBN2TZ7XeV/fHdjCTvJjv7rMvw8BCvHgqME7GG+w
         FGqxvQY3Urdj9AzBE+tXoY+PFR1Zz4Z84yBhRq0Awd04DcMeD/4mMzYF+haxLxj71u5d
         EfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SGvxLviQkFcOPjhnssqwnPhVLrIjXQEIZ96jWFl8rXU=;
        b=lltdQ8YwGNdPnvroei3MchfsL8q7ylQ8qZo7xmrcnCe+GhE3VQHJ8XghR1VbXRUVeW
         kCY3svC9zkLSE38KjHx8DPYdDCEA/uueNgCezaAIQ9yIodHH84u3acfeTkjePjAUnc4S
         QUcFUurAQyUzhAsYjFA2ezp4IPxq3fXwGyJmh95nShqMs5PK4pnuCeyt/wEy5HZo4CKb
         4d/QoUWQk2gIFcWCQO73gqldroFRHdFMlW7Za+FSmRsXCtTf+w3SMK8ud7ZDt6MPW1eG
         ZhrzchmrRaRhurYCoB3YkFQ/gnqlFEdy/0fLmIEQRrJC7xYRbLbC8Ssut7JD3l/IEqUL
         PAeg==
X-Gm-Message-State: AOAM530BSmxA9E41wpLu0iGNAOGzCZKNLA99J/9NYtLjlV7bh48Q1BtO
	Sg213Cdk82SmFvsBPeGFIt0UW9so0nY=
X-Google-Smtp-Source: ABdhPJzR/T1FmzqsP7wpeq0id/Vn2FktZaJIopKP3JUvOw//UH/LeKrCdUEOQX/PUIK3qsbdcv05zQ==
X-Received: by 2002:a7b:ce05:: with SMTP id m5mr3865414wmc.64.1626265585039;
        Wed, 14 Jul 2021 05:26:25 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:24 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/21] webkitgtk: upgrade 2.32.1 -> 2.32.2
Date: Wed, 14 Jul 2021 14:26:04 +0200
Message-Id: <20210714122606.605142-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch | 6 +++---
 .../webkit/{webkitgtk_2.32.1.bb => webkitgtk_2.32.2.bb}     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.32.1.bb => webkitgtk_2.32.2.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
index efe286ed6b..21828a7ecf 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
@@ -1,4 +1,4 @@
-From af90ae1f128626e8d57a8bcbc432596bfc2987af Mon Sep 17 00:00:00 2001
+From 1a7becde0e508d7fac488bae6c08c1a4a0ac6b73 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 3 Feb 2020 17:06:27 -0800
 Subject: [PATCH] Enable THREADS_PREFER_PTHREAD_FLAG
@@ -20,11 +20,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+)
 
 diff --git a/Source/cmake/OptionsGTK.cmake b/Source/cmake/OptionsGTK.cmake
-index af6c0fac..f393d741 100644
+index 1f500299..0771af9c 100644
 --- a/Source/cmake/OptionsGTK.cmake
 +++ b/Source/cmake/OptionsGTK.cmake
 @@ -6,6 +6,7 @@ WEBKIT_OPTION_BEGIN()
- SET_PROJECT_VERSION(2 32 1)
+ SET_PROJECT_VERSION(2 32 2)
  
  set(USER_AGENT_BRANDING "" CACHE STRING "Branding to add to user agent string")
 +set(THREADS_PREFER_PTHREAD_FLAG ON)
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.32.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.32.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.32.2.bb
index 7abf96c252..96b6cab49c 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.32.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Properly-use-CompletionHandler-when-USE_OPENGL_OR_ES.patch \
            "
 
-SRC_URI[sha256sum] = "136117317f70f66486f71b8edf5e46f8776403c5d8a296e914b11a36ef836917"
+SRC_URI[sha256sum] = "1790f86975bdef957ba9a12fc09202de8f55c885ee38467afc50d2bdb7a6c5cd"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.31.1

