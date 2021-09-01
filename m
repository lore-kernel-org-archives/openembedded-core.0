Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web09.8190.1630503944039798091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bRpJnRET;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 107-20020a9d0bf4000000b0051b8be1192fso3491863oth.7
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y37Eldisdvs2Lyfz+LMb3HT6Y1Xptl5FN2KxHA7Q5JE=;
        b=bRpJnRETJJxoIhi4SRt/XXbj8hfWWOib3LY1vB+QL/D41m936Y2I+Rv4njyjhiZokK
         m2nq0r/NNkcAzZ6wDGq41goyWNpaKwOSQqatfgmZjxKsk4O0oOrvS4Fwqi52qyjrOK5B
         jpUlS/1udLVu8W3b8+FjspvDE9feTEOonyt8CIa45QXSS8701x9ezJptqdcKZP32b+NC
         3Ncd5l+SdecW0iduREdfR49CDgIGKJHhi0nP4LiYzJi4Sp31swA6hPQxlrN8ZY3T9+ug
         Uf3eQGDbP+N3NeEM1bhByMmuRpePAq7I/QdrgalZmXinWBeKrS88NVtI0HctJEVTvuy8
         7zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y37Eldisdvs2Lyfz+LMb3HT6Y1Xptl5FN2KxHA7Q5JE=;
        b=QJKNyP62Xoje+nI2iB39OO/boG8WbKGwsjTHOXrHbLXkUptbKRsuMZ6BtcKG5VvqoI
         UJZOkpfTThs7p9qKEK9JNVSfpYeMpxvSJne+/g7R0oJTAnMYEjzi2jdao12ePZtfyXhd
         rkh+TMOlFR6xzG22d255wbn5+alyhqpkhcao0zAY8jjf1HV9CGONo31dGftqCqbr00Bd
         7H3wn7nnQJIQUOpobR/6twID5ePT9+Hmv9BIEqaB4pC/Wc5TnDtvANxahIC4ngcxP1qT
         Rma1ZcqEkVUFp0k/Ckw5kP1M2PSvAGfMtTEbsEbH0X8sknWXBhxjPzaAYM8Zoomu+03m
         HRPQ==
X-Gm-Message-State: AOAM533PRPTHfu163HCTU9jY2VF8MNvculK+3H4PIby35wX0rDFXiD4v
	zQJTxiOjb01H7tSNt+4zckDC8LMKM/I=
X-Google-Smtp-Source: ABdhPJw2fkO3WaNMMqZ3lfJX5jGZiDAjsOjGQ8iTNUUeWmntJLyMUg09YeFozG/uaHL/TsoPCpfbrw==
X-Received: by 2002:a9d:7006:: with SMTP id k6mr29474384otj.181.1630503943033;
        Wed, 01 Sep 2021 06:45:43 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:42 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 25/31] libpam: Use specific BSD license variant
Date: Wed,  1 Sep 2021 08:45:04 -0500
Message-Id: <20210901134510.29561-26-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-extended/pam/libpam_1.5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.5.1.bb b/meta/recipes-extended/pam/libpam_1.5.1.bb
index a349d8ac96..efcd27137f 100644
--- a/meta/recipes-extended/pam/libpam_1.5.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.1.bb
@@ -7,7 +7,7 @@ SECTION = "base"
 # PAM is dual licensed under GPL and BSD.
 # /etc/pam.d comes from Debian libpam-runtime in 2009-11 (at that time
 # libpam-runtime-1.0.1 is GPLv2+), by openembedded
-LICENSE = "GPLv2+ | BSD"
+LICENSE = "GPLv2+ | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7eb5c1bf854e8881005d673599ee74d3 \
                     file://libpamc/License;md5=a4da476a14c093fdc73be3c3c9ba8fb3 \
                     "
-- 
2.32.0

