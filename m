Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.10816.1632059195799269111
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Sep 2021 06:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:60886 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mRx9N-0002Et-Az
	for openembedded-core@lists.openembedded.org; Sun, 19 Sep 2021 09:46:33 -0400
Date: Sun, 19 Sep 2021 09:46:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: what is "INHIBIT_PACKAGE_DEBUG_SPLIT" supposed to do?
Message-ID: <bba2f23-baec-b568-9252-09192e77b1@crashcourse.ca>
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


  i was experimenting with various packaging schemes using different
values for PACKAGE_DEBUG_SPLIT_STYLE, then decided to see the effect
of setting INHIBIT_PACKAGE_DEBUG_SPLIT -- when using the split style
of "debug-with-pkgsrc", i got the expected (separate) debug and src
packages. but when i then set INHIBIT_PACKAGE_DEBUG_SPLIT to '1', the
contents of both the dbg and src packages disappeared entirely, and
nothing extra was placed in the base package. in short, i lost all
debugging and source content entirely.

  is that what i should expect? it seems counter-intuitive.

rday
