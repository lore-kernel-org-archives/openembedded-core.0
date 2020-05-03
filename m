Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.26073.1588523196727474634
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 09:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rcaKlJuu;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id x17so17988838wrt.5
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 09:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ipbEHYt9ndYRPJvTmqp9HSrJH6JZOyyi4HVFpSXW+AE=;
        b=rcaKlJuuSlxlvWk/9UftnNdC0vI0jsroHd11+sv0MGh+4T32Co6VQ+PBno0dniQwRf
         H7WF3IYsDqIqLE6GRtpIFpthL4gFKhzBGkT65HbZzr+CuTZLv/eQ43xWkLY2wjxipBR7
         nEwSrqMxYzPrtPq05FufojHdZL0aA1bFDpOMEPWssneuEs1jNAHIVV9J9Kkn10/Z2pI5
         gOqBACL60YHgv20RYKnJwiDwCPrqpIxLo73WB38X+eiRZyiKoBmS/1hYivw1FzLY8bp/
         eDC8oC7u5DQ3XFy9LjP5ZRxGy7kxOBJtHAT1qjnUb4Q0SeMHQmWMj8l2p1yoopRMDDvx
         W/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ipbEHYt9ndYRPJvTmqp9HSrJH6JZOyyi4HVFpSXW+AE=;
        b=rg8ih8k3GE5S4smH+jVYAVVPVwd/nc8yFM0TgB1h3CZioZnaE9VdK8n8DAbALf2dry
         Htjy4vR2hKwMQSoB74sCj9qsneLbnAoOzTJuraNpIV1iXGpQ0sDK7Yo7kYhftSIhMzNH
         JnbrP4JzjJT2Y2ULysUKXozlrl4/Uke560PbYJGD132o9CzTMrsUNAJoCJpI1/sHUUJJ
         JZhG1FbqPkyu4V0QYCpSaDiPMSp3zUJAaEnlNQx17jRVhUM/uDo7KLWTyiavr0H56O1O
         5jH7r5vbsYNjlTpzeISoZG06XjxnLw3BdhRDEk32dJ8M6dLOk9g0o9TkHOdQ8Db3GLil
         QUcQ==
X-Gm-Message-State: AGi0Pua0RMSWdP0tI2d2tvxdt/3ZDtsQHKYK+w8KITFMaLB0BrUJjmbh
	L0sQG0egIr8BpPA83S6qK8abnxx3
X-Google-Smtp-Source: APiQypK/LJJo2LOPKeKUQX4r1jkKM2nN33N+I3sj7u2uWDqFuMJdinEF/esCOjl4ZMbRPA8IJOAmsg==
X-Received: by 2002:adf:ea02:: with SMTP id q2mr14173235wrm.31.1588523195104;
        Sun, 03 May 2020 09:26:35 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id q18sm9079532wmj.11.2020.05.03.09.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 09:26:34 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/17] diffoscope: update to 143
Date: Sun,  3 May 2020 18:25:49 +0200
Message-Id: <20200503162559.946-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200503162559.946-1-alex.kanavin@gmail.com>
References: <20200503162559.946-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../diffoscope/{diffoscope_136.bb => diffoscope_143.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/diffoscope/{diffoscope_136.bb => diffoscope_143.bb} (75%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_136.bb b/meta/recipes-support/diffoscope/diffoscope_143.bb
similarity index 75%
rename from meta/recipes-support/diffoscope/diffoscope_136.bb
rename to meta/recipes-support/diffoscope/diffoscope_143.bb
index 3e3e1dfc00..4ba3832d10 100644
--- a/meta/recipes-support/diffoscope/diffoscope_136.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_143.bb
@@ -7,8 +7,8 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "c84d8d308a40176ba2f5dc4abdbf6f73"
-SRC_URI[sha256sum] = "0d6486d6eb6e0445ba21fee2e8bdd3a366ce786bfac98e00e5a95038b7815f15"
+SRC_URI[md5sum] = "a86cf8467a5dec99832d5c082928f937"
+SRC_URI[sha256sum] = "a1fb4dd97af92bb8ce275d1caf465971726919e28efe5f043bd3ea9afb50574a"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.26.1

