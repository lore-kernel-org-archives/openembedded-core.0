Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.47673.1600033968065604005
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 14:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iyGvXGWw;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id u3so4327536pjr.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2020 14:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8t5RcKqP+9XXPyrsQ948lUIU00yeMBzsXNRNRtlkjLs=;
        b=iyGvXGWwAnqL9F6FccNt+IQg/pPSG8bia9GwTLd8sWczikYCYBKi8MKjgcG9fZjCGC
         OMSPjKqrIE2Vo+qmtcxV6e8QELmXHEHAxrclghIEG7fMC3lIv9SP6Xk/06WKWbei3BLW
         bzba2pdLau5lctHEy5HqofeuvJtJPIa8ygWgBokAwGb+Af1diS26LgQr6beavhMAJu23
         zsshQH/foSWBGKahAFbXVBN8ZlmR9KWfChY7uqMSLLER1tx8ZZtLWua2yO73pBs0II5J
         6vDK0v1jtzL72OPHl6oxAlkXqxSMR+HomAJyHkI+tHPebkipZDwYpK1nZebwA49izpoq
         NEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8t5RcKqP+9XXPyrsQ948lUIU00yeMBzsXNRNRtlkjLs=;
        b=rtHT5M0VA0QvzG1msEA2oGd5ZKsbIcdq0ogJAUMo79tXjX3s7uh7iiXQ0X67PwLbze
         dJE/EoFuYpV1EIVDWNYHxyZM76HNJFMAQiYn3Jv6wMo05QbeDkNovUCPTAsUo6fkr5ad
         veXVifTqALBch98OJ2MqqlbCjv+xkE/uQSpYD+CiCl+bZ26Gx9zaKvQAwM0c3/5yKzY9
         h9XuE+XmLz1jCw49DESZuEhcURbRO68ovgPyr8J3fiadQHX2OuxIAHkraPE8UcjDdtFK
         KYGwfURYvmxY1T3RKEhb3SsaJNTn4Qhvvjczg6gf1oe9TYhkAc14oGDkyLsndcV6DptU
         y6wg==
X-Gm-Message-State: AOAM533C9zGCC2pGc5PPki7rM/v7jWVjIEXKbeZajzgQDnSnRs7okl+g
	6vWm/j/R5gkF3FwvDdUuQHTNSFFXGiQ+8A==
X-Google-Smtp-Source: ABdhPJx2r6r0H6/IJiX7E+ZG6nJ3zByNbNbnjN0FUjsMMO+dh560otkNBely2DT6YmgicBPM9Pt6AQ==
X-Received: by 2002:a17:90a:a60e:: with SMTP id c14mr11601031pjq.31.1600033967275;
        Sun, 13 Sep 2020 14:52:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1759])
        by smtp.gmail.com with ESMTPSA id n7sm7997364pfq.114.2020.09.13.14.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 14:52:46 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/4] weston-init: Do not use fbdev backend
Date: Sun, 13 Sep 2020 14:52:41 -0700
Message-Id: <20200913215244.3825034-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This works ok with latest weston/kernel to use drm backend

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No change

 meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini

diff --git a/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini b/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini
deleted file mode 100644
index 17ebd7fdab..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini
+++ /dev/null
@@ -1,2 +0,0 @@
-[core]
-backend=fbdev-backend.so
-- 
2.28.0

