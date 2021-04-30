Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.7036.1619756291778247044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 21:18:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LozkYOG9;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d124so4841767pfa.13
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 21:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qLFQygdHWPMy3kn9H6BxcUGoKWeGRoJG28CkbSQzpRo=;
        b=LozkYOG9EIsYguK44N+Rj+BDhQfYy67HAqJJq0+vHLOocu591Zj0PY+yjmSDkAU0KZ
         zCjhqCSnyR2H+MRVO244sEC6ma13EklGzbrqt7B83z8C7JqUMkMKrFayOwbeIQ3IYW/5
         yQRSQ4FjMFUNPT6qYV7qeJz4ynwIDdecrTZdQWkZqkVYpO598W/f+OgKOxvfDWK5fBFp
         DsjHI52WTwuYxsRkV8qZQYf88IjmF+PT8HJiOTF7TYWpMS2IP0NXSBxUegybZIslc4h2
         EsGJ7DtvTa32S0WxaN7o8swybZKbDK20O2YJnU3gppxLNhczElXrIYxA5q9uWZ1k1tHy
         e7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qLFQygdHWPMy3kn9H6BxcUGoKWeGRoJG28CkbSQzpRo=;
        b=mbXXvraI2QkPGX4YYsRdiQYF2MM8RSS0DhRAD/XXVfjFp9pzrt3IRwj+uaBp3zUTW4
         6vtMy3qTk/hZNDp1jAhRUTfg9Qx5twmMoNtK1D5Trn3xmYuNmFD3UdKQpjLuyXDoYc0g
         657wPlcN6r2aibsK6xm6Tj2l06B7c0RUeGpB28CHS7n+HaU7A1EviEOqLzusBcTnzCKL
         BkN/pj2ohtkXP/yNKBmkJFwCdSEL46wQfd9m0YPp8hAxR4jXtgRLsWKbrGmH3Pmoxvnh
         Daw05jHvwc++41naDlTwUg4+4TJquu043tD2ooi9MOpQVy9TW4Ov/g+FHjpiy+op/2zo
         Ll5Q==
X-Gm-Message-State: AOAM533TcQ2rbKaeofJdqkFmS1+jYgqfQD3tp+Z3BtTK4Lmu9g6Cqbsd
	A/SSgCayJ3sjV9sseLr06httP5mFdJ8Asg==
X-Google-Smtp-Source: ABdhPJztg4AzoYLCqSRE15TtgDOpXPzn47cwR+cFml8ddK/JiGfNhvlBbOHMUGOjRMjWgSNKi8SGcw==
X-Received: by 2002:a62:8407:0:b029:27f:2cae:df86 with SMTP id k7-20020a6284070000b029027f2caedf86mr3034197pfd.63.1619756290815;
        Thu, 29 Apr 2021 21:18:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id g18sm591891pfb.178.2021.04.29.21.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 21:18:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] bash: Include files needed for run-heredoc ptest
Date: Thu, 29 Apr 2021 21:18:07 -0700
Message-Id: <20210430041808.2520362-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These files are used by this ptest case

103,108d102
< cat: ../y.tab.c: No such file or directory
< cmp: ../y.tab.c: No such file or directory
< cat: /usr/lib/bash/ptest/config.h: No such file or directory
< cmp: /usr/lib/bash/ptest/config.h: No such file or directory
< cat: /usr/lib/bash/ptest/version.h: No such file or directory
< cmp: /usr/lib/bash/ptest/version.h: No such file or directory
FAIL: run-heredoc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/bash/bash.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index d3e1dfdb30..7350601c65 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -91,6 +91,9 @@ do_install_append_class-target () {
 do_install_ptest () {
 	make INSTALL_TEST_DIR=${D}${PTEST_PATH}/tests install-test
 	cp ${B}/Makefile ${D}${PTEST_PATH}
+	cp ${B}/config.h ${D}${PTEST_PATH}
+	cp ${B}/version.h ${D}${PTEST_PATH}
+	cp ${S}/y.tab.[ch] ${D}${PTEST_PATH}
 	install -D ${WORKDIR}/run-bash-ptests ${D}${PTEST_PATH}/run-bash-ptests
         sed -i -e 's/^Makefile/_Makefile/' -e "s,--sysroot=${STAGING_DIR_TARGET},,g" \
 	    -e 's|${DEBUG_PREFIX_MAP}||g' \
-- 
2.31.1

