Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web08.6344.1616160894856239325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 06:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ndA8LfDx;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id u5so9753423ejn.8
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 06:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=beWIP2m3DoMtiGbfkXh4KR5+TmCb+LF3OuFBaq/b0wQ=;
        b=ndA8LfDxIkatvBSEKSuvAOBJfTc6NfElWKz51N05JBMiUZJle32iJTJXlyw2x6412/
         mUSxfjK1WRCBaS4V1AGQekN+rRYFOSCqagGX+PnhS1jUQztZJ7rx99x2iHbmLMC+AC0P
         MaTzJ02wekVqobkZH8EZqm0OGOjOKWtyYUwinFFx/2ZCwH7dVqccrRrTZccY2tM2I3mn
         1Sz01lVEizSHT9pXe+OBZ/1vHSmghyqc1QalIAT6saLivLvio6MmR+EOr+TscP80v/CF
         vplpYRdYbFsXbomN0thmZ4sZKEsLEfQxSEMpTjNztdBMGWrvZsfe77RI6e92G5H9PoOV
         YE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=beWIP2m3DoMtiGbfkXh4KR5+TmCb+LF3OuFBaq/b0wQ=;
        b=kXw5bmoBBqy++vE2HSY30zg29B3pQ4j4WD4D69u+KX/ZH6zKqrRTvTtRfspiZCVlvy
         b/X3U681iOyMrS/T60X3mLdS5xy8fSwVHXVmDwsJrP4uN1735j6MnI93XpQ4YigwommR
         UmWpfrydxr5m2n/abvBSTvODSZ3d4UICJHcrelPfCX5FlVnf9dRr6iDHcCpjZOIyedmn
         Ym+TgEN6EMK3KXjVfTnWZmvdnV2WU8kiNqnU6K7SFLXQa4PzKdWw1tCdgcOT46Q8MjCG
         fdY1iWozYr19FmzI2mm1v3X0brFFTCwDUCKmqcxTucwyEnxT6R7GyEUpYEmF6mHN5kbl
         QFoQ==
X-Gm-Message-State: AOAM532YOOHhCn9qhFuZVvk736L0IbfnC4tnEV+ByHqX3lrOxiszw9Iy
	TCxh6b/9Vi+3iqktI5yBxpocioaH8Tw=
X-Google-Smtp-Source: ABdhPJxZjebIdgiF6lPsj7rRcSu+reVX4+s3LsskBZb27QWcdtdzrO4IgMTBhTqxJDDDTV5Pp5PxLQ==
X-Received: by 2002:a17:906:3643:: with SMTP id r3mr4281217ejb.527.1616160893184;
        Fri, 19 Mar 2021 06:34:53 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id gx2sm3736640ejc.82.2021.03.19.06.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 06:34:52 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv2] packagegroup-core-weston.bb: add pam to REQUIRED_DISTRO_FEATURES
Date: Fri, 19 Mar 2021 14:34:50 +0100
Message-Id: <20210319133450.105722-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CANNYZj_P_+2vE66iWKNVfCanjb2KVP238MngAPK3jBz3BDiDEA@mail.gmail.com>
References: <CANNYZj_P_+2vE66iWKNVfCanjb2KVP238MngAPK3jBz3BDiDEA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* weston, weston-init, weston-examples require pam
* fixes:
  ERROR: Nothing RPROVIDES 'weston-init' (but meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb RDEPENDS on or otherwise requires it)
  weston-init was skipped: missing required distro feature 'pam' (not in DISTRO_FEATURES)
  NOTE: Runtime target 'weston-init' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['weston-init']
  ERROR: Nothing RPROVIDES 'packagegroup-core-weston' (but meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb RDEPENDS on or otherwise requires it)
  No eligible RPROVIDERs exist for 'packagegroup-core-weston'
  NOTE: Runtime target 'packagegroup-core-weston' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['packagegroup-core-weston']
  ERROR: Nothing RPROVIDES 'weston-examples' (but meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb RDEPENDS on or otherwise requires it)
  weston RPROVIDES weston-examples but was skipped: missing required distro feature 'pam' (not in DISTRO_FEATURES)
  NOTE: Runtime target 'weston-examples' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['weston-examples']
  ERROR: Nothing RPROVIDES 'weston' (but meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb RDEPENDS on or otherwise requires it)
  weston was skipped: missing required distro feature 'pam' (not in DISTRO_FEATURES)
  NOTE: Runtime target 'weston' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['weston']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroups/packagegroup-core-weston.bb                 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
index 340c8e75ed..7dcfd6733b 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
@@ -3,7 +3,9 @@ DESCRIPTION = "Packages required to set up a basic working Weston session"
 PR = "r1"
 
 inherit packagegroup features_check
-REQUIRED_DISTRO_FEATURES = "wayland"
+
+# weston-init requires pam enabled if started via systemd
+REQUIRED_DISTRO_FEATURES = "wayland ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}"
 
 RDEPENDS_${PN} = "\
     weston \
-- 
2.30.2

