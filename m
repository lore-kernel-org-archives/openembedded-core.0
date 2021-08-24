Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.36077.1629791538659737258
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 00:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X8f7Waov;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id u16so29895822wrn.5
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 00:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MhfGYEMIt8bfanMu3pb3UaJQ0yaP9m1ucrs5aS5d5H0=;
        b=X8f7WaovFPLuDAisjUzUU/+YqySRqpp/hn9yaaSIlUoH/dBlb+oKP9Ap0jK4rKslKh
         jtD1korJZognLZmgMumOgFM3kcibR4zJlgXvMSUXbyWMtxbB+ySUG/WxiY8tSmno9Ayq
         4lFW8H1EOFmUdzLK9eS0J/PaZDc1HaXd1ra2F9SCOxpxQi34sN2ZgJhldQPC6ngpCo6a
         5jHQnOn0alJtylRokITLhAo9HJZi4aCRy0Vm0h3eQYIzv+vQGHhVldNN+T9qI635+IJa
         E1raFmrjRCLseUgFN1yfD6VXNt7ZgV+Uz1RK4dAOAiKkgTwneVUP8GbaizPl+Zu8aXEK
         6+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MhfGYEMIt8bfanMu3pb3UaJQ0yaP9m1ucrs5aS5d5H0=;
        b=EPro76a52rsG/31HXcNOuSSY/jdLI/jrZEsESzEMt4KXYgsZlTaGree2ycsINfzByU
         wf7Al6d4iC9iFKz6MBl6mnF0BpVe1aJayLfi5MEWpnGvyOUifxp2V2ushKxkbWvl9uHo
         j0twi8DFvuhHWr8xRZi/myi5zOcxF8uKrr1nkKLUBTetsrgeYqg9NlFEMDT/iP8pm0Bt
         GxwpsEcPptqY9vl6xEPrBsIk8clpZhoyxJ1gSMNcq5RAfmJHcMNB4U3FLgJhEAyVREcD
         bempfkESiSEh0ReN5rwjxs6yJm5AmDZIzrH5iAsC8JIbQd9qUAfGvMBI2ziccOT4pdn+
         JdDg==
X-Gm-Message-State: AOAM531RI4l5FWUWsQoOtxZS85Qhz2gXDfP0CE/Ve/9ZUlWQxVaIrm/u
	R3GTCnTWwbFXtV7OCIl/kcnJpFek34sxKA==
X-Google-Smtp-Source: ABdhPJyQGHwXDljsZ29LrMlDWhNyuWKPw0gU7cadnsk6pcyHTAQGoSPrc6xiaP48HrfZ1Qr1FSKFYw==
X-Received: by 2002:a5d:47a5:: with SMTP id 5mr18111309wrb.9.1629791537329;
        Tue, 24 Aug 2021 00:52:17 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id n14sm6993891wrx.10.2021.08.24.00.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 00:52:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] libjitterentropy: remove contaminated hashequiv entry
Date: Tue, 24 Aug 2021 09:52:11 +0200
Message-Id: <20210824075211.752307-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824075211.752307-1-alex.kanavin@gmail.com>
References: <20210824075211.752307-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex@linutronix.de>

This was caused by intermittent reproducibility problems.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libjitterentropy/libjitterentropy_3.1.0.bb                | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb
index de51ed8fc6..f703c089a0 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb
@@ -15,6 +15,10 @@ SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git \
 SRCREV = "409828cfccf4b3b07edc40a7840a821ce074e2c3"
 S = "${WORKDIR}/git"
 
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".2"
+
 do_configure[noexec] = "1"
 
 LDFLAGS += "-Wl,-O0"
-- 
2.31.1

