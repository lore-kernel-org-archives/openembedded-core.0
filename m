Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7UBG-0004WF-Fv
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 17:02:34 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Mar 2012 08:53:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="120606720"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by orsmga002.jf.intel.com with ESMTP; 13 Mar 2012 08:53:49 -0700
Message-ID: <4F5F6D8C.3030106@linux.intel.com>
Date: Tue, 13 Mar 2012 08:53:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F4C596A.3050301@linux.intel.com>
	<1330428268-9338-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1330428268-9338-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH v3] libsdl: add DirectFB support
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
X-List-Received-Date: Tue, 13 Mar 2012 16:02:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/2012 03:24 AM, Andreas Oberritter wrote:
> * Use conditional dependencies for DirectFB, like
>    it's already done for OpenGL and X11.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
> * v2: Rebased after X11 was already made conditional.
> * v3: Add back PR bump, which was auto-merged during rebase.
>
>   meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |    8 +++++---
>   1 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> index 62a2d1f..5c9e645 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> @@ -12,12 +12,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
>
>   PROVIDES = "virtual/libsdl"
>
> -DEPENDS = "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
> +DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
> +           ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
>              ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
>              tslib"
>   DEPENDS_virtclass-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk', '', d)}"
>
> -PR = "r6"
> +PR = "r7"
>
>   SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
>              file://configure_tweak.patch \
> @@ -35,9 +36,10 @@ EXTRA_OECONF = "--disable-static --disable-debug --enable-cdrom --enable-threads
>                   --enable-file --disable-oss --disable-esd --disable-arts \
>                   --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
>                   --disable-mintaudio --disable-nasm --disable-video-dga \
> -                --disable-video-fbcon --disable-video-directfb --disable-video-ps2gs --disable-video-ps3 \
> +                --disable-video-fbcon --disable-video-ps2gs --disable-video-ps3 \
>                   --disable-video-xbios --disable-video-gem --disable-video-dummy \
>                   --enable-input-events --enable-input-tslib --enable-pthreads \
> +                ${@base_contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
>                   ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
>                   ${@base_contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
>                   --disable-video-svga \

Merged into OE-Core

Thanks
	Sau!


