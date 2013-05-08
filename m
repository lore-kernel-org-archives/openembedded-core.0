Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ua8Jn-0001sd-28
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 19:38:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2013 10:19:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,636,1363158000"; d="scan'208";a="333849732"
Received: from unknown (HELO [10.255.13.9]) ([10.255.13.9])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2013 10:19:50 -0700
Message-ID: <518A8936.1040402@linux.intel.com>
Date: Wed, 08 May 2013 10:19:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Ionut Radu <ionutx.radu@intel.com>
References: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
	<1368024119-4149-5-git-send-email-ionutx.radu@intel.com>
In-Reply-To: <1368024119-4149-5-git-send-email-ionutx.radu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/9] pciutils: updated from 3.1.10 to 3.2.
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
X-List-Received-Date: Wed, 08 May 2013 17:38:41 -0000
X-List-Received-Date: Wed, 08 May 2013 17:38:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2013 07:41 AM, Ionut Radu wrote:
> Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
> ---
>   .../configure.patch                                  |    0
>   .../guess-fix.patch                                  |    0
>   .../lib-build-fix.patch                              |    0
>   .../makefile.patch                                   |   18 ++++++++++++++----
>   .../pcimodules-pciutils.diff                         |    0
>   .../{pciutils_3.1.10.bb => pciutils_3.2.0.bb}        |    4 ++--
>   6 files changed, 16 insertions(+), 6 deletions(-)
>   rename meta/recipes-bsp/pciutils/{pciutils-3.1.10 => pciutils-3.2.0}/configure.patch (100%)
>   rename meta/recipes-bsp/pciutils/{pciutils-3.1.10 => pciutils-3.2.0}/guess-fix.patch (100%)
>   rename meta/recipes-bsp/pciutils/{pciutils-3.1.10 => pciutils-3.2.0}/lib-build-fix.patch (100%)
>   rename meta/recipes-bsp/pciutils/{pciutils-3.1.10 => pciutils-3.2.0}/makefile.patch (26%)
>   rename meta/recipes-bsp/pciutils/{pciutils-3.1.10 => pciutils-3.2.0}/pcimodules-pciutils.diff (100%)
>   rename meta/recipes-bsp/pciutils/{pciutils_3.1.10.bb => pciutils_3.2.0.bb} (92%)
>
> diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.10/configure.patch b/meta/recipes-bsp/pciutils/pciutils-3.2.0/configure.patch
> similarity index 100%
> rename from meta/recipes-bsp/pciutils/pciutils-3.1.10/configure.patch
> rename to meta/recipes-bsp/pciutils/pciutils-3.2.0/configure.patch
> diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.10/guess-fix.patch b/meta/recipes-bsp/pciutils/pciutils-3.2.0/guess-fix.patch
> similarity index 100%
> rename from meta/recipes-bsp/pciutils/pciutils-3.1.10/guess-fix.patch
> rename to meta/recipes-bsp/pciutils/pciutils-3.2.0/guess-fix.patch
> diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.10/lib-build-fix.patch b/meta/recipes-bsp/pciutils/pciutils-3.2.0/lib-build-fix.patch
> similarity index 100%
> rename from meta/recipes-bsp/pciutils/pciutils-3.1.10/lib-build-fix.patch
> rename to meta/recipes-bsp/pciutils/pciutils-3.2.0/lib-build-fix.patch
> diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.10/makefile.patch b/meta/recipes-bsp/pciutils/pciutils-3.2.0/makefile.patch
> similarity index 26%
> rename from meta/recipes-bsp/pciutils/pciutils-3.1.10/makefile.patch
> rename to meta/recipes-bsp/pciutils/pciutils-3.2.0/makefile.patch
> index 811aac8..d123cb8 100644
> --- a/meta/recipes-bsp/pciutils/pciutils-3.1.10/makefile.patch
> +++ b/meta/recipes-bsp/pciutils/pciutils-3.2.0/makefile.patch
> @@ -1,9 +1,10 @@
>   Upstream-Status: Inappropriate [configuration]
>

