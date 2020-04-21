Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web12.488.1587509726914737269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 15:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kPn8N89K;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id o185so110262pgo.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2020 15:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9gOrJ5VKHXO2qz/1oQQI+sNpFNF2Pqo1HGTuMij0LtI=;
        b=kPn8N89KOn4bh+rK76EkIOfUhye6msHnvQ95H+u9MmMou9uNXh4wA47SAEM8y1UIsV
         Q9Ct1Jamfme1yy9GE0ZHsbKFCUsGGwc+swivfWdJX2R84vb35GCxznWVCcsMrQuR/5Hc
         BrWjE+qubRR+RPGhK57z9qt6mxXcsi07HP9Y8NF4/rLRZXzPYmoP6xkK6ARGWAWgBMIG
         GJpbdYLj4IS4+D4D9I/V62wHBGmNLRum5nZpTRhsmS+a7q9OsOVSmuzATjCcHEnmRBez
         UwZrtCAfJDEK00KRAJ++FVE4aCrGv9vxNUGfxoO5IqMt0ys2ISMsReVlPs0cEtBHWbcD
         K4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9gOrJ5VKHXO2qz/1oQQI+sNpFNF2Pqo1HGTuMij0LtI=;
        b=h8/HxE5ArXXk0OPlWLpbF4JB3aXYyL2ibtX6SUTWLPicjT9Edvt1BMLfvK+DKca3Fy
         Qe3OPl6TnIsf0/suaKx2xs0kRatBKzuXEb2wR97vPSC2dHpjn/9Eg5R2S/LxHAA/Zijs
         acLisYwT/+9NRYzY0ve2b2XEPgHI2ohtqebSQaxTutQPuZwJZMNvKeh71Eb1DVfpmVG1
         /XId7f3GxK+kB/eIgwEniy9Svv0OQxSUxlJgTLMMt6AZ8j/wzQ8ZNXEGYBOHPpDHHaIi
         6VC5pD6XQfw1C0G/lB9eDNFNe6XqTeb8ZasihsqQg9/P0jcDC8xSKtr3cu6pn4qV7Iz4
         vhPA==
X-Gm-Message-State: AGi0PuY25DGfFrHbJHhb+LOZn/9wuPfdGjQLQO5/z4/M0YltoodojBHD
	cKtfXQ3ZrmsmoFll+6yMCfkkABNAJ7c=
X-Google-Smtp-Source: APiQypKU/RBX4i+o4gMscbauGtLA+4MnSaSSMgbqIXEfJbMR8Z/uN1J+n1bXSlBqFb9MAaDP/XzJNg==
X-Received: by 2002:aa7:9a92:: with SMTP id w18mr767760pfi.200.1587509726052;
        Tue, 21 Apr 2020 15:55:26 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d473])
        by smtp.gmail.com with ESMTPSA id o11sm3226458pgh.78.2020.04.21.15.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 15:55:25 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] packagegroup-go-sdk-target: Add go to packagegroup
Date: Tue, 21 Apr 2020 15:55:22 -0700
Message-Id: <20200421225522.2026961-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200421225522.2026961-1-raj.khem@gmail.com>
References: <20200421225522.2026961-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ensures that we have go compiler installed into image along with
runtime

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
index 86c71900ec..9a52b0781c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
@@ -3,6 +3,7 @@ SUMMARY = "Target packages for the Go SDK"
 inherit packagegroup goarch
 
 RDEPENDS_${PN} = " \
+    go \
     go-runtime \
     go-runtime-dev \
     go-runtime-staticdev \
-- 
2.26.2

