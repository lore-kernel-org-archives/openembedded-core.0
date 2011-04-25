Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEDME-0006Kt-QG
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 06:25:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Apr 2011 21:22:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,264,1301900400"; d="scan'208";a="424854379"
Received: from unknown (HELO [10.255.12.237]) ([10.255.12.237])
	by azsmga001.ch.intel.com with ESMTP; 24 Apr 2011 21:22:35 -0700
Message-ID: <4DB4F70B.2090805@linux.intel.com>
Date: Sun, 24 Apr 2011 21:22:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1303388485-25698-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1303388485-25698-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] librsvg 2.32.1: fix postinst script
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
X-List-Received-Date: Mon, 25 Apr 2011 04:25:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/21/2011 05:21 AM, Koen Kooi wrote:
> The symptom:
>
> root@pandaboard-core:~# sh /var/lib/opkg/info/librsvg-2-gtk.postinst
> g_module_open() failed for /home/root/--update-cache: /home/root/--update-cache.so: cannot open shared object file: No such file or directory
> root@pandaboard-core:~#
>
> the gdk-pixbuf-query-loaders app doesn't support arguments, only .so names, so remove --update-cache
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> index ea9456d..08ac01d 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>   SECTION = "x11/utils"
>   DEPENDS = "gtk+ libcroco cairo libxml2 popt"
>
> -PR = "r0"
> +PR = "r1"
>
>   inherit autotools pkgconfig gnome
>
> @@ -43,6 +43,6 @@ if [ "x$D" != "x" ]; then
>     exit 1
>   fi
>
> -test -x ${bindir}/gdk-pixbuf-query-loaders&&  { GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache ; }
> +test -x ${bindir}/gdk-pixbuf-query-loaders&&  { GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders ; }
>   test -x ${bindir}/gtk-update-icon-cache&&  gtk-update-icon-cache  -q ${datadir}/icons/hicolor
>   }
Pulled into OE-Core and Poky/Master

Thanks
	Sau!


