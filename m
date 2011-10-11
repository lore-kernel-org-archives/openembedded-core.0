Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RDQ9i-0002pB-L9
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 02:25:14 +0200
Received: from mail-bw0-f52.google.com ([209.85.214.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 10 Oct 2011 17:19:18 -0700
Received: by bke5 with SMTP id 5so8505441bke.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 17:19:17 -0700 (PDT)
Received: by 10.223.61.146 with SMTP id t18mr35613063fah.34.1318292354986;
	Mon, 10 Oct 2011 17:19:14 -0700 (PDT)
Received: from [192.168.0.34] (71-20-34-171.war.clearwire-wmx.net.
	[71.20.34.171])
	by mx.google.com with ESMTPS id r16sm3385651fam.8.2011.10.10.17.19.12
	(version=SSLv3 cipher=OTHER); Mon, 10 Oct 2011 17:19:13 -0700 (PDT)
Message-ID: <4E938B7E.8030105@intel.com>
Date: Mon, 10 Oct 2011 17:19:10 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1317843784.git.raj.khem@gmail.com>
	<4E927BBE.3030908@intel.com>
	<CAMKF1soHxwjCx4U9xErYXnwYdRo1ksawSZGBZgF8iXDODjeLfA@mail.gmail.com>
In-Reply-To: <CAMKF1soHxwjCx4U9xErYXnwYdRo1ksawSZGBZgF8iXDODjeLfA@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2011 00:25:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2011 05:08 PM, Khem Raj wrote:
> On Sun, Oct 9, 2011 at 9:59 PM, Saul Wold<saul.wold@intel.com>  wrote:
>> On 10/05/2011 12:45 PM, Khem Raj wrote:
>>>
>>> This brings in qemu-0.15 into OE-core I have had limited testing
>>> on it and mainly on qemuarm. Please help testing it on other architectures
>>> I will also work on getting it more solidified and bring some backports
>>> as needed.
>>>
>> Khem,
>>
>> Did you do any kind of non-native build, I know it may not make sense, but
>> we can support qemu within the target image with 0.14.
>>
>
> no I have not done target builds. Only qemu-native

It looks like it actually it was qemu-nativesdk.

>
>> My initial testing on the autobuilder seems to imply some dependency on
>> glib-2.0.
>>
>
> hmmm can you point me to logs
>
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/178/steps/shell_50/logs/stdio

>
>> Thanks
>>         Sau!
>>
>>> The following changes since commit
>>> abde9f65b1617ec61e964c4b3502fd4ad2215dcf:
>>>
>>>    shared-mime-info: Upgrade recipes from 0.90 ->    0.91 (2011-10-05
>>> 12:39:47 -0700)
>>>
>>> are available in the git repository at:
>>>    git://git.openembedded.org/openembedded-core-contrib kraj/qemu-update
>>>
>>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemu-update
>>>
>>> Khem Raj (1):
>>>    qemu-0.15: Add recipe and forward port patches from 0.14
>>>
>>>   .../qemu/qemu-0.15.0/arm-bgr.patch                 |   30 +
>>>   .../qemu/qemu-0.15.0/enable-i386-linux-user.patch  |   55 +
>>>   .../fallback-to-safe-mmap_min_addr.patch           |   39 +
>>>   .../qemu/qemu-0.15.0/fix-configure-checks.patch    |   22 +
>>>   .../qemu/qemu-0.15.0/fix-nogl.patch                |  127 +
>>>   .../qemu/qemu-0.15.0/glflags.patch                 |   15 +
>>>   .../qemu/qemu-0.15.0/init-info.patch               |   18 +
>>>   .../qemu/qemu-0.15.0/larger_default_ram_size.patch |   22 +
>>>   .../qemu/qemu-0.15.0/linker-flags.patch            |   25 +
>>>   .../qemu/qemu-0.15.0/no-strip.patch                |   15 +
>>>   .../qemu/qemu-0.15.0/opengl-sdl-fix.patch          |   43 +
>>>   .../qemu/qemu-0.15.0/powerpc_rom.bin               |  Bin 0 ->    4096
>>> bytes
>>>   .../qemu/qemu-0.15.0/qemu-git-qemugl-host.patch    |34368
>>> ++++++++++++++++++++
>>>   .../qemu/qemu-0.15.0/qemu-vmware-vga-depth.patch   |  118 +
>>>   .../qemugl-allow-glxcontext-release.patch          |   65 +
>>>   .../qemu/qemu-0.15.0/qemugl-fix.patch              |   74 +
>>>   meta/recipes-devtools/qemu/qemu_0.15.0.bb          |   45 +
>>>   17 files changed, 35081 insertions(+), 0 deletions(-)
>>>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/arm-bgr.patch
>>>   create mode 100644
>>> meta/recipes-devtools/qemu/qemu-0.15.0/enable-i386-linux-user.patch
>>>   create mode 100644
>>> meta/recipes-devtools/qemu/qemu-0.15.0/fallback-to-safe-mmap_min_addr.patch
>>>   create mode 100644
>>> meta/recipes-devtools/qemu/qemu-0.15.0/fix-configure-checks.patch
>>>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/fix-nogl.patch
>>>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/glflags.patch
>>>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/init-info.patch
>>>   create mode 100644
>>> meta/recipes-devtools/qemu/qemu-0.15.0/larger_default_ram_size.patch
>>>   create mode 100644
>>> meta/recipes-devtools/qemu/qemu-0.15.0/linker-flags.patch
>>>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/no-strip.patch
>>>   create mode 100644
>>> meta/recipes-devtools/qemu/qemu-0.15.0/opengl-sdl-fix.patch
>>>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/powerpc_rom.bin
>>>   create mode 100644
>>> meta/recipes-devtools/qemu/qemu-0.15.0/qemu-git-qemugl-host.patch
>>>   create mode 100644
>>> meta/recipes-devtools/qemu/qemu-0.15.0/qemu-vmware-vga-depth.patch
>>>   create mode 100644
>>> meta/recipes-devtools/qemu/qemu-0.15.0/qemugl-allow-glxcontext-release.patch
>>>   create mode 100644
>>> meta/recipes-devtools/qemu/qemu-0.15.0/qemugl-fix.patch
>>>   create mode 100644 meta/recipes-devtools/qemu/qemu_0.15.0.bb
>>>
>>
>>



