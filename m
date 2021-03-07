Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.20987.1615124240638085718
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Mar 2021 05:37:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:55202 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lItaw-0003Bx-IV
	for openembedded-core@lists.openembedded.org; Sun, 07 Mar 2021 08:37:19 -0500
Date: Sun, 7 Mar 2021 08:37:15 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: any value to "export PSEUDO_..." lines in bitbake.conf?
Message-ID: <33a7a72-6e5b-37b9-55dc-4b34378aa2ee@crashcourse.ca>
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


  just noticed in bitbake.conf (around line 700):

#export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
#export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
#export PSEUDO_LIBDIR = "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib

apart from those lines being commented out and "git blame" dating them
from 2011, the third is obviously broken given the lack of curly
braces around "PSEUDOBINDIR", so is it just easier to toss them, or is
there historical value?

rday
