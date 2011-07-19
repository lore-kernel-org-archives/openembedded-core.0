Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjEwn-0007WM-Eb
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 20:23:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Jul 2011 11:19:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,229,1309762800"; d="scan'208";a="27702107"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by orsmga002.jf.intel.com with ESMTP; 19 Jul 2011 11:19:02 -0700
Message-ID: <4E25CA95.7040305@linux.intel.com>
Date: Tue, 19 Jul 2011 11:19:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1310859296-18797-1-git-send-email-schnitzeltony@gmx.de>
In-Reply-To: <1310859296-18797-1-git-send-email-schnitzeltony@gmx.de>
Subject: Re: [PATCH] gdk-pixbuf: Fix QA issues and clean minor	formatting
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
X-List-Received-Date: Tue, 19 Jul 2011 18:23:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/16/2011 04:34 PM, Andreas Mueller wrote:
> QA warnings fixed:
> WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-png.la
> WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-wbmp.la
> WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-xbm.la
> WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-ras.la
> WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-tga.la
> WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-bmp.la
> WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-ani.la
> WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-pnm.la
> WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-icns.la
> WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-pcx.la
> WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-ico.la
> WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-gif.la
> WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-qtif.la
> WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-xpm.la
> WARNING:   /usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-jpeg.la
>
> Signed-off-by: Andreas Mueller<schnitzeltony@gmx.de>
> ---
>   meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb |    7 +++++--
>   1 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
> index e3f5977..e3e1819 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
> @@ -34,11 +34,14 @@ FILES_${PN} = "${bindir}/gdk-pixbuf-query-loaders \
>
>   FILES_${PN}-dev += " \
>   	${bindir}/gdk-pixbuf-csource \
> -	${includedir}/*"
> +	${includedir}/* \
> +	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/*.la \
> +"
>
>   FILES_${PN}-dbg += " \
>           ${libdir}/.debug/* \
> -	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/.debug/*"
> +	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/.debug/* \
> +"
>
>   postinst_pixbufloader () {
>   if [ "x$D" != "x" ]; then

Merged into OE-Core

Thanks
	Sau!


