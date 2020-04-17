Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.75.1587158490229605150
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2020 14:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:46992 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jPYQS-000dgk-Av
	for openembedded-core@lists.openembedded.org; Fri, 17 Apr 2020 17:21:28 -0400
Date: Fri, 17 Apr 2020 17:21:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: missing(?) numerous ptest packages building core-image-minimal for arm64
Message-ID: <alpine.LFD.2.21.2004171715340.1963843@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.5
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


  as a demo of how ptest works, i used the current master branch of
poky, MACHINE=qemuarm64, built core-image-minimal, and selected to
install ptests with:

  DISTRO_FEATURES_append = " ptest"
  EXTRA_IMAGE_FEATURES += "ptest-pkgs"

following the directions in the dev manual. but when it was all over
and i fired up the qemu image, there were *very* few ptests installed
under /usr/lib -- in fact, only busybox, zlib and util-linux.

  i was expecting far more; for example, bzip2, which has ptest
capability. i verified that PACKAGES for bzip2 included bzip2-ptest, i
could see the ptest content under bzip2's "packages-split" and so on,
but nothing in the qemu image. and there are quite a number of
ptest-enabled recipes that seem to have had their ptest package
omitted from the final image.

  am i missing something? is there an extra configuration i need? feel
free to try this for yourself, and let me know if i'm just overlooking
something trivial.

rday
