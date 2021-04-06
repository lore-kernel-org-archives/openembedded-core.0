Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.1607.1617726529685334994
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 09:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-67-70-50-7-189.dsl.bell.ca ([70.50.7.189]:35438 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lToZM-00DymO-1d
	for openembedded-core@lists.openembedded.org; Tue, 06 Apr 2021 12:28:48 -0400
Date: Tue, 6 Apr 2021 12:28:45 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: style question about assigning to FILES_${PN}
Message-ID: <fc9c437f-3698-74e8-5684-7e768f1e5790@crashcourse.ca>
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


  i've seen a number of recipes bounce around between these variations
of adding an entire directory to a package's files:

  FILES_${PN} = "dir"
  FILES_${PN} = "dir/"
  FILES_${PN} = "dir/*"

first, i'm assuming all of the above mean exactly the same thing, yes?
that the entire directory, recursively, is being added. i ask since
even the stock OE bitbake.conf seems to jump around in the space of a
few lines:

  FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
            ${base_bindir}/* ${base_sbindir}/* \
            ... etc etc ...

hang on, what about hidden objects in the immediate subdirectory?
based on normal wildcarding, would the first two variants include
hidden files, while the third would not?

rday
