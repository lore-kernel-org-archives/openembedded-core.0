Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.13799.1629049530980882542
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 10:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:35788 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mFKCL-0001qk-1B
	for openembedded-core@lists.openembedded.org; Sun, 15 Aug 2021 13:45:29 -0400
Date: Sun, 15 Aug 2021 13:45:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] scripts/lib/wic/help/py: "Redhat" -> "Red Hat"
Message-ID: <48b2fd26-ba15-e4-7510-94476c3e82d@crashcourse.ca>
MIME-Version: 1.0
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


Company name is properly spelled as "Red Hat".

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 991e5094bb..41451d1cb0 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -637,7 +637,7 @@ DESCRIPTION
     oe-core: directdisk.bbclass and mkefidisk.sh.  The difference
     between wic and those examples is that with wic the functionality
     of those scripts is implemented by a general-purpose partitioning
-    'language' based on Redhat kickstart syntax).
+    'language' based on Red Hat kickstart syntax).

     The initial motivation and design considerations that lead to the
     current tool are described exhaustively in Yocto Bug #3847

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
