Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.5971.1592864165476279974
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 15:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OLwpq3v1;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id dp18so19587250ejc.8
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 15:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mTBjIkcjoVlBvsF5WpbSIaXgytoExBWIQcQk+eQ74uQ=;
        b=OLwpq3v18r6Qrj+yNqhRGN2JOEZKFDC5N3FSRl6xp2C2Cy+p2nX5+fIdWI93cM9lmd
         3K54fScJIGtLKZIUkvrlJxcVDGcEjGJnL+9rTIHWxLWGjHkAeJ/Cfty9mLp5QbFuLzHt
         sxjnVajSgEiKgxsBNbpd2i6JYrQhXDOYTRKIO0XTuELo4smnR0Hg5Ggl6ZcpcbxtsMXb
         5FHKYm8qrQfSOKbY93dAO/rOcKbvxw+DW9ovX5S9OdB68T8m13x/vQ9v6h54394ZwEhm
         kZfhpCtY3RKDH5oZfgWjYD0sUA0nR7zInlmx+UPmrxAZ+n5JDVgDJ50wpni6BcLbCwAd
         uYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mTBjIkcjoVlBvsF5WpbSIaXgytoExBWIQcQk+eQ74uQ=;
        b=MeJLzR5gH3RhIAdamCthN0BDpgG+et4pQzxSq5E5wExmTI9aAB2KN3r0NVBbe1oU6v
         +PDaYBLWiyIXqAHLdd60E0M7pXQPTxy6yCMke9PC3wBuagY4Qj59BBmoOKFmNzq4Gkdw
         zn9mUuqlPmYH/1s2tOVuMIfj0YQchKvUDrqVs/gDa+GugmQF6AVeYpnwapRy7dJFDf+7
         fLg7wKG7QrEJp2QmmvA3bva6jrtmI45Y+kxm64d7MKSBz2K9ecYj+10zxSDARqPw/oyQ
         gTq6ebVQCQMiJ4ohFNS6ns3skyVs6s5LCmeIgTKo/znc24GFO7VF2cuKNwNfGAb3q7qY
         8fJg==
X-Gm-Message-State: AOAM531eQFhuFZEv6TCxXWHaocb4ASsbWuVFzKu2LvhMfuD04OPWapAQ
	OQo6GvLrAW7vYKJ2w9hqKzJ+sLPe
X-Google-Smtp-Source: ABdhPJyuyfYjVW+SduZtlJpTgfTkTz5Pqky8XAmHXgYnwBW3WU5GrpCJFsbr4KuVSp9vEEwSJQtiLg==
X-Received: by 2002:a17:907:a92:: with SMTP id by18mr679547ejc.116.1592864163853;
        Mon, 22 Jun 2020 15:16:03 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f481d60137a2e45bfed0e33.dip0.t-ipconnect.de. [2003:f0:7f48:1d60:137a:2e45:bfed:e33])
        by smtp.gmail.com with ESMTPSA id n16sm3703803ejo.54.2020.06.22.15.16.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 15:16:03 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] sqlite3: upgrade 3.32.2 -> 3.32.3
Date: Tue, 23 Jun 2020 00:15:48 +0200
Message-Id: <20200622221551.1530869-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200622221551.1530869-1-schnitzeltony@gmail.com>
References: <20200622221551.1530869-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../sqlite/{sqlite3_3.32.2.bb => sqlite3_3.32.3.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.32.2.bb => sqlite3_3.32.3.bb} (68%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.32.2.bb b/meta/recipes-support/sqlite/sqlite3_3.32.3.bb
similarity index 68%
rename from meta/recipes-support/sqlite/sqlite3_3.32.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.32.3.bb
index 8de74aa221..1d4e8d4772 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.32.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.32.3.bb
@@ -4,8 +4,8 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[md5sum] = "eb498918a33159cdf8104997aad29e83"
-SRC_URI[sha256sum] = "2dbef1254c1dbeeb5d13d7722d37e633f18ccbba689806b0a65b68701a5b6084"
+SRC_URI[md5sum] = "2e3911a3c15e85c2f2d040154bbe5ce3"
+SRC_URI[sha256sum] = "a31507123c1c2e3a210afec19525fd7b5bb1e19a6a34ae5b998fbd7302568b66"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_WHITELIST += "CVE-2019-19242"
-- 
2.26.2

