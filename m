Return-Path: <saul.wold@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 644077319F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 17:37:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 02 Mar 2016 09:37:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,529,1449561600"; d="scan'208";a="899574770"
Received: from dekomer-mobl.amr.corp.intel.com ([10.254.48.247])
	by orsmga001.jf.intel.com with ESMTP; 02 Mar 2016 09:37:10 -0800
Message-ID: <1456940230.4346.102.camel@intel.com>
From: Saul Wold <saul.wold@intel.com>
To: mariano.lopez@linux.intel.com, openembedded-core@lists.openembedded.org
Date: Wed, 02 Mar 2016 09:37:10 -0800
In-Reply-To: <5f7a27cd00738654a1f7324e234ea853a57c8b92.1456906424.git.mariano.lopez@linux.intel.com>
References: <cover.1456906424.git.mariano.lopez@linux.intel.com>
	<5f7a27cd00738654a1f7324e234ea853a57c8b92.1456906424.git.mariano.lopez@linux.intel.com>
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] yocto-bsp: Set linux-yocto-4.1 as default for x86-64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Mar 2016 17:37:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-03-02 at 08:14 +0000, mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> Setting default kernel to linux-yocto-4.1 now that
> 3.19 bbappend is no longer in the tree.
> 
This should default to 4.4 for 2.1, correct? 4.1 is the LSB/LTS kernel
for 2.1.

Sau!

> [YOCTO #9047]
> 
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  .../target/arch/x86_64/recipes-kernel/linux/kernel-
> list.noinstall       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-
> kernel/linux/kernel-list.noinstall
> b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-
> kernel/linux/kernel-list.noinstall
> index dbbe934..7676ca8 100644
> --- a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-
> kernel/linux/kernel-list.noinstall
> +++ b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-
> kernel/linux/kernel-list.noinstall
> @@ -2,4 +2,4 @@
>  {{ input type:"boolean" name:"use_default_kernel" prio:"10"
> msg:"Would you like to use the default (4.1) kernel? (y/n)"
> default:"y"}}
>  
>  {{ if kernel_choice != "custom" and use_default_kernel == "n": }}
> -{{ input type:"choicelist" name:"kernel_choice"
> gen:"bsp.kernel.kernels" prio:"10" msg:"Please choose the kernel to
> use in this BSP:" default:"linux-yocto_3.19"}}
> +{{ input type:"choicelist" name:"kernel_choice"
> gen:"bsp.kernel.kernels" prio:"10" msg:"Please choose the kernel to
> use in this BSP:" default:"linux-yocto_4.1"}}
> -- 
> 2.6.2
> 

