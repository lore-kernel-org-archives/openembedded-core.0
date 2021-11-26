Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2547CC433F5
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 16:18:33 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.25811.1637943511956313009
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 08:18:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c34Z5XUD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id i5so19747231wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 08:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FBDGhuHFRADsZEBdjrgkxuEf/sZIz4Z8JJ7lZ/dhkoI=;
        b=c34Z5XUDNhIs3qwrpLolxG0nIetCY68YBbv2bDBI511hUC9k5EAfdl3wVVja6HFK+Z
         fBLiySXpSSuSZpzd8kGpe9a08KbC4gTBLeZtv5ILjT/95uUXmf+lN9mlNYZpQxD+5qyc
         PvKjSQ1+k7t5oEMNcQ3YdMOD//Q20zTn3nYc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FBDGhuHFRADsZEBdjrgkxuEf/sZIz4Z8JJ7lZ/dhkoI=;
        b=tq7EUBZJQD19H3MPvA8Y5dLsfb64DUGY2BX3xFNhGAh+RU0PI6DPYmSEj1QiEuITq2
         xx10xRWgmoPg2mqYR7fcjZjyaVn/hqu3owR+YPjR2xC+30W+pUNmA1QKzzJqG9TLtol7
         E/Hyk6JT/ETrfmEtwf9ET8Q/coAxkYCTfeBHbynJY8dHdWjwFd1HmteRVDQzF+suO7ze
         TRMqz3VOMvrvc2Ajg9ikXDcxTvsIxX8h8EnYjJTUHm2c8LZq4/VUWeDl9RBiVMM7jWZv
         pRKwt7on7d+3pI6qZSYlAioeDfE3XJO72wyAPnTmnu4FBZ7dgP7cm8p5LbuMP9KZBrzs
         hCIw==
X-Gm-Message-State: AOAM5325dfbhRGfBqxaDNTnjt9K3CQ8fmeIcgchm4jXgmRJSJMqNJ7hb
	+YgnU8OWzNbHFAqwu2BXCWRjxWW+37RFRw==
X-Google-Smtp-Source: 
 ABdhPJxYG5KoDAlP/MN2Dmj1YCFUjIKnDpE3LqjZC43WYzsOgbJPA5WbbcqXndB7WzFgQnPXvTrtJQ==
X-Received: by 2002:a5d:468f:: with SMTP id
 u15mr15071660wrq.171.1637943510229;
        Fri, 26 Nov 2021 08:18:30 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f21b:9c01:debb:ef34])
        by smtp.gmail.com with ESMTPSA id
 f13sm7853640wmq.29.2021.11.26.08.18.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:18:29 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] oeqa/utils/dump: Fix typo
Date: Fri, 26 Nov 2021 16:18:27 +0000
Message-Id: <20211126161828.166193-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211126161828.166193-1-richard.purdie@linuxfoundation.org>
References: <20211126161828.166193-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 16:18:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158836

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/dump.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index bb067f48462..dc8757807e7 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -134,4 +134,4 @@ class MonitorDumper(BaseDumper):
                     output = self.runner.run_monitor(cmd_name)
                 self._write_dump(cmd_name, output)
             except Exception as e:
-                print("Failed to dump QMP CMD: %s with\nExecption: %s" % (cmd_name, e))
+                print("Failed to dump QMP CMD: %s with\nException: %s" % (cmd_name, e))
-- 
2.32.0


