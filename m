Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.5675.1587933635990915327
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2020 13:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:56230 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jSo4o-00DYQW-JW
	for openembedded-core@lists.openembedded.org; Sun, 26 Apr 2020 16:40:35 -0400
Date: Sun, 26 Apr 2020 16:40:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: how to identify/remove all ruby-related content from an image?
Message-ID: <alpine.LFD.2.21.2004261634170.91219@localhost.localdomain>
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


  (note: i think i discovered the simplest way to do this but ...
onward.)

  given an OE image based on some old YP versions (mostly morty/2.2),
there is a maddeningly intermittent build issue with one or the other
of a small number of ruby gems, so my initial idea is, for now, to
just remove all ruby-related content from the image and see if it
builds reliably.

  the idea is to remove any ruby-based recipes, then build and clean
over and over to see if the build error goes away. the ruby stuff is
non-critical stuff (chef and puppet, among other things), but the
current image drags in some 9 or 10 layers, and all sorts of custom
packagegroups, so i was looking for the quickest way to identify
what's based on ruby, and was ready to use "bitbake -g" to construct a
dependency graph and so on, until it occurred to me ...

 ... why not just blacklist ruby in local.conf, then start removing
whatever breaks because of that? is that the easiest way to do this? i
just don't want to claw my way through numerous layers and
packagegroups to figure this out.

rday
