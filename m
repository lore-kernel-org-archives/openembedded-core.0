Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B20CEB64DA
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 10:49:13 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.16080.1689331749852622898
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 03:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=Fnp2/bTQ;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 36EAn6Ck369100
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 12:49:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1689331746;
	bh=NMdll+G6PWQ2OZ+86SDpB8cw3qYxdiRsAtlDgN64obU=; l=1822;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Fnp2/bTQ8Aon3iJqtsk1kt3d13JitYbCeoGusYzg3D4CVzSBy+Ye3cjMBHa/3nLKv
	 i3+VKkq6ppdeNwa02A+PH7JH6UGZ77vJ95SFISPGFJGRnMKhuzm3kZSRCCxoN/GR55
	 zfFl9/tNcbOroa+C7biww22fDzn3Om1xDGx18z9wIboAkGxEv8vAtfI5xCCPaFyp2s
	 tcJTyfN4rk9jPNhKpdpuJtExc5cPD30CzDR+rXpE1QgsIPUXjMshbCVEotxt7mZkm6
	 NN28y/v2xsub99bZT3q0778+j2mcmdTR9oBehf0Rj7U55Qfs4DWpjsie0cC/PkMh/c
	 4eCw3jcdJb8iQ==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 36EAn3X1853398
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Fri, 14 Jul 2023 12:49:04 +0200
Received: from mail-msa-3.intern.sigma-chemnitz.de ([192.168.12.73])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id VICI4TKTER; Fri, 14 Jul 2023 12:49:03 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de ([192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id 36EAn3ut362037
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 14 Jul 2023 12:49:03 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.96)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1qKGMB-00FAe6-0o;
	Fri, 14 Jul 2023 12:49:03 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH v2] shadow-sysroot: add license information
Date: Fri, 14 Jul 2023 12:49:02 +0200
Message-ID: <20230714104902.3615826-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714104148.3608888-1-enrico.scholz@sigma-chemnitz.de>
References: <20230714104148.3608888-1-enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 64b1281f301ed1a4310892fe
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 10:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184258

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
index 8a68dd341a61..09df77d2e751 100644
--- a/meta/recipes-extended/shadow/files/login.defs_shadow-sysroot
+++ b/meta/recipes-extended/shadow/files/login.defs_shadow-sysroot
@@ -1,3 +1,4 @@
+# SPDX-License-Identifier: BSD-3-Clause OR Artistic-1.0
 #
 # /etc/login.defs - Configuration control definitions for the shadow package.
 #
diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
index e05fa237a240..6580bd916644 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/shadow-maint/shadow"
 BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
 SECTION = "base utils"
 LICENSE = "BSD-3-Clause | Artistic-1.0"
-LIC_FILES_CHKSUM = "file://login.defs_shadow-sysroot;md5=25e2f2de4dfc8f966ac5cdfce45cd7d5"
+LIC_FILES_CHKSUM = "file://login.defs_shadow-sysroot;endline=1;md5=ceddfb61608e4db87012499555184aed"
 
 DEPENDS = "base-passwd"
 
-- 
2.41.0


