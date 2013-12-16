Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AC8DA6E51E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 19:14:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Dec 2013 11:14:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,496,1384329600"; d="scan'208";a="453150530"
Received: from unknown (HELO [10.255.15.128]) ([10.255.15.128])
	by orsmga002.jf.intel.com with ESMTP; 16 Dec 2013 11:14:36 -0800
Message-ID: <52AF511C.9070008@linux.intel.com>
Date: Mon, 16 Dec 2013 11:14:36 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Cristian Iorga <cristian.iorga@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1387213322.git.cristian.iorga@intel.com>
	<c32dfa3b93f97673945fa12379c8b5904bc3554f.1387213322.git.cristian.iorga@intel.com>
In-Reply-To: <c32dfa3b93f97673945fa12379c8b5904bc3554f.1387213322.git.cristian.iorga@intel.com>
Subject: Re: [PATCH 1/2] libtirpc: upgrade to 0.2.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Dec 2013 19:14:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/2013 09:02 AM, Cristian Iorga wrote:
> obsolete_automake_macros.patch removed,
> no longer needed.
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   .../libtirpc-0.2.3/obsolete_automake_macros.patch         | 15 ---------------
>   .../libtirpc-0.2.1-fortify.patch                          |  0
>   .../remove-des-uclibc.patch                               |  0
>   .../libtirpc/{libtirpc_0.2.3.bb => libtirpc_0.2.4.bb}     |  8 +++++---
>   4 files changed, 5 insertions(+), 18 deletions(-)
>   delete mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.3/obsolete_automake_macros.patch
>   rename meta/recipes-extended/libtirpc/{libtirpc-0.2.3 => libtirpc-0.2.4}/libtirpc-0.2.1-fortify.patch (100%)
>   rename meta/recipes-extended/libtirpc/{libtirpc-0.2.3 => libtirpc-0.2.4}/remove-des-uclibc.patch (100%)

Please rename these to the generic recipe name "libtirpc" if these are 
not version specific patches.

>   rename meta/recipes-extended/libtirpc/{libtirpc_0.2.3.bb => libtirpc_0.2.4.bb} (84%)
>
> diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.3/obsolete_automake_macros.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.3/obsolete_automake_macros.patch
> deleted file mode 100644
> index 88d759f..0000000
> --- a/meta/recipes-extended/libtirpc/libtirpc-0.2.3/obsolete_automake_macros.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Upstream-Status: Submitted [libtirpc-devel@lists.sourceforge.net]
> -
> -Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> -diff -Nurd libtirpc-0.2.2/configure.ac libtirpc-0.2.2/configure.ac
> ---- libtirpc-0.2.2/configure.ac	2011-05-02 15:10:40.000000000 +0300
> -+++ libtirpc-0.2.2/configure.ac	2013-01-11 15:11:24.275000030 +0200
> -@@ -17,7 +17,7 @@
> - fi
> -
> - AC_PROG_CC
> --AM_CONFIG_HEADER(config.h)
> -+AC_CONFIG_HEADERS(config.h)
> - AC_PROG_LIBTOOL
> - AC_HEADER_DIRENT
> - AC_PREFIX_DEFAULT(/usr)
> diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.3/libtirpc-0.2.1-fortify.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.4/libtirpc-0.2.1-fortify.patch
> similarity index 100%
> rename from meta/recipes-extended/libtirpc/libtirpc-0.2.3/libtirpc-0.2.1-fortify.patch
> rename to meta/recipes-extended/libtirpc/libtirpc-0.2.4/libtirpc-0.2.1-fortify.patch
> diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.3/remove-des-uclibc.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.4/remove-des-uclibc.patch
> similarity index 100%
> rename from meta/recipes-extended/libtirpc/libtirpc-0.2.3/remove-des-uclibc.patch
> rename to meta/recipes-extended/libtirpc/libtirpc-0.2.4/remove-des-uclibc.patch
> diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.3.bb b/meta/recipes-extended/libtirpc/libtirpc_0.2.4.bb
> similarity index 84%
> rename from meta/recipes-extended/libtirpc/libtirpc_0.2.3.bb
> rename to meta/recipes-extended/libtirpc/libtirpc_0.2.4.bb
> index 407e38e..88e2d82 100644
> --- a/meta/recipes-extended/libtirpc/libtirpc_0.2.3.bb
> +++ b/meta/recipes-extended/libtirpc/libtirpc_0.2.4.bb
> @@ -13,17 +13,19 @@ PROVIDES = "virtual/librpc"
>   SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2;name=libtirpc \
>              ${GENTOO_MIRROR}/${BPN}-glibc-nfs.tar.xz;name=glibc-nfs \
>              file://libtirpc-0.2.1-fortify.patch \
> -           file://obsolete_automake_macros.patch \
>             "
>
>   SRC_URI_append_libc-uclibc = " file://remove-des-uclibc.patch"
>
> -SRC_URI[libtirpc.md5sum] = "b70e6c12a369a91e69fcc3b9feb23d61"
> -SRC_URI[libtirpc.sha256sum] = "4f29ea0491b4ca4c29f95f3c34191b857757873bbbf4b069f9dd4da01a6a923c"
> +SRC_URI[libtirpc.md5sum] = "847995e8d002cbf1387bda05947be086"
> +SRC_URI[libtirpc.sha256sum] = "45c3e21dfc23a5ba501f9dfc6671678316fdfdb8355a1ec404ae2aa2f81943a1"
>   SRC_URI[glibc-nfs.md5sum] = "5ae500b9d0b6b72cb875bc04944b9445"
>   SRC_URI[glibc-nfs.sha256sum] = "2677cfedf626f3f5a8f6e507aed5bb8f79a7453b589d684dbbc086e755170d83"
> +
>   inherit autotools pkgconfig
>
> +EXTRA_OECONF = "--disable-gssapi"
> +

You don't say why you added this in the commit message.

Thanks
	Sau!

>   do_configure_prepend () {
>           cp -r ${S}/../tirpc ${S}
>   }
>

