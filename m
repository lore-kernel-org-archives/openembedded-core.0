Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1URLqD-0001C4-2A
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Apr 2013 14:15:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Apr 2013 04:58:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,470,1363158000"; d="scan'208";a="322095632"
Received: from unknown (HELO helios.localnet) ([10.255.13.160])
	by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2013 04:57:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Henning Heinold <heinold@inf.fu-berlin.de>
Date: Sun, 14 Apr 2013 12:57:59 +0100
Message-ID: <2868224.qKIdN0gebe@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1365878111-23737-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1365878111-23737-1-git-send-email-heinold@inf.fu-berlin.de>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sun, 14 Apr 2013 12:15:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 13 April 2013 20:35:11 Henning Heinold wrote:
> From: Henning Heinold <heinold@inf.fu-berlin.de>
> 
> * fixes
> In file included from
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
> /usr/include/libfdt.h:55:0, from
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/work/x86_64-linux/qem
> u-native/1.4.0-r0/qemu-1.4.0/hw/arm/../../device_tree.c:28:
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
> /usr/include/fdt.h:58:2: error: unknown type name 'fdt32_t'
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
> /usr/include/fdt.h:59:2: error: unknown type name 'fdt32_t'
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
> /usr/include/fdt.h:60:2: error: unknown type name 'fdt32_t'
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
> /usr/include/fdt.h:61:2: error: unknown type name 'fdt32_t'
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
> /usr/include/fdt.h:62:2: error: unknown type name 'fdt32_t'
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
> /usr/include/fdt.h:63:2: error: unknown type name 'fdt32_t'
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
> /usr/include/fdt.h:64:2: error: unknown type name 'fdt32_t'
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
> /usr/include/fdt.h:67:2: error: unknown type name 'fdt32_t'
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
> /usr/include/fdt.h:70:2: error: unknown type name 'fdt32_t'
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
> /usr/include/fdt.h:73:2: error: unknown type name 'fdt32_t'
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
> /usr/include/fdt.h:77:2: error: unknown type name 'fdt64_t'
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
> /usr/include/fdt.h:78:2: error: unknown type name 'fdt64_t'
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
> /usr/include/fdt.h:82:2: error: unknown type name 'fdt32_t'
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
> /usr/include/fdt.h:87:2: error: unknown type name 'fdt32_t'
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
> /usr/include/fdt.h:88:2: error: unknown type name 'fdt32_t'
> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
> /usr/include/fdt.h:89:2: error: unknown type name 'fdt32_t'

I still can't reproduce this issue on F18 with dtc-native built. What triggers 
it exactly?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


