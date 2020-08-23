Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.181499.1598214069237853813
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I1a4mQaT;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id md23so8528251ejb.6
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+D7UVz6o1fx9hzxJeYu/9KHFsgS0QlRYioQzWwx/GKY=;
        b=I1a4mQaTSluo4HwaWYkPGOpBHqRmpWyvVSEQCqR2A3ILSRBrCnV21AOjXfQnFIlZFl
         /svrMWDaGZA99ZY2HjHKg0p7fDUfEokZuoSOBtlGvcrLjgrcel1lFMQslMHeiwAA97F8
         p/t5TIjxsprnqbASauMIe23pNJA3veJXvzqqylOZSG/oaBi+VmtFiahnuf1DdrPUPSAJ
         yZ7WPZMgAAWgE77TLyGozJyXIww9lWzIuz1sjUab4al4HanCfLc4spuCMs5FRwAgsqE8
         QgxwhnNPKgZCqU1FBfyUQDwVaIf1f0T+yW0nOBJF2R3BFitUWp/r8X2k0pR0/2nD79vk
         7oQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+D7UVz6o1fx9hzxJeYu/9KHFsgS0QlRYioQzWwx/GKY=;
        b=kdx3/wnqHNYEojJvM2grIoi+BCTCbOSDY4eNSfwCZYFyk8nXahm7QNun6bj0NCRB5W
         5ikpXshQ0Zw2K+OjJ5V8/xz3aPBbSrF9yEBjFCGUftUt+U6nTPMUOjLj6sz3jxao/9Kp
         Rb8WOHxsn5qyiQpoJknTBRQrVn06YwH4ACzd60Dqz0O9Le10g+D9XYLt9iR1mvpSHCL0
         1zh5tWyJiRxjyyah3gOysdOK3xCyGR7a70MCCMTKa5UFtHu/KiOtPibMdg/GZ6krnFky
         5DWjfCC6FOBUQ+c1heYK9Q2O3GPF9gr/Slb1LYIeJlJy1+TwTeH5AlTTyTYalVuInNOu
         t0lg==
X-Gm-Message-State: AOAM530fywxkwTyn/O6SrkE1Lu64WAjXMHZexGIDbd2h2M7facIYkOeu
	GZhbWCTI1qRGATusCMKLXgFP8KeZQtM=
X-Google-Smtp-Source: ABdhPJxMU+myzQ4FjJSsxW8K2wTpUv6rZwskOSvE242icsLTTuJfnadykBXsbpNbmy3fGkI2RmaD0A==
X-Received: by 2002:a17:906:15cc:: with SMTP id l12mr2783415ejd.7.1598214067448;
        Sun, 23 Aug 2020 13:21:07 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:06 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/37] python3-numpy: upgrade 1.19.0 -> 1.19.1
Date: Sun, 23 Aug 2020 22:19:57 +0200
Message-Id: <20200823202031.24686-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python-numpy/python-numpy.inc             | 2 +-
 .../{python3-numpy_1.19.0.bb => python3-numpy_1.19.1.bb}        | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.19.0.bb => python3-numpy_1.19.1.bb} (100%)

diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index e37ab399ed..0113f4098d 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -8,7 +8,7 @@ SRCNAME = "numpy"
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            "
-SRC_URI[sha256sum] = "153cf8b0176e57a611931981acfe093d2f7fef623b48f91176efa199798a6b90"
+SRC_URI[sha256sum] = "1396e6c3d20cbfc119195303b0272e749610b7042cc498be4134f013e9a3215c"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.0.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.1.bb
similarity index 100%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.19.0.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.19.1.bb
-- 
2.28.0

