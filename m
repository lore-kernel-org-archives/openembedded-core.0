Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3C45977D36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 14:39:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2017 07:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="857467992"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by FMSMGA003.fm.intel.com with ESMTP; 16 May 2017 07:39:56 -0700
Date: Tue, 16 May 2017 17:39:54 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <20170516143953.GA16062@mbabyjoh-desk.ger.corp.intel.com>
References: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
	<1494933979-5139-5-git-send-email-dv@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <1494933979-5139-5-git-send-email-dv@pseudoterminal.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/9] gstreamer1.0-plugins-ugly: upgrade to version 1.12.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 May 2017 14:39:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, May 16, 2017 at 01:26:15PM +0200, Carlos Rafael Giani wrote:
> * libmad plugin was removed in 1.12.0, since mad is GPLed, unmaintained,
>   and both gst-libav & the mpg123 plugin are fully functional alternatives
> 
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc       | 1 -
>  ...1.0-plugins-ugly_1.10.4.bb => gstreamer1.0-plugins-ugly_1.12.0.bb} | 4 ++--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.10.4.bb => gstreamer1.0-plugins-ugly_1.12.0.bb} (76%)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
> index 708ad7a..60aa968 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
> @@ -18,7 +18,6 @@ PACKAGECONFIG[amrwb]    = "--enable-amrwb,--disable-amrwb,opencore-amr"
>  PACKAGECONFIG[cdio]     = "--enable-cdio,--disable-cdio,libcdio"
>  PACKAGECONFIG[dvdread]  = "--enable-dvdread,--disable-dvdread,libdvdread"
>  PACKAGECONFIG[lame]     = "--enable-lame,--disable-lame,lame"
> -PACKAGECONFIG[mad]      = "--enable-mad,--disable-mad,libmad"
>  PACKAGECONFIG[mpeg2dec] = "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
>  PACKAGECONFIG[mpg123]   = "--enable-mpg123,--disable-mpg123,mpg123"
>  PACKAGECONFIG[x264]     = "--enable-x264,--disable-x264,x264"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.0.bb
> similarity index 76%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.4.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.0.bb
> index 92a2caa..3bf9a9c 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.4.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.0.bb
> @@ -7,7 +7,7 @@ SRC_URI = " \
>      http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
>      file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
>  "
> -SRC_URI[md5sum] = "c68d0509c9980b0b70a4b836ff73fff1"
> -SRC_URI[sha256sum] = "6386c77ca8459cba431ed0b63da780c7062c7cc48055d222024d8eaf198ffa59"
> +SRC_URI[md5sum] = "30e815834819a4890eb1ef6ef67cf68d"
> +SRC_URI[sha256sum] = "5e68ba5046e83ee87b17d7a13931e6091466fd771e1338c5b929ee0944d40ad6"
>  
>  S = "${WORKDIR}/gst-plugins-ugly-${PV}"

For gstreamer1.0-plugins-ugly, we can remove the build dependency on "libid3tag" since it
is not needed anymore.

Best Regards,
Maxin

