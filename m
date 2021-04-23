Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.37.1619208246560204163
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 13:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WGZZ0Me+;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id g16so8896483plq.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 13:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L4+VuEZdJUsMXOnYYMRBbAj63LByjSl0Gd/JrHTiWRQ=;
        b=WGZZ0Me+BfQRsWbU6HQFfIHR6cSifoZ1opxDrAbkQvpyDxM0hJO4ryUJRkipTQ1OJ3
         ihtRDWLPn4/Mlw7SFUjViAGNmBuMT7nkq3Oe+C2XTZuQR985xsvHVeer8tjgbv6B4mQo
         WVaoBkuwnXzjFKfE2R+GVfkq11y9N6sUUBI6s6dSURfi3qMO24vil/fUlcbIf8EPY7q/
         g5Y/hVX2uN2NneByhvLERXpguLru+CEsZFTnFw9FPGl26nSrvJAIoR8rQnV8pJN+J9po
         nAEsIndW4PIWW/s4kHm3Aq+M108S1vS2q+d2fjUjBzo/WkYdwtEkcWJBFVhox84NNVbs
         CAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L4+VuEZdJUsMXOnYYMRBbAj63LByjSl0Gd/JrHTiWRQ=;
        b=H+Al/H9cLgDG31ZLP/SHENQ+1Dr8j1kb/3yko3YNuqkxidPJTyuEoE2OKnpWez7yjV
         4jzpV1fWZAiO+sQGSFOnQajwjWLuXGKgAuY60+ivpBDAtkiD/B5rt2wp0YDd59PVdWz9
         KTtvhBRSSzBt+3GZCM/kiLHdKCyImVHYyp7ppQtA9+hho7qaoj0rnWkZw93PoOt0G9Ag
         YwFBx1dFsl1OMqlfc+gcIawB1LfENriH6KNYtYnbFGLBZ4tqLVrce+ybfgYr0ibtG47C
         ZessZ13mMU4LdJD22mnCw6b5hqhq1cbYMvJEmgNqStDgwuY7QpkU3/9bz3kXwE7X4Mck
         rhYg==
X-Gm-Message-State: AOAM530sY1VgZa3bmLtXSgFCcxxSVih+SChM6brJzZ5TVm6RDgQaHbVh
	iz7qCIO6PVMGQPCbJrqBXpCrvFZMRuMKOw==
X-Google-Smtp-Source: ABdhPJy7w2mLo+Bj0Rp/Qsz5zST/Ywwx6qbtq5cHVDBnwkkctzLZHSq66fXsLQbqRtAoaAow91m9Eg==
X-Received: by 2002:a17:90a:4615:: with SMTP id w21mr6321510pjg.50.1619208245885;
        Fri, 23 Apr 2021 13:04:05 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id d132sm5201282pfd.136.2021.04.23.13.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 13:04:05 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] python3-markupsafe: Enable ptests
Date: Fri, 23 Apr 2021 13:04:00 -0700
Message-Id: <20210423200400.1108673-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423200400.1108673-1-raj.khem@gmail.com>
References: <20210423200400.1108673-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pytest is now in OE-Core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb b/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb
index 403a98a43f..cade4e0f51 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8
 
 PYPI_PACKAGE = "MarkupSafe"
 inherit pypi setuptools3
-# ptest disabled in OE-Core for now due to missing dependencies
+inherit ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)}
 
 RDEPENDS_${PN} += "${PYTHON_PN}-stringold"
 
-- 
2.31.1

