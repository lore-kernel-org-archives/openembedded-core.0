Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UKZde-0004qX-Go
	for Openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 20:34:32 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Mar 2013 12:17:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,913,1355126400"; d="scan'208";a="276274763"
Received: from unknown (HELO envy.home) ([10.255.13.151])
	by azsmga001.ch.intel.com with ESMTP; 26 Mar 2013 12:17:28 -0700
Message-ID: <5151F448.4050906@linux.intel.com>
Date: Tue, 26 Mar 2013 12:17:28 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: nitin.a.kamble@intel.com
References: <cover.1364316538.git.nitin.a.kamble@intel.com>
	<cfbc9b44fbaff5d2ad0b74d0b78924ff9d14d5b0.1364316538.git.nitin.a.kamble@intel.com>
In-Reply-To: <cfbc9b44fbaff5d2ad0b74d0b78924ff9d14d5b0.1364316538.git.nitin.a.kamble@intel.com>
X-Enigmail-Version: 1.5.1
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] grub-efi-native_2.00.bb: fix a build issue
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
X-List-Received-Date: Tue, 26 Mar 2013 19:34:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/26/2013 09:51 AM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Due to recent change in the oecore layer grub-efi recipe uses separate
> builddir and the paths used in the do_deply need to change accordingly.
> 
> This change avoids this build issue:
> install: cannot stat `/build-fri2/tmp/work/x86_64-linux/grub-efi-i586-native/2.00-r1/grub-2.00/bootia32.efi': No such file or directory
> ERROR: Function failed: do_deploy (see /build-fri2/tmp/work/x86_64-linux/grub-efi-i586-native/2.00-r1/temp/log.do_deploy.5875 for further information)
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta/recipes-bsp/grub/grub-efi-native_2.00.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
> index 14ab9ea..6f8ba8e 100644
> --- a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
> +++ b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
> @@ -71,7 +71,7 @@ do_mkimage() {
>  addtask mkimage after do_compile before do_install
>  
>  do_deploy() {
> -	install -m 644 ${S}/${GRUB_IMAGE} ${DEPLOYDIR}
> +	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
>  }
>  addtask deploy after do_install before do_build
>  
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


