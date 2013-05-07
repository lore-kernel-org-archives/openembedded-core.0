Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UZmuN-0004FA-9y
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 20:47:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 May 2013 11:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,629,1363158000"; d="scan'208";a="333339031"
Received: from envy2.jf.intel.com (HELO envy2.home) ([10.7.199.54])
	by orsmga002.jf.intel.com with ESMTP; 07 May 2013 11:28:02 -0700
Message-ID: <518947B2.2000908@linux.intel.com>
Date: Tue, 07 May 2013 11:28:02 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1367946490-9159-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1367946490-9159-1-git-send-email-ross.burton@intel.com>
X-Enigmail-Version: 1.5.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemux86: disable paravirt guest in linux 3.4, causes test failures
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
X-List-Received-Date: Tue, 07 May 2013 18:47:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/07/2013 10:08 AM, Ross Burton wrote:
> The shutdown sanity test that we previously saw on qemux86-64 in 2.6.37 have
> started to re-appear reproducably on qemux86 in 3.4 in the Danny series.  Until
> this can be root-caused and fixed in the kernel, disable paravirtualisation
> across all kernels and all qemu machines.
> 
> [ YOCTO #4196 ]
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta/recipes-kernel/linux/linux-yocto_3.4.bb |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> index b81b9ac..18d665a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> @@ -26,5 +26,4 @@ COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
>  KERNEL_FEATURES_append = " features/netfilter/netfilter.scc"
>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
> -KERNEL_FEATURES_append_qemux86=" cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


