Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.3290.1588587220574394460
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 03:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:48336 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jVY6U-00Cv4n-Vk
	for openembedded-core@lists.openembedded.org; Mon, 04 May 2020 06:13:39 -0400
Date: Mon, 4 May 2020 06:13:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: is there any value to FILESPATHPKG?
Message-ID: <alpine.LFD.2.21.2005040611490.6242@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  not sure where i read this (YP overview manual?), but i recall
something about the FILESPATHPKG variable being deprecated, and i see
its only references are:

$ grep -irw filespathpkg *
meta/classes/utils.bbclass:    filespathpkg = d.getVar("FILESPATHPKG").split(":")
meta/classes/utils.bbclass:        for pkgpath in filespathpkg:
$

so i'll leave it to someone else to decide if it still has value.

rday
