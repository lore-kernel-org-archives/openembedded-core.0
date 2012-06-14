Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SfDeG-000357-Bp
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 19:15:56 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Jun 2012 10:05:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="157661891"
Received: from unknown (HELO [10.255.12.138]) ([10.255.12.138])
	by orsmga002.jf.intel.com with ESMTP; 14 Jun 2012 10:05:17 -0700
Message-ID: <4FDA19CD.3080003@linux.intel.com>
Date: Thu, 14 Jun 2012 10:05:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1339678865-3610-1-git-send-email-laurentiu.palcu@intel.com>
In-Reply-To: <1339678865-3610-1-git-send-email-laurentiu.palcu@intel.com>
Subject: Re: [PATCH] core-image-gtk-directfb, qt4e-demo-image: Remove module-init-tools from IMAGE_INSTALL list
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
X-List-Received-Date: Thu, 14 Jun 2012 17:15:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2012 06:01 AM, Laurentiu Palcu wrote:
> As module-init-tools package does not exist anymore there's no reason to
> have it in the IMAGE_INSTALL package list. If RPM package manager is
> used, build will fail with:
>
> Unable to find package module-init-tools (module-init-tools)!
>
Do we need to replace it with kmod?

Sau!

> [Yocto #2580]
>
> Signed-off-by: Laurentiu Palcu<laurentiu.palcu@intel.com>
> ---
>   .../images/core-image-gtk-directfb.bb              |    3 +--
>   meta/recipes-qt/images/qt4e-demo-image.bb          |    3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-graphics/images/core-image-gtk-directfb.bb b/meta/recipes-graphics/images/core-image-gtk-directfb.bb
> index a5fba17..dcf5165 100644
> --- a/meta/recipes-graphics/images/core-image-gtk-directfb.bb
> +++ b/meta/recipes-graphics/images/core-image-gtk-directfb.bb
> @@ -1,5 +1,5 @@
>   LICENSE = "MIT"
> -PR="r0"
> +PR="r1"
>
>
>   LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
> @@ -17,7 +17,6 @@ inherit core-image
>   IMAGE_INSTALL += "\
>   	${CORE_IMAGE_BASE_INSTALL} \
>   	task-core-basic \
> -	module-init-tools \
>   	task-core-gtk-directfb-base \
>   "
>
> diff --git a/meta/recipes-qt/images/qt4e-demo-image.bb b/meta/recipes-qt/images/qt4e-demo-image.bb
> index 6c0dc70..794dac5 100644
> --- a/meta/recipes-qt/images/qt4e-demo-image.bb
> +++ b/meta/recipes-qt/images/qt4e-demo-image.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "Version 1.0-r1 of the qtr3-demo-image."
>   LICENSE = "MIT"
> -PR="r1"
> +PR="r2"
>
>   LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
>                       file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> @@ -13,7 +13,6 @@ RDEPENDS_${PN} += " \
>
>   IMAGE_INSTALL += "\
>   	${CORE_IMAGE_BASE_INSTALL} \
> -	module-init-tools \
>   	task-qt4e-base \
>   "
>


