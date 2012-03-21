Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SAMWE-0000U6-1v
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 15:28:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 813B3315A42C;
	Wed, 21 Mar 2012 15:19:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 12aZenZ0NhR2; Wed, 21 Mar 2012 15:19:03 +0100 (CET)
Received: from [172.22.22.61] (drms-590ecc5b.pool.mediaWays.net [89.14.204.91])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 8687D315A422;
	Wed, 21 Mar 2012 15:19:03 +0100 (CET)
Message-ID: <4F69E356.3070404@opendreambox.org>
Date: Wed, 21 Mar 2012 15:19:02 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Shane Wang <shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
	<cd88e0bc3c689f07109e8e68bf07fcdd332cc66f.1331859047.git.shane.wang@intel.com>
In-Reply-To: <cd88e0bc3c689f07109e8e68bf07fcdd332cc66f.1331859047.git.shane.wang@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/60] gdk-pixbuf: upgrade to 2.24.1
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
X-List-Received-Date: Wed, 21 Mar 2012 14:28:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Shane,

On 16.03.2012 01:52, Shane Wang wrote:
> Signed-off-by: Shane Wang <shane.wang@intel.com>
> ---
>  .../configure_fix.patch                            |    0
>  .../configure_nm.patch                             |    0
>  .../hardcoded_libtool.patch                        |    0
>  .../{gdk-pixbuf_2.24.0.bb => gdk-pixbuf_2.24.1.bb} |   10 +++++-----
>  4 files changed, 5 insertions(+), 5 deletions(-)
>  rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.24.0 => gdk-pixbuf-2.24.1}/configure_fix.patch (100%)
>  rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.24.0 => gdk-pixbuf-2.24.1}/configure_nm.patch (100%)
>  rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.24.0 => gdk-pixbuf-2.24.1}/hardcoded_libtool.patch (100%)
>  rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.24.0.bb => gdk-pixbuf_2.24.1.bb} (92%)
> 
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_fix.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/configure_fix.patch
> similarity index 100%
> rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_fix.patch
> rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/configure_fix.patch
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_nm.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/configure_nm.patch
> similarity index 100%
> rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_nm.patch
> rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/configure_nm.patch
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/hardcoded_libtool.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/hardcoded_libtool.patch
> similarity index 100%
> rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/hardcoded_libtool.patch
> rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.1/hardcoded_libtool.patch
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> similarity index 92%
> rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
> rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> index cbeca94..30b3fcf 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> @@ -10,16 +10,16 @@ SECTION = "libs"
>  
>  DEPENDS = "libpng glib-2.0 jpeg"
>  
> -SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${PV}.tar.bz2 \
> +SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${PV}.tar.xz \
>             file://configure_nm.patch \
>             file://hardcoded_libtool.patch \
>             file://configure_fix.patch \
>             "
>  
> -SRC_URI[md5sum] = "d8ece3a4ade4a91c768328620e473ab8"
> -SRC_URI[sha256sum] = "38d2630314e6d91976bffd833236f84fefa440a9038f86dc422820a39f2e3700"
> +SRC_URI[md5sum] = "72f39b34b20f68148c1609bd27415412"
> +#SRC_URI[sha256sum] = "da7a3f00db360913716368e19e336402755cafa93769f3cfa28a969303e4bee1"

This causes a warning to appear:

WARNING: Missing sha256 SRC_URI checksum for .../gdk-pixbuf-2.24.1.tar.xz, consider adding to the recipe:
SRC_URI[sha256sum] = "da7a3f00db360913716368e19e336402755cafa93769f3cfa28a969303e4bee1"

Regards,
Andreas


