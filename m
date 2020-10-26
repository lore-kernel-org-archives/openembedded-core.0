Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web08.11248.1603712355604828129
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 04:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JASI5nfJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id n18so12037482wrs.5
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 04:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F5wf96W3Gew18hB7btpCD0Wd63JgcHhebhaLAisO8LM=;
        b=JASI5nfJEqpxZm5oMA+k83Q5eo4vbjBM/AYWD78DGzVfCrudNufrYxrCKphNzjZhDi
         I63CeiojgARzsO4WZPZib3mKjZ/5NKPjHAN72F4QS7F5cjKaj4jCT8PuiiQDdZ+c6mQi
         2OC4HrwaNejsn/N8YEqfWj82/JEgniD+mmFWvFi28iu8ajeXBHAzGayN9fQtbX9BEWhK
         k586twcLGs4sAQHBgDUxmWJSydtDoqkBA8VkYW6iwW2ZwdCWfN3/NB7jHt4EvVM5jpT8
         Ar+jcVAbFI5rPkXQMSjbUADev5SE7OLwiFbAVsemgIgaSxrYdt0u73/JtJc2vSmzXI5E
         gr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F5wf96W3Gew18hB7btpCD0Wd63JgcHhebhaLAisO8LM=;
        b=qUqv5U/MFITBcpd++Z6qnYYcGDt1ppS19QKSOu9PULaK5gYg5R+SBBGrogrCi/5hhE
         1Zcd1ioivlIjG6dEwb/GDnJtI3OlfQfJzUPjIEE5hzNxqzF2tgmmEA4JVahhnaPbjdSz
         l/t1boTd8W0ZgKDJUGIpFC6VDunis9rXWrUUbDdUlKIePqpI1/P/wuZiGHbqNwvIadsm
         lXYPLpoOVhWsZbe0ESS0VMZKzw8QGp4+YcjfTqZBg3CPFF3raRU/cy6lNSuUPGPpd0uK
         ScrSWOwQnzrzA1SP8Bi4RV1Dte9+aDzCwvBO2co+MdoKLcfWls6yW6Ec5vV79WqXfIfZ
         GRhQ==
X-Gm-Message-State: AOAM531+eFdqt6vBb8tw3L5ZVz6xZq5cvMa3uO9JYnVB9RVE1k+wKRRW
	oBkUzJlQtaEcKdklOjxMgH2MhvBymEpcLOlM
X-Google-Smtp-Source: ABdhPJw1fscnt56iZ3CGtUmT3n2zi3KH0Fgdk92oPhOTQqSwjmAALqcYHL9cvs4BjXW7DcN8AKL1HA==
X-Received: by 2002:a5d:4691:: with SMTP id u17mr17641441wrq.324.1603712354041;
        Mon, 26 Oct 2020 04:39:14 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id d129sm20348493wmf.19.2020.10.26.04.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 04:39:12 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 2/6] spirv-tools: enable native build and install more header files
Date: Mon, 26 Oct 2020 11:39:02 +0000
Message-Id: <20201026113906.2217226-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201026113906.2217226-1-quaresma.jose@gmail.com>
References: <20201026113906.2217226-1-quaresma.jose@gmail.com>
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
2.29.0

