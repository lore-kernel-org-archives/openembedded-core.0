Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.17620.1590940419904402699
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HOPKfDz/;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id c35so5416723edf.5
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s8rdtdw5qzazn9fmcfJC8X722pDC4AAoDcfNzgclY2A=;
        b=HOPKfDz/AQxYs5M7J+O/IshLDuf1z9/EU7SxnL0X7AHP1xlIPmm7TppiuvcKciirAP
         cyIOAfTSbdm+gBeyQ0+r7oLcqF5ybbjDRIQ0LSldN922xGmmL3B8AEatPQMtlw8mV+fK
         X2LW1asksBDcYvmI6Oby0Onf3x2VDAfiKq5r9cTA+R5K4k15GQRMwnrfzHBo0PjSNFaP
         um9Q5IHSXFnjgFQD8JlTxEXKSmJsRblDgXNbxsejm4Vs42mKynBlP7Lg7ku6F+VdoMYk
         a9rjqy0IyNJlCNb9TSX+8sVrpWVnAP1oxgHloiBfwpNTa8Yob5zyWazsHAwW6c/m6rQL
         8qYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s8rdtdw5qzazn9fmcfJC8X722pDC4AAoDcfNzgclY2A=;
        b=tpafPkq/jJCS4NaC/djTptyybcLNEH0+DVFmTtsLryxRxJM7Tz0OBCdrK5KB8eAMgw
         +KdWo/GrEHgfBuYp6yZae9QLTVmDvTbSyGKWLG07pLB8fnCtrpc07pzHNpMI3+udGDQb
         +fBtZQwRw+P7+c+dKf+1wc5Ehz6D6YqK6pnyZN3lPiYODdJZDkxz02YBaeYLhmEWptIN
         Kx3LYDC9LXYREzNfX7nZ/QKZDoLIWcPpHOOV3lPkdDCO5MUuC4p1f6db/U1Aou1lAm3L
         YogyFUAdZom/Xw431VtKYj6Ahkk707jNI5L7tKVvrahtLdyOU2Q6CFKD3isxoZl+Ykqm
         JwVg==
X-Gm-Message-State: AOAM533lVN9QUdi/LcA9RTrPa1nEUFS50W6YfJMaxC4UBlPg3HCH+YVx
	yQF9mv0g/6YUxKPqIYbaSzC1gpXX
X-Google-Smtp-Source: ABdhPJz923ks2/GfAbL2l2jINTnJlmHN/i31+nryBL4Q3agGfY1iHnbwnKtET+IE/Vi3tL46An1TuA==
X-Received: by 2002:a05:6402:1447:: with SMTP id d7mr18228428edx.367.1590940418197;
        Sun, 31 May 2020 08:53:38 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:37 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/70] python3-smmap: upgrade 2.0.5 -> 3.0.4
Date: Sun, 31 May 2020 17:51:57 +0200
Message-Id: <20200531155254.10283-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-smmap.inc                | 5 ++---
 .../{python3-smmap_2.0.5.bb => python3-smmap_3.0.4.bb}       | 1 +
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-smmap_2.0.5.bb => python3-smmap_3.0.4.bb} (97%)

diff --git a/meta/recipes-devtools/python/python-smmap.inc b/meta/recipes-devtools/python/python-smmap.inc
index b878b4b399..7703722bca 100644
--- a/meta/recipes-devtools/python/python-smmap.inc
+++ b/meta/recipes-devtools/python/python-smmap.inc
@@ -9,10 +9,9 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665
 
 inherit pypi
 
-PYPI_PACKAGE = "smmap2"
+PYPI_PACKAGE = "smmap"
 
-SRC_URI[md5sum] = "1c59a985be5aa645c4c5a4e063a40dd5"
-SRC_URI[sha256sum] = "29a9ffa0497e7f2be94ca0ed1ca1aa3cd4cf25a1f6b4f5f87f74b46ed91d609a"
+SRC_URI[sha256sum] = "9c98bbd1f9786d22f14b3d4126894d56befb835ec90cef151af566c7e19b5d24"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-codecs \
                    ${PYTHON_PN}-mmap \
diff --git a/meta/recipes-devtools/python/python3-smmap_2.0.5.bb b/meta/recipes-devtools/python/python3-smmap_3.0.4.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-smmap_2.0.5.bb
rename to meta/recipes-devtools/python/python3-smmap_3.0.4.bb
index e87b8df8c5..5f0f341d6a 100644
--- a/meta/recipes-devtools/python/python3-smmap_2.0.5.bb
+++ b/meta/recipes-devtools/python/python3-smmap_3.0.4.bb
@@ -1,2 +1,3 @@
 inherit setuptools3
 require python-smmap.inc
+
-- 
2.26.2

