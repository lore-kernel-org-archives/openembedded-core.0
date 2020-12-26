Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.19469.1608974886609793301
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dKJpl++z;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id lt17so8325357ejb.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CQIBRw9ED3kFIE9pAd4OnnjMXhrGVYKEyRnUPB1PlOk=;
        b=dKJpl++zDEazATXy2HxsTV8boQwiTWl4vICBJlqCJ4EvQdqMdYc/e1C8rkLQ+eOZgI
         Wat0PYA2O0Wubi2zvi2tX3ZoSZJUa4wmqJ/uDRwFzSUWPwFpaTzJG/Wlie9gm0EIgMVo
         7xpIm5xueQomPezeJ1Natac/26crrE84P59GVs/VG6YaSQSUq1Ul9JR8bJwD2kkQbj/C
         rf2psKX+OOxlEQ55QxWUiJkftorp8MNLuITAqa9+pERSSJU9SyjcQr8tivnafhktSSdy
         yMzX0HmLmferokOkiKb4CWfkbzqt7/4uCcKhbMhG6wHeyvvBa+Eu8mRYfTMhrKbKQWr5
         gjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CQIBRw9ED3kFIE9pAd4OnnjMXhrGVYKEyRnUPB1PlOk=;
        b=OFz7Mmk8KaIgs/d6TeSQQd2RWyn//w28ZxZlfCK/YeCaABCXOy5yg5MrvEk7RmCzBr
         flMNdeticsJBxMogEviileYe642mlxrorJTbxpiFB20J4M4TGY0ApgmeWAV4ImG1P9jX
         LQ2dpmzIbTUy/pgCPv0jMmfl6dUrAdYirZfKXXiTt59z3thBIp0Yq4NCP2wvZGIforLw
         QUU80HdFteKryiZbSnm27ylBXQgdIWafT3UchoTuGhCMEvFw4Rgsy/aXiLrB2uMqe0lP
         kvGa20l/88UOFnd2Nq5ZFykQ0vH9BgoBIIKIL29XiprC/tGTO4pQ3U+Bo80JWN++kvJ2
         oLwA==
X-Gm-Message-State: AOAM533fpeXi9MeUFD16hlMdY904+SwoNMKC+qM4abz9/rde2xZWPtoz
	98F0d+DDmEmRO9evgrSZcRTwZs95LM8=
X-Google-Smtp-Source: ABdhPJwAmihjIT0cUXnUXSBngu18u+uefizCwuNqiJS/UAyOsZf+xtWeihcxgr3rQaOYK5rqG4CjLQ==
X-Received: by 2002:a17:906:d8a1:: with SMTP id qc1mr33912170ejb.294.1608974885281;
        Sat, 26 Dec 2020 01:28:05 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:04 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 29/48] util-linux: upgrade 2.36 -> 2.36.1
Date: Sat, 26 Dec 2020 10:27:13 +0100
Message-Id: <20201226092732.52323-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../util-linux/{util-linux_2.36.bb => util-linux_2.36.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/util-linux/{util-linux_2.36.bb => util-linux_2.36.1.bb} (99%)

diff --git a/meta/recipes-core/util-linux/util-linux_2.36.bb b/meta/recipes-core/util-linux/util-linux_2.36.1.bb
similarity index 99%
rename from meta/recipes-core/util-linux/util-linux_2.36.bb
rename to meta/recipes-core/util-linux/util-linux_2.36.1.bb
index 474f1e188c..8ea0bac9b2 100644
--- a/meta/recipes-core/util-linux/util-linux_2.36.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.36.1.bb
@@ -40,7 +40,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            "
-SRC_URI[sha256sum] = "9e4b1c67eb13b9b67feb32ae1dc0d50e08ce9e5d82e1cccd0ee771ad2fa9e0b1"
+SRC_URI[sha256sum] = "09fac242172cd8ec27f0739d8d192402c69417617091d8c6e974841568f37eed"
 
 PACKAGES =+ "${PN}-swaponoff"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', '${PN}-pylibmount', '', d)}"
-- 
2.29.2

