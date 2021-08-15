Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.12071.1629040148983067917
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 08:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M8J7F2Tk;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d2so12343418qto.6
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Aug 2021 08:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=veQY3GZmwskIiIqC8hBGUuQZO5o1oiWwIyxevfXfA3E=;
        b=M8J7F2Tk4f15XusdNnHh0XgksYPx6xFCScrbLM3UjTirwxLxGWWWe36NYfEHy1Fuf7
         YAGYcXMM5HoqI+A/10we7WREO/xDxm62D13qKNbOJ0ananW9P4+/qjuMLx6fQb5k2nSV
         mEH47LdChZGHIgwgaTHjS6c+85bVGqjo5IURURg2W1nDvC8Zd8vVFTAyWMAGFOH0GVYL
         SEVBPfVMO2gltgS/TlpIaTAcrTsRMIDPofHxHvbDFpx7QYEK+bcJzY/UiCSVrbepFt8x
         ynbOv2xoJxdARijb7C2b4PqmQ/9Spq1soUPoeS3362DUD+pFKqWyuGSfWmSqZBuDlW1n
         T8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=veQY3GZmwskIiIqC8hBGUuQZO5o1oiWwIyxevfXfA3E=;
        b=fPXFp34eZo/okZBCX1NsjYS+PFy8+wxJaKDlx9biIQLjH4LVcXsqLKMrD2GIbm7G3i
         jnP5MAHkf5gU6nhwKr795wPiQvlcx5+iXfB9jGVf6JBO+tOusD8DWEh6+ipRdOS9e0wU
         Pw7CrehN7iWW9+Pqx8jp+CnT+ofteRnv2mQSU3YxRYjmKbxLSHRFLgyKeKI2JTk7IL/2
         1hZ699U/bTQe4zsoXkk/hVqzKQsn1oMA5digQ2CRfkcPFlvbjvAOOPWwuvKv+RMGZ/r8
         Tg6AEvAuh2tI0Tq69W9D9w2SIJSv33EI9Xyjlw4tvLOeQrheai/JZMPVbE/hfKB9iYKg
         BzfA==
X-Gm-Message-State: AOAM530x1KOE7Ll72QrGCTu5lvW2RRhlMmmU4xdxioEyht75Prw90yvu
	fiq2s4wqPPim2jBXQ5jPgMYljD7M6KsQBQ==
X-Google-Smtp-Source: ABdhPJwCXAkSW4/+zXJu8LeGbSVr9tsqxz7gPcEISkZ95ZoSKiDSi48IhxM9qPJr9w45LwoztWycfw==
X-Received: by 2002:a05:622a:14ce:: with SMTP id u14mr10257344qtx.208.1629040148115;
        Sun, 15 Aug 2021 08:09:08 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id n124sm4690466qkf.119.2021.08.15.08.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 08:09:07 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] conf/machine: bump qemu preferred versions to 5.13
Date: Sun, 15 Aug 2021 11:08:58 -0400
Message-Id: <ababb195496f1d16d8b082e1bc6d87a177d2b2a6.1629039837.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1629039837.git.bruce.ashfield@gmail.com>
References: <cover.1629039837.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

5.13 is the latest reference kernel, so let's make it the
default.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/machine/include/x86-base.inc | 2 +-
 meta/conf/machine/qemuarmv5.conf       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index ef6690b0b9..958b3490e8 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -18,7 +18,7 @@ SERIAL_CONSOLES ?= "115200;ttyS0"
 # kernel-related variables
 #
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ??= "5.10%"
+PREFERRED_VERSION_linux-yocto ??= "5.13%"
 
 #
 # XSERVER subcomponents, used to build the XSERVER variable
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index 7650c2f4a2..b0dc1022fa 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -14,7 +14,7 @@ QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine versatilepb"
 QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
 QB_OPT_APPEND = "-usb -device usb-tablet"
-PREFERRED_VERSION_linux-yocto ??= "5.10%"
+PREFERRED_VERSION_linux-yocto ??= "5.13%"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
 KMACHINE:qemuarmv5 = "qemuarm"
-- 
2.19.1

