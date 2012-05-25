Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SXv8K-0007Tv-Jv
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 16:04:48 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 25 May 2012 06:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104271524"
Received: from dell-desktop (HELO [10.237.104.69]) ([10.237.104.69])
	by AZSMGA002.ch.intel.com with ESMTP; 25 May 2012 06:54:34 -0700
Message-ID: <4FBF9081.2080408@intel.com>
Date: Fri, 25 May 2012 17:00:33 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337954210-2560-1-git-send-email-radu.moisan@intel.com>
In-Reply-To: <1337954210-2560-1-git-send-email-radu.moisan@intel.com>
Subject: Re: [PATCH v2] man-pages: update to version 3.41
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
X-List-Received-Date: Fri, 25 May 2012 14:04:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Changed PN to BPN as suggested by Richard, the rest is the same as v1.

Radu

On 05/25/2012 04:56 PM, Radu Moisan wrote:
> Signed-off-by: Radu Moisan<radu.moisan@intel.com>
> ---
>   .../{man-pages_3.36.bb =>  man-pages_3.41.bb}       |    8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>   rename meta/recipes-extended/man-pages/{man-pages_3.36.bb =>  man-pages_3.41.bb} (68%)
>
> diff --git a/meta/recipes-extended/man-pages/man-pages_3.36.bb b/meta/recipes-extended/man-pages/man-pages_3.41.bb
> similarity index 68%
> rename from meta/recipes-extended/man-pages/man-pages_3.36.bb
> rename to meta/recipes-extended/man-pages/man-pages_3.41.bb
> index 6025a87..cf0523c 100644
> --- a/meta/recipes-extended/man-pages/man-pages_3.36.bb
> +++ b/meta/recipes-extended/man-pages/man-pages_3.41.bb
> @@ -3,13 +3,13 @@ DESCRIPTION = "The Linux man-pages project documents the Linux kernel and C libr
>   SECTION = "console/utils"
>   HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
>   LICENSE = "GPLv2+"
> -PR = "r1"
> +PR = "r0"
>
>   LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
> -SRC_URI = "${KERNELORG_MIRROR}/linux/docs/man-pages/Archive/${BPN}-${PV}.tar.gz"
> +SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
>
> -SRC_URI[md5sum] = "cfe991b1ce9e0ea5355f29ff9fcac125"
> -SRC_URI[sha256sum] = "c0575e31f73cd9dc2761c274217e06e7130fdfee510170957a9d72d012a5437c"
> +SRC_URI[md5sum] = "ee8412e72dc79f3c62573add29954b26"
> +SRC_URI[sha256sum] = "13f08bf1bb7429cd7208acd41250f36fb6b2e12ab9f86f7e8fa8c67af142d81d"
>
>   RDEPENDS_${PN} = "man"
>


