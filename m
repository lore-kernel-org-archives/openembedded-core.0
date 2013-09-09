Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0396BE4F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 16:22:29 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MSV001U19GVW2Q0@vms173001.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 09 Sep 2013 11:22:12 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3B54A200A9; Mon,
	09 Sep 2013 12:22:07 -0400 (EDT)
Date: Mon, 09 Sep 2013 12:22:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-id: <20130909162207.GF5834@denix.org>
References: <20130906185741.GA5834@denix.org> <20130909135125.GD5834@denix.org>
	<1378740263.3484.122.camel@ted>
MIME-version: 1.0
In-reply-to: <1378740263.3484.122.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: eglibc_2.17.bb: Failure expanding variable SELECTED_OPTIMIZATION[:=]
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
X-List-Received-Date: Mon, 09 Sep 2013 16:22:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Sep 09, 2013 at 04:24:23PM +0100, Richard Purdie wrote:
> On Mon, 2013-09-09 at 09:51 -0400, Denys Dmytriyenko wrote:
> > Any ideas or suggestions at this point would be greatly appreciated! Thanks.

Richard,

> I have vague recollections about this from something happening in
> master. Perhaps try with:
> 
> http://git.openembedded.org/bitbake/commit/?id=4d50690489ee8dc329a9b0c7bc4ceb29b71e95e9
> 
> applied. This might things more deterministic, perhaps always breaking
> or perhaps never.

Ah, good call! Massaging the patch onto 1.18 seems to have solved the parsing 
breakage - it passed 10 out of 10 tries so far. I'll keep testing and run a 
few real builds, but would you be willing to backport it to 1.18? Please let 
me know if you need an updated patch re-submitted. Thanks.


> Have you got two definitions of the "get_optimization" function?

I grepped through all my layers and eglibc_2.17.inc is the only place where it 
gets defined and used.

-- 
Denys

