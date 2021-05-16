Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.3496.1621149670042983920
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 00:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R/3qBxf4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id h4so3102328wrt.12
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 00:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wG2aYZx4rvI+1090itqXV+UYYybCT3JjresGOFM+xeM=;
        b=R/3qBxf4GT4X//WP8CZiKaS1YpcvcXxWoixP/NJyCAaAB/CKEtnlRkzJq+ZJHPhHht
         3mgRG9V6CjbdXN1ov3JouhF8FhA8Gw0301mkKifLoW1Hza7FiuJi5IklJ3BOCBD9RyYh
         nq5XMZLl1ROvIefYvPDQ/BIAEWSiMRrSCQ4rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wG2aYZx4rvI+1090itqXV+UYYybCT3JjresGOFM+xeM=;
        b=bp2k7cAv29uccDfLZD9GIdYv+pnrjz3KGJvEvlEBwHF99kVYuikMrd77xwlB7+hD/r
         rh4XzNJxYNNVSCGuAdJ5IQPq7WRSkn8sQ9giw8oHYc8+KfW16TvHIPpQqxo4Wb3wytEK
         cfx0Cs8rTjm31dAxXjxcfZ7zG2dmYJ99ubNQfHFodZuxVsMI7kWOOtr6OjLqkS3ov5Zo
         DRX826UBVCnLrfUgbfuvRpBI2bzPswYi69VubcVMcoyFIfnoB+3GDPZo6pChhQW7u+CB
         RNQAjvqupj6DdRV8CPYGUQQk8wkkLBUrzSVRRm7Un/jUrkctcmc7cLWrydxUn4VpzLQT
         0AeA==
X-Gm-Message-State: AOAM531UW27nCTuJnOTm6FE3PY1H5A0Ji5GfCK8LIv36WOdZjyqKe6Ya
	Wob1ajfBur7iuU2YDgUWNMWi6bw4e2PGUA==
X-Google-Smtp-Source: ABdhPJx6p9ba4ZMd4Cbd5pZcseOeUNCbXBt9dAiaNeDLijmd+9aBxGsPBTxt6WknI6KnvlTb+yXNwQ==
X-Received: by 2002:a5d:44cb:: with SMTP id z11mr17690437wrr.159.1621149668461;
        Sun, 16 May 2021 00:21:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:22d7:8af4:80b5:c062])
        by smtp.gmail.com with ESMTPSA id t7sm5718810wrs.87.2021.05.16.00.21.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 00:21:08 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] python3-markupsafe: Upgrade 1.1.1 -> 2.0.0
Date: Sun, 16 May 2021 08:21:04 +0100
Message-Id: <20210516072106.2379894-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516072106.2379894-1-richard.purdie@linuxfoundation.org>
References: <20210516072106.2379894-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...python3-markupsafe_1.1.1.bb => python3-markupsafe_2.0.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_1.1.1.bb => python3-markupsafe_2.0.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb b/meta/recipes-devtools/python/python3-markupsafe_2.0.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb
rename to meta/recipes-devtools/python/python3-markupsafe_2.0.0.bb
index cade4e0f511..5e4be22ee3e 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_2.0.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[md5sum] = "43fd756864fe42063068e092e220c57b"
-SRC_URI[sha256sum] = "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b"
+SRC_URI[sha256sum] = "4fae0677f712ee090721d8b17f412f1cbceefbf0dc180fe91bab3232f38b4527"
 
 PYPI_PACKAGE = "MarkupSafe"
 inherit pypi setuptools3
-- 
2.30.2

