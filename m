Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S5jT4-0005dj-Qd for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 20:57:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q28Jn4dZ029707
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Mar 2012 19:49:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22367-07 for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2012 19:49:00 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q28Jmo8J029699
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Mar 2012 19:48:56 GMT
Message-ID: <1331236127.3006.25.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Mar 2012 11:48:47 -0800
In-Reply-To: <0a7f4aff02e826c34a77d198414484615f2d039a.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
	<0a7f4aff02e826c34a77d198414484615f2d039a.1331053126.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 01/20] libsdl: add DirectFB support
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
X-List-Received-Date: Thu, 08 Mar 2012 19:57:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-03-06 at 09:03 -0800, Saul Wold wrote:
> From: Andreas Oberritter <obi@opendreambox.org>
> 
> * Use conditional dependencies for DirectFB, like
>   it's already done for OpenGL and X11.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |    8 +++++---
>  1 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> index 62a2d1f..5c9e645 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> @@ -12,12 +12,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
>  
>  PROVIDES = "virtual/libsdl"
>  
> -DEPENDS = "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
> +DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
> +           ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
>             ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
>             tslib"
>  DEPENDS_virtclass-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk', '', d)}"
>  
> -PR = "r6"
> +PR = "r7"
>  
>  SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
>             file://configure_tweak.patch \
> @@ -35,9 +36,10 @@ EXTRA_OECONF = "--disable-static --disable-debug --enable-cdrom --enable-threads
>                  --enable-file --disable-oss --disable-esd --disable-arts \
>                  --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
>                  --disable-mintaudio --disable-nasm --disable-video-dga \
> -                --disable-video-fbcon --disable-video-directfb --disable-video-ps2gs --disable-video-ps3 \
> +                --disable-video-fbcon --disable-video-ps2gs --disable-video-ps3 \
>                  --disable-video-xbios --disable-video-gem --disable-video-dummy \
>                  --enable-input-events --enable-input-tslib --enable-pthreads \
> +                ${@base_contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
>                  ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
>                  ${@base_contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
>                  --disable-video-svga \

I'm going to take this but in future I'd prefer to see changes like this
starting to use PACKAGECONFIG.

Cheers,

Richard



