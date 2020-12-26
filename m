Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.19485.1608974875691173331
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SdhvOmn5;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id q22so8344870eja.2
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xFyVyOZLE8DgpfKASKVA3KtFdkWpXGDtqYL14k2gBn8=;
        b=SdhvOmn5qJK2NGXFYK4KtX2LE4RW9kj7CFtAalJMHAaN3C3Fv/fUsQECH1cs1VK++A
         IA8Rk7wsif6in9PBB+VLHaLUPDi2urkznV3Zww/Lo/aPzUnvo/veUMNe858PChkGqjuZ
         PU4TgTo+ILZ2QHC+766d5t51twH8+KR1A+E2hjDPJW7HZM6SS6pc3NdhZN7IKO1f4ZQ1
         t9cWgjUsACFRM62uVEF2Vx4LCnZ8Fx3Ys4f2WDh4ckxb1Io1aoIBhVVi+dcvXP1pV2Cr
         buPqx0blO4zo49DgrF6ynNIlGck3VQAYIwt5j4ZjIaqdhoJYpL2dpfd3c++vsQG+bM08
         cAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xFyVyOZLE8DgpfKASKVA3KtFdkWpXGDtqYL14k2gBn8=;
        b=kbrDVkcqu8B/F1WMMr5bhTeelodf4IguuAe5oQ+mkfXh56rzFjhGWiDJMpTMfkr89q
         W3r7rpyVYWYoIcIsKtf5i59OMi1wmyT8ptRQWEUtgVhraRJ8ydRJKsrw69Ambnxb50kp
         1tzP7UZ433sxJi003zrdrX99M+SQEFwE/WRHTNShKYaA6b+XLVL4unw6OnfMrAFwvfOc
         tO3xo7E7B+Oa6XUyHcl6CO498Hg4adJDN9EudovDr9whmvRVULNrPfOlixuRqjRgej9S
         jw+ZUQlF/Yp/lEZGhcWr3ful8cy5zJ5MYCCedu8+rgasjbLCE1vcyq5YBnWCgbCjm4og
         2p6w==
X-Gm-Message-State: AOAM533KurKNkRa7wvxbF10B9JrWOWJ+hMMUTJkFwH0EfNM+YTi2CV17
	jbk2IyANP+oh3wL0kNdnX4iw1e19ZOA=
X-Google-Smtp-Source: ABdhPJwjXzFG+GXSAsqahkn2ky4Mki+iXwblvRd4TXyiAz8sDhpf3AJsOSKNPYYTnaAILt6p/wcS+Q==
X-Received: by 2002:a17:906:d784:: with SMTP id pj4mr33345502ejb.360.1608974874309;
        Sat, 26 Dec 2020 01:27:54 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:53 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/48] libtirpc: upgrade 1.2.6 -> 1.3.1
Date: Sat, 26 Dec 2020 10:26:59 +0100
Message-Id: <20201226092732.52323-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libtirpc/{libtirpc_1.2.6.bb => libtirpc_1.3.1.bb}          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/libtirpc/{libtirpc_1.2.6.bb => libtirpc_1.3.1.bb} (86%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb
similarity index 86%
rename from meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
rename to meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb
index 10a324c3b6..5792264250 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb
@@ -12,8 +12,7 @@ PROVIDES = "virtual/librpc"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-SRC_URI[md5sum] = "b25f9cc18bfad50f7c446c77f4ae00bb"
-SRC_URI[sha256sum] = "4278e9a5181d5af9cd7885322fdecebc444f9a3da87c526e7d47f7a12a37d1cc"
+SRC_URI[sha256sum] = "245895caf066bec5e3d4375942c8cb4366adad184c29c618d97f724ea309ee17"
 
 inherit autotools pkgconfig
 
-- 
2.29.2

