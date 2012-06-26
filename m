Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjX3t-0004BG-9U
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2012 16:48:13 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jun 2012 07:37:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="170200811"
Received: from unknown (HELO [10.255.12.180]) ([10.255.12.180])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jun 2012 07:37:11 -0700
Message-ID: <4FE9C917.2070003@linux.intel.com>
Date: Tue, 26 Jun 2012 07:37:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340708752-6365-1-git-send-email-valentin.popa@intel.com>
In-Reply-To: <1340708752-6365-1-git-send-email-valentin.popa@intel.com>
Subject: Re: [PATCH] Fix for BUG 2636
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
X-List-Received-Date: Tue, 26 Jun 2012 14:48:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/26/2012 04:05 AM, Valentin Popa wrote:
> (-) renamed self-hosted-image to build-appliance-image
> (-) replaced build-appliance-image description
> (-) replaced qt4e-demo-image description
> (-) changed self-hosted-image ref in manual/doc and maintainers.inc
>
Please change the subject line to be a short description, such as
build-appliance-image: rename from self-hosted-image

Then in the body of commit add the tag:

[YOCTO #2636]

Also since this commits to 3 different repo's it needs to be split into 
three commits, documentation to yocto@yoctoproject.org, meta-yocto 
changes to poky@yoctoproject.org and the meta/* changes to 
openembedded-core@lists.openembedded.org

(BTW, I thought Cristi was working on Build appliance)

Sau!

> Signed-off-by: Valentin Popa<valentin.popa@intel.com>
> ---
>   documentation/poky-ref-manual/ref-images.xml       |    2 +-
>   meta-yocto/conf/distro/include/maintainers.inc     |    2 +-
>   meta/conf/multilib.conf                            |    2 +-
>   ...lf-hosted-image.bb =>  build-appliance-image.bb} |    2 +-
>   meta/recipes-qt/images/qt4e-demo-image.bb          |    2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
>   rename meta/recipes-core/images/{self-hosted-image.bb =>  build-appliance-image.bb} (91%)
>
> diff --git a/documentation/poky-ref-manual/ref-images.xml b/documentation/poky-ref-manual/ref-images.xml
> index eb30942..a027334 100644
> --- a/documentation/poky-ref-manual/ref-images.xml
> +++ b/documentation/poky-ref-manual/ref-images.xml
> @@ -108,7 +108,7 @@
>               instead of X11.
>               In order to build, this image requires specific distro configuration that enables
>               <filename>gtk</filename>  over<filename>directfb</filename>.</para></listitem>
> -<listitem><para><emphasis><filename>self-hosted-image</filename>:</emphasis>
> +<listitem><para><emphasis><filename>build-appliance-image</filename>:</emphasis>
>               An image you can run using the Yocto Project Build Appliance.
>               The image is suitable to load and boot from either
>               <ulink url='http://www.vmware.com/products/player/overview.html'>VMware Player</ulink>
> diff --git a/meta-yocto/conf/distro/include/maintainers.inc b/meta-yocto/conf/distro/include/maintainers.inc
> index b88fe2e..d60ee93 100644
> --- a/meta-yocto/conf/distro/include/maintainers.inc
> +++ b/meta-yocto/conf/distro/include/maintainers.inc
> @@ -577,7 +577,7 @@ RECIPE_MAINTAINER_pn-screen = "Valentin Popa<valentin.popa@intel.com>"
>   RECIPE_MAINTAINER_pn-screenshot = "Valentin Popa<valentin.popa@intel.com>"
>   RECIPE_MAINTAINER_pn-scrnsaverproto = "Laurentiu Palcu<laurentiu.palcu@intel.com>"
>   RECIPE_MAINTAINER_pn-sed = "Valentin Popa<valentin.popa@intel.com>"
> -RECIPE_MAINTAINER_pn-self-hosted-image = "Saul Wold<sgw@linux.intel.com>"
> +RECIPE_MAINTAINER_pn-build-appliance-image = "Saul Wold<sgw@linux.intel.com>"
>   RECIPE_MAINTAINER_pn-setserial = "Valentin Popa<valentin.popa@intel.com>"
>   RECIPE_MAINTAINER_pn-settings-daemon = "Valentin Popa<valentin.popa@intel.com>"
>   RECIPE_MAINTAINER_pn-sgml-common = "Scott Garman<scott.a.garman@intel.com>"
> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
> index cea8694..92a7813 100644
> --- a/meta/conf/multilib.conf
> +++ b/meta/conf/multilib.conf
> @@ -583,7 +583,7 @@ BBCLASSEXTEND_append_pn-sat-solver = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-screen = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-scrnsaverproto = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-sed = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-self-hosted-image = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-build-appliance-image = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-service = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-setserial = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-settings-daemon = " ${MULTILIBS}"
> diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/build-appliance-image.bb
> similarity index 91%
> rename from meta/recipes-core/images/self-hosted-image.bb
> rename to meta/recipes-core/images/build-appliance-image.bb
> index aef1507..6eb88f3 100644
> --- a/meta/recipes-core/images/self-hosted-image.bb
> +++ b/meta/recipes-core/images/build-appliance-image.bb
> @@ -1,4 +1,4 @@
> -DESCRIPTION = "Version 1.0-r6 of the self-hosted image."
> +DESCRIPTION = "An image you can boot and run using either the VMware Player or VMware Workstation.  For more information, see the<a href='http://www.yoctoproject.org/documentation/build-appliance'>Build Appliance page</a>."
>   IMAGE_INSTALL = "task-core-boot task-core-apps-console task-core-ssh-openssh task-self-hosted"
>
>   LICENSE = "MIT"
> diff --git a/meta/recipes-qt/images/qt4e-demo-image.bb b/meta/recipes-qt/images/qt4e-demo-image.bb
> index 794dac5..8f9478d 100644
> --- a/meta/recipes-qt/images/qt4e-demo-image.bb
> +++ b/meta/recipes-qt/images/qt4e-demo-image.bb
> @@ -1,4 +1,4 @@
> -DESCRIPTION = "Version 1.0-r1 of the qtr3-demo-image."
> +DESCRIPTION = "An image that will launch into the demo application for the embedded (not based on X11) version of Qt."
>   LICENSE = "MIT"
>   PR="r2"
>


