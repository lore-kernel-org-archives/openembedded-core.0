Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.1328.1625540585898479676
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 20:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PkJfoEX4;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id l19so5990680plg.6
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 20:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7WOYlNM6TwhYBrAHPCoyk8KYBz1L4uqibgVytfxFWRk=;
        b=PkJfoEX4FUbkLZbwkGRsmu0ee54ybZSFZbUf+xRp4GPHdd/GaPs0nbZ7GiN+n/9JUF
         htaBBEewnkokTKpfhxRNgh6yLSFMO9DOPN+uBlIzB+LnAGNztai+5jZ5ZPf6G7NaV5s+
         Kx4SLpLwnYIUXef7ZI4g/kdegbruP7Kx7p1YByKT+EKmpWbNFy32ATyI4mDHSFHJ7qcL
         kRKTguHjbC8id0MgBh+A9UULp/6hdgTevQFg8GwlJMukdADoTUQpoatRV2zs6ovUSDd3
         M9+cxjjAA/UhCE1Q33Zi25xBluxxNKY0eXskT68Gb8S79S3+ZV5pUJWkhkE6OmTZGVa8
         C3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7WOYlNM6TwhYBrAHPCoyk8KYBz1L4uqibgVytfxFWRk=;
        b=Jlgw6kOSGVBNcpqix2rjt5ByH2P+nFK7fa9c4RvOiR9FGw0l2YBTUztNKtlbKX28qk
         DHKnG2hWmG+S2ydUq/aPC0DivNR2hcWx9QzpOsdMH0MeUX0XrLBoCoTDCAHZrbiSU1zv
         I1x0e4FhIzdImMHFwUMxjbxMrd6Pos50ixU5Bud8MNNjPKfLL11a1bgFP0rZIivPQjnF
         wRX8MYk4yLCnROi1WlwHVZGjCerjzk4QkEMswnx76k+p8+agnavFfj3wLiIuRlFMW4eX
         9wTjwI4tobbQ4fHHMyB1PqvhBlfUFKCsgkTXmBqtsRCDZtq+6R5WD84QW8Puii9dtXwC
         rZDA==
X-Gm-Message-State: AOAM533ndUPB+6iTlrxf7LOKPoW8HXqk2QDLLUy+RE1du/xEaPS2ltQV
	JxvV4+6r8+6E+Rgark1+U8ZRmsUWbasyMA==
X-Google-Smtp-Source: ABdhPJwomOFZtXE9vDAIzpSLWMi9457A+xfhciQEXaIsBuWgfafe7kI7PUPVT5ZZ/OvXQ5VC+vXulw==
X-Received: by 2002:a17:902:9042:b029:129:7ee5:ac27 with SMTP id w2-20020a1709029042b02901297ee5ac27mr9422274plz.83.1625540585274;
        Mon, 05 Jul 2021 20:03:05 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:4baa:c5cf:22ae:7c01])
        by smtp.gmail.com with ESMTPSA id o20sm16000395pgv.80.2021.07.05.20.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 20:03:05 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 2/3] python3-hypothesis: upgrade 6.14.0 -> 6.14.1
Date: Mon,  5 Jul 2021 20:02:36 -0700
Message-Id: <20210706030237.307204-2-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706030237.307204-1-timothy.t.orling@intel.com>
References: <20210706030237.307204-1-timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

6.14.1 - 2021-07-02

This patch updates some internal type annotations. There is no user-visible change.

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...ython3-hypothesis_6.14.0.bb => python3-hypothesis_6.14.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.14.0.bb => python3-hypothesis_6.14.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.14.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.14.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hypothesis_6.14.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.14.1.bb
index 89071b2a974..61598c3a161 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.14.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.14.1.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9bdee01ae260329b16117e9b0229a839b4a77747a985922653f595bd2a6a541a"
+SRC_URI[sha256sum] = "88b0736a5691b68b8e16a4b7ee8e4c8596810c5a20989ea5b5f64870a7c25740"
 
 RDEPENDS_${PN} += " \
     python3-attrs \
-- 
2.30.2

