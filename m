Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.11227.1589658286528362860
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 May 2020 12:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:44258 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ja2jk-00HXQu-IK
	for openembedded-core@lists.openembedded.org; Sat, 16 May 2020 15:44:45 -0400
Date: Sat, 16 May 2020 15:44:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: pypi.python.org simply a redirect to pypi.org?
Message-ID: <alpine.LFD.2.21.2005161537080.23975@localhost.localdomain>
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


  it *appears* that pypi.python.org is just a redirect to pypi.org,
which means a few things could be simplified, such as a few recipes,
as well as pypi.bbclass:

  HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
  ...
  UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"

seems could be replaced by:

  HOMEPAGE ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
  ...
  UPSTREAM_CHECK_URI ?= ${HOMEPAGE}

unless i'm missing something. thoughts?

rday

