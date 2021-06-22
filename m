Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.7541.1624360898981685422
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hn42SeZ7;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id c7so22178000edn.6
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yrhYb8/uTPfb25Yu99AF9MoqFLSDnr0e6L3PcDFZxbc=;
        b=hn42SeZ7l5ELVWltNswguGaMWAcxXFbAGwwQ+0/1sPv7AeV0puK8nDpDl4m5gNegj6
         VkrTSeL2cRVYEJ8CrAdqfNPjajUiZpFmzH4SAk2vzjD9Yi2796xLiyIB4zRueo85dnZS
         PSnKSTRJGZHN73SE9mpl+0sKd8hZxVS0LKay43a9JFzqy9VLt78gsbGV69WdVAcvN/jI
         xhJlGj6gUyKwXE8Q8gMG98VFnjgMakzJyuSTVdIxvAPHVUlGf3PHZQ2KuIdgXN9o1fko
         eqVMt+w5dQwWhe7j44gUjfk+QweRs2ZhlRiI58sXAye9pCW2Kn15Ts8TAq3w+768D32J
         yK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yrhYb8/uTPfb25Yu99AF9MoqFLSDnr0e6L3PcDFZxbc=;
        b=CS+gBSTKkXXuDFFuGLBBILkAv++ugKZGY1opVdCFKapvOS3sTl/Nx/eiLwb/WS0nOr
         R6DvT9ArSjn6mZHgxY9JNXKjkTrWMMCwYHjmpEFlLSAvn/US7UF42qjGT9C+Q2GYr/eM
         1G23I8nIHrh0Q17mG+Zr8ixe8E/oteQFVe9XakPKh8910J8J1AMhY8pF63fLFjrUCNg8
         4SViEtCEZ1eT3k78BSiM63tuzsa5W/nm/bWSrI+OnHIzyOvKdW1V/bt9l7mK+p8Rp3Jb
         IfOstPbAdmgkNmCN8mi9LX68xwGXVQnMDdRP73rHuE1xgtaeblY6rfEU+8aXhyqu/WY6
         c1Fg==
X-Gm-Message-State: AOAM530Fh7KuWkeMPJ+v29kqmdII8aBpqX3LmwnbiUwEhZHGa7DJBlBr
	csjTFor95aT1LSXvQOhccXQ5jxDtYhr2Cg==
X-Google-Smtp-Source: ABdhPJwUhQKDjJVizeUffoPyvSBV05WAPP7fhTG/0ZXYIVLwVdSkndxxpcfR/99QE47npe8TCdEA1A==
X-Received: by 2002:a05:6402:498:: with SMTP id k24mr4220267edv.2.1624360897666;
        Tue, 22 Jun 2021 04:21:37 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:37 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/19] libdnf: upgrade 0.63.0 -> 0.63.1
Date: Tue, 22 Jun 2021 13:21:18 +0200
Message-Id: <20210622112126.2026646-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622112126.2026646-1-alex.kanavin@gmail.com>
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdnf/{libdnf_0.63.0.bb => libdnf_0.63.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.63.0.bb => libdnf_0.63.1.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.63.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.63.1.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.63.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.63.1.bb
index a26ee55cb9..6ffeb945bb 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.63.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.63.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            file://0001-drop-FindPythonInstDir.cmake.patch \
            "
 
-SRCREV = "669a5c691acba91693d238d6262ac99a440aa9b3"
+SRCREV = "8e451380bf84bd76e3925cbae2a06bb0e56f5cd9"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.31.1

