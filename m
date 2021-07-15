Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.62.1626378003274848653
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 12:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iG+CCglI;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id a23-20020a05600c2257b0290236ec98bebaso1921011wmm.1
        for <Openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 12:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FIAy+YKj/LxATTUVTQLj1bzHaPd2wXIcZodejctvdvw=;
        b=iG+CCglI6aecp8KAhbuAuxlyHeuRgE8RnQ58IVTTbdysEY5AyDngDYCv7oMiePpxuO
         lUMK80SQrjaG6TEfTaAWZNGvHQWhG/8B9eMtjDJi+hgOqRV1cmhYKiOFMx010rnBHA28
         0aC0IFUifAfYUsQ9wUPEPP0MDed3YCGo/yhNRKBNtTDqZqh94KoNYK5Z9RUNm2LW6lQD
         u3yqrlxE1SFpR6kv4owp0xZ7drrDD9wWpNZXh24OW689jBzFhXlv//rprOsjpzwQSShA
         NhAwpG2PtlMVr92hNqm+Z3ZZiMt57ItfbN4nriK708vKQCpv0w6iO4TTNzpVzvKvGQao
         5FMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FIAy+YKj/LxATTUVTQLj1bzHaPd2wXIcZodejctvdvw=;
        b=gKdxzU0T21qZQWOioztlLStzx4P0vj9bJPYCXKw56jTah87wQuU3MPeKYpVrPQByGA
         IzLlHTcjb72jKg381opWFT6087cC3PtZKmJlZFiGFMJTgZHO4gFryWjTe4VrFa2MBWtj
         ZTB00/3N7WLNnMLCcdcoFVxjrUSCZZXpwafbmRiiCmNXv1mOkG0ZyvMOOBqRk1FFGEDm
         Buq9yLpClNY/QXPIwoUJmkaGwcHupkBAw14hSluapbAgRivKTBS+yBXgHnF9QXjjOeme
         cT5eezN2q0biqf1d26g1n3/DiJLY4SynG1TCtLrjDla5wB1Tp8t2sFk0U6EgksonmOVy
         xbzg==
X-Gm-Message-State: AOAM530G+oXpsnfqo2TjwJV4E9NuBe0EYTvrsHCU45mqUFnSgBME1Kbv
	j32W04BBFIkAQc1ZRUNdwBN+pATxPm9cUA==
X-Google-Smtp-Source: ABdhPJwEFbZ+gjufaZsqlMkUlTy824ATPxkHkM3ogHpOcdudyC1b/vqnWFUJoVG3d2Ftr8odDIx1jQ==
X-Received: by 2002:a1c:5985:: with SMTP id n127mr6271208wmb.75.1626378001506;
        Thu, 15 Jul 2021 12:40:01 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([194.99.105.68])
        by smtp.gmail.com with ESMTPSA id p11sm7533809wrw.53.2021.07.15.12.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:40:01 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v3 5/8] systemd-machine-units: add bbappend for meta-selftest
Date: Thu, 15 Jul 2021 21:39:30 +0200
Message-Id: <20210715193933.66120-5-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210715193933.66120-1-uvv.mail@gmail.com>
References: <20210715193933.66120-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 .../systemd-machine-units/systemd-machine-units_%.bbappend      | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-selftest/recipes-test/systemd-machine-units/systemd-machine-units_%.bbappend

diff --git a/meta-selftest/recipes-test/systemd-machine-units/systemd-machine-units_%.bbappend b/meta-selftest/recipes-test/systemd-machine-units/systemd-machine-units_%.bbappend
new file mode 100644
index 0000000000..205720982c
--- /dev/null
+++ b/meta-selftest/recipes-test/systemd-machine-units/systemd-machine-units_%.bbappend
@@ -0,0 +1,2 @@
+# This bbappend is used to alter the recipe using the test_recipe.inc file created by tests.
+include test_recipe.inc
-- 
2.28.0

