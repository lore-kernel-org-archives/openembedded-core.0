Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.7234.1586001616250549208
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2020 05:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:51716 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jKhTC-002Xsz-Qx
	for openembedded-core@lists.openembedded.org; Sat, 04 Apr 2020 08:00:15 -0400
Date: Sat, 4 Apr 2020 08:00:12 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] bin_package.bbclass: emphasize setting of S with "subdir"
Message-ID: <alpine.LFD.2.21.2004040758090.11753@localhost.localdomain>
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

Clarify the setting of "S" so there is absolutely no confusion.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/classes/bin_package.bbclass b/meta/classes/bin_package.bbclass
index cbc9b1fa13..4e74557967 100644
--- a/meta/classes/bin_package.bbclass
+++ b/meta/classes/bin_package.bbclass
@@ -14,8 +14,8 @@
 #
 # SRC_URI = "http://foo.com/foo-1.0-r1.i586.rpm;subdir=foo-1.0"
 #
-# Then the files would be unpacked to ${WORKDIR}/foo-1.0, otherwise
-# they would be in ${WORKDIR}.
+# Then the files would be unpacked to S=${WORKDIR}/foo-1.0, otherwise
+# they would be in S=${WORKDIR}.
 #

 # Skip the unwanted steps

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
