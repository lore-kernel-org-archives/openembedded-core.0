Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.25174.1591602497994183207
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tF1z2rv+;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id l12so13372016ejn.10
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2jehE7FSG0HVtjD5/3bQwWJwkp3//cTqVkRT+1jt0ds=;
        b=tF1z2rv+hlcZAWadw+G0Sx0DX8vRoufOGrQFYkaeqWDfmbskzuQEtb8c3C4mvnseUg
         SXF9bkkowyf6eHV1RFoVKVHM6aQaIkTraMVCP7Gfm6jSqQSl6Nz+KQt1MF7weGFrMVk6
         /X1E2afMWZXmuSa801mi4lAwcSRExTSitRAyKj93iLyS5h4mx0l29hiWsj/SipbyEI0i
         DvmWQtoe/Bq8fEvMkwoTT0ehX0O0zn+6A/OYhHAj5xtYw3rcjfwWLHY99paPAFjBhDIj
         vEYN6F8qCK5ZJDuDaizEo8bjB09cuyJsbFuk6Imtxv6pQZFOiavI+o4rZ+OvpJCGAcDR
         KUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2jehE7FSG0HVtjD5/3bQwWJwkp3//cTqVkRT+1jt0ds=;
        b=kqqpOvGxSFyXpMdiRwEt7jgf1kDJHt/0yMRh9amQqLIAzmhXLzSQk4hFHo84B6hUYl
         bVHSl5zfu/0n19r5wXgC7bMZ1gGK4I1FIIwt81JMdEI/RCTFpJ6TefE9tf/3S4dWA/nF
         Cng83OL6C3N2dlIuDItpse/tbL7po8/pmopW7uzzHlmYNcHYa7Q06/DMTZ1tXrS4jHGN
         QLn7a+FzS1KcVjJapcXGX3kXLx91jDFsUtoyuWYNuUdc0fom8qm5oZ8qMOF60GbofTPs
         ivSJ7MwtoxlJN+p91xFNj+KVTNk8ikNepXIcOHE57XJIZtORT1DgVT//klATWeYxYW5r
         boTA==
X-Gm-Message-State: AOAM530VrvA+G1h4EfJcQyPojXLCyboQN3g6kInon3G4JtHDJ8zSU3MN
	+Xd7YPZCN/H6loodO5Uzz4ls1Wg9Mqk=
X-Google-Smtp-Source: ABdhPJzBX5yCCEdxbYOlboyskv06TPIckCbT1P+XF1Uft0hxkqq5ZlMi17ibtyYgNupoiUBwtwy3mg==
X-Received: by 2002:a17:906:e247:: with SMTP id gq7mr19206085ejb.107.1591602496313;
        Mon, 08 Jun 2020 00:48:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:15 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/42] librepo: upgrade 1.11.3 -> 1.12.0
Date: Mon,  8 Jun 2020 09:46:21 +0200
Message-Id: <20200608074659.7051-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../librepo/{librepo_1.11.3.bb => librepo_1.12.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.11.3.bb => librepo_1.12.0.bb} (93%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.11.3.bb b/meta/recipes-devtools/librepo/librepo_1.12.0.bb
similarity index 93%
rename from meta/recipes-devtools/librepo/librepo_1.11.3.bb
rename to meta/recipes-devtools/librepo/librepo_1.12.0.bb
index 3e745314a8..2d9cac830e 100644
--- a/meta/recipes-devtools/librepo/librepo_1.11.3.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.12.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "59b3f76ca6e79786a213cda72ecafa232d30553f"
+SRCREV = "9c173f1110bb30f4ae842a8e3532b275966c2d83"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

