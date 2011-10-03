Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RAgD5-0000qD-Fi for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 12:57:23 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p93AwHXM008742 for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Oct 2011 11:58:17 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uS8DxBj9Khng
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 11:58:17 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p93AwEUZ008725
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Oct 2011 11:58:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 03 Oct 2011 11:51:45 +0100
In-Reply-To: <20111003103855.GN7364@jama.jama.net>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
	<1317382126.12332.167.camel@ted> <20111003103855.GN7364@jama.jama.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317639113.4454.72.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 00/13] Xorg related changes
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
X-List-Received-Date: Mon, 03 Oct 2011 10:57:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-03 at 12:38 +0200, Martin Jansa wrote:
> On Fri, Sep 30, 2011 at 12:28:39PM +0100, Richard Purdie wrote:
> > On Fri, 2011-09-30 at 09:26 +0200, Martin Jansa wrote:
> > > Hi,
> > > 
> > > this patchset brings meta-oe and oe-core xorg stuff together and most of 
> > > xorg recipes will be removed from meta-oe (sending another pull request now).
> > > 
> > > This step is needed to be able to separate common x11 to meta-x11 or whatever later.
> > > 
> > > The following changes since commit 96241de59fdf548ae0f80cc9e4668f9ba11924ef:
> > > 
> > >   Fix flac build on e500mc cores (2011-09-29 19:31:38 +0100)
> > > 
> > > are available in the git repository at:
> > >   git://git.openembedded.org/openembedded-core-contrib jansa/x11
> > >   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/x11
> > > 
> > > Martin Jansa (13):
> > >  xorg-driver: rename .inc files and merge some changes from meta-oe
> > >  libxft, libxrender, renderproto: add native BBCLASSEXTEND
> > >  xorg-app-common: merge some changes from meta-oe
> > >  xf86-video-omapfb: bump SRCREV and add patch from meta-oe
> > >  rgb: import from meta-oe layer
> > >  libdrm: improve packaging
> > 
> > I'll take these ones. I've queued them on a master-next branch for now
> > as I want to give other people some time to comment on them. If there
> > isn't negative feedback I'll take them in ~24 hours.
> > 
> > I've given feedback on why I think these need further work:
> > 
> > >   xserver-xf86: upgrade to 1.11.0 and move shared definitions to .inc
> > >     files
> > >   xserver-xf86-dri-lite: remove COMPATIBLE_HOST
> > >   libx11: upgrade to 1.4.4
> > >   default-providers: define PREFERRED_PROVIDER_virtual/libx11-native
> > >   xserver-nodm-init: merge some changes from meta-oe
> > >  glx-use-tls: add from meta-oe layer
> > >  mesa: upgrade to 7.11
> 
> I've updated jansa/x11 branch according to your comments, now 17 patches
> instead of 7 :).
> 
> Before I send updated pull-request, what do you think about renaming
> xserver-xf86 to xserver-xorg which is closer to upstream naming and
> that's how it's named in OE-classic and meta-oe? It would make meta-oe
> transition easier and better to do it now then convert meta-oe to
> xserver-xf86 and then rename it back later.

I'm ok with renaming it. I think the historical reasons for the
differences don't matter now.

Cheers,

Richard



