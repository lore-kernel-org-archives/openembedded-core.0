Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.9595.1629636700160854442
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nEJvIufF;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id u15so8780622wmj.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3v6BGoN/XdZXtwlO2pmyLro3WpdXSDYquZPmfQMvtBw=;
        b=nEJvIufF8S2Hlfg3ukxbBi7SeRPmqhUZl6Yt6bkGGu9l9MP87G0YQKiEpMLqU1Rz0h
         ybfwpCE+sur7cAcON5nIEFEjtVaMPQwlxqpQ8HfkOJfVk1lCENBXk81UTdSAAiWu1yZr
         AY6uV/aZ9W4QaD4Sh+EAwlDkrIpX0Rt+yIhBOPCuJTlJ1L7PwqzWSrIIJ+2Fe42VjavI
         CJcRyx+Y1wY15VnHQgabUJ04dhrh3UpuT2YQIUXmL1XQEPfOuWWVYnYarZQVa6YrEi04
         nFfXLtKK7ck/N3jI0aP1N64jVFiH+KyNhUmEUKX+od3T1CxyALY7AbmtgkmwPrNNLnK1
         /1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3v6BGoN/XdZXtwlO2pmyLro3WpdXSDYquZPmfQMvtBw=;
        b=XwzDKsL0xc7rmW47Hx5tt/ILGRr4nG2Ug9/3rrWfAVocjYtK2HKolCiUoMPU6feLZ+
         YHHmiTE+8kjVSPX4qOD0QKz85OMSaUb4euAQ6B6/KdwRZxR+RsV96FmJboyHgMNAmxbp
         Q2o3sj//feWWy6RpckB+hNrT9URFo5NQ36VXswdleMkHGAXFntzzPDwVE8jmikpM1vey
         SIo6C6zl4DSDhCNrwSkpReNdzxIUAMlVaLPbXKuFtV0Oo+Kzf0ymgmBkD7p5d09wsBju
         hv/P3H2GHAJi12/OBnhSt6UImt6K5pHFfhSwfki42sf/JUadX1JvuQwaHhHiM4FJT8cN
         hNqQ==
X-Gm-Message-State: AOAM530InK+84McCLrDuXS6s0KLr66XYj0euf/ddZBtqOK0dXFCAD3ez
	EK1PgYaqnpKbJlbUYDotP+o72XTJps1+xA==
X-Google-Smtp-Source: ABdhPJxagitw05tgN52RATRCyoLvXRR/tStLdYrWZhMaz5rGNnIVPp1h/XtGKocht0qf0EZu2f05yQ==
X-Received: by 2002:a05:600c:1551:: with SMTP id f17mr10858634wmg.44.1629636698794;
        Sun, 22 Aug 2021 05:51:38 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:38 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 41/55] pango: upgrade 1.48.7 -> 1.48.9
Date: Sun, 22 Aug 2021 14:50:49 +0200
Message-Id: <20210822125103.310416-41-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-graphics/pango/{pango_1.48.7.bb => pango_1.48.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.48.7.bb => pango_1.48.9.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.48.7.bb b/meta/recipes-graphics/pango/pango_1.48.9.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.48.7.bb
rename to meta/recipes-graphics/pango/pango_1.48.9.bb
index 48a77868f8..54e169768c 100644
--- a/meta/recipes-graphics/pango/pango_1.48.7.bb
+++ b/meta/recipes-graphics/pango/pango_1.48.9.bb
@@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[archive.sha256sum] = "28a82f6a6cab60aa3b75a90f04197ead2d311fa8fe8b7bfdf8666e2781d506dc"
+SRC_URI[archive.sha256sum] = "a913657d3fe5aa04c03958a3b5d3fc859e891b75cd81b873a819330f6c0872aa"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.31.1

