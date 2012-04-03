Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFAme-0003Cc-Dz
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 22:56:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Apr 2012 13:47:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125000249"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2012 13:47:45 -0700
Message-ID: <4F7B61F1.8070401@linux.intel.com>
Date: Tue, 03 Apr 2012 13:47:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331856008-21536-1-git-send-email-user@dromedary>
In-Reply-To: <1331856008-21536-1-git-send-email-user@dromedary>
Subject: Re: [PATCH 1/5] xcb_util.inc: Remove packaging and modify SRC_URI for multiple ${BPN} names
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
X-List-Received-Date: Tue, 03 Apr 2012 20:56:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/15/2012 05:00 PM, Marko Katic wrote:
> Xcb-util was split into separate packages during the 0.3.6 ->  0.3.8 transition.
> Update xcb_util.inc to reflect that by removing the older packaging.
> Libxcbatom, libxcbaux and libxcbevent are merged into libxcbutil.
> Libxcbicccm, libxcbimage, libxcbkeysyms and libxcbwm are now separate packages.
> Libxcbproperty and libxcbreply were made obsolete with this commit:
>
> http://cgit.freedesktop.org/xcb/util/commit/?id=81c62e7a04213abefa1ea82819887aaaa3c31a74
> ---
>   meta/recipes-graphics/xcb/xcb-util.inc |   16 +---------------
>   1 files changed, 1 insertions(+), 15 deletions(-)
>
> diff --git a/meta/recipes-graphics/xcb/xcb-util.inc b/meta/recipes-graphics/xcb/xcb-util.inc
> index cd9923d..7dad545 100644
> --- a/meta/recipes-graphics/xcb/xcb-util.inc
> +++ b/meta/recipes-graphics/xcb/xcb-util.inc
> @@ -18,20 +18,6 @@ DEPENDS += "gperf-native"
>
>   PARALLEL_MAKE = ""
>
> -SRC_URI = "http://xcb.freedesktop.org/dist/xcb-util-${PV}.tar.bz2"
> -
> -PACKAGES =+ "libxcbatom libxcbaux libxcbevent libxcbicccm \
> -             libxcbimage libxcbkeysyms libxcbproperty \
> -             libxcbreply libxcbwm"
> -
> -FILES_libxcbatom = "${libdir}/libXCBAtom.so.*"
> -FILES_libxcbaux = "${libdir}/libXCBAux.so.*"
> -FILES_libxcbevent = "${libdir}/libXCBEvent.so.*"
> -FILES_libxcbicccm = "${libdir}/libXCBICCCM.so.*"
> -FILES_libxcbimage = "${libdir}/libXCBImage.so.*"
> -FILES_libxcbkeysyms = "${libdir}/libXCBKeysyms.so.*"
> -FILES_libxcbproperty = "${libdir}/libXCBProperty.so.*"
> -FILES_libxcbreply = "${libdir}/libXCBReply.so.*"
> -FILES_libxcbwm = "${libdir}/libXCBWM.so.*"
> +SRC_URI = "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.bz2"
>
>   inherit autotools pkgconfig

Merged into OE-Core

Thanks
	Sau!


