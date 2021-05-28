Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.7653.1622206315466633328
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 05:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:37558 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lmbxy-00830Z-SA
	for openembedded-core@lists.openembedded.org; Fri, 28 May 2021 08:51:54 -0400
Date: Fri, 28 May 2021 08:51:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: follow up: keeping the source with an "externalsrc"-based recipe
Message-ID: <f25c1d23-ce3-bd0-a5b5-8c5d4e0fda6@crashcourse.ca>
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


  as a short followup to my earlier note about creating a bunch of
externalsrc-based recipes to demonstrate their proper structure, it's
easy to add the recipe files to a layer, but i then realized i needed
to figure out where to put the corresponding source, and how i would
refer to it with the EXTERNALSRC variable, and after some thought, it
occurred that the simplest solution is to simply put the source in a
"src" subdirectory next to the recipe itself, and use:

  inherit externalsrc

  EXTERNALSRC = "${THISDIR}/src"
  EXTERNALSRC_BUILD = "${EXTERNALSRC}"

yes, i know this is hacky, but it demonstrates the process, and there
seems to be nothing magic about having the source right there, and all
of the standard bitbake tasks -- including cleaning -- seem to work
properly.

  aside from looking weird, is there anything about this that wouldn't
work?

rday
