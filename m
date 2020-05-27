Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.7093.1590589888565341552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 07:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:48550 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jdx5a-00Fj2P-N6
	for openembedded-core@lists.openembedded.org; Wed, 27 May 2020 10:31:27 -0400
Date: Wed, 27 May 2020 10:31:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] remove unused DEPLOY_DIR_TOOLS variable from bitbake.conf
Message-ID: <alpine.LFD.2.21.2005271027490.2161832@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


Variable DEPLOY_DIR_TOOLS was introduced in 2007:

  commit f751a20152c651a33f08ceda0502fa1d4f11c005
  Author: Richard Purdie <richard@openedhand.com>
  Date:   Wed Aug 8 21:02:39 2007 +0000

      bitbake.conf: Sync with OE.dev

apparently never used so get rid of it.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  if there's any actual use of this variable, i can't find it.

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f7700f1191..9336c244bc 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -410,7 +410,6 @@ DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
 DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
 DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
 DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
-DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"

 PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
