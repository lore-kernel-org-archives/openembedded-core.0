Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.4415.1600302184830496794
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 17:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cSbk5BY8;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 67so292301pgd.12
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 17:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SkjcscgNVTmUguQIzGNqmtsWrWiCkG98uhwbhxLbg0c=;
        b=cSbk5BY8lBJbMVQ3hHgj6IWeR14qNwvDhHmrr8GPp3PW8xb6hWNKzxZQlPgak8/4Ct
         vELDEEjgimClG0oeK0PnGpXIIpb7dHl+ikoSqXbG866QhJp25V/VtMquYAPc4fBXkZBW
         AzvqDEYcpU05XNXk7urtrNnHdRAb+OSCA213tN+cNLCXWV0Z0P2gQsFBrtc+7KmOzthJ
         HbUxnXr+CWfJPY5TpKtjq/HoIYYB7u4dhd42/JgUzNVsb/wmrlYXBLIzSwMplP4zrU0m
         MW8D7Af8EcTd6MTiFUVDjLhcto6cWzTenNrlm261XsQwNa6kiy6vzxsQB8mOB0fDsyAa
         FNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SkjcscgNVTmUguQIzGNqmtsWrWiCkG98uhwbhxLbg0c=;
        b=bnqBKuz6UJx3YEoHMrVJpxXVowWlFMyglcenwEJ9Md+LmElXqZoRbmxnX4/Vi6PviF
         BgD/hr+qcekjtVB/9v0mlQtX5+onHwHFjqkeKB7jPBj0Q6pKzF5aemARAhX3NZS+8+if
         zhoZA6ckdrrzvxjVWUg6YzJD1Iob3aG/14KQwJeL2VtfhKTl/f8wM1e2v9sXlJyCdis/
         29AL7KmCKoDHGD5zFFgns3VBbJYaCKqA2PMP4GITxk3F92avDrb0Wjy8fAIYsnKVqKnd
         ZN6RECgJcbXv73ItmqMe3YQ55SdIgE8ephp90hniRv1+TK7sz3VdXOHhmdZQlYfWgCnp
         ZM3A==
X-Gm-Message-State: AOAM5308o/y2RYl6dlFOhUE/k1oDTFNyuRYAcNnABbDyKmpkPjVgHfnl
	S51VTlycpvY66jMLe2kLvKeHzgGbOMRmtA==
X-Google-Smtp-Source: ABdhPJw3DZbGftioRp2iZT2LEmeQ7irR1LOTttcPxFGTIlQBzpNmbD4YsL5URm3FuRADeBzEMYo2Qg==
X-Received: by 2002:a63:29c8:: with SMTP id p191mr3040424pgp.45.1600302184025;
        Wed, 16 Sep 2020 17:23:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id a1sm18148028pfr.12.2020.09.16.17.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 17:23:03 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ncurses: Create alternative symlinks for st and st-256color
Date: Wed, 16 Sep 2020 17:23:01 -0700
Message-Id: <20200917002301.220605-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust for other st implementations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 1627fb91d3..4b61889668 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -273,6 +273,11 @@ inherit update-alternatives
 ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_ncurses-tools_class-target = "clear reset"
+ALTERNATIVE_ncurses-terminfo_class-target = "st st-256color"
+
+ALTERNATIVE_LINK_NAME[st] = "${datadir}/terminfo/s/st"
+
+ALTERNATIVE_LINK_NAME[st-256color] = "${datadir}/terminfo/s/st-256color"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.28.0

