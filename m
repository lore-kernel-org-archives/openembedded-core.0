Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.19740.1621260909143573325
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=d+hY1F9b;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id i5so4777041pgm.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OUvADhLprt96qyN6eAxXZ/jPz3dkPBy3ogZqLiW/YGg=;
        b=d+hY1F9bUyZR1Q/O0+vNoT8sxOQADUdvKyjJoMgShT3myySb9R5bs8I3usPvWBsX2E
         NhmiPMzPwnfeJt5XvuTneFmDrbAFSaFt2mXmKfAfhXDsoyIBSr3A9vl5kiIz8jtzsZnY
         DSvUhLPP9Ac9Edmg89CBqwdhZHT6dnrsR4b2Il4R6t9gtwwriovxTwv6wqEHZ331OoPG
         jC/s15mVlMrBji6gYkRb9ygDzBKnDPsWyOXHZlYRjZ0QGQ/3z5G1UOS4vYe4+mLNaU9Y
         XjGfQZ3i9kLD6xDVlvVp+ghUWlyQNaKczcjifbqg931+4VRUZfM2rOz79y892AySrjuD
         nwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OUvADhLprt96qyN6eAxXZ/jPz3dkPBy3ogZqLiW/YGg=;
        b=dI3IS0XtJhhhWhAsRHNh1ckgnH/4+HIm6354eNslglsZ/EAnMYx2eS8/JsbyCaqUMh
         ucfIa6+B/Q+y06TipZcZQ1qcLoNgmUGxBroirB8xIc3wDraad+8Kf/lnosRr4lKaDH0G
         ZKYd3z9LOqoOrfN2cFE+8ZnSgtqHI7LiBri1wBbzLHpIT/bDjSQQp3ekryCrC93JKhsa
         liPCHXE02cvEdbz3V8R+f+ypMy64kUOQ1kK8QrzhdvH1rfznUY8M8GvQvFnGJ0fuTAtE
         M9JglU6/zXGFQ/rTx3kpF9qd4J2KJb+hfXieQQqpiz7nTL3aYbu7Kudpn4McH/l2rcM4
         0LEA==
X-Gm-Message-State: AOAM531AEhi6292Yt4Ao3ynsIUUdDZJuowHtVzCxGnv7XCR2spMyEtaW
	3SBEa6xqcWZfKTD+jmCAhLUS6djO6yufZJR+lTE=
X-Google-Smtp-Source: ABdhPJzeamHS7LQjp0tuA+geR/tGrr0Q/ZxCqrQMMQOpwrYiUjFk1fgbuB/uWdzgew/sMVQ8WEHwFA==
X-Received: by 2002:a65:640f:: with SMTP id a15mr48567717pgv.251.1621260908304;
        Mon, 17 May 2021 07:15:08 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.15.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:15:07 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 32/35] dejagnu: needs expect at runtime
Date: Mon, 17 May 2021 04:13:38 -1000
Message-Id: <381a5f3e409504b2a31710d971eef58346339ae4.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Romain Naour <romain.naour@gmail.com>

runtest return an error due to missing expect on the target.
Add expect as runtime dependency.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d9a3a08edc1efcbe7b02e80be98370792d3c6cc2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb b/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
index 0a007bb2cd..ce242c3593 100644
--- a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
+++ b/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
 
 DEPENDS += "expect-native"
+RDEPENDS_${PN} = "expect"
 
 inherit autotools
 
-- 
2.25.1

