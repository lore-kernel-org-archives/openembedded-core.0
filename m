Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503D6C48BE4
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:42:56 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.22275.1659940973527483070
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VUrpEcm5;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a7so14838457ejp.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aNqpJ0D9NH+QzCijYMEzShf8GLFKELE/jqszF9glM9A=;
        b=VUrpEcm54AlWEQ60lo9UMYmGnYcRV3BzHWIL1scaLxaQvfXs764RI40uD1/TODa9Hd
         cSSra7F9kWdzz87nQNDCGlPlsq6Bj/AsXfBA9GOAgfvEThHxS84RVcjS2OgAnavih/QI
         2GrjlhaGfZLyBezqJioYGzY6HpygNDkF1Vh49Wehf6xtBZtfzVe6AjiIJzG9H6krXWcf
         f5/11sysWsJ2/P4y5j4ashL6cSJo6lQBaeAp+2X/pdKZp5HserUilr4168AvKbEq1zp1
         XcjqVx8+ju2D54VtvlKoCTil9ItQ4/fFJ+dayRQlgxtkK4JsYVcNvgbNnuyH2yIUYdAw
         79mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aNqpJ0D9NH+QzCijYMEzShf8GLFKELE/jqszF9glM9A=;
        b=0XFvg3JbSOqrsewH+JacPCb49wuaQxZSoKc6M7tTlg/JUB053+3NpgqkZytm8NvJpX
         A7//L40iTjY17e743bZ3IVtY2pEVW8rtFopaY9K79rdq8BsDDWqWU+Y+7AflS8jO12fN
         Rn1Iz15yRARBjyyNuy12oqidWM41MMbZjqgM1wfZHTYFkGAbd2eHoQEZX+ypAg66xOJb
         PTS/vgoukcJAzU13SPTBf7+Awzv9g5hBXZSSuCtbiCFwyfgETku0sN/pGNg1TiNn1Hci
         9owRhc/3B7hDeMrcrUPYpWJgPLJ29rp+flWJ/i3arSJAls2vdpzsC/H1eaHBFL0vpyKx
         lc5Q==
X-Gm-Message-State: ACgBeo1RGB2vmOr2ywI5cbzHzPc4osxmouElr7xZFj0TN0xhJg0ftkFk
	6wIx0dFJSaUuyPvE9bnHZinKIAXlPU4=
X-Google-Smtp-Source: 
 AA6agR7wNXgsXxWYvXGh3Zx1TxMSFRLqn2iBTcI39gIAeGcD7pOSNoMeiCJ1C1kN2c2wlocDeWfeGQ==
X-Received: by 2002:a17:906:8cb0:b0:731:5149:a983 with SMTP id
 qr48-20020a1709068cb000b007315149a983mr3684435ejc.549.1659940972044;
        Sun, 07 Aug 2022 23:42:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 12/44] util-linux: upgrade 2.38 -> 2.38.1
Date: Mon,  8 Aug 2022 08:42:05 +0200
Message-Id: <20220808064237.3975347-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:42:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169036

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{util-linux-libuuid_2.38.bb => util-linux-libuuid_2.38.1.bb} | 0
 meta/recipes-core/util-linux/util-linux.inc                     | 2 +-
 .../util-linux/{util-linux_2.38.bb => util-linux_2.38.1.bb}     | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.38.bb => util-linux-libuuid_2.38.1.bb} (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.38.bb => util-linux_2.38.1.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index c9bddfb7a6..f1511f02a8 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -37,4 +37,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64"
+SRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"
diff --git a/meta/recipes-core/util-linux/util-linux_2.38.bb b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.38.bb
rename to meta/recipes-core/util-linux/util-linux_2.38.1.bb
-- 
2.30.2


