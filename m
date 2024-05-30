Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0453C27C44
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 21:44:43 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.3689.1717105478445474497
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 14:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=it1XNJ27;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-62a08099115so13024727b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 14:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717105477; x=1717710277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0SJyMPX+bPgZTLBE5zatAzJGNiAcLhOmO4gyipBw2c=;
        b=it1XNJ27RP+jqAETpSre31bUOPxALxs38YItxu8W9A12CygOz5BmQzKwLm7Fz9nVM/
         M8t5LzhFYad+DQMyJHYiZXet1hXCKJc9VCnL6sKS6Dqyd2hElMnOL3cD8FwyIhlJaXJb
         m0p/q+0XvyG/q7wufsjNtbkL9Zm4BHlSxznNe1Wsv4LCVfHqx9gTakYKlfB8ChOeh4Do
         DaA6dVPWVbMHHq7veWVls0poLBgjiN7lhtJre0U5ABwVTFHlMhpBKZoAQi7pXkamolT7
         wh2iCBR3tzHNzrNe/t5RexcvKrOd8JdmO0mxiZnWfJOOVyRUzXV83KRNSNmL5evI1t7N
         xhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717105477; x=1717710277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0SJyMPX+bPgZTLBE5zatAzJGNiAcLhOmO4gyipBw2c=;
        b=RsdDTq6yEH68ORO8mWSjfuSJrMTLrwAAT4C4UjHWLARPpil2SQKzhYFbHkhlM9tF3L
         twSlZOU6HmNLtOTdSZpfByTM+lUPnz54Cux35Au00K38uGFdj8TMStIlFqac7NUo3qt8
         ew6k03a3ANZSPxbxBKFI0mCxdZjey0PhnN3ZeewyEh7d+5egiWjmrQi99sEmnQuZo8zl
         j30LZCdDJVcwh9+PTCervUPvwErX+6p5IJlFw9UmtPObctgAcpTQtBLNH2PyG7twwpG8
         LQFLvs9m0ru9p59A6xdcAeggF+196saL4MYnOxKV8hNFXfQePwatrtefKsMzZL+/Z1Uk
         Cp3A==
X-Gm-Message-State: AOJu0Ywgx938xFDa3pQYcqKkPhZ+lQKroEhKHM+x+9IHXhqc5jQOMX8O
	HsGVjA0yc3z65575PFobRCE7ENfhHEbPdbmiq3Q49YYoqMbWgo6gX+biQU4l
X-Google-Smtp-Source: AGHT+IGkDgYKWj8M55jZD/EkbjnjOZWtndwNoRdSz8TePJGJnr6lEz05V6M3vXKNGc8z+ARY4uX7gQ==
X-Received: by 2002:a81:7384:0:b0:61a:ae79:816a with SMTP id 00721157ae682-62c6bc5cc16mr34228367b3.31.1717105477523;
        Thu, 30 May 2024 14:44:37 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794f2f120f5sm14642185a.36.2024.05.30.14.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 14:44:36 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-libc-headers: bump to v6.9
Date: Thu, 30 May 2024 17:44:30 -0400
Message-Id: <c44b4254b0cbc679d548171abbc415a29e4e2b96.1717105222.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717105222.git.bruce.ashfield@gmail.com>
References: <cover.1717105222.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 21:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200049

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc                     | 2 +-
 .../{linux-libc-headers_6.6.bb => linux-libc-headers_6.9.bb}    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.6.bb => linux-libc-headers_6.9.bb} (83%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 23d5aa6de8..950f29134d 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.42%"
 GDBVERSION ?= "14.%"
 GLIBCVERSION ?= "2.39%"
-LINUXLIBCVERSION ?= "6.6%"
+LINUXLIBCVERSION ?= "6.9%"
 QEMUVERSION ?= "8.2%"
 GOVERSION ?= "1.22%"
 RUSTVERSION ?= "1.75%"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb
similarity index 83%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb
index d68de6ec7e..3dd4d547d5 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb
@@ -12,6 +12,6 @@ SRC_URI += "\
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-SRC_URI[sha256sum] = "d926a06c63dd8ac7df3f86ee1ffc2ce2a3b81a2d168484e76b5b389aba8e56d0"
+SRC_URI[sha256sum] = "24fa01fb989c7a3e28453f117799168713766e119c5381dac30115f18f268149"
 
 
-- 
2.39.2


