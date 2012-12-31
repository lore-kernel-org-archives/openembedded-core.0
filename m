Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TpjCW-0005aM-Lr
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Dec 2012 18:31:01 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:48476 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tpiy2-0004or-BD for openembedded-core@lists.openembedded.org;
	Mon, 31 Dec 2012 12:16:02 -0500
Date: Mon, 31 Dec 2012 12:15:54 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1212311210590.8363@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: "Fetcher failure: SRCREV was used yet no valid SCM was found in SRC_URI"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Dec 2012 17:31:02 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i'm sure it's something i'm doing but i'm playing with an OE
configuration for qemuarm and experimenting with "bitbake -e" and got
this:

$ bitbake -e core-image-minimal | grep SRCREV
... snip ...
# expansion of SRCPV threw ExpansionError: Failure expanding variable
SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered
exception FetchError: Fetcher failure: SRCREV was used yet no valid
SCM was found in SRC_URI
# SRCREV=INVALID
SRCREV="INVALID"
... snip ...
$

  i can appreciate *why* this is happening if the fetcher code thinks
that's a valid value for SRCREV but there's no SRC_URI value for
core-image-minimal.

  i've googled a bit and perused the code but i'm guessing someone
else can probably see what's happening in seconds.  the above doesn't
appear to hurt anything, but it certainly seems like a bogus error.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


