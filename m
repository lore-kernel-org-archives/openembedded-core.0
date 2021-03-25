Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.8700.1616681302774773897
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 07:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-67-70-50-7-189.dsl.bell.ca ([70.50.7.189]:56336 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lPQeq-008cdj-O7
	for openembedded-core@lists.openembedded.org; Thu, 25 Mar 2021 10:08:21 -0400
Date: Thu, 25 Mar 2021 10:08:19 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: any *compelling* reasons to whitelist env vars for an OE build?
Message-ID: <429b51e-7cc5-54a7-a28-7e8beab0c77d@crashcourse.ca>
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


  kind of a philosophical question, but i'm having a discussion with
some new colleagues about how to customize an OE (actually, wind river
linux) build, and these colleagues have, until now, used (whitelisted)
environment variables to pass info to the build, that info being used
to specify things like a development versus manufacturing build, and
so on.

  i suggested that i didn't think there was any really persuasive
reasons to use environment variables this way, as there are more than
enough configuration files to customize a build. i mentioned things
like:

  * machine config files
  * distro config files
  * defining packagegroup files
  * defining image files

and on and on and on.

  my point was that there are more than enough ways to support all the
customization you might need, that taking advantage of shell
environment variables strikes me as unnecessarily messy and, for that
matter, dangerous if you forget so set the environment.

  thoughts? am i out of line in advising them to use what OE offers
them, and not extract stuff from the environment?

rday
