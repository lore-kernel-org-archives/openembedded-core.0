Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.6434.1623744772810705656
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rGFF4yIF;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id i13so49903623edb.9
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jpfv0Ne3obgEf7bCBzq4urVKuQ0FfDS1wHKX4CQVqCE=;
        b=rGFF4yIFQfb6rZpSyn66P7+1avs6r1U4PQb/5JO7klwHjtO1QNOIQ3vidJ2VF9potc
         8W0wz0poeW3GN8rCz1ruzy0xBoWaSAqR8Iip9T+35ldqjH4F2AsiR4scQu2t/OImhfuX
         uMQH3DLjq1SQ+G+Xv16pCJaZRJGy5ci/kXUSnIZUne7lJBgrh7tzJnvR4qb+tSva2/ff
         jilth3SWDsOzfKTr8pBkfwPMadcZvzDAm91YRkZrdFjcuYEqlpe3X/JIpO6FuUvagViT
         UJ/gnc2e8qOTXGbu7enEQ/jTFRTxkO3i1IjwujwIgQc5Uz44W+WZKzGCz4ZB347z8Iku
         c7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jpfv0Ne3obgEf7bCBzq4urVKuQ0FfDS1wHKX4CQVqCE=;
        b=jMxXu6rd2rnDuLh3tqgULGtef9qszBGGqjWkhGzhRga/474BV63V5rQ4KsCIbH52ub
         FXVf7IOXextpXLG8S5Jh/a6HRao52GAK7r1PBvcpFh80I+rjqbd7XRC6Oe+Ge8nZGC9K
         gjtzW6zDIxZu+p91k5qofJJLjMWmNh34WI2DUmRW+dYlS07vX0XHvrzFCcPbYS3Pp/lO
         yzXBQsOZEY93R7h5Q8tP8rUXBKKuhbGxg/uo5hIdfPIpEeSXpBH7uNMpKqTez2ATSJVx
         yzeiHtAJAWameySd9KCXI8KhwNetCNeNHbjhJE+oBrFvH/0L6eYkpCo8CnQVrWCQhwTH
         CtxQ==
X-Gm-Message-State: AOAM53104R4T1KQLuwBcJevMsFXx7rjOiTro9vNmIxw59LrcZafheH/T
	i6Wpr/OnanWxPN+Dw3t7T0AZw1B+dKZdlw==
X-Google-Smtp-Source: ABdhPJyOjG5EIRjyStpQwaNeZXQjSqeUxvjjbLD+/ktYc4zDw9O+LbMDZK2xXH2qjJ8XRA0cLGqCpA==
X-Received: by 2002:a05:6402:3082:: with SMTP id de2mr21170838edb.214.1623744771251;
        Tue, 15 Jun 2021 01:12:51 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:50 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/31] apt: update 2.2.3 -> 2.2.4
Date: Tue, 15 Jun 2021 10:12:18 +0200
Message-Id: <20210615081240.1734087-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../apt/0001-Do-not-init-tables-from-dpkg-configuration.patch   | 2 +-
 ...1-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch | 2 +-
 meta/recipes-devtools/apt/{apt_2.2.3.bb => apt_2.2.4.bb}        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/apt/{apt_2.2.3.bb => apt_2.2.4.bb} (97%)

diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
index a9a8eb6306..72713c3b1a 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
@@ -1,4 +1,4 @@
-From 5fb6355c7dd00c97fe90e805ace075b6e9b6952d Mon Sep 17 00:00:00 2001
+From c7a79e753e50f1a5f248ba5812c61616f2f524f0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 10 May 2019 16:47:38 +0200
 Subject: [PATCH] Do not init tables from dpkg configuration
diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
index 34d0c4b4cd..1517b47858 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -1,4 +1,4 @@
-From 76f8386cac7f13688b386686e0b1fc4b1b574f53 Mon Sep 17 00:00:00 2001
+From 393ac20efc66bfc000a2457e093e369b934c5a50 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 21 May 2020 20:13:25 +0000
 Subject: [PATCH] Revert "always run 'dpkg --configure -a' at the end of our
diff --git a/meta/recipes-devtools/apt/apt_2.2.3.bb b/meta/recipes-devtools/apt/apt_2.2.4.bb
similarity index 97%
rename from meta/recipes-devtools/apt/apt_2.2.3.bb
rename to meta/recipes-devtools/apt/apt_2.2.4.bb
index fe00fb03ca..f120111410 100644
--- a/meta/recipes-devtools/apt/apt_2.2.3.bb
+++ b/meta/recipes-devtools/apt/apt_2.2.4.bb
@@ -26,7 +26,7 @@ SRC_URI_append_class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "2880474bc08c79f103cd30d24a9c30c78b480c65076e466d24df93b9fa05ab27"
+SRC_URI[sha256sum] = "6eecd04a4979bd2040b22a14571c15d342c4e1802b2023acb5aa19649b1f64ea"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.31.1

