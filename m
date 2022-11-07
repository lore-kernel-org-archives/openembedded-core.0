Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7978C4321E
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:37:10 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.95.1667835428798989482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=XlBY0LbU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id r18so10754284pgr.12
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B58JzzQ9NL+YaTWMoy5VTd83QDarkuXZJn8ocV4v7z8=;
        b=XlBY0LbUxxhFd5n+DEWOtIMglHbACdnBdOkjwX/yxyD2XSqa0C7JHTUymG2UU5gzb7
         pWW/UCLKcEQWKjmhmOXEQ/gqxCoy/GHiTtyMvc8n+1qasu5dA3yAs7wsHAIi6URk71Ih
         vR6ZIFzhoZ7jcAjH42GCosQShdDk7xQ7F3kR+wGHHdM0yWPwuAikc4Wzz84pwoySn669
         aaZaQoFmGewQnP2krEb38M81YoivS0TSBMz9k/0dPhJrmGD6m6r0wXtcbTDCObdcbph8
         N8Lx+I13afLp0nhmXUIVXuTvroz5u2k6DCul+8Ik6rA0ZX95w7OUOs8+9IOTtnBzfgBZ
         Gl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B58JzzQ9NL+YaTWMoy5VTd83QDarkuXZJn8ocV4v7z8=;
        b=1AB2AG5kmFKSZqTW8OPl0vT/tYgCIM+mAfSs5eLkDOe9pE0d1CDX+UBormd9BYkaPJ
         jskpF/YX1pV12tTGrdJU2CsTZg+uNcDXaStSIBkCgMKrqmSH6MdslCe/31AOeJdmRgVI
         FY9T2wir6X1KTBokhg7crdmeMq/rMS7PRGmZiWWHPUMaoQUbtqn4r8XjxbIqm1EeFvGj
         Btd6nHyB4lp8ouFrd2IYNuGUr7ec23SI1JRCcLSe78YRredfJW32NrkfL4u4SpPDvBrH
         CXJY2bwXuXdzCx+waKnUVdtqizlikQs+ZzfbzFoFlNjg9kVa4lQEO7NL8YRQyflsw/RU
         Q6Vw==
X-Gm-Message-State: ACrzQf37i1ZaPQvdKDEcp9apSKqWXlXxPqX/n4YhszZQFPwDrwZIyJwg
	QW691yNjaFI2/AQeUwA4WADKNOT8J7HOYaDQ
X-Google-Smtp-Source: AMsMyM5ifA6yzGoM/YIzmbqqEXrJh07rr9JuuUdXhmKnP8f0QCtXkE7O6H9z9lr4x8C5tCZvkM9Z8A==
X-Received: by 2002:a63:ff10:0:b0:46f:efa0:2824 with SMTP id k16-20020a63ff10000000b0046fefa02824mr27964417pgi.460.1667835427844;
        Mon, 07 Nov 2022 07:37:07 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/25] lttng-ust: upgrade 2.13.3 -> 2.13.4
Date: Mon,  7 Nov 2022 05:36:26 -1000
Message-Id: <552c17a4c4a9f4efad3d113fe069b2624bcc73b3.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172906

From: wangmy <wangmy@fujitsu.com>

Bug fix release

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0be632451f4e9a4a6a08d051e6f493715658c23b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lttng/{lttng-ust_2.13.3.bb => lttng-ust_2.13.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.3.bb => lttng-ust_2.13.4.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.3.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.4.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.3.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.4.bb
index cc88bf5b11..56200ac3e1 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.4.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-Makefile.am-update-rpath-link.patch \
            "
 
-SRC_URI[sha256sum] = "2cc42f51145050430ac4ab72b32d95fd78d5566ccbe44e14a8fcdd23c0ed8f6f"
+SRC_URI[sha256sum] = "698f82ec5dc56e981c0bb08c46ebabaf31c60e877c2e365b9fd6d3a9fff8b398"
 
 CVE_PRODUCT = "ust"
 
-- 
2.25.1


