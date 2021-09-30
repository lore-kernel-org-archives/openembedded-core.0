Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95918C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 07:27:23 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.9260.1632986842664461355
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 00:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mZ2u0Ttw;
 spf=pass (domain: gmail.com, ip: 209.85.166.44,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id b10so6340713ioq.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 00:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UvDmtBZquaOyzuIgbiMNzYulocJxl6vKSRXGTxIpL+k=;
        b=mZ2u0TtwaYYzKfk041COo+t0bKP7JXCf7r/gVb4x1dNzi/Qs2HrvP1n4ubuLiNR7Pj
         0II4uv6WD43tYOUtLgT89oNwRBnIZL9r2X4DrEK4J9JczE0JOHrftivfEZuMl2Aaol5k
         6J5H9SvdrltTZAZlv6OZXjsoT+N0mcAoSvrbf2YKNONginZ7P329BItyqaadgX0xg7H/
         GE3PQb1aBZHSeKqIdTFbkunBD/evLwgLgvwNTv9emMr6YJsUVP0dq1MJsJ3lkkLAqbYn
         1WenAOIicgtvQU+/Ce6HgdbdCeUZaNLpsVBdYvXPoY4aS6oMgsv0zSnhhO7QjxlF6XWr
         ly0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UvDmtBZquaOyzuIgbiMNzYulocJxl6vKSRXGTxIpL+k=;
        b=l6AmtjFjZmpw9tQIEsOYnkyVsncrd1oThTprvVMgKtaa9ZJhaxdix8bfogL1jkp6r/
         vIUOBTvwEZEu/0rN9XTFxSs1YDbMjGEBxNkOzcEd0AVFr7ChJeZOZCI0soWcO7l02BSU
         5RILIbfaPjG6wwLsdxVwD/KxH+Yy6TKLC9hnmvYROWXB8ITnln6PCkiAHcQjN9xZiO0R
         xMnCXKmTcFhKH1xJDw/Qn6NXDzPaL7T+p2hTV+tTSzzYz020sJ0t9Uae5ThIS6H7hdSq
         gcyxAlTGGGsd5TLug9X4/nmkTCiSjJv8ZiVsiJvKFgIk0Nup6sOJ6zWrtxUC1bhDei4W
         Ykug==
X-Gm-Message-State: AOAM53176FDvCoo5InXyK3yRzRAo8riI50BPBhU7b/ZGVYcwbjZiHvLU
	VFpQgZ6Z/yMp/2uypOXQnfqwGHqDF5fHhA==
X-Google-Smtp-Source: 
 ABdhPJyEzf+4siOexPkCrvgVpjfXtQkmsStGnSBExw3ail6WeMWF79xo584UQIzRgdWYcFloeMbUxg==
X-Received: by 2002:a05:6638:42:: with SMTP id
 a2mr3476444jap.69.1632986841671;
        Thu, 30 Sep 2021 00:27:21 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 z10sm1177917iot.30.2021.09.30.00.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 00:27:21 -0700 (PDT)
From: Pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alexandre.belloni@bootlin.com
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	alex.kanavin@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.m.engg@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [PATCH v3] Re: [OE-core] [PATCH v2 2/3] Rust cross testing file
Date: Thu, 30 Sep 2021 00:27:10 -0700
Message-Id: <20210930072710.196593-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <YVTwuSLx+HyyIDkV@piout.net>
References: <YVTwuSLx+HyyIDkV@piout.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 07:27:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156484

The attached patch sets "ninja = false" dependency during rust-testsuite
build and fixes the error.

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/rust/rust-testsuite.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust-testsuite.inc b/meta/recipes-devtools/rust/rust-testsuite.inc
index 861c4ff504..0d399bd9e4 100644
--- a/meta/recipes-devtools/rust/rust-testsuite.inc
+++ b/meta/recipes-devtools/rust/rust-testsuite.inc
@@ -94,6 +94,7 @@ python do_configure() {
     # [llvm]
     config.add_section("llvm")
     config.set("llvm", "targets", e("ARM;AArch64;Mips;PowerPC;RISCV;X86"))
+    config.set("llvm", "ninja", e(False))
 
     # [rust]
     config.add_section("rust")
-- 
2.31.1


