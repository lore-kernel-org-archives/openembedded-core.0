Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 914A177115
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 18:50:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2016 10:50:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="907019033"
Received: from lsandov1-mob1-linux.zpn.intel.com (HELO [10.219.5.43])
	([10.219.5.43])
	by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2016 10:50:32 -0800
To: openembedded-core@lists.openembedded.org
References: <1454408746-552-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <56B0FB79.10308@linux.intel.com>
Date: Tue, 2 Feb 2016 12:54:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454408746-552-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
Cc: saul.wold@intel.com
Subject: Re: [PATCH 0/4][jethro] yocto-bsp related patches backported from master
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
X-List-Received-Date: Tue, 02 Feb 2016 18:50:32 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Wrong list. I will be sent again, this time to poky@yoctoproject.org

On 02/02/2016 04:25 AM, leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> Set of patches that mainly fixes the do_patch issues found when creating
> BSP layers with the yocto-bsp tool. More detail on each patch description.
>
> Leonardo Sandoval (4):
>    yocto-bsp: Default kernel version to 4.1 on x86_64
>    yocto-bsp: Avoid duplication of user patches
>      ({{=machine}}-user-patches.scc)
>    yocto-bsp: Set KTYPE to user selected base branch
>    yocto-bsp: Set SRCREV meta/machine revisions to AUTOREV
>
>   .../arch/arm/recipes-kernel/linux/files/machine-preempt-rt.scc     | 3 ++-
>   .../arch/arm/recipes-kernel/linux/files/machine-standard.scc       | 3 ++-
>   .../target/arch/arm/recipes-kernel/linux/files/machine-tiny.scc    | 3 ++-
>   .../target/arch/arm/recipes-kernel/linux/linux-yocto-dev.bbappend  | 1 -
>   .../arch/arm/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend     | 6 +++---
>   .../arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend   | 6 +++---
>   .../arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend   | 6 +++---
>   .../arch/arm/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend    | 6 +++---
>   .../target/arch/arm/recipes-kernel/linux/linux-yocto_3.14.bbappend | 7 +++----
>   .../target/arch/arm/recipes-kernel/linux/linux-yocto_3.19.bbappend | 7 +++----
>   .../target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbappend  | 7 +++----
>   .../arch/i386/recipes-kernel/linux/files/machine-preempt-rt.scc    | 3 ++-
>   .../arch/i386/recipes-kernel/linux/files/machine-standard.scc      | 3 ++-
>   .../target/arch/i386/recipes-kernel/linux/files/machine-tiny.scc   | 3 ++-
>   .../target/arch/i386/recipes-kernel/linux/linux-yocto-dev.bbappend | 1 -
>   .../arch/i386/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend    | 6 +++---
>   .../arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend  | 6 +++---
>   .../arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend  | 6 +++---
>   .../arch/i386/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend   | 6 +++---
>   .../arch/i386/recipes-kernel/linux/linux-yocto_3.14.bbappend       | 7 +++----
>   .../arch/i386/recipes-kernel/linux/linux-yocto_3.19.bbappend       | 7 +++----
>   .../target/arch/i386/recipes-kernel/linux/linux-yocto_4.1.bbappend | 7 +++----
>   .../arch/mips/recipes-kernel/linux/files/machine-preempt-rt.scc    | 3 ++-
>   .../arch/mips/recipes-kernel/linux/files/machine-standard.scc      | 3 ++-
>   .../target/arch/mips/recipes-kernel/linux/files/machine-tiny.scc   | 3 ++-
>   .../target/arch/mips/recipes-kernel/linux/linux-yocto-dev.bbappend | 1 -
>   .../arch/mips/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend    | 6 +++---
>   .../arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend  | 6 +++---
>   .../arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend  | 6 +++---
>   .../arch/mips/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend   | 6 +++---
>   .../arch/mips/recipes-kernel/linux/linux-yocto_3.14.bbappend       | 7 +++----
>   .../arch/mips/recipes-kernel/linux/linux-yocto_3.19.bbappend       | 7 +++----
>   .../target/arch/mips/recipes-kernel/linux/linux-yocto_4.1.bbappend | 7 +++----
>   .../arch/mips64/recipes-kernel/linux/files/machine-preempt-rt.scc  | 3 ++-
>   .../arch/mips64/recipes-kernel/linux/files/machine-standard.scc    | 3 ++-
>   .../target/arch/mips64/recipes-kernel/linux/files/machine-tiny.scc | 3 ++-
>   .../arch/mips64/recipes-kernel/linux/linux-yocto-dev.bbappend      | 1 -
>   .../arch/mips64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend  | 6 +++---
>   .../mips64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend     | 6 +++---
>   .../mips64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend     | 6 +++---
>   .../arch/mips64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend | 6 +++---
>   .../arch/mips64/recipes-kernel/linux/linux-yocto_3.14.bbappend     | 5 ++---
>   .../arch/mips64/recipes-kernel/linux/linux-yocto_3.19.bbappend     | 7 +++----
>   .../arch/mips64/recipes-kernel/linux/linux-yocto_4.1.bbappend      | 7 +++----
>   .../arch/powerpc/recipes-kernel/linux/files/machine-preempt-rt.scc | 3 ++-
>   .../arch/powerpc/recipes-kernel/linux/files/machine-standard.scc   | 3 ++-
>   .../arch/powerpc/recipes-kernel/linux/files/machine-tiny.scc       | 3 ++-
>   .../arch/powerpc/recipes-kernel/linux/linux-yocto-dev.bbappend     | 1 -
>   .../arch/powerpc/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend | 6 +++---
>   .../powerpc/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend    | 6 +++---
>   .../powerpc/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend    | 6 +++---
>   .../powerpc/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend     | 6 +++---
>   .../arch/powerpc/recipes-kernel/linux/linux-yocto_3.14.bbappend    | 7 +++----
>   .../arch/powerpc/recipes-kernel/linux/linux-yocto_3.19.bbappend    | 7 +++----
>   .../arch/powerpc/recipes-kernel/linux/linux-yocto_4.1.bbappend     | 7 +++----
>   .../arch/qemu/recipes-kernel/linux/files/machine-preempt-rt.scc    | 3 ++-
>   .../arch/qemu/recipes-kernel/linux/files/machine-standard.scc      | 3 ++-
>   .../target/arch/qemu/recipes-kernel/linux/files/machine-tiny.scc   | 3 ++-
>   .../target/arch/qemu/recipes-kernel/linux/linux-yocto-dev.bbappend | 1 -
>   .../arch/qemu/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend    | 6 +++---
>   .../arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend  | 6 +++---
>   .../arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend  | 6 +++---
>   .../arch/qemu/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend   | 6 +++---
>   .../arch/qemu/recipes-kernel/linux/linux-yocto_3.14.bbappend       | 7 +++----
>   .../arch/qemu/recipes-kernel/linux/linux-yocto_3.19.bbappend       | 7 +++----
>   .../target/arch/qemu/recipes-kernel/linux/linux-yocto_4.1.bbappend | 7 +++----
>   .../arch/x86_64/recipes-kernel/linux/files/machine-preempt-rt.scc  | 3 ++-
>   .../arch/x86_64/recipes-kernel/linux/files/machine-standard.scc    | 3 ++-
>   .../target/arch/x86_64/recipes-kernel/linux/files/machine-tiny.scc | 3 ++-
>   .../target/arch/x86_64/recipes-kernel/linux/kernel-list.noinstall  | 2 +-
>   .../arch/x86_64/recipes-kernel/linux/linux-yocto-dev.bbappend      | 1 -
>   .../arch/x86_64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend  | 6 +++---
>   .../x86_64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend     | 6 +++---
>   .../x86_64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend     | 6 +++---
>   .../arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend | 6 +++---
>   .../arch/x86_64/recipes-kernel/linux/linux-yocto_3.14.bbappend     | 7 +++----
>   .../arch/x86_64/recipes-kernel/linux/linux-yocto_3.19.bbappend     | 7 +++----
>   .../arch/x86_64/recipes-kernel/linux/linux-yocto_4.1.bbappend      | 7 +++----
>   78 files changed, 189 insertions(+), 196 deletions(-)
>


