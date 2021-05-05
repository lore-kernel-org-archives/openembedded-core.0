Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.9818.1620227938110234027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T50hg15f;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id d14so2480379edc.12
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CnukaELthpkII1gEhvmZB0LfIz9cliUsoJF3zr5r68A=;
        b=T50hg15fDvEAI4Gh0gXjDULZ3YiGRAUy7HaE6O7ET/C4VddOE9KU4VUa8rN6636rk4
         vO/OcHpNE6WhqZS6jOBlfIc9Dyl7KtansC7qADo20fYuM3FhH5RwhYlnrQJ5GrNr4vw0
         CW6BliTl+8ZD87bUbG4W6YsKlUF90VT+spotoMm+5XEjagQivpW8P560XC9kFLEg/gG2
         XxFxbJdrXy/QEw7yCbHuhqRFEwARufWkaMPRzgGMeZfw6sTObiuYWy+kFTqLJg0cudnb
         QuDqHAp4U4/qj6d3kxQH2GcfS3SGe+JpdFE6O0OQntHjUHcM5P/DKPKKjs4sQMzK6/U9
         eoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CnukaELthpkII1gEhvmZB0LfIz9cliUsoJF3zr5r68A=;
        b=pCWdQ+FKvMD2GU6CABU7hva1HW4/g4ka0LYukCak6k6dyjnpUFbAiNqg2ktX31s/3t
         96OeM1/UWNlQpbk2WABcE61qLts0sAKYkoTqwzInB6Ox7KIfWxuZv3SB8lcbXXzyFmS/
         NCm+J8MCIqN5Is0qP157iiguKvR1lIqv274+Tx1un3/n9zKZRBsRaQ+ieEYRPShkUM1l
         fd/3C0m12nHqrgmlLIlckauHZKN9oX6FSW/EmdL/u4hYGUDn37Xg1kKgCT6UIB+14/rG
         +yCqlbovTx4G09D3VHLl2fC9iFx0rWs0FJiN57/psNYtwnKWlQgpCl1xXW80aHX3CTjT
         k4Kg==
X-Gm-Message-State: AOAM533pmD76B81Nwa5vea3oI9qnRFRLCXWVXoz5pfyfgsDLn+DIKa/5
	ekb7uXmzE0e9GoUekUKCp/IlgOABRdwAJQ==
X-Google-Smtp-Source: ABdhPJy4qGvnmUDj3mnXxHLxkXyK61E1b9ks3Vtac3YwZu0559/RqPUN8UqNI0bz6EDalxlltO1TIA==
X-Received: by 2002:a05:6402:d05:: with SMTP id eb5mr11920316edb.6.1620227936555;
        Wed, 05 May 2021 08:18:56 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:18:56 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/61] boost: correct upstream version check
Date: Wed,  5 May 2021 17:17:50 +0200
Message-Id: <20210505151850.660512-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/boost/boost-1.76.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost-1.76.0.inc b/meta/recipes-support/boost/boost-1.76.0.inc
index 3ae5a25b29..eb5d484976 100644
--- a/meta/recipes-support/boost/boost-1.76.0.inc
+++ b/meta/recipes-support/boost/boost-1.76.0.inc
@@ -15,6 +15,6 @@ SRC_URI = "https://dl.bintray.com/boostorg/release/${PV}/source/${BOOST_P}.tar.b
 SRC_URI[sha256sum] = "f0397ba6e982c4450f27bf32a2a83292aba035b827a5623a14636ea583318c41"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
-UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
+UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
 
 S = "${WORKDIR}/${BOOST_P}"
-- 
2.31.1

