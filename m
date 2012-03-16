Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8adP-0002KA-9E for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 18:08:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GGxMTg005513;
	Fri, 16 Mar 2012 16:59:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04815-06; Fri, 16 Mar 2012 16:59:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GGxEhK005507
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 16 Mar 2012 16:59:15 GMT
Message-ID: <1331917154.18586.207.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Mar 2012 16:59:14 +0000
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/60] Package Upgrade
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
X-List-Received-Date: Fri, 16 Mar 2012 17:08:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-16 at 08:52 +0800, Shane Wang wrote:
> Upgrade recipes for M4. Please review.
> 
> The following changes since commit bd2d8904181aa67258b6be8a7bbeaf8d12a8dd5a:
> 
>   xorg-xserver: Explictly disable dtrace, its not in DEPENDS (2012-03-12 17:45:41 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib shane/m4upgrade
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/m4upgrade
> 
> Dongxiao Xu (1):
>   dbus-glib: upgrade to 0.98
> 
> Shane Wang (59):
>   distro_tracking: update the recipe info for manual check
>   glib-2.0: upgrade to 2.30.3
>   gdk-pixbuf: upgrade to 2.24.1
>   glproto: update its info in distro tracking
>   libvorbis: upgrade to 1.3.3
>   tremor: upgrade to 18221
>   alsa-lib: upgrade to 1.0.25
>   alsa-utils: upgrade to 1.0.25
>   telepathy-glib: upgrade to 0.17.5
>   telepathy-mission-control: upgrade to 5.11.0
>   ofono: upgrade to 1.5
>   bluez4: upgrade to 4.99
>   bluez-hcidump: upgrade to 2.3
>   gst-plugin-bluetooth: upgrade to 4.99
>   gstreamer: upgrade to 0.10.36
>   gst-plugins-base: upgrade to 0.10.36
>   gst-plugins-good: upgrade to 0.10.31
>   gst-plugins-bad: upgrade to 0.10.23
>   gst-plugins-ugly: upgrade to 0.10.19
>   libpcap: upgrade to 1.2.1
>   busybox: upgrade to 1.19.4
>   curl: upgrade to 7.24.0
>   dropbear: upgrade to 2012.55
>   avahi: upgrade to 0.6.31
>   avahi-ui: upgrade to 0.6.31
>   apr: upgrade to 1.4.6
>   minicom: upgrade to 2.6.1
>   tzdata: upgrade to 2012b
>   util-macros: upgrade to 1.17
>   libxcursor: upgrade to 1.1.13
>   libxinerama: upgrade to 1.1.2
>   libsm: upgrade to 1.2.1
>   libxkbfile: upgrade to 1.0.8
>   libice: upgrade to 1.0.8
>   pixman: upgrade to 0.25.2
>   libxdmcp: upgrade to 1.1.1
>   libXxf86vm: upgrade to 1.1.2
>   libXrender: upgrade to 0.9.7
>   libxpm: upgrade to 3.5.10
>   libXext: upgrade to 1.3.1
>   libXv: upgrade to 1.0.7
>   libxt: upgrade to 1.1.2
>   libXmu: upgrade to 1.1.1
>   libfontenc: upgrade to 1.1.1
>   libxscrnsaver: upgrade to 1.2.2
>   libxau: upgrade to 1.0.7
>   libdmx: upgrade to 1.1.2
>   libxft: upgrade to 2.3.0
>   libxtst: upgrade to 1.2.1
>   libpciaccess: upgrade to 0.13
>   libXvMC: upgrade to 1.0.7
>   libxfont: upgrade to 1.4.5
>   libxres: upgrade to 1.0.6
>   inputproto: upgrade to 2.2
>   font-util: upgrade to 1.3.0
>   libxcb: upgrade to 1.8.1
>   libxi: upgrade to 1.4.5
>   distro_tracking: update the info of the recipes upgraded in the round
>   distro_tracking: update those NOT UPDATE REASON

So far I've noticed a few issues. This log has several of them:

http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/316/steps/shell_33/logs/stdio

alsa-utils has patch application issues
libxxf86dg won't fetch due to a patch issue
libpciaccess won't build on mips.

In my own build logs I also noticed:

WARNING: Missing sha256 SRC_URI checksum for /media/build1/sources/gdk-pixbuf-2.24.1.tar.xz, consider adding to the recipe:
SRC_URI[sha256sum] = "da7a3f00db360913716368e19e336402755cafa93769f3cfa28a969303e4bee1"

Cheers,

Richard





