Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.25235.1591602532254886152
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jQRxNvlU;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id o26so12594913edq.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0S7tJBUTO3P7cJ4Nx8hjEKr1UUErlc0ARVTIM94WNXI=;
        b=jQRxNvlUqd4E2OAUOglcyhS6Q61G3QHrOpP9UCVE5AIQ/uDgzc/RLWx36xZgaFlOBO
         Aao9IrK+eXCT8leYM29MeSUOm1lD1ziHIn6LqYmB0VmpshEtgsz0DF+0AfaYMG6hVfT7
         Y8aeAg/ZtGcdrtx8EFrBV7Ho5kIeq1kzBWTo7wvCThXOS+gioGGr2Hip2sB7L94BlvvN
         NNeB08d5T2p4R4XF517jIt5Blehs2rIPIZkz8fL3+A8Ds979kPawaOkAa6Umq5D8i3PX
         aXwrARA910tNsNjEeA150SwFi0Cn1ZV71Ar1thAa+PHRFIMnV2qpUKBeHxeKSVKc1y+t
         fv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0S7tJBUTO3P7cJ4Nx8hjEKr1UUErlc0ARVTIM94WNXI=;
        b=NTsncqp0NQo2oGDGRYnjW7Mdpii3baaSKBcsj7v02t/3w2d8Nn5iGWOL5t8om03KUt
         LtTNETtzuzjwwPtixrtSeJjDsuwG/vAj/53mRqeT8ya4NLPjDWL2yIvJMrhjW/2Qx/Qv
         J46MebX5fbgaieNobXq2DSLgXgLOFzrv6U7w1OSTgQ1xjM7RTsl+iNM/DVmZZ9vRmuRU
         k6hMuaBDwnud4vrWCDSXDNS3067DHizfF5T4iWU+nAvcDXddiLUrD4MKNfaemueC+nk5
         Q+v794f2gvuyeRePF/i7nLJa2ybSS30KKDiyA2hprbJ777JqHMpMNiAh9YjWn/7bb/3r
         C/MA==
X-Gm-Message-State: AOAM530lW/aA79NFBWqeeV/+0b60gqcdydMvyXRZA5krKLM8z8rOAMpN
	EaSpZwdGLCov0FCoZOKD9Y6igt3DbIA=
X-Google-Smtp-Source: ABdhPJzNF7JlGoIh2HTvflqiNHZni3j46T7bIxhLuweuR+bzlDPaINOULyBAL3HNKZ0oMscStqWqKA==
X-Received: by 2002:a05:6402:306f:: with SMTP id bs15mr21585754edb.331.1591602530674;
        Mon, 08 Jun 2020 00:48:50 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:50 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 41/42] ca-certificates: correct upstream version check
Date: Mon,  8 Jun 2020 09:46:58 +0200
Message-Id: <20200608074659.7051-41-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/ca-certificates/ca-certificates_20200601.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20200601.bb b/meta/recipes-support/ca-certificates/ca-certificates_20200601.bb
index 37ba51ce6a..6f39df7985 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20200601.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20200601.bb
@@ -25,6 +25,7 @@ SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
            file://0001-certdata2pem.py-use-python3.patch \
            "
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+)"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

