Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.14088.1630309930124477770
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 00:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:37194 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mKc5Q-0004qY-BR
	for openembedded-core@lists.openembedded.org; Mon, 30 Aug 2021 03:52:08 -0400
Date: Mon, 30 Aug 2021 03:52:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: why "PREFERRED_PROVIDER_udev" and not "PREFERRED_PROVIDER_virtual/udev"?
Message-ID: <a9a5b3df-5a2c-c7c-ba3e-9e4ed712cf67@crashcourse.ca>
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


  i was going to extend section 3.3.17, "Using Virtual Providers",
with an intro example using "udev" until i realized that that example
doesn't use the "virtual/" notation. so ... why not? is there some
distinction between other components that use the "virtual/" prefix,
but a reason that one does not specify:

  PROVIDES = "virtual/udev"

rather than just:

  PROVIDES = "udev"

and then use the corresponding PREFERRED_PROVIDER_virtual/udev
notation?

rday
