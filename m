Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0mhW-0003po-0i
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 05:24:10 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 20:15:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128886470"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 20:15:47 -0800
Message-ID: <4F470EF3.9060201@linux.intel.com>
Date: Thu, 23 Feb 2012 20:15:47 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1329519371-12600-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1329519371-12600-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH 1/2] gst-plugins-base: depend on libx11 and libxv conditionally
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
X-List-Received-Date: Fri, 24 Feb 2012 04:24:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/17/2012 02:56 PM, Andreas Oberritter wrote:
> * gst-plugins-base currently doesn't build if x11 is
>    unavailable, due to unconditional dependencies on libx11
>    and libxv. However, they are not required to build
>    gst-plugins-base.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   .../gstreamer/gst-plugins-base_0.10.35.bb          |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
> index e49a00c..0b287bc 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
> @@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>                       file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
>                       file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
>
> -DEPENDS += "virtual/libx11 alsa-lib freetype liboil libogg libvorbis libxv libtheora avahi util-linux tremor"
> +DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv', '', d)}"
> +DEPENDS += "alsa-lib freetype liboil libogg libvorbis libtheora avahi util-linux tremor"
>
>   SRC_URI += " file://gst-plugins-base-tremor.patch"
>

Merged into OE-core


Thanks
	Sau!


