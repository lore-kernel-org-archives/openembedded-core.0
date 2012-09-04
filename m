Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1T8xL6-0007JH-LO
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 19:55:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Sep 2012 10:42:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,368,1344236400"; d="scan'208";a="196642297"
Received: from unknown (HELO envy.home) ([10.7.199.69])
	by orsmga002.jf.intel.com with ESMTP; 04 Sep 2012 10:42:41 -0700
Message-ID: <50463D7C.2050302@linux.intel.com>
Date: Tue, 04 Sep 2012 10:42:20 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1346771668.git.bruce.ashfield@windriver.com>
	<fc1c6360e80b1d094a5b618cb7aeabe0700a4971.1346771668.git.bruce.ashfield@windriver.com>
In-Reply-To: <fc1c6360e80b1d094a5b618cb7aeabe0700a4971.1346771668.git.bruce.ashfield@windriver.com>
X-Enigmail-Version: 1.4.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 1/1] linux-yocto-rt: update to 3.4.9-rt17
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
X-List-Received-Date: Tue, 04 Sep 2012 17:55:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

qemux86 now builds and boots to login prompt for me.

On 09/04/2012 08:19 AM, Bruce Ashfield wrote:
> Bumping the 3.4 kernel to -rt17.
> 
> As well as picking up the normal set of bug fixes, this update fixes
> a boot issue that was introduced during merging of kernel.org -stable
> updates into the -rt branches (in the timekeeping code).
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> index 9cc7e99..ae64de1 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> @@ -8,8 +8,8 @@ LINUX_KERNEL_TYPE = "preempt-rt"
>  
>  KMETA = "meta"
>  
> -SRCREV_machine ?= "eb9c0669c66041eeae72b853011ec31ad81cc35d"
> -SRCREV_machine_qemuppc ?= "76add8441a2b6ed26bcc9268819782b2eec99001"
> +SRCREV_machine ?= "52518e60a7220385f31cdd09b83dacd84581c88c"
> +SRCREV_machine_qemuppc ?= "e6db5e91e1a5b31d26ac67778df7fb1fd5e42aa5"
>  SRCREV_meta ?= "463299bc2e533e1bd38b0053ae7b210980f269c3"
>  
>  PR = "${INC_PR}.0"
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


