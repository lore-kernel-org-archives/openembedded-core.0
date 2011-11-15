Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQIFI-0005aL-Vi for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 13:36:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAFCTmD6025275
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 12:29:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24931-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 12:29:44 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAFCTfJ2025269
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 12:29:42 GMT
Message-ID: <1321360186.26881.181.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 15 Nov 2011 12:29:46 +0000
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH][oe-core 00/22] QT4, thumb, subversion, mesa, libsdl, time, util-linux, kbd changes
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
X-List-Received-Date: Tue, 15 Nov 2011 12:36:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-11-11 at 17:28 +0100, Martin Jansa wrote:
> Martin Jansa:
>   libatomics-ops: force ARM mode
>   pulseaudio-0.9.23: force ARM mode
>   aspell: force ARM mode
>   webkit-gtk: force arm mode to work around binutils segfault
>   subversion: add 1.7.0 with native support and negative D_P for now
>  alsa-lib: add nativesdk BBCLASSEXTEND
>  time: rename files dir to time-1.7 for faster lookup
>   time: drop default S and 2 useless comments
>   time: use u-a for time, conflicts with busybox
>   util-linux: use u-a for flock and blockdev, conflicts with busybox
>   util-linux: add missing u-a calls for setsid chrt
>   util-linux: bump PR after u-a changes
>   kbd: use u-a for chvt, deallocvt, fgconssole, openvt, conflicts with
>     busybox
>  
> Simon Busch (1):
>   qt4-x11-free: bring back pkg-config fixups

The above have all merged.

>   base.bbclass: add subversion-native to DEPENDS if there is svn:// in
>     SRC_URI

I've taken this but I've also fixed the default ASSUME_PROVIDED to
include subversion-native instead of svn-native in bitbake.conf. This
may need some further thought but at least the system is more correct
now.

>   mesa: package gl/egl/osmesa to separate packages

This one I really want to take but there are some PR bumps missing or
some renaming missing somewhere as its causing build issues :/. I'm
holding off until these are tracked down.

>   mesa-common: install internal GL headers to libgl-dev

This one is a WIP.

>   libsdl: drop unused files
>   libsdl: rename files dir to libsdl-1.2.14 for faster lookup
>   libsdl: enable cdrom, alsa and tslib, disable rpath and add few fixes
>     from meta-oe
>   libsdl: enable alsa/opengl based on PACKAGECONFIG and respect
>     DISTRO_FEATURES
>   libsdl: replace tabs with spaces

There were some issues Saul was seeing around libsdl so I've left these
for now as we're having a few too many build issues atm :/.

Cheers,

Richard




