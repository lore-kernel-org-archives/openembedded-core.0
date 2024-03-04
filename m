Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D58C54E41
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 11:13:09 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.95864.1709550787880843816
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 03:13:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=mnQT07k2;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B3vDJor+tgkMhb9RSeewwo//1T+MjGPAO6Ca6zxisAM=; b=mnQT07k2RL8bLASPEdPTpziCur
	YbuK3kmkbzQVIqr8XIm3l9f9CTKSDbPgWxDopzSb/jsBxQNvkAIwJ3M2AAHLIKT2yxYsdom8Lzi8X
	p8qsXzkLLCdNCub9GktmPJYM7kWVhjhTvlQjfGvqIjGqy9kc7e7EmuKUWR7Dqsy6ayViDV+Au7tKr
	rfS90IUXmwVVHduKq6YRUBna25wLFQAFHehjLvuEyDzx1Fsewn4pb6RI8xS+pA3i/d2vI53/Nuh5T
	lBBEAB+noUcYz4mKffNYBemX+xm8FdyjDMQb42gHyBZ6acz/fpAdRTKqGsLK3dn7zbhzBImVyxmIl
	0eJx4W9g==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:41080 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rh6Fh-005B3W-0u
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2024 06:13:06 -0500
Date: Mon, 4 Mar 2024 06:12:57 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-cryptography_42.0.5.bb: delete redundant ptest
 packaging
Message-ID: <dbfe4df3-d2b0-f275-12a6-23bd441cdf86@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 11:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196594


Since FILES:${PN}-ptest is already defined to include the contents of
${PTEST_PATH}, adding such an entry to the package is superfluous.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
index 2bcb5717e4..732f925d92 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
@@ -60,9 +60,6 @@ do_install_ptest() {
     cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/
 }

-FILES:${PN}-ptest += " \
-    ${PTEST_PATH}/check-memfree.py \
-"
 FILES:${PN}-dbg += " \
     ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
 "

-- 

