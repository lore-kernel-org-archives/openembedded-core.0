Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.5757.1595366812289633957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2020 14:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from localhost ([127.0.0.1]:54566 helo=cpanel7.indieserve.net)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jxzmk-002uWf-Oh
	for openembedded-core@lists.openembedded.org; Tue, 21 Jul 2020 17:26:51 -0400
Received: from [66.129.241.12] ([66.129.241.12]) by crashcourse.ca (Horde
 Framework) with HTTPS; Tue, 21 Jul 2020 17:26:50 -0400
Date: Tue, 21 Jul 2020 17:26:50 -0400
Message-ID: <20200721172650.Horde.Ywym1orCr19y5sktKiavBRT@crashcourse.ca>
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: openembedded-core@lists.openembedded.org
Subject: "DEPENDS =" versus "DEPENDS +=" in recipe files
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline

pursuant to cleaning up some docs and tweaking the style guide,
i just want to clarify that the *proper* assignment to DEPENDS
in recipe files is:

   DEPENDS = "..."

unless (of course) that assignment is preceded by a "require"
of a .inc file that assigns to that variable, whereupon the "+="
would make sense.

   other than that, though, can i assume there is no rationale
for "DEPENDS += ..." in terms of coding style? (being a minimalist,
i hate extraneous operators.)

rday

