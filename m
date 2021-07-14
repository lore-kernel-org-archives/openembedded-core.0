Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.6055.1626265584608427506
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K9irBqyB;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id n4so1466821wms.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9SfMrQa0Dh3rKA3frP9jwLtS1ueZdKUhX9pM45gT+uc=;
        b=K9irBqyBitW7UZepCt4cFohW11bMa7+zEdexDrkFR5+F66TNACzl/mDJEzz6tkyqAU
         7/Fj7JI5T148SmXhS5VA8ISaHqyhkmN/T3zhfFkNy7XilH8zP4Hty968aZrQyyIzQV2p
         +TZRTDFwawE+QIJxVLFqP2yny7ZMdVkdXd1x6pmAzF8e5LDQC2joIgUDQFtQ/C91P4sq
         N7Nh9oacsIQi1nXbOr7xeGUK6FgKB0bnQKXylkVpRtz6DgZLF883iFRPpTF6iBsswRJP
         Hn7ixtIH73K7Xp1D+XJFRb3BiHv+I73ewUaAyq6LVKcvSvUONsr77KswbQIkPok53+sD
         +m9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9SfMrQa0Dh3rKA3frP9jwLtS1ueZdKUhX9pM45gT+uc=;
        b=OHy7L3mdlnOLiEO9qt3E+Xhb1OYrnv+x3IVyRDz2UoyxbStIliodPQeXk+PZF+hvdk
         epy29mADq4D5FRdUcYtqSsF6Y3jdV8sy6odbqpvrreMXhUiINWOFkCm7d2tPXKem3PKJ
         E+62ILALxf5TS37bFUDb7p2SrgIXZC1DJZ/vBWDGf/WXy+Lbyx736r8ncKQ39u3KwQZj
         ODu7Dum4wa6pbMX4RFSGfkysijMO8YyIH4uGa2TgahAuqzYTkp/7UoAkW/iLuWQNBdFu
         PvqDq/M8E5czp3vD6IyeaCny4TA9o0vyNzyy+3V9bOO3AcAKu3Ai+1gu8iL3AuJwYGyt
         9Jpw==
X-Gm-Message-State: AOAM532z69idmwOFU+9CrNbphssYCAGAVmx8ha5Z5iIZLIijSbBapl58
	oEYKjcJvhzjOisEcpAwWJLCuYFmcbC0=
X-Google-Smtp-Source: ABdhPJwxMuZMjuShsFFfqAGh6oGMP6GjVIDJjupdMkwSsP5oSEHnV8PycxiLXLDdbSeuIUYQDXBXxw==
X-Received: by 2002:a05:600c:8a9:: with SMTP id l41mr10816881wmp.161.1626265583280;
        Wed, 14 Jul 2021 05:26:23 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:22 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/21] mtools: upgrade 4.0.31 -> 4.0.32
Date: Wed, 14 Jul 2021 14:26:01 +0200
Message-Id: <20210714122606.605142-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mtools/mtools/disable-hardcoded-configs.patch           | 6 +++---
 .../mtools/{mtools_4.0.31.bb => mtools_4.0.32.bb}           | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.31.bb => mtools_4.0.32.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 7240a039e6..81d76d060e 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 589a05f9377e3899082ced46c1736f90c0a4dc9b Mon Sep 17 00:00:00 2001
+From 630dbcabc408cf5d73edaa7cf64a48194976b290 Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -12,10 +12,10 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index f91004b..b72f8ea 100644
+index bb13682..9186c77 100644
 --- a/config.c
 +++ b/config.c
-@@ -827,14 +827,6 @@ void read_config(void)
+@@ -836,14 +836,6 @@ void read_config(void)
  	memcpy(devices, const_devices,
  	       nr_const_devices*sizeof(struct device));
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.31.bb b/meta/recipes-devtools/mtools/mtools_4.0.32.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.31.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.32.bb
index 103036e518..501875037a 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.31.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.32.bb
@@ -24,7 +24,7 @@ RRECOMMENDS_${PN}_libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "538999277f8f2fa901f3898855d1b0ccb184666457fefddb70001cac612dd586"
+SRC_URI[sha256sum] = "62498cd51ae7c79a27c879a45f0d2a8c44e1404cbb901372d09b02735ef5ad89"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.31.1

