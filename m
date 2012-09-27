Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THHG4-000441-0x
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 18:48:16 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Sep 2012 09:35:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="227715337"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by fmsmga002.fm.intel.com with ESMTP; 27 Sep 2012 09:35:21 -0700
Message-ID: <50648048.5040607@linux.intel.com>
Date: Thu, 27 Sep 2012 09:35:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <1348733857-18055-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1348733857-18055-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gnome-keyring: include unpackaged files with PAM enabled
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
X-List-Received-Date: Thu, 27 Sep 2012 16:48:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/27/2012 01:17 AM, Constantin Musca wrote:
> Include missing files/dirs:
>      ${base_libdir}/security/*.la
>      ${base_libdir}/security/*${SOLIBSDEV}
>      ${base_libdir}/security/.debug/
>
> [YOCTO #2805]
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb |    9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
> index d822721..92e0e1b 100644
> --- a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
> +++ b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>
>   SECTION = "x11/gnome"
>
> -PR = "r9"
> +PR = "r10"
>
>   inherit autotools gnome gtk-doc pkgconfig
>
> @@ -43,7 +43,10 @@ FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr"
>
>   FILES_${PN}-dev += "${libdir}/${BPN}/devel/*.la \
>                       ${libdir}/${BPN}/devel/*${SOLIBSDEV} \
> -                    ${libdir}/${BPN}/standalone/*.la"
> +                    ${libdir}/${BPN}/standalone/*.la \
> +                    ${base_libdir}/security/*.la \
> +                    ${base_libdir}/security/*${SOLIBSDEV}"
>
>   FILES_${PN}-dbg += "${libdir}/${BPN}/standalone/.debug/ \
> -                    ${libdir}/${BPN}/devel/.debug/"
> +                    ${libdir}/${BPN}/devel/.debug/ \
> +                    ${base_libdir}/security/.debug/"
>

Merged into OE-Core

Thanks
	Sau!



