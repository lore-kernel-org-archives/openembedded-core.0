Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.39129.1608558640732380306
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 05:50:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QI587XJy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id x22so9921565wmc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 05:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DT0AklcgYW2RXcmvb0TXghlQN1QXoLt2NB3I474kW1o=;
        b=QI587XJyGAX5104H3m/FWZ4Z3KsPTUdIs938qeUqLN1cjJJq3OKPYo0oh7DRrCvbxj
         /fnt+T35DR01wV8HC7OfJtUkle7XFkCcG5Ux1cZdg8zccPZRqS1gwwPWjJt9tJKRI+kB
         HOLtgM1X/SDEmPj+r0fIblXNoaO94PMb2pO8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DT0AklcgYW2RXcmvb0TXghlQN1QXoLt2NB3I474kW1o=;
        b=fxh9pTgbsqVh6fogbd/wG84+bJNZS/EOxuFTepzXniAauhM52Q9KnfC1+PmtxNEUzQ
         SDQ/e3W9n1wXskc7x/vErgqVyChfYPPxyRFjufTttMPPJobohV4IsJuOjsktSZpBK8vC
         tvATQNogGlUZnrhrV3CbItJiW5cYXukHcQEEhwIrw+2fCeET+ZqfWECZ7hoJzdCwXSmB
         JyqlUy/P7XNlXlV9HRBhGF/a+zM7KKGk2UGanD+mJKN3P96yL2bqU/BF/+GZPdnR/vaT
         +0sEhS3mHEjBKOZMDM4vTEZ+lawIVLJkySG47helxEqFiYoJXMQrnzVsfzZJZV4YV6Je
         M+Rw==
X-Gm-Message-State: AOAM532PVVqww71YEJN2H4pC1Oo7mr7TlLTwEWk4t7kwFlpi/5iSdn0h
	jiROP4tpTVbh9qffQqF0MO/cEuoVk9LLgw==
X-Google-Smtp-Source: ABdhPJxaL4nDldDmL7LX5YFZlWNOEXRkt2vP8t4fkTt4mJ9Oy3aBZiCfNriXU9+YbBhNS9U15ASs/Q==
X-Received: by 2002:a05:600c:2116:: with SMTP id u22mr16579940wml.174.1608558638793;
        Mon, 21 Dec 2020 05:50:38 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (b.b.4.9.2.e.e.0.9.c.7.7.e.d.7.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:67de:77c9:ee2:94bb])
        by smtp.gmail.com with ESMTPSA id h5sm28096704wrp.56.2020.12.21.05.50.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 05:50:38 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cups: Mark CVE-2008-1033 as a non-issue
Date: Mon, 21 Dec 2020 13:50:37 +0000
Message-Id: <20201221135037.9820-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It only applies to MacOS.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/cups/cups.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 91e73d75e43..e7a704134c6 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -20,6 +20,8 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
 UPSTREAM_CHECK_REGEX = "cups-(?P<pver>\d+\.\d+(\.\d+)?)-source.tar"
 
+# Issue only applies to MacOS
+CVE_CHECK_WHITELIST += "CVE-2008-1033"
 # Issue affects pdfdistiller plugin used with but not part of cups
 CVE_CHECK_WHITELIST += "CVE-2009-0032"
 # This is an Ubuntu only issue.
-- 
2.27.0

