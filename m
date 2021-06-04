Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.5868.1622798109740639601
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QH5MJkLG;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id k25so7937815eja.9
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L6jtloCXjKqCyqjL4cWh07+j2z3iburVxtCOi7I0vOo=;
        b=QH5MJkLGmvPXmFZBSASAQLc2TGT3itfcaqeGxcvS2trjCe3K8tOBNVn3A85mraIUi8
         H1yvzduJe3ygvq2AQuHYcHCI5SsGyVafmx0DGhvulje3qSIYX6GnHevXiIfPzwTh8O6c
         skh4E9SwJ0OJtMxyBfxHexxmrJYR6X6kRDVlsQkYN54xuebjHrN9S6LzuoFyx/Mvbo0e
         0xmw9JzNAK/m1IIQFHXON/WsRVFyx45qXZXcCURKn/0axa0lpwXXakycux7ThCj7DLE3
         m+9fmxYrVGsai8PH4NfLnla2ReYUs7e5aFTen7UouJdjf7bHBdy8OAg/j6z+gi0DwRwD
         AXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L6jtloCXjKqCyqjL4cWh07+j2z3iburVxtCOi7I0vOo=;
        b=idisdm/Y5b/w16a416M8+VQilmMQPuk6dgXa1HE5XL1t6GDZkn1SMfkCIn+q982hRS
         57QybsoxAnboosLuHMEFzoyKqNy93frzVIGv81JL41t53ihr8A2j1YATG6230sapPR+p
         wSPub7/4W+TQrHQjCNemMjTDMDrAoP84QkuNU2oHuVh3pUZUHgyX1Ed6nLOcTJdo1Wb3
         A7ADCBk4dDfcwqHGC9zU+sbEzE8fL7kx5RORQhUlL3VGD3H14+CDGtAlH1nHxfYwltWp
         PFwun2Cdwj24IVydgh49UVD+6ZYxTwWbmOmuq0OyqMj00Y1WUryBQA0cJzUdsB/8QOmk
         ehmw==
X-Gm-Message-State: AOAM533eJaVMBvxpIBpfKusgP0WFKlsgfwYOBVPZK+D9oCtFP0qR8+XV
	5XHzMgBchhO9hhDjboFhtp9S1I2ql1RH8A==
X-Google-Smtp-Source: ABdhPJwZ645jGVrcA7X2/5vNDDwZmYnat/sgbktz9tRLQxXRggwnLU738P8gH9cL9/Sp0Co74B5zUw==
X-Received: by 2002:a17:906:a95:: with SMTP id y21mr3268138ejf.522.1622798108324;
        Fri, 04 Jun 2021 02:15:08 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id br24sm2508544ejb.55.2021.06.04.02.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:15:08 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/10] xf86-input-libinput: update 0.30.0 -> 1.0.1
Date: Fri,  4 Jun 2021 11:14:57 +0200
Message-Id: <20210604091458.1381144-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604091458.1381144-1-alex.kanavin@gmail.com>
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: formatting

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-driver/xf86-input-libinput_0.30.0.bb         | 11 -----------
 .../xorg-driver/xf86-input-libinput_1.0.1.bb          | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb
deleted file mode 100644
index d02988caa4..0000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.30.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-driver-input.inc
-
-SUMMARY = "Generic input driver for the X.Org server based on libinput"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5e6b20ea2ef94a998145f0ea3f788ee0"
-
-DEPENDS += "libinput"
-
-SRC_URI[md5sum] = "11dcfa2cc39f790731a9545fcdeea717"
-SRC_URI[sha256sum] = "f9c7f9fd41ae14061e0e9c3bd45fa170e5e21027a2bc5810034e1e748db996c0"
-
-FILES_${PN} += "${datadir}/X11/xorg.conf.d"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb
new file mode 100644
index 0000000000..8da47eaa43
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb
@@ -0,0 +1,10 @@
+require xorg-driver-input.inc
+
+SUMMARY = "Generic input driver for the X.Org server based on libinput"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a22925127bd3c827c384cedd23ed2309"
+
+DEPENDS += "libinput"
+
+SRC_URI[sha256sum] = "fddec49c115591918475155bf16aaf23017d7f814cee7823a0c11f867aca245b"
+
+FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.31.1

