Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.647.1605893400698971079
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Po1baFr+;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id w6so8532791pfu.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rnx3opB6AdqYB6opDQBDWMWAXC6zY1yaZc7/6vQ68FM=;
        b=Po1baFr+8MZ49pLV51CIFkOkustRnXI9p6bicdViplBj+eC4bVKYVjUXlbPLA1JIF4
         mw7/XgvOEJKYdUYD5KLiTZQ9hrbgZ/Cuezc3iG9xVRP72XciKwxq0ti3J50w+y4U2D40
         DsZHnCOCDvCY2U/t2V0rDZeNLPLCnrANveKPwPoCcmqSCMcD06K/IjOAuk2RCIC8Hbw7
         rOW8RwaAqAS+mkL9K1cQf4PZAZ18MTM3vrfoSZF6jO76ArII+KWSf1Uf4aMDviGmNzJJ
         CHElC2b9mEEM2PFTZvyvNLND3GvK+wVs8ZjCGuOnSyR8HOeydfrPwlsoymkwmZf168GR
         tp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rnx3opB6AdqYB6opDQBDWMWAXC6zY1yaZc7/6vQ68FM=;
        b=aKLI0g8S06VB+xG1VQWgYc/5j5DLsHhXI0yn0gfgmFuJQ9KISkynCJDbM7BAHejW/i
         iePQhwbTa/Jghv5DPBsVV/S0JhOqPZFa2pWR9GiAwLxhJ/RMRaSShO1ZrJBVdk/WE0/Y
         vLag6DNUuZqChoHHK37fu2CVGbkC7unKbRcblHeuJq8lJ1oem33UOAXd2rsG1m66n5Su
         rqdd6qQ6k0IMkF11urAAmffk2TqehbKzmnYzStV2CUO/ixXZxfkDoQ+incnxSuvADghb
         DwMppc76funFghbwuhWGvRBke/nu9a8GpNi/v1m4ozC+TK9bEx1473hxCROhkF0FHCtt
         r/Ag==
X-Gm-Message-State: AOAM532lajdtjWnTvqlgtH4UQuZ38cxwnVyu8xFSjkIwDCIFrooIGR3e
	fvRgB+lEBKpPxgIR0Vp1g8ia7lBAIlAFUw==
X-Google-Smtp-Source: ABdhPJwyaqLX/chVuRdAjISAOemVW7CKSzpUpRcIzh+0u538auYdQOuCRrH3YLO3yXYAyOM5smiVVw==
X-Received: by 2002:a62:784c:0:b029:18b:6050:9623 with SMTP id t73-20020a62784c0000b029018b60509623mr14754942pfc.13.1605893399889;
        Fri, 20 Nov 2020 09:29:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id x61sm4855684pjj.4.2020.11.20.09.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:29:59 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 5/8] python3-numpy: Add ldd runtime dependency on ptest package
Date: Fri, 20 Nov 2020 09:29:47 -0800
Message-Id: <20201120172950.1619754-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120172950.1619754-1-raj.khem@gmail.com>
References: <20201120172950.1619754-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
E           RuntimeError: command ['ldd'] cannot be run

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
index b484e7cddc..e59ea752cc 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
@@ -49,6 +49,7 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
                   ${PYTHON_PN}-threading \
                   ${PYTHON_PN}-multiprocessing \
 "
+RDEPENDS_${PN}-ptest += "ldd"
 
 RDEPENDS_${PN}_class-native = ""
 
-- 
2.29.2

