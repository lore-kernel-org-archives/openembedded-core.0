Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVNBg-0001v9-0V; Tue, 29 Nov 2011 13:53:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATCkopl012966;
	Tue, 29 Nov 2011 12:46:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12383-07; Tue, 29 Nov 2011 12:46:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATCkhMl012960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 29 Nov 2011 12:46:44 GMT
Message-ID: <1322570811.3166.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 12:46:51 +0000
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/23] Scooping up Patches
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
X-List-Received-Date: Tue, 29 Nov 2011 12:53:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Thanks for putting this together Saul.

> The following changes since commit 2864ff6a4b3c3f9b3bbb6d2597243cc5d3715939:
> 
>   getVar/setVar cleanups (2011-11-26 22:42:00 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Dexuan Cui (1):
>   coreutils: build and install hostname

This needs to be split up so I didn't take it.

> Julian Pidancet (1):
>   Introduce multiarch DISTRO_FEATURE
> 
> Khem Raj (3):
>   default-distrovars: Define SDK_VERSION and DISTRO_VERSION
>   toolchain-scripts.bbclass: Make it work when TCLIBC=uclibc
>   python-native: Fix gcc compiler detecting logic
> 
> Koen Kooi (3):
>   libjson: add 0.9
>   pulseaudio: update to 1.1, delete 0.9.x
>   opkg-utils: handle 6 digit UID fields properly
> 
> Martin Jansa (2):
>   mesa: package gl/egl/osmesa to separate packages

I took the above.

>   mesa-common: install internal GL headers to libgl-dev

I didn't take this, its a nasty hack.

> Matthew McClintock (2):
>   rpm_5.4.0.bb: Build rpm without xz

I took this.

>   eglibc-initial: Fix kernel headers symlink being wrong

I've fixed the latter differently.

> Nitin A Kamble (2):
>   binutils: upgrade from 2.21.1a to 2.22
>   distro-tracking: update information for binutils & libtool
> 
> Otavio Salvador (1):
>   xserver-xorg: only use --disable-dga in xserver-xorg-lite
> 
> Saul Wold (5):
>   runqemu: look for *-image* to be more flexible for image names
>   distro_tracking: Update manual check dates (readline, gcrypt)
>   tzdata/tzcode: Update tzdata to 2011n
>   intltool: remove XML::Parser check
>   Self Hosted Image: Added Task and Images
> 
> Wenzong Fan (1):
>   distro_tracking: update tracking fields for gettext and eds-tools
> 
> Xiaofeng Yan (2):
>   libx11-trim: update to 1.4.4
>   distro_tracking_fields: update the status

I took these.

Cheers,

Richard



