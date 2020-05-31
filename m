Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.17670.1590940471702098929
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j+RIicgP;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id f7so6868686ejq.6
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NRpmxFok+jKRMNHmPc/iPessdOA26FXYDXEFzyxU6m8=;
        b=j+RIicgPYpOgLhf1izlZQ+uWlXWYA5x14sf2zzEodYZc4Fvaw+8VvWit2gbBezt44n
         lZMQCuGO5ZK9CiR3v7mjTCz95k4yW8F0Z30OFuWu+h7DP5kkrslLxHDcun3DWXfh9uxS
         Udr/0EZz0hX894xqknHGr8YgoQurBIZ3kmODyionPdx6SflxvG6jOEpbOmqmybc6Grto
         Bj8eLtIZ3kIIsWWf2pCv6QVsDhZIaF8eD5pHWd3BUsUoNVvRdq3UKyuC882BCaqVWnFG
         5gFB8vACafmTf8fVfTPpRLuasklnqODxPINWYxr4BFHhZJGYWTsuLZdtn6YycD5X2S6S
         OtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NRpmxFok+jKRMNHmPc/iPessdOA26FXYDXEFzyxU6m8=;
        b=fLvfzAIuDaMkSaQhoo5JV3y1cf6ZWoc/XLiodNSrvKiLkJ3VMivJhIZ7lc67WD5pjA
         IwAyE31wW9wI1Rfwb+Yi0tp2grimUW1ulZG2hwKmhrNPIxX9nAQdjDUD5ULmLj/C4n6o
         HBx4V2sgJyQDTDzWJg+9v2OUaUrzbx8Nf3fhg6e4m/KV+8eFkU+UhZAMGfXuaYvPwwas
         zxGiTDbYilVyYPc/0BszCJ6NKNlHmG/8xrclM6vKWOmnniOjJ5jWlKeFjtcUtAIWSbXP
         vijqfLMhDPsDuLkc3gZ5BAllET+vg4jzRwuvK+wrFUcSe2zau1KXP+wl/SrkxmQOWUvU
         Yvfg==
X-Gm-Message-State: AOAM530ZiA/ArXVHzR1/XTOgXAphheBDpMvb9eRx7NnhoXDFsJqzFRF7
	7U1+gDxcS/4VN1mZJ++StbfewRbp
X-Google-Smtp-Source: ABdhPJzG0JTjQqGgWTf1ap8MXnYoW7//0llitUAx73u/5DvFFVcHiZN3VQ8auhIDqi9cRTLx4+g2Bw==
X-Received: by 2002:a17:906:d111:: with SMTP id b17mr6569552ejz.267.1590940470046;
        Sun, 31 May 2020 08:54:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:29 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 70/70] xinetd: switch to a maintained opensuse fork
Date: Sun, 31 May 2020 17:52:54 +0200
Message-Id: <20200531155254.10283-70-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updating to the latest release will be done later.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 6e43f5be6f..8f8f846bfb 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -9,10 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8ad8615198542444f84d28a6cf226dd8"
 DEPENDS += "libtirpc"
 PR = "r2"
 
-# Blacklist a bogus tag in upstream check
-UPSTREAM_CHECK_GITTAGREGEX = "xinetd-(?P<pver>(?!20030122).+)"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-SRC_URI = "git://github.com/xinetd-org/xinetd.git;protocol=https \
+SRC_URI = "git://github.com/openSUSE/xinetd.git;protocol=https \
       file://xinetd.init \
       file://xinetd.conf \
       file://xinetd.default \
@@ -23,7 +22,6 @@ SRC_URI = "git://github.com/xinetd-org/xinetd.git;protocol=https \
       file://0001-configure-Use-HAVE_SYS_RESOURCE_H-to-guard-sys-resou.patch \
       file://xinetd.service \
       "
-UPSTREAM_VERSION_UNKNOWN = "1"
 
 SRCREV = "68bb9ab9e9f214ad8a2322f28ac1d6733e70bc24"
 
-- 
2.26.2

