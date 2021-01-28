Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.398.1611853817280174392
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 09:10:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:56276 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1l5AoA-0005EC-JL
	for openembedded-core@lists.openembedded.org; Thu, 28 Jan 2021 12:10:15 -0500
Date: Thu, 28 Jan 2021 12:10:12 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: "file" cmd ISO mime type: "octet-stream" should be "x-iso9660-image"
Message-ID: <d69bec18-efbb-fa7d-5cee-c8ed9aeabb5@crashcourse.ca>
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


  apparently, the newer version of "file", when asked about the mime
type of an ISO image, reports:

  application/octet-stream

when, from what i read, it should (and used to) report:

  application/x-iso9660-image

the above unexpected(?) behaviour comes with file-5.37, and it's been
seen in the wild:

  https://bugs.launchpad.net/ubuntu/+source/file/+bug/1763570

is this a known issue? i checked bugzilla but didn't find anything,
and this change in behaviour is messing with some install scripts
which use "file" to verify that something is a valid ISO image by
looking for the string "x-iso9660-image".

  thoughts? others certainly seem to think this is a bug.

rday
