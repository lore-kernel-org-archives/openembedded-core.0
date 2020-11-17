Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.10266.1605629680300894673
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 08:14:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IAeduE4R;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id j14so19956317ots.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 08:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gzYSlidJKSfP/5aJJK9UKb6toOJgYrlSo1aXavYXkkU=;
        b=IAeduE4R2aZFUiO1wIMwico9Yo5LIPjdzP4Rd200SR4+FJpGuqR/LNfjOcxzglDrfM
         2r48Nufra57JWuRToIuHG1NQidpBwen3UbSi8nYFQGgs9CMhGV4EEqWFralyG6oJ2Yir
         9kuYSghJ/c3jw/PuoHUXp27TivTp7bwwm0RLavPB1rhtnMpeZBbjbOC72LNQn20BQnrV
         lpFaOa76xspU0LR6MdfM58LOa+xjYqi3WkeQGU0rs9SYUUASj4ue5/r52Rj9fUAhrd5M
         t1Ot9bLQzub4+tQlvcdKce7BR+nDfsmeuY8XDlGIzDZ4MzuGYD5N0pr1a9lUUg7BJ/4H
         0BJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gzYSlidJKSfP/5aJJK9UKb6toOJgYrlSo1aXavYXkkU=;
        b=sfg0ZIIyomdLU9HwfFCnqHK3c6XhS9MikRfZmzbwGBD3xzxbRvOj/YFapA9mlLiy0E
         Z3aconn1Av1c9kkCMkdlqUVZbz+QorjTIBDKw3BzOpm7GGFPZGxaLJsvMPhJApzrND5V
         CQHC6Mg8+eEQxGQPj6906FEF39QU7qnKnbYqArYk7n0U9laYcf4pl7UpJisTcS9dSqs6
         ZabaKBTVq4YOXToHBeV897jpUSS+lIjAAqbrd3feChYrt3GfB7dCBWJaKlVlxLgX/VIs
         WPjIJ7XqvdI/4DHU7XM+01//r4BgMlsbIhOce/a6q0rjI11gHoYlK6JnHEw1z1BF9TQv
         Lfgw==
X-Gm-Message-State: AOAM53307MVPUtchFJo7H24i8Z8GEe82cJNDvEBhdKVbWKxK/944xTCW
	xVB9MsMNRh9mAY/GnxD/bpxQZGjWSM/tSA==
X-Google-Smtp-Source: ABdhPJyuysdyLl8pymYnaSCvB4h4GmCPWjTfwCInGIOXn5wfkoUyCvfYkXmXTW/Z+BBtjatHe3VjYg==
X-Received: by 2002:a05:6830:1002:: with SMTP id a2mr3665530otp.316.1605629679333;
        Tue, 17 Nov 2020 08:14:39 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id p17sm6390719oov.1.2020.11.17.08.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 08:14:38 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] python3-pycryptodomex: upgrade 3.9.8 -> 3.9.9
Date: Tue, 17 Nov 2020 10:14:36 -0600
Message-Id: <20201117161436.30909-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...n3-pycryptodomex_3.9.8.bb => python3-pycryptodomex_3.9.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.9.8.bb => python3-pycryptodomex_3.9.9.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.9.8.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.9.9.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.9.8.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.9.9.bb
index 035c7fa636..abff71efdd 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.9.8.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.9.9.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "48cc2cfc251f04a6142badeb666d1ff49ca6fdfc303fd72579f62b768aaa52b9"
+SRC_URI[sha256sum] = "7b5b7c5896f8172ea0beb283f7f9428e0ab88ec248ce0a5b8c98d73e26267d51"
 
 FILES_${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.29.2

