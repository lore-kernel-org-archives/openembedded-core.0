Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.26890.1588525640597813358
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 10:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:49836 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jVI5H-00Arjj-FI
	for openembedded-core@lists.openembedded.org; Sun, 03 May 2020 13:07:19 -0400
Date: Sun, 3 May 2020 13:07:17 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: superfluous usage of "INC_PR" in oe-core?
Message-ID: <alpine.LFD.2.21.2005031305110.653691@localhost.localdomain>
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


  given my understanding of the rationale for INC_PR, it would seem as
if at least *some* of these assignments are superfluous:

  recipes-connectivity/connman/connman.inc:INC_PR = "r20"
  recipes-graphics/xorg-driver/xorg-driver-common.inc:INC_PR = "r21"
  recipes-graphics/xorg-xserver/xserver-xorg.inc:INC_PR = "r8"
  recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
  recipes-graphics/xorg-font/xorg-font-common.inc:INC_PR = "r2"
  recipes-graphics/xorg-font/encodings_1.0.5.bb:PR = "${INC_PR}.1"
  recipes-graphics/xorg-app/xorg-app-common.inc:INC_PR = "r8"
  recipes-kernel/linux/linux-yocto.inc:INC_PR = "r4"

rday
