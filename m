Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.3413.1600132381723980475
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 18:13:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EcWW5Kjb;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id l191so1089366pgd.5
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 18:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oMTPpP5aw7XAf95XQFpUJMhifI3YTizyNakuDxtZv+U=;
        b=EcWW5Kjbg70/PSYsNbK/FpYLkAzBzGcus0LAQz261KU8i2Tpqr0W7FG8r+3uvNqGyk
         AITufxsQ2BjzQjWSOg1nR8gxTzbnuevnaYJ3NXKSTPIwUxkzAvvgiK1Erx6etIjIAV4e
         CVbX6SDS+TpNvVRy38f2vfErHQX3RX+w8kHncxyqlilfLmIjVlNjk70dc70gWOcEwge+
         8RzRbhlE0kp616Wc6zozPhSw65ytc9TxXCpiVAwkmFyGUPuuTSKE41oU1x3RZb5hqpnT
         QFt4B+L3bnJica6nFb72Pk3YIMRD1wagbBBDApcih0RYWmbLmXC+bUOHasnarIcN+RKN
         ICpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oMTPpP5aw7XAf95XQFpUJMhifI3YTizyNakuDxtZv+U=;
        b=QjhUVFaFLZ+MX0O+Kp9c7u4tu2QDTMhG6XW3BDGOWK87lSXkI5GHU+kcUrdTP0nAsn
         OOtV6gLQlgD335nUtUTOgsBdgTo/ABSFJT+Vsl6zR2zFZXVV+SGDCZewmlqn3K4OOa6K
         WY9Y1TEC6ru4VGmOrEz+CIbe0bcV9rKNwFZzLa7s2KIsiAkFM5gImACcLGGqxFF1vBp2
         S/FmiEsDkMUtnEiQPlp1L7qMTNDnagQLqOn9Q0pEtTDBvNS+V4mRfeRjHB2Kph73GgwP
         fMYE3GJVBVxb8yykzIm9KG4TTbdZC2PLa8213G6gJv7lmiy2wkBjnWHwsVQC6g5n/NfF
         +Mbg==
X-Gm-Message-State: AOAM530MmrZLxQlZnxK4jIEAvO2pLLXv7pHU+jegA/QyWEDcc1Ii428v
	uKi3ciFZ2260n7jTk8Fu/CzhWaK6i1y8CQ==
X-Google-Smtp-Source: ABdhPJx6/FdwsWab1z2QslIikx7ck0OR84iikIs6c7aERYx1RNfN1ydL1oa/DNbRCjYo9p5LpvIyjw==
X-Received: by 2002:a05:6a00:23c5:: with SMTP id g5mr15495180pfc.160.1600132381030;
        Mon, 14 Sep 2020 18:13:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1759])
        by smtp.gmail.com with ESMTPSA id x192sm11197892pfc.142.2020.09.14.18.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 18:13:00 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] nativesdk: Re-define MACHINE = SDKMACHINE
Date: Mon, 14 Sep 2020 18:12:58 -0700
Message-Id: <20200915011258.2081141-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensures, that change in MACHINE variable does not trigger rebuilds
of nativesdk packages, target machine should not matter for nativesk
packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/nativesdk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 7f2692c51a..bb1dfd84c0 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -10,7 +10,7 @@ LIBCOVERRIDE = ":${NATIVESDKLIBC}"
 CLASSOVERRIDE = "class-nativesdk"
 MACHINEOVERRIDES = ""
 MACHINE_FEATURES = ""
-
+MACHINE = "${SDKMACHINE}"
 MULTILIBS = ""
 
 # we need consistent staging dir whether or not multilib is enabled
-- 
2.28.0

