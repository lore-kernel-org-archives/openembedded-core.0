Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F1BC433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 02:27:40 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.1662.1657074458122018062
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 19:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2662RNOQ029527
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 5 Jul 2022 19:27:27 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 2662RMR1007402
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 5 Jul 2022 19:27:22 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 5 Jul 2022 19:27:22 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 5 Jul 2022 19:27:21 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] vim: 8.2.5083 -> 9.0.0005
Date: Wed, 6 Jul 2022 10:27:20 +0800
Message-ID: <20220706022720.1410652-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 02:27:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167685

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The license checksum changed due to a major version change in the referenced file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 89f34d8aa4f4572d048dbb732ca4c83d443157fb)
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../vim/{vim-tiny_8.2.bb => vim-tiny_9.0.bb}                | 0
 meta/recipes-support/vim/vim.inc                            | 6 +++---
 meta/recipes-support/vim/{vim_8.2.bb => vim_9.0.bb}         | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/vim/{vim-tiny_8.2.bb => vim-tiny_9.0.bb} (100%)
 rename meta/recipes-support/vim/{vim_8.2.bb => vim_9.0.bb} (100%)

diff --git a/meta/recipes-support/vim/vim-tiny_8.2.bb b/meta/recipes-support/vim/vim-tiny_9.0.bb
similarity index 100%
rename from meta/recipes-support/vim/vim-tiny_8.2.bb
rename to meta/recipes-support/vim/vim-tiny_9.0.bb
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 06707dbe11..b85f34d6c8 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,7 +11,7 @@ RSUGGESTS:${PN} = "diffutils"
 
 LICENSE = "Vim"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
-                    file://runtime/doc/uganda.txt;md5=daf48235bb824c77fe8ae88d5f575f74"
+                    file://runtime/doc/uganda.txt;md5=001ef779f422a0e9106d428c84495b4d"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".5083"
-SRCREV = "db77c49401145d76441fbb3d22a1d7d987681c13"
+PV .= ".0005"
+SRCREV = "040674129f3382822eeb7b590380efa5228124a8"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
diff --git a/meta/recipes-support/vim/vim_8.2.bb b/meta/recipes-support/vim/vim_9.0.bb
similarity index 100%
rename from meta/recipes-support/vim/vim_8.2.bb
rename to meta/recipes-support/vim/vim_9.0.bb
-- 
2.25.1


