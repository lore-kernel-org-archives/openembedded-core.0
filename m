Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web09.9541.1603981700277230275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 07:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JeqyyLGO;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id i1so3036202wro.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 07:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h8tqSCqPfCJHQZ5CkHwy7kOXvNjikLEyOufMELIfRIM=;
        b=JeqyyLGOqP6UB7MgSjBm5s+sB4HW6eYXn1VET47sYRAltZ4mDSojIgRgs4OnO8Ay3h
         qhS7zHsW/ikG+9MdTS9ccquBMf9EaurxyBh7uCTBk9CEQAeMEgedDHUpQ/zaw204g5Rc
         xI2cmqMxjUeZQ/udee4bSZcq7Ge1Wvb3Uf5SJFQPqQGac1AiaN9xs1ftZHiGVdLA9x38
         mvH0B3d5hd2nxn5H1GKPU6GdTgh25zW8GDCkZC1UubQhUQiXQWJyvr9SnA3O8fvtO2KC
         heGqfFezZThh9s86srBPUJ4dN7/0VpOziQyIUF7qvODyh+tns7bRji/L6seIiRr700H/
         f/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h8tqSCqPfCJHQZ5CkHwy7kOXvNjikLEyOufMELIfRIM=;
        b=U04+BnUaeBRRzhi9zx0NiDTow4JOSYVSurGiyTVCL2g91uadvCiiDg5S3liolsmTj3
         LtOLFrDnAyr8jGLrKnQko6xXGci06ApQVwLw1TuvutO/pI48Dh7wz5jLdgfyBpi5h3da
         hBWrJwI6F2kP9YX7wLCSmrCNik+NvsfflVDwZqtuC1qjlwwmNiWF6OghxMZOzQWTa/Ot
         +dXMM1svo6PVVcsNqrDDi/je32e1167oUA/RllHkGBHAkIC+Ng50CmjhxsYo0APXpaVP
         DV2mYDCvo3FYNRokubi69ucuyQcII8AFHjia2yLNkSl2zPZZJqj+PeKhALqdD1kdXdLT
         wEPQ==
X-Gm-Message-State: AOAM531ec+kJYEp/KFq+Kp9BQ3ro++d+MWV+EzkqkeOVGoxr4z8vo6L7
	w2nchRNJ0XkYZQvMmJQwT7xCMfm2L1y2AQ==
X-Google-Smtp-Source: ABdhPJx3ZUf5ucEnZ9VqQrxu/5pkQTn8PPR0NWRB8fcR11pDJ3ycVCyF7Nnc6bytX7tgP5l1XRICZg==
X-Received: by 2002:adf:ef02:: with SMTP id e2mr5631717wro.381.1603981698701;
        Thu, 29 Oct 2020 07:28:18 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id y4sm5404803wrp.74.2020.10.29.07.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:28:18 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 09/22] gstreamer1.0-plugins-bad: disable new meson options
Date: Thu, 29 Oct 2020 14:27:53 +0000
Message-Id: <20201029142806.1830504-10-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029142806.1830504-1-quaresma.jose@gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
index d209107805..903ca920f2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
@@ -100,9 +100,11 @@ EXTRA_OEMESON += " \
     -Daom=disabled \
     -Dandroidmedia=disabled \
     -Dapplemedia=disabled \
+    -Davtp=disabled \
     -Dbs2b=disabled \
     -Dchromaprint=disabled \
     -Dd3dvideosink=disabled \
+    -Dd3d11=disabled \
     -Ddirectsound=disabled \
     -Ddts=disabled \
     -Dfdkaac=disabled \
@@ -113,6 +115,9 @@ EXTRA_OEMESON += " \
     -Dkate=disabled \
     -Dladspa=disabled \
     -Dlv2=disabled \
+    -Dmagicleap=disabled \
+    -Dmediafoundation=disabled \
+    -Dmicrodns=disabled \
     -Dmpeg2enc=disabled \
     -Dmplex=disabled \
     -Dmusepack=disabled \
@@ -124,13 +129,16 @@ EXTRA_OEMESON += " \
     -Dsoundtouch=disabled \
     -Dspandsp=disabled \
     -Dsrt=disabled \
+    -Dsvthevcenc=disabled \
     -Dteletext=disabled \
     -Dwasapi=disabled \
+    -Dwasapi2=disabled \
     -Dwildmidi=disabled \
     -Dwinks=disabled \
     -Dwinscreencap=disabled \
     -Dwpe=disabled \
     -Dx265=disabled \
+    -Dzxing=disabled \
 "
 
 export OPENCV_PREFIX = "${STAGING_DIR_TARGET}${prefix}"
-- 
2.29.1

