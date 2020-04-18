Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.646.1587225865483573832
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 09:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:38242 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jPpx9-003M54-K2
	for openembedded-core@lists.openembedded.org; Sat, 18 Apr 2020 12:04:24 -0400
Date: Sat, 18 Apr 2020 12:04:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: why does oe-buildenv-internal check for -z "$BDIR"?
Message-ID: <alpine.LFD.2.21.2004181159130.1300328@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=1.3
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


  perusing the OE init scripts, and noticed this in
oe-buildenv-internal, line 42:

if [ -z "$BDIR" ]; then
    if [ -z "$1" ]; then
        BDIR="build"
    else
        BDIR="$1"
    ... snip ...

  i'm curious ... under what circumstances would BDIR *not* be unset
(or not be the empty string) at that point? i'm just puzzled as to a
possible flow of control that gets to that point where BDIR has a
non-empty value, since i've never seen any mention in the docs about
such a possibility.

  doesn't hurt, of course, just not sure what that test is trying to
accomplish.

rday
