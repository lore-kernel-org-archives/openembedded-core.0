Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.2583.1615661553699501702
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vRY5qZCb;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id w125so1841833oib.13
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bGvlSv04+FRjBoMl3wD/868vKvZjjO7RDhOLjMclouI=;
        b=vRY5qZCbnqIzgRuhAZFaRg702zsZpyLl28eLtq0ORoa7n2EAEgs29tfXhhBrODO9PY
         Q/toz3INqjy+kSRDHeSxQ0kM7Rw5OAGhiQvhQZ7DvCRL8UhNZLN4L1AYU32IJvibV4lW
         kzvVX7njG8LEVgjTEUAQgyx/E9tjKwNXwMZbdciwqHGwpFId7W2aJfyXFmItHhl6TszI
         evwxk5SWn4V2jy+hikvXPEPAkjzwagPLvX8/sQNo46XPwkUAiAP2pJrZcl57goQDkcVG
         VDK+eCHUV7oRXkPeInSCn8AD7JTtviml5hW/C/bTR8/1nDJboTR97Gp3XTiuKatj2ZSb
         M7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bGvlSv04+FRjBoMl3wD/868vKvZjjO7RDhOLjMclouI=;
        b=dhZpainhH6R3hk+H3zRjM8TFADCvLK9FWI6B5d28SpwYW7188IskKAINJEdfJptjen
         vgZD0i8rUNb8Uv68qcPiiJc9XvZtuCZYuAyJfUI5SKxjpBaut/pNTrcDab8ueyg5HOTG
         PMP6YSsDpSKl5AJzP7+JgEpNxWadYZnhellZyn0Qn8UeIbOUwIugBw00niEkU/q8cRfv
         lP85ZL2jot6z/9fFN1G9qqW1GLqUWK1DdQSBb+HW5RNgL8ZIOfUavdAXi/6il4l8rshH
         HzFc9xNNq4GvqMMTkWBNNhhe29jFAjcs+R/Uk3A+wb1XxYuEd30Nrs+ASLYbsu9uf6VX
         ndgg==
X-Gm-Message-State: AOAM53257krudcqe8utrZq5fOsTufSyba44VQIv9XGZbixBqEwKlvqcd
	viN7b5+xtLZtqKQPIO0AgwYQPt0VIlgcpQVb
X-Google-Smtp-Source: ABdhPJwoao558asJNqVH29sI7XwaK9Q6mhm0BlOO7ls62Idn7+/p+y4Vqll1Vo11AdR8a0CGzHGOKw==
X-Received: by 2002:aca:1c0c:: with SMTP id c12mr13935967oic.80.1615661552562;
        Sat, 13 Mar 2021 10:52:32 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.52.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:52:32 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 32/38] local.conf.sample: fix typo
Date: Sat, 13 Mar 2021 08:49:21 -1000
Message-Id: <d37f474f7211fe9d6e1e5561bf27cc6afa2872ab.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ulrich Ölmann <u.oelmann@pengutronix.de>

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6413f56a19417fe9d2aaa0f3dba4fd12c41b98c4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/local.conf.sample | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 783d2c4c16..ce18b5f057 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -185,7 +185,7 @@ BB_DISKMON_DIRS ??= "\
 #
 # Shared-state files from other locations
 #
-# As mentioned above, shared state files are prebuilt cache data objects which can
+# As mentioned above, shared state files are prebuilt cache data objects which can be
 # used to accelerate build time. This variable can be used to configure the system
 # to search other mirror locations for these objects before it builds the data itself.
 #
-- 
2.25.1

