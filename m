Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SkfTn-0006Ja-DA
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 19:59:39 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 Jun 2012 10:48:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117442224"
Received: from unknown (HELO envy.home) ([10.255.13.25])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Jun 2012 10:48:42 -0700
Message-ID: <4FEDEA1E.6080503@linux.intel.com>
Date: Fri, 29 Jun 2012 10:47:10 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340396533-5386-2-git-send-email-ray.danks@se-eng.com>
	<1340984497-32423-2-git-send-email-ray.danks@se-eng.com>
In-Reply-To: <1340984497-32423-2-git-send-email-ray.danks@se-eng.com>
X-Enigmail-Version: 1.4.2
Subject: Re: [PATCH 2/2 v2] mkelfimage: Add stable git build (initial recipe)
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
X-List-Received-Date: Fri, 29 Jun 2012 17:59:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 06/29/2012 08:41 AM, Raymond Danks wrote:
> Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
> ---
> This was originally submitted to the openembedded project:
> http://patches.openembedded.org/patch/7687/
> 
> v2:
>  Remove depreciated NATIVE_INSTALL_WORKS
> 
>  meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |   17 +++++++++++++++++
>  1 files changed, 17 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> 
> diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> new file mode 100644
> index 0000000..1224a63
> --- /dev/null
> +++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "A utility to create ELF boot images from Linux kernel images"
> +HOMEPAGE = "http://www.coreboot.org/Mkelfimage"
> +SECTION = "devel"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a"
> +
> +SRCREV = "e13632a939e7dde8d7d44fc73e73a41dae8060c3"
> +PV = "1.0.0+gitr${SRCPV}"
> +PR = "r1"

Minor, but I believe this should be "r0" for the initial creation of a
recipe.


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




