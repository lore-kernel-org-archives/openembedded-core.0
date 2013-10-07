Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B94D160FAF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 20:57:47 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r97KvHqQ010061; Mon, 7 Oct 2013 21:57:18 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ROBXGI3BDGev; Mon,  7 Oct 2013 21:57:17 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r97KvDcB010057
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 7 Oct 2013 21:57:15 +0100
Message-ID: <1381179429.29912.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 07 Oct 2013 21:57:09 +0100
In-Reply-To: <20131007131624.GS6240@jama>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
	<CAJTo0LZNNheEJUOU83wj-5LEB43YPSDZoW18fNGpjjSsdWetVQ@mail.gmail.com>
	<20131007131624.GS6240@jama>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 00/14] Deterministic dependencies II
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
X-List-Received-Date: Mon, 07 Oct 2013 20:57:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-10-07 at 15:16 +0200, Martin Jansa wrote:
> On Mon, Oct 07, 2013 at 10:32:13AM +0100, Burton, Ross wrote:
> > On 5 October 2013 13:22, Martin Jansa <martin.jansa@gmail.com> wrote:
> > > Martin Jansa (14):
> > >   gstreamer1.0-libav: Add PACKAGECONFIG for orc
> > >   libunique: Add PACKAGECONFIG for dbus
> > >   aspell: Add PACKAGECONFIG for curses
> > >   xf86-input-synaptics: Add dependency on libxtst
> > >   xdpyinfo: Add dependency on libxcomposite
> > >   matchbox-wm: Add dependency on libxfixes and libxcursor
> > >   telepathy-mission-control: Add PACKAGECONFIG for upower and
> > >     connectivity
> > >   tcl: Add dependency on zlib
> > >   wget: Add dependency on libpcre
> > >   x11vnc: Add PACKAGECONFIG for xinerama
> > >   glib-networking: Add PACKAGECONFIG for p11-kit
> > >   lame: Add dependency on ncurses
> > >   subversion: Add dependency on file for libmagic
> > >   systemd: Add PACKAGECONFIG for cryptsetup
> > 
> > All looks good to me.  Worth noting that the telepathy-mission-control
> > changes will need changing when 5.15.1 onwards is integrated, and it's
> > clear that matchbox-wm needs to share a .inc file.
> 
> matchbox-wm and telepathy-mission-control weren't merged, should I send
> v3 for them?

The others seemed obvious so I took them into the 1.5 release. Those two
were not as obvious so they didn't make the release. I haven't got
around to worrying about 1.6 patches yet...

Cheers,

Richard




