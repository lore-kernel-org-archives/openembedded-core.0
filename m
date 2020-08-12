Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web12.5219.1597192614550950342
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 17:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=SvXdimKx;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.51, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f51.google.com with SMTP id c15so244296lfi.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 17:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NUfjHPD2C9YHZKSoxkoOdvoMUUdjx0ZWWQiV7RZ9IEE=;
        b=SvXdimKxiyWh+LqeHacDLsxrmHIgWgltKOG7+ZhIAgXpcq8KGkYhUACDFfAcZL1G51
         SXY4f/9LHRcXVMdtxiI1LRS5MkSa6qxtmoCpdK4RFUReIRsqk7huUJeAxga7ZEk4EP5r
         21R8HONSDtE8wXMUBEC2vnt0j+8v31Pqn0zun1Pht3pN1ENaIk3yeAmSUdTq64Ebdcjd
         5jpjo0U/uKIiZu2Z1i7Z858coVkGOx0YkBWL9jUpMuHPNA8hqhd1HfE/coLG27hUZzPB
         dYJtRYAf4Cj5BK49ml0DLpKbiJ4TxZLJRnXhvTMoSttjGc/yVpTbG/Cr4wCmbOJAPYND
         Vl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NUfjHPD2C9YHZKSoxkoOdvoMUUdjx0ZWWQiV7RZ9IEE=;
        b=mjsihW/OcDiGedG0NOv1NzNWtmiQjx4o73ph9FOmPPCHiZMhOFa8QUjgzTEyg/UKtW
         KhrxysSbx1ewSyPLS/A8kcohT8HzU4OiQ3RlZ+k1WLlv2/yOiSR85nbLe1F4ece3jM1I
         goXUZLVSmjedCUqHont8a8MWD2qS3YFqon3Nz+VDAEuKykTvlS8oAc8cQ5mDrj6j2vXh
         ZdzJLqHf9ZHAKR240Jq5XEbe4/3W2lV4ABmZ1TRI94jhIzx70kfUuky5ll/Zt4o5Wxbi
         i4VzOyfd3D4id6sXwsgbrZY+IjgdH6bhENWUH2pgNi3c9bW62WnbzssBpa0UfvioMfmO
         cLqw==
X-Gm-Message-State: AOAM532yY3gJ6Fn2E/sf6yL1o/HyYll4lMvBzCDTh/OTEmPnV/hoYLOF
	4Zd4CL9Z0/PBUsniNgtGgfErI8jFARY=
X-Google-Smtp-Source: ABdhPJwpXqmgzF9KIhXF6we/DFphxXc2lyLdPfLvaypc1Ay3cUZR/GKmnEvx9HSuNprBWDA+oHR4GA==
X-Received: by 2002:a19:f207:: with SMTP id q7mr4107465lfh.148.1597192612137;
        Tue, 11 Aug 2020 17:36:52 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id c21sm71244lfh.38.2020.08.11.17.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 17:36:51 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-setuptools: update to 49.3.1
Date: Wed, 12 Aug 2020 02:36:48 +0200
Message-Id: <20200812003648.583294-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ython3-setuptools_49.2.1.bb => python3-setuptools_49.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_49.2.1.bb => python3-setuptools_49.3.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_49.2.1.bb b/meta/recipes-devtools/python/python3-setuptools_49.3.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_49.2.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_49.3.1.bb
index 53a121db11..1c500e4688 100644
--- a/meta/recipes-devtools/python/python3-setuptools_49.2.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_49.3.1.bb
@@ -12,7 +12,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "88094d17c8d273390659a72e9d93374cd7bfd188c12bf2747b306e2bed48df18"
+SRC_URI[sha256sum] = "1c7b51fba5d83160d540d18b2bf08fd546357488adf9ddbca08cc1e997bd5c18"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.25.1

