Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.23138.1619978074468333077
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 May 2021 10:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CubKxkZB;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id h4so3219163wrt.12
        for <openembedded-core@lists.openembedded.org>; Sun, 02 May 2021 10:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HTE8Wac/BgKpOF/Dl6yYriPVp5EzsFj6+Ytv9BECkxI=;
        b=CubKxkZBUq3KHh3FKPXbbIn4KhmKRJT0yU0hsI5W3fNjwMh+77loNY1eDMtTCG3RdM
         fgJUR2/3lNGyQh4eRQcJlQIlFuAa1e1ylevijEuk3zTKq9xmxnc5C04zNkHQ7UlsYYuH
         ibZAejaeSXKw1z+Kd49d/SFgDqRJ43gaSVqjCr4yTA1YVej5U9Y4OkfFQsxOjOlFDr5T
         Nhw+R932v8blvrl1NXPUHfq6dvLrrCJwmuDqb9T42CIcX4j2XyUzU/owBza5fzDudSiy
         NzeN8MGRSVNjP5ukkn9OYZbCiZgByX1GCp5ew0HsY4ZxhwQ+OLc3083praK84fuSaBlV
         jVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HTE8Wac/BgKpOF/Dl6yYriPVp5EzsFj6+Ytv9BECkxI=;
        b=EmrFl2Y7H/LMYcdKnqmBzbCrWoKKDe0jQxOv16aOi4/Gr/ssW56QuV8LXQ9l8hGaPC
         6g+jyIVYVYLqi5lNnGW5q2bwhNya7rOZqCZLJSGMzZ2Cgc7Y+thTL4o9hTJEtroKn/6s
         8RUzvufsZKWkTAorgJygvcuU0SECQ3rHFmdmG/W+tWVJa1q/L+DdasXY/I/SjmG1Logc
         Nxx/vKf+E0TAodKrKjn2z0v5kCkEnKrtpZC5W8tBLsdZYAypHGcDYgSksp31us8qNYyp
         aMEeu91EALSMnrxRkkiLbWATcIoeb2CVxnphgOTPXcVnVSJxm7yp2UNcUXCEdgtlv0Yr
         KR9A==
X-Gm-Message-State: AOAM530oRdCkE+UrIYhGLK8mH83xafwGpbuineAhMooFano8f8nq9JXF
	trxBylThsbPYM7shQvWUq9db1ZPjepprQg==
X-Google-Smtp-Source: ABdhPJyo260KowIqtVibXh9C+K32MFBi7ZopavW298vpkuJMg3a82J/q3td+1ztzzd6/Fu88K88aKQ==
X-Received: by 2002:adf:f192:: with SMTP id h18mr19710967wro.270.1619978072931;
        Sun, 02 May 2021 10:54:32 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id e38sm17315166wmp.21.2021.05.02.10.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 10:54:32 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/3] gstreamer1.0: rename pacthes
Date: Sun,  2 May 2021 18:54:40 +0100
Message-Id: <20210502175441.368688-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210502175441.368688-1-quaresma.jose@gmail.com>
References: <20210502175441.368688-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ests-seek-Don-t-use-too-strict-timeout-for-validati.patch} | 0
 ....patch => 0004-meson-Add-option-for-installed-tests.patch} | 0
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb      | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch => 0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch} (100%)
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0003-meson-Add-option-for-installed-tests.patch => 0004-meson-Add-option-for-installed-tests.patch} (100%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-option-for-installed-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-option-for-installed-tests.patch
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-option-for-installed-tests.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-option-for-installed-tests.patch
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
index 8562070968..b275a3430b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
@@ -18,8 +18,8 @@ S = "${WORKDIR}/gstreamer-${PV}"
 SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
            file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
            file://0002-Remove-unused-valgrind-detection.patch \
-           file://0003-meson-Add-option-for-installed-tests.patch \
-           file://0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch \
+           file://0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch \
+           file://0004-meson-Add-option-for-installed-tests.patch \
            "
 SRC_URI[sha256sum] = "9aeec99b38e310817012aa2d1d76573b787af47f8a725a65b833880a094dfbc5"
 
-- 
2.31.1

