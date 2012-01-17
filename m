Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnFv7-0007KK-R9
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 21:46:18 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Jan 2012 12:38:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="99696254"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga002.jf.intel.com with ESMTP; 17 Jan 2012 12:38:39 -0800
Message-ID: <4F15DC4F.9050901@linux.intel.com>
Date: Tue, 17 Jan 2012 12:38:39 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326729399.git.zumeng.chen@windriver.com>
In-Reply-To: <cover.1326729399.git.zumeng.chen@windriver.com>
Subject: Re: [PATCH 0/4] [V6] lttng-2.0 new recipe
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
X-List-Received-Date: Tue, 17 Jan 2012 20:46:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/16/2012 08:06 AM, Zumeng Chen wrote:
> Hi Saul,
>
> Changes vs previous versions:
>   1 ) Create directories for patches.
>   2 ) Update the latest git HEAD for all, build passed.
>
> Thanks,
> Zumeng
>
> The following changes since commit b02e7d45e06d1fbaf072deea9f3773ca14787e65:
>
>    gconf: enable gtk+ 2.0 support to build gconf-sanity-check-2 (2012-01-16 14:11:25 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zumeng/lttng-2.0
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zumeng/lttng-2.0
>
> Zumeng Chen (4):
>    lttng-ust: Update to 2.0
>    lttng-tools: Update to 2.0-pre16
>    lttng-modules: Update to 2.0
>    babeltrace: Integrated from version 0.8
>
>   meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb    |   28 +++++++++++++
>   ...modules-replace-KERNELDIR-with-KERNEL_SRC.patch |   41 ++++++++++++++++++++
>   .../lttng-2.0/lttng-modules_2.0.pre11.bb           |   27 +++++++++++++
>   ...tools-fix-compiling-error-for-powerpc-arm.patch |   27 +++++++++++++
>   .../lttng-2.0/lttng-tools_2.0-pre16.bb             |   30 ++++++++++++++
>   meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb   |   30 ++++++++++++++
>   6 files changed, 183 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools/lttng-tools-fix-compiling-error-for-powerpc-arm.patch
>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb
>
Merged into OE-Core

Thanks
	Sau!


