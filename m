Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.915.1599081244887439112
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BsHEZfPn;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id c8so456643edv.5
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hS1ss9DunN4ykN/S9zCDV+HD47AT34S9hl46IIE8ndE=;
        b=BsHEZfPncsHi+UXJQbLPU8FFgFwGsBgK7/wNLiQZVHkd7MX+hyJdSgK6/LatRwfSPS
         gglq/xOxHqMVyDqRzSTn5v8K4d2BhzmOMBAL58pIxh630IesQsQpo+vhONzCWrlvlnKh
         BR7CTZRkAn2GOK/aNL5p27gNLJ9ZkG8AVJzQY47ynSLHo46g98Uj+dywLjliY8vNZQv0
         iuOOhNoDYGW5umqBw450VTwxhkPOhOohWvsoTXT2lGiGzR4E2oMgD6MH93rI/BPSOeGC
         Iplb0SnLi+Ww5ai354c8B0rJ69thTfHzb3K25dLPgTanrnJa8oIZfH4wfBoddkwejrmv
         XIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hS1ss9DunN4ykN/S9zCDV+HD47AT34S9hl46IIE8ndE=;
        b=QrUtFKYJkKx+tVU7DwL3poPfC8PIBSkek6i6NhMN2PxJv+yQ0cAxLeZg642oPtGdkc
         qj4yvngkCgIqhVCl5NUWMHddUjNMe/reVEic9PyLzBtUrnIm9EYtVQ/mO0NFV22bugi3
         tREnnUOLx0u4yII1VEtQlRbgdKHOpabF48R6glDNNghc3DOcdI/9NSQvqFOugXYYRXfQ
         uldSSKGl3C0eghKXzBdhyhCkCkY6jAsfCANrLQY5DRSZm6V0qnHUUbO94/qktTrdJfYI
         lTZUrjfSk58DYmtkAU3n/4PIupf1UAtmbyv41plAWtBWmHQg222uT38OlURRcuoMPC8W
         A5kQ==
X-Gm-Message-State: AOAM530b1eha5t9rPCJIqq+L2N1Syl1HIVuJuPmQQ78cBrLMNiBusjNV
	J0cgpGM3kRGuC/QKoIolBubJLkS9ZPA=
X-Google-Smtp-Source: ABdhPJzaYIDcvuxy0zPqbrgBimh1zu5929O5rdZ8fJFTlMLjhYWgVVTXy8vFmYz3b/VKFa1FjAEtRg==
X-Received: by 2002:a05:6402:1d0f:: with SMTP id dg15mr2135448edb.342.1599081243011;
        Wed, 02 Sep 2020 14:14:03 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:02 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/23] librepo: upgrade 1.12.0 -> 1.12.1
Date: Wed,  2 Sep 2020 23:13:15 +0200
Message-Id: <20200902211330.4853-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../librepo/{librepo_1.12.0.bb => librepo_1.12.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.12.0.bb => librepo_1.12.1.bb} (93%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.12.0.bb b/meta/recipes-devtools/librepo/librepo_1.12.1.bb
similarity index 93%
rename from meta/recipes-devtools/librepo/librepo_1.12.0.bb
rename to meta/recipes-devtools/librepo/librepo_1.12.1.bb
index 2d9cac830e..0597351052 100644
--- a/meta/recipes-devtools/librepo/librepo_1.12.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.12.1.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "9c173f1110bb30f4ae842a8e3532b275966c2d83"
+SRCREV = "d4ad350291f2937c0b6a3eea9e1d0c8e1051fc32"
 
 S = "${WORKDIR}/git"
 
-- 
2.28.0

