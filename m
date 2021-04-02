Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.20269.1617387200282688504
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Apr 2021 11:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:53712 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lSOII-00CgMV-AU
	for openembedded-core@lists.openembedded.org; Fri, 02 Apr 2021 14:13:18 -0400
Date: Fri, 2 Apr 2021 14:13:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: couple questions about IMAGE_BASENAME usage
Message-ID: <e14d17a5-53e9-8e68-4f59-59a95a1d9e@crashcourse.ca>
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


  first, given that the default value of IMAGE_BASENAME is simply the
package name, then i'm assuming that things like this in
core-image-tiny-initramfs.bb:

  export IMAGE_BASENAME = "core-image-tiny-initramfs"

are superfluous, yes?

  also, i'm curious about the difference between these two image
recipes:

core-image-minimal-initramfs.bb:export IMAGE_BASENAME = "${MLPREFIX}core-image-minimal-initramfs"
core-image-tiny-initramfs.bb:export IMAGE_BASENAME = "core-image-tiny-initramfs"

why does the first accommodate the multilib prefix MLPREFIX, while the
second does not?

rday
