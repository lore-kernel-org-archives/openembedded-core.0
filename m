Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qowdk-00077c-Fh for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 14:03:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p74BwdUT001329
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 12:58:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00823-02 for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2011 12:58:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p74BwXMe001323
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 12:58:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <bc89b720712af0813e1e85285ee1dcbbd260fcfd.1312454023.git.lianhao.lu@intel.com>
References: <cover.1312454023.git.lianhao.lu@intel.com>
	<bc89b720712af0813e1e85285ee1dcbbd260fcfd.1312454023.git.lianhao.lu@intel.com>
Date: Thu, 04 Aug 2011 12:58:12 +0100
Message-ID: <1312459092.2344.732.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] eglibc-package.inc: Fixed error in referencing PKGSUFFIX
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
X-List-Received-Date: Thu, 04 Aug 2011 12:03:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-04 at 18:36 +0800, Lianhao Lu wrote:
> [YOCTO #1329] Added the missing $ when referencing PKGSUFFIX in FILES_*
> variables set.
> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/recipes-core/eglibc/eglibc-package.inc |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
> index 77519d2..5308bb9 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -56,10 +56,10 @@ libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${ba
>  FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
>  FILES_ldd${PKGSUFFIX} = "${bindir}/ldd"
>  FILES_libsegfault${PKGSUFFIX} = "${base_libdir}/libSegFault*"
> -FILES_libcidn{PKGSUFFIX} = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
> -FILES_libmemusage{PKGSUFFIX} = "${base_libdir}/libmemusage.so"
> -FILES_eglibc-extra-nss{PKGSUFFIX} = "${base_libdir}/libnss_*-*.so ${base_libdir}/libnss_*.so.*"
> -FILES_sln{PKGSUFFIX} = "/sbin/sln"
> +FILES_libcidn${PKGSUFFIX} = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
> +FILES_libmemusage${PKGSUFFIX} = "${base_libdir}/libmemusage.so"
> +FILES_eglibc-extra-nss${PKGSUFFIX} = "${base_libdir}/libnss_*-*.so ${base_libdir}/libnss_*.so.*"
> +FILES_sln${PKGSUFFIX} = "/sbin/sln"
>  FILES_${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/"
>  FILES_libsotruss${PKGSUFFIX} = "${libdir}/audit/sotruss-lib.so"
>  FILES_${PN}-dev_append += "${bindir}/rpcgen ${libdir}/*.a \

Thanks, merged to master with added PR bumps.

Cheers,

Richard



