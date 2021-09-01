Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.5403.1630487542609236589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 02:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:47338 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mLMIA-0000JC-RY
	for openembedded-core@lists.openembedded.org; Wed, 01 Sep 2021 05:12:21 -0400
Date: Wed, 1 Sep 2021 05:12:18 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: "SRC_URI = file:///..." versus "externalsrc"?
Message-ID: <a08e3ed-e66c-e973-fb43-8ca9c5fe9aa5@crashcourse.ca>
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


  colleague asked me yesterday about the fundamental difference
between using SRC_URI to point at a local source tree to build, versus
inheriting externalsrc, and when to use each.

  from what i read, there's no serious difference as, by default, both
techniques copy the source tree under WORKDIR -- the major difference
is that externalsrc can be configured to build in the source directory
via EXTERNALSRC_BUILD, which is something i would discourage anyway.

  apart from that, is there an argument for one over the other
depending on the circumstances?

rday
