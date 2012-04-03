Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFDao-0006lV-Fi
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 01:56:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Apr 2012 16:47:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125048708"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2012 16:47:43 -0700
Message-ID: <4F7B8C1F.40402@linux.intel.com>
Date: Tue, 03 Apr 2012 16:47:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333264701.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1333264701.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 0/1] tiny: Update linux-yocto-tiny to 3.2
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
X-List-Received-Date: Tue, 03 Apr 2012 23:56:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/2012 12:19 AM, Darren Hart wrote:
> The following changes since commit c97f7f4e4ecd6c431712059c34ebc17b68b055ae:
>
>    cross-canadian.bbclass: fix rpath for sdk executables (2012-03-31 18:00:36 +0100)
>
> are available in the git repository at:
>    git://git.infradead.org/users/dvhart/oe-core.git dvhart/tiny
>    http://git.infradead.org/users/dvhart/oe-core.git/shortlog/refs/heads/dvhart/tiny
>
> Darren Hart (1):
>    tiny: Update linux-yocto-tiny to 3.2
>
>   meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg |    9 -
>   .../recipes-kernel/linux/linux-yocto-tiny/core.cfg |   19 -
>   .../linux/linux-yocto-tiny/debug.cfg               |    5 -
>   .../linux/linux-yocto-tiny/devtmpfs.cfg            |    6 -
>   .../linux/linux-yocto-tiny/e1000.cfg               |    7 -
>   .../recipes-kernel/linux/linux-yocto-tiny/ext2.cfg |    1 -
>   .../recipes-kernel/linux/linux-yocto-tiny/ext3.cfg |    2 -
>   .../recipes-kernel/linux/linux-yocto-tiny/lzma.cfg |    3 -
>   meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg |   26 -
>   .../linux/linux-yocto-tiny/qemux86/defconfig       |  613 --------------------
>   .../linux/linux-yocto-tiny/ramfs.cfg               |    6 -
>   .../linux/linux-yocto-tiny/rtc-pc.cfg              |   13 -
>   .../linux/linux-yocto-tiny/serial.cfg              |    7 -
>   meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg |    7 -
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb  |   39 --
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb  |   25 +
>   16 files changed, 25 insertions(+), 763 deletions(-)
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/core.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/debug.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/devtmpfs.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/e1000.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ext2.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ext3.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/lzma.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/qemux86/defconfig
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ramfs.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/rtc-pc.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/serial.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
>

Merged into OE-Core

Thanks
	Sau!


