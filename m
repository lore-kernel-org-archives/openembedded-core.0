Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.3725.1590265268664806472
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 May 2020 13:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:56954 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jcadn-004Dcr-1t; Sat, 23 May 2020 16:21:07 -0400
Date: Sat, 23 May 2020 16:21:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Gregor Zatko <gzatko@gmail.com>
cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] sanity.bbclass: Detect and fail if 'inherit' is used in conf file
In-Reply-To: <20200523201626.1295537-1-gzatko@gmail.com>
Message-ID: <alpine.LFD.2.21.2005231620300.10655@localhost.localdomain>
References: <20200523201626.1295537-1-gzatko@gmail.com>
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

On Sat, 23 May 2020, Gregor Zatko wrote:

> 'inherit' directive may not be used in conf files as it's supposed
> to be used for the inheritance of recipes.

  no, it's for the inheritance of class files.

rday
