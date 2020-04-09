Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.6576.1586430384372543315
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 04:06:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:36384 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jMV0o-008WDR-Qs
	for openembedded-core@lists.openembedded.org; Thu, 09 Apr 2020 07:06:23 -0400
Date: Thu, 9 Apr 2020 07:06:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: removal of long-deprecated SSTATEPOSTINSTFUNCS?
Message-ID: <alpine.LFD.2.21.2004090702130.8071@localhost.localdomain>
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


  i note that, way back in YP ref manual, migration to YP 2.3, we
read:

"The SSTATEPOSTINSTFUNCS variable itself is now deprecated in favor of
the do_populate_sysroot[postfuncs] task. Consequently, if you do still
have any function or functions that need to be called after the
sysroot component is created for a recipe, then you would be well
advised to take steps to use a post installation script as described
previously. Taking these steps prepares your code for when
SSTATEPOSTINSTFUNCS is removed in a future Yocto Project release."

  it doesn't *appear* that anything still uses that variable, other
than the buildhistory.bbclass file. any value in hanging onto it?

rday
