Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S9d6Y-0004IZ-VX for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 14:58:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2JDni7q030523
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 13:49:44 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30131-06 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 13:49:40 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2JDnX6m030517
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 13:49:35 GMT
Message-ID: <1332164974.9740.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 Mar 2012 13:49:34 +0000
In-Reply-To: <1332076702.5077.10.camel@ted>
References: <cover.1331859046.git.shane.wang@intel.com>
	<F29B7771-8017-4CB4-AFCF-19CB857CAAD1@dominion.thruhere.net>
	<3AB6CE7F274E534CAFD089D127A8A1FC23AED2D9@SHSMSX102.ccr.corp.intel.com>
	<A4E92037-A984-4CCF-BDCF-E1020891494E@dominion.thruhere.net>
	<1332076702.5077.10.camel@ted>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Patch Merging Status
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Mar 2012 13:58:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm faced with a bit of a dilemma with the number of queued changes. I'm
not very happy with as many updates right on the release freeze deadline
and I know this is causing problems for downstream trees like meta-oe
too.

I believe the testing done has found the problematic changes in the
branch (alsa-utils, xserver-xorg and automake for example) and that
we're in a reasonable state to merge these and I appreciate the work
Saul and others have done in stabilising and testing the changes. I
appreciate meta-oe needs more time to test and integrate these though.

One idea would be to feed these in though smaller sets of updates but
since they've been tested as a unit, I don't really want to do this
since I don't have a good feel for any interdependencies.

I'm therefore going to:

a) Pull in fixes and other pending patches other than the big block of
updates now. I've gone ahead and done this.

b) Put the updates on master-next for oe-core. Unless serious issues are
uncovered, these will merge on Wednesday.

This should give everyone the time needed to allow a smooth merge of the
changes and gives room for some further testing.

I should mention this totally screws up Yocto's stabilisation, QA and
other plans since this is going to change timings or workflows. I'm
making the decision knowing that and tending towards breaking the
workflows and keep the original schedule.

Cheers,

Richard





