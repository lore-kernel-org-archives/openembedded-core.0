Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.19290.1608974881125582664
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a/zOQamK;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id b73so5526789edf.13
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f1rLUqGTtTpHWK9HxTfvmeIjSHQJqQVA/bClt1bTeVo=;
        b=a/zOQamKC59D+dOwZliIELdDe10cP280AUsGFqS2iOmHWOSYiujFiFAswzoHJYgmVW
         QSjez25bXplTNOrXl7YZFOPKDa6YMrw9aCXMv44pelFWaLMadbVlSZuCHKchWLYqL36L
         8dnIyDa2cL3uUYNBBcJgMrWJKhZ1ngJB7lcDU3hJumhXipzzHXjC4XVpqCpMje0udh39
         Fbt19GPzSLkC7rBLyde6V+06gn5rlTFXlKl8fbROpnaMkbXhfp37ZksqXGLgcoe71RDk
         reSIe1Iib36AVESR/5rVBbbzagtxYJhohlKMc2nN9Ap6hnm347mKQ/UxTDz8wOdX95uF
         HnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f1rLUqGTtTpHWK9HxTfvmeIjSHQJqQVA/bClt1bTeVo=;
        b=XiuG11Oy3GAm9a/fnas0B28SCBQMXbxKSAGn6GvVLx9WQwkZtDz4DxHJLbSBBvMh2/
         lCE8GUThqwJ7xvTCg0e4zh4LiXrRVivYtgBeliI9M22Yr0KFPh544k5XRaiuxyYNC2Kk
         kLHEcxO85BCFXxOjrEa9fzsPl3hI6GuYiYACYxCacsqUcPQ+Mrc3tYoQnDM0gUNUxyTP
         b7BTFNqxz36zN+ZNbDiD1XEfC/cspWVVCA3oaN0o926lN39cZ3dCxv8b8fhFB6OONTyP
         67DSnZhbPZpD/4bcJ3kZxa3SP+6JJjb0gIlfnBerhoPVobffTuQ/ti6LQUdmsglsoX67
         GB5w==
X-Gm-Message-State: AOAM532+7q00l8lfP8+aHukovCNIo5Be1F9sWuBoabCEUDqQqjSEuFSm
	xs3DNEYmZ+zmbN6xQhBXAt9V/syo91M=
X-Google-Smtp-Source: ABdhPJwID/Cafhh92omxa4vjPK5Bgaco1pWkhqQX7M0FK/ntojBYZ1cWZDUIfxBfMEWYeMb37DlNCg==
X-Received: by 2002:aa7:c749:: with SMTP id c9mr35196751eds.3.1608974879805;
        Sat, 26 Dec 2020 01:27:59 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:59 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/48] python3-hypothesis: upgrade 5.41.5 -> 5.43.3
Date: Sat, 26 Dec 2020 10:27:06 +0100
Message-Id: <20201226092732.52323-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ython3-hypothesis_5.41.5.bb => python3-hypothesis_5.43.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_5.41.5.bb => python3-hypothesis_5.43.3.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_5.41.5.bb b/meta/recipes-devtools/python/python3-hypothesis_5.43.3.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-hypothesis_5.41.5.bb
rename to meta/recipes-devtools/python/python3-hypothesis_5.43.3.bb
index 7ad975b62a..4d93cba868 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_5.41.5.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_5.43.3.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a74e127a865fde12b853cc00f5f52a3a1601d2a1c311b3ffc8de92a4c06778f7"
+SRC_URI[sha256sum] = "d97ba7ae2cfe7096b0c045fdb611ee9850ccdd6050a9b36cb96812242062c2cc"
 
 RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers"
 
-- 
2.29.2

