Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.203.1626462639872572045
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jul 2021 12:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:34844 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1m4TEO-008C9J-0Q
	for openembedded-core@lists.openembedded.org; Fri, 16 Jul 2021 15:10:38 -0400
Date: Fri, 16 Jul 2021 15:10:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: how to configure an image with *full* debugging info in the libs and binaries?
Message-ID: <6d41368-58fa-56e-63c5-7d445550a928@crashcourse.ca>
MIME-Version: 1.0
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


  colleague just asked me what it would take to generate an image
where the executables and libraries contain all the gdb-related
debugging info in the same files (that is, not broken out in the
.debug directories).

  i pointed out that this would increase the size of the installable
target image substantially but, apparently, that is of no concern.

  said colleague pointed me here as to what they were perusing:

https://developer.ridgerun.com/wiki/index.php?title=Preparing_Yocto_Development_Environment_for_Debugging

so, once i finish this current task, i'm going to take a shot at
testing whether the following would do it:

  # Specifies to build packages with debugging information
  DEBUG_BUILD = "1"
  # Do not remove debug symbols
  INHIBIT_PACKAGE_STRIP = "1"
  # OPTIONAL: Do not split debug symbols in a separate file
  INHIBIT_PACKAGE_DEBUG_SPLIT= "1"

am i on the right track? this seems straightforward enough, i'll just
have to confirm those variables still exist, and that they do what i
want.

  thoughts? is this as simple as i think it should be?

rday
