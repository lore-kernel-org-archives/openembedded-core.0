Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.22525.1625671050427272476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 08:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NWhsqcqJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id q18-20020a1ce9120000b02901f259f3a250so1944779wmc.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ElBKzA/sCDPJWgNEMjBiRnm7MV+x+rYUkffg41T6ZS4=;
        b=NWhsqcqJbIdNCn7Th1i7xmKYXVt1I7Hu3slsVwXbB3UtPc5wEQdub6d+Wz5GZK2tvr
         JvaZVnXEAzxeXIlyDwMR2a+E3Gozgl5ktGOY7te/PFxMYo5hUqmrccv8bQiT+tprCOM1
         g6h2cvkmMEr44K5TvH+3ejx0O6ARNQ26VmfeukycrCWh1ChGMAsOGSK/k1mzi4iZq7UT
         dVDFovjke5KshLdhOy0kP0j8nIcBHLYyFj5MxSnGlXkr94rivB7Ew4P4d2Hul2LToanU
         gmeuSNqxoS/j2JjH3o/fsYzp3YfDGW4+fjv+sxyb22xQiD+4GEuJ2gkMSIIx68kkpyNk
         u0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ElBKzA/sCDPJWgNEMjBiRnm7MV+x+rYUkffg41T6ZS4=;
        b=LlsTuFhFBO4NpICZg8PXbVYHC9lMvVYhU6M1ZudfGo6brocXY7hzjEunKaxOlPOK2H
         L9dbclrgEQRH3FRyfECccwhlmRNcvEHls0S+EH7wljwZ2qHVbIxbrMZa+rvjMyem5Xbs
         w+6o2frYvFZUruk2WL5aKJnuSclNBMQ8gmziN13Fu8ILJ7Y3dBRhrE0M2ZEJUs/xym1q
         b23PQukz76QdBR908wQwZKqGAqeazvknDl9UcpjwAAnoNC9KsbuM5+pTksDk/DlY6asL
         WllfdTrxrfJkYSEE0OUj5byrqT4bP6CyJHYouCYqcVsKHSQSjVB/a4Q5XnwI8IA9GeeH
         kpIQ==
X-Gm-Message-State: AOAM531e2THly7AnspRJIJm5QsEHCjHYLh9no5z83VnqZv3uyTxxUg4l
	XPn0ws+8lxjZQl0FxcThqVJ0HSsUYdH6CQ==
X-Google-Smtp-Source: ABdhPJzJj5hYLo/YDqJk/dmo4/bupQdHVFmviYQiErnpFECvRdGz2QxRR3e4FDBBtExvtrjTFSFqXQ==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr27295963wmc.163.1625671048939;
        Wed, 07 Jul 2021 08:17:28 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id s17sm20272043wrt.58.2021.07.07.08.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 08:17:28 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/2] xwayland: exclude development snapshots from upstream version checks
Date: Wed,  7 Jul 2021 17:17:22 +0200
Message-Id: <20210707151722.134952-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707151722.134952-1-alex.kanavin@gmail.com>
References: <20210707151722.134952-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/xwayland/xwayland_21.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb b/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb
index faf166f788..f5db7cc5db 100644
--- a/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
 SRC_URI[sha256sum] = "31f261ce51bbee76a6ca3ec02aa367ffa2b5efa2b98412df57ccefd7a19003ce"
 
+UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
+
 inherit meson features_check
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-- 
2.31.1

