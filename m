Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1USKS4-0004Gk-GA
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 06:58:37 +0200
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MLD00HI1UCGGLO5@vms173005.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 23:41:04 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7BF8A201A7; Wed,
	17 Apr 2013 00:41:02 -0400 (EDT)
Date: Wed, 17 Apr 2013 00:41:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-id: <20130417044102.GA21029@denix.org>
References: <1365685393-611-1-git-send-email-Chase.Maupin@ti.com>
	<1365685393-611-2-git-send-email-Chase.Maupin@ti.com>
	<7D46E86EC0A8354091174257B2FED101594F0D62@DLEE11.ent.ti.com>
	<1366150895.25282.11.camel@ted>
MIME-version: 1.0
In-reply-to: <1366150895.25282.11.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] u-boot: Add UBOOT_LOCALVERSION to control version string
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
X-List-Received-Date: Wed, 17 Apr 2013 04:58:38 -0000
X-List-Received-Date: Wed, 17 Apr 2013 04:58:38 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 16, 2013 at 11:21:35PM +0100, Richard Purdie wrote:
> On Tue, 2013-04-16 at 11:59 +0000, Maupin, Chase wrote:
> > > -----Original Message-----
> > > From: Maupin, Chase
> > > Sent: Thursday, April 11, 2013 8:03 AM
> > > To: openembedded-core@lists.openembedded.org
> > > Cc: Maupin, Chase
> > > Subject: [PATCHv2] u-boot: Add UBOOT_LOCALVERSION to control
> > > version string
> > > 
> > > * Add a variable called UBOOT_LOCALVERSION which when set will
> > >   place a version string in the .scmversion file of the u-boot
> > >   sources.  This string will be picked up by the u-boot Makefile
> > >   and will be appended to the u-boot version.  This is done to
> > >   make it easier to identify what revision of the u-boot sources
> > >   are being run.  For example you can use a setting like the
> > >   following to add the short commit id to the u-boot version
> > >   string:
> > > 
> > > UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV',
> > > True).partition('+')[2][0:7]}"
> > > 
> > 
> > Ping on this patch
> 
> These are really enhancements, not bug fixes and are too late for 1.4
> since they came in after the feature freeze.
> 
> I'm nervous of them as there have been several iterations and I can't
> easily tell what impact these will have on the different package
> backends, or linux-yocto verses non linux-yocto for example.
> 
> Its simply too late and there are other bigger issues I'm worried about.
> I therefore don't want to take this additional risk, sorry.

Richard,

Thanks for the explanation, it's understood.
Do you want to take it after the release? Would you prefer a ping or a new 
submission of this patch?

-- 
Denys


