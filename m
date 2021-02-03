Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.6298.1612338373147743182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 23:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dkEecDJr;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id w1so34040221ejf.11
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 23:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C3YXl7NwmRWmPOSYCnJiTINypD2qciRHOJbcuJJ+4WE=;
        b=dkEecDJrcHQ+S7VrPPpH3uf4wXAK2faBiEexFh3M7+g1i3NymtINZDWWcfdlZ9o2QS
         UbNjeflM9wmhsBuIxDo48HkHmv8y9gEVPl4TzuXftElxsF0egjyhYy7TSuMVPNxYhwfe
         10zRg5YgZzmwRw2zn0e2sKq/pec7O05pupc6kz+GoMfbyDZW4soFm6I5YJ/4pxYjBPHT
         +3j90lR98UiWNOpMz4j7q5pJaLM5EqRRs67KL/HQs8q7LCGAcsGNzISU4YKqabAFZ1HG
         2CvCVkeK9BfogEirkY0Fnfats7eZh6m1hNYX6IzfnWuwVb0N+WVcjCTUTMTbTd7FVAB0
         hpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C3YXl7NwmRWmPOSYCnJiTINypD2qciRHOJbcuJJ+4WE=;
        b=g5dfkxo5ib/efiA9lf64YRf+nZxwy+uLguMz285GEgauU7RBcQKyNOgrPHBzUEP8FF
         FA3A+xMQKK2K8gturRNDUFsnVuKVn7/CcML7hKNsupeAiZOrBBsnPopdal7Bi8mHmxFe
         HcnR6OCdNr8NXsuYAMcIhIcgESZCqY+D/bAGcAn7fEnjL+RSZo940uGtx6tHo7V9Nuuh
         VMo6FFHZWgDdNvKvpwnmZyJltC3G4hR+Ra8/GVPZKGZGVE33P8vzfc3FtvCyph30KFnB
         ZM1OeuXZPF8Km45+Axhg1Ka9C44JPhM8wELIfztkVj6Vq/ekAV48nEuZKa4r52PH2yar
         Olaw==
X-Gm-Message-State: AOAM531xexUG9E5s++EeNaZwnK+Vrgjrz5phXfjd70mJrNCA+LNA2vh+
	22YtTLu8pH6v/wpOKM3q8ytFLbPr4AI7sQ==
X-Google-Smtp-Source: ABdhPJxdg55KHCcikoKJFmXSUHKStaoM+zq8cHq41nMHz9Z8eGkST7m7xqzo0kJD8wGvowk4hliU4Q==
X-Received: by 2002:a17:906:7d4d:: with SMTP id l13mr1876972ejp.107.1612338371312;
        Tue, 02 Feb 2021 23:46:11 -0800 (PST)
Return-Path: <changhyeok.bae@gmail.com>
Received: from cmtcleu60844809.rd.corpintra.net ([2a02:8109:b5c0:8990:59b9:cc7c:ab26:5a37])
        by smtp.gmail.com with ESMTPSA id x17sm452472edd.76.2021.02.02.23.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 23:46:10 -0800 (PST)
From: "Changhyeok Bae" <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH] python3-importlib-metadata: Add toml dependency
Date: Wed,  3 Feb 2021 08:48:39 +0100
Message-Id: <20210203074839.11376-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ERROR: Do not try to fetch 'toml' for building. Please add its native
recipe to DEPENDS.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../recipes-devtools/python/python3-importlib-metadata_3.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb
index 4e2d23721c..81f24e55c2 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "fa5daa4477a7414ae34e95942e4dd07f62adf589143c875c133c1e53c4
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-toml-native"
 RDEPENDS_${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
 RDEPENDS_${PN}_append_class-target = " python3-misc"
 RDEPENDS_${PN}_append_class-nativesdk = " python3-misc"
-- 
2.23.0

