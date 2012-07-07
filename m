Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SnSQu-0001J5-Ty
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jul 2012 12:40:13 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:51791 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SnSGB-0006W7-ON for openembedded-core@lists.openembedded.org;
	Sat, 07 Jul 2012 06:29:07 -0400
Date: Sat, 7 Jul 2012 06:28:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20120707101549.GI3708@jama.jama.net>
Message-ID: <alpine.DEB.2.02.1207070623560.17992@oneiric>
References: <alpine.DEB.2.02.1207070547020.17784@oneiric>
	<20120707101549.GI3708@jama.jama.net>
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
Subject: Re: wanting to clarify patch mechanics
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
X-List-Received-Date: Sat, 07 Jul 2012 10:40:13 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 7 Jul 2012, Martin Jansa wrote:

> On Sat, Jul 07, 2012 at 06:04:07AM -0400, Robert P. J. Day wrote:
> >
> >   speaking of apply, it would seem that "apply=yes" is redundant, is
> > that correct?  there are a couple dozen examples of that throughout
> > oe-core, mostly in the bash recipe file.  is there anything subtle
> > about that parameter, or is it truly superfluous?
>
> apply=yes is default for *.patch and .diff, for files with other
> extension it's still needed (e.g. those entries in bash)

  ah, that's useful to know, thanks.

> so there is only a few redundant usages in oe-core:
> meta/recipes-connectivity/portmap/portmap.inc:  file://make.patch;apply=yes"
> meta/recipes-core/eggdbus/eggdbus_0.6.bb:          file://gtk-doc.patch;apply=yes \
> meta/recipes-core/eggdbus/eggdbus_0.6.bb:           file://marshal.patch;apply=yes \
> meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb:        file://link-x11.patch;apply=yes \
> meta/recipes-graphics/xorg-proto/calibrateproto_git.bb:           file://fix.patch;apply=yes"
> meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI_append_poky = " file://owl-menu.patch;apply=yes "
> meta/recipes-sato/pimlico/contacts.inc:SRC_URI_append_poky = " file://contacts-owl-window-menu.patch;apply=yes "
> meta/recipes-sato/pimlico/dates.inc:SRC_URI_append_poky = " file://dates-owl-window-menu.patch;apply=yes "
> meta/recipes-sato/settings-daemon/settings-daemon_git.bb:           file://addsoundkeys.patch;apply=yes \
> meta/recipes-support/libcroco/libcroco_0.6.3.bb:SRC_URI_append = " file://croco.patch;apply=yes \
>
> some devs cleanup those when doing upgrades.. if it bothers you enough
> you can send patch removing those...

  it didn't really bother me so much as i just wanted to make sure it
didn't represent something subtle that changed the expected behaviour,
and your earlier explanation clarified that.  i might send a patch
along later.  thanks for the clarification.

  today's going to be a very oe-oriented day so expect more nitpicking
pedantry.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


