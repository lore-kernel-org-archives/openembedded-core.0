Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.17105.1621247751813644923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 03:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pkz7twmd;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id x188so4637303pfd.7
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 03:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0+QZehCLD0cxturYQTyBuZnGddCpLtbbc5aH3vmJTgc=;
        b=Pkz7twmdUq1YTwwKd+PPH3CAIQRnlWhfZtqJMce9W063xZ4fRIsiBpHKZF7I2PCznO
         9824ZySL4bkkRDZVJNqWuGHrDujD5/WVd7w247iqtF3U4CauW2cyOkZdRrIQP+zbIRj2
         10jm5kl68xan9RtUED6HS3o+pN/PEg3NWiRVgmAz3ra5RR5BRXbFH/y9HD/K68cwVZ0i
         gRRlIiZ/QAtDQxIQRr5uts1cHLoTJlJFFcFbl3LKtKbpbwoauEglDVqfUCOVlMqiGcp2
         TrM7tvNwmzLhUfr0TAmyyrqIT8LlkV8qwY7IS2GmuXMeOqzl+bWOXLcq7PHqo3AZmpDZ
         /bjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0+QZehCLD0cxturYQTyBuZnGddCpLtbbc5aH3vmJTgc=;
        b=lJhL7qCITb9+8nRTi9YOcvcMwfukDagrM7/UDJzRPc34XkzM0vnIBOfe3tEVjH1NXN
         o44+is9DX3LZ26nTCcYfjJeO1louiEXhWKjK3xXT0HbdHAwqUKXwa6h7VkbCiLbmf0RI
         9swA3jKk8Fm7qYJoUUaBc3MF9U8hpS/W9dt46S2KLnKSBYRY9k7WgbnNMYOOp25xb4Zg
         K3vtI7uillBmC1vxIOIK0p1Tiqj9R0d6NCAz1C7hNS1uRtuMxJt9rAIVNkhq8aAgk/vq
         CvE9Pt7gKp9gB5YpBTGv86kcVf6D8QY+QSZCm/cL4sIzHhhiCAKBEVSRRU+VkHpKV626
         m3Lg==
X-Gm-Message-State: AOAM531Pmxmw5a6Rh74iwmSpFWoekKD52S73OXz5H9eTNim50No1bfxC
	bEO9Y7+OG6XXuOzHCNjbFOS048wuK97/iz+L
X-Google-Smtp-Source: ABdhPJxadvFhqCgU16cwDY0W0K3wnnLIJusBPkNqpmbXLcpLpTppfXDCqGiEm/LYPfMTbQQjFXbJmA==
X-Received: by 2002:a63:7049:: with SMTP id a9mr62026856pgn.181.1621247750795;
        Mon, 17 May 2021 03:35:50 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id m20sm14903365pjq.40.2021.05.17.03.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 03:35:50 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Cc: kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	alex.kanavin@gmail.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v2 2/7] Add rust testsuite for 1.46.0
Date: Mon, 17 May 2021 03:35:23 -0700
Message-Id: <20210517103528.24434-2-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517103528.24434-1-vinay.m.engg@gmail.com>
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com>

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb

diff --git a/meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb b/meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb
new file mode 100644
index 0000000000..ad758b71f4
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb
@@ -0,0 +1,3 @@
+require rust-testsuite.inc
+require rust-source-${PV}.inc
+require rust-snapshot-${PV}.inc
-- 
2.17.1

