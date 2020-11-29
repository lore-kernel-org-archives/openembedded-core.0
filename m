Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.42907.1606636088313219685
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2020 23:48:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fFsYRbGr;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id l11so4777897plt.1
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2020 23:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ppzI6uWp7KgJxi0xvaLil2u6dV/w2y7eJOkWwQO7Etw=;
        b=fFsYRbGru8U7Gsa5l8x5+KsU0CCLAoy0bL4zKcjCHk30YOZpy0oIZRKpmc/Frq1MMT
         DFXaCHHZt0OMNpNIPDKQt2Fh9E1OL3Olho84oUC5Fa8JkG3BoUO2pTmYSZ0TDDxXCTbK
         WUyZ5rXygLa0ck7VL8QEnQ8/sFwBmvRwrdpopTUL2WpzBw6c/3InJPAjisLj4nhY+7mt
         CCRQx7RwLjwXi3TEPvI3DXK1Uysw0j+yo6zpNx1lyVYOeY0FbfiXWcgK5op5TjUxz/1Y
         Ob424tphcMCIVjx9eWUDfCSFmtDZlKej30C7V2VSGlJyczxvib+2eFhwZ/Jdv1Qbf1Qm
         Ow6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ppzI6uWp7KgJxi0xvaLil2u6dV/w2y7eJOkWwQO7Etw=;
        b=Ef9bFkk/u75YuHCwZSWARhp8avBtbeCSzKuLW5ulMS4sXz5hXb86ueBCpMVYKiaO/0
         rMzj3+L5dlNOuJxwVUF+Nk19t4IV9UQZ0hSbwWznx523PCvvt4AMAjaNU08KFar3YLz9
         x2TfJa9l6bPUL1TyzwKqGG+lBAx4yazvuDlmhXsOMB+zbvENCfX9FWaxPHQT/TxIPF+T
         5k/182f0H0M2nEG2Ixbe5+t3C8HC5D+3SvBHDkpKdMmbZfsGbRhnq6J4oI3ebF/6zF0h
         +tdNU+PQVr5tLjPJsbOMMy5vHREv63zeA8K333Kr5pF7JpdqDVW/CjFS1P3/EA15d4+v
         vOUA==
X-Gm-Message-State: AOAM532C/Gwu2jytO9z6APttM01KUxrzLSTtnEZ6Q9cNruSuCt39f0KK
	1Sb2gC+NTwKIdE+4zYdyz1E0HZ340JMpHw==
X-Google-Smtp-Source: ABdhPJwgRAtRXe4frLmmTUpka+M4E1dB89CS1uypFte7yhLcm2Og+AFb6vmYekgkeZaue2wy2rbOiA==
X-Received: by 2002:a17:902:7b97:b029:d8:ec6e:5c28 with SMTP id w23-20020a1709027b97b02900d8ec6e5c28mr13595720pll.40.1606636087539;
        Sat, 28 Nov 2020 23:48:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49d7])
        by smtp.gmail.com with ESMTPSA id z20sm12905267pjq.16.2020.11.28.23.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 23:48:07 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 4/5] python3-numpy: Move ptest dependencies to PN-ptest package
Date: Sat, 28 Nov 2020 23:48:01 -0800
Message-Id: <20201129074802.1493537-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201129074802.1493537-1-raj.khem@gmail.com>
References: <20201129074802.1493537-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python-numpy/python3-numpy_1.19.4.bb                 | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
index e59ea752cc..9351e507c1 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
@@ -39,9 +39,6 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
                   ${PYTHON_PN}-netclient \
                   ${PYTHON_PN}-numbers \
                   ${PYTHON_PN}-pydoc \
-                  ${PYTHON_PN}-pytest \
-                  ${PYTHON_PN}-hypothesis \
-                  ${PYTHON_PN}-sortedcontainers \
                   ${PYTHON_PN}-pkgutil \
                   ${PYTHON_PN}-email \
                   ${PYTHON_PN}-compression \
@@ -49,7 +46,11 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
                   ${PYTHON_PN}-threading \
                   ${PYTHON_PN}-multiprocessing \
 "
-RDEPENDS_${PN}-ptest += "ldd"
+RDEPENDS_${PN}-ptest += "${PYTHON_PN}-pytest \
+                         ${PYTHON_PN}-hypothesis \
+                         ${PYTHON_PN}-sortedcontainers \
+                         ldd \
+"
 
 RDEPENDS_${PN}_class-native = ""
 
-- 
2.29.2

