Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.1514.1618011940316991295
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 16:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p0qesbz0;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id y204so2297447wmg.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Apr 2021 16:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QsncUJMFMkO/d4bXOdmSXugwcvtWalT5fIuUT6tbf8A=;
        b=p0qesbz0I4LLoWYgOcuTFZHhZtdHgpRbc9iOX5KdZVZIgFyWK8SWRvJLJ587Hj0h1q
         U5VZtsf9tKRQhKPA0bUE1mi8nIEX1+UKpmxfmQKCYqh32tuujv1i1NRkSWBiqV2Wj+Om
         Ome9+lYlbE2Z6LSF6e4AAo5b6hqhQXn7ELJUJPtFG8bmWP0GDqGQ6g0AHGYXZVY0PMiF
         oDmWMBq8a0Q1PnNw1vBatskQ3x3cuVzsqbWOb/PdQp+dYtQf8X2EPKQUgzgfvkcM9srO
         oHMH3Hcb8sejuShSOlR8TVPxcqEssDjz9SkMtHboo9ytmYH6XnJDUsl7/pup7CCNgJyw
         MYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QsncUJMFMkO/d4bXOdmSXugwcvtWalT5fIuUT6tbf8A=;
        b=NXoPvhD0IzTEOz1D77WRbbZ4+ZnNEyb4oeVyS+vI60lT9tb3HJKmYLuWpaH0ftgHrI
         rfBUM6oAnCgULc8W3zw50NTpDWYCBfJDMmos2LAMFXfv4C32j9Mx1wxoM1Yu4TMg4FDU
         n6xXlFEXrnmdYX074TnBu9qIm5SVXlztF6kcutWdR7xrTjQfxZNPxyrvJnCvDJxaX7rD
         aoZdMUi58YP2R1mPGNDChvua4U4zV4HJYNF5JCMxoE7s3jC7/5nHgYloePvwGynHBSTv
         H8V+VSDTqGE3ii4z5Y8cBa5G+danbR61A8IUFtinM7QPKBL9583U6ykwouUnVPksiNmf
         nZgQ==
X-Gm-Message-State: AOAM533LWDAlQP6Vy9vzTTE6HG1SH2mn9JHYrGu6r4KhxdbS58R2k3ul
	ew7De4uta7k+9pQjT4/9rgzdiRzypXdFMQ==
X-Google-Smtp-Source: ABdhPJzS+T3DgPRITYdTe55ZRbyLyzNoYGR8Dq7nQryGV2ne1L9+i02XZrHwQHrWATxCiM0J/GO70g==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr15688438wmh.151.1618011938304;
        Fri, 09 Apr 2021 16:45:38 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id f20sm5667951wmg.36.2021.04.09.16.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 16:45:37 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] gstreamer1.0: update patch upstream status
Date: Sat, 10 Apr 2021 00:46:20 +0100
Message-Id: <20210409234620.63671-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...st-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
index fe58e718a7..23ebd5c600 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
@@ -12,7 +12,10 @@ environemnts, regardless of whether one pointed to by the env var succeeded or f
 taken from:
 http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch?id=0db7ba34ca41b107042306d13a6f0162885c123b
 
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669]
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/9f958058697e6fbf5bde325228034572331d1a3a]
+
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
 ---
  gst/gstpluginloader.c | 15 +++++++--------
-- 
2.31.1

