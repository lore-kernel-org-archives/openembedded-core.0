Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1REkmI-0002Vw-43
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 18:38:34 +0200
Received: from mail-ww0-f44.google.com ([74.125.82.44])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 14 Oct 2011 09:32:47 -0700
Received: by wwf22 with SMTP id 22so2571930wwf.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 09:32:46 -0700 (PDT)
Received: by 10.227.154.2 with SMTP id m2mr3169627wbw.39.1318609965719;
	Fri, 14 Oct 2011 09:32:45 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id p2sm15075904wbo.17.2011.10.14.09.32.31
	(version=SSLv3 cipher=OTHER); Fri, 14 Oct 2011 09:32:32 -0700 (PDT)
Message-ID: <4E98641D.8040608@intel.com>
Date: Fri, 14 Oct 2011 09:32:29 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1317843784.git.raj.khem@gmail.com>
In-Reply-To: <cover.1317843784.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/1] QEMU 0.15 update please test
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
X-List-Received-Date: Fri, 14 Oct 2011 16:38:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/05/2011 12:45 PM, Khem Raj wrote:
> This brings in qemu-0.15 into OE-core I have had limited testing
> on it and mainly on qemuarm. Please help testing it on other architectures
> I will also work on getting it more solidified and bring some backports
> as needed.
>
> The following changes since commit abde9f65b1617ec61e964c4b3502fd4ad2215dcf:
>
>    shared-mime-info: Upgrade recipes from 0.90 ->  0.91 (2011-10-05 12:39:47 -0700)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib kraj/qemu-update
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemu-update
>
> Khem Raj (1):
>    qemu-0.15: Add recipe and forward port patches from 0.14
>
>   .../qemu/qemu-0.15.0/arm-bgr.patch                 |   30 +
>   .../qemu/qemu-0.15.0/enable-i386-linux-user.patch  |   55 +
>   .../fallback-to-safe-mmap_min_addr.patch           |   39 +
>   .../qemu/qemu-0.15.0/fix-configure-checks.patch    |   22 +
>   .../qemu/qemu-0.15.0/fix-nogl.patch                |  127 +
>   .../qemu/qemu-0.15.0/glflags.patch                 |   15 +
>   .../qemu/qemu-0.15.0/init-info.patch               |   18 +
>   .../qemu/qemu-0.15.0/larger_default_ram_size.patch |   22 +
>   .../qemu/qemu-0.15.0/linker-flags.patch            |   25 +
>   .../qemu/qemu-0.15.0/no-strip.patch                |   15 +
>   .../qemu/qemu-0.15.0/opengl-sdl-fix.patch          |   43 +
>   .../qemu/qemu-0.15.0/powerpc_rom.bin               |  Bin 0 ->  4096 bytes
>   .../qemu/qemu-0.15.0/qemu-git-qemugl-host.patch    |34368 ++++++++++++++++++++
>   .../qemu/qemu-0.15.0/qemu-vmware-vga-depth.patch   |  118 +
>   .../qemugl-allow-glxcontext-release.patch          |   65 +
>   .../qemu/qemu-0.15.0/qemugl-fix.patch              |   74 +
>   meta/recipes-devtools/qemu/qemu_0.15.0.bb          |   45 +
>   17 files changed, 35081 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/arm-bgr.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/enable-i386-linux-user.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/fallback-to-safe-mmap_min_addr.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/fix-configure-checks.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/fix-nogl.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/glflags.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/init-info.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/larger_default_ram_size.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/linker-flags.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/no-strip.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/opengl-sdl-fix.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/powerpc_rom.bin
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/qemu-git-qemugl-host.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/qemu-vmware-vga-depth.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/qemugl-allow-glxcontext-release.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/qemugl-fix.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu_0.15.0.bb
>

Merged into OE-Core

I needed to add an additional patch to add glib-2.0-native to the 
qemu-native depends

We will remove qemu-0.14 after we get through a QA cycle.

Thanks
	Sau!



