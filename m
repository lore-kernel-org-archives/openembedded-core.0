Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.26134.1599944651353783554
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 14:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aF9cAdRq;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id s65so7627266pgb.0
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2020 14:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AOvUQOwqyUTjNwb6Dpry5o7htMGvSt8pf1+2bWu8n7M=;
        b=aF9cAdRqRSeTJo83zyhjfon5D18nvba7QR0gC+v9tKbAsZS4HKZfjGO4CsOBxf8/xy
         rygnhB6069stUZdMDHaJ0kTi8dLxUfZRc0N0pp/owVaSz8nA4mCn2Su04ZJVBPGWbiI0
         TVkee/hqhBy7fY5szsIpuo3EofEOA3WMJsdrjmx4EupeRjkjRjI0rJBIy6iLMOg5tjAn
         YNngLw5U9WTQOjCyms7u2ae6wgjRbXkmRqh2g7IMR2WTO4JbQWPuvOFyrMKOKl94fZGK
         PJM1UxD7vPQkHFV4O2XCz8m2uRrac5YYTFCSSJMpuDlVzJOQK5ZSNHijIevA5zwvOLnt
         iaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AOvUQOwqyUTjNwb6Dpry5o7htMGvSt8pf1+2bWu8n7M=;
        b=mbPRO9JtuCmgIfZ/42LLkAnIykr85hX454CJgSAsJg0IKl5PkkiWGfPkqpBCyEkGaJ
         ETXRPRVjog9NAW5p+m+/jluy8vYZi1RhWpTtXe4XYcgD7gXp4rKn995p9hot2k54EZZh
         fXSbKiv9WptFlRmIJMUJMPsIDDkRTlAfIcYZgGQ4xyC1vL3YRabem0D36cxb7gXU8Gq3
         10AeFIWbDW8IfV5wEFcq3OnOWDdHG4DiGY827m9zJJnbpJRtw1f37OXsxETh8K+ZfGkE
         8kzqnOl45Tv3VTz71E8UE1YpebvqtqbObRpXJvAc6jCky3byERag/sSAMFJlPaGSN7YU
         gJeA==
X-Gm-Message-State: AOAM530BoLKZYQtHN/lLG238ge00g8/u/aScDSEAaiYH/yhqD5/XFZg/
	/UjAQxQUe6TkQGYe7xEimqT0O/PRFSc+tg==
X-Google-Smtp-Source: ABdhPJzV7gj4nOeORL1s5/3oG/9/GpLVBGQo2RaG1DbrL3hwi79sItwv/4taH9LvrSF53vKbv9sYjg==
X-Received: by 2002:a63:1e64:: with SMTP id p36mr6069484pgm.429.1599944650510;
        Sat, 12 Sep 2020 14:04:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id 64sm6271787pfz.204.2020.09.12.14.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 14:04:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] weston-init: Enable RDP screen share
Date: Sat, 12 Sep 2020 14:04:05 -0700
Message-Id: <20200912210406.3328090-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200912210406.3328090-1-raj.khem@gmail.com>
References: <20200912210406.3328090-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/wayland/weston-init/weston.ini | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini b/meta/recipes-graphics/wayland/weston-init/weston.ini
index 1e6dff68fd..b48726d59c 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.ini
+++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
@@ -68,8 +68,8 @@ require-input=false
 #min_accel_factor = 0.16
 #max_accel_factor = 1.0
 
-#[screen-share]
-#command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
+[screen-share]
+command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
 
 #[xwayland]
 #path=/usr/bin/Xwayland
-- 
2.28.0

