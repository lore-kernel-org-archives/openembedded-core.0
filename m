Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.11462.1620903004988915359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 03:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:39116 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lh8up-0008L7-5u
	for openembedded-core@lists.openembedded.org; Thu, 13 May 2021 06:50:04 -0400
Date: Thu, 13 May 2021 06:49:59 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] meta/lib/oe/rootfs.py: "Restoreing" -> "Restoring"
Message-ID: <d57bc151-16b9-dd90-acda-d5bf53b3a4d4@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
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

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 4b48cdbb65..ad9fd77c8b 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -167,7 +167,7 @@ class Rootfs(object, metaclass=ABCMeta):
             pass
         bb.utils.rename(self.image_rootfs, self.image_rootfs + '-dbg')

-        bb.note("  Restoreing original rootfs...")
+        bb.note("  Restoring original rootfs...")
         bb.utils.rename(self.image_rootfs + '-orig', self.image_rootfs)

     def _exec_shell_cmd(self, cmd):

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
