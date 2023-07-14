Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0294FEB64DA
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 10:42:13 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.15782.1689331325328754453
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 03:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=0+/K+ieM;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 36EAfxob369028
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 12:41:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1689331319;
	bh=dSV25Gyl9NALYzoIws7GWWhVcE5eN4Hg+eBl+IxgJAg=; l=1821;
	h=From:To:Cc:Subject:Date;
	b=0+/K+ieMgmIY5B0uwm5RWMsT/gvH/9auq4nuoZHVth5drn7NOshMhgWqxVUjp4ZZK
	 41eNXl5+dzqATLX/fsB8GJ8rY3q2SZnJZK9MkSWzKrbgwP67x2Wz6sbOLcRn/ccRie
	 vHWpiWYeqA2q8ejtQ90HFI7hfh8D/+jQLkhQRm66CKLg1T1EmBeCbGqQ759zMwUM+I
	 hKDGsLhthiVwREn4Wyb9DneEQ6uCfjRj5FRR1oqZ9JG8SwOQv4I0FifefaFbkw6i72
	 vx846e1AePe1WUiYu4+LAvrA8AZztuNylUUin86EDoRyodeTinZBsC8rMsNQHHGsST
	 d8fJyEGYU2VYQ==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 36EAfrVE853252
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Fri, 14 Jul 2023 12:41:54 +0200
Received: from mail-msa-3.intern.sigma-chemnitz.de ([192.168.12.73])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id FSL18NFST8; Fri, 14 Jul 2023 12:41:53 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de ([192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id 36EAfqce361968
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 14 Jul 2023 12:41:52 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.96)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1qKGFE-00F8qi-1A;
	Fri, 14 Jul 2023 12:41:52 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] shadow-sysroot: add license information
Date: Fri, 14 Jul 2023 12:41:48 +0200
Message-ID: <20230714104148.3608888-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 64b12671301ed1a4310892f2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 10:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184257

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Recipe references 'login.defs' in LIC_FILES_CHKSUM.  This causes some
problems:

- file does not contain a single word which is related with its license

- changing this file (here: increasing SYS_UID_MIN) invalidates
  LIC_FILES_CHKSUM

Add 'SPDX-License-Identifier' to the file and limit the checksum to
this part.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-extended/shadow/files/login.defs_shadow-sysroot | 1 +
 meta/recipes-extended/shadow/shadow-sysroot_4.6.bb           | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/files/login.defs_shadow-sysroot b/meta/recipes-extended/shadow/files/login.defs_shadow-sysroot
index 8a68dd341a61..a82f7969b19e 100644
--- a/meta/recipes-extended/shadow/files/login.defs_shadow-sysroot
+++ b/meta/recipes-extended/shadow/files/login.defs_shadow-sysroot
@@ -1,3 +1,4 @@
+# SPDX-License-Identifier: BSD-3-Clause | Artistic-1.0
 #
 # /etc/login.defs - Configuration control definitions for the shadow package.
 #
diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
index e05fa237a240..5f3c7e121f91 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/shadow-maint/shadow"
 BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
 SECTION = "base utils"
 LICENSE = "BSD-3-Clause | Artistic-1.0"
-LIC_FILES_CHKSUM = "file://login.defs_shadow-sysroot;md5=25e2f2de4dfc8f966ac5cdfce45cd7d5"
+LIC_FILES_CHKSUM = "file://login.defs_shadow-sysroot;endline=1;md5=ce8f87ba229dc6de3285a0aac9199544"
 
 DEPENDS = "base-passwd"
 
-- 
2.41.0


