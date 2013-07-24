Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 6CC386028B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 15:08:24 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Jul 2013 08:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,736,1367996400"; d="scan'208";a="272605268"
Received: from unknown (HELO [10.255.14.43]) ([10.255.14.43])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Jul 2013 08:08:24 -0700
Message-ID: <51EFEDE8.5050201@linux.intel.com>
Date: Wed, 24 Jul 2013 08:08:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ionut Radu <ionutx.radu@intel.com>
References: <0e420cbfa5d9ab32d32657fbbbac8d3ce13e778f.1374669164.git.ionutx.radu@intel.com>
	<24c718931320fa98d6f54eadfc74ff1576422e33.1374669164.git.ionutx.radu@intel.com>
In-Reply-To: <24c718931320fa98d6f54eadfc74ff1576422e33.1374669164.git.ionutx.radu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] qemu: Updated from 1.5.0 to 1.5.1
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
X-List-Received-Date: Wed, 24 Jul 2013 15:08:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/24/2013 05:42 AM, Ionut Radu wrote:
> Patch target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch was backported
>

What kind of testing have you done with this update?

Since qemu is a core part of the Yocto Project and many people rely on 
it to work for all ARCHes, please be sure to include your testing 
information.

Thanks
	Sau!

> Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
> ---
>   meta/recipes-devtools/qemu/{qemu_1.5.0.bb => qemu_1.5.1.bb} |    7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>   rename meta/recipes-devtools/qemu/{qemu_1.5.0.bb => qemu_1.5.1.bb} (49%)
>
> diff --git a/meta/recipes-devtools/qemu/qemu_1.5.0.bb b/meta/recipes-devtools/qemu/qemu_1.5.1.bb
> similarity index 49%
> rename from meta/recipes-devtools/qemu/qemu_1.5.0.bb
> rename to meta/recipes-devtools/qemu/qemu_1.5.1.bb
> index 9b9d0d7..fe0437f 100644
> --- a/meta/recipes-devtools/qemu/qemu_1.5.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_1.5.1.bb
> @@ -3,9 +3,8 @@ require qemu.inc
>   LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
>                       file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
>
> -SRC_URI += "file://fdt_header.patch \
> -            file://target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch"
> +SRC_URI += "file://fdt_header.patch"
>
>   SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
> -SRC_URI[md5sum] = "b6f3265b8ed39d77e8f354f35cc26e16"
> -SRC_URI[sha256sum] = "b22b30ee9712568dfb4eedf76783f4a76546e1cbc41659b909646bcf0b4867bb"
> +SRC_URI[md5sum] = "b56e73bdcfdb214d5c68e13111aca96f"
> +SRC_URI[sha256sum] = "4c15a1ee2f387983eb5c1497f66bf567c34d14ba48517148f6eafef8ae09e3e8"
>

