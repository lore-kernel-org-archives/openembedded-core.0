Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web12.10297.1622218158066317123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 09:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vWmESR94;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id o21so4666543iow.13
        for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 09:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0+QZehCLD0cxturYQTyBuZnGddCpLtbbc5aH3vmJTgc=;
        b=vWmESR94jPjhh2TNuk3mQrBjIlsHlG0tu/0BpQKW7mGTBb0a6Vr1/LoQDFM4mI/Vr+
         kZAPV1E/h/tCPHTQMAMMyVHXbQDYkPrsoOQYvDCkvhR5eLsL6VY9Kjm3Hx+TKOreEf6K
         fV4hKmHhMD2ssmQQ6MunzZVZ4SxpW+GHj06Fkl7cSHtVYZ9vMZKdw262QmcaCqk6uUZX
         rnhZtwV7CJpAOEP7u5OtmLsOz+QnYX9nLCqHhvKUaFmTXlBS5ofddqLBe+w07hDVTey3
         dvN2IImF2f8Y8TA+tMjfityU4SpxxE9C1wmqtcQwc7sBSp1o22h8YsfR3w8v9h3Gsqxt
         orFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0+QZehCLD0cxturYQTyBuZnGddCpLtbbc5aH3vmJTgc=;
        b=E8WaR4ozIjjlzMPZrjSPlCfva1DoaMBRer7HOKoJMJ4VHWeJIDNephe/S7ItNCDXAJ
         1cdp2e3ZMJJEShh3CwzmERLQCCEdcm1T3z7Hj5VMC+XUkJTT0lXu6BgOiAVT8W4WTSS0
         Tt5AC1qcVmeM2uDO/v6z9BP+ebTatCb9q52zkmULKIuMw3F5vPEFgJHIUsyKt94tGUFl
         I9Tm5nXK4yYA8uST8NeelN4wtKIjyFKAH/ef24bxQ7ZvUs4BC+J/cfuj8ifbXXgpbGWs
         eECc2r3h95OSoA8WPyEVSnzgxjQC+0jOK226geUykExFJgiqtwBmoP1N2Yz5AiXrd3aP
         JtRA==
X-Gm-Message-State: AOAM530FOX5bfcBNzXnmeIqWM9MqTLYokunzuAvursVXPwWpqE8ql8OZ
	fDckjuZxSwfh/8d8H/sK1uPrgWinYrLMqz3E
X-Google-Smtp-Source: ABdhPJxlz10ReSkEdThfQ1ZMKQVAem6oFT/KLhZmXdh4mQxFgeSGHb6/OCP2lBqoyYokn0DHpYqrKQ==
X-Received: by 2002:a6b:f311:: with SMTP id m17mr7523087ioh.162.1622218157131;
        Fri, 28 May 2021 09:09:17 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id l21sm2975022iol.22.2021.05.28.09.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 09:09:16 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v7 2/5] rust-testsuite_1.46.0.bb
Date: Fri, 28 May 2021 09:09:05 -0700
Message-Id: <20210528160908.394290-2-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210528160908.394290-1-vinay.m.engg@gmail.com>
References: <CANNYZj_RNDuTY2+dMuQBAByh_01Yj7_nWwwv2iO_sU-r+qvw_Q@mail.gmail.com>
 <20210528160908.394290-1-vinay.m.engg@gmail.com>

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

