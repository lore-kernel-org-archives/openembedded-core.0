Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.15379.1631124106384317823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OvtjbAh8;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id x6so4519732wrv.13
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rc8OYDqrFrmnaQeYV310TyaXYM74yTSv47Q0+nore3A=;
        b=OvtjbAh8m8kyb5ptTy9bsZKQfJYCiD4dhGFoAzmJ5Cp0nfRNTvVLyJ8CcQH1hq8MBc
         uCU8Zg/pFxRSAa+ErhNmARePS4EEcfdiURAyiqvhyBpbisEn0CBiwmAh4CvJLghkUoYB
         dOVbi3ZJPgX6BjJGC9Yg4VJJo4P+DkrWXOiH9fwqIVu418b+Wbfy3RmzCAU4fgP7LxH1
         iVRXHbdRgJuqETChoDeWzdcpHw7WHx2Tb14soaEZK2X3OLBP77R4zgSZQtomdqmT13Q3
         Xp0aG4L1f06whZATnPZ/9melGRbaol/OpegnSdN/7E4FhR13BKVe69TQ6P6e8tGzyo93
         0ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rc8OYDqrFrmnaQeYV310TyaXYM74yTSv47Q0+nore3A=;
        b=RdvDa2qpzKRZeYQOYb4b32QYaESe02I+jNiPLfDC+Nq5XG2gcx2Kcjtf4ashzzDm+Q
         DIBPPARs+nD2zJkmcn0reiREexRCmk/zWQSCzgcDeIjCFpLkdh8Dm7qhv55/Tkuw9Lpu
         UrP0p/LW3MM4x9K4B8Amog56QPDirVUJFWNuuTBn6D2rtR9SSZF651suC6W1a3VrfsN6
         h/bOruzNkOgn78+uG0WYqKkcPKK1e6WzgcVPQKz7KenhagRRz7DdAeQ6fChYraI1PqHC
         r/oiZA3B7ej0rntt5gHQBveQs2lyDni+GntfrBnEiYNQO7Ge8I/7axhpvAix0PpKExuU
         33Gg==
X-Gm-Message-State: AOAM532IpEN9hmJhaBNdagl4mUnjLUD9up1+CcZWRjMVp+IbWrhNgSCl
	YDhNoDTCTQTDPbGG0PemZ71ipJW8dEY=
X-Google-Smtp-Source: ABdhPJy8R1IhhzKin8UalpVQKWI4D/JRfhOVAi6wPxYjsaEGg+4NpwX0qfar8njx4FghtVa+zHNBoA==
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr2911004wrw.311.1631124105035;
        Wed, 08 Sep 2021 11:01:45 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:44 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/26] rt-tests: update 2.1 -> 2.2
Date: Wed,  8 Sep 2021 20:01:23 +0200
Message-Id: <20210908180125.103473-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch | 6 +++---
 meta/recipes-rt/rt-tests/rt-tests.inc                       | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
index 56556dfe63..1e8ff4619b 100644
--- a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
+++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
@@ -1,4 +1,4 @@
-From 7b0ab10370cad38e26c5ffaaa55a1fd77fff0f18 Mon Sep 17 00:00:00 2001
+From 05ccf5045adf4248f29623ad0db2d2a55ae5cd06 Mon Sep 17 00:00:00 2001
 From: Randy Witt <randy.e.witt@intel.com>
 Date: Fri, 16 Oct 2020 16:54:30 -0700
 Subject: [PATCH] Makefile: Allow for CC and AR to be overridden
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate [other]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 63cd77c..495d6bb 100644
+index ec5d693..ab8a8de 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -1,6 +1,6 @@
- VERSION = 2.1
+ VERSION = 2.2
 -CC = $(CROSS_COMPILE)gcc
 -AR = $(CROSS_COMPILE)ar
 +CC ?= $(CROSS_COMPILE)gcc
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 5ce4d298b9..71227307c3 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV = "667e1aae896f8448615b062d27c818b32cb960ff"
-PV = "2.1"
+SRCREV = "75c16956e32817dfb0d5cb7379e731061e16593f"
+PV = "2.2"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main"
-- 
2.31.1

