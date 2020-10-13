Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.841.1602610539041492292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 10:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OCVP7XZI;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id n6so228641wrm.13
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 10:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tNmoo/aQGBqC7ADbfpMhrGCGKgUHlP2pOsq5Cm1FSTQ=;
        b=OCVP7XZI/Wla98sln23GixY6z+7CEgbMbhT1KyO+3zdDTL+wr/Ho7onkmpjNaa0D/b
         h6DeoXtYHAOa13Lo79iwzrOls+FdCR+oo1tR8zq+4xWPrweZb6DQEisD2fDEaLipe9Oc
         7SSAxWgeDSChCDsNaeuGnBlLmKj9zjB9MaGGF71baPptSDingDxdlhAzrgLEIAwqnzTm
         7ym2razCCxwZtVc/8VPanfGn6/zTEpeqpXTGa53E0f1tIBb9xYw6A0t8hnjDp5h6dVu3
         4uUwL47SpKmfL1Ikt5Mg4iHaljKu/ieTAtCQr+W40+wtsKw6gW4SSOH/IZ7RoMPxSfMB
         NlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tNmoo/aQGBqC7ADbfpMhrGCGKgUHlP2pOsq5Cm1FSTQ=;
        b=FjegeXV7TOWhtYrlF0JVFGht6cSAXCb+M8hEQ5nhOB4FiMNbBg0xeKMoiAw9FYG0Tl
         3RyhS7uLpBaBDyHvNPvQs6WE9pLHc1WfkRijLmD0hYSNwK/0DgsRcOWSOZhcxAabcdei
         UywAtQlyF9i5reZVqV9cDz7+YITAgqpM99SKC2ZIwXw27hsxruWwj24q5fnQLF2FWyjh
         Wdaoj1dPjYBEweJXUYVEbyEwACfVmqBnslbd1zO8qZrq3seugvlAVkdA296RtzdzOxih
         5J1W3OsybPw8uBj8Pqfy+Cm1SuSyO9N7DBama0cRdjcSnAUqUmFHqb19o8hwNGIchm/q
         pG2Q==
X-Gm-Message-State: AOAM5319y446PDPUkQZiGIvyU/0Zgc9M4BBqVT9bNu4apMZLoAzBdg4T
	tbrap1EqZu6PM/sOFZOz4bHa0EY9BgvF3A==
X-Google-Smtp-Source: ABdhPJyeJgu88rYjbvZVKfgD1OISLriEmzZXDaNKLeIAij2blCuBBFwO9Bk1E1IAM6NuEEdOk+8CpA==
X-Received: by 2002:adf:94e3:: with SMTP id 90mr809649wrr.380.1602610537443;
        Tue, 13 Oct 2020 10:35:37 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id w1sm297412wrp.95.2020.10.13.10.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 10:35:36 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/5] spirv-tools: enable native build and install more header files
Date: Tue, 13 Oct 2020 18:34:59 +0100
Message-Id: <20201013173502.2245733-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201013173502.2245733-1-quaresma.jose@gmail.com>
References: <20201013173502.2245733-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/spir/spirv-tools_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_git.bb b/meta/recipes-graphics/spir/spirv-tools_git.bb
index 8e8388e8d4..89ebd72d31 100644
--- a/meta/recipes-graphics/spir/spirv-tools_git.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_git.bb
@@ -28,8 +28,12 @@ EXTRA_OECMAKE += "-DSPIRV_WERROR=OFF"
 
 do_install_append() {
 	install -d ${D}/${includedir}/spirv
-	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}/${includedir}/spirv	
+	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}/${includedir}/spirv
+	install -d ${D}/${includedir}/spirv/unified1
+	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unified1/* ${D}/${includedir}/spirv/unified1
 }
 
 FILES_SOLIBSDEV = ""
 FILES_${PN} += "${libdir}/*.so"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.28.0

