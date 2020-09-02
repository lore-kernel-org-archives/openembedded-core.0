Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.909.1599081239458626038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cxOiQR1s;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id m22so661342eje.10
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NS6so+p7OxD68tebcm6qn9JwB5xfAlENgoyb0vSrHCk=;
        b=cxOiQR1sI9mgZFm4N5c4TTxwGSqX43J5P0JlMkh8mT/by47fGElbSrcRN8i/ZmKU9e
         vuXau89KEDgMHnHRQ4/ariERR6xnNrC/nhh0SzoAEn+WemrApuQR/vbMqZctwv5HYx2G
         89vkhv0QWjarrAUwEm16JYk92SymFKikRoF09swanlRKZ42IzVqTcegnyUykfYhSIT7W
         n+/Ww/Kqm2Rmi7HuIFUCczQMADQhpFLyDvyKXmOMkKkA4PU8IzX6Y5E4jIR/sOhUkzGI
         dunxXfN2IrD9Emn/LuPdXL/rP46nwfuA0ZLvUX4UTtM71QZ4oTiAOdpHEphU3vydZaHm
         YaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NS6so+p7OxD68tebcm6qn9JwB5xfAlENgoyb0vSrHCk=;
        b=oK2fBwiUQkG3fXgrww+IytbyMyynb3/cZWhpzarQK244Xe3byHobwq48a4LgXzRA2M
         R1i5JUO77h1ZRIbD3qE9m0VrDdbZAJTd6Yy/uTioxOK05mnjq6fV7J4NEB+2XY64aJRG
         O8OeiwHuj/NZCclEFfb8AK6enBzWjBfF51iKX2UaoM+cGqMPlFdYhEd+boniyZwelhrD
         zt66QVJcbkxjYOfoh74gl3YTzw9eVil/CdrYwpcvEXXxorr9atCcbk1ReCQwTobS2BGh
         nHpIwN/sNPKsp6dZvFf6sWZmgC3IEh6scLB7JhC1YoWBTGBPU7EZ8z4nG9qfpIB6itwc
         h3vg==
X-Gm-Message-State: AOAM530GR23qcFvEAsFY+FEj2SXfluOeueltSVMhyzGCzbrPO/2jGBPC
	E3JeeV0XmxpQOWvb9yv1qg9SpgvKQAQ=
X-Google-Smtp-Source: ABdhPJwqBgmz6cy8Qv2DH1miAIdJftS5Pgo1ZVeMh7bO/ywv+t//wbniftTXSnqgAYWLxhk4qpRU2Q==
X-Received: by 2002:a17:906:c7cd:: with SMTP id dc13mr57262ejb.446.1599081237523;
        Wed, 02 Sep 2020 14:13:57 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:13:56 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/23] glib-2.0: update 2.64.4 -> 2.64.5
Date: Wed,  2 Sep 2020 23:13:08 +0200
Message-Id: <20200902211330.4853-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../glib-2.0/{glib-2.0_2.64.4.bb => glib-2.0_2.64.5.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.64.4.bb => glib-2.0_2.64.5.bb} (93%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.64.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
similarity index 93%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.64.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
index e4c834caf2..a1233e6926 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.64.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
@@ -20,8 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "0a4f67e9a9d729976e2f797e36fc1a57"
-SRC_URI[sha256sum] = "f7e0b325b272281f0462e0f7fff25a833820cac19911ff677251daf6d87bce50"
+SRC_URI[sha256sum] = "9cbd5bd2715ead1c28d53c46f7b7b6ff6166f5887b772c1a9e3bf2910cfecc11"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.28.0

