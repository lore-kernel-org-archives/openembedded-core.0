Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T9gpR-0000bG-Ey
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 20:29:25 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Sep 2012 11:16:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,380,1344236400"; d="scan'208";a="189746578"
Received: from unknown (HELO [10.255.13.76]) ([10.255.13.76])
	by orsmga001.jf.intel.com with ESMTP; 06 Sep 2012 11:16:59 -0700
Message-ID: <5048E89B.7090107@linux.intel.com>
Date: Thu, 06 Sep 2012 11:16:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1346841036-9897-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1346841036-9897-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg-common: add RREPLACES on xserver-xorg to -module-exa
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
X-List-Received-Date: Thu, 06 Sep 2012 18:29:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/2012 03:30 AM, Ross Burton wrote:
> As the file moved from xserver-xorg to xserver-xorg-module-exa, the latter needs
> to "replace" the former to ensure a smooth migration when upgrading the
> packages.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc |    3 +--
>   meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc |    1 +
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> index b588c11..b4a348c 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> @@ -8,5 +8,4 @@ SRC_URI += "file://crosscompile.patch \
>   SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
>   SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
>
> -PR = "r5"
> -
> +PR = "r6"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> index 404c488..6133344 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> @@ -66,6 +66,7 @@ PACKAGES =+ "${PN}-security-policy \
>
>   RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
>   RDEPENDS_${PN}-xvfb += "xkeyboard-config"
> +RREPLACES_${PN}-module-exa = "${PN}"
>
>   FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
>   FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
>

Merged into OE-Core

Thanks
	Sau!



