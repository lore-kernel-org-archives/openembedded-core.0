Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.17599.1590940415349744476
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sWP6F89F;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id p18so5413070eds.7
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0uqksNdFfSxLgYuSUCjFhq2PMm04v+L7W+Qn8c5g5SM=;
        b=sWP6F89FnxOmnl3IyP4WyLPLAPeLFzBKApTEB0ZWsZmjUmCl4mQT1BRchMutyeEdKN
         4n/pAIIMvWHTJvVUtAZUvVXkB2Ss8IeNgjat4rsmtPPlzGFrQq61IWgdg4V+HlPIE39n
         AEH1g8MHwlR5YQnjRsyiFFhp7TluojDbWiKvcBLuYJMhqVGn+S9buj0YSWqYKc+UD7hT
         Rk6vqJUq9hGNxGHNeEZJdkxU0Yid+qjnCmI6G6lZ3e2HkUCLapcI4RFIgQMCLrO/oE1B
         N3GNED3w5IcNTr2A02RnwbPclA/Po4TLeBdreUQL/wRXm+DoXwPL7GgSGHLmKdRqlrl1
         jzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0uqksNdFfSxLgYuSUCjFhq2PMm04v+L7W+Qn8c5g5SM=;
        b=WkmTKp1OpwaShTFACvSjVIzr2PH2UgMTAD0srhwm8ztOM1iDUesEDM4CRNeX9tFFMY
         PZPMKNUZTyt4V+p6b5po6p87QBLdarVIJio05UDWzf7A/EcWcwhxMWSn5z/b5U9YXNhf
         RkLIpeTbuhcdynspog15POSqtOWYgIPZM8nwbPVrHBHwxYRFFwj6nOfcZjipXYk9ehrR
         89EQWiTex8aNQA/IxTqWJ61UP9GrzdVQAKT8YCH10Eai68Ddx1nFBdlI1W1Bye5UCmsZ
         v+jRs3V//CANgdHG7uK16spx2Xl+NLwGrPV7mJyyP6dxqBnCpb0GQTzZpxMDBCkhPWdo
         WPlQ==
X-Gm-Message-State: AOAM532m90W+umTqolCDk/bhmkjalvhMufgnFNn/RKXWdoUlHLgVbdB+
	xrT9nHRZ/guzK7BTQTI+CHThEyn0
X-Google-Smtp-Source: ABdhPJznMwpsxgIYomFTjlRCtJM8gPKGU5TFMFLI1+zyaxJVcq5GzFjbNDZounRLGqwZCSV596sFWQ==
X-Received: by 2002:a50:9547:: with SMTP id v7mr18573921eda.78.1590940413754;
        Sun, 31 May 2020 08:53:33 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:33 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/70] python3-numpy: upgrade 1.18.3 -> 1.18.4
Date: Sun, 31 May 2020 17:51:51 +0200
Message-Id: <20200531155254.10283-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python-numpy/python-numpy.inc           | 4 ++--
 .../{python3-numpy_1.18.3.bb => python3-numpy_1.18.4.bb}      | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.18.3.bb => python3-numpy_1.18.4.bb} (100%)

diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index 0bff979a6b..6a437e7c3c 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -9,8 +9,8 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-convert-shebang-from-python-to-python3.patch \
            "
-SRC_URI[md5sum] = "cd631c761f141d382b4e1b31c8232fc0"
-SRC_URI[sha256sum] = "93ee59ec38f3bf8f9a42d5f4301f60e6825a4a6385a145f70badcd2bf2a11134"
+SRC_URI[md5sum] = "70e6c294f8dffa8d630eda1b0d42ae4d"
+SRC_URI[sha256sum] = "e0781ec6627e85f2a618478ee278893343fb8b40577b4c74b2ec15c7a5b8f698"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.18.3.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.18.4.bb
similarity index 100%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.18.3.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.18.4.bb
-- 
2.26.2

