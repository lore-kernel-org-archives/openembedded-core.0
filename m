Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D57C02194
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 23:02:05 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by mx.groups.io with SMTP id smtpd.web11.27488.1738351535587634981
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 11:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@debian.org header.s=smtpauto.stravinsky header.b=uiYrnnWO;
 spf=none, err=SPF record not found (domain: debian.org, ip: 82.195.75.108, mailfrom: bage@debian.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sJsDivs/GQnxLvxLewIf7rIwp4g6TaYYqPDyb0ZTB3M=; b=uiYrnnWOhLCLUXHm0i2iZ7O6rN
	zqLFgXOUHSaoQdqSkWwV4UNVin/bCIQe4S1nW+jjLvbj8p7CTyu5rKSoYE28ub5DiCsrVcn+QOVlE
	IpYy7r6/abfr4+kFL1/qOFnlIaA5kS0A9WjyQ+SS7e+OdDLOL004TABd4HAI9o9Oj0BhGBUP6l1jD
	dvHKyeqOnhAdLEuzU13cCiL0wP7ahewbhGxNDdCYckLAzpG0J6XsVjbB5Bn80OGIkvMj0yp/pXz4O
	8qzjQ40S/vlPSaUCayFsKKhgePsU4MeMLhlXscKjB1eaNrh/EmYmnCRFkwP697SJWI5ewD1WaRhu9
	wZHnvFNg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1tdwdw-00FVbH-Lg; Fri, 31 Jan 2025 19:25:34 +0000
From: Bastian Germann <bage@debian.org>
To: openembedded-core@lists.openembedded.org
Cc: Bastian Germann <bage@debian.org>
Subject: [PATCH] tcf-agent: Use SPDX identifier
Date: Fri, 31 Jan 2025 20:25:21 +0100
Message-ID: <20250131192527.7449-4-bage@debian.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250131192527.7449-1-bage@debian.org>
References: <20250131192527.7449-1-bage@debian.org>
MIME-Version: 1.0
X-Debian-User: bage
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 23:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210500

The EDL-1.0 license matches the SPDX template for BSD-3-Clause.
There is no reason why this should be referenced as EDL-1.0, which is
not a registered SPDX identifier for exactly this reason.

License-Update: use SPDX identifier

Signed-off-by: Bastian Germann <bage@debian.org>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 214dd4b2a8..e1ac0a29a7 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://wiki.eclipse.org/TCF"
 DESCRIPTION = "TCF is a vendor-neutral, lightweight, extensible network protocol mainly for communicating with embedded systems (targets)."
 BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 
-LICENSE = "EPL-1.0 | EDL-1.0"
+LICENSE = "EPL-1.0 | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
 SRCREV = "1f11747e83ebf4f53e8d17f430136f92ec378709"

