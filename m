Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web09.32564.1620657113221742581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=f+vbupbW;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id n184so15915654oia.12
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7zIc0MLY45y2jm0R646NCfSO2Nptb3Nw2RFS+eVbOLQ=;
        b=f+vbupbWc0PpIb6NvqshSL2zoGnoFbkTIaMnB79MkbvQOSqCpVEAAYN6rtnpvi5KW1
         FdO/gfDefZ3Jy4aaCg+KZxnSfoHTBr4cRnoHxUwtMD2HKRhZyu3eSfHXtzZtkqCd9tv9
         UITMt6C8Z/l0DgyPPxMM/8JH6364s765/Y+RQS7gKY+eZwK01YY76AsDg1EZqJhhNzOS
         tBpsSDB4ayCaPRn1sYajB96VaYbvQ2wIu265xojATGkNCZ7/RiX14eKfwDZzsfk/SccL
         jSchL3PcJ3FTqMoT2SR7b6bfOk5kK0nTgD0BMFc50bM4VVlGzpGFuBkOdcdrWRUgroHx
         plSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7zIc0MLY45y2jm0R646NCfSO2Nptb3Nw2RFS+eVbOLQ=;
        b=mtfFKgK/DfYVXvZH12NUMDA3Pbko+dAqmzZn28UBBeMDpMZvMvTJPB1SrDfErNH2e4
         AZgRomgtIvp9ZCdGEMyTF9d8KwiTHRPO2E6FgfZbwP1FXZq9cldQoCAuyzYAnN9KOyxt
         Ti4zxRiP9QeplJABor9OsTGYMJ/XPV4dHsaOY6KhNPU1b52g8Q4CrJp8QN+YdHs0FXvD
         pW3aKIkopOt0rRJZNZisW35URPosMx/A8RW0aoPqsKKWHtftcIKH8hz6JwVLuQXb2vBm
         QXTDNZkfRnyWmt5yyPMkBEsklFlOB/Bhy8ruqZrNJQBqIJybUh7zC/sE63SAcogJj87g
         t0Uw==
X-Gm-Message-State: AOAM530fzjKLRk6DcbYunZWT1697ilTgdt8zZWoKHDiOJndKn2XM/0AY
	Kf/rx6A+PGcE0UmMCl7aM9pjgx5+iXt9V+fvB6w=
X-Google-Smtp-Source: ABdhPJw4wCLfRpVlJzC+Y7zCTRFQ5fA1uYwb+V4VrbUpqDXUnGHE6IlgAV1XTFvO+DzpU+3fYtE/zg==
X-Received: by 2002:aca:f5c5:: with SMTP id t188mr18090559oih.25.1620657112119;
        Mon, 10 May 2021 07:31:52 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.31.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:31:51 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/25] reproducible.py: add quilt-ptest and valgrind-ptest
Date: Mon, 10 May 2021 04:29:07 -1000
Message-Id: <5b2ad70cd82c3b812652886ee4bf29f88dcac42c.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both don't seem to be reproducible with fedora 33

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index f5e3bff5a4..0e44ce4dbf 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -54,12 +54,14 @@ exclude_packages = [
 	'piglit',
 	'pybootchartgui',
 	'qemu',
+	'quilt-ptest',
 	"rpm",
 	'rsync',
 	'ruby',
 	'stress-ng',
 	'systemd-bootchart',
 	'systemtap',
+	'valgrind-ptest',
 	'vim',
 	'webkitgtk',
 	]
-- 
2.25.1

