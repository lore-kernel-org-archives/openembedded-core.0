Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1T2Jwr-00011e-Lw
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 12:38:37 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69) with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1T2JlJ-0007oo-Ea>; Fri, 17 Aug 2012 12:26:41 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69) with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1T2JlJ-0005Q6-2m>; Fri, 17 Aug 2012 12:26:41 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1T2JlH-0005et-04; Fri, 17 Aug 2012 12:26:39 +0200
Date: Fri, 17 Aug 2012 12:26:38 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: ml@communistcode.co.uk, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120817102638.GD17007@mi.fu-berlin.de>
References: <1345049073-27898-1-git-send-email-paul.eggleton@linux.intel.com>
	<1566766.76zJMGCy1b@helios> <1345197209.26132.2.camel@ted>
	<502E1777.6020006@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <502E1777.6020006@communistcode.co.uk>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [PATCH] classes/chrpath: trigger an error if chrpath fails
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
X-List-Received-Date: Fri, 17 Aug 2012 10:38:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 17, 2012 at 11:05:43AM +0100, Jack Mitchell wrote:
> any provider
> WARNING: Failed to fetch URL http://kernel.org/pub/linux/kernel/people/jsipek/guilt/guilt-0.33.tar.gz,
> attempting MIRRORS if available
> *ERROR: chrpath command failed with exit code 7
> ERROR: chrpath command failed with exit code 7*

Hi,

you can grep the logfiles in the work-dir for chrpath call and you will find the package. I saw it on some perl modules, but not now.

Bye Henning


