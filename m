Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.20725.1621847658144688070
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y0dZ4htr;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id s22so40467506ejv.12
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3yQaW3cxA9cKkOFOqhwa+DdbPqKmJ/97fgqEaPM/dAM=;
        b=Y0dZ4htrvNPE5E7nIO3A2J3TBTae4Cbm9DXP/KfCDCIACeRg3lm7PcEMj8BzVMiiYe
         9BqxVHfUPQKd33ceawCwwXoZi4R4pgwtwOHDvbjSwM/n54F7V1OfE7/iHtqvU2kkYqyZ
         06MpE1LfR5UPzZFVdlRkqdT/yYd8BNW9dl75uuDo8sEyfaUfuLvcAygAD/BD27Tr5JCA
         hlEOCI6QgzmXcMXBYcDt7IbsLFCrqlPS/ycUgwujK8/mJM6aaVt/HYaQxJqqNKdCFCc8
         GHVsUS3G/diwJ+47lPOoG16p/GcvNBlBivlrqoIkNzly/3DFBjDp+GcAtuEriIopJLWW
         wUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3yQaW3cxA9cKkOFOqhwa+DdbPqKmJ/97fgqEaPM/dAM=;
        b=JEP+aP4cuqadkMyVOyF5lBXkCuUwHs5qrfRnyhV95oT354hpWDzG6SSlMND9vdbF56
         lfkUBc7D6aUb5J+fW5lQ1T++mVmarv8x/ZFN5eBV8mQRCvyTb0ZR+kcHgXocZHxWk+gD
         lBzc7LR3Fs5vpXH1wke21HTnMxzf5gmV88skAEgwqEC6DFoYWNc1FBTHC2vWU3MmJTA8
         HfDyhlqszuJv3zzbKqNZ1lpyt8yMfhFsKHqOyZuNmFZD7aSW6ELGDpgA97SSN2hE6ZPI
         +BBf3W2namI/uV60cNus2H8r9fKH/njZWZFrxAiDYM/Pr6EBH9h6wtWU9EhHlHLFE+sy
         z3og==
X-Gm-Message-State: AOAM531ESz9YIOfJKuNxCsNj0Du698VkjOqscToSoZMrQboFgteaMBpH
	49xbP0on5pG2Bke61/mmrcuqm/j/qYE=
X-Google-Smtp-Source: ABdhPJz7C1y2gnfeGdbKV6VX4OkJvBL5lOS9K88bcgTXw2UkFvUUncZvsx82vefd1vKKLwXWGM/UDw==
X-Received: by 2002:a17:906:edaf:: with SMTP id sa15mr22247107ejb.174.1621847656830;
        Mon, 24 May 2021 02:14:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/21] libdnf: update 0.62.0 -> 0.63.0
Date: Mon, 24 May 2021 11:13:44 +0200
Message-Id: <20210524091347.419253-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdnf/{libdnf_0.62.0.bb => libdnf_0.63.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.62.0.bb => libdnf_0.63.0.bb} (94%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.62.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.63.0.bb
similarity index 94%
rename from meta/recipes-devtools/libdnf/libdnf_0.62.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.63.0.bb
index e2c2c41c6a..79e8865456 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.62.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.63.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            file://0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch \
            "
 
-SRCREV = "9a0e17562b19586b3ffa70fa93eb961b558794c7"
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
+SRCREV = "669a5c691acba91693d238d6262ac99a440aa9b3"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1

