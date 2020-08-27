Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.16346.1598526019546477246
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 04:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hk/OwMCS;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id a21so7079496ejp.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 04:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=97NeBEMOQnHM7hgfz2qOyyYDU4NHeuqv+hDoyiaHpSI=;
        b=Hk/OwMCSnYDxqtKp5pxx3GR6zXG7AY2BjoZllckgeDzqDB4Anfic5zmS0HHOb9y587
         2dhxHPdURMBWcxfMT1XiHSjkEbyQYcsrqUWT/ptKt6BbyDYGz9Gqw1g/wHoVmtMh6zcL
         hejMzHVSScdouzMynCjg3vYvMIu4yuLs94DzmBBZbJCu7VJtf0sjbe1CLpZ0RoUH7tzU
         JshSCb2UoU4yf9qV4VroOwzsnKwz7ZuZiENEhytoMr5BnKv1E5qzAST1G/RibNvKPYDw
         G9ah9UOWrtWnBGR75QtAQGjKdBYsKJrrj0Rq+oZxR+/vegJK7Qs2bQu5S+HccPia7hAO
         5oEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=97NeBEMOQnHM7hgfz2qOyyYDU4NHeuqv+hDoyiaHpSI=;
        b=f1Wzk6Or4LKIY/M9fqm4RDOJArvY/PmgR6bTV8LCSP1PCw5a7XSFDknaFsrG5l4YLd
         yPiSIBpRfOl7enr3BW2fnIGIEmlBQ08j/jUdUUD2T951VgyYFO743GWleGG3O6lIi8Tu
         3w8nK2hyVzzlSTRketVFqEXJKU7ltSLVEVPNwaCK8uR8pz7HN3DbaC4sqkiUvQH4h1Ys
         PJa7kibABLRANKmRST//bw1dPh0sz0o2GMjCu0CssZf+/n6A+xA63hxZTKKumfMGtwNo
         09vJSwo7KDHa574bCbjLkyty06Hs0drjV0UGgzeoaur0Y4QouGGrQbAH2mMFvCGMa8pt
         l5pA==
X-Gm-Message-State: AOAM530pq+t6FXOlZyiP1wcJWmV/gpRF9VZE+JGrFP7zjKO4BxkQ02Ns
	SLcbxgWZreC8yy6ChOUt87NXhNcV5+A=
X-Google-Smtp-Source: ABdhPJxafvJ2XH62F3qWKMUjnFeZLE5Wu79NA6y8S0NpgLb7JmAwTFocToY7BYXDbWeV/+SCglnzuA==
X-Received: by 2002:a17:906:27da:: with SMTP id k26mr11416393ejc.319.1598526017769;
        Thu, 27 Aug 2020 04:00:17 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id eb5sm1623132ejc.94.2020.08.27.04.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 04:00:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/6] packagegroup-core-device-devel: remove
Date: Thu, 27 Aug 2020 12:59:30 +0200
Message-Id: <20200827105933.3575-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827105933.3575-1-alex.kanavin@gmail.com>
References: <20200827105933.3575-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The purpose and content of the group is not clear;
the only consumer (poky distro) is no longer using it.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../packagegroup-core-device-devel.bb            | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb

diff --git a/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb b/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
deleted file mode 100644
index edee474eca..0000000000
--- a/meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Provides a small set of tools for development on the device"
-
-PR = "r1"
-
-inherit packagegroup
-
-RPROVIDES_${PN} = "qemu-config"
-RREPLACES_${PN} = "qemu-config"
-RCONFLICTS_${PN} = "qemu-config"
-
-RDEPENDS_${PN} = "\
-    distcc-config \
-    nfs-export-root \
-    bash \
-    binutils-symlinks \
-    "
-- 
2.28.0

