Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.4106.1588240726353807183
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 02:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YPWnqfjA;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id d15so6121929wrx.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 02:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kR0lBFMYlXv6uxBopZJ4/htJy5N6Uc8Zys6757OsU/Y=;
        b=YPWnqfjAea7P2/2McKB5lQGkhlcBmB6CJtuemohFAIaG0PNfIHl7T3KGQZp6r3mpIh
         MaTEiaWwx9GUgY+7Upj+8vq7qaF4yG61i292Nil3Q4u/TA+tUmqk3UDPVuuhd6z2zydN
         7FtR1JqO/eBdMH6roeWcGOUAGgg51et6G/XUtqJOdKbhopMm4a/lbxQdYf3hALwanFWq
         LSc+HpCj7KoVipiQfASPb+MILT9QbAAEn0slOu5V9zHv2BmlEp6ERPtcj6BNFTBEdOOV
         anOti5w2IfGd2gYNROaShqV4JiF1Y+4izliFYVQPNhNEozcWOVsykkYRFNCc0YH8Jm8R
         jRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kR0lBFMYlXv6uxBopZJ4/htJy5N6Uc8Zys6757OsU/Y=;
        b=a+15934DdwKzwSU6JgUFYOrYC4Z+6AML7cNWtATcN/2kyyy49M1ivDeRvVg106nHV+
         AeYRo1AueyXcBDU2aob4B8zexg+jXEWT9ctrHu3EycxVkcqdHjBR3FJF11zjjZLmxcGD
         SsqQZehfstAhJJzkYgkhR3yAJhuQyMXwNxRgt1oYisfM6WViBjxfwb+GtAJXTT+E0IU/
         yLb0lYylr+5vgdf7rsNlr9xo7YK2yQs6CLIiDWU60Ce6Rk+/acSet38F+SE4dUpPRrAY
         gZzCmPLDX8GGWRKzuH+qXpA36RxDqSR+Z2Mo6R5Q2e0f7Zwjh9v2ztnAf4bQKN6ZdNIF
         8WZA==
X-Gm-Message-State: AGi0PuYvd5CqxXevHY8u+MNHvL1NmDR+0SHOxYqMS57S8rawXvm//+E/
	hLnlgl/aLd+sEDPchTaXubwGBt7J
X-Google-Smtp-Source: APiQypJo1mUQ7SFqkPTW3mg1CQs0PNZPI87umfVxT7gQOuZOv5Eb90KheKjomMyTdTWAK5osEIuSbQ==
X-Received: by 2002:a5d:554a:: with SMTP id g10mr3235185wrw.204.1588240724774;
        Thu, 30 Apr 2020 02:58:44 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id b82sm12380682wmh.1.2020.04.30.02.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:58:44 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/17] glib-networking: update to 2.64.2
Date: Thu, 30 Apr 2020 11:58:15 +0200
Message-Id: <20200430095815.2824-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200430095815.2824-1-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{glib-networking_2.62.3.bb => glib-networking_2.64.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.62.3.bb => glib-networking_2.64.2.bb} (88%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.62.3.bb b/meta/recipes-core/glib-networking/glib-networking_2.64.2.bb
similarity index 88%
rename from meta/recipes-core/glib-networking/glib-networking_2.62.3.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.64.2.bb
index e9596ce1a4..8300d20e0c 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.62.3.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.64.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "a758ca62bd54982a798b39c744cbf783"
-SRC_URI[archive.sha256sum] = "8ca1f86f23a76b5c7640624f7d5490705c78e81375e1741c9a1c41ce7f8f7ff7"
+SRC_URI[archive.md5sum] = "7f8c7ffe2616be4ef4232f2574353dab"
+SRC_URI[archive.sha256sum] = "45def0715c551f9b0b41a4e4f730ac95f3d5d4f3de8162260fbf9421cff695a7"
 
 PACKAGECONFIG ??= "gnutls"
 
-- 
2.26.1

