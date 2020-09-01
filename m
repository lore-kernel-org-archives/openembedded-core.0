Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web12.3396.1598986631121045910
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 11:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W4yTpvvY;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id u126so2554375iod.12
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 11:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DL8S4VT4bs17ejXLuRtTgHXXL6n3eoSIAoAfXK/rcZA=;
        b=W4yTpvvY3u0anEFqcB0E25udrWY6vxPJhkz9BzlmM9NgF1v2W3NhLOyU0ym/ufyJyw
         Eyn/UjRqqGuSgWoq3Fvd+GzBcW5cKkpRRKNWvKUjyNsy3WGgXqXPqQ7vMCN2vx4j1k+x
         ZWpLwwO4xcYu9WneTiQt3SRvUWCjGko6mlx6rAm6TFbYlG24kdBCmgy8JWo/57R1AOaB
         n5v9Xp/SkI+/jEMoCMN5cIWqAmpeGzxVtx/ARP9CI/vFSTE3czEkz4rU3hBOQUJEkMyl
         5zzqHotJXKOtn8O7t0LAxPxrsQ1hOyZiox0USEpX8ozxjEbDyhPPOs9eKg2jtn4iO5hq
         4VVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DL8S4VT4bs17ejXLuRtTgHXXL6n3eoSIAoAfXK/rcZA=;
        b=SVwofvHEusXvLfseWLlQS2dY1JWEsMIpBTYGxgrEYu8hqhoCbYYYepQJjcanw6iqFm
         FHKkSemqDj9QzXTG9Th3+o0fmId2cz/aTtU3i0zvjxvjj4GDaOllqFL1sCnqpPAsvBl3
         kvo/U4lDKjMMHN2+jDLcT7KOJKUAHLzNMIcjZoAOuFkbQk7F9EeRXeJoyrYaLdfqXCl6
         ZWET4fQZd3MlnWW4owxeSLcWf3ydpcWRwAqCSDJBDf1wVMeRJRGe1wTHke950JmlCzX9
         yHDL36sgLH7TOBUjfufhXcD/EzVA40volLwVgeqeZnOp6doNjCGvH6GHp3GkpAJFRUzK
         kd/w==
X-Gm-Message-State: AOAM533NoAE3ePZsXr4+Fp2j5ijuINaJK1yhAsM+q+P7jp7KYa5UPn9i
	mon2cVRkTwK2QM3l/l78tngNufrp5+4=
X-Google-Smtp-Source: ABdhPJyRbuCCkldopw+w0gWw6ALV3ynXhh9M5BfllD3iKKmHGt7U23geg7JKy9tusPPCU5jJ+HuG9g==
X-Received: by 2002:a02:454:: with SMTP id 81mr2792189jab.142.1598986630119;
        Tue, 01 Sep 2020 11:57:10 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:7282:816:6ef9:8e8c])
        by smtp.gmail.com with ESMTPSA id z1sm1007380ilk.5.2020.09.01.11.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 11:57:09 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] diffoscope: upgrade 156 -> 158
Date: Tue,  1 Sep 2020 13:57:07 -0500
Message-Id: <20200901185707.24678-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../diffoscope/{diffoscope_156.bb => diffoscope_158.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_156.bb => diffoscope_158.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_156.bb b/meta/recipes-support/diffoscope/diffoscope_158.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_156.bb
rename to meta/recipes-support/diffoscope/diffoscope_158.bb
index 94e6e56d41..9b00e22e23 100644
--- a/meta/recipes-support/diffoscope/diffoscope_156.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_158.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "428f5d75197c3d9449ffbac52f8d79dd782a7ed67aba759e0452515b2d8e1441"
+SRC_URI[sha256sum] = "54e6d074a783c742b18b18a63328ac6821f4bedbb3d721a5d6af6ccb5d4fe6b2"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.28.0

