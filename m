Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.3019.1621556419063968720
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 17:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ZPZHHpqW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so16496349otp.11
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 17:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+ur3Z4rw6XClmH7zsq7rHaDbEproxD8AZkLhMTBJHUA=;
        b=ZPZHHpqW2FKBE/Res0dKyFLIUgoCeBQPMIdI6vDZjDH8LaMUPWtqV7cjM2AINmYahl
         3E8RzeyRZA0v3Gr7YJhEaRiyVFN1iMgCXJKmtBOV/fcK8nTGJnIVuJ7iLcgqK1ko90Ng
         Wl0dFbJ4fL/Tgbz5ejYASjxUbq8mnAGSZ5hEJNVI5TS70DIscgwQKyz2oIiHJIIqWN/o
         qwWuFSN5Qoem50IiDHHQFJHc0kLitoIfPC7neFgsEPvR/AEHh6Gy6MUxKO0nDiinVyX0
         dd11WPa6L6ATi3x6GK5N2CtgLX0DquY4yKpDc1Qt6N8jTc9l77glYLT4Hnl3cj/MD+99
         Amkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+ur3Z4rw6XClmH7zsq7rHaDbEproxD8AZkLhMTBJHUA=;
        b=dfhwBag79kil7Dw8pY8TLBoGeY7mcTC3CbhPf5FDf8vb7iQ8OR0Leqd29FGYG/OHY8
         SPNcbrXqpwlzRYzzYb5Zq5AvATxlfETW3p1a4p+4uQPzFoz2XLua7qy2T4lQKKOO1pCh
         /M5LoqQUp5v2TnEd7g7h0cw92Zi4SX44HxM7qjs1sh/tF1/u5yQqWOqQTqVe6+vx+/+1
         FQs29iUdk1MU3u1tW1qeP+Eyb1CXYIe7QaBqm7VdpLMpHJ1cyN7uGpSW5SCP16Zmz77+
         23nJrSq4qUptoXaqKzdtpvQql+EyOHMvFmfN9MkY/Af87/FgZG6E+wYi+4Ex0wu3beIy
         6gcA==
X-Gm-Message-State: AOAM530PorHS5wWhA0gN5jMuEDU/+mQbhG/arsM2dyO0uxRDr+aeyf6Z
	y7ZhQBTNSRSe52Czl9HUDO7YF551Zd2m61Khitg=
X-Google-Smtp-Source: ABdhPJxrNNKCO3rr8GZimBSVvK88bAZ7WR3iPLdyeYQ7RCXgve+r44LOg9CLLXiCPYJvm/NmoZDUMA==
X-Received: by 2002:a9d:7d12:: with SMTP id v18mr5849167otn.221.1621556418004;
        Thu, 20 May 2021 17:20:18 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v22sm831013oic.37.2021.05.20.17.20.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 17:20:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/3] boost: fix do_fetch failure
Date: Thu, 20 May 2021 14:19:28 -1000
Message-Id: <e27cfae747b1b990bcd151f5e1690c94ecfe10ce.1621520845.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621520845.git.steve@sakoman.com>
References: <cover.1621520845.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Ghinea <stefan.ghinea@windriver.com>

Bintray service has been discontinued causing boost do_fetch to fail:
WARNING: boost-1.72.0-r0 do_fetch: Failed to fetch URL
https://dl.bintray.com/boostorg/release/1.76.0/source/boost_1_72_0.tar.bz2,
attempting MIRRORS if available

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a76da15ece9d27fca20ace12db4978092e042b7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/boost/boost-1.72.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost-1.72.0.inc b/meta/recipes-support/boost/boost-1.72.0.inc
index 55a095bf1c..d152895f09 100644
--- a/meta/recipes-support/boost/boost-1.72.0.inc
+++ b/meta/recipes-support/boost/boost-1.72.0.inc
@@ -11,7 +11,7 @@ BOOST_VER = "${@"_".join(d.getVar("PV").split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-SRC_URI = "https://dl.bintray.com/boostorg/release/${PV}/source/${BOOST_P}.tar.bz2"
+SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
 SRC_URI[md5sum] = "cb40943d2a2cb8ce08d42bc48b0f84f0"
 SRC_URI[sha256sum] = "59c9b274bc451cf91a9ba1dd2c7fdcaf5d60b1b3aa83f2c9fa143417cc660722"
 
-- 
2.25.1

