Return-Path: <sjl@vctlabs.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC9CC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 10:29:05 +0000 (UTC)
Received: from dent.vctlabs.com (dent.vctlabs.com [207.154.65.135])
 by mx.groups.io with SMTP id smtpd.web08.24041.1639477744387558352
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 02:29:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: vctlabs.com, ip: 207.154.65.135,
 mailfrom: sjl@vctlabs.com)
Received: by dent.vctlabs.com (Postfix, from userid 112)
	id F1653280270; Tue, 14 Dec 2021 02:31:05 -0800 (PST)
Received: from codepurple (c-73-158-3-176.hsd1.ca.comcast.net [73.158.3.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
 server-digest SHA256)
	(No client certificate requested)
	by dent.vctlabs.com (Postfix) with ESMTPSA id 84FA628016A
	for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 02:31:05 -0800 (PST)
Date: Tue, 14 Dec 2021 02:28:59 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cups: fix typo in flags to disable avahi
Message-ID: <20211214102859.GB5920@codepurple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 10:29:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159683

one too many 's': dnsssd -> dnssd

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 3175a91ce4..05c1e34a77 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -40,7 +40,7 @@ SYSTEMD_SERVICE:${PN} = "cups.socket cups.path cups.service cups-lpd.socket"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)}"
-PACKAGECONFIG[avahi] = "--with-dnssd=avahi,--with-dnsssd=no,avahi"
+PACKAGECONFIG[avahi] = "--with-dnssd=avahi,--with-dnssd=no,avahi"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
 PACKAGECONFIG[gnutls] = "--with-tls=gnutls,--with-tls=no,gnutls"
 PACKAGECONFIG[pam] = "--enable-pam --with-pam-module=unix, --disable-pam, libpam"
-- 
2.20.1


