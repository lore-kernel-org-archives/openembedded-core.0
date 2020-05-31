Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.17625.1590940423074019520
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E9Bz+LAi;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id m21so5383468eds.13
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=auBkgn8x9hOy3InAcRQ2PIsq4Ve4rXh72pCPNJZ8E0s=;
        b=E9Bz+LAiqRYTd/ge+YqJSCS/NllhR1O2I0w1ObD4hlAQt9sUKP9SriT5MAWvXXZQI7
         HPbJcv3AlQ1MDHx9sJkx/ZD6Cdjcmng4bOY6VdpEvrOj1HCtRmclF4CxXPJbpwFgzqz2
         5yI11jQBBAI+Qkc3VtBdLIdfktnlJoYXibH+2AWh0B1e0EzzK7Ym7AEBYCQWKPNmep/O
         yWMmgfjtf7vxjFEhvhuK2/j8Ovk1DS8ugFY15BwZCJC1zWvWVgRQzlG4BT4p4ueBO1c+
         r1vG/aQS0n7R7xDO/XB5XaIgWwiMJiX+SQRxwahWZOEmVQ1hvB7o19EQ6VSWcrMDPRjN
         TzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=auBkgn8x9hOy3InAcRQ2PIsq4Ve4rXh72pCPNJZ8E0s=;
        b=MA2R/tOorXaT1jH4xCxbrs2qDJw7ixgIE67ILEgWdrP4b5LH7xL1t+9Ojxyi2jVcLC
         +FWlCwuhxZpxfWZ/GdWSHO9FtzO/u2LAArBXnf8dZbDs9BxYTyd1xReedrO3bAwr5OVh
         AD2OPI1JlK+XHolKQG2LSA86HTmD46R8eXITAQ2l82rQsahgb/Wp10GGuRE6pXrhjS8A
         x2Af2UrnBnpAvLL21z8PGyQ4sM8fHLoPHmSAr7qERXNAh1NFnGunKOnG40b2IU3AqQ99
         dreivmiypBnuWdPurIYtJv35U1oNbyZz98cZIWLVmYghLyFkBxAIERGVpuoXwT1ZwiLV
         FqdA==
X-Gm-Message-State: AOAM531q6aE+o5Aae25rR9VOhsLtEjy/BAZmSPuOGtvv95E3LjQKe8ME
	mSjc1qnlOWWqZqEaHokwevKu7tTW
X-Google-Smtp-Source: ABdhPJxjzTdAEP9wtGPRj4jdadnWILxB55l+PLkiUj8JsVHQ8N19BEwSQEU4J8TcHzK312BVdI4dFA==
X-Received: by 2002:a50:f1d9:: with SMTP id y25mr1225165edl.292.1590940421467;
        Sun, 31 May 2020 08:53:41 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:41 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/70] strace: upgrade 5.5 -> 5.6
Date: Sun, 31 May 2020 17:52:01 +0200
Message-Id: <20200531155254.10283-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../strace/{strace_5.5.bb => strace_5.6.bb}                 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/strace/{strace_5.5.bb => strace_5.6.bb} (90%)

diff --git a/meta/recipes-devtools/strace/strace_5.5.bb b/meta/recipes-devtools/strace/strace_5.6.bb
similarity index 90%
rename from meta/recipes-devtools/strace/strace_5.5.bb
rename to meta/recipes-devtools/strace/strace_5.6.bb
index ae552da028..53679cd0d2 100644
--- a/meta/recipes-devtools/strace/strace_5.5.bb
+++ b/meta/recipes-devtools/strace/strace_5.6.bb
@@ -15,8 +15,8 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://uintptr_t.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            "
-SRC_URI[md5sum] = "dbce2e84632b39a4ed86b9fc60447af9"
-SRC_URI[sha256sum] = "9f58958c8e59ea62293d907d10572e352b582bd7948ed21aa28ebb47e5bf30ff"
+SRC_URI[md5sum] = "f8e0394d4e537b3faadf0a72f5d1d17e"
+SRC_URI[sha256sum] = "189968eeae06ed9e20166ec55a830943c84374676a457c9fe010edc7541f1b01"
 
 inherit autotools ptest
 
@@ -27,7 +27,7 @@ PACKAGECONFIG_class-target ??= "\
 PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,bluez5"
 PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
 
-EXTRA_OECONF += "--enable-mpers=no"
+EXTRA_OECONF += "--enable-mpers=no --disable-gcc-Werror"
 
 CFLAGS_append_libc-musl = " -Dsigcontext_struct=sigcontext"
 
-- 
2.26.2

