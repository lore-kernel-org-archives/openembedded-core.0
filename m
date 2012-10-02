Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TJ3xc-0004HA-Rl
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 17:00:37 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Oct 2012 07:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,523,1344236400"; d="scan'208";a="229558888"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by fmsmga002.fm.intel.com with ESMTP; 02 Oct 2012 07:47:33 -0700
Message-ID: <506AFE85.9050905@linux.intel.com>
Date: Tue, 02 Oct 2012 07:47:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1348839081-7511-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1348839081-7511-1-git-send-email-otavio@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: Remove RCONFLICTS against xserver-xorg
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
X-List-Received-Date: Tue, 02 Oct 2012 15:00:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/28/2012 06:31 AM, Otavio Salvador wrote:
> When merging the xserver-xorg fix the to use RDEPENDS in
> xserver-xorg-module-exa the RCONFLICTS has not been removed by
> mistake. This drops the RCONFLICTS to properly fix it.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    1 -
>   .../xorg-xserver/xserver-xorg_1.11.2.bb            |    2 +-
>   2 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index 9b474de..bea0252 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -66,7 +66,6 @@ PACKAGES =+ "${PN}-security-policy \
>
>   RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
>   RDEPENDS_${PN}-xvfb += "xkeyboard-config"
> -RCONFLICTS_${PN}-module-exa = "${PN} (< ${EXTENDPKGV})"
>   RDEPENDS_${PN}-module-exa = "${PN} (= ${EXTENDPKGV})"
>
>   FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb
> index 2512fb2..a219f81 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb
> @@ -10,4 +10,4 @@ SRC_URI += "file://crosscompile.patch \
>   SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
>   SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
>
> -PR = "r9"
> +PR = "r10"
>
Merged into OE-Core

Sorry about the original mis-merge!

Thanks
	Sau!


