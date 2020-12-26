Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.19128.1608974895106769651
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tSkYiTer;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id w1so8267179ejf.11
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xUsCsMPcfa2FFByp5Txzv04V5VtvGGtOMyqi1KidYWk=;
        b=tSkYiTerh9/deiP57iIN8W3zga3Pzdl5Ct2dcUYvWbuTDuFy5mABuDP/KL8+jqHeCd
         Df+9DfACWhQRFuI/X5arCnQ9qL7HoL9l0zEc2EWsDoGVDrrxwx09evRgWvWnbF7UQ/G+
         MPmCKwn4oerkzQlNtTI9jRTdwmJLwUOw7r4nxWDFkb9jBKfPzS8CPw7EzUF1ScjljEfS
         6TmQUJ8412N91LIS4sOvuqenNo6EKVsqPEXfq0I47i0bqNcKb9gIqKB5QZ3yMffxYh5K
         4R3I97S16CDaeTOH3BoxzKsiXYurybx/5M2UW4aI618XI/jjM1P/Sm2eBtBAPkgT7j2V
         rIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xUsCsMPcfa2FFByp5Txzv04V5VtvGGtOMyqi1KidYWk=;
        b=oBLS4cxASsmMAXZjWqyQ/tkrmOV8/7lRnvCmO84EY/gDU81MkNPUhs3LHATQN/n2oe
         Jwyg8Weig4GIantp9D/S89wwuwcM37w7+olib4hibPdWVUk9GyVf4BLtja3dpgQvm4W1
         gP/9S8V4DFgfvvSuMxXi0veqk50j0kNdQlUG7r1QBUAK6sLtLhz6JirTDUBBL/nhdIO4
         qbOn2mRPfwElSrUDpK+w2B2FvVHKOGDT+2FbUFwvUFbfzhqpxy9YPmT67Rcv7K10+2fi
         c8dFr1RzylQdA7Mki01kPiNTEKbg0xNRwUi7whtamUykbt3kHEsTs+czz+xee9QBFD8m
         wh+A==
X-Gm-Message-State: AOAM531i8OfAkwo3+Rf/i1GWFmDouRCKhWmUKXd6FYy4sB0dOu51Zacu
	dXoVXZPwB1yWO99tGHfGdMFAAZLkyzw=
X-Google-Smtp-Source: ABdhPJwz4H5t46jMtlHTnv2mt49XKLtN2rRNLTtsX4oceHh/eHwArW8V6CyRkIxDcW/m27W4bCqPPw==
X-Received: by 2002:a17:906:f153:: with SMTP id gw19mr34985343ejb.272.1608974893796;
        Sat, 26 Dec 2020 01:28:13 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:13 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 40/48] libdnf: update 0.55.0 -> 0.55.2
Date: Sat, 26 Dec 2020 10:27:24 +0100
Message-Id: <20201226092732.52323-40-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdnf/{libdnf_0.55.0.bb => libdnf_0.55.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.55.0.bb => libdnf_0.55.2.bb} (96%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.55.2.bb
similarity index 96%
rename from meta/recipes-devtools/libdnf/libdnf_0.55.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.55.2.bb
index 07b3df40d3..e22255f831 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.55.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            file://enable_test_data_dir_set.patch \
            "
 
-SRCREV = "3f8981c9c5066e5243b695c904031b90f8d57d4a"
+SRCREV = "d2d0ec98fd2e0a2623123fb1ddf8fdd8936c6046"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.29.2

