Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.7366.1588254576139440000
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 06:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:59030 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jU9ZG-001HyJ-Dk
	for openembedded-core@lists.openembedded.org; Thu, 30 Apr 2020 09:49:34 -0400
Date: Thu, 30 Apr 2020 09:49:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: can i blacklist a particular .bbclass file when there are more than one?
Message-ID: <alpine.LFD.2.21.2004300945580.19276@localhost.localdomain>
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


  given an odd collection of layers wherein there are multiple
instances of a particular .bbclass file, it turns out that all of the
recipes i'm interested in build with an older version of the class
file, and all but one build consulting the newer form of the file
contained in another layer, so is there any way to blacklist a
particular class file, either globally or even on a per-recipe basis?

  i realize this is really, really bad design style, but it will give
me the chance to use the proper class file for most of the recipes
while i debug the problematic recipe.

rday
