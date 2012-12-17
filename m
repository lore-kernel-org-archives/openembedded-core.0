Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TkejE-0001g7-0q for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 18:44:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBHHT5Hg019486;
	Mon, 17 Dec 2012 17:29:05 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19105-03; Mon, 17 Dec 2012 17:29:01 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBHHStfc019479
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 17 Dec 2012 17:28:56 GMT
Message-ID: <1355765335.32519.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Constantin Musca <constantinx.musca@intel.com>
Date: Mon, 17 Dec 2012 17:28:55 +0000
In-Reply-To: <fc5ac72e09b464ee6eee1c1489de718238944b9a.1355732782.git.constantinx.musca@intel.com>
References: <cover.1355732782.git.constantinx.musca@intel.com>
	<fc5ac72e09b464ee6eee1c1489de718238944b9a.1355732782.git.constantinx.musca@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] udev: replace base_libdir with nonarch_base_libdir
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
X-List-Received-Date: Mon, 17 Dec 2012 17:44:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-12-17 at 11:16 +0200, Constantin Musca wrote:
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>  meta/recipes-core/udev/udev.inc    | 24 ++++++++++++------------
>  meta/recipes-core/udev/udev_182.bb |  2 +-
>  2 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
> index 4705b9b..9f83821 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -32,16 +32,16 @@ inherit autotools pkgconfig update-rc.d
>  
>  # udevd/udevadm -> /sbin/, libudev.so.* -> /lib/
>  sbindir = "${base_sbindir}"
> -libexecdir = "${base_libdir}" 
> +libexecdir = "${nonarch_base_libdir}"
>  EXTRA_OECONF = "--disable-introspection \
> -                --with-rootlibdir=${base_libdir} \
> +                --with-rootlibdir=${nonarch_base_libdir} \
>                  --with-pci-ids-path=${datadir}/pci.ids \
>                  ac_cv_file__usr_share_pci_ids=no \
>                  ac_cv_file__usr_share_hwdata_pci_ids=no \
>                  ac_cv_file__usr_share_misc_pci_ids=yes \
>                  --sbindir=${base_sbindir} \
> -                --libexecdir=${base_libdir} \
> -                --with-rootlibdir=${base_libdir} \
> +                --libexecdir=${nonarch_base_libdir} \
> +                --with-rootlibdir=${nonarch_base_libdir} \
>                  --with-rootprefix= \
>                 "
>  
> @@ -59,20 +59,20 @@ FILES_${PN} += "${libexecdir} ${libdir}/ConsoleKit"
>  RRECOMMENDS_${PN} += "udev-utils"
>  
>  FILES_${PN}-dbg += "${libexecdir}/.debug"
> -FILES_${PN}-dbg += "${base_libdir}/udev/.debug/"
> -FILES_${PN}-dbg += "${base_libdir}/udev/.debug/*"
> +FILES_${PN}-dbg += "${nonarch_base_libdir}/udev/.debug/"
> +FILES_${PN}-dbg += "${nonarch_base_libdir}/udev/.debug/*"
>  FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc"
> -FILES_libudev = "${base_libdir}/libudev.so.*"
> -FILES_libudev-dbg = "${base_libdir}/.debug/libudev.so.*"
> +FILES_libudev = "${nonarch_base_libdir}/libudev.so.*"
> +FILES_libudev-dbg = "${nonarch_base_libdir}/.debug/libudev.so.*"
>  FILES_libudev-dev = "${includedir}/libudev.h ${libdir}/libudev.so ${libdir}/libudev.la \
>                       ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc"
> -FILES_libgudev = "${base_libdir}/libgudev*.so.* ${libdir}/libgudev*.so.*"
> -FILES_libgudev-dbg = "${base_libdir}/.debug/libgudev*.so.* ${libdir}/.debug/libgudev*.so.*"
> +FILES_libgudev = "${nonarch_base_libdir}/libgudev*.so.* ${libdir}/libgudev*.so.*"
> +FILES_libgudev-dbg = "${nonarch_base_libdir}/.debug/libgudev*.so.* ${libdir}/.debug/libgudev*.so.*"
>  FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libgudev*.la \
>                       ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
>  FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-cache"
>  
> -FILES_udev-acl = "${base_libdir}/udev/udev-acl ${base_libdir}/udev/rules.d/70-acl.rules"
> +FILES_udev-acl = "${nonarch_base_libdir}/udev/udev-acl ${nonarch_base_libdir}/udev/rules.d/70-acl.rules"

This doesn't look right.

Binaries and libraries need to go into ${base_libdir}, rules and other
files that don't vary by architecture need to go into
${nonarch_base_libdir}.

Cheers,

Richard



