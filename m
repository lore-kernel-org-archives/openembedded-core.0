Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiP2f-0002VX-29 for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 12:30:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04BMcuF017841;
	Wed, 4 Jan 2012 11:22:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16060-09; Wed,  4 Jan 2012 11:22:33 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04BMSkX017835
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 4 Jan 2012 11:22:29 GMT
Message-ID: <1325676148.3555.127.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 11:22:28 +0000
In-Reply-To: <4F03A2A3.80408@intel.com>
References: <cover.1325145929.git.edwin.zhai@intel.com>
	<4F0395C0.4020805@linux.intel.com> <4F03A2A3.80408@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] Bug fixes
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
X-List-Received-Date: Wed, 04 Jan 2012 11:30:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 08:51 +0800, Zhai, Edwin wrote:
> On 01/04/2012 07:56 AM, Saul Wold wrote:
> > On 12/29/2011 12:09 AM, edwin.zhai@intel.com wrote:
> >> From: Zhai Edwin<edwin.zhai@intel.com>
> >>
> >> All,
> >> Patch of gnome-keyring to fix gsettings-data-convert seg fault,
> >> modified according to Saul's comments.
> >> Another patch of matchbox-wm to remove the dependence between window
> >> manager and X session.
> >>
> >> The following changes since commit
> >> 6a1b5c28f22bb07a0b7102eb88441d05768ec52e:
> >>
> >> self-hosted-image: Add builder user and mini X (2011-12-29 10:42:07
> >> +0800)
> >>
> >> are available in the git repository at:
> >> git://git.pokylinux.org/poky-contrib gzhai/build-appliance2
> >> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/build-appliance2
> >>
> >>
> >> Zhai Edwin (2):
> >> gnome-keyring: fix gsettings_data_convert seg fault
> >
> > Merged this one to OE-Core
> >
> >> matchbox-wm: Remove x-session-manager handling
> >>
> > We need a little more explaintion about why you are removing the U-A
> > code from the matchbox-wm?
> 
> matchbox-wm should not handles x-session, or else it conflict with 
> mini-x-session. i.e. mini-x-session set x-session to mini-X, then 
> matchbox-wm overrides it as matchbox-session. Without matchbox-session 
> installed, mini-X fail start.
> 
> I have tested this patch and found no regression...

What I don't understand is that this is using update-alternatives so
surely you can just install an alternative that overrides this?

Looking at the code, shouldn't we move this alternative to the
matchbox-session recipe?

Cheers,

Richard



