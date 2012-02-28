Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2EuV-0003sX-W0
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 05:43:36 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Feb 2012 20:34:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="112478570"
Received: from unknown (HELO [10.255.15.37]) ([10.255.15.37])
	by orsmga001.jf.intel.com with ESMTP; 27 Feb 2012 20:34:50 -0800
Message-ID: <4F4C596A.3050301@linux.intel.com>
Date: Mon, 27 Feb 2012 20:34:50 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1330050435-28527-1-git-send-email-obi@opendreambox.org>
	<1330115481-11625-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1330115481-11625-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH v2] libsdl: add DirectFB support
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
X-List-Received-Date: Tue, 28 Feb 2012 04:43:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2012 12:31 PM, Andreas Oberritter wrote:
> * Use conditional dependencies for DirectFB, like
>    it's already done for OpenGL and X11.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
> * Rebased after X11 was already made conditional.
>
>   meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |    6 ++++--
>   1 files changed, 4 insertions(+), 2 deletions(-)
>
No PR Bump!

Sau!

> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> index 62a2d1f..94df358 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> @@ -12,7 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
>
>   PROVIDES = "virtual/libsdl"
>
> -DEPENDS = "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
> +DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
> +           ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
>              ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
>              tslib"
>   DEPENDS_virtclass-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk', '', d)}"
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


