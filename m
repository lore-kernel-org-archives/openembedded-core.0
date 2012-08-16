Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T23gS-0006gs-FD
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 19:16:36 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2012 10:03:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,778,1336374000"; d="scan'208";a="181865688"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by azsmga001.ch.intel.com with ESMTP; 16 Aug 2012 10:03:44 -0700
Message-ID: <502D27EF.8020901@linux.intel.com>
Date: Thu, 16 Aug 2012 10:03:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344972403-26049-1-git-send-email-rd@radekdostal.com>
In-Reply-To: <1344972403-26049-1-git-send-email-rd@radekdostal.com>
Cc: Radek Dostal <rd@radekdostal.com>
Subject: Re: [PATCH] gst-plugins-base: remove avahi from DEPENDS
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
X-List-Received-Date: Thu, 16 Aug 2012 17:16:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2012 12:26 PM, Radek Dostal wrote:
> avahi is no longer required as gnome_vfs is disabled
>
> Signed-off-by: Radek Dostal <rd@radekdostal.com>
> ---
>   .../gstreamer/gst-plugins-base_0.10.36.bb          |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
> index da4a726..99f28e9 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>                       file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
>
>   DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv', '', d)}"
> -DEPENDS += "alsa-lib freetype liboil libogg libvorbis libtheora avahi util-linux tremor"
> +DEPENDS += "alsa-lib freetype liboil libogg libvorbis libtheora util-linux tremor"
>
>   SRC_URI += "file://gst-plugins-base-tremor.patch \
>               file://configure.ac-fix-subparse-plugin.patch"
> @@ -15,7 +15,7 @@ SRC_URI += "file://gst-plugins-base-tremor.patch \
>   SRC_URI[md5sum] = "776c73883e567f67b9c4a2847d8d041a"
>   SRC_URI[sha256sum] = "2cd3b0fa8e9b595db8f514ef7c2bdbcd639a0d63d154c00f8c9b609321f49976"
>
> -PR = "r3"On 08/14/2012 12:26 PM, Radek Dostal wrote:> avahi is no longer required as gnome_vfs is disabled
>
> Signed-off-by: Radek Dostal <rd@radekdostal.com>
> ---
>   .../gstreamer/gst-plugins-base_0.10.36.bb          |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
> index da4a726..99f28e9 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>                       file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
>
>   DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv', '', d)}"
> -DEPENDS += "alsa-lib freetype liboil libogg libvorbis libtheora avahi util-linux tremor"
> +DEPENDS += "alsa-lib freetype liboil libogg libvorbis libtheora util-linux tremor"
>
>   SRC_URI += "file://gst-plugins-base-tremor.patch \
>               file://configure.ac-fix-subparse-plugin.patch"
> @@ -15,7 +15,7 @@ SRC_URI += "file://gst-plugins-base-tremor.patch \
>   SRC_URI[md5sum] = "776c73883e567f67b9c4a2847d8d041a"
>   SRC_URI[sha256sum] = "2cd3b0fa8e9b595db8f514ef7c2bdbcd639a0d63d154c00f8c9b609321f49976"
>
> -PR = "r3"
> +PR = "r4"
>
>   inherit gettext
>
>
> +PR = "r4"
>
>   inherit gettext
>
>

Merged into OE-Core

Thanks
	Sau!



