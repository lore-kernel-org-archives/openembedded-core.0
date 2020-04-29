Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.568.1588152506842368761
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 02:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:45696 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jTj0y-004fyU-Gi
	for openembedded-core@lists.openembedded.org; Wed, 29 Apr 2020 05:28:25 -0400
Date: Wed, 29 Apr 2020 05:28:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: coding style question about obsoleted packages
Message-ID: <alpine.LFD.2.21.2004290518370.6773@localhost.localdomain>
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


  just noticed that, in master branch, kbd recipe quite reasonably
distinguishes itself from the much, much older console-tools package
thusly:

  RREPLACES_${PN} = "console-tools"
  RPROVIDES_${PN} = "console-tools"
  RCONFLICTS_${PN} = "console-tools"

all perfectly reasonable as long as console-tools actually existed as
a recipe, but it was deleted some months ago:

  commit 320319f24dd1be300bc89c52b97d1703eab83029
  Author: Alexander Kanavin <alex.kanavin@gmail.com>
  Date:   Wed Nov 20 14:44:51 2019 +0100

    console-tools: remove the recipe

    The last release of this was in 2002(!), kbd is the modern,
    supported alternative.

and as best i can tell, there are no references to console-tools in
the numerous layers i have checked out. under the circumstances, then,
while it doesn't hurt to have that info above in the kbd recipe, is
there any value?

  more generally, when a recipe is truly removed and obsoleted, should
it be part of the removal process to get rid of such references to it
to avoid slowly-accumulating cruft in the code base?

rday

p.s. YP reference maual, "migration to 3.1" section, does indeed
mention that console-tools is deleted, but neglects to mention its
replacement with kbd ... i've made a note of that and will add that
along with other changes to the ref manual at some point for clarity.
