Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.7496.1617282487119860627
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 06:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-67-70-50-7-189.dsl.bell.ca ([70.50.7.189]:58860 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lRx3N-006mLh-3q
	for openembedded-core@lists.openembedded.org; Thu, 01 Apr 2021 09:08:05 -0400
Date: Thu, 1 Apr 2021 09:08:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: what are the dangers of adding "out-of-tree" files to FILES_${PN}?
Message-ID: <a8849ff1-da51-b152-ce3d-6fd8a6b1cf38@crashcourse.ca>
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


  recently, i've run across a couple layers based on pretty much
up-to-date OE/YP, where fixed files are being added to a package via
assignments like this:

  FILES_${PN} += "/data"

  i already know that's a bad idea, but i'm curious as to what build
errors might occur when trying something like this. i was first asked
about what might have caused a "pseudo abort" error as described here:

  https://wiki.yoctoproject.org/wiki/Pseudo_Abort

where the generated error referred to "path mismatch ... ino #######
db" ... etc etc. my first (admittedly uneducated) guess was that, in
the midst of installation, some of that external content under /data
was perhaps being deleted or updated in some way that was changing
inodes.

  even if doing something like technically works, can someone explain
what ugliness might result, i'm assuming from having any of that
external data change in the middle of a build?

rday


