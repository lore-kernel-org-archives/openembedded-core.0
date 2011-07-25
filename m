Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlNL5-0005cu-A7
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 17:45:03 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2011 08:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,262,1309762800"; d="scan'208";a="31185480"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2011 08:40:49 -0700
Message-ID: <4E2D8E81.4040902@linux.intel.com>
Date: Mon, 25 Jul 2011 08:40:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311337940.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1311337940.git.dexuan.cui@intel.com>
Subject: Re: [v2 PATCH 0/2] upgrade tcf-agent to the latest stable revision 0.0+svnr1855
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
X-List-Received-Date: Mon, 25 Jul 2011 15:45:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/22/2011 05:44 AM, Dexuan Cui wrote:
> Changes from the previous version:
> 1) add DEPENDS = "util-linux" to resolve the uuid.h issue
>> fatal error: uuid/uuid.h: No such file or directory | compilation
>
> 2) add RDEPENDS_${PN} = "bash"
> buxybox's sh doesn't work with tcf-agent, so we need bash.
>
> 3) update MAKE_OS:
> MAKE_OS = `echo ${TARGET_OS} | sed s,^linux.*,GNU/Linux,`
> e.g., for qemuarm, we need to change linux-gnueabi to GNU/Linux.
> This is necessary due to the new tcf-agent's Makefile's coding.
>
> 4) add
> +# They don't build on ARM and we don't need them actually.
> +CFLAGS += "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
> +    -DSERVICE_Memory=0 -DSERVICE_Registers=0 -DSERVICE_MemoryMap=0 \
> +    -DSERVICE_StackTrace=0 -DSERVICE_Symbols=0 -DSERVICE_LineNumbers=0 \
> +    -DSERVICE_Expressions=0"
>
> Lianhao and Dexuan tested the v2 patches on qemux86, qemux86-64, qemuarm,
> qemuppc and qemumips with both incremental and full building, and runtime
> testings.
>
> Thanks,
> -- Lianhao and Dexuan
>
> The following changes since commit 068839698fe192d8846c0ed4db65861448e8e524:
>
>    eglibc: fix runtime assertion failure (2011-07-13 12:34:30 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dcui/tcf-agent
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/tcf-agent
>
> Dexuan Cui (2):
>    tcf-agent: upgrade to the latest stable revision 0.0+svnr1855
>    distro_tracking_fields.inc: update the info for tcf-agent
>
>   .../conf/distro/include/distro_tracking_fields.inc |   12 +-
>   .../tcf-agent/tcf-agent/fix_ranlib.patch           |   14 +
>   .../tcf-agent/tcf-agent/fix_tcf-agent.init.patch   |   14 +-
>   .../tcf-agent/tcf-agent/terminals_agent.patch      | 1027 --------------------
>   meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb   |   32 +-
>   5 files changed, 50 insertions(+), 1049 deletions(-)
>   create mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch
>   delete mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/terminals_agent.patch
>
Merged into OE-Core

Thanks
	Sau!


