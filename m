Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.9605.1629636675857076802
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BR3sV1Tz;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id v10so10550580wrd.4
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xPaAq+E7eLZ+VSQZ9X1m2dBnCHFhsgdXoCHrTx7UX+k=;
        b=BR3sV1TzNW5EZGX1Gjhr3/5upNfAfnqHYhtDpLctts21y0E4OF6Q2/9Y234uDzPQdc
         ZB3jjePpgwzkFvy+mYMt3K1cgIe66SAJJx7szgapc1ogMT3VvztN87tMawVqByGGA+6u
         /EmuEXDSYylvD09YsdRDO/NMqcEUQgRx4uZgb8xnaVbU1raTCflirtKRMfKCh2n+zu09
         Um5uzjmqn9ZPA9CmbRwRyibXay/3rTK8Ls51+YM0S61I6woD1K6N6vwI7EDxx5ntqE01
         +UrZoI1vvQ3FdRddtwsgG6mdszTlq4IMCSMg+hlW6E6g4jVnah+/mX2dtbdQ9+pnmTEN
         O0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xPaAq+E7eLZ+VSQZ9X1m2dBnCHFhsgdXoCHrTx7UX+k=;
        b=KxPcWW7ATtN7eC3gqHc9LEwmEUe3E8BDpjLTrjwCtkAldqSaVC2HPGb17WJQnP2nUW
         gItuL+RRw01hOwTQCdHRvXY9s9cHp3bd6D3QYozyaekrEynlKPH4r4fMummgIn5R4eqB
         35V0zghbqOoSAFumx2iKQUxq9lkSmz3yYXRTcdQzqGzQN/igQLxm1AvgKfk90/InwOJZ
         CuWNMz5UON4/Od/a8dQSSw2b/QgYweZqgx3puRLDqkq+DphI0+aTUP6Y8cD0fK9zUHd7
         7BUD0G64rVMI54Ef4k5hCFFt6jb2oeUUH9BJH+FEbzco8/5Muk8RE1BDN+p9kZT9zNZH
         KF+A==
X-Gm-Message-State: AOAM531rr2KTZtgJUaU2KugDvzAgyyLyknI2F2H51fdHTmT84yT7kX6y
	Xo1XELSiuej05OW2btaIC3yU5t8LflpxhQ==
X-Google-Smtp-Source: ABdhPJwn2pVQnnBEWiMFFlGUORRWwXxSKgdFpZaLNuq/TCHeW49lKRWB360q5fDtcmYIZa0wvnAG1w==
X-Received: by 2002:a5d:508d:: with SMTP id a13mr8574007wrt.172.1629636674543;
        Sun, 22 Aug 2021 05:51:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/55] python3-cython: upgrade 0.29.23 -> 0.29.24
Date: Sun, 22 Aug 2021 14:50:14 +0200
Message-Id: <20210822125103.310416-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_0.29.23.bb => python3-cython_0.29.24.bb}    | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.23.bb => python3-cython_0.29.24.bb} (99%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index e3f14fc49b..5a8ec2a0ff 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "6a0d31452f0245daacb14c979c77e093eb1a546c760816b5eed0047686baad8e"
+SRC_URI[sha256sum] = "cdf04d07c3600860e8c2ebaad4e8f52ac3feb212453c1764a49ac08c827e8443"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.23.bb b/meta/recipes-devtools/python/python3-cython_0.29.24.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3-cython_0.29.23.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.24.bb
index 296fb39b6f..b1d21bd15c 100644
--- a/meta/recipes-devtools/python/python3-cython_0.29.23.bb
+++ b/meta/recipes-devtools/python/python3-cython_0.29.24.bb
@@ -34,3 +34,4 @@ cython_fix_sources () {
 		fi
 	done
 }
+
-- 
2.31.1

