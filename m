Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7653C433FE
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:18 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.3053.1639000817707700277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lup+eYqE;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id a18so6498095wrn.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tuCYq1mKMjQAoBItvBcUufNiw964pRlo08SVoSK1qCM=;
        b=lup+eYqEGximYNxL0LS6vWBrU+cBvZF0EPA/fQATDTg2yR7KX/p5dYzq6Spv1qc7Ut
         ZsAf6kihYqaCL1DmTb51gEamwIabahFQBelr4+CB7n1oJTKndQExYGNrdI+Y5QgaoB+V
         0nttUSV6ZByz8jNoCorSTyz0ASiD/iiYbiuhmKgVr+u81xxsxJFPkiZJ6z0nrJrhsyqx
         dwoKl3fyu/+vYzQz631oXnnuQPKs1rMai75UzqXzxLhzPTjHVNdwZUICt0lWGjOhBv/p
         uExAqghrI8BWSPZyJ76r8998vVhg9wAUe7GhIICjJylHX8JLKSq36YPQLjMdpr+8ndPn
         nfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tuCYq1mKMjQAoBItvBcUufNiw964pRlo08SVoSK1qCM=;
        b=Ab9pfvYy5cLjHlfl7hGVIq6+GiiPjEhoTS7zumUfqlctSIZpiaB4sInKlXTgtMKSNf
         bnMIlbtAVz0lLkE66ieRV/kcD3Pmzqei4ScLCJ7faWgL33YVPNB5ktKIj2vekS6c7I0O
         /KSjLhtD9R5GLS3rUeTcELpBthA5/zeU+46euwHC5P1G2mXyAOrcx/4B3QjjRBTfr6WA
         +99/4E8rtRKgSzSg9hTPEhCIGRoL+NeYgPHiY8NzJfB6tv9ERsMFZYkWAa09KoovlAUk
         4AAhGiqoJ40SeNlqzSR9tknrgEXwr+314lakWMvcgR3BaTaaIxXSfCdH+UcJ/ltImGrQ
         SFZg==
X-Gm-Message-State: AOAM530hqz/uPX2OUNgwDUV7Z/bRTo5t2LGljTXhKIYIYP78OXCWNztf
	vVT8qcTHRDuRNgMFt1JZOEBKCbS1jAQp/Q==
X-Google-Smtp-Source: 
 ABdhPJzBxqLNXQkvHIIJKvvzckBeEfb0s8BfZGcb8XKvdV/gjgUTyI9KBKNgiUMWTYzhissL6T+usg==
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr1605238wri.446.1639000816378;
        Wed, 08 Dec 2021 14:00:16 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/29] ruby: remove debugging leftover
Date: Wed,  8 Dec 2021 22:59:46 +0100
Message-Id: <20211208215947.1979470-28-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159394

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/ruby/ruby_3.0.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby_3.0.3.bb b/meta/recipes-devtools/ruby/ruby_3.0.3.bb
index 73bea9e089..95feb94dd4 100644
--- a/meta/recipes-devtools/ruby/ruby_3.0.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.0.3.bb
@@ -67,7 +67,6 @@ do_install:append:class-target () {
 }
 
 do_install_ptest () {
-    set -x
     cp -rf ${S}/test ${D}${PTEST_PATH}/
 
     install -D ${S}/tool/test/runner.rb ${D}${PTEST_PATH}/tool/test/runner.rb
-- 
2.20.1


