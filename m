Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.34891.1620053697154187425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 07:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:46496 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ldZyJ-0007Vn-Rb
	for openembedded-core@lists.openembedded.org; Mon, 03 May 2021 10:54:56 -0400
Date: Mon, 3 May 2021 10:54:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: how to add a "-dev" package to host SDK?
Message-ID: <14306152-1445-7a44-523-beb73a6dbda@crashcourse.ca>
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


  colleague asks a simple question (and i'm not in front of my dev box
at the moment so i can't verify what i'm about to suggest): how to add
the header files in a given "-dev" package to the host component of
the SDK?

  i haven't spent a lot of time messing with SDKs (that is about to
change), but as i read it, if one wants to add the contents of any
given development package to the host SDK, it would look like:

  TOOLCHAIN_HOST_TASK_append = " nativesdk-fubar-dev"

  i have no idea what the rationale is here, i'm just trying to
address the question, which in addition asks, "if you add something
like that to the host side, is it automatically added to the target
side?"

  i'm pretty sure it isn't, but i can check that after i log in. i
have no idea what they're up to here, i just want to answer the
question.

rday
