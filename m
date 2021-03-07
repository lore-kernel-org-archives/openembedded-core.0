Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.25344.1615142663612425782
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Mar 2021 10:44:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:56560 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lIyO6-0004hI-8Y
	for openembedded-core@lists.openembedded.org; Sun, 07 Mar 2021 13:44:22 -0500
Date: Sun, 7 Mar 2021 13:44:18 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: puzzling wording about "nostamp" task in bitbake-whatchanged
Message-ID: <94e4a2-6180-5d9-1a74-b41525c042ae@crashcourse.ca>
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


  in that script, one reads:

  Note:
    The amount of tasks is not accurate when the task is "do_build" since
    it usually depends on other tasks.
    The "nostamp" task is not included.

i have to assume that should read that all "nostamp" tasks are
excluded, as "nostamp" is a flag, not a task. or how should this be
interpreted or reworded?

rday
