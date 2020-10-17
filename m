Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.14020.1602945010464698952
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2020 07:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mhzei9Gp;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id z22so3012726wmi.0
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2020 07:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WDWRkocq7mVvnexhfzrGa/UBlO++eA+Km6/Aq52AJoU=;
        b=Mhzei9GpMJrGQO/KcaLhvnBqfRQYxEX1RoOtu27YF3Q/NaYQN2GRmZW7Xg9qtbBe96
         9skPzdAsctmKcsTl0UCR1/0Qx6zcC3+NQtoxLxLhwalUDoJvSPqUhj+DZ6Qvqs8dbhb5
         VAXYkUMTDrlyISJEkRjJUXXah2y+ZmZPdweRVAGWZNLw6MDNAqbp6BB/UJQCtoXGzafk
         klJ3mQlPS7vBlt0INjGKMzxCXaXeIZHUN4l8uNNl68SfpVlggneNd2AvGE71WQZ1mbfv
         iwSbpmjrGPTZiSNXnzqP4PGqDvnM0zg76n2CACg//Cwev0nI20IS+K7fKoAey8aI1Iih
         LuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WDWRkocq7mVvnexhfzrGa/UBlO++eA+Km6/Aq52AJoU=;
        b=seIoOM2EgtVVTFeWLIvdWCSkrfw77o13iBRCxaMsnZQyHLz1gZBi7KCO9w2kxYeThm
         Mv2VwFc/YkyPt/f/nAfrE/xeVEOGo6HFQnmXv7vmX1ii4RgYSM1dq2WQEcq59nXAJnTQ
         3gT+01BXzJdrg+D2zv1deqND8riThI+qypDVDmAJdg3TP+jlJZnq//Jon5kMvQpAB3fj
         pZ7XhVKa504b46ycJQ5oYGM8ioLRd7xVdpfY+RRsZoGt0Dihyqy9tivAovkCgbnA0NoM
         5dCVOdvutFnoUCpaW2iWnsDVVspqoKCyy8wh3WM+GR7LMAS8d7RWJW6Ojq3liaK7zQx5
         o7aQ==
X-Gm-Message-State: AOAM531Q0pYlDIHxXZdFFC3H51ZNu/JMM2OsdtAINGh9n3CnRZhkty0D
	TUp8BzPDz1STIPPBU7ELIsO5UQx5WiAi+A==
X-Google-Smtp-Source: ABdhPJyRu7AEJk5MCO1aqI3jv4o+5fOGiGxdrNQVaRrrnq1J9i9FcDn1hdoqBKVpHaX0tnYId0cDxg==
X-Received: by 2002:a1c:7f14:: with SMTP id a20mr8915784wmd.95.1602945008770;
        Sat, 17 Oct 2020 07:30:08 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id c18sm8816700wrq.5.2020.10.17.07.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 07:30:07 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 2/5] spirv-tools: enable native build and install more header files
Date: Sat, 17 Oct 2020 15:29:32 +0100
Message-Id: <20201017142935.3605756-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017142935.3605756-1-quaresma.jose@gmail.com>
References: <20201017142935.3605756-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/spir/spirv-tools_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/spir/spirv-tools_git.bb b/meta/recipes-graphics/spir/spirv-tools_git.bb
index 8e8388e8d4..d1c2436cd9 100644
--- a/meta/recipes-graphics/spir/spirv-tools_git.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_git.bb
@@ -29,7 +29,11 @@ EXTRA_OECMAKE += "-DSPIRV_WERROR=OFF"
 do_install_append() {
 	install -d ${D}/${includedir}/spirv
 	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}/${includedir}/spirv	
+	install -d ${D}/${includedir}/spirv/unified1
+	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unified1/* ${D}/${includedir}/spirv/unified1
 }
 
 FILES_SOLIBSDEV = ""
 FILES_${PN} += "${libdir}/*.so"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.28.0

