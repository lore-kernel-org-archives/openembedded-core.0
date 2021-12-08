Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12658C43217
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:20 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.3075.1639000802075998448
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AFtVxdjH;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id c4so6464673wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8KiAinrTJo/WeizngfAqJwQa7ILHMGx8Do9YO4XcmRs=;
        b=AFtVxdjHa8sBFyvmm8sS79vbAJKTUgSTltHKl7DU7VOIvZ6+KfKrhuwxpPFWyVb9v5
         uEtKrA7zVDKpG/m0vmOy1UKgo99sPq8TZ66Zo+91Cr2rkvJkwegLY5dzsAzHL5wH8PVh
         NgOIZ0wuOOBORmpdgsvgpsdWvHfBEM8KA/zTH/UTof6/H2t5P3D3W8a7dGAyioRUBi7O
         vV/RsIeAi43V4ob9pC0lDKw2qlnzHNHShOj/V8oaS2SSNaE6Se/7O6QtKVL22ALE5NpR
         qZFM6VErV7EJ+HkcfiAsWJ0cHsI4Hf68XOzCYjJwortL98d5WkZSWxVZLbBjDEyLo1WK
         kgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8KiAinrTJo/WeizngfAqJwQa7ILHMGx8Do9YO4XcmRs=;
        b=k6Z8HhiMcVogfOdTFevH9OZWwFq6GYmdiTS175NqjAkc87G2TL3Daa0Sh+VZDGebTP
         1dVypSaUnAlOcijKqE+sruY19jmjMGBL/1PSrZNERhXZ6iQgg/pcqANHkyEzP54Gufj+
         RKdOX/1L5jf7RcVIei4joZcK1BSYztR/7xC5Q4691CvykdDLeviK3kum6uGuOvM/27jq
         LPs9utLVm658VPUSglIt3OS18fGjf7KWZLy0QRg8lC+yEKks1yLrGfX7c63+9IUZ/H+y
         Z/JD5UmTrqd7QzG+VDFC8CQb+cNgx67KepTdUh1XP4oK4GAK2H7vxsEOC/eE4ANVD5nl
         8QBg==
X-Gm-Message-State: AOAM533mSCPw+zBpnp+ClhjgpP1n+98rOkCT6o0hFzQbqIjwGCx4BdQf
	KcE9JfEdnBeiLUr0nlzaARi5pK+CsBPUpg==
X-Google-Smtp-Source: 
 ABdhPJyqbaLbyzs/3Zscn5tq4vv2x4WzhjEvvnxkBMFJQP20lHKaudl4Aal2fM7gnCL2sOa8vnmvQg==
X-Received: by 2002:adf:a444:: with SMTP id e4mr1552890wra.341.1639000800732;
        Wed, 08 Dec 2021 14:00:00 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/29] ruby: update 3.0.2 -> 3.0.3
Date: Wed,  8 Dec 2021 22:59:24 +0100
Message-Id: <20211208215947.1979470-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159372

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


