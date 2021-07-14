Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.6054.1626265582831010116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mF5T3MtQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id g12so1465220wme.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iIDcly3OUgF+h/GMwVaZcf5XWyL++WiBkZ0MqBczWl0=;
        b=mF5T3MtQJ0fnkD3+F21mYZ7+pHmvP22qI+JKRZLMKr2sQJcWzkK2V3Lgyvjp5fFRqe
         0JNJAxber9S6yewU2cTw3ZD+xpl6GG0/C2RLXZ7r3Mn+VgFOB/Fw/RjGnNm+meI7hqKM
         bY/Z7Mo1EzAndZEIQN2u4F84Ndj7H8GqhKIdEQs86c4P4ZUlXkc/s5hT4PtvX3qRKbBj
         HoYeODLcEIgvLVTsD6A8RrJMPuyI2vOlguYsLhKwYtnD+j1/793Gm2TdS9d2YpqdRhxT
         RJ4D52/gfvo4fK/u2gdgVm8fJpIWFxl0GSG71A7mxnSLbbHEp8/n2elfxKEP4Ly4FpTd
         lM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iIDcly3OUgF+h/GMwVaZcf5XWyL++WiBkZ0MqBczWl0=;
        b=D4Wkpqxt05qZ0tBcJuSrvZxyBAHaWh14lYWTgU7RRLylKAo/20llUju3A5GbKAJiXo
         Qj9Xfc6CiwaSb3NYXTDXT0/lpw6kzNqB+Gyn5Wk3m6MnW+4Yzpv854rfBAm3fMeuGchw
         wJGeCMtzc+R83z10ueyzM8tNxXrzB/zmvDn59+WZ/tk/WMZHWIJNbxiXfHlcnmcvdtbG
         Ft2bpXWoZkbCPVgVnF48IglTwk7G8CkP5S6aY84TAIQS3F2VA0UIZrjdIbbYk2ZHLcV2
         fI5ap4XKJ+izD1yOuM7vK84Rx1jjGS734hULiJCUQw6q1B4cc5NStT3A7Jo8xb1+AU4+
         Ep4A==
X-Gm-Message-State: AOAM5332qarW5sY3QbcijzlAOZfC4V+Z5i42d8E6b08lM46yzEDlFvN/
	2MWFgy/GmY/8ilHnQbt+fs7/uXI6Bu8=
X-Google-Smtp-Source: ABdhPJzjBpyWwuDD77RiVQPgBUPpMQaxY/BsiKhgDYp1inFONM4V2ZCEWx2Mr7TeNe7p/PyfDXqHiQ==
X-Received: by 2002:a1c:9886:: with SMTP id a128mr11092494wme.150.1626265581475;
        Wed, 14 Jul 2021 05:26:21 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:21 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/21] iproute2: upgrade 5.12.0 -> 5.13.0
Date: Wed, 14 Jul 2021 14:25:58 +0200
Message-Id: <20210714122606.605142-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../iproute2/{iproute2_5.12.0.bb => iproute2_5.13.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.12.0.bb => iproute2_5.13.0.bb} (75%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb
similarity index 75%
rename from meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb
index 3631123374..b117637e36 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb
@@ -4,7 +4,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "9d268db98a36ee2a0e3ff3b92b2efff66fc1138a51e409bdef6ab3cfe15f326f"
+SRC_URI[sha256sum] = "72a2e53774cac9e65f7b617deebb2059f87e8960d6e9713e4d788cea966f1b36"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.31.1

