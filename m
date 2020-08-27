Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.16372.1598526018784886271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 04:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i3IDGxv0;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id l23so4481485edv.11
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 04:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hm8TnVKMuzhbAiczP8/AhkmJOoSrMQApT8eRP8mqvHw=;
        b=i3IDGxv02MuGusQGZBAAuBM0f5EiqnfCpf7tBHzT523SF7etJ86dJ96DnAQgtzzoU3
         lbssbvUHE0NziQYBLrSRixjNUEHipWijqtDLVmFU3sBc3lOeZazABzHBpO2FngqeDVgH
         NV520z0oGuLYOilDD2VklFXFBs3wJMTgAPxFdPTBBVm144gi875J7baLQD+rKpm/0RAK
         +QNzrIzUil7e1b1CWn6tAFBHwXFF+7lrE6CB1JcYpIQX7nkLPlBILVmx6Niy0PJEiuH0
         m9c0qfzGgDC4zXwJ2hoBiNkezEup9Q34ALMhuiPCVgkCyy4KExfSPkL0wxzeCWM27MsU
         A5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hm8TnVKMuzhbAiczP8/AhkmJOoSrMQApT8eRP8mqvHw=;
        b=q8pnCqauvgfeQ+27b8TdfiBQoRewtEViAI1bDJdP4EX9P3l53UYGLhs4NSBh2+jDmp
         YXSuC0c4DHHow6TCe6RL9QXL0mOnguKKuPOBjxeWmbUs6PyvQJXO8yQ1m9Uyh8h7KEQL
         nzGYK9rSL3IdLapBFoCBnHlTvKghp2/oQuLwG5/x9AOdYd9/01jIbii/guHWQES9k0H+
         4qRAZzBil2+3xNjsuuhLPFlPrLIbOiRBnYYie52MpnisNDd72q9hVmSnKa5baV0JwmaL
         kxE0jsGOZYG/Pc48PziHIodM0whUsKyQyA1Ax+7qQbo3u9mOMpj7Avce3Jf278jcE/iJ
         fg+w==
X-Gm-Message-State: AOAM532UeARNsgCM60xntE3MaIKr8Pm6OPZIL892QLgNMM5HEU4VTYH/
	a6yjviAQxSg0TeiuSCex7mhQDu0BDxM=
X-Google-Smtp-Source: ABdhPJzJqZWegd+u1poVH57BsRQwJPeYKZ6+qKWlscyaFGCDdlx4dS4+TLQex9h3Scgsi6MS+xEaag==
X-Received: by 2002:aa7:cd57:: with SMTP id v23mr19948016edw.342.1598526016961;
        Thu, 27 Aug 2020 04:00:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id eb5sm1623132ejc.94.2020.08.27.04.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 04:00:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/6] json-glib: inherit upstream-version-is-even
Date: Thu, 27 Aug 2020 12:59:29 +0200
Message-Id: <20200827105933.3575-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827105933.3575-1-alex.kanavin@gmail.com>
References: <20200827105933.3575-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As specified in https://wiki.gnome.org/Projects/JsonGlib

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/json-glib/json-glib_1.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb b/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
index 5143d73ed7..c999d761bd 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 DEPENDS = "glib-2.0"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase lib_package gobject-introspection gtk-doc gettext ptest-gnome manpages
+inherit gnomebase lib_package gobject-introspection gtk-doc gettext ptest-gnome manpages upstream-version-is-even
 
 SRC_URI += "file://run-ptest"
 SRC_URI[archive.md5sum] = "4d4bb9837f6d31e32d0ce658ae135f68"
-- 
2.28.0

