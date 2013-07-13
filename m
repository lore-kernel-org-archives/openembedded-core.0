Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1870B6A59F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jul 2013 04:22:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Jul 2013 21:22:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,656,1367996400"; d="scan'208";a="344914038"
Received: from unknown (HELO [10.255.13.73]) ([10.255.13.73])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2013 21:22:51 -0700
Message-ID: <51E0D61B.7010907@linux.intel.com>
Date: Fri, 12 Jul 2013 21:22:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
References: <03982e313990aad86cd24f5cbcb4994448ab58a0.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
	<a3cf8140f2ad28328df73a9d7d9cc6a9bcf04da3.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <a3cf8140f2ad28328df73a9d7d9cc6a9bcf04da3.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] mtd-utils: add PV variable into recipe
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
X-List-Received-Date: Sat, 13 Jul 2013 04:22:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2013 08:10 AM, Emilia Ciobanu wrote:
> Git packages should include git token inside the PV variable.
>
> Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
> ---
>   meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
> index 5797204..5e65a69 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
> @@ -12,7 +12,7 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git \
>           file://mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch "
>
>   S = "${WORKDIR}/git/"
> -
> +PV = "1.5.0+git${SRCPV}"
>   PR = "r3"
>
>   EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
>

This change seems to have caused a fetcher failure,

> ERROR: Task 5645 (/srv/ssd/sgw/poky/meta/recipes-connectivity/avahi/avahi_0.6.31.bb, do_install) failed with exit code '1'
> WARNING: Failed to fetch URL file://add-exclusion-to-mkfs-jffs2-git-2.patch, attempting MIRRORS if available
> ERROR: Fetcher failure: Unable to find file file://add-exclusion-to-mkfs-jffs2-git-2.patch anywhere. The paths that were searched were:
>     /srv/ssd/sgw/poky/meta/recipes-devtools/mtd/mtd-utils-1.5.0+gitAUTOINC+ca39eb1d98/x86-64
>     /srv/ssd/sgw/poky/meta/recipes-devtools/mtd/mtd-utils-1.5.0+gitAUTOINC+ca39eb1d98/qemuall
>     /srv/ssd/sgw/poky/meta/recipes-devtools/mtd/mtd-utils-1.5.0+gitAUTOINC+ca39eb1d98/qemux86-64
>     /srv/ssd/sgw/poky/meta/recipes-devtools/mtd/mtd-utils-1.5.0+gitAUTOINC+ca39eb1d98/poky
>     /srv/ssd/sgw/poky/meta/recipes-devtools/mtd/mtd-utils-1.5.0+gitAUTOINC+ca39eb1d98/
>     /srv/ssd/sgw/poky/meta/recipes-devtools/mtd/mtd-utils/x86-64
>     /srv/ssd/sgw/poky/meta/recipes-devtools/mtd/mtd-utils/qemuall
>     /srv/ssd/sgw/poky/meta/recipes-devtools/mtd/mtd-utils/qemux86-64
>     /srv/ssd/sgw/poky/meta/recipes-devtools/mtd/mtd-utils/poky
>     /srv/ssd/sgw/poky/meta/recipes-devtools/mtd/mtd-utils/
>     /srv/ssd/sgw/poky/meta/recipes-devtools/mtd/files/x86-64
>     /srv/ssd/sgw/poky/meta/recipes-devtools/mtd/files/qemuall
>     /srv/ssd/sgw/poky/meta/recipes-devtools/mtd/files/qemux86-64
>     /srv/ssd/sgw/poky/meta/recipes-devtools/mtd/files/poky
>     /srv/ssd/sgw/poky/meta/recipes-devtools/mtd/files/
>     /intel/downloads
> ERROR: Function failed: Fetcher failure for URL: 'file://add-exclusion-to-mkfs-jffs2-git-2.patch'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /srv/ssd/sgw/builds/world/tmp/work/x86_64-poky-linux/mtd-utils/1.5.0+gitAUTOINC+ca39eb1d98-r3/temp/log.do_fetch.32159

Likely because the patches are in a versioned directory:

meta/recipes-devtools/mtd/mtd-utils-1.5.0/add-exclusion-to-mkfs-jffs2-git-2.patch

You will need to rename that directory also to not have the version.

Sau!


