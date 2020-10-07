Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.4171.1602085287337797075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 08:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: mfe@pengutronix.de)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1kQBZF-0002lx-4u; Wed, 07 Oct 2020 17:41:25 +0200
Received: from mfe by dude02.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1kQBZD-00045S-QX; Wed, 07 Oct 2020 17:41:23 +0200
From: "Marco Felsch" <m.felsch@pengutronix.de>
To: richard.purdie@linuxfoundation.org
Cc: mfe@pengutronix.de,
	openembedded-core@lists.openembedded.org
Subject: [PATCH] inetutils: add dnsdomainname to ALTERNATIVE
Date: Wed,  7 Oct 2020 17:41:16 +0200
Message-Id: <20201007154116.15648-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: 8bit

The dnsdomainname can be provided by: busybox, net-tools and/or
inetutils. Busybox and net-tools already installing dnsdomainname using
the ALTERNATIVE mechanism, inetutils don't. Make it possible to install
all three packages without the need to add '--disable-dnsdomainname' to
the inetutils PACKAGECONFIG.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Hi,

without this patch I'm not able to build packagegroup-core-base-utils.

Regards,
  Marco

 meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index adf6d4414e..69917fb230 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -118,7 +118,7 @@ PACKAGES =+ "${PN}-tftpd-dbg ${PN}-telnetd-dbg ${PN}-rshd-dbg"
 NOAUTOPACKAGEDEBUG = "1"
 
 ALTERNATIVE_PRIORITY = "79"
-ALTERNATIVE_${PN} = "whois"
+ALTERNATIVE_${PN} = "whois dnsdomainname"
 ALTERNATIVE_LINK_NAME[uucpd]  = "${sbindir}/in.uucpd"
 
 ALTERNATIVE_PRIORITY_${PN}-logger = "60"
-- 
2.20.1

