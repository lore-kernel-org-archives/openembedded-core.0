Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.51125.1629272896346332178
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 00:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:51248 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mGGJ5-0004E1-Jo
	for openembedded-core@lists.openembedded.org; Wed, 18 Aug 2021 03:48:14 -0400
Date: Wed, 18 Aug 2021 03:48:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: should "${D}${systemd_unitdir}/system" => "${D}${systemd_system_unitdir}"?
Message-ID: <74a0ce8a-7158-789-2e7a-b05d7937eed5@crashcourse.ca>
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


  i've (so far) run across a small number of OE recipes that use the
identifier "${D}${systemd_unitdir}/system", which appears(?) to be
equivalent to "${D}${systemd_system_unitdir}". is there any potential
functional difference, or should this be standardized?

rday
