Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.13826.1629891516268779743
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 04:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vEsBsgXo;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id q11-20020a7bce8b0000b02902e6880d0accso4091373wmj.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 04:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CWk1UekBg/wOH2LaAxw8Srk5IwRWm6gmMzAO7ebpZ4M=;
        b=vEsBsgXohE/fZN4SikMYSWvYvpgVykNZJZV0MwPYIcZsvIbLt/rMXJV7zAqGPL4FiR
         mH7IxzXWJvzfgllHRSBE1fdvfrgdw7Zf/llVAyMQUNG/eQzegOpBIUn5bhSTVWn5kozJ
         Up3zRzGrRLMMP2nl6oCPPQi9c8UdQ9MRaRW/V1O6BW24bVx+DWzWORG702vpZpeM3Svj
         tcuqXG/Q9FlkTAZ6sq4y7zRlnwqFy2xN8xfrBqw2oEjoxUB4Ry0eh39DL6YfPNnr235m
         YuyGBXU2XCYeedVr1RltUxkEQ7pLhs1IAVIOhmFGmwrhvCn13FrmPcz90QGLgGh7MSiy
         Mp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CWk1UekBg/wOH2LaAxw8Srk5IwRWm6gmMzAO7ebpZ4M=;
        b=meHsdPauhA3aXzJJ7NwGTtigtjtjMoNHWN+3aiHsr8elaT/hrTf2AdE0vuNLeeHvxx
         tmfI7mOuvueZKSfFZ9gzwyiY2Ja2onNbahpAKXHgS7TwvrRK1cof0+MoN4bLjruaRTWI
         yEBnwvkXV2QjonzoqErQe4yfxUvepBj9AVzxeefrGyNjFTHR2USkIGg6UzHF0ZyVU42U
         sI2rIkO7NUa199XsgxTz0sbZYcVOLy04VseADvdGCt5keGlyfmLvfVT1r0Bjv/gzi1Bl
         p+hHVooz+h/pKF3GMkgO+5aQbIbHj7xrz7E0bIIiNYZOb43SasmVYyBcL2GmjnDfMXIM
         ObPA==
X-Gm-Message-State: AOAM530Mj9uJIzB2ZWSbOBgxwEX28B2kmpnQjr8eAs6XYU358rKGUDLA
	8PkFQoze/ijRZP3CfTRJgVeRnXAN6KHL4w==
X-Google-Smtp-Source: ABdhPJwALSnSPHOpfucAV8WqalHe3ZHgJd32ySTr8R2embKRfh+gUdykdie391GLTUkNb1x+4ruB2A==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr8945673wmq.154.1629891514869;
        Wed, 25 Aug 2021 04:38:34 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id z17sm20790217wrr.66.2021.08.25.04.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 04:38:34 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/16] json-glib: upgrade 1.6.2 -> 1.6.4
Date: Wed, 25 Aug 2021 13:38:03 +0200
Message-Id: <20210825113804.779395-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825113804.779395-1-alex.kanavin@gmail.com>
References: <20210825113804.779395-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream has converted from gtk-doc to gi-docgen.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../json-glib/{json-glib_1.6.2.bb => json-glib_1.6.4.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/json-glib/{json-glib_1.6.2.bb => json-glib_1.6.4.bb} (77%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.6.2.bb b/meta/recipes-gnome/json-glib/json-glib_1.6.4.bb
similarity index 77%
rename from meta/recipes-gnome/json-glib/json-glib_1.6.2.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.6.4.bb
index 3f3707805b..072c2406c7 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.6.2.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.6.4.bb
@@ -12,15 +12,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 DEPENDS = "glib-2.0"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase lib_package gobject-introspection gtk-doc gettext ptest-gnome manpages upstream-version-is-even
+inherit gnomebase lib_package gobject-introspection gi-docgen gettext ptest-gnome manpages upstream-version-is-even
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
-GTKDOC_MESON_OPTION = "gtk_doc"
-GTKDOC_MESON_ENABLE_FLAG = 'enabled'
-GTKDOC_MESON_DISABLE_FLAG = 'disabled'
+GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
+GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
 
 SRC_URI += " file://run-ptest"
-SRC_URI[archive.sha256sum] = "a33d66c6d038bda46b910c6c6d59c4e15db014e363dc997a0414c2e07d134f24"
+SRC_URI[archive.sha256sum] = "b1f6a7930808f77a827f3b397a04bb89d4c0c0b2550885d4a5e4c411dfa13f5f"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
-- 
2.31.1

