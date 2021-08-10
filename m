Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.634.1628617565893165958
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 10:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZKdFsN6B;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: geoffhp@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so5362599pjr.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 10:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jjPjqZvVLNszNhASbc6yRD8IW8S64S19uL40dPmjKys=;
        b=ZKdFsN6BkaJncljNJmcjsrLIYj2pey5yEDWeExw4QLzC8HUCyjP5mTxeifeLx8X1PH
         b204WqGIYOOu7lNZC51lvKs8sWRwGN//SODFVgpjpOj0DvACnLhhncYudHhTQGvfRpfm
         LXlf9K91Um8JyRJbgcXKHIJDfDPQNVnRVSz3zyH0/jkJ/4i7PAreH04RqY3HPIeyy2TW
         H0PQ6ZDJ9wmqppFlWtPN4ceHT5YOdKiHCv1rHYFsbU8VBcWsqF4MbPEYvv/f82vdx1XJ
         EyMPcIQdfO9NoTRtxXM18FSE2w1vnYtHYkgHkzFcoLOBmzrSZbaiqeyPOrbFeB9pIqN9
         xQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jjPjqZvVLNszNhASbc6yRD8IW8S64S19uL40dPmjKys=;
        b=t3GszeLYA16HPjQ2R0EWjRwJJXFlhG/Ev5NqMvYb3B1IzWeya2WVzXoCOGWrlj2oNI
         GlaIoEPEzm0JNAza5/1GvltY8heiM9Tvsb0L+GNt94UcxMcDH4OA7kbW3YdS5E/EM19m
         I9tK9L5zftZk7SRUyvqRuyv1bmckWRQWEV3coEXpnnmq+UabuNIOy4uwhtF2jeId2AGn
         52+fSuazjB1LuCvkR1t5+p3ZxhUcyb9pHQQDk5akaQrPZ8g+xAn6dRU/PAIfX7hMFPeI
         YIK5FEAfEewNULjPI65D+caj2AJheBAP7s3DyNSSja7WwWtIo3F1XxhG19Gf8+mCgq3e
         kUsQ==
X-Gm-Message-State: AOAM531ZK9q00TU+gJBH0OyFqEcxU3weyRMD38oHxTcbGuhL9/ma/sj0
	xyOVo13D4S5z9hOWUn4eZc0r0Vqtf5KdPQ==
X-Google-Smtp-Source: ABdhPJyClXy7weUUhaFsQQ1+2CmeJfhEwoWtJuHmGIHH1/gJnzp70BL+Jf0r/v2x7RzKYwpQAPBJxQ==
X-Received: by 2002:a17:90a:db44:: with SMTP id u4mr6142452pjx.180.1628617565072;
        Tue, 10 Aug 2021 10:46:05 -0700 (PDT)
Return-Path: <geoffhp@gmail.com>
Received: from localhost.localdomain (cpe-107-185-48-203.socal.res.rr.com. [107.185.48.203])
        by smtp.gmail.com with ESMTPSA id y4sm3855917pjg.9.2021.08.10.10.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 10:46:04 -0700 (PDT)
From: "Geoff Parker" <geoffhp@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [PATCH] cifs-utils: typo fix fakse --> false
Date: Tue, 10 Aug 2021 10:45:31 -0700
Message-Id: <20210810174531.2359601-1-geoffhp@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Geoff Parker <geoffrey.parker@arthrex.com>

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 meta-networking/recipes-support/cifs/cifs-utils_6.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb b/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
index 54aa3ce19..a8d3e91eb 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
@@ -26,7 +26,7 @@ do_configure:prepend() {
     # want installed to /usr/sbin rather than /sbin to be DISTRO_FEATURES usrmerge compliant
     # must override ROOTSBINDIR (default '/sbin'),
     # setting --exec-prefix or --prefix in EXTRA_OECONF does not work
-    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','fakse',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
         export ROOTSBINDIR=${sbindir}
     fi
 }
-- 
2.30.2

