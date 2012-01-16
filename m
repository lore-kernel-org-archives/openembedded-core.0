Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RmelZ-0000Xx-0J
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 06:05:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jan 2012 20:58:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="107446207"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by fmsmga001.fm.intel.com with ESMTP; 15 Jan 2012 20:58:20 -0800
Message-ID: <4F13AE6C.90607@linux.intel.com>
Date: Sun, 15 Jan 2012 20:58:20 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326418292.git.zumeng.chen@windriver.com>
In-Reply-To: <cover.1326418292.git.zumeng.chen@windriver.com>
Subject: Re: [PATCH 0/4] [V5] lttng-2.0 new recipe
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
X-List-Received-Date: Mon, 16 Jan 2012 05:05:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2012 05:44 PM, Zumeng Chen wrote:
> V5 Changes vs all previous versions:
> 1 ) fixed all Darren's comments;
> 2 ) fixed all Saul's comments;
>      +LICENSE = "MIT&  GPLv2" for 0004-babeltrace..
>      Upstream-Status: Pending for lttng-tools-fix-compiling..
>      +LICENSE = "GPLv2&  LGPLv2.1" for 0002-lttng-tools-..
>
> Thanks,
> Zumeng
>
> The following changes since commit 0f4d99d207b224bb9ce23de00a48f795ae20b3a0:
>
>    multilib.conf: Clean up file and add missing entries for various dependencies (2012-01-11 23:53:32 +0000)
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
>   meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb   |   25 ++++++++++++
>   6 files changed, 178 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools-fix-compiling-error-for-powerpc-arm.patch

Zumeng,

My apologies for not catching this before, I just noticed that these 
patch files are not in a subdirectory, they should be located in a 
directory that is matches either the recipe name or recipe name with 
version (if they are specific to that version of the upstream).

Sau!

>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
>   create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb
>


