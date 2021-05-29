Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.25376.1622323792383249080
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 14:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:36594 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ln6Wm-00FwtA-1g
	for openembedded-core@lists.openembedded.org; Sat, 29 May 2021 17:29:50 -0400
Date: Sat, 29 May 2021 17:29:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: cmake versus autotools in recipe files versus source
Message-ID: <e2e6ac-a52c-15db-8bc0-367da2c4a23a@crashcourse.ca>
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


  (yet another in an endless series of dumb questions as i get asked
about these things by colleagues and realize i don't know the answer.)

  can someone clarify the oddity of recipes whose source contains a
CMakeLists.txt file at the top, but whose recipe does not "inherit
cmake"?

  example: oe-core's "lzo" -- the recipe file contains:

  inherit autotools ptest

but the unpacked source contains a "CMakeLists.txt" file (as well as
autotools stuff).

  is that just to give the user the option of building with cmake or
autotools?

rday
