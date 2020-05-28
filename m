Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web11.14093.1590678535248916591
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 08:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F635msZr;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id m7so11670953plt.5
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 08:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Pmslr1zVq6TmwepO1saD1ssuglwcObqU6MT4vKU8/C8=;
        b=F635msZrWxi/r9hrIy96yAdCN9KYJj/s4HnJJ0/242Z0GjVkaIxLFzKquoq76f4A1U
         E35m3msvdnjOA4x2zVZyhqZK957wkAn/cjy/KghwYPNxziHPt/jsZz0+qdXlNa5yIhac
         Kg53QPnOi+jo8rsvUQ+hkidrE7qzsvLWMTw4aqQDb7F2jm8LVVc4bGDCQgXCEMwW7Olh
         SibEdfSCV4EJb1NTGpfSSaxCQGdDwCx4uuFqcs9YMnd6Yx+hVtEPujNhnUehI8aOOwBW
         ktWCw7QkS8BiK/Sp/xdLOv0m0DZNCCZOQ8Tcw9gLM/kpOXOr4HVA3L7cHyI9f2NsxezF
         p4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Pmslr1zVq6TmwepO1saD1ssuglwcObqU6MT4vKU8/C8=;
        b=elME3pfbLMGpzWaciLK+RkKN+IzYVNXGUVBpViL2WO/5Zige/A8RZFsJLFUckZKhUy
         6OTID1ptQ8oa5rJu0c2TcO28hehusW7XFK0GsjDyv+ffHqVIUhesLNUUQ45MAcnoYlwe
         oA2LfGJj8rDXuhNn16K+op2EI13tuxJMUez+Mz7a4/OcSqp6228G+k/V4WV3zjGF0NXo
         b9wYSZNbK1BbpKV/oA5bRVKyPgA80gbcIDPMcQ4y2yAW15dwcHFi8cyRRD3fG5Fnxm0L
         yTQ/0wN3B1gb0YwW/V+dsMJvvktBsI2y/ZQdf/e0KEZNrbZGU7esMUIMAUZw0f3fQX99
         sDSg==
X-Gm-Message-State: AOAM5332+gxdXTKy9vfkIHjsFTdfncR4A8qKQpO/94ocTyesgwHuRoXU
	QtC47UQDlqgWVhtkJycZWuNSi/0b
X-Google-Smtp-Source: ABdhPJykWMQT3Q0KTXtPAB4I3DwVnrh3V2B8+wxegn9FaNe4ZNsM4JBE4pqDwhkdze97nKEOvphiNw==
X-Received: by 2002:a17:90a:d78e:: with SMTP id z14mr4282143pju.155.1590678534230;
        Thu, 28 May 2020 08:08:54 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:34cd:9c9d:ce61:c13d])
        by smtp.gmail.com with ESMTPSA id nl8sm5930131pjb.13.2020.05.28.08.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 08:08:53 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>,
	Ross Burton <ross.burton@intel.com>
Subject: [zeus][PATCH] mesa: fix meson configure fix when 'dri' is excluded from PACKAGECONFIG
Date: Thu, 28 May 2020 08:08:52 -0700
Message-Id: <20200528150852.12292-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Yann Dirson <yann@blade-group.com>

Signed-off-by: Yann Dirson <yann@blade-group.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 78efff8741f869647790810a3dd41459b9d9d8a6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
index 3458c19199..346b217585 100644
--- a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
+++ b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
@@ -23,7 +23,7 @@ index 0e50bb26c0a..de065c290d6 100644
  with_dri_swrast = dri_drivers.contains('swrast')
  
 -with_dri = dri_drivers.length() != 0 and dri_drivers != ['']
-+with_dri = get_option('dri') or (_drivers.length() != 0 and _drivers != [''])
++with_dri = get_option('dri') or (dri_drivers.length() != 0 and dri_drivers != [''])
  
  gallium_drivers = get_option('gallium-drivers')
  if gallium_drivers.contains('auto')
-- 
2.17.1

