Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 68E9C61CDC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 18:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 043F940C2B;
	Fri, 13 Mar 2020 18:15:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id c1M4Z4N0V3R7; Fri, 13 Mar 2020 18:15:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9A4E440C2A;
	Fri, 13 Mar 2020 18:15:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D7529174456; Fri, 13 Mar 2020 14:15:44 -0400 (EDT)
Date: Fri, 13 Mar 2020 14:15:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Message-ID: <20200313181544.GO1578@denix.org>
References: <CAA=hcWSGmz-GRFac-UR6AcTRyUYjvf1buRaYQvvCMrr__OuV_g@mail.gmail.com>
	<20200313164014.GN1578@denix.org>
	<CAHtQpK7c88eUNPDcCoX7OdrDzhNhGyntYU53WqrJXXbSYtT7nQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHtQpK7c88eUNPDcCoX7OdrDzhNhGyntYU53WqrJXXbSYtT7nQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] menuconf u-boot
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
X-List-Received-Date: Fri, 13 Mar 2020 18:15:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2020 at 07:07:34PM +0100, Andrey Zhizhikin wrote:
> JH,
> 
> Please refer to my replies to Denys, cross-posting to unrelated lists
> is generally not a good idea.
> 
> On Fri, Mar 13, 2020 at 5:40 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > What's u-boot-imx?
> 
> This is U-Boot fork for NXP devices (former Freescale),

This was a rhetorical question - no answer was required.


> which is not maintained by OE-Core.

Exactly my point.


> > It's definitely not in openembedded-core, so there's no reason to cross-post
> > there.
> >
> > If google doesn't help, it's recommended to post such specific questions to
> > the corresponding mailing list for the layer this recipe comes from.
> 
> The correct mailing list would be meta-freescale@yoctoproject.org and
> JH already had some questions posted there.
> 
> >
> > If it's not clear where the recipe comes from, Layer Index can help:
> > https://layers.openembedded.org/
> >
> > Thanks.
> >
> > --
> > Denys
> >
> >
> > On Fri, Mar 13, 2020 at 08:15:17PM +1100, JH wrote:
> > > Hi,
> > >
> > > I tried to run bitbake -c menuconfig u-boot, it popped up a terminal
> > > u-boot-imx configuration:
> 
> It is not clear which yocto branch/machine you're trying to build
> here. If you provide more details - then there is a bigger chance that
> people would step in to assist you.
> 
> > >
> > > make: *** No rule make target 'menuconfig'. Stop.
> > > Command failed.
> > > Press any key to continue...
> > >
> > > How can I  run menuconfig u-boot?
> 
> I've tried it now on the [master] branch of yocto for imx8mmevk
> machine - it is building OK and I have the menuconfig from u-boot-imx.
> Hence, please refer to my point above regarding more pre-information
> on the issue.
> 
> > >
> > > Thank you.
> > >
> > > Kind regards,
> > >
> > > - jh
> >
> > > 
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> 
> -- 
> Regards,
> Andrey.
> 

