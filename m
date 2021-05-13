Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.10911.1620898229555391796
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 02:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:38716 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lh7fn-00023B-6r
	for openembedded-core@lists.openembedded.org; Thu, 13 May 2021 05:30:27 -0400
Date: Thu, 13 May 2021 05:30:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] image.bbclass: fix comment "pacackages" -> "packages"
Message-ID: <66d51265-4cf2-4af6-e516-2bb76452bb38@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 353cc67175..67603d958d 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -38,7 +38,7 @@ IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs read-only-rootfs-de
 # Generate companion debugfs?
 IMAGE_GEN_DEBUGFS ?= "0"

-# These pacackages will be installed as additional into debug rootfs
+# These packages will be installed as additional into debug rootfs
 IMAGE_INSTALL_DEBUGFS ?= ""

 # These packages will be removed from a read-only rootfs after all other

