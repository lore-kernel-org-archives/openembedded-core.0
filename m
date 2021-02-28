Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.7841.1614526636857023077
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WDLauj31;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id mj10so3426013ejb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PLCVATdBvZ9HSX4JaxrTH9JsEwtnbIpHNvDdN8vIw10=;
        b=WDLauj31NLzIcu7SQN3YLc+am0I/qYQAg9e3O7d3HIw09EKyy+8IozQHMLAumcc3ZV
         YWZ6gwR/48PvAHLo6f9DdkjNyZ9//JxKlJGxhdrICkpS7s+Zferg+EJFW0Axy2fmF6TF
         v6RjBiO4iDN0LL3EiTA/qAFcGl67YcH5rJVmjrQ9wT4ys1qL+zc5UXxWSwtMZmAu+Qlb
         OS5yzFclKGfmbCew3nrL/0r4sFtgEfxmat30EWt0F49l4AsHxYIUNNf94n7ISsBSa7JM
         jau/XSKyWHen9TZHX+9WJzF1R+7ubQz3UuVTXESxjShlkeaRgrSa5gRPbYU7bPxKnlyy
         VB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PLCVATdBvZ9HSX4JaxrTH9JsEwtnbIpHNvDdN8vIw10=;
        b=fgJW2Jc/SBbq67M7b8MgQpTdCz3Ob2ggzgxdV4VwHFeGp2L2QWP8IawBTaGZxopOKu
         YJT9jSxGNWR/2bFaZICCgyrMy271MYch6Vz5o37b9e4zODK4e14TN4xPVFtRIj487eNP
         FahgKoPTpAQeJ83atDY9XeGDcOQ3PZe540qo2rb2Yemi06CPLIAvpI6kkD4ThVcfc07c
         gpIAPv+eI03Ew6l7eK6jZiDtLLfJLSpwg0UE8IZ6svJMGc7ao3Y9+0tvg8shUb+34dHs
         ZUky3pX+yUmIKultQWH1e0yKQ+HmBdCGIKwVFALUYN8A6I4tmHU6pihvS7n8tZTZ7Hbe
         II1w==
X-Gm-Message-State: AOAM532+2R8i+5rujoTKU1+J6a8407uJBohoUL7gwsQM3WnSrexHpN+F
	i9diVLE0bTsEUW85hMCVbogR6mc6G/GWrw==
X-Google-Smtp-Source: ABdhPJxySXF0L1YvMslAXElUPMxwtDrIPiidWuwjCf2P/QaSb36kpXbU3vXdnB5OFUHFR4BG9Mk7iA==
X-Received: by 2002:a17:907:98f5:: with SMTP id ke21mr12011443ejc.552.1614526635477;
        Sun, 28 Feb 2021 07:37:15 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:15 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/24] dosfstools: update 4.1 -> 4.2
Date: Sun, 28 Feb 2021 16:36:43 +0100
Message-Id: <20210228153702.498275-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

udev support had been dropped upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{dosfstools_4.1.bb => dosfstools_4.2.bb}         | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/dosfstools/{dosfstools_4.1.bb => dosfstools_4.2.bb} (68%)

diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
similarity index 68%
rename from meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
rename to meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
index 4bd4aef099..e1d1734b99 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
@@ -9,24 +9,20 @@ SECTION = "base"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v${PV}/${BP}.tar.xz \
+SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v${PV}/${BP}.tar.gz \
           "
-SRC_URI[md5sum] = "07a1050db1a898e9a2e03b0c4569c4bd"
-SRC_URI[sha256sum] = "e6b2aca70ccc3fe3687365009dd94a2e18e82b688ed4e260e04b7412471cc173"
+SRC_URI[sha256sum] = "64926eebf90092dca21b14259a5301b7b98e7b1943e8a201c7d726084809b527"
 
 UPSTREAM_CHECK_URI = "https://github.com/dosfstools/dosfstools/releases"
 
-inherit autotools pkgconfig update-alternatives
+inherit autotools gettext pkgconfig update-alternatives
 
-EXTRA_OECONF = "--without-udev --enable-compat-symlinks"
+EXTRA_OECONF = "--enable-compat-symlinks"
 
 CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
 
 BBCLASSEXTEND = "native nativesdk"
 
-# Add codepage437 to avoid error from `dosfsck -l`
-RRECOMMENDS_${PN}_append_libc-glibc = " glibc-gconv-ibm437"
-
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "mkfs.vfat"
 ALTERNATIVE_LINK_NAME[mkfs.vfat] = "${sbindir}/mkfs.vfat"
-- 
2.29.2

