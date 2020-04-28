Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web10.1320.1588108689582967019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 14:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EHoj3j1w;
 spf=pass (domain: linaro.org, ip: 209.85.210.67, mailfrom: anibal.limon@linaro.org)
Received: by mail-ot1-f67.google.com with SMTP id z25so35335404otq.13
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 14:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QiWJGZIRGd1HOzB6jPuf7dv/+hpH9cfJFovMy+bWh/k=;
        b=EHoj3j1wdFA5/63wvUqBUAMcVosl7omTQJds3f2C4KSZvEi827eP3g1dSrYZb0HLOA
         /ep7Zcb9bcr6J4bZ9RlvXtRbmaV69fHoIGyoVrvHt8wZd2vrFK+2nLjpxXVvgc19R8Pz
         jQ2X2zK+X869rM/T+evFG+/l6wLYjzBAhQ10CcVIwPmNJjfiWOiJwJRGA9BHA3mQtwSK
         XBV6PwoW6vn3HVb7uGbklX7dbKSVpXcj5zDFe16Jof6f8Z3lmclqy6q7BBojkDQxJv0z
         Gv9dqeQ3o+fdYwk1XUh9Ql6bCehxiRixBzRJ8vpj5jtCu94BhEC9VFj/yZRkpcn7N2B6
         PUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QiWJGZIRGd1HOzB6jPuf7dv/+hpH9cfJFovMy+bWh/k=;
        b=dQbfr7Zw4kPQkjen+hl18YOhfVkCRhxcQ4h85CWLCRR/LMeQughYcoGu2dIbd8RRHh
         rxVMhbN7HDx2DmOGehuvHjoopB0/o4sPQeumXEi1Q3AjHFqsetSWYdq9iQ+yZD/FH6Fk
         klinyUdTVkNYuICqXITvf2nlWtK+aBKhqWgAuCu4Sk9OsXUDyNBQfGrcuafh/Th+TI9d
         LKy2whdvY+ktswmkmS3/KYfAit4GBqO/OZwsnKzBhE740Xk3Xf8IujeBoiGGUXMYBf6N
         2Y8vXZZgMFmF6jOpmI6su4VSspKiD/A4qO2oQhDjZfU7oZNv8UkMzKsLQrwo9TDNOg/n
         YV0g==
X-Gm-Message-State: AGi0PuYYyJKHbDWTd0tvooARrHaRgUjuzpUnmMMf3gNuWBXH2BjONkXM
	uUBCXrx8RWBndIWpTL/oug6LQV4jOGs=
X-Google-Smtp-Source: APiQypJTSgNgrioTV65ZxHVnrsTgLmzq3WOlBllA2/Nt5hMX8X3p6ZZmjk6lvrPs75a3BsXd5h/DHw==
X-Received: by 2002:a05:6830:138c:: with SMTP id d12mr24910877otq.310.1588108688637;
        Tue, 28 Apr 2020 14:18:08 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([2806:109f:4:3295:908a:c7ff:fe6a:e9f5])
        by smtp.gmail.com with ESMTPSA id 76sm5123987otg.68.2020.04.28.14.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 14:18:08 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: bkylerussell@gmail.com,
	nicolas.dechesne@linaro.org,
	ross@burtonini.com,
	randy.macleod@windriver.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH 1/2] ptest-runner: Bump to 2.4.0
Date: Tue, 28 Apr 2020 16:18:04 -0500
Message-Id: <20200428211805.233163-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for un ptests in multiple directories, useful in multilib
builds.

Changes,

1e9a845 Add support to specify multiple folder for ptest-runner
287ba30 Makefile: Fix TEST_LDFLAGS gcc cmdline position

[YOCTO #12604]

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 .../{ptest-runner_2.3.2.bb => ptest-runner_2.4.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.3.2.bb => ptest-runner_2.4.0.bb} (90%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
similarity index 90%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
index 187f22df04..09fabdeebc 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
@@ -7,8 +7,8 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "7015e9199ce748c0717addeebe7a8c47448bab03"
-PV = "2.3.2+git${SRCPV}"
+SRCREV = "1e9a84585909b970cc8850d3ea02a7215dcfa5a3"
+PV = "2.4.0+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
 "
-- 
2.26.2

