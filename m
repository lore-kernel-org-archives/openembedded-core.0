Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.53458.1629287694193095255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 04:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:51254 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mGK9l-0005j4-Dn; Wed, 18 Aug 2021 07:54:52 -0400
Date: Wed, 18 Aug 2021 07:54:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Ross Burton <ross@burtonini.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] should "${D}${systemd_unitdir}/system" => "${D}${systemd_system_unitdir}"?
In-Reply-To: <CAAnfSTunSXr2u5xjdj2-cVPFq0acHxn_SWE7hha8xXBNOYtx=g@mail.gmail.com>
Message-ID: <fab36f87-5f16-83ef-f930-75a04921e9@crashcourse.ca>
References: <74a0ce8a-7158-789-2e7a-b05d7937eed5@crashcourse.ca> <CAAnfSTunSXr2u5xjdj2-cVPFq0acHxn_SWE7hha8xXBNOYtx=g@mail.gmail.com>
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

On Wed, 18 Aug 2021, Ross Burton wrote:

> No, yes.  systemd_system_unitdir is newer so it's used less.

  i'll put together a patch and see if it's just more churn than it's
worth.

rday
