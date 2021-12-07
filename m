Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BDAC433FE
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:07:22 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.66655.1638882440515467254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XTA/IGVU;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id v11so29314838wrw.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8KiAinrTJo/WeizngfAqJwQa7ILHMGx8Do9YO4XcmRs=;
        b=XTA/IGVUgBVBhBKPkGiV5wGPawSMru2k0oqqbXSVSzFxIbG5e4Ahw0SGrwvwkpFN4C
         0ysvET6AsR8SnHa965pzCeexHRirbLnyl3DfIkerYF/mxmiqPmVb/G98i09vLLgs1mnt
         Hhkq9ZuOCF/AqFyKF8p1k3rKt6dbqmXjsKYX8i1UTYcFQpE9fR8im4UpsiNpzcnfhbOq
         hp3RlVHC+XYegTTjUUPG+r3bzniVIIsqq4Og7/3IyRhB6p7XfaMZyeKgBAL+y3ZEXFFz
         MQ0gIYtnwzVuGrkJ1SWjtUjn/qPQ8GqNkbIusWk9mkqdM5gTPpjWh4PRW7XcH+QiPUjL
         ixMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8KiAinrTJo/WeizngfAqJwQa7ILHMGx8Do9YO4XcmRs=;
        b=z/Y9M5qIgFHWzE0EIeX9RgYTUmeQ0GupYq+IMEvtm/kpJ8t7T9mhuJF6mGHo9CXWPg
         HIYmbXdUynD41OLF/SiTasSiGHIKbD5vLOs9IblDPNgchwB4KaJVESjGvMuLes+qCUC8
         adnRjpX/adpLFzPkSA04dmLqyzwpZzLcHV1BRmWSCecdfnBRwAdonSlZhwjN0Q1hw6N6
         iEG0xbHQNtczAyan5XVnTttssM7tx8poxbDSlpkOMDXBeb083AVdFukWG+TeVAPR9jwZ
         BTcKwjNCGuMm8BXtNot1MC+0LeFQB8eH2mOAosvML4o1Z0BlCx8ME8FshzAIUuddoHjI
         Z4vQ==
X-Gm-Message-State: AOAM53043MUOgxRFoTPJVjmIG+A9xxs/1IoCEmkXiqzpDIe9H4gK99kO
	06nFvzOO22ar8Rippa/Ohnm/6VlF9kEddA==
X-Google-Smtp-Source: 
 ABdhPJwiUSSs+vMXux/nAauEQpc5Y7evNhJ6vOTrODdpDe2YXcbNPV6hVkU4pjWzg2tMKVrWu4Mf4w==
X-Received: by 2002:a5d:6dab:: with SMTP id u11mr50568122wrs.46.1638882439143;
        Tue, 07 Dec 2021 05:07:19 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n4sm16592468wri.41.2021.12.07.05.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 05:07:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/16] ruby: update 3.0.2 -> 3.0.3
Date: Tue,  7 Dec 2021 14:07:02 +0100
Message-Id: <20211207130703.3196805-15-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211207130703.3196805-1-alex@linutronix.de>
References: <20211207130703.3196805-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 13:07:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159300

Do not tweak a file that is no longer installed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/ruby/{ruby_3.0.2.bb => ruby_3.0.3.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.0.2.bb => ruby_3.0.3.bb} (93%)

diff --git a/meta/recipes-devtools/ruby/ruby_3.0.2.bb b/meta/recipes-devtools/ruby/ruby_3.0.3.bb
similarity index 93%
rename from meta/recipes-devtools/ruby/ruby_3.0.2.bb
rename to meta/recipes-devtools/ruby/ruby_3.0.3.bb
index 2abf504d91..73bea9e089 100644
--- a/meta/recipes-devtools/ruby/ruby_3.0.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.0.3.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
            file://0006-Make-gemspecs-reproducible.patch \
            "
 
-SRC_URI[sha256sum] = "5085dee0ad9f06996a8acec7ebea4a8735e6fac22f22e2d98c3f2bc3bef7e6f1"
+SRC_URI[sha256sum] = "3586861cb2df56970287f0fd83f274bd92058872d830d15570b36def7f1a92ac"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
@@ -67,6 +67,7 @@ do_install:append:class-target () {
 }
 
 do_install_ptest () {
+    set -x
     cp -rf ${S}/test ${D}${PTEST_PATH}/
 
     install -D ${S}/tool/test/runner.rb ${D}${PTEST_PATH}/tool/test/runner.rb
@@ -83,8 +84,6 @@ do_install_ptest () {
         -i ${D}${PTEST_PATH}/test/erb/test_erb_command.rb
 
     cp -r ${S}/include ${D}/${libdir}/ruby/
-    test_case_rb=`grep rubygems/test_case.rb ${B}/.installed.list`
-    sed -i -e 's:../../../test/:../../../ptest/test/:g' ${D}/$test_case_rb
 }
 
 PACKAGES =+ "${PN}-ri-docs ${PN}-rdoc"
-- 
2.20.1


