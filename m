Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.25298.1615142492780593577
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Mar 2021 10:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:56536 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lIyLL-0004HM-8O
	for openembedded-core@lists.openembedded.org; Sun, 07 Mar 2021 13:41:31 -0500
Date: Sun, 7 Mar 2021 13:41:29 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] bitbake-whatchanged: change ending quote to proper period
Message-ID: <d2a76e44-50d-9eef-57d3-999abf42b1e8@crashcourse.ca>
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


Pretty sure that trailing quote should be a period; it
appears to work properly.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/scripts/bitbake-whatchanged b/scripts/bitbake-whatchanged
index 3095dafa46..6f4b268119 100755
--- a/scripts/bitbake-whatchanged
+++ b/scripts/bitbake-whatchanged
@@ -217,7 +217,7 @@ print what will be done between the current and last builds, for example:
     # Edit the recipes
     $ bitbake-whatchanged core-image-sato

-The changes will be printed"
+The changes will be printed.

 Note:
     The amount of tasks is not accurate when the task is "do_build" since

-- 
