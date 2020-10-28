Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.3853.1603858151116069859
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 21:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sr04niIb;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id h6so2014790pgk.4
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 21:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dH99n9kgK/t8cwzMBSww5ZeSXYbTrp6HzcsU+I8R7gc=;
        b=Sr04niIby2Lya/pBJ9JQ8LdA3SDYlcQQZ4PNsHPT4lp74M3FRUEJJINkh7y/x1CJ5J
         bfjcVb7lRueG10nfNnde2og93VFYT4WruTwx0hxeE/HJ8Uh0vSerUK8T1Kb7gNjO9a+7
         sjavZJD1UmJ1UvAupa9wv714P8w8k0tjiw0WxH74UZtIwdG/0xDG6LAlEfquWi0K9gbN
         kgme+pGailS5+8YTUYn4uUJcsA4b11/LmmvhINgAYcIRYOUvl+GmHTVSaM5eKNUAUU/i
         nIECINPONOn54zrVgvqsQfNDoWu8ndDzIAvBIptcXKm5+T0wtjHEj3meD4v8455IWZ6E
         Gi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dH99n9kgK/t8cwzMBSww5ZeSXYbTrp6HzcsU+I8R7gc=;
        b=W2HmucfrXuvbF6GMSQnLlKWFbWUqftiTo1fpMTSdTo7sO/kmfSZ2e2Lq3z6YTvXJJS
         pWdwbp+ZqUDdNQLvpiuvx+BuVK+z92tSwXCgVZ9y7VmpBER5+O6H3Lhz8jknI814/V18
         iSSDTbXineQCsGRxg2gueJ9Rp6UeCbOAlhAGcE83JMsnEk+yuOLH6+HM93N2Ru9w4mOq
         LaWU3MaGpwGELVMGemLIKN9gX46v6JzwwgRXiD/ckKBDLCvp17HYdTKe0qJrCU/kS9n1
         TR3+ki79G0BATj3tpWaX2fCtjidUSLGqElFZABsmYHn6LrdSwAgMI8/EjMYE6sjJI0SX
         9I3Q==
X-Gm-Message-State: AOAM532wF/30X4iaEVkT5CXUsaETbrUXmjg8cAvkBQhg+dGiaPDV5ssN
	yU4KNV9HNSfqQcQvQH6O3i1380CQs0EAPw==
X-Google-Smtp-Source: ABdhPJwL1iOjrRqraTEs5KRWDNWCKwXwCiQ+N+tgjhe1cTBXeDQmXP9vknArtMOOPISwozS75Uy58Q==
X-Received: by 2002:a62:75c4:0:b029:163:e95e:f52e with SMTP id q187-20020a6275c40000b0290163e95ef52emr5584034pfc.52.1603858150403;
        Tue, 27 Oct 2020 21:09:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::bc1e])
        by smtp.gmail.com with ESMTPSA id c1sm4133410pfo.207.2020.10.27.21.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 21:09:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] qemuboot.bbclass: Fix a typo
Date: Tue, 27 Oct 2020 21:09:04 -0700
Message-Id: <20201028040904.3446105-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028040904.3446105-1-raj.khem@gmail.com>
References: <20201028040904.3446105-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/qemuboot.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 824676216e..4b7532b304 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -43,7 +43,7 @@
 #                          QB_NETWORK_DEVICE_prepend might be used, since Qemu enumerates the eth*
 #                          devices in reverse order to -device arguments.
 #
-# QB_TAP_OPT: netowrk option for 'tap' mode, e.g.,
+# QB_TAP_OPT: network option for 'tap' mode, e.g.,
 #             "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 #              Note, runqemu will replace "@TAP@" with the one which is used, such as tap0, tap1 ...
 #
-- 
2.28.0

