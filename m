Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.10917.1630856068481953109
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Sep 2021 08:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:48452 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mMuA5-0006NM-OM
	for openembedded-core@lists.openembedded.org; Sun, 05 Sep 2021 11:34:26 -0400
Date: Sun, 5 Sep 2021 11:34:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: is oe_soinstall() from utils.bbclass actually used?
Message-ID: <ea0f368-83a0-c9d8-fbf3-bd3634c52b85@crashcourse.ca>
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


  just going over the mechanics of how shared libs are installed
properly, and noticed that while utils.bbclass defines the helper
routine oe_soinstall(), no one in my current collection of layers
seems to use it; rather, the popular choice is oe_libinstall(), which
seems to subsume the earlier routine given its "-so" option.

  is oe_soinstall() still used?

rday
