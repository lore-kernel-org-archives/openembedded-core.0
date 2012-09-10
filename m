Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TB6EW-0000R4-WA
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 17:49:09 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Sep 2012 08:36:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,398,1344236400"; d="scan'208";a="143375909"
Received: from unknown (HELO [10.255.13.123]) ([10.255.13.123])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Sep 2012 08:36:38 -0700
Message-ID: <504E0906.8010608@linux.intel.com>
Date: Mon, 10 Sep 2012 08:36:38 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1346780537-1227-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1346780537-1227-1-git-send-email-paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] build-appliance-image: fix for packagegroup-apps-console removal
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
X-List-Received-Date: Mon, 10 Sep 2012 15:49:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2012 10:42 AM, Paul Eggleton wrote:
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   meta/recipes-core/images/build-appliance-image.bb |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/images/build-appliance-image.bb b/meta/recipes-core/images/build-appliance-image.bb
> index be4d6ab..62c7374 100644
> --- a/meta/recipes-core/images/build-appliance-image.bb
> +++ b/meta/recipes-core/images/build-appliance-image.bb
> @@ -1,5 +1,5 @@
>   DESCRIPTION = "An image you can boot and run using either the VMware Player or VMware Workstation.  For more information, see the<a href='http://www.yoctoproject.org/documentation/build-appliance'>Build Appliance page</a>."
> -IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-apps-console packagegroup-core-ssh-openssh packagegroup-self-hosted"
> +IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-openssh packagegroup-self-hosted"
>
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
>
>   PR = "r16"
>
> -IMAGE_FEATURES += "x11-base package-management"
> +IMAGE_FEATURES += "x11-base package-management splash"
>
>   # Ensure there's enough space to do a core-image-sato build, with rm_work enabled
>   IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
>

Merged into OE-Core

Thanks
	Sau!



