Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.21906.1627919204648102267
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 08:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CvgWbC4s;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso549146pjf.4
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Aug 2021 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JwMBvEXqq/WT7hQc0hN7QMTuZVt/OJdy6el4l82vCVc=;
        b=CvgWbC4sHNbWyqnCEx7tb2Q8VTT1H6ZQ81fYmnXCNdhCr9OmENryx5kOibX7lzPkYd
         Nu+ppVidPHriCcpM90dxhu6Zt+nViNCrZ0NfImDb6x//SGzcmYH5TYHJL9e0OiUqVgVU
         adaTcFXzm8nBLpZjd9ZgJ3izgYRPj9KGDWpLBbZp1Yww3cvQPt0bhd4gvI+FG0E5Xxsh
         +kVHQQNA+Vgyc034+kfYCyj/QbbltVpZFxBgtRyUa1CRiOppt1CU0bw7T85aqEIxO9Nz
         2Mg1E/buRCX36IRu6otVXQ2eH6XtnZfukNUN7oA/yVjkCZFbfDLVqmg/XMl+4EjfAk/x
         GfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JwMBvEXqq/WT7hQc0hN7QMTuZVt/OJdy6el4l82vCVc=;
        b=Oo+SN3h1NfTl6taccy0qOP4OBUCtI49/ruxXW/dmfeQJ3PR0JAqnRtcuy62JqtLhou
         X0vbbk4YLPeyp27f3FTWmxi4yVdovsZFGGRV/YkAEi2YhVxfLSKPQKW3UQgyupVC0rPm
         W3gekNFMyUXQM+RWVzOsQX7oRt0mqWXQqvwE1UIjwgcemwMO0LrFaZFhaWli5bTo3tuu
         K/zRkPzJdpIawA0cNrCBtL6ROinvPASQ3NcrFk+i9f+S/iJqCGUsanWOtS1JMMA5QIEt
         qu49YlAoh4OsLOuGPIxuxMuy41ZVw0rP0v/hZyYQIETRT+5fik+i6RwTgHsGy9dts/64
         aEYw==
X-Gm-Message-State: AOAM533pDel8X8XrwHKIS1tqfhd09ZOl/bqskWjdngjh3y2XicOWlFuv
	+dipzBQUT0S9jvReWhryg0SRGT7q3cyV1Q==
X-Google-Smtp-Source: ABdhPJyBE/FxPCxprOk709YkBXrV62QI0FCWq/Y3x1JGeOG3Qh1jhOzvV47dGjDUqfIv5x10u+yn+A==
X-Received: by 2002:a05:6a00:14c8:b029:3b8:7d42:960e with SMTP id w8-20020a056a0014c8b02903b87d42960emr9437185pfu.64.1627919204048;
        Mon, 02 Aug 2021 08:46:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id q5sm11048085pjo.7.2021.08.02.08.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 08:46:43 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 2/4] glibc: Remove obsolete --enable-stackguard-randomization
Date: Mon,  2 Aug 2021 08:46:37 -0700
Message-Id: <20210802154639.4181923-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802154639.4181923-1-raj.khem@gmail.com>
References: <20210802154639.4181923-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this has been removed in 2.34 onwards

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.34.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index 7ad59115b7..4beeb10c29 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -79,7 +79,6 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --enable-tunables \
                 --enable-bind-now \
                 --enable-stack-protector=strong \
-                --enable-stackguard-randomization \
                 --disable-crypt \
                 --with-default-link \
                 ${@bb.utils.contains_any('SELECTED_OPTIMIZATION', '-O0 -Og', '--disable-werror', '', d)} \
--
2.32.0
