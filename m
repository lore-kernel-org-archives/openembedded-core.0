Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.3997.1586631057784795131
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Apr 2020 11:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:40272 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jNLDU-00Fw2p-3I
	for openembedded-core@lists.openembedded.org; Sat, 11 Apr 2020 14:50:56 -0400
Date: Sat, 11 Apr 2020 14:50:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: pedantry alert: MACHINE=qemux86* includes "qemuboot" twice in IMAGE_CLASSES
Message-ID: <alpine.LFD.2.21.2004111446050.9154@localhost.localdomain>
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


  was documenting, you know, stuff and noticed that when building for
MACHINE = qemux86-64, the variable IMAGE_CLASSES contained the entry
for qemuboot twice:

  IMAGE_CLASSES=" qemuboot qemuboot license_image"

easy to see why ... those machine conf files both contain:

  require conf/machine/include/qemu.inc
  require conf/machine/include/qemuboot-x86.inc

both of which contain the line:

  IMAGE_CLASSES += "qemuboot"

doesn't hurt, of course, but could it be done less redundantly?

rday
