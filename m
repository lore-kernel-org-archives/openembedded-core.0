Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDDCb-0007Y6-1f for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 12:35:25 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9AAaEdO013151 for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 11:36:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id q2VFsGiSxey8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 11:36:14 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9AAaA9a013140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 11:36:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 10 Oct 2011 11:29:29 +0100
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318242579.23801.12.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCHv3 00/31] Xorg related changes
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
X-List-Received-Date: Mon, 10 Oct 2011 10:35:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-07 at 19:05 +0200, Martin Jansa wrote:
> this patchset brings meta-oe and oe-core xorg stuff together and most of
> xorg recipes will be removed from meta-oe (sending another pull request now).
> 
> This step is needed to be able to separate common x11 to meta-x11 or whatever later.
> 
> The following changes since commit 808b3123e359f1aebabb8af44694275e4075e031:
> 
>   gnutls: Disable p11-kit dependency explicitly to resolve build failures (2011-10-07 15:40:42 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib jansa/x11-v2
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/x11-v2
> 
> Martin Jansa (31):
>   xserver-xf86(-dri)-lite: rename to xserver-xorg and xserver-xorg-lite
>   xserver-xorg: remove old git recipe
>   glx-use-tls.inc: add include file to enable glx-tls only when
>     TARGET_OS isn't uclibc
>   xserver-xorg-common: fix LIC_FILES_CHKSUM
>   xserver-xorg-common: move SRC_URI closer together
>   xserver-xorg-common: Split out some bigger modules and extensions
>     from the main package
>   xserver-xorg-common: improve packaging
>   xserver-xorg-common: move shared PROTO_DEPS and LIB_DEPS from
>     xserver-xorg.inc and xserver-xorg-lite.inc to
>     xserver-xorg-common.inc
>   xserver-xorg-common: lower xserver-xf86-config and xkeyboard-config
>     dependency to RRECOMMENDS  and add few more recipes to RRECOMMENDS
>   xserver-xorg-common: move RDEPENDS_${PN} += xorg-minimal-fonts to
>     shared .inc
>   xserver-xorg: remove FILES_${PN} += "${bindir}/Xorg ", now we have
>     whole ${bindir} in FILES_ defined in shared .inc
>   xserver-xorg: replace hardcoded --enable-glx-tls with
>     glx-use-tls.inc, which doesn't enable it for uClibc
>   xserver-xorg: move shared EXTRA_OECONF entries to shared .inc
>   xserver-xorg: add new version 1.11.1
>   xserver-xorg: remove old 1.10.1 version
>   xserver-xorg: remove COMPATIBLE_HOST
>   xserver-xorg: drop unused files
>   xserver-xorg: move patches to xserver-xf86-dri-lite-1.11.1 and use
>     same directory from xserver-xf86-lite recipe
>   xserver-kdrive: drop unused files (same files are in
>     xserver-kdrive-1.7.99.2 directory
>   xorg-driver-common.inc: use virtual/xserver instead of older
>     virtual/xserver-xf86
>   xorg-driver-common.inc: bump INC_PR to rebuild drivers agains new
>     xserver-xorg ABI
>   libx11: package xcb, merge few changes from meta-oe
>   libx11: add new version 1.4.4
>   libx11: remove older 1.3.4
>   libx11: drop old 1.2.2 git version
>   libx11-trim: move files for libx11-trim from libx11-1.3.4 to
>     libx11-trim-1.3.4
>   libx11-diet: move old patches used only by libx11-diet-1.3 to
>     separate directory
>   mesa: add mesa-dri.inc and mesa-xlib.inc with shared options, move
>     uclibc.patch
>   mesa-dri-glsl-native: drop recipe which wasn't usefull since 7.8.2
>     was removed
>   mesa: add new version 7.11
>   mesa: drop older 7.10.2 and 7.7+git recipes

I love the xserver patches, this series is much easier to review than
the previous ones. I appreciate the work that's gone into it and I'll
likely take those.

I'll also likely take the libx11 pieces however I notice upgrades for
libx11-trim and libx11-diet are missing.

I've therefore queued both pieces on master-next for a bit more testing.

One other thing that did concern me is the removal of the git recipes. I
know why you've done it and I'll take the patches however I would like
to get back to the point that "bleeding" builds work and this isn't
going to help with that :/.

I haven't got as far as the mesa patches yet. Those aren't as easy to
follow and I've probably enough to test with the above changes right at
this moment.

Cheers,

Richard




