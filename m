Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RH3sj-0000ij-GJ
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 03:26:45 +0200
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0LTE00EIX3LX74F3@vms173013.mailsrvcs.net>; Thu,
	20 Oct 2011 19:20:27 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CDF4514AF5D; Thu,
	20 Oct 2011 20:20:21 -0400 (EDT)
Date: Thu, 20 Oct 2011 20:20:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20111021002021.GV26170@denix.org>
References: <CAMKF1sqwC26Qo2MPCmNcwvsqweC-8F1P2y9myNOgihrBtCdTXA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1sqwC26Qo2MPCmNcwvsqweC-8F1P2y9myNOgihrBtCdTXA@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [ANNOUNCEMENT] New Patchwork available for testing
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
X-List-Received-Date: Fri, 21 Oct 2011 01:26:45 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Oct 17, 2011 at 12:06:04PM -0700, Khem Raj wrote:
> Hi
> 
> Here is a new instance of patchwork accessible at
> http://patchwork.openembedded.org
> 
> This instance uses same database therefore it should not be any different than
> existing patches.openembedded.org
> 
> However with the new patchwork you will see additionally "Mail settings"
> link on the right hand upper corner this could be used to subscribe to patchwork
> activity. This is a new feature so try it out and report any issues.
> 
> The patch capturing is done by the new patchwork.
> 
> reiterating what Koen already announced, git post-recieve hook is
> installed for meta-openembedded repository to interact with patchwork
> on push so it will change the state of patch to "Accepted" once
> it has been pushed. This should avoid lot of manual work for the maintainers

Does this work for pull requests?

-- 
Denys


