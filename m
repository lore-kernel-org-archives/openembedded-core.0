Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1URP53-0007y2-Dg
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Apr 2013 17:43:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Apr 2013 08:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,471,1363158000"; d="scan'208";a="285973995"
Received: from unknown (HELO helios.localnet) ([10.255.13.160])
	by azsmga001.ch.intel.com with ESMTP; 14 Apr 2013 08:25:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Apr 2013 16:25:30 +0100
Message-ID: <6800403.eSx3nnyBtB@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <516AC6D3.2030102@communistcode.co.uk>
References: <1365878111-23737-1-git-send-email-heinold@inf.fu-berlin.de>
	<2868224.qKIdN0gebe@helios> <516AC6D3.2030102@communistcode.co.uk>
MIME-Version: 1.0
Subject: Re: [PATCH] qemu: define fdt_t types in libfdt_env.h from qemu
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Apr 2013 15:43:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 14 April 2013 16:10:11 Jack Mitchell wrote:
> On 04/14/13 12:57, Paul Eggleton wrote:
> > On Saturday 13 April 2013 20:35:11 Henning Heinold wrote:
> >> From: Henning Heinold <heinold@inf.fu-berlin.de>
> >> 
> >> * fixes
> >> In file included from
> >> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-lin
> >> ux
> >> /usr/include/libfdt.h:55:0, from
> >> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/work/x86_64-linux/q
> >> em
> >> u-native/1.4.0-r0/qemu-1.4.0/hw/arm/../../device_tree.c:28:
> >> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-lin
> >> ux
> >> /usr/include/fdt.h:58:2: error: unknown type name 'fdt32_t'
> >> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-lin
> >> ux
> >> /usr/include/fdt.h:59:2: error: unknown type name 'fdt32_t'
> >> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-lin
> >> ux
> >> /usr/include/fdt.h:60:2: error: unknown type name 'fdt32_t'
> >> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-lin
> >> ux
> >> /usr/include/fdt.h:61:2: error: unknown type name 'fdt32_t'
> >> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-lin
> >> ux
> >> /usr/include/fdt.h:62:2: error: unknown type name 'fdt32_t'
> >> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-lin
> >> ux
> >> /usr/include/fdt.h:63:2: error: unknown type name 'fdt32_t'
> >> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-lin
> >> ux
> >> /usr/include/fdt.h:64:2: error: unknown type name 'fdt32_t'
> >> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-lin
> >> ux
> >> /usr/include/fdt.h:67:2: error: unknown type name 'fdt32_t'
> >> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-lin
> >> ux
> >> /usr/include/fdt.h:70:2: error: unknown type name 'fdt32_t'
> >> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-lin
> >> ux
> >> /usr/include/fdt.h:73:2: error: unknown type name 'fdt32_t'
> >> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-lin
> >> ux
> >> /usr/include/fdt.h:77:2: error: unknown type name 'fdt64_t'
> >> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-lin
> >> ux
> >> /usr/include/fdt.h:78:2: error: unknown type name 'fdt64_t'
> >> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-lin
> >> ux
> >> /usr/include/fdt.h:82:2: error: unknown type name 'fdt32_t'
> >> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-lin
> >> ux
> >> /usr/include/fdt.h:87:2: error: unknown type name 'fdt32_t'
> >> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-lin
> >> ux
> >> /usr/include/fdt.h:88:2: error: unknown type name 'fdt32_t'
> >> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-lin
> >> ux
> >> /usr/include/fdt.h:89:2: error: unknown type name 'fdt32_t'
> > 
> > I still can't reproduce this issue on F18 with dtc-native built. What
> > triggers it exactly?
> > 
> > Cheers,
> > Paul
> 
> I can confirm that I am also blocked by this error at the moment. I
> haven't had time to try the patch yet but I see no reason why it
> wouldn't work. Will feedback on Monday if deliberation is still on going.

FWIW, the reason I asked is not because I think the fix is wrong, but to try to 
determine - given that I couldn't reproduce the issue and the lack of 
information about what might cause it given in the patch header - whether this 
fix ought to be merged into the dylan branch immediately or not.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


