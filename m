Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TIwTv-0003Lh-NH
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 09:01:27 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Oct 2012 23:48:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,521,1344236400"; d="scan'208";a="218070706"
Received: from unknown (HELO helios.localnet) ([10.252.122.45])
	by orsmga002.jf.intel.com with ESMTP; 01 Oct 2012 23:48:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 02 Oct 2012 07:48:26 +0100
Message-ID: <14204266.kOPJHBEAML@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.1 (Linux/3.2.0-31-generic-pae; KDE/4.9.1; i686; ; )
In-Reply-To: <1349136558.15753.124.camel@ted>
References: <1349136558.15753.124.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gdk-pixbuf: Ensure gdk-pixbuf-native dependencies are correct with linuxstdbase
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2012 07:01:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 02 October 2012 01:09:18 Richard Purdie wrote:
> Without this change, anything using linuxstdbase would incorrectly
> try and pull in X dependencies.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb index 82a7eaa..8d18b87
> 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> @@ -35,6 +35,7 @@ EXTRA_OECONF = "\
>  "
>  X11DEPENDS = "--without-x11"
>  X11DEPENDS_linuxstdbase = "${@base_contains('DISTRO_FEATURES', 'x11',
> '--with-x11', '--without-x11', d)}" +X11
> DEPENDS_virtclass-native = "--without-x11"
> 
>  PACKAGES =+ "${PN}-xlib"

Thanks, FYI this fixes [YOCTO #3154].

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


