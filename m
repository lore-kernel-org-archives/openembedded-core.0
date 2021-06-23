Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.5783.1624445339269391750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 03:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:58406 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lw0RG-001hAj-V3
	for openembedded-core@lists.openembedded.org; Wed, 23 Jun 2021 06:48:57 -0400
Date: Wed, 23 Jun 2021 06:48:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: should a layer supply its own "local.conf" file?
Message-ID: <b58585ae-7c43-731a-71fa-2832828ead6@crashcourse.ca>
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


  long story short -- was having trouble figuring out why basic
settings i was adding to my build directory's conf/local.conf were
being ignored, and traced it back to the internal layer i was using
having its own "local.conf" file (in its conf directory, sitting
quietly next to the layer's "layer.conf" file).

  argh.

  i'm assuming that it was *that* local.conf that was being consulted
by the config process (overriding mine). is there some rationale for
that? that doesn't strike me as proper design, but i'm willing to be
educated.

rday
