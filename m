Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web12.4075.1622103095913698256
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 01:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V1UjHzOo;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id j30so3369290ila.5
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0+QZehCLD0cxturYQTyBuZnGddCpLtbbc5aH3vmJTgc=;
        b=V1UjHzOo84bPgg/5Y34sF3Mry3DX3gALPWjL+sHo2FHKhHebVxVEJetmTVaTukWiPb
         W4/EaQjjTGEvuYlyvSGvBnwQ+ApsS7rYSBdx4S5lGvIaNCspK3t6ShQ2AllkkR9EnhcA
         dbQvIe8HF1PLizLNTFjj3kPsMQ+C6vWb6ueRxQT4LFYbOcq4aLcP94iJ0es7lZbImy4W
         2UZQUrbHc/vdUWq/FI9b61UNvgYVjf4lsFFX9z2LTv+wFXW16xgoQlqI4IYjWW7N9fkb
         xE6JUs14QyGdgItgIJ2MzwccY/L+bwGZBkyqQSNpR6e/Af6zYoW9pNy95mUfefCipWoG
         wmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0+QZehCLD0cxturYQTyBuZnGddCpLtbbc5aH3vmJTgc=;
        b=WYicIY5+U84yX7DV3BOo0TW/q9P6v6XRIVu3x9dUAQlwhxkxaxBAf5Hhjs5nYdSxYB
         MDCUZESj4Lxh+9hV94yzQXwpNqAbwDA0fgPYTF1dY4cd0Bq0GvMkqyHqfnX0quYFkO1P
         kN3BjYknxiPYIZHz3ANlGIwaAYmuNQHxpwwtAEnSyCt0j5RzTJxgBF7yKx6On7YOpW9x
         6oWaC5Lqb8wsCKhHfqRky1NKNz9p9+p9h7AKJMDoUG8xsr/Cn3XMTF8AMl9GDfZlALgz
         QSbGpGPgB0wYYVTovggS2MxFJEltgoBPSUQrgU8VmrwcoOBh/yGxw2zjdrwK9+3n5Gf4
         YrWg==
X-Gm-Message-State: AOAM532+m1sfNUPCOROEMhN3ZY/F2UUWjalvslGKKunaiSjXKjfq9BtW
	BCE06v6y6XuVM8IQI7wwjeGvrT7k99tGbBdc
X-Google-Smtp-Source: ABdhPJzfufWPyVOGhQqQeO56qQLVFLeGg0UQgBAKj2+aXctNMJorVcs4KAvXVq/qnjdWEDwBDMJW/g==
X-Received: by 2002:a92:7510:: with SMTP id q16mr1954619ilc.291.1622103094925;
        Thu, 27 May 2021 01:11:34 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id p2sm804981ilp.17.2021.05.27.01.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 01:11:34 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v5 2/5] Add rust testsuite for 1.46.0
Date: Thu, 27 May 2021 01:10:57 -0700
Message-Id: <20210527081100.1213973-2-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210527081100.1213973-1-vinay.m.engg@gmail.com>
References: <CANUMPcVo=iH43q+70zHnsm5ktJR4D4AO+KZEzj8=0AQNaYFv0w@mail.gmail.com>
 <20210527081100.1213973-1-vinay.m.engg@gmail.com>

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

