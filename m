Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.468.1587159553028892217
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2020 14:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:47200 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jPYhb-000g2i-Hl; Fri, 17 Apr 2020 17:39:12 -0400
Date: Fri, 17 Apr 2020 17:39:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] missing(?) numerous ptest packages building core-image-minimal for arm64
In-Reply-To: <CANNYZj9hjn28fQqLpbML7=SOdERUBGfFDCSir29sTz1nprgQEQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2004171736390.1967725@localhost.localdomain>
References: <alpine.LFD.2.21.2004171715340.1963843@localhost.localdomain> <CANNYZj9hjn28fQqLpbML7=SOdERUBGfFDCSir29sTz1nprgQEQ@mail.gmail.com>
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

On Fri, 17 Apr 2020, Alexander Kanavin wrote:

> ptest-pkgs is complementary; it pulls in ptests only for those
> packages that are explicitly included in the image. (similar to how
> dev-pkgs or doc-pkgs work).
>
> Generally, it is not recommended to use ptest-pkgs as you never know
> what you end up with, and how long running ptests will take; list
> ptests you want explicitly (core-image-sato-sdk-ptest is an example
> of how).

  ah, that clears things up, and definitely flies in the face of the
advice given in the current dev manual:

"To add package testing to your build, add the DISTRO_FEATURES and
EXTRA_IMAGE_FEATURES variables to your local.conf file, which is found
in the Build Directory:

     DISTRO_FEATURES_append = " ptest"
     EXTRA_IMAGE_FEATURES += "ptest-pkgs"

  i'll make a note of that and adjust the dev manual at some point to
clarify this, thanks.

rday
