Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.19287.1608974867147700922
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kc3MOjrB;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id cm17so5578960edb.4
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g526SPZvKq805S4EE+OCuTTErzLcpynyqU2G2C8fc8g=;
        b=Kc3MOjrBbvH5uUastMLofCL2Xg1CCjdQEbCjLB4z4Ti11LLvoFfFMJk/tU643rJxq6
         8Sj9Wi/eB+qUue9kt/UB2rSpzCIhJOaNq4+RINEs6yrd+ICv/yQjMoQIgHYJYOuCt+x0
         9V9WJ2TRFGpdkMfSLx3NNSZFBnz9ug74coS3RHLPL/CmyQq5IVZ6t2LjwNktlZrgR3NF
         0Dw2tONdqya+8Gh6uGeQO8Cq4k7vUdCc+ois2sQMOfnvRJ0DEOf6K1yD7tjfhpLHg0nE
         Ut2nX9ZtMDzVvOFLyeHN/3wNjzd8uHOPpbsuldJy2/lEK3sAs+xyVD8hMNJyDGcIdNSl
         cdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g526SPZvKq805S4EE+OCuTTErzLcpynyqU2G2C8fc8g=;
        b=EmTXX844u26e8RTfCO2W6zJ5N6DTaU11bYxADv0Fk3vyNuOqHyEcYg+lTWz7OU2Rz6
         nMsL7pJfhLLerEqIdA4fsRNmaoFLXB2+QiWvqiNZG7HbYOAhXDCtnrWGJWUxfeH3g+CC
         Ca9OyngFXwNKFtcPyhwwTeevpQNx0bYz9Dd+QCOBRNdfUUmG6umhi9W9vVZGyg+V3Rpc
         WWjsv3XqEO5Omn8zKbuFlLMTozXFBb0ChXntyhfsUiOAjE9Onb6hdgqWyJbvrOqSOnvQ
         yO3CRmXHR5mng9JbxrGG0ko9Q7c8VUj6UN868G4xiKWNOZrfL2SIHPzQPd4lT6EUzgDG
         pQPA==
X-Gm-Message-State: AOAM531uyqfKN45e/SOAYO0enQAJniIm/1BLN4/eyn1WDyGin5S43lA/
	FbrHw5sbS3pPLbY3LKt3AX3Zh6+SjUA=
X-Google-Smtp-Source: ABdhPJz5hu4u5kDLXfFpfU1FxC24PNCWC6pcCtq+boIUqQxF1PZ6siTc4d6ff1ahKlW2Ow8oPlb2eQ==
X-Received: by 2002:a50:fc83:: with SMTP id f3mr35122715edq.219.1608974865807;
        Sat, 26 Dec 2020 01:27:45 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:45 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/48] diffoscope: upgrade 161 -> 163
Date: Sat, 26 Dec 2020 10:26:48 +0100
Message-Id: <20201226092732.52323-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../diffoscope/{diffoscope_161.bb => diffoscope_163.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_161.bb => diffoscope_163.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_161.bb b/meta/recipes-support/diffoscope/diffoscope_163.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_161.bb
rename to meta/recipes-support/diffoscope/diffoscope_163.bb
index 0f566a3ec7..2b66d628fd 100644
--- a/meta/recipes-support/diffoscope/diffoscope_161.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_163.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9c27d60a7bf3984b53c8af3fee86eb3d3e2292c4ddb9449c38b6cba068b8e22c"
+SRC_URI[sha256sum] = "1afeea6e383bdd2626a9e9b827ff487723c0de581d9f9f4d4f5fc9b65728662a"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.29.2

