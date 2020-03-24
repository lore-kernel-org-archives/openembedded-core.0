Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1858.1585072704984975477
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 10:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 502D740BCC;
	Tue, 24 Mar 2020 17:58:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0UefRg8auMON; Tue, 24 Mar 2020 17:58:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3268F40BAC;
	Tue, 24 Mar 2020 17:58:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8AF6B1718E9; Tue, 24 Mar 2020 13:58:21 -0400 (EDT)
Date: Tue, 24 Mar 2020 13:58:21 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] gstreamer1.0-plugins-good: add qt5 PACKAGECONFIG
Message-ID: <20200324175821.GW1578@denix.org>
References: <1582252918-89191-1-git-send-email-anuj.mittal@intel.com>
 <1582252918-89191-2-git-send-email-anuj.mittal@intel.com>
MIME-Version: 1.0
In-Reply-To: <1582252918-89191-2-git-send-email-anuj.mittal@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 21, 2020 at 10:41:58AM +0800, Anuj Mittal wrote:
> Instead of disabling unconditionally, add PACKAGECONFIG for
> qt5. Imported from meta-qt5 layer.
> 
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-good_1.16.2.bb                  | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
> index f3e0cee..8b34111 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
> @@ -42,6 +42,7 @@ PACKAGECONFIG[libpng]     = "-Dpng=enabled,-Dpng=disabled,libpng"
>  PACKAGECONFIG[libv4l2]    = "-Dv4l2-libv4l2=enabled,-Dv4l2-libv4l2=disabled,v4l-utils"
>  PACKAGECONFIG[mpg123]     = "-Dmpg123=enabled,-Dmpg123=disabled,mpg123"
>  PACKAGECONFIG[pulseaudio] = "-Dpulse=enabled,-Dpulse=disabled,pulseaudio"
> +PACKAGECONFIG[qt5]        = "-Dqt5=enabled,-Dqt5=disabled,qtbase qtdeclarative qtbase-native"

Does it make oe-core depend on meta-qt5 layer?

What is the policy here for having inter-layer dependencies in DEPENDS vs. 
PACKAGECONFIG without explicitly listing them in LAYERDEPENDS?

-- 
Denys


>  PACKAGECONFIG[soup]       = "-Dsoup=enabled,-Dsoup=disabled,libsoup-2.4"
>  PACKAGECONFIG[speex]      = "-Dspeex=enabled,-Dspeex=disabled,speex"
>  PACKAGECONFIG[taglib]     = "-Dtaglib=enabled,-Dtaglib=disabled,taglib"
> @@ -50,11 +51,6 @@ PACKAGECONFIG[vpx]        = "-Dvpx=enabled,-Dvpx=disabled,libvpx"
>  PACKAGECONFIG[wavpack]    = "-Dwavpack=enabled,-Dwavpack=disabled,wavpack"
>  PACKAGECONFIG[x11]        = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
>  
> -# qt5 support is disabled, because it is not present in OE core, and requires more work than
> -# just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
> -# This is better done in a separate qt5 layer (which then should add a "qt5" packageconfig
> -# in a gstreamer1.0-plugins-good bbappend).
> -
>  EXTRA_OEMESON += " \
>      -Daalib=disabled \
>      -Ddirectsound=disabled \
> @@ -64,7 +60,6 @@ EXTRA_OEMESON += " \
>      -Doss4=disabled \
>      -Dosxaudio=disabled \
>      -Dosxvideo=disabled \
> -    -Dqt5=disabled \
>      -Dshout2=disabled \
>      -Dtwolame=disabled \
>      -Dwaveform=disabled \
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
