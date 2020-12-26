Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.19289.1608974873265165741
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aMvkhyfk;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id cm17so5579085edb.4
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yjGQC5qcxF/FEzsyxOb1Dfz0fJN6y9JtpXr9BPOPUOs=;
        b=aMvkhyfkxymu/Ug6cMU2q/gLRK3JqqBqwqt1Tw4mMMIB1GWg+h2RjtJrUVdL3NDqFL
         tagqlCecvmS2fVhGCSxKXzAXv+7dTtcRbpziYjs9k42Cc6xmZ5u4ELP+dHxYn7Kz4CiM
         p8G1F4kKoRZBl5szIqo+BbUChBnyAR5HmsfoDBG7m5H1d50W+ttLbgvzWqSy7vqBqy+G
         1yJLLtnPYIJF4SDQLHJgUW41zIg8xnxZAo8GJEfYhZjd4CY6mJyOG1GtIer2hlSyaDgU
         Z8dXQI93gYEWZaWIV8CiAub8jWMdC0NsLH11/AzsQnq7gu1QV4AOPs0xp8dWruBxz14e
         +dFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yjGQC5qcxF/FEzsyxOb1Dfz0fJN6y9JtpXr9BPOPUOs=;
        b=g0I0yU918dMwg2hbJw7v+jxCs5YQ74uMjBlS/flO4yylOns5TDyIfk7UhghXuTNoDy
         OhxgKWZJHpCG4pAenqX1XLQBWNNgu3n7qhbbJ/P7xC9CXi+JbHXvvuFvA5CoCJnSJLK+
         bTuJ0+Jz6VgvnAsI/SMdEM3QYLvDOvUZuJIVm038uexawRNQYYvA+lCu6evM+9MwVwV5
         hRZXfIoJGkwE5gWg84QNPEJZKgocj6swNkfQc4RPM2a2nty+tImGzOrPsZVBA77LtZyz
         bRwAO0/qXMEFGbt6BUxK/BZJW8H2jLyG2TMLUkUvztNE9tX9nobK6XV/17f9xfcFINCr
         osIQ==
X-Gm-Message-State: AOAM531OAPJud/GlmMZ0P0IG1xRaLxdjpI5nME6Sj1RVs8Vs2IzOQRGz
	HWnFfV0fRvs08yhBJ4M3QgOFs9MgTXk=
X-Google-Smtp-Source: ABdhPJx+SqyVSNYWvKXp/XGuFKXwcvOJdEyLQUIvhtUUSe1kh+3khJ8apiQkP/LX0naReFshOvO4Fw==
X-Received: by 2002:a50:8a90:: with SMTP id j16mr33903173edj.334.1608974871945;
        Sat, 26 Dec 2020 01:27:51 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:51 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/48] kea: upgrade 1.8.1 -> 1.8.2
Date: Sat, 26 Dec 2020 10:26:56 +0100
Message-Id: <20201226092732.52323-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/kea/{kea_1.8.1.bb => kea_1.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/kea/{kea_1.8.1.bb => kea_1.8.2.bb} (97%)

diff --git a/meta/recipes-connectivity/kea/kea_1.8.1.bb b/meta/recipes-connectivity/kea/kea_1.8.2.bb
similarity index 97%
rename from meta/recipes-connectivity/kea/kea_1.8.1.bb
rename to meta/recipes-connectivity/kea/kea_1.8.2.bb
index 3a2ccf5c1f..3dc4f6af70 100644
--- a/meta/recipes-connectivity/kea/kea_1.8.1.bb
+++ b/meta/recipes-connectivity/kea/kea_1.8.2.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            "
-SRC_URI[sha256sum] = "52020cb16889484b661746d7fc4c7cd88974b1af5b7fc436eb6e69c62eb83734"
+SRC_URI[sha256sum] = "486ca7abedb9d6fdf8e4344ad8688d1171f2ef0f5506d118988aadeae80a1d39"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.29.2

