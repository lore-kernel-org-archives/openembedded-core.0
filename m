Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel2.indieserve.net (cpanel2.indieserve.net [199.212.143.6])
	by mail.openembedded.org (Postfix) with ESMTP id 77069607F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 10:48:23 +0000 (UTC)
Received: from cpec03f0ed08c7f-cm68b6fcf980b0.cpe.net.cable.rogers.com
	([174.118.92.171]:55802 helo=localhost.localdomain)
	by cpanel2.indieserve.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
	(envelope-from <rpjday@crashcourse.ca>) id 1d8ldw-0005vZ-TH
	for openembedded-core@lists.openembedded.org;
	Thu, 11 May 2017 06:48:24 -0400
Date: Thu, 11 May 2017 06:48:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1705110623380.31743@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel2.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel2.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel2.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [OT?] where to start building for qualcomm snapdragon APQ8016E dragonboard 410C?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 May 2017 10:48:25 -0000
Content-Type: text/plain; charset=US-ASCII


  (i'm sure there's a more appropriate forum to ask this, but i'm just
going to throw myself on the mercy of the general OE list.)

  i've been asked to help out with lashing together an OE build for a
target board that will be based on qualcomm's snapdragon 410 APQ8016E,
so the obvious choice for an initial reference system would be the
96boards.org-approved dragonboard 410c from arrow (i'm open to other
suggestions for more fully-featured boards supported by OE):

 http://www.96boards.org/product/dragonboard410c/

but, wow, are there a bunch of places to start pulling content from.

  i picked out the meta-qcom layer immediately:

 http://git.yoctoproject.org/cgit/cgit.cgi/meta-qcom

which has a machine definition for that very board, and i built a
core-image-minimal image for that target with no trouble (have not
loaded and tested yet, board supposedly arrives tomorrow). so far, so
good. but when i perused further, i found all sorts of URLs with more
info/content/layers, depending on what you were after:

 git://git.linaro.org/landing-teams/working/qualcomm/kernel.git
 https://www.codeaurora.org/openembedded-mass-market-and-ioe-qualcomm-snapdragon
 https://developer.qualcomm.com/hardware/dragonboard-410c
 https://github.com/96boards/
 https://createpoint.qti.qualcomm.com/

and i'm not sure that's even the entire list i've seen.

  specifically, i'm wondering where the canonical code base is for
what i'm doing, and i was told that it's at that qualcomm location,
for which one needs an account. a colleague has an account and let me
peruse the qualcomm createpoint repo, but it seems that whatever i see
there is available publicly, particularly at codeaurora.org.

  can someone clarify how all these sites hang together, and where one
starts? as i said, right now, the meta-qcom layer works right out of
the box to build an image for that target. is it necessary to get
access to qualcomm's createpoint repo? or is everything i might need
available publicly at github and codeaurora?

  thanks for any pointers.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

