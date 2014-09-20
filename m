Return-Path: <denis@denix.org>
X-Greylist: delayed 3605 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 20 Sep 2014 01:12:31 UTC
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 3A14B70E1E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Sep 2014 01:12:31 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NC6005LPB7XLI50@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 19 Sep 2014 19:12:12 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D44C6200DD; Fri,
	19 Sep 2014 20:11:56 -0400 (EDT)
Date: Fri, 19 Sep 2014 20:11:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-id: <20140920001156.GA2480@denix.org>
References: <1410909001-3284-1-git-send-email-denis@denix.org>
	<CAJTo0LbGHQEa_QjRnekh8L+-+kAn575K3jFJ2ypty-EDkKS6RQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAJTo0LbGHQEa_QjRnekh8L+-+kAn575K3jFJ2ypty-EDkKS6RQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] u-boot: cleanup indentation and consolidate .inc file
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
X-List-Received-Date: Sat, 20 Sep 2014 01:12:37 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Sep 20, 2014 at 01:07:11AM +0100, Burton, Ross wrote:
> On 17 September 2014 00:10, Denys Dmytriyenko <denis@denix.org> wrote:
> > --- a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> > +++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> > @@ -1,25 +1,9 @@
> >  require u-boot.inc
> >
> > -# To build u-boot for your machine, provide the following lines in your machine
> > -# config, replacing the assignments as appropriate for your machine.
> > -# UBOOT_MACHINE = "omap3_beagle_config"
> > -# UBOOT_ENTRYPOINT = "0x80008000"
> > -# UBOOT_LOADADDRESS = "0x80008000"
> 
> Was this little piece of documentation deleted deliberately?

Yes, it's outdated and rather misplaced...

-- 
Denys

