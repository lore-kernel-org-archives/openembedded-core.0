Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UH1BY-0003Mu-86
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Mar 2013 01:10:57 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Mar 2013 16:54:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,858,1355126400"; d="scan'208";a="307669594"
Received: from unknown (HELO [10.255.12.246]) ([10.255.12.246])
	by fmsmga002.fm.intel.com with ESMTP; 16 Mar 2013 16:54:00 -0700
Message-ID: <51450618.80704@linux.intel.com>
Date: Sat, 16 Mar 2013 16:54:00 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Radu Moisan <radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
	<ebd11f2519a02442988a332de533cb526033e9bf.1363283478.git.radu.moisan@intel.com>
In-Reply-To: <ebd11f2519a02442988a332de533cb526033e9bf.1363283478.git.radu.moisan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/17] atk: Upgrade to v 2.7.91
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
X-List-Received-Date: Sun, 17 Mar 2013 00:11:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2013 10:55 AM, Radu Moisan wrote:
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>   .../atk/{atk_2.6.0.bb => atk_2.7.91.bb}            |    8 +++++---
>   .../atk/files/remove-gnome-comile-warnings.patch   |   17 +++++++++++++++++

Please explain why you needed to add the new patch.  Also, maybe spell 
compile in the patch name correctly.

What where the warnings and could the be corrected, otherwise we might 
be masking something?

Thanks
	Sau!

>   2 files changed, 22 insertions(+), 3 deletions(-)
>   rename meta/recipes-support/atk/{atk_2.6.0.bb => atk_2.7.91.bb} (68%)
>   create mode 100644 meta/recipes-support/atk/files/remove-gnome-comile-warnings.patch
>
> diff --git a/meta/recipes-support/atk/atk_2.6.0.bb b/meta/recipes-support/atk/atk_2.7.91.bb
> similarity index 68%
> rename from meta/recipes-support/atk/atk_2.6.0.bb
> rename to meta/recipes-support/atk/atk_2.7.91.bb
> index be797c7..c1fc295 100644
> --- a/meta/recipes-support/atk/atk_2.6.0.bb
> +++ b/meta/recipes-support/atk/atk_2.7.91.bb
> @@ -13,9 +13,11 @@ DEPENDS = "glib-2.0"
>
>   inherit autotools gtk-doc pkgconfig
>
> -SRC_URI = "http://download.gnome.org/sources/atk/2.6/${BPN}-${PV}.tar.xz"
> -SRC_URI[md5sum] = "6b34e2a63dda4429b5692be7ca3aa5bf"
> -SRC_URI[sha256sum] = "eff663f90847620bb68c9c2cbaaf7f45e2ff44163b9ab3f10d15be763680491f"
> +SRC_URI = "http://download.gnome.org/sources/atk/2.7/${BPN}-${PV}.tar.xz \
> +           file://remove-gnome-comile-warnings.patch \
> +          "
> +SRC_URI[md5sum] = "52ee0f73d935b75997b5c1dd053df581"
> +SRC_URI[sha256sum] = "c95adec9d3ba605c95fa0042b79d2cee2bff18be95dc36c1628ac8ff3481bfe9"
>
>   BBCLASSEXTEND = "native"
>
> diff --git a/meta/recipes-support/atk/files/remove-gnome-comile-warnings.patch b/meta/recipes-support/atk/files/remove-gnome-comile-warnings.patch
> new file mode 100644
> index 0000000..7f15c92
> --- /dev/null
> +++ b/meta/recipes-support/atk/files/remove-gnome-comile-warnings.patch
> @@ -0,0 +1,17 @@
> +Upstream-Status:Inappropriate
> +
> +Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> +
> +Index: atk-2.7.91/configure.ac
> +===================================================================
> +--- atk-2.7.91.orig/configure.ac
> ++++ atk-2.7.91/configure.ac
> +@@ -215,8 +215,6 @@ if test "x$enable_rebuilds" = "xyes" &&
> + fi
> + AC_SUBST(REBUILD)
> +
> +-GNOME_COMPILE_WARNINGS([maximum])
> +-
> + AC_CONFIG_FILES([
> + Makefile
> + po/Makefile.in
>


