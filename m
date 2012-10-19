Received: from mercury.karoo.kcom.com ([212.50.160.61]
	helo=smtpout.karoo.kcom.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mac@mcrowe.com>) id 1TPG0t-0001wL-TW
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 19:05:35 +0200
X-IronPort-AV: E=Sophos;i="4.80,613,1344207600"; d="scan'208";a="914902641"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 19 Oct 2012 17:51:01 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.72)
	(envelope-from <mac@mcrowe.com>) id 1TPFmn-0003yI-Ck
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 17:51:01 +0100
Resent-From: Mike Crowe <mac@mcrowe.com>
Resent-Date: Fri, 19 Oct 2012 17:51:01 +0100
Resent-Message-ID: <20121019165101.GB14620@mcrowe.com>
Resent-To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Oct 2012 17:02:55 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20121019160255.GA13950@mcrowe.com>
References: <20121019153834.GA13159@mcrowe.com>
	<CABcZANkWq0YZ38E9cCDvoJvpou0eunXJcHUUQCnbhRmDm_oQLg@mail.gmail.com>
	<2996317.jWZoZdIPNY@helios>
MIME-Version: 1.0
In-Reply-To: <2996317.jWZoZdIPNY@helios>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Using SSTATE_MIRRORS with sstate subdirectories
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
X-List-Received-Date: Fri, 19 Oct 2012 17:05:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 19, 2012 at 04:52:25PM +0100, Paul Eggleton wrote:
> On Friday 19 October 2012 08:46:23 Chris Larson wrote:
> > On Fri, Oct 19, 2012 at 8:38 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > > I'm having trouble using SSTATE_MIRRORS as suggested at
> > > https://wiki.yoctoproject.org/wiki/Enable_sstate_cache :
> > > 
> > > SSTATE_MIRRORS ?= "file://.* file:///private/sstate-cache/"
> > 
> > SSTATE_MIRRORS ?= "file://.* file:///private/sstate-cache/PATH"

Thanks Christopher. That works.

> Note: with master / danny, but not denzil or earlier.

I'm wary of attempting to update the wiki page for that reason.

Mike.


