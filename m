Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.2153.1611261580978984731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 12:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZFOPZvX4;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id v184so2625611wma.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 12:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=zF71ng8gJvsN3vfr/6RSRQP4GjlEvJWhAsnudC5ZgrM=;
        b=ZFOPZvX4m/qHqPt1c/3BudfkxIlZXisnMZSOmQh+mIioVekAdbEJZ/0MFtie0R8Uug
         TVXMglQNTHHyO04gLwi1A936c0RHqpjmP9HjQcXgoSXY+qLqJVpMnvArSEhrGljTFfdb
         oHjg73i/gFUWaIAGYN2m9SWHwGcPmLkxlFpsK/5RgzhRBr7AuodKfgNj135Rm3v7bBft
         rOh/xqJSn64hO19XRlbbC5vUaUaZwtWX1dINAz++ssNue4gpJMcrRldnhv5ArBZj17RI
         mRMcb0TN5ZYuPZPtOJCiy6ZEwOCnsnFkBHL4xDAvNAcW5FOvOIwb9ljOJ061Vxg3rvRe
         urnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zF71ng8gJvsN3vfr/6RSRQP4GjlEvJWhAsnudC5ZgrM=;
        b=FNMOVbGkHZHbujJIplZ2p3tT0qzmKWJNM2HLRbdFKNezraAQezX4pTNMBHERDak3+I
         4B238svO2cxiedOuohd4qA+h1cfQ0mYQivOdn/QnnQy3x9biABDHlSU5o7no1LtnkOxF
         JLoiWw9AjsOhKzUDQIb0EYmgva5g2gl30/5TGf0BabhRh7HTnJGFmlxm+JZBaNQBHc1V
         qMmk0dDKr0hbZAjhNU6fLNd2AeLLLQKHdAeNJps4w1h/hB9WepOk/1UJ0ow7ANk5NjsO
         qE8wlij6eUEHH5PLtwVbGN+kyuEylbG1pACqNsVluWRhrf6/wPVCVxi0TJd1q6wBR5UW
         OMQA==
X-Gm-Message-State: AOAM530AP6sghFQR7hAk1uhSeDEf0/LJIX5j9PdS+Jjvj01n8u4NAxNL
	4mKSoTikDc6UH/CCIozvgluRQLuw2gFqgw==
X-Google-Smtp-Source: ABdhPJzPUqVAK4p+LFbhyBs4Aeb3npNJkoFwWyOj1mVKctbjMuiRmF9OXIUUz0lGyYFFGhHSzV4MQg==
X-Received: by 2002:a05:600c:210b:: with SMTP id u11mr1045929wml.16.1611261579313;
        Thu, 21 Jan 2021 12:39:39 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([105.112.33.157])
        by smtp.gmail.com with ESMTPSA id o124sm9782456wmb.5.2021.01.21.12.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 12:39:38 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 1/3] elfutils: split libdebuginfod into its own package
Date: Thu, 21 Jan 2021 21:38:51 +0100
Message-Id: <20210121203853.1461-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

add package options for libdebuginfod

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.181.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.181.bb b/meta/recipes-devtools/elfutils/elfutils_0.181.bb
index 6c49a5fc26..c5bb62e961 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.181.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.181.bb
@@ -91,7 +91,7 @@ EXTRA_OEMAKE_class-nativesdk = ""
 BBCLASSEXTEND = "native nativesdk"
 
 # Package utilities separately
-PACKAGES =+ "${PN}-binutils libelf libasm libdw"
+PACKAGES =+ "${PN}-binutils libelf libasm libdw libdebuginfod"
 
 # shared libraries are licensed GPLv2 or GPLv3+, binaries GPLv3+
 # according to NEWS file:
@@ -103,6 +103,7 @@ LICENSE_${PN} = "GPLv3+"
 LICENSE_libelf = "GPLv2 | LGPLv3+"
 LICENSE_libasm = "GPLv2 | LGPLv3+"
 LICENSE_libdw = "GPLv2 | LGPLv3+"
+LICENSE_libdebuginfod = "GPLv2+ | LGPLv3+"
 
 FILES_${PN}-binutils = "\
     ${bindir}/eu-addr2line \
@@ -115,6 +116,7 @@ FILES_${PN}-binutils = "\
 FILES_libelf = "${libdir}/libelf-${PV}.so ${libdir}/libelf.so.*"
 FILES_libasm = "${libdir}/libasm-${PV}.so ${libdir}/libasm.so.*"
 FILES_libdw  = "${libdir}/libdw-${PV}.so ${libdir}/libdw.so.* ${libdir}/elfutils/lib*"
+FILES_libdebuginfod = "${libdir}/libdebuginfod-${PV}.so ${libdir}/libdebuginfod.so.*"
 # Some packages have the version preceeding the .so instead properly
 # versioned .so.<version>, so we need to reorder and repackage.
 #FILES_${PN} += "${libdir}/*-${PV}.so ${base_libdir}/*-${PV}.so"
-- 
2.17.1

