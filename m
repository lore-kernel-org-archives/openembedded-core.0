Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.1246.1604335807655168933
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nsiR/FEK;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id a71so9660730edf.9
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2m3vO2NL38766uvXbOJMrsiHxAeJYmT23tRZYFDCAv0=;
        b=nsiR/FEKA3JPydzohm+LSWPih9YD0t0e2EU/abUroSaLoeYzp4ajUiG3AAGeb5fP6r
         +UaEpaIlTWaofPB6yL+rUSnEYt33PoEPBEuzkbRbL1LJZ5eMTqms6soQ2l4TOC78n831
         aOquXAaQZ9UZ/RsQufVsX8aCl26S/IWyxrFm8dR0HNOppsun/AY3E5HMcK0Oa+h19AHq
         46iDbOsJbhN0d0t5OduxDs/84vN1TNElj2iXo2QqFugKMirOIjCPD/bVof37B5uUqfGu
         nFOYfj6e7xh9eBudIIvKBGfTmNHjriG3EIj8p2tSr7wYerRkFIpo9tYlAtq9+6j8m9NQ
         1Zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2m3vO2NL38766uvXbOJMrsiHxAeJYmT23tRZYFDCAv0=;
        b=tkiRzgU1ioabp8Tr/srtyNMqvdoZw5XndbBXtVfi48GWSbJ+eJZW9qEA1C7lvA3ALY
         Aw1qCEEWPzlnB06/EI4uRclyXQiR9KVWLYif89NTpZVyVxJ2q3ROqLTsYkvHAYiLj52x
         iAbepP7iZIvUMnqXYHZXlGzQpPyHj4449Gi10bnkFPZaqA0LM46YQv7MKMDTpvbEBPBe
         Z0KSvgZQVL0cUgBTV4t+dwcStzuvZZrWSXzuqthvylTW8T//qibZVoCIzNI1U4NeknSe
         sayf2Ha9qWHL81IneaFrGMuiSw7SpZVi8oupa3n6O6vqpTLfjDXiNvvTI4C/sc1UbQ9t
         BuNA==
X-Gm-Message-State: AOAM531uYEoM+58y5iZpXLqKEh8qJTkRB5Lm25eBiCIgkVwD36vcZskE
	53SeNXRENnrwBbEvqLi0hVcsosQBbwTB2Q==
X-Google-Smtp-Source: ABdhPJwvZ/70XDZlTNHKQPTA7ASQMzYxlejzc+V90l+e1EZ08jgBgG7QcyuiP72ZYZTFJxPBnCvjnw==
X-Received: by 2002:a50:a454:: with SMTP id v20mr17059150edb.98.1604335806032;
        Mon, 02 Nov 2020 08:50:06 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:05 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 54/80] mtools: upgrade 4.0.24 -> 4.0.25
Date: Mon,  2 Nov 2020 17:48:41 +0100
Message-Id: <20201102164907.27572-54-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mtools/mtools/disable-hardcoded-configs.patch           | 6 +++---
 .../mtools/{mtools_4.0.24.bb => mtools_4.0.25.bb}           | 3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.24.bb => mtools_4.0.25.bb} (90%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 138ff9de76..4705890157 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From fa6ebd96c7f330edcd74abf61584592eabb9e726 Mon Sep 17 00:00:00 2001
+From c61a3df892ba88d9f3f84c1844481457a04b051f Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -12,10 +12,10 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index 265d494..15e64dd 100644
+index 46af755..5ed9114 100644
 --- a/config.c
 +++ b/config.c
-@@ -740,14 +740,6 @@ void read_config(void)
+@@ -737,14 +737,6 @@ void read_config(void)
  	memcpy(devices, const_devices,
  	       nr_const_devices*sizeof(struct device));
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.24.bb b/meta/recipes-devtools/mtools/mtools_4.0.25.bb
similarity index 90%
rename from meta/recipes-devtools/mtools/mtools_4.0.24.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.25.bb
index f11cdad37a..bca33a28ee 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.24.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.25.bb
@@ -24,8 +24,7 @@ RRECOMMENDS_${PN}_libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[md5sum] = "aeaf34406e9d28922b7c09a35ca5955e"
-SRC_URI[sha256sum] = "24f4a2da9219f98498eb1b340cd96db7ef9b684c067d1bdeb6e85efdd13b2fb9"
+SRC_URI[sha256sum] = "fd161eec3bb7a93d13936db67725ad3e17f2d5f4e6fa8f7667fbc7ac728e2c15"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.29.0

