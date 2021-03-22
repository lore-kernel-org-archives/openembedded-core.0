Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.1226.1616442635816256542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 12:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-67-70-50-7-189.dsl.bell.ca ([70.50.7.189]:48384 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lOQZO-00CJIl-5o
	for openembedded-core@lists.openembedded.org; Mon, 22 Mar 2021 15:50:34 -0400
Date: Mon, 22 Mar 2021 15:50:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: the weirdness of bbappend'ing to stock OE images
Message-ID: <ef94c962-16fd-8341-70c2-e531af21b6@crashcourse.ca>
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


  more a style issue than anything else, but one of the other oddities
in this layer i've been handed is the bbappending to standard OE
images, so that recipes-core/images/ contains recipe files like:

  core-image-minimal.bbappend
  core-image-minimal-dev.bbappend

and so on. that just creeps me out -- my plan is to forcefully advise
people to leave the stock images alone, and create clearly internal,
proprietary ones, like:

  acme-core-image-minimal.bb

that inherit or include, then do the adjusting.

  or is that approach considered acceptable? (it just makes me cringe,
personally.)

rday
