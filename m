Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.45383.1590469972282444796
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 22:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dogWzzXf;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id v79so9335642qkb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 22:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZcVWpfb2XxbJaxarccDV3SWnupShcyf260no4uwjtfA=;
        b=dogWzzXfoCmxCAE20fJTxDuw+CBBP3kWsP7iBxIrkzWpl/udC17K4YoEDOQ0i29LzI
         F9psuJOmNZfMwH6Jgl8Aiz5CStmnLt4pKMxQLh9j/ygpcUTQUYMOlUpSP4ut5zy+3NNK
         4DydCl2j2PHavkUIRz5ZuaUDQEinM+RG2HzxDjMuhVCmyUxph5PjNIsDw8uSWzXdCOpb
         0BTGC7NooWjrVUmkPobfMKWlytqH2QJlzYu9Nzl9TyqSrfYuYn+JdWhOAnEqz624Dk+y
         NGEOdNhLoFfH1WQxSL2dgnu98q2guTevkFE3H4mKJ1tMuz9DBoLEHUNmTqiFf8Uz/jmv
         3qiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZcVWpfb2XxbJaxarccDV3SWnupShcyf260no4uwjtfA=;
        b=Kypich45tYPh1GDE/htFABR9A1Tjx4i87hOLAtOnHg/PNMe44hnUkxOqd1LhQQpFPY
         1Iw/hynBfRLDsu0VXljcWG9g5idJvdH3OG5fETxcE50+nbEA6vMy4BiTVAY5BdPlJEuq
         KS5t3irW4RdoJa/XauIP+nNH+goBEWB4BG2nTya1+hS0pDSEvjivYrYypjkr9RSwYMzh
         VZ53CNhiw11SUpkrq+JF2cPecGpBv//S1RVuBm8kNnV/mRgBqTedK7DIBIJJ6D8VQSQ0
         EjfM7o0UdPD7jrBee93+WFjQ6FEVcRPTc3RnD03uOBOFhAyXUALR0eNduylaxuSFwIDt
         UKUA==
X-Gm-Message-State: AOAM533LPNx2L0Ld0C+i5/dlVWaal7ja7Ru0gmo67SLDNOQCP+I+wfRD
	FHp+HFxvDOnqMcgHehwURWyj6mjM
X-Google-Smtp-Source: ABdhPJyPxOOapbt1koSpl09WkBsGLsftIr/L6pYsFc31aDu6X2ho5EGxzOKQRFAS6YD9ZgaUHw/FKg==
X-Received: by 2002:a37:e50b:: with SMTP id e11mr31961563qkg.224.1590469971275;
        Mon, 25 May 2020 22:12:51 -0700 (PDT)
Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mbedesk.sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id c197sm16091869qkg.133.2020.05.25.22.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 22:12:50 -0700 (PDT)
From: =?UTF-8?B?TWF4aW1lIFJvdXNzaW4tQsOpbGFuZ2Vy?= <maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Subject: [PATCH 2/2] python3-watchdog: add a recipe
Date: Tue, 26 May 2020 01:12:16 -0400
Message-Id: <20200526051216.14143-2-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526051216.14143-1-maxime.roussinbelanger@gmail.com>
References: <20200526051216.14143-1-maxime.roussinbelanger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 .../python/python3-watchdog_0.10.2.bb            | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-watchdog_0.10.2.bb

diff --git a/meta/recipes-devtools/python/python3-watchdog_0.10.2.bb b/meta/recipes-devtools/python/python3-watchdog_0.10.2.bb
new file mode 100644
index 0000000000..a0712f43a0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-watchdog_0.10.2.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Filesystem events monitoring"
+SECTION = "devel/python"
+DESCRIPTION = "A simple program that uses watchdog to monitor directories \
+    specified as command-line arguments and logs events generated"
+HOMEPAGE = "https://github.com/gorakhargosh/watchdog"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[md5sum] = "2477fb59dcb110b8562eb4eb973cda23"
+SRC_URI[sha256sum] = "c560efb643faed5ef28784b2245cf8874f939569717a4a12826a173ac644456b"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "watchdog"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-pathtools"
-- 
2.20.1

