Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.9623.1629636707397096006
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kSwicUwA;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id k29so21770832wrd.7
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fSm1QqhZFyoAAldLs6CVHIlu1xoQ0xeS7ch7Os5N1hY=;
        b=kSwicUwAgX7TtoHZ4EO2vvNCGoEBX1qOcnhmHq5vuQPzMm5YzgXvGSvk0dzj1O+xi6
         S6uSFJPtyC3JyRwmIvJEmV/qUsPOa7MZRr6MtSOfgbJtL8/nPql6Rf9D3QHSIyqUSRLO
         3vumJI8YepUjvLFngdUxaXXvL0ScKkI//LellNy4t3Dw8Ybu4USyRFbKA+O1LRddUrDA
         B0zGVVQLySJAt5KAs7O2PrGj2ZjFiJDsGC5ICHS6a1gotNFVldJaab0cJWZzEAMFrJyf
         TGLv7gdabNEAdWrx7MRVBbdBmqRNbJocgcpJjW960ldk1qkZTazkmq+A4hsxmv1d17Le
         yd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fSm1QqhZFyoAAldLs6CVHIlu1xoQ0xeS7ch7Os5N1hY=;
        b=EWmaIBdogHyVD63F+sPcYJcL2KSpeXPKZ3AFQO8koVObx4YUnWJ7591g1JjwLGVq6T
         6vYCeq0mt3Oky7rQiOoErDtvx2cTDA/5R+Vw625bad9uTRdhYQVpugkIaKz9I3K05/3y
         gqwTNY8i4E8SBabp5a1Ax+8BRmc+Z/GcpCT6BYMXMeM0fH6ntCxVCC4jcZnMpU3A6Rah
         KOqZFDk2rR1LehkDsFaka5ODNstVwVUcJbJk+gU+DdMAhmUVqzn/syvSLLLAZ+q4UWvk
         NTc8EW/RIvNDkdmTiRm0vY7Ils+9MVS+qNNEOcrU5kd5HU+aWliNS+EqhAvAR9tbwMKx
         Yr8A==
X-Gm-Message-State: AOAM532iNA0vhQpw6L3/HiWBLW562s5hk7irUOqIssufI3J8qLhG3btt
	XqWaRA6DCKQvbEJfW/UILii2n6p7sZaZvA==
X-Google-Smtp-Source: ABdhPJyihgXgaO5FnJZxYCsu8+uMclg35wfpARrT018wQYJpvsCyhaSNt2mxO5ZsbH87O1NaAxk4lQ==
X-Received: by 2002:adf:ef05:: with SMTP id e5mr8649735wro.237.1629636705996;
        Sun, 22 Aug 2021 05:51:45 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:45 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 51/55] diffoscope: upgrade 179 -> 181
Date: Sun, 22 Aug 2021 14:50:59 +0200
Message-Id: <20210822125103.310416-51-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../diffoscope/{diffoscope_179.bb => diffoscope_181.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_179.bb => diffoscope_181.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_179.bb b/meta/recipes-support/diffoscope/diffoscope_181.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_179.bb
rename to meta/recipes-support/diffoscope/diffoscope_181.bb
index dcd2698ee5..8b2f3cc826 100644
--- a/meta/recipes-support/diffoscope/diffoscope_179.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_181.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "17790d463b757b6d05e0734db06ba5e79ac63fb64bf9b834dc7440477582a38a"
+SRC_URI[sha256sum] = "a295024acf713c58693c152f9a43fae268c08078f60ba502a7947b7840ece5d7"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.31.1

