Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.27940.1612739159046928215
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 15:05:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A9Eisntw;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id a16so6829516plh.8
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 15:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iuwsdyB/FMoULLh6VomDw4S/VJUmQTjPdBfjMvJJVV4=;
        b=A9EisntwrO45PjTPGswWI45jfHZ2B/INczfNFF7rOy/PpYgUBXKUYzWCv/U7tZG8ae
         KagBNaAreCuGQwHG0MD36v7zwCQJ/qFtNrlaEJ5lMQ7bgPi/pgsetoRnpGIxpaJ3ykkh
         bgPDZorCdzRd9qqcgj4mnkDKJ3zYfNdxNGMG5s1h1+aVYrHvs/CkThB5sDTh08dzwiTC
         cR7zrmA9hlu5QMvTXv6LfypCZ4IlnHIRfKaIlrJdtynAS8NeYBI4G0fPG3w+Hnf4kFm5
         j07MteoIV5TGNkzu6kqNuI/Y3xEiDGb2StAX0aECX/mvGoNVE0jC7bT1Q0ObQ2/Jy7CE
         n7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iuwsdyB/FMoULLh6VomDw4S/VJUmQTjPdBfjMvJJVV4=;
        b=V4CsiEeKWBjFm7ebA5UQnHyGzZSbtzMoJ9+HCuVWwvvJxE9jCB3iWo0agJsHA+v03Z
         t6njy6UYE931lJOTrnDCPWX6zVgjXxOTIxRU1eg1uYQK4XDaNTYcJKarKvhr2N4K5B+q
         vrOfxigMt0xufKz/cqCST/8e7Ld8Is35s2a527sdpTB7xnabYj8HcXWLfXqYvYuxDyLJ
         rjeu4WUQwkKNd4xLVxXu2eD9FhNdptKNxr/wC8qhZGjygV01yrVQlIE02Y1trx9J79wP
         6Q7+uHGtfmSWklMTAU7bAo0qkfC2cHei9vS2uZPIC/r2WNA755CHMp1OdVEUaBLThNcG
         bc/Q==
X-Gm-Message-State: AOAM530Y2UAFSFvyqneJfR6xhy4hBrwoE+Nf1LP4P9bhZflB9xHa2iQH
	FnhZpcigbI79sF3ZHMeoeEREFeYwzVj3eg==
X-Google-Smtp-Source: ABdhPJyJ87VQJDuPto2ODEKFfcobBCfp9a1Wir6ZDpTsfHEXa19XhkikrwlMNz0hKJnrKKF0cuDbCw==
X-Received: by 2002:a17:902:e8c4:b029:e2:b7d3:4fd7 with SMTP id v4-20020a170902e8c4b02900e2b7d34fd7mr10356291plg.73.1612739158211;
        Sun, 07 Feb 2021 15:05:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id t25sm3311269pgo.87.2021.02.07.15.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 15:05:57 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [master-next][PATCH] autoconf: Fix typo for prefuncs
Date: Sun,  7 Feb 2021 15:05:55 -0800
Message-Id: <20210207230555.946763-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/autoconf/autoconf_2.71.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf_2.71.bb b/meta/recipes-devtools/autoconf/autoconf_2.71.bb
index 3202a87273..e5098106f8 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.71.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.71.bb
@@ -65,7 +65,7 @@ update_gnu_config() {
 	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/build-aux
 	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/build-aux
 }
-do_configure[prefuncss] += "update_gnu_config"
+do_configure[prefuncs] += "update_gnu_config"
 
 do_configure_class-native() {
 	oe_runconf
-- 
2.30.0

