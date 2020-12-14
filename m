Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.39341.1607968008399944385
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 09:46:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:50342 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1korvl-0000DL-Fi; Mon, 14 Dec 2020 12:46:41 -0500
Date: Mon, 14 Dec 2020 12:46:39 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
cc: "OE Core (openembedded-core@lists.openembedded.org)" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] How to create a directory in multiple packages?
In-Reply-To: <9f740ac720f742ab869a15de54cf865e@XBOX03.axis.com>
Message-ID: <f44dd44e-ac73-8ed-674e-d6f3cc289c@crashcourse.ca>
References: <9f740ac720f742ab869a15de54cf865e@XBOX03.axis.com>
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

On Mon, 14 Dec 2020, Peter Kjellerstedt wrote:

> Say we have a recipe that creates an empty /etc/foo directory. Now we
> want to add a new file in that directory /etc/foo/bar and package it as
> ${PN}-bar. This means the creation of the /etc/foo directory is moved
> from the ${PN} package to the ${PN}-bar package. Is there any way to
> make ${PN} continue to create an empty /etc/foo, or is the only
> alternative to introduce an /etc/foo/.dummy and package it in ${PN}?

  it strikes me that creating an empty directory for no other reason
than creating an empty directory is less-than-optimal design. the
proper approach is that all file installation should create
directories as needed.

rday
