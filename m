Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.18904.1603023024791484980
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 05:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fQDjWzY0;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id i1so8349638wro.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 05:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uXJ9EvL0suwcXx8bHeHeLU82wIpxfbYPr9nwvd/1fsk=;
        b=fQDjWzY0vYQMJuKpYV8Bsw6zKuM7IuvEMsxxsShhA9j7EJCbM7FHu6aFHyaeZRS/7C
         ENJjY7O0ID9QtqxwmLGGVX+sEVzMyrjvu65ERUegk4jnXhwc9UC1bxPTsFP+BzW+NLAF
         NboeUF8TFQasAgrOuVxFBnDG4XyBlyHqyqccBmsXvZD25FkSr5riwGNMAmhjfSfEFsko
         5uuhSdV7WZss1+xQX5Mu3ylMj2u4Myw9cL5hliGiwMvmvxKz8vERXxP6AGI0XRE4Tz5V
         oHMVkHDy+e2eO3TpcmrtCEFxmewzyzR0bLi66H/QoBjH9bD+x5lHg93eBVTg+rz/dSm4
         nTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uXJ9EvL0suwcXx8bHeHeLU82wIpxfbYPr9nwvd/1fsk=;
        b=ZF/AAj26uJPy+Sv9CNF62t7Ifi76/Tp2ZS5U6BH7yq21ClEk1z6xbXlbGx2PnqKqMI
         Ir5NdaxIZz2msicXePeI5yhGNv4PRIDt8YWUlyv918ru5SQkXoR1Oi2YJW/1k8tA4JKp
         7zM5GECfenm5nL1qMtYrDcz0hcsehjPw1heDvogkny1+icu0fU93JdHyACC7r6Fx0p45
         fPOMDoFIFq4REtB54JgIQNPr415VRg4J19BF3ZcEVuiagEGPuB1hgLhntWsxDJBM7YL5
         u2u4ci31Pb8BO4WwyuiE77HFXtUVyWs1lTVdzcaHcJAsWiMWTp373Y4H5yi6WNGXMi7L
         LZsQ==
X-Gm-Message-State: AOAM530FoxBgFOPHNXnLHHO8XUyZK+KvfbxPH4qWIpjA84ZXF0Nh0jVj
	lvvpwM4v+/F6RD+0Wc0whewe1Neecg2CMQ==
X-Google-Smtp-Source: ABdhPJxTFcHoz6hohkTubJjFOkNuGHfnLA0umyaUEhgoMoqdpGdxDtjPJzC/EQ6WVOLeHqJXfJtaSg==
X-Received: by 2002:adf:cd0c:: with SMTP id w12mr14287158wrm.305.1603023023134;
        Sun, 18 Oct 2020 05:10:23 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id z18sm9511084wrs.82.2020.10.18.05.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:10:22 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 04/20] gstreamer1.0-plugins-base: add new meson option as PACKAGECONFIG
Date: Sun, 18 Oct 2020 13:09:46 +0100
Message-Id: <20201018121002.1417335-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018121002.1417335-1-quaresma.jose@gmail.com>
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- gl_winsys have a new meson option to set egl

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-base_1.18.0.bb                | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
index 7fe5a480d4..a04af186f6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
@@ -68,6 +68,7 @@ OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', ' x11', '',
 OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'gbm', ' gbm', '', d)}"
 OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'wayland', ' wayland', '', d)}"
 OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'dispmanx', ' dispmanx', '', d)}"
+OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'egl', ' egl', '', d)}"
 
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
-- 
2.28.0

