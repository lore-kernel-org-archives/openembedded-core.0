Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.19664.1622285893928226594
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 03:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H0xOyaky;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id o21so6829894iow.13
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 03:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0+QZehCLD0cxturYQTyBuZnGddCpLtbbc5aH3vmJTgc=;
        b=H0xOyakyDFqeePehaHnGIXlHq0n6NUFWV/H7NFjAGG3xbYdOhp+V9FULvFVNqF9eQR
         /qex/wWo5kq/A+wHKsx7Bpq1pi5Ido+V3Zf1PLeVdjANY8eXp3QNHndDz31Aso2DoXpF
         1K086YzyU5p+OdAkh/QwjU1cVnlWV2bx7vhJkohqUtmMLziGNP7Q3y5eidddlxfGQFD/
         dtZaQk7QUF4nW7oZuYE/3cvyJ2g8bi1rcShvKuahbCS4grhGQB0N8uNVcqIwGgU6WdIW
         J91G5pmGQHvi4oFfauxNwZL0LSFp12cb4M7rJnvF3YU4arOwU9YAqDsk8R8+54xK9LDm
         qt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0+QZehCLD0cxturYQTyBuZnGddCpLtbbc5aH3vmJTgc=;
        b=UQWCZCdZNyWgWuZgFukvYQ1VSt//GW9e+Eqon9h2Q0D/GRMZQXiFp95+ndL1by00Ah
         XFceRhMBF8sU+EcJB12LC0D30emqgwhG3CZ3ZTLbqrTGSNqJKMqu32d9g5kfIwIVWjzM
         IlVo+gNQIManFc0LEOG6WO0291hjD6K4hdsPulRMyh0OHuu3xPL78JhMcqO2Cz0gHLYX
         NVOIVToN+XAnzr3W1EZJT7BO2eF3Z0MHtcPzgfBT2NMKhrT7ONsSjWr9Z0h4s2eqViIG
         +XkrYZPqslkPMLwLA5FHe3JDcfBBNXCreciRP3ize1tWqs9CqY4MXprFeMim2Dph96Ep
         fxNw==
X-Gm-Message-State: AOAM5314SiTF7jeM+Vv06JSI74S1KV8JDZgodIOVguV23IJUELyHsVGe
	HjEpZH2LFhOPrV0Np4vFvjoad+F2hGafYLsG
X-Google-Smtp-Source: ABdhPJxKqm+POJVjEV6REsfuZ22NGRnmBpVT15hR17Xwvvzn0Jb3mclMxlzFY0wUskSdcJ5fEisQ7Q==
X-Received: by 2002:a05:6638:21a:: with SMTP id e26mr12613775jaq.58.1622285893030;
        Sat, 29 May 2021 03:58:13 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id o5sm4441174ilm.78.2021.05.29.03.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 03:58:12 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v8 2/5] Add rust testsuite for 1.46.0
Date: Sat, 29 May 2021 03:57:46 -0700
Message-Id: <20210529105749.3017489-2-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210529105749.3017489-1-vinay.m.engg@gmail.com>
References: <CANNYZj8i1D15ePeor45k2Mpec3vq7y6PSU8+ynLvSzRdnfL1Hg@mail.gmail.com>
 <20210529105749.3017489-1-vinay.m.engg@gmail.com>

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

