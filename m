Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCYU9-0006UR-L8
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 18:11:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Sep 2012 08:58:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,423,1344236400"; d="scan'208";a="222107280"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by fmsmga002.fm.intel.com with ESMTP; 14 Sep 2012 08:58:41 -0700
Message-ID: <50535431.8030508@linux.intel.com>
Date: Fri, 14 Sep 2012 08:58:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1347530671-16622-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1347530671-16622-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] librsvg: --disable-gnome-vfs doesn't exist anymore, remove
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
X-List-Received-Date: Fri, 14 Sep 2012 16:11:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2012 03:04 AM, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> index 6eba686..364f6f2 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> @@ -11,11 +11,11 @@ DEPENDS = "gtk+ libcroco cairo libxml2 popt"
>   DEPENDS_virtclass-native = "cairo-native pango-native gdk-pixbuf-native"
>   BBCLASSEXTEND = "native"
>
> -PR = "r7"
> +PR = "r8"
>
>   inherit autotools pkgconfig gnome gtk-doc
>
> -EXTRA_OECONF = "--disable-mozilla-plugin --without-svgz --without-croco --disable-gnome-vfs"
> +EXTRA_OECONF = "--disable-mozilla-plugin --without-svgz --without-croco"
>
>   SRC_URI += "file://doc_Makefile.patch"
>
>

Merged 2 of the 3 into OE-Core

Thanks
	Sau!



