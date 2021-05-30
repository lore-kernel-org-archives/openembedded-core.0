Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.36100.1622406689863245238
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 13:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:47280 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lnS5n-003cCk-Sb
	for openembedded-core@lists.openembedded.org; Sun, 30 May 2021 16:31:28 -0400
Date: Sun, 30 May 2021 16:31:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: switching some legacy bbclass stuff to use "noexec"
Message-ID: <79429a39-6f7f-8a9b-7b4b-18d791685d7@crashcourse.ca>
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


  am i right in assuming that stuff like this in ptest.bbclass:

  do_configure_ptest() {
      :
  }

can be replaced by using the "noexec" flag?

  if so, then this in base.bbclass looks a bit strange:

  do_build[noexec] = "1"
  do_build[recrdeptask] += "do_deploy"
  do_build () {
        :
  }

thoughts?

rday
