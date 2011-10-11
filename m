Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RDUmD-0003KM-Ex
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 07:21:17 +0200
Received: by iadx2 with SMTP id x2so8741960iad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 22:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=rICG/1TNlA44JgFiYdkr1hIaUG72Pa61ae5KEUm/DqU=;
	b=SVrHi88N/Mz23l8xUwzA3rbRyjqEModGVvdZ5Y6OPgVQ+OnALW8z/S7vp0VsxqH/dp
	xzJheBfUn1579qwKtuOy0lO3MFD0HRq0jeRAeKJyOLlPU+ivmrZBJKSouqN/SXUzpTtM
	fYLGyPPCiHKfnKjyw12/j/sfgbnOG/di+Syrw=
Received: by 10.42.146.134 with SMTP id j6mr23132584icv.45.1318310130687;
	Mon, 10 Oct 2011 22:15:30 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net.
	[99.57.141.118])
	by mx.google.com with ESMTPS id 2sm52694344ibf.0.2011.10.10.22.15.28
	(version=SSLv3 cipher=OTHER); Mon, 10 Oct 2011 22:15:29 -0700 (PDT)
Message-ID: <4E93D0EC.6000107@gmail.com>
Date: Mon, 10 Oct 2011 22:15:24 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Saul Wold <saul.wold@intel.com>
References: <cover.1317843784.git.raj.khem@gmail.com>
	<4E927BBE.3030908@intel.com>
	<CAMKF1soHxwjCx4U9xErYXnwYdRo1ksawSZGBZgF8iXDODjeLfA@mail.gmail.com>
	<4E938B7E.8030105@intel.com>
In-Reply-To: <4E938B7E.8030105@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 11 Oct 2011 05:21:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2011 5:19 PM, Saul Wold wrote:
> On 10/10/2011 05:08 PM, Khem Raj wrote:
>> On Sun, Oct 9, 2011 at 9:59 PM, Saul Wold<saul.wold@intel.com> wrote:
>>> On 10/05/2011 12:45 PM, Khem Raj wrote:
>>>>
>>>> This brings in qemu-0.15 into OE-core I have had limited testing
>>>> on it and mainly on qemuarm. Please help testing it on other
>>>> architectures
>>>> I will also work on getting it more solidified and bring some backports
>>>> as needed.
>>>>
>>> Khem,
>>>
>>> Did you do any kind of non-native build, I know it may not make
>>> sense, but
>>> we can support qemu within the target image with 0.14.
>>>
>>
>> no I have not done target builds. Only qemu-native
>
> It looks like it actually it was qemu-nativesdk.

ALright. It needs glib-2.0 therefore I have extended glibc-2.0
recipes to provide glib-2.0-nativesdk and added it to DEPENDS
of qemu-nativesdk as well.

Please pull the patches from same branch again. I have refreshed it


>
>>
>>> My initial testing on the autobuilder seems to imply some dependency on
>>> glib-2.0.
>>>
>>
>> hmmm can you point me to logs
>>
> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/178/steps/shell_50/logs/stdio
>
>
>>
>>> Thanks
>>> Sau!
>>>
>>>> The following changes since commit
>>>> abde9f65b1617ec61e964c4b3502fd4ad2215dcf:
>>>>
>>>> shared-mime-info: Upgrade recipes from 0.90 -> 0.91 (2011-10-05
>>>> 12:39:47 -0700)
>>>>
>>>> are available in the git repository at:
>>>> git://git.openembedded.org/openembedded-core-contrib kraj/qemu-update
>>>>
>>>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemu-update
>>>>
>>>>
>>>> Khem Raj (1):
>>>> qemu-0.15: Add recipe and forward port patches from 0.14
>>>>
>>>> .../qemu/qemu-0.15.0/arm-bgr.patch | 30 +
>>>> .../qemu/qemu-0.15.0/enable-i386-linux-user.patch | 55 +
>>>> .../fallback-to-safe-mmap_min_addr.patch | 39 +
>>>> .../qemu/qemu-0.15.0/fix-configure-checks.patch | 22 +
>>>> .../qemu/qemu-0.15.0/fix-nogl.patch | 127 +
>>>> .../qemu/qemu-0.15.0/glflags.patch | 15 +
>>>> .../qemu/qemu-0.15.0/init-info.patch | 18 +
>>>> .../qemu/qemu-0.15.0/larger_default_ram_size.patch | 22 +
>>>> .../qemu/qemu-0.15.0/linker-flags.patch | 25 +
>>>> .../qemu/qemu-0.15.0/no-strip.patch | 15 +
>>>> .../qemu/qemu-0.15.0/opengl-sdl-fix.patch | 43 +
>>>> .../qemu/qemu-0.15.0/powerpc_rom.bin | Bin 0 -> 4096
>>>> bytes
>>>> .../qemu/qemu-0.15.0/qemu-git-qemugl-host.patch |34368
>>>> ++++++++++++++++++++
>>>> .../qemu/qemu-0.15.0/qemu-vmware-vga-depth.patch | 118 +
>>>> .../qemugl-allow-glxcontext-release.patch | 65 +
>>>> .../qemu/qemu-0.15.0/qemugl-fix.patch | 74 +
>>>> meta/recipes-devtools/qemu/qemu_0.15.0.bb | 45 +
>>>> 17 files changed, 35081 insertions(+), 0 deletions(-)
>>>> create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/arm-bgr.patch
>>>> create mode 100644
>>>> meta/recipes-devtools/qemu/qemu-0.15.0/enable-i386-linux-user.patch
>>>> create mode 100644
>>>> meta/recipes-devtools/qemu/qemu-0.15.0/fallback-to-safe-mmap_min_addr.patch
>>>>
>>>> create mode 100644
>>>> meta/recipes-devtools/qemu/qemu-0.15.0/fix-configure-checks.patch
>>>> create mode 100644
>>>> meta/recipes-devtools/qemu/qemu-0.15.0/fix-nogl.patch
>>>> create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/glflags.patch
>>>> create mode 100644
>>>> meta/recipes-devtools/qemu/qemu-0.15.0/init-info.patch
>>>> create mode 100644
>>>> meta/recipes-devtools/qemu/qemu-0.15.0/larger_default_ram_size.patch
>>>> create mode 100644
>>>> meta/recipes-devtools/qemu/qemu-0.15.0/linker-flags.patch
>>>> create mode 100644
>>>> meta/recipes-devtools/qemu/qemu-0.15.0/no-strip.patch
>>>> create mode 100644
>>>> meta/recipes-devtools/qemu/qemu-0.15.0/opengl-sdl-fix.patch
>>>> create mode 100644
>>>> meta/recipes-devtools/qemu/qemu-0.15.0/powerpc_rom.bin
>>>> create mode 100644
>>>> meta/recipes-devtools/qemu/qemu-0.15.0/qemu-git-qemugl-host.patch
>>>> create mode 100644
>>>> meta/recipes-devtools/qemu/qemu-0.15.0/qemu-vmware-vga-depth.patch
>>>> create mode 100644
>>>> meta/recipes-devtools/qemu/qemu-0.15.0/qemugl-allow-glxcontext-release.patch
>>>>
>>>> create mode 100644
>>>> meta/recipes-devtools/qemu/qemu-0.15.0/qemugl-fix.patch
>>>> create mode 100644 meta/recipes-devtools/qemu/qemu_0.15.0.bb
>>>>
>>>
>>>
>



