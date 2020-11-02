Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.1234.1604335781339025790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r1krqncU;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id w13so6324128eju.13
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+52pNeMZiLUAAqwf28ZYMcveDGIS+SEjOFkHLG+8lDE=;
        b=r1krqncUdEs8e3qcW3dD//AU7Ocm1kP33M3Bfz5lpHv3XX1hEM+T/nnzQjppjIhBs4
         YZOTsdH6NTyU44kGfS0JcxB2bsHAiuyVb0peu7tUCNjauZOIpbCIrXCiBF1s6uhpLSBV
         tkDUzmnueTt3dbmqZZGlMg5s8im///nnkXkKtf5Ukn/A4yS7JMMi7CeAx+Y3X0CXKE9z
         p+B19bp6x0BZWOFTXw3rQ8U7qsP5QiR19+9a2HcoyxzKGxA5l8aulsns48QBIceubHB4
         MR3vT/utyNnnreVigUIpcvyELUtjcBZYgkFPXWiEsWGjb6hglJSI4xOvgzJhKvMEi2wM
         nhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+52pNeMZiLUAAqwf28ZYMcveDGIS+SEjOFkHLG+8lDE=;
        b=QiqQGZLF2LugW4nQpN0ntcYH5MdNizRup8fn399l4SgdWlkVZVTefcYxqlcE5f1Lmw
         HnuwnF+Nu895qqevF/2S1Tiesw7hmn584JBsg9BPHpLeWB6eXUv9O/wm4/zkYP8HsB3e
         oUAfy0bvDvIyJS/QJnRdVx7tHRZ7haRScycSeWYcE4ZZrFo2IF+OTO+Q+sZnP1VHMXgB
         Xz4OGc8U+E2Ef8plMB3bhnjbzaNAXGMwfCCxp5Ltbja3ddvgLeee5x86p/58zAu4OwQT
         yQtA2jAm0h7mp5B89x7OiPoWkN3Pq8YrVogmnsv24A1/O6/EeEGxxgy7uRgbj6effJME
         jvrQ==
X-Gm-Message-State: AOAM5330VurvmgX7J+/kbw+cMqme9XdJk2FnyD7Ue2pDLaWCphZjTbK8
	ULj7TLiMji5rFk7im2gXsJHXZedyn9+qlA==
X-Google-Smtp-Source: ABdhPJxzBNDsp2d0vmc+E6K6vU7Q6XgRJegrY6nQ89vTbjkHBNOpqLmAh6/WgE4ohd7yqDVXWrx2cw==
X-Received: by 2002:a17:906:604e:: with SMTP id p14mr2727077ejj.515.1604335779728;
        Mon, 02 Nov 2020 08:49:39 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:39 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 25/80] gtk+3: upgrade 3.24.22 -> 3.24.23
Date: Mon,  2 Nov 2020 17:48:12 +0100
Message-Id: <20201102164907.27572-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.22.bb => gtk+3_3.24.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.22.bb => gtk+3_3.24.23.bb} (89%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb
similarity index 89%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb
index 6af2bd94c1..338b7030e1 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
            "
-SRC_URI[sha256sum] = "bf18a4a5dff28a7b02aaef1b949c2d09c96c18387eddab152bb4cd55a5b67dda"
+SRC_URI[sha256sum] = "5d864d248357a2251545b3387b35942de5f66e4c66013f0962eb5cb6f8dae2b1"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.29.0

