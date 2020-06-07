Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.10416.1591545939823578594
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jun 2020 09:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:41278 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jhxnl-000WLj-NZ
	for openembedded-core@lists.openembedded.org; Sun, 07 Jun 2020 12:05:38 -0400
Date: Sun, 7 Jun 2020 12:05:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: why does populate_sdk.bbclass do an "addtask" twice for same task?
Message-ID: <alpine.LFD.2.21.2006071157001.22527@localhost.localdomain>
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


  perusing recipes for SDKs and noticed that populate_sdk.bbclass
consists wholly of (note the addtask of populate_sdk):

  inherit populate_sdk_base
  addtask populate_sdk after do_install before do_build

whereupon if one examines populate_sdk_base.bbclass, right at the very
end, one reads:

  ... snip ...
  addtask populate_sdk

is there a reason that same task is added in both classes? is it the
case that one of the functions of populate_sdk_base.bbclass is to
simply define the populate_sdk task, whereupon an inheriting class is
responsible to define *where* it is to be run?

  or am i totally misunderstanding what i'm looking at?

rday