If you are making changes to this, please add a Signed-off-by: line.

Thanks

Sau!

> -diff -ruN pciutils-3.1.7-orig/Makefile pciutils-3.1.7/Makefile
> ---- pciutils-3.1.7-orig/Makefile	2011-07-11 14:41:59.000000000 +0800
> -+++ pciutils-3.1.7/Makefile	2011-07-11 14:42:31.000000000 +0800
> -@@ -31,7 +31,7 @@
> +Index: pciutils-3.2.0/Makefile
> +===================================================================
> +--- pciutils-3.2.0.orig/Makefile
> ++++ pciutils-3.2.0/Makefile
> +@@ -35,7 +35,7 @@ SHAREDIR=$(PREFIX)/share
>    IDSDIR=$(SHAREDIR)
>    MANDIR:=$(shell if [ -d $(PREFIX)/share/man ] ; then echo $(PREFIX)/share/man ; else echo $(PREFIX)/man ; fi)
>    INCDIR=$(PREFIX)/include
> @@ -12,3 +13,12 @@ diff -ruN pciutils-3.1.7-orig/Makefile pciutils-3.1.7/Makefile
>    PKGCFDIR=$(LIBDIR)/pkgconfig
>
>    # Commands
> +@@ -94,7 +94,7 @@ example: example.o lib/$(PCILIB_DEV)
> + example.o: example.c $(PCIINC)
> +
> + %: %.o
> +-	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LIB_LDLIBS) -o $@
> ++	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LIB_LDLIBS) $(LDLIBS) -o $@
> +
> + %.8 %.7: %.man
> + 	M=`echo $(DATE) | sed 's/-01-/-January-/;s/-02-/-February-/;s/-03-/-March-/;s/-04-/-April-/;s/-05-/-May-/;s/-06-/-June-/;s/-07-/-July-/;s/-08-/-August-/;s/-09-/-September-/;s/-10-/-October-/;s/-11-/-November-/;s/-12-/-December-/;s/\(.*\)-\(.*\)-\(.*\)/\3 \2 \1/'` ; sed <$< >$@ "s/@TODAY@/$$M/;s/@VERSION@/pciutils-$(VERSION)/;s#@IDSDIR@#$(IDSDIR)#"
> diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.10/pcimodules-pciutils.diff b/meta/recipes-bsp/pciutils/pciutils-3.2.0/pcimodules-pciutils.diff
> similarity index 100%
> rename from meta/recipes-bsp/pciutils/pciutils-3.1.10/pcimodules-pciutils.diff
> rename to meta/recipes-bsp/pciutils/pciutils-3.2.0/pcimodules-pciutils.diff
> diff --git a/meta/recipes-bsp/pciutils/pciutils_3.1.10.bb b/meta/recipes-bsp/pciutils/pciutils_3.2.0.bb
> similarity index 92%
> rename from meta/recipes-bsp/pciutils/pciutils_3.1.10.bb
> rename to meta/recipes-bsp/pciutils/pciutils_3.2.0.bb
> index e405101..6022695 100644
> --- a/meta/recipes-bsp/pciutils/pciutils_3.1.10.bb
> +++ b/meta/recipes-bsp/pciutils/pciutils_3.2.0.bb
> @@ -18,8 +18,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
>              file://guess-fix.patch \
>              file://makefile.patch"
>
> -SRC_URI[md5sum] = "3a5d8b2784c8571dc5557efda4a8c157"
> -SRC_URI[sha256sum] = "f402c2051d9b027799a36f17c5e1750dcb4f07070ec46e79108901d03a83aa75"
> +SRC_URI[md5sum] = "d73a1b35e5d5efa70e8476d5917de11f"
> +SRC_URI[sha256sum] = "b816943bb06c3338d98e2c705e3b76c9e513830f1f15c76d60e549f965d22a35"
>
>   PARALLEL_MAKE = ""
>
>


