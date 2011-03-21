Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q1YZA-0000kK-EJ
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 07:26:13 +0100
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LIE00F7G9SMLOI1@vms173011.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 01:24:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B8DCF14AF6C; Mon,
	21 Mar 2011 02:24:22 -0400 (EDT)
Date: Mon, 21 Mar 2011 02:24:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20110321062422.GB5575@denix.org>
References: <cover.1300355683.git.sgw@linux.intel.com>
	<1300384055.30423.2078.camel@rex>
MIME-version: 1.0
In-reply-to: <1300384055.30423.2078.camel@rex>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: poky@yoctoproject.org
Subject: Re: [poky] [PATCH 0/7] Non-GPLv3 Changes & a dependency	Fix
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
X-List-Received-Date: Mon, 21 Mar 2011 06:26:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 17, 2011 at 05:47:35PM +0000, Richard Purdie wrote:
> On Thu, 2011-03-17 at 02:58 -0700, Saul Wold wrote:
> > From: Saul Wold <sgw@linux.intel.com>
> >
> > This set of changes enables both poky-image-minimal and poky-image-basic
> > to build non-gplv3 core image. These are bound for bernard
> > 
> > There is also a fix for the gnome-vfs dependency on ACL. This is
> > a potential build stopper and should be considered for bernard
> > 
> > Pull URL: git://git.openembedded.org/openembedded-core-contrib
> >   Branch: sgw/non-gplv3
> >   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/non-gplv3
> > 
> > Thanks,
> >     Saul Wold <sgw@linux.intel.com>
> > ---
> > 
> > 
> > Saul Wold (7):
> >   util-linux: Setup for GPLv2 Recipe
> 
> I don't like this patch at all, there are some typos in it and some
> other issues. Too risky for bernard for sure. I'm leaving it for now.

FYI, in Arago I had to repackage util-linux-ng source tarball w/o lscpu pieces 
to completely avoid GPLv3, instead of removing them on the fly... In case when 
said source tarball needs to be mirrored or distributed with the build.

And, BTW, there is one more little script under GPLv3 - tests/ts/lscpu/lscpu

-- 
Denys


