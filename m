Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RlNSq-0000We-7K
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 17:25:20 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Jan 2012 08:17:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="97605632"
Received: from btwarden-mobl1.amr.corp.intel.com (HELO envy.home)
	([10.7.199.156])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2012 08:17:47 -0800
Message-ID: <4F0F0797.4000500@linux.intel.com>
Date: Thu, 12 Jan 2012 08:17:27 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326245504-22965-1-git-send-email-zumeng.chen@windriver.com>
In-Reply-To: <1326245504-22965-1-git-send-email-zumeng.chen@windriver.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [V4]lttng-2.0 new recipe
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
X-List-Received-Date: Thu, 12 Jan 2012 16:25:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Zumeng,

I reviewed V4 from the git link below ( didn't see the patches
themselved hit the list ).

The patch in 1/4: "+Subject: [PATCH 1/1] Fix compiling error on powerpc
and arm" is missing an UpstreamStatus tag. Otherwise, it looks ready to me.

--
Darren

On 01/10/2012 05:31 PM, Zumeng Chen wrote:
> Changes of V4:
>   Fixed all comments from Darrent;
>   To: OE-core.
> 
> The following changes since commit 4a8a3c503fd896593b787c26edbe46a7324e494e:
> 
>   Revert "site/common-uclibc: Cache gl_cv_func_wcwidth_works" (2012-01-10 18:33:25 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zumeng/lttng-2.0
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zumeng/lttng-2.0
> 
> Zumeng Chen (4):
>   lttng-ust: Integrate into yocto linux
>   lttng-tools: Integrated from git repo.
>   lttng-modules: from lttng-modules 2.0 git repo.
>   babeltrace: Integrated from version 0.8
> 
>  meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb    |   28 +++++++++++++
>  ...modules-replace-KERNELDIR-with-KERNEL_SRC.patch |   41 ++++++++++++++++++++
>  .../lttng-2.0/lttng-modules_2.0.pre11.bb           |   27 +++++++++++++
>  ...tools-fix-compiling-error-for-powerpc-arm.patch |   28 +++++++++++++
>  .../lttng-2.0/lttng-tools_2.0-pre16.bb             |   30 ++++++++++++++
>  meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb   |   25 ++++++++++++
>  6 files changed, 179 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
>  create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
>  create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
>  create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools-fix-compiling-error-for-powerpc-arm.patch
>  create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
>  create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


