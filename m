Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 47CEE60810;
	Wed, 19 Jun 2013 08:20:13 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5J8QIcC006995; Wed, 19 Jun 2013 09:26:19 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dAUdtSRm1Y1N; Wed, 19 Jun 2013 09:26:18 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5J8QDn9006989
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 19 Jun 2013 09:26:14 +0100
Message-ID: <1371629995.20823.166.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@paulbarker.me.uk>, Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 19 Jun 2013 09:19:55 +0100
In-Reply-To: <CANyK_8fMj+=hDVMV+q7CJi7_G5HvztE+n_wcHDn0kTUB7dxFhA@mail.gmail.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama>
	<CANyK_8fMj+=hDVMV+q7CJi7_G5HvztE+n_wcHDn0kTUB7dxFhA@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: State of bitbake world
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
X-List-Received-Date: Wed, 19 Jun 2013 08:20:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-06-19 at 09:07 +0100, Paul Barker wrote:
> On 11 June 2013 17:04, Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > qemuarm Summary: 14 tasks failed:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130610_065148.log/
> >
> > qemux86 Summary: 17 tasks failed:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130608_071258.log/
> >
> > qemux86-64 Summary: 18 tasks failed:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130609_081044.log/
> >
> 
> Thought I'd post a summary of what fails for MACHINE=raspberrypi at the minute:
> 
>     meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb,
> do_compile
>     openembedded-core/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb,
> do_compile
>     openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, do_compile
>     meta-openembedded/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb,
> do_compile
>     openembedded-core/meta/recipes-graphics/wayland/weston_1.1.0.bb, do_compile
>     meta-openembedded/meta-oe/recipes-support/gperftools/gperftools_2.0.bb,
> do_compile
>     openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb,
> do_configure
>     meta-raspberrypi/recipes-multimedia/omxplayer/omxplayer_git.bb, do_compile
>     meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.1.bb,
> do_compile
>     meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb,
> do_compile
>     meta-openembedded/meta-oe/recipes-support/mg/mg_20110905.bb, do_configure
>     openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.7.bb,
> do_compile
> 
> A lot of these are related to missing vcos_platform_types.h
> (https://github.com/raspberrypi/firmware/issues/34).
> 
> luajit is rather a strange error, HOST_CC can't find <sys/types.h> or
> some other common headers.
> 
> mplayer2 is failing to find <mad.h>, this needs the same sort of fix I
> made to vlc (http://git.openembedded.org/meta-openembedded/commit/?id=3d6369b7c39d78b0d424dbe5a97e736b694e3c48).
> 
> Full logs, conf files, etc: http://www.paulbarker.me.uk/yocto/20130617_poky/
> 
> Note that for the final build everything in "fixes/" has been applied,
> including Khem's patches for gypsy, omgps, packagekit and tk.

Removing the linux-libc-headers recipe from mate-raspberrypi might just
help some of the headers issues. I posted a patch for this a while back
but it wasn't merged, neither was my kernel fix for i2c:

https://lists.yoctoproject.org/pipermail/yocto/2013-April/015581.html
https://lists.yoctoproject.org/pipermail/yocto/2013-April/015582.html

Cheers,

Richard


