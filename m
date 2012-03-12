Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1S7Ct5-0006ym-L8
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 22:34:39 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0S004IZGQCBSY1@vms173015.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 15:25:24 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 36EFD20264; Mon,
	12 Mar 2012 16:25:24 -0400 (EDT)
Date: Mon, 12 Mar 2012 16:25:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120312202524.GB9300@denix.org>
References: <CA+M6bXkMdv_bg9bDOYCS=Ng0sSB+2Yu6xRN4V0tKDV9RCJMy+A@mail.gmail.com>
	<04FC93EF-7089-4EAD-8C1D-14824C8CBB02@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <04FC93EF-7089-4EAD-8C1D-14824C8CBB02@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Consistency and use cases for IMAGE_FSTYPES
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
X-List-Received-Date: Mon, 12 Mar 2012 21:34:39 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Mar 10, 2012 at 07:29:20AM +0100, Koen Kooi wrote:
> 
> Op 9 mrt. 2012, om 22:39 heeft Tom Rini het volgende geschreven:
> 
> > Hey all,
> > 
> > Over in meta-ti I kicked off a discussion
> > (https://lists.yoctoproject.org/pipermail/meta-ti/2012-March/000779.html)
> > about if we should be using '?=' or '+=' with IMAGE_FSTYPES in the
> > machine conf files.  This has been discussed a little bit before
> > (http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/2060/focus=2061).
> > The problem is we have the following and I believe ultimately
> > conflicting use cases:
> > - The machine needs to say 'I need or support the following formats'
> > - The distro needs to say 'I always want format X'
> > - The user needs to say 'I know best, give me only format X'
> > - The user needs to say 'I know best, give me what you support + X'
> > 
> > We achieve this today, but not very nicely.  For the last one you need
> > to start playing order of operations games and that's just not nice.
> > My suggestion is that we need to change what the machine.conf sets to
> > another variable (SOMETHING_IMAGE_FSTYPES), and a default
> > IMAGE_FSTYPES becomes ?= ${SOMETHING_IMAGE_FSTYPES}.  Distros, and
> > users can then work more easily with their use cases.  Comments?
> 
> EXTRA_IMAGE_FSTYPES!

+1

MACHINE_IMAGE_FSTYPES + DISTRO_IMAGE_FSTYPES? jk :)

-- 
Denys


