Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.31.1619208245008547583
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 13:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NHllm5xJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id y62so2114681pfg.4
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 13:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O8qTrUBgehBfMEcdrsqDUHuuGqN4m8jE+/U65VNPcz4=;
        b=NHllm5xJEiXZNZFGYvJIhNhXWTropqL9PJet0zy8IIY/uYFcelfHud4a2Is9z2O0F3
         AwM1KGKHCuyP3nAN+gCH2ELyMu8OgoTPb+h7y2c4vMpL1+8ua2ER022XJfHTt9bLFpHB
         xvCObtS5DD/dK62n6Xe/+pwQ+sQvh4SjR1VW9tWowy22fmdlHDacjYeaQPGyFfOaP4He
         P5wBCAqd/zMd7uRS803dgcmL2u7SAzA/XhKyjN6yY/ZHZD+GvvMlIm/x4lcHGOop4IjZ
         iSH1Z/DA16ImbCeoNt1+4Oq59j51Wx3WovBI11/OeLu4Qkay2/kJpcmwTmX8Awsa3Nha
         L6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O8qTrUBgehBfMEcdrsqDUHuuGqN4m8jE+/U65VNPcz4=;
        b=TVmoU8uDek4SwxvzQJ6qoia/+4jEtp3tdPtmQ41myBkOiAhW+sRmiNHOMEoPNZZFne
         nFVM+jOL8jcm91zRjt4DvM5Xhlzth/oWWLhEu79Vddpl4Im/DMwel7IDu0fM7N7L8NCb
         grKWICxiwnYv/Q7PaDm6VsXJdgVUnHOYPMr3XATnpPoS/HLeU8n3g6+rVDXwtYaBcMRl
         +i9/kMiBQocHJ1mmtsSc4FbZcstze2xHMNIc11SwNYrdVVN2fnMtNbZjs66MEgKnbkel
         Nu2obY/UbbbUsCVY9ZjM8fJKc0jEsXVCf1YSO6cgFMgHG/8Byq5iBRYWEo2CXJANmqyp
         8hSA==
X-Gm-Message-State: AOAM5318YUv5iW6jStUq4uuNWF817zzt6WQTQKeE7Q76hYGGuLGEBY8g
	ybvAFQVjGOpxpMxQm6RHIDOeWnQ2Y1PjUg==
X-Google-Smtp-Source: ABdhPJwfsDc4/L3EG2YeLe1lrSWJIpxhW8pAzywwTlCNerXMAVLNNfWjRhee37wwxkGOVtfuCoCluQ==
X-Received: by 2002:aa7:814e:0:b029:20e:f3fa:2900 with SMTP id d14-20020aa7814e0000b029020ef3fa2900mr5621731pfn.62.1619208244369;
        Fri, 23 Apr 2021 13:04:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id d132sm5201282pfd.136.2021.04.23.13.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 13:04:04 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] python3-jinja2: Enable ptests
Date: Fri, 23 Apr 2021 13:03:58 -0700
Message-Id: <20210423200400.1108673-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423200400.1108673-1-raj.khem@gmail.com>
References: <20210423200400.1108673-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Needed dependencies on toml and pytest and unixadmin
are in core now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3-jinja2_2.11.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
index dbdf563f87..11a4d5432c 100644
--- a/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
@@ -13,8 +13,7 @@ CVE_PRODUCT = "jinja2 jinja"
 CLEANBROKEN = "1"
 
 inherit pypi setuptools3
-# ptest disabled in OE-Core for now due to missing dependencies
-
+inherit ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)}
 
 SRC_URI += " \
 	file://run-ptest \
@@ -27,6 +26,7 @@ do_install_ptest() {
 
 RDEPENDS_${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
+        ${PYTHON_PN}-toml \
 	${PYTHON_PN}-unixadmin \
 "
 
-- 
2.31.1

