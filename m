Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F0EC47077
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 04:31:14 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.22780.1704169873068030213
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 20:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XCPeeJt7;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7815ba075f9so395215485a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 20:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704169872; x=1704774672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyRTkTMhgGr9EulyDHTJxSp0ludGqOlyiGp7RblLRwM=;
        b=XCPeeJt7yH5GNE7RTxCSP5E9Rm3kXqqfO4FeEfRyzacCLpXU6H1cRWc8FVIsTuPUH6
         UriozOPOaGDrRjF8nzCkuhZj7KcrG5uVcWx9JgSKQl0JaboteShD4t194+aEDuJUtPfV
         9oUfQnc2+JHHXPW0cllfCQGDU/nCzLT4MH7t/4VfRqOaFNIqRHnuWuaBDp69gvpjBpab
         eWIFUpzUExCbT54pjDEOHl6ozmrn9i9nl0iz4PhuEOD9bUP+HypuDGhGvQQS7k8UuuQZ
         /dd8dF9fv/zIMXK37AdM1hGffs9m19lUa8lBNpy6y6vaAX1dXAeyQGxshFXokfz3IvJ5
         t/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704169872; x=1704774672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyRTkTMhgGr9EulyDHTJxSp0ludGqOlyiGp7RblLRwM=;
        b=UFDs6DD4MN4ql52SiMfZwW0ymk2gqjj6JRXl/rqgGCHBcub399FQD2xGEmcrdnm29k
         94mvZpKYnfX1RVoyEHo95oVFpv0SYTCB6x0yRJ0RJLEwvWXfY3BtsMXG2i3CFFFsRpF1
         bsp201QTCrn7Fk5lNSngRJofglRC37BhiVp+GDgzKjfOIUT3/X6O9RpFeD1hrYUBNjEy
         hBPgno/+K3qJApJdTCeHxe3dB89pb/cs85Eli3TJ90d/vIO930EtTo6TzoF7nmOfv8lN
         eTBKhQ1Sm0GuSkttJjPzTc6M8+IPtYp8+a2d9Y0XFt6RQczyraFNQ55EL2IXmjRO8XUh
         D1yg==
X-Gm-Message-State: AOJu0YxeWq5YlfhBF19gE3TdkjsGr5fbNUwX4scQ2mPeWHvTvihTCJa9
	Fgwdwe71TKRPX5Ofg7AtActkwrht7eBmzUAUkz0=
X-Google-Smtp-Source: AGHT+IHIhDVrAk0WK/dsNYB1gefJX/jg5MobujUjH/JkhnLmc6gMvMwc2fWLdLxfGEk+XH8crHc09A==
X-Received: by 2002:a05:620a:8009:b0:781:dbf7:968b with SMTP id ee9-20020a05620a800900b00781dbf7968bmr675837qkb.41.1704169872114;
        Mon, 01 Jan 2024 20:31:12 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t1-20020a05620a004100b00781df3924f3sm39045qkt.129.2024.01.01.20.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 20:31:11 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-libc-headers: update to v6.6-lts
Date: Mon,  1 Jan 2024 23:31:03 -0500
Message-Id: <2941b94ec0c2eeb6ab8921b65507baf4e61c0a4c.1704169585.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704169585.git.bruce.ashfield@gmail.com>
References: <cover.1704169585.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 04:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193197

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc                     | 2 +-
 .../{linux-libc-headers_6.5.bb => linux-libc-headers_6.6.bb}    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.5.bb => linux-libc-headers_6.6.bb} (83%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 6f8f8a7888..3720a4c5b8 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.41%"
 GDBVERSION ?= "14.%"
 GLIBCVERSION ?= "2.38%"
-LINUXLIBCVERSION ?= "6.5%"
+LINUXLIBCVERSION ?= "6.6%"
 QEMUVERSION ?= "8.1%"
 GOVERSION ?= "1.20%"
 LLVMVERSION ?= "17.%"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb
similarity index 83%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb
index fa902741f2..d68de6ec7e 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb
@@ -12,6 +12,6 @@ SRC_URI += "\
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-SRC_URI[sha256sum] = "7a574bbc20802ea76b52ca7faf07267f72045e861b18915c5272a98c27abf884"
+SRC_URI[sha256sum] = "d926a06c63dd8ac7df3f86ee1ffc2ce2a3b81a2d168484e76b5b389aba8e56d0"
 
 
-- 
2.39.2


