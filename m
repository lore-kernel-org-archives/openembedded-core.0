Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SlgxB-0005Rk-LT
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 15:46:13 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Jul 2012 06:35:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="160533126"
Received: from unknown (HELO envy.home) ([10.255.13.27])
	by orsmga001.jf.intel.com with ESMTP; 02 Jul 2012 06:35:11 -0700
Message-ID: <4FF1A336.1090401@linux.intel.com>
Date: Mon, 02 Jul 2012 06:33:42 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <2e2f72682e773f4f97db3181112e7eb569df09da.1341025161.git.dvhart@linux.intel.com>
	<444946729b775e1cb91ebb599f9aca4458bdf176.1341025161.git.dvhart@linux.intel.com>
In-Reply-To: <444946729b775e1cb91ebb599f9aca4458bdf176.1341025161.git.dvhart@linux.intel.com>
X-Enigmail-Version: 1.4.2
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org, Poky <poky@yoctoproject.org>
Subject: Re: [PATCH 3/3] core-image*sdk: Add kernel-dev to sdk images
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
X-List-Received-Date: Mon, 02 Jul 2012 13:46:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Paul, do you think this patch is necessary or is this just covering up
for Bug 2595?

--
Darren

On 06/29/2012 09:25 PM, Darren Hart wrote:
> While sdk images already have dev-pkgs included, the kernel-dev package
> is special and does not get installed. Add kernel-dev explicitly to the
> *sdk image recipes.
> 
> Note: We have to be careful with "IMAGE_INSTALL +=" as it must appear
> after "inherit core-image" which makes an "IMAGE_INSTALL ?=" assignment.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Jessica Zhang <jessica.zhang@intel.com>
> CC: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-extended/images/core-image-lsb-sdk.bb |    1 +
>  meta/recipes-rt/images/core-image-rt-sdk.bb        |    2 +-
>  meta/recipes-sato/images/core-image-sato-sdk.bb    |    3 +++
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/images/core-image-lsb-sdk.bb b/meta/recipes-extended/images/core-image-lsb-sdk.bb
> index 32a5077..047d66b 100644
> --- a/meta/recipes-extended/images/core-image-lsb-sdk.bb
> +++ b/meta/recipes-extended/images/core-image-lsb-sdk.bb
> @@ -10,6 +10,7 @@ IMAGE_INSTALL = "\
>      ${CORE_IMAGE_BASE_INSTALL} \
>      task-core-basic \
>      task-core-lsb \
> +    kernel-dev \
>      "
>  
>  inherit core-image
> diff --git a/meta/recipes-rt/images/core-image-rt-sdk.bb b/meta/recipes-rt/images/core-image-rt-sdk.bb
> index 6ec2d00..29512e3 100644
> --- a/meta/recipes-rt/images/core-image-rt-sdk.bb
> +++ b/meta/recipes-rt/images/core-image-rt-sdk.bb
> @@ -11,6 +11,6 @@ DEPENDS = "linux-yocto-rt"
>  IMAGE_FEATURES += "dev-pkgs tools-sdk"
>  EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
>  
> -IMAGE_INSTALL += "rt-tests"
> +IMAGE_INSTALL += "rt-tests kernel-dev"
>  
>  LICENSE = "MIT"
> diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
> index eed1698..75ed64f 100644
> --- a/meta/recipes-sato/images/core-image-sato-sdk.bb
> +++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
> @@ -11,3 +11,6 @@ EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
>  LICENSE = "MIT"
>  
>  inherit core-image
> +
> +IMAGE_INSTALL += "kernel-dev"
> +
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




