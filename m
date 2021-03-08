Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.33608.1615193634381582814
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 00:53:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:33864 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lJBeC-0001Gh-O4
	for openembedded-core@lists.openembedded.org; Mon, 08 Mar 2021 03:53:53 -0500
Date: Mon, 8 Mar 2021 03:53:50 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: what means 'PROVIDES = ""'?
Message-ID: <295b2b59-fc52-a845-297-5c2a4095d7ac@crashcourse.ca>
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


  another oddity in my travels, found a couple recipes that appear to
explicitly un-PROVIDE themselves, such as libxcrypt-compat_4.4.18.bb:

  PROVIDES = ""

i thought that every recipe always implicitly provided itself, and
that one could always extend that (with either = or +=), but this is
the first i've noticed this construct. is it really stripping the
PROVIDES value of the recipe? under what circumstances would you want
to do that?

rday
