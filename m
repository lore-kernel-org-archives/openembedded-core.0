Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RaF6g-000872-L3
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 00:16:26 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Dec 2011 15:09:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="85781040"
Received: from unknown (HELO [10.255.12.64]) ([10.255.12.64])
	by orsmga001.jf.intel.com with ESMTP; 12 Dec 2011 15:09:30 -0800
Message-ID: <4EE689A9.30904@linux.intel.com>
Date: Mon, 12 Dec 2011 15:09:29 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323458858.git.raj.khem@gmail.com>
	<CAMKF1soc65OBQQVnDKpTvQNbBO8UfjH3T1nriiqnS5crJFn4FQ@mail.gmail.com>
In-Reply-To: <CAMKF1soc65OBQQVnDKpTvQNbBO8UfjH3T1nriiqnS5crJFn4FQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Update QEMU and add support for eglibc testing
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
X-List-Received-Date: Mon, 12 Dec 2011 23:16:26 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2011 10:33 AM, Khem Raj wrote:
> On Fri, Dec 9, 2011 at 11:30 AM, Khem Raj<raj.khem@gmail.com>  wrote:
>> Minor release 0.15.1 of 0.15 branch is available for QEMU
>>
>> Generate a testing script to help with eglibc cross testing
>>
>> Add nfs-utils-client to nfs-server package group so when we
>> have server, we can also have client, helps in eglibc cross testing
>>
>> The following changes since commit 86d174648b0fe770ac0dddbee08ecfd94cc13ec8:
>>
>>   eglibc: Generate cross testing script during install (2011-12-09 11:24:43 -0800)
>>
>
>
>
>> are available in the git repository at:
>>   git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-testing
>>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/eglibc-testing
>>
>> Khem Raj (3):
>>   qemu-0.15.1: Bump recipes from 0.15.0 to 0.15.1
>>   task-core-nfs: Add nfs-utils-client to RDEPENDS
>>   eglibc: Generate cross testing script during install
>>
>
> I have updated the cross testing patch on the contrib tree. The change
> is that I have moved
> the cross testing script generation to an .inc file which is then included
> by eglibc.inc
>

Merged these updated contrib tree changes to OE-Core

Thanks
	Sau!

>>   meta/recipes-core/eglibc/eglibc-common.inc         |    1 -
>>   meta/recipes-core/eglibc/eglibc-package.inc        |   46 ++++++++++++++++++++
>>   meta/recipes-core/eglibc/eglibc_2.13.bb            |    2 +-
>>   meta/recipes-core/eglibc/eglibc_2.14.bb            |    2 +-
>>   meta/recipes-core/tasks/task-core-nfs.bb           |    6 ++-
>>   .../{qemu-0.15.0 =>  qemu-0.15.1}/arm-bgr.patch     |    0
>>   .../enable-i386-linux-user.patch                   |    0
>>   .../fallback-to-safe-mmap_min_addr.patch           |    0
>>   .../fix-configure-checks.patch                     |    0
>>   .../{qemu-0.15.0 =>  qemu-0.15.1}/fix-nogl.patch    |    0
>>   .../{qemu-0.15.0 =>  qemu-0.15.1}/glflags.patch     |    0
>>   .../{qemu-0.15.0 =>  qemu-0.15.1}/init-info.patch   |    0
>>   .../larger_default_ram_size.patch                  |    0
>>   .../linker-flags.patch                             |    0
>>   .../{qemu-0.15.0 =>  qemu-0.15.1}/no-strip.patch    |    0
>>   .../opengl-sdl-fix.patch                           |    0
>>   .../{qemu-0.15.0 =>  qemu-0.15.1}/powerpc_rom.bin   |  Bin 4096 ->  4096 bytes
>>   .../qemu-git-qemugl-host.patch                     |    0
>>   .../qemu-vmware-vga-depth.patch                    |    0
>>   .../qemugl-allow-glxcontext-release.patch          |    0
>>   .../{qemu-0.15.0 =>  qemu-0.15.1}/qemugl-fix.patch  |    0
>>   .../qemu/{qemu_0.15.0.bb =>  qemu_0.15.1.bb}        |    6 +--
>>   22 files changed, 54 insertions(+), 9 deletions(-)
>>   rename meta/recipes-devtools/qemu/{qemu-0.15.0 =>  qemu-0.15.1}/arm-bgr.patch (100%)
>>   rename meta/recipes-devtools/qemu/{qemu-0.15.0 =>  qemu-0.15.1}/enable-i386-linux-user.patch (100%)
>>   rename meta/recipes-devtools/qemu/{qemu-0.15.0 =>  qemu-0.15.1}/fallback-to-safe-mmap_min_addr.patch (100%)
>>   rename meta/recipes-devtools/qemu/{qemu-0.15.0 =>  qemu-0.15.1}/fix-configure-checks.patch (100%)
>>   rename meta/recipes-devtools/qemu/{qemu-0.15.0 =>  qemu-0.15.1}/fix-nogl.patch (100%)
>>   rename meta/recipes-devtools/qemu/{qemu-0.15.0 =>  qemu-0.15.1}/glflags.patch (100%)
>>   rename meta/recipes-devtools/qemu/{qemu-0.15.0 =>  qemu-0.15.1}/init-info.patch (100%)
>>   rename meta/recipes-devtools/qemu/{qemu-0.15.0 =>  qemu-0.15.1}/larger_default_ram_size.patch (100%)
>>   rename meta/recipes-devtools/qemu/{qemu-0.15.0 =>  qemu-0.15.1}/linker-flags.patch (100%)
>>   rename meta/recipes-devtools/qemu/{qemu-0.15.0 =>  qemu-0.15.1}/no-strip.patch (100%)
>>   rename meta/recipes-devtools/qemu/{qemu-0.15.0 =>  qemu-0.15.1}/opengl-sdl-fix.patch (100%)
>>   rename meta/recipes-devtools/qemu/{qemu-0.15.0 =>  qemu-0.15.1}/powerpc_rom.bin (100%)
>>   rename meta/recipes-devtools/qemu/{qemu-0.15.0 =>  qemu-0.15.1}/qemu-git-qemugl-host.patch (100%)
>>   rename meta/recipes-devtools/qemu/{qemu-0.15.0 =>  qemu-0.15.1}/qemu-vmware-vga-depth.patch (100%)
>>   rename meta/recipes-devtools/qemu/{qemu-0.15.0 =>  qemu-0.15.1}/qemugl-allow-glxcontext-release.patch (100%)
>>   rename meta/recipes-devtools/qemu/{qemu-0.15.0 =>  qemu-0.15.1}/qemugl-fix.patch (100%)
>>   rename meta/recipes-devtools/qemu/{qemu_0.15.0.bb =>  qemu_0.15.1.bb} (88%)
>>
>> --
>> 1.7.5.4
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


