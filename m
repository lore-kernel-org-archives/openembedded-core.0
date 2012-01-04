Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RiTkX-0004G6-L0
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 17:31:38 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Jan 2012 08:23:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92891964"
Received: from vtippara-mobl.amr.corp.intel.com (HELO envy.home)
	([10.19.147.145])
	by orsmga001.jf.intel.com with ESMTP; 04 Jan 2012 08:23:53 -0800
Message-ID: <4F047D08.6040900@linux.intel.com>
Date: Wed, 04 Jan 2012 08:23:36 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325115066.git.dvhart@linux.intel.com>
	<4F039FA4.6000709@linux.intel.com>
In-Reply-To: <4F039FA4.6000709@linux.intel.com>
X-Enigmail-Version: 1.3.3
Cc: koen@dominion.thruhere.net, martin.jansa@gmail.com
Subject: Re: [PATCH 0/4] Fixes for tiny distros and linux-yocto-tiny
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
X-List-Received-Date: Wed, 04 Jan 2012 16:31:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/03/2012 04:39 PM, Saul Wold wrote:
> On 12/28/2011 03:38 PM, Darren Hart wrote:
>> In preparation for defining a poky-tiny distribution for meta-yocto, I found
>> I needed the following patches. They mostly enable finer grained configuration
>> of dependencies and allow for building without widechar support.
>>
>>
>> The linux-yocVto-tiny recipe isn't poky-tiny specific and could be of use to
>> others, so I opted to keep it with the other linux-yocto recipes. It is a
>> placeholder until the linux-yocto_3.2 recipes are ready for oe-core. At that
>> time, linux-yocto-tiny will drop all config fragments in favor of the
>> to-be-in-tree versions and make use of a new yocto/standard/tiny/base branch.
>> For now, this recipe allows us to build a reasonably small kernel with fewer
>> dependencies.
>>
>> Thanks,
>>
>> Darren
>>
>>
>> The following changes since commit 8f348ccad083d6c02c200652ff6295e701e88f0d:
>>
>>    coreutils: ensure --color works so DEPEND on libcap (2011-12-24 10:05:35 +0000)
>>
>> are available in the git repository at:
>>    git://git.yoctoproject.org/user-contrib/dvhart/oe-core dvhart/tiny
>>    http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/tiny
>>
>> Darren Hart (3):
>>    eglibc: Only add eglibc-utils to PACKAGES if wchar is supported
> This patch was not taken at this time due to the comment on the Mailing List
> 
>>    linux-yocto-tiny: New kernel recipe for tiny distros
>>    task-core-boot: Allow DISTRO to disable keymaps via VIRTUAL-RUNTIME_keymaps
> These two were merged into OE-Core
> 
> 
>>
> 
>> Richard Purdie (1):
>>    native.bbclass: Fix variable remapping coverage
>>
> Richard rejected his own patch as being too much of WIP.
> 

OK, just so everyone understands, poky-tiny (merged to meta-yocto) will
not build until we come up with alternatives to the two patches above.

--
Darren


> Thanks
> 	Sau!
> 
>>   meta/classes/native.bbclass                        |    2 +-
>>   meta/recipes-core/eglibc/eglibc-package.inc        |    6 +-
>>   meta/recipes-core/tasks/task-core-boot.bb          |    8 +-
>>   meta/recipes-devtools/autoconf/autoconf.inc        |    2 +
>>   meta/recipes-devtools/autoconf/autoconf_2.68.bb    |    8 -
>>   meta/recipes-devtools/automake/automake_1.11.1.bb  |    4 +-
>>   .../recipes-devtools/python/python-native_2.7.2.bb |    2 +
>>   meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    1 +
>>   meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg |    9 +
>>   .../recipes-kernel/linux/linux-yocto-tiny/core.cfg |   19 +
>>   .../linux/linux-yocto-tiny/debug.cfg               |    5 +
>>   .../linux/linux-yocto-tiny/devtmpfs.cfg            |    6 +
>>   .../linux/linux-yocto-tiny/e1000.cfg               |    7 +
>>   .../recipes-kernel/linux/linux-yocto-tiny/ext2.cfg |    1 +
>>   .../recipes-kernel/linux/linux-yocto-tiny/ext3.cfg |    2 +
>>   .../recipes-kernel/linux/linux-yocto-tiny/lzma.cfg |    3 +
>>   meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg |   26 +
>>   .../linux/linux-yocto-tiny/qemux86/defconfig       |  613 ++++++++++++++++++++
>>   .../linux/linux-yocto-tiny/ramfs.cfg               |    6 +
>>   .../linux/linux-yocto-tiny/rtc-pc.cfg              |   13 +
>>   .../linux/linux-yocto-tiny/serial.cfg              |    7 +
>>   meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg |    7 +
>>   meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb  |   36 ++
>>   meta/recipes-support/boost/boost.inc               |    1 +
>>   24 files changed, 777 insertions(+), 17 deletions(-)
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/core.cfg
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/debug.cfg
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/devtmpfs.cfg
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/e1000.cfg
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ext2.cfg
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ext3.cfg
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/lzma.cfg
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/qemux86/defconfig
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ramfs.cfg
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/rtc-pc.cfg
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/serial.cfg
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
>>
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


