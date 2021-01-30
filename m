Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.1085.1611991199933046826
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 23:20:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ebn/b2J7;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id g3so6726943plp.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 23:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BczXtvbdp4XRELhAbtsy/zyWvb+SZb3tVCwShyIt1wM=;
        b=Ebn/b2J7kn1w4oF4M0xsE6IAUJNrB/RhcyIr0uH8D6eG8MQ8YzxoNz0sgA/7OXtUUy
         FwwgiNv0NvMUgtAwDT+xXzjqaWvQNLmLIoSrGLNkC9tuBHx+rGGoXsAlS6qKYlxqQiq7
         ADg8J+4YX4YXHh5us9gQJZCzmFyj5L+BwdJlqecP5yzadXeWFLNWZcjijM2lG8zTQpYB
         fkBW2NfO0TNljrUbyt57EdWvcwwpqw6BdSJjSWh38GfGMXcTatP4c3qk/Y54rS60mdz7
         eChls23+tTLbW8hO6Ec357RTYFTYRh1R/EJfzR679caexaJnQtYNF5tXnIb3ve5wHfGY
         ESEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BczXtvbdp4XRELhAbtsy/zyWvb+SZb3tVCwShyIt1wM=;
        b=ugnUxQMYDat3gE1oKlb5ZZyZqM6fnNOUNSQ8RmdRGh6oNCegD6dP0+zx49cvfNGiY7
         mKUwqEWmyGlYCQPvnVw1K/hcawv1I4ggPYCVZ1Mt4vas/6G7ZFYrKlJzUGQlvu+QQSAs
         GkolIwR5+IxVHgBStujaJFMExUAFR7bqc5nPNLv/dl+8OrSi6nHggAHcnOxxOu3Y05oX
         +6ZIEyWSR9/9p+v8AbwytIqECEL6atdWEhObjlDPT2lCW5oMIZfaBP7aQKxPXkzOW5Df
         W2mkqO5mD1ZgTvsUmiM+ivbLgG4qlutx3P8Ji3BJRMz90K44rNjxMjNSZz3P/sqQFUDi
         8JtA==
X-Gm-Message-State: AOAM5336yygKX5J0iLtPsB1nPYfUnGTTS5Yg4EE9rIB6Eoyp3rdXOEUz
	QlSvogkzpg97uvTMcndMsqL7sKMLN5NeJQ==
X-Google-Smtp-Source: ABdhPJzBFWSrc5vVLTx6Y+aYZ7CIFLMp1tAtUGL3ofkAmhxXOzjbxB9gKtfw/K8vlZkgUzx2WzDiCQ==
X-Received: by 2002:a17:902:348:b029:df:fa69:1ef0 with SMTP id 66-20020a1709020348b02900dffa691ef0mr8564103pld.41.1611991199306;
        Fri, 29 Jan 2021 23:19:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9296])
        by smtp.gmail.com with ESMTPSA id m18sm10797221pfd.206.2021.01.29.23.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 23:19:58 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/5] binutils: Package libdep linker plugins
Date: Fri, 29 Jan 2021 23:19:51 -0800
Message-Id: <20210130071954.2695419-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210130071954.2695419-1-raj.khem@gmail.com>
References: <20210130071954.2695419-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this is new plugin added in binutils 2.36

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index e93cd50b20..81891963c8 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -18,6 +18,7 @@ inherit autotools gettext multilib_header texinfo
 FILES_${PN} = " \
 	${bindir}/${TARGET_PREFIX}* \
 	${libdir}/lib*.so.* \
+	${libdir}/bfd-plugins/lib*.so \
 	${libdir}/lib*-${PV}*.so \
 	${prefix}/${TARGET_SYS}/bin/* \
         ${bindir}/embedspu"
-- 
2.30.0

