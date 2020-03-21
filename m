Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.6624.1584793574254568202
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2020 05:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:32852 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jFdCe-000kTP-Qk
	for openembedded-core@lists.openembedded.org; Sat, 21 Mar 2020 08:26:13 -0400
Date: Sat, 21 Mar 2020 08:26:11 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: recipes that don't list where their source is
Message-ID: <alpine.LFD.2.21.2003210818320.7869@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
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


  not sure what the policy is but, occasionally, i run across a recipe
that doesn't identify the location of the source code (just in case i
want to peruse it). case in point:  kexec-tools on master branch:

http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb

combining HOMEPAGE and SRC_URI, you get little more than the directory
to download versioned tarballs, but nothing about the location of the
source code itself, if it's available.

  is there a protocol for identifying the (accessible) location of the
source code, or is that simply up to the maintainer to provide it if
he or she wants?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
