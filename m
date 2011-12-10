Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren.hart@intel.com>) id 1RZBWC-0001dK-8Q
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 02:14:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2011 17:06:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="85617440"
Received: from unknown (HELO envy.home) ([10.255.12.30])
	by orsmga002.jf.intel.com with ESMTP; 09 Dec 2011 17:06:21 -0800
Message-ID: <4EE2B09D.4030509@intel.com>
Date: Fri, 09 Dec 2011 17:06:37 -0800
From: Darren Hart <darren.hart@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1323477267.5309.206.camel@ted>
In-Reply-To: <1323477267.5309.206.camel@ted>
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Allow do_compile_kernelmodules to use PARALLEL_MAKE
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
X-List-Received-Date: Sat, 10 Dec 2011 01:14:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2011 04:34 PM, Richard Purdie wrote:
> Without this we don't take advantage of any configured multiple CPU
> cores which seems a shame.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Thanks RP,

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index d0cc279..120a524 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -89,7 +89,7 @@ kernel_do_compile() {
>  do_compile_kernelmodules() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>  	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
> -		oe_runmake modules  CC="${KERNEL_CC}" LD="${KERNEL_LD}"
> +		oe_runmake ${PARALLEL_MAKE} modules  CC="${KERNEL_CC}" LD="${KERNEL_LD}"
>  	else
>  		bbnote "no modules to compile"
>  	fi
> 
> 


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


