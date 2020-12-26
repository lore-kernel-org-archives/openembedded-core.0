Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web09.19121.1608974874056606616
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lIy6H4k5;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id lt17so8325023ejb.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bwx/Qew/A6hXW3ZUsZXe0I+NnXu9keKdEtMJAEQP/oA=;
        b=lIy6H4k561ZNKPJT9WLUHuYNTotBL6B5WQ0zN111TfEl6x8ZTtlGxNZ3Y+xPlkimvM
         EFE8nTJZVwlZexVows4ZwMQhEkvlBLPCcj6dxtwCwZ/nKxSOWM5oaVOgoHobKRKRBRkk
         AtR1cwt7sHTfhy/dR7MbiRo3K87ldEe08zwr0BVT3SILPBdlizY7aZM/zzDDmEx5mwSZ
         pFfmzgd0l1b5/1racXszOX7FqE1ZV6eL8lgpBkFtmYMNloFA4M171d+EI0XdeP9IZdTQ
         9kIoXKmSisVf+2oHXqUQen/TKlo6/fxzA6+gDYbF+haARnBrO7U3Jqx30gNuPOTQWlbs
         t0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bwx/Qew/A6hXW3ZUsZXe0I+NnXu9keKdEtMJAEQP/oA=;
        b=AESOhs4UpYZK9Ejh/+F7f/gkOQDtXt30rk7h5ebTCnxIVLjsihDWKIcYWvioYrZup0
         LVRk1gDJw+gUQb0Cj1Dy4bqR8Us7jdTbHQB2kDigyKHnu1HP+2N1hDPtSF4HL2auVt8w
         l9Y8mxkPqoMRntwIWZ2iBZvADvVXk9Gn0Rz9WPYVXrNl/saV9zjUR3veLcWEfKKjxUzn
         jLAD0Nicjmirr6+zsuotq3x0bFbV/MFGTI8uvA0XBtlOcj5rN1EnzyjRJzZb+lsIbmts
         +YalRJhw3Nar2d1KUhv+aXgshU5l0XUT5qRW4XZrZk5+RJ7qkQxS1aZKZ8HgL3fOZGvW
         N8vw==
X-Gm-Message-State: AOAM530OeC1YHfvvF/qiQ0ekaG5afxgnzEt/TdIVGkio/bNDGKzW95dA
	POgzYXBcXUgPA9ws2E4Br0haQc8af/Q=
X-Google-Smtp-Source: ABdhPJxiIGowcOYYoDoYxvS4NKfaiPV9PhWI+PClQKkLfflMYpldiZ0Py3o30dgUDBYUZLlvCTLNKg==
X-Received: by 2002:a17:906:4c85:: with SMTP id q5mr34128446eju.375.1608974872727;
        Sat, 26 Dec 2020 01:27:52 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:52 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/48] libmodulemd: upgrade 2.9.4 -> 2.11.1
Date: Sat, 26 Dec 2020 10:26:57 +0100
Message-Id: <20201226092732.52323-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index 10204acf23..b9a64f00e7 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -6,8 +6,8 @@ SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=
            file://0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch \
            "
 
-PV = "2.9.4"
-SRCREV = "c7254db07b21495fc9bd247c5b17ee20149c05e3"
+PV = "2.11.1"
+SRCREV = "0ead09d0a35b9095e1a01afd540abd7217b31fba"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

