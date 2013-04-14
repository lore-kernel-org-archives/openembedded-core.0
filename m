Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UROqC-0006lt-0U
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Apr 2013 17:27:40 +0200
Message-ID: <516AC6D3.2030102@communistcode.co.uk>
Date: Sun, 14 Apr 2013 16:10:11 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1365878111-23737-1-git-send-email-heinold@inf.fu-berlin.de>
	<2868224.qKIdN0gebe@helios>
In-Reply-To: <2868224.qKIdN0gebe@helios>
Subject: Re: [PATCH] qemu: define fdt_t types in libfdt_env.h from qemu
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Apr 2013 15:27:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/14/13 12:57, Paul Eggleton wrote:
> On Saturday 13 April 2013 20:35:11 Henning Heinold wrote:
>> From: Henning Heinold <heinold@inf.fu-berlin.de>
>>
>> * fixes
>> In file included from
>> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
>> /usr/include/libfdt.h:55:0, from
>> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/work/x86_64-linux/qem
>> u-native/1.4.0-r0/qemu-1.4.0/hw/arm/../../device_tree.c:28:
>> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
>> /usr/include/fdt.h:58:2: error: unknown type name 'fdt32_t'
>> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
>> /usr/include/fdt.h:59:2: error: unknown type name 'fdt32_t'
>> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
>> /usr/include/fdt.h:60:2: error: unknown type name 'fdt32_t'
>> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
>> /usr/include/fdt.h:61:2: error: unknown type name 'fdt32_t'
>> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
>> /usr/include/fdt.h:62:2: error: unknown type name 'fdt32_t'
>> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
>> /usr/include/fdt.h:63:2: error: unknown type name 'fdt32_t'
>> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
>> /usr/include/fdt.h:64:2: error: unknown type name 'fdt32_t'
>> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
>> /usr/include/fdt.h:67:2: error: unknown type name 'fdt32_t'
>> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
>> /usr/include/fdt.h:70:2: error: unknown type name 'fdt32_t'
>> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
>> /usr/include/fdt.h:73:2: error: unknown type name 'fdt32_t'
>> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
>> /usr/include/fdt.h:77:2: error: unknown type name 'fdt64_t'
>> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
>> /usr/include/fdt.h:78:2: error: unknown type name 'fdt64_t'
>> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
>> /usr/include/fdt.h:82:2: error: unknown type name 'fdt32_t'
>> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
>> /usr/include/fdt.h:87:2: error: unknown type name 'fdt32_t'
>> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
>> /usr/include/fdt.h:88:2: error: unknown type name 'fdt32_t'
>> /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux
>> /usr/include/fdt.h:89:2: error: unknown type name 'fdt32_t'
> I still can't reproduce this issue on F18 with dtc-native built. What triggers
> it exactly?
>
> Cheers,
> Paul
>

I can confirm that I am also blocked by this error at the moment. I 
haven't had time to try the patch yet but I see no reason why it 
wouldn't work. Will feedback on Monday if deliberation is still on going.


