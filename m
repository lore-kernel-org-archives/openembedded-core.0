Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qja0s-00057K-HP
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 18:52:46 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jul 2011 09:47:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,236,1309762800"; d="scan'208";a="30288265"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jul 2011 09:47:54 -0700
Message-ID: <4E2706BA.2000600@linux.intel.com>
Date: Wed, 20 Jul 2011 09:47:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1310856514-12964-1-git-send-email-schnitzeltony@gmx.de>
In-Reply-To: <1310856514-12964-1-git-send-email-schnitzeltony@gmx.de>
Subject: Re: [PATCH] gdk-pixbuf(-native): Fix build by disabling introspection
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
X-List-Received-Date: Wed, 20 Jul 2011 16:52:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/16/2011 03:48 PM, Andreas Mueller wrote:
> Error message was:
> | /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/g-ir-compiler  --includedir=. GdkPixbuf-2.0.gir -o GdkPixbuf-2.0.typelib
> | /usr/share/gir-1.0/GLib-2.0.gir:9:1: error: Unsupported version '1.1'
> | /usr/share/gir-1.0/GLib-2.0.gir:9:39: error: Unsupported version '1.1'
> | error parsing file GdkPixbuf-2.0.gir: Failed to parse included gir GLib-2.0
> | make[4]: *** [GdkPixbuf-2.0.typelib] Error 1
>
> Signed-off-by: Andreas Mueller<schnitzeltony@gmx.de>
> ---
>   meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
> index 8b6314f..e3f5977 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
>   SECTION = "libs"
>
>   DEPENDS = "libpng glib-2.0 jpeg"
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.22/gdk-pixbuf-${PV}.tar.gz \
>              file://hardcoded_libtool.patch;patch=1 \
> @@ -26,6 +26,7 @@ LIBV = "2.10.0"
>   EXTRA_OECONF = "\
>     --without-libtiff \
>     --with-libpng \
> +  --disable-introspection \
>   "
>
>   FILES_${PN} = "${bindir}/gdk-pixbuf-query-loaders \

Merged into oe-core

There was a comment from Tom about gnome.bbclass, are you looking into that?

Sau!


