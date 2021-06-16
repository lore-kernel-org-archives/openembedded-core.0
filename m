Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.9898.1623861029310786415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 09:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:40510 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ltYQv-001WKI-3E
	for openembedded-core@lists.openembedded.org; Wed, 16 Jun 2021 12:30:27 -0400
Date: Wed, 16 Jun 2021 12:30:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: should the same recipe have two different WORKDIRs?
Message-ID: <f82ec87-8fbe-49d0-e147-a9c8dd6c711@crashcourse.ca>
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


  perhaps i've just never noticed before, but a colleague asked me to
debug some strangeness with his WRLinux build, and what i noticed was
that the recipe that generated a package with a single (aarch64)
executable created WORKDIRs under both directories:

  * cortexa53...
  * acme-coyote		[actual target board]

this surprises me ... i thought that, based on the attributes of any
recipe, it would have only one WORKDIR in the appropriate place. what
does the above mean? i'm not sure what to make of it.

rday
