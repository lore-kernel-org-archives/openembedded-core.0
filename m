Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.61267.1594051902453378766
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QG3AFGdg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d10so3481262pll.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=WjBu7YeoQ9Sj8xwZG40jVPuslYhdr5KSQcAdHFT6qbM=;
        b=QG3AFGdgJZLPchefCtEFEZxIz+D3jKD1o55/0q2e2BhtB125P9Oe2MrzUkhxr8kS4d
         PvLP27EjeZXNBzZ84LKDggsEDhRU61jPKZETUHwtUo4jJxfexZZHC3cxJtgfKr/0OFgl
         cFgVpgdhRKbjtifflmnd8m0BFS73YzgKCByvU6NfLkI6LZR1AeVlipGNN/G6niKFRxob
         9EJnqDfgF+4knmTvI7awUaK7NI4MX8QWEDZ9wlcUA3ITH3u+12ccWO697QWVT6WUg/hN
         QVdZj9KK+zGerGqginnv+ph6H5KTlzMHT5xLgN65g2fkpWIuJSvCGlmNch+WqdeoSqIG
         7SMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=WjBu7YeoQ9Sj8xwZG40jVPuslYhdr5KSQcAdHFT6qbM=;
        b=XxcBpOj4QbZzm4H5qsJQGCPkOv3xsU5WQ7smXIQEY6uF7wbvnQnjYL6b4xS+QgImra
         57L1xhwHUX1hYgeKBPiEmyv85kw1vZ6I7+8IPxVzOqDQ4l4W427UcZaMFe+EkAaLDY2s
         SNGfxyKISIEvFY6Bz4abp/Z7GoAMYjuv6pn+gv0zu5RYHYZCQJdhAeX75GrFvnS0be8F
         68q6P6I+2HShMSB/t8nbdQQSHw68Y/nVgpCo+MOw+CE/ySVvVpSn2/FG/sgS8boye5Eg
         PsYfMFhDpmRzGdn8k+khZ08k6+ae9deWtMfWfrKuxsbHcvsZSyKMwz4/+orQGYWAgxyw
         sDHw==
X-Gm-Message-State: AOAM531vU9y6gaf97gJkYknn9OrOc1U4aZn1BxExHY41Rl8cTinqYBui
	DCem0hegbAxqFvbc3z3y/wvUQ8neIwAFpA==
X-Google-Smtp-Source: ABdhPJxmzWcin3tu/sPTPiYaFxcGACvJJ6mYohPLf8mekbUmghbo2HykvKfzzeRoD4dE0rjvpWp86g==
X-Received: by 2002:a17:902:7b92:: with SMTP id w18mr31507493pll.258.1594051901582;
        Mon, 06 Jul 2020 09:11:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:41 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/25] oescripts.py: fix typo
Date: Mon,  6 Jul 2020 06:10:17 -1000
Message-Id: <d69c7499243e18660542b313c40175d4477c8dc0.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 115d44958806a2c73d0bf140f45c11db462cc7db)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 2f18d8f29c..f697d29b50 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -177,7 +177,7 @@ class OEListPackageconfigTests(OEScriptTests):
 
         self.check_endlines(results, expected_endlines)
 
-    def test_packageconfig_flags_optiins_preferred_only(self):
+    def test_packageconfig_flags_options_preferred_only(self):
         results = runCmd('%s/contrib/list-packageconfig-flags.py -p' % self.scripts_dir)
         expected_endlines = []
         expected_endlines.append("RECIPE NAME                  PACKAGECONFIG FLAGS")
-- 
2.17.1

