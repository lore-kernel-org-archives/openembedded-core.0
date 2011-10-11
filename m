Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDc7X-0005LL-3d for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 15:11:50 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9BDCed9017043 for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 14:12:41 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kckyLdwS9lpU
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 14:12:40 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9BDCbj5017024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 14:12:39 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2011 14:05:56 +0100
In-Reply-To: <20111011070327.GA27073@jama.jama.net>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
	<8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
	<4E93E69A.7070402@windriver.com> <20111011070327.GA27073@jama.jama.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318338364.23801.91.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCHv3 01/31] xserver-xf86(-dri)-lite: rename to xserver-xorg and xserver-xorg-lite
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
X-List-Received-Date: Tue, 11 Oct 2011 13:11:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-11 at 09:03 +0200, Martin Jansa wrote:
> On Tue, Oct 11, 2011 at 02:47:54PM +0800, Kang Kai wrote:
> > On 2011?10?08? 01:04, Martin Jansa wrote:
> > > * xserver-xorg is closer to upstream naming and
> > >    that's how it's named in OE-classic and meta-oe? It would make meta-oe
> > >    transition easier and better to do it now then convert meta-oe to
> > >    xserver-xf86 and then rename it back later.
> > >
> > > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > > ---
> > > diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
> > > index 7b6c4a9..8af80c7 100644
> > > --- a/meta/conf/distro/include/distro_tracking_fields.inc
> > > +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> > > @@ -3683,14 +3683,14 @@ RECIPE_INTEL_SECTION_pn-mesa-xlib="graphic core"
> > >   RECIPE_LAST_UPDATE_pn-mesa-xlib = "Nov 27, 2010"
> > >   RECIPE_MAINTAINER_pn-mesa-xlib="Yu Ke<ke.yu@intel.com>"
> > >
> > > -RECIPE_STATUS_pn-xserver-xf86-dri-lite="green" # no update needed
> > > -RECIPE_LATEST_VERSION_pn-xserver-xf86-dri-lite="1.8.99.904"
> > > -RECIPE_NO_OF_PATCHES_pn-xserver-xf86-dri-lite="2"
> > > -RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xf86-dri-lite="2 monthes"
> > > -RECIPE_LATEST_RELEASE_DATE_pn-xserver-xf86-dri-lite="2010/07/01"
> > > -RECIPE_INTEL_SECTION_pn-xserver-xf86-dri-lite="graphic core"
> > > -RECIPE_LAST_UPDATE_pn-xserver-xf86-dri-lite = "Jan 18, 2011"
> > > -RECIPE_MAINTAINER_pn-xserver-xf86-dri-lite="Yu Ke<ke.yu@intel.com>"
> > > +RECIPE_STATUS_pn-xserver-xorg="green" # no update needed
> > > +RECIPE_LATEST_VERSION_pn-xserver-xorg="1.8.99.904"
> > > +RECIPE_NO_OF_PATCHES_pn-xserver-xorg="2"
> > > +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xorg="2 monthes"
> > > +RECIPE_LATEST_RELEASE_DATE_pn-xserver-xorg="2010/07/01"
> > > +RECIPE_INTEL_SECTION_pn-xserver-xorg="graphic core"
> > > +RECIPE_LAST_UPDATE_pn-xserver-xorg = "Jan 18, 2011"
> > > +RECIPE_MAINTAINER_pn-xserver-xorg="Yu Ke<ke.yu@intel.com>"
> > >
> > >   RECIPE_STATUS_pn-xf86-input-synaptics = "red"
> > >   DISTRO_PN_ALIAS_pn-xf86-input-synaptics = "Meego=xorg-x11-drv-synaptics Fedora=xorg-x11-drv-synaptics Ubuntu=xserver-xorg-input-synaptics Mandriva=x11-driver-input-synaptics Debian=xfree86-driver-synaptics"
> > > @@ -5908,8 +5908,8 @@ DISTRO_PN_ALIAS_pn-pseudo = "Windriver"
> > >
> > >   DISTRO_PN_ALIAS_pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-progs"
> > >   DISTRO_PN_ALIAS_pn-rt-tests = "Debian=rt-tests Ubuntu=rt-tests"
> > > -DISTRO_PN_ALIAS_pn-xserver-xf86-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
> > > -DISTRO_PN_ALIAS_pn-xserver-xf86-dri-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
> > 
> > Hi Martin,
> > > +DISTRO_PN_ALIAS_pn-xserver-xorg = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
> > I guess this should be xserver-xorg-lite.
> > 
> > Regards,
> > Kai
> 
> You're right, I've added patch for that on top of jansa/x11-v2.
> 
> RP: I'll squash it to 01/31 if you want, but I didn't want to rebase as
> you already have it in master-next.. so it's on top.

Thats great, thanks. I've squashed it into master-next.

Cheers,

Richard



