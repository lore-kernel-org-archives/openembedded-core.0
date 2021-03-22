Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.121.1616438605961781860
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 11:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-67-70-50-7-189.dsl.bell.ca ([70.50.7.189]:48282 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lOPWO-00C6W7-2s
	for openembedded-core@lists.openembedded.org; Mon, 22 Mar 2021 14:43:24 -0400
Date: Mon, 22 Mar 2021 14:43:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: curious about weirdness in some FILES_${PN} settings
Message-ID: <5a2c7beb-bc46-5528-c84-122ea0799c29@crashcourse.ca>
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


  (warning: i've just been handed an existing OE code base, and i'm
going to ask some questions about some head-scratching things i'm
finding in it, so be prepared for weird questions.)

  in one recipe, i see the following snippet:

  FILES_${PN} += "/etc"
  FILES_${PN} += "/etc/mosquitto"
  FILES_${PN} += "/etc/mosquitto/config"
  ... etc etc ...

first, i'm taken aback by the hardcoding of "/etc" rather than using,
you know, "${sysconfdir}", so i'm *assuming* that unless someone was
doing something spectacularly clever here, that just can't be right.

  more to the point, the above seems redundant -- once you've added
"/etc", isn't the rest just superfluous? i'm not sure what the
original developer was going for here. thoughts?

  finally, if i wanted to add all of some directory, say "dir", it was
my understanding that all of the following were equivalent (hmmmm,
short of picking up hidden files, i guess):

  dir
  dir/
  dir/*

my personal preference would be "dir/", as it gets across the idea
that "dir" is a directory and i want all of it. thoughts on that as
well? i'm currently perusing the OE code base to see the general
consensus on this. is there one?

  more decidedly strange questions coming shortly ...

rday

