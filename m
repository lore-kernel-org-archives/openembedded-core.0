Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.4646.1615979022151344550
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 04:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-29-64-229-255-220.dsl.bell.ca ([64.229.255.220]:47356 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lMTxk-003T46-OH
	for openembedded-core@lists.openembedded.org; Wed, 17 Mar 2021 07:03:41 -0400
Date: Wed, 17 Mar 2021 07:03:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: any problem with FILESOVERRIDES having duplicate entries?
Message-ID: <7ec47ffc-a843-a6c-b269-489ca7a3612@crashcourse.ca>
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


  currently writing a tutorial on how to play with FILESEXTRAPATHS in
the context of multiple machines and recipe versions, and noticed this
in my basic environment for a qemuarm64 build:

#   "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}"
FILESOVERRIDES="aarch64:qemuall:aarch64:armv8a:qemuarm64:poky"
                ^^^^^^^         ^^^^^^^

so the file override value of "aarch64" is supplied by both
TRANSLATED_TARGET_ARCH and MACHINEOVERRIDES ... is there any reason
for concern, given that "qemuall" is sandwiched between them and might
change the expected order of processing the overrides?

  or am i overthinking this?

rday
