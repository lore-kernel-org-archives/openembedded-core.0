Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.28451.1605722952057672229
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 10:09:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZsIDLWwv;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 81so1751040pgf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2020 10:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cKkWaGnPvfn1SGZ1C9q/O7SwqoJ8ihRB32ljNtq9N+I=;
        b=ZsIDLWwvOkQihpY4GDvLPjDd51KxNfr9WOJkRm86eOuTa0eBuTfgkumN7KHg3Zhw39
         7icpOsN0cNtEpKRcbjfqPcf0rmMZmY//n9DM32yZOpboBsymM9On3sIJOl0zRIajbzgh
         ksFAly6EjjjQnsfgeC0CWQYFIJG2mAZVSkWI7bVUOZRaedvlxLWJgFJ+zJxF2mBbs+df
         nOGMj7LgYqwxPC9P8P1BIRJP1mjjooNmE1B+XLiOfzBHGa75DJTxQW0bg/3k2Hmz1z6y
         kRZ2fTxa89A9bdNCzWH4mckYRe3jHxyPcSSEXXzIBf36p/h3E5at5tsjCGOzUQ4R+Q6c
         bceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cKkWaGnPvfn1SGZ1C9q/O7SwqoJ8ihRB32ljNtq9N+I=;
        b=K+HTV/Sw1lq0GfexnfholxqxfZDHLVnwIdYBFv6QTr7DKryu+m3kxYfTqpAH/cRaeF
         4WkiGzGElAOF5pDuajNS/vb6wG/mOLbDemV6Rk9fhy04PRfDyY7Z62hJLSHA3cQdwiMk
         II/SCV/mjHVWIcOAGkwZiiCJqSYhV03FFP/woFF5TzUyw5YbsIlV4VoqCtuDFpyLqrlH
         07S1IYvy1tLFlcsJOOLX46ROHNS13fU6WSMnYuJp3i2c2iY6MZhV7uiQuTI+bdL0GCD+
         6hy5kDP3W9MRJr0i5W5SQaNEC0CFucsLEFVr5uBfdiiajXVtbui2PB47c1gMxehAFAEP
         uOSQ==
X-Gm-Message-State: AOAM533yg9wUMjT0/xaSTEIO6Ne/8IoqRYZm0UIkaWcJdJSvMKGcyPni
	qyOBmm3iwA5sumcBxSMsv8agbDyLwHJj4Q==
X-Google-Smtp-Source: ABdhPJycmkftlB81K7gqKseT5fqt7xmpgX1P3oXmoRspMjcpOO2+2ykjTU3mw9ig5pw6NhgL+Ie9Wg==
X-Received: by 2002:a63:eb4a:: with SMTP id b10mr9616710pgk.416.1605722951275;
        Wed, 18 Nov 2020 10:09:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id g15sm22847739pgi.89.2020.11.18.10.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 10:09:10 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-numpy: Add ldd runtime dependency on ptest package
Date: Wed, 18 Nov 2020 10:09:08 -0800
Message-Id: <20201118180908.2708116-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
E           RuntimeError: command ['ldd'] cannot be run

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
index 08130821c8..5b448081d0 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
@@ -49,6 +49,7 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
                   ${PYTHON_PN}-threading \
                   ${PYTHON_PN}-multiprocessing \
 "
+RDEPENDS_${PN}-ptest += "ldd"
 
 RDEPENDS_${PN}_class-native = ""
 
-- 
2.29.2

