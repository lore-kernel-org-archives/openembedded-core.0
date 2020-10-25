Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.27253.1603635846014438141
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2020 07:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EvOeF5Vt;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id d78so9203713wmd.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2020 07:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qKwBqVoMLRZzSykYxOwCldV4fia3WqdFm040B8brmzM=;
        b=EvOeF5Vtv4ZIxwzX8gmjCY4j+N4PhpbjJ/rhXsMYrH2XEiPWBKsdr3RR1k3JhyYMAl
         vWSRgXrrB1xJ0a+LjWjQoWggu3za4yYvSB1qG4Kil9rrVYaBv/Rz3ai0c45uuRseLEFB
         b+jDY43cUSYb1UJbXSvhXZQhYN2J4/rw0m4WfkhaQtCcLg9TeGa6lB5dOQmEF4PfI5V9
         75eQ4nkOz7U1ejQFYMcBsTrUqwHSAzIXxIu6WYA3T0vejmJZPaEBkCKr4W7XPJdu1LSj
         Xy1ySwI2wa4TdzHcYexZuacJvbFOcv1U4fSwundDjU0ZM7FcGJnvD/rMlHJZnvuSsPhB
         Qb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qKwBqVoMLRZzSykYxOwCldV4fia3WqdFm040B8brmzM=;
        b=BreKAaeSVWlkXJqkZACOqN0HedvexOO8KvCx5USIP+YSARdzUjCv8Lwq24A8gRHTSe
         uMm/eteuk7Z0PNxGAjuovpXM5bac52rx39xcQDTrGgNVZYIPVKybLeILQ8J+A+CQMHnM
         OTmihVEZeljKyRvZbcpMFKRTyay23z5Ij5x+yWpBohMA6VfsMYLHLCzsBFPFvwfrAzHc
         rIMpqu7sEvVBrXb+ClM/JHevBjaG/TeveGbPf2WSxwz0avNSpO25fVHyqwxHEYKu15ZZ
         PHmvmzGEhHC5rt46v7w/pNVY9dilWkOZnxeOi3kURVrhJ10Wp4G3VRQ4OnCCA84RJnFA
         e+Ug==
X-Gm-Message-State: AOAM531HIwBcPHwc9DuI/qUCGydkawoUhoi5h6N7/pT5DavLU2QgcuGm
	yHuhRBQQLxwrx1OCGGLFLFVEfKNHwhwNXQ==
X-Google-Smtp-Source: ABdhPJyODbrlH0RWSbC32/vLhB5IOH7JVOgxd/1MQCDo/NFzd8+TstSQv4ApNsYr3zYVwv1CQm3Tlw==
X-Received: by 2002:a1c:3283:: with SMTP id y125mr12127322wmy.61.1603635844405;
        Sun, 25 Oct 2020 07:24:04 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id f14sm18041731wrr.80.2020.10.25.07.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 07:24:03 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH][dunfell 09/12] gstreamer1.0-rtsp-server: Update 1.16.2 -> Update 1.16.3
Date: Sun, 25 Oct 2020 14:23:50 +0000
Message-Id: <20201025142353.1929717-9-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201025142353.1929717-1-quaresma.jose@gmail.com>
References: <20201025142353.1929717-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...sp-server_1.16.2.bb => gstreamer1.0-rtsp-server_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.16.2.bb => gstreamer1.0-rtsp-server_1.16.3.bb} (86%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb
similarity index 86%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb
index 02c3c83840..5f1b1d44fa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.x
            file://0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
            "
 
-SRC_URI[md5sum] = "8a998725820c771ba45be6e18bfdf73a"
-SRC_URI[sha256sum] = "de07a2837b3b04820ce68264a4909f70c221b85dbff0cede7926e9cdbb1dc26e"
+SRC_URI[md5sum] = "f0d8263c9d61f6f05b59ae0f676a6406"
+SRC_URI[sha256sum] = "67886b872826d513c58f88d559d4dc4aa63382d03fb64ceac91a09537fe6fea0"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.29.0

