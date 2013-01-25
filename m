Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TytIf-0001dh-6s
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Jan 2013 01:07:13 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2013 15:50:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,541,1355126400"; d="scan'208";a="276791694"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.79])
	by orsmga002.jf.intel.com with ESMTP; 25 Jan 2013 15:51:37 -0800
Message-ID: <51031A87.6030506@linux.intel.com>
Date: Fri, 25 Jan 2013 15:51:35 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1359157635-2082-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1359157635-2082-1-git-send-email-sgw@linux.intel.com>
X-Enigmail-Version: 1.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] poky-tiny: Update for DISTRO_FEATURES_INITMAN
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
X-List-Received-Date: Sat, 26 Jan 2013 00:07:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/25/2013 03:47 PM, Saul Wold wrote:
> This patch accounts for the addition of DISTRO_FEATURES_INITMAN which
> sets the VIRTUAL_RUNTIME_init_manager, so that does not need to be set.
> 

Thank you Saul!


> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta-yocto/conf/distro/poky-tiny.conf |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-yocto/conf/distro/poky-tiny.conf b/meta-yocto/conf/distro/poky-tiny.conf
> index 347280a..1ae8242 100644
> --- a/meta-yocto/conf/distro/poky-tiny.conf
> +++ b/meta-yocto/conf/distro/poky-tiny.conf
> @@ -84,6 +84,7 @@ DISTRO_FEATURES_NET = "ipv4"
>  DISTRO_FEATURES_USB = "usbhost"
>  #DISTRO_FEATURES_USBGADGET = "usbgadget"
>  #DISTRO_FEATURES_WIFI = "wifi"
> +DISTRO_FEATURES_INITMAN = "tiny-init"
>  
>  DISTRO_FEATURES = "${DISTRO_FEATURES_TINY} \
>                     ${DISTRO_FEATURES_NET} \
> @@ -96,7 +97,6 @@ DISTRO_FEATURES = "${DISTRO_FEATURES_TINY} \
>  # Use tmpdevfs and the busybox runtime services
>  VIRTUAL-RUNTIME_dev_manager = ""
>  VIRTUAL-RUNTIME_login_manager = ""
> -VIRTUAL-RUNTIME_init_manager = "tiny-init"
>  VIRTUAL-RUNTIME_keymaps = ""
>  
>  # FIXME: Consider adding "modules" to MACHINE_FEATURES and using that in
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


