Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Sh9ax-0002pl-8l
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 03:20:31 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:60348 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Sh9Qa-0002HI-Kj for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 21:09:48 -0400
Date: Tue, 19 Jun 2012 21:09:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAMKF1sqtH_Va4w8ayxm+Qi0pH_2xmeFnMcHLHUB57uQAZp=5bw@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1206192107460.6294@oneiric>
References: <alpine.DEB.2.02.1206191652560.3440@oneiric>
	<CAMKF1sqtH_Va4w8ayxm+Qi0pH_2xmeFnMcHLHUB57uQAZp=5bw@mail.gmail.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [PATCH] Simplify "SRC_URI_append +=" to "SRC_URI_append ="
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
X-List-Received-Date: Wed, 20 Jun 2012 01:20:31 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 19 Jun 2012, Khem Raj wrote:

> Thanks for doing this
>
> On Tue, Jun 19, 2012 at 1:54 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> > +SRC_URI_append_poky = " file://owl-menu.patch;apply=yes "
>
> while you are at it can you remove apply=yes from there ?
> since thats the default anyway for files ending in .patch

  i can do that as a separate patch since they're logically two
different cleanups, and there's enough of the latter to justify
another patch.

$ grep -r "patch;apply=yes" *
meta/recipes-connectivity/portmap/portmap.inc:	file://make.patch;apply=yes"
meta/recipes-support/icu/icu-3.6.inc:           file://gccfix.patch;apply=yes \
meta/recipes-support/icu/icu-3.6.inc:           file://use-g++-for-linking.patch;apply=yes"
meta/recipes-support/icu/icu-3.6.inc:           file://noldlibpath.patch;apply=yes"
meta/recipes-support/libcroco/libcroco_0.6.3.bb:SRC_URI_append = " file://croco.patch;apply=yes \
meta/recipes-core/eggdbus/eggdbus_0.6.bb:          file://gtk-doc.patch;apply=yes \
meta/recipes-core/eggdbus/eggdbus_0.6.bb:           file://marshal.patch;apply=yes \
meta/recipes-graphics/xorg-proto/calibrateproto_git.bb:           file://fix.patch;apply=yes"
meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb:        file://link-x11.patch;apply=yes \
meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI_append_poky += " file://owl-menu.patch;apply=yes "
meta/recipes-sato/pimlico/contacts.inc:SRC_URI_append_poky = " file://contacts-owl-window-menu.patch;apply=yes "
meta/recipes-sato/pimlico/dates.inc:SRC_URI_append_poky = " file://dates-owl-window-menu.patch;apply=yes "
meta/recipes-sato/settings-daemon/settings-daemon_git.bb:           file://addsoundkeys.patch;apply=yes \
$


rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


