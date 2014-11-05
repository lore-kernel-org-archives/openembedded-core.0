Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4AA2860557
	for <Openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 03:11:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA53Bf9Q018634
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Nov 2014 19:11:41 -0800 (PST)
Received: from server.local (128.224.22.239) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Nov 2014 19:11:40 -0800
Message-ID: <5459956B.5090904@windriver.com>
Date: Tue, 4 Nov 2014 22:11:39 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>, "ZANUSSI, TOM"
	<tom.zanussi@intel.com>
References: <cover.1412112668.git.nitin.a.kamble@intel.com>	
	<9c2742ca226e51d4d369e9c761c270c8acbe7b2a.1412112668.git.nitin.a.kamble@intel.com>
	<1415143532.24776.2.camel@empanada.home.network>
	<ADD6A3980E8C39419A432FF422031B4C7CF12726@ORSMSX103.amr.corp.intel.com>
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C7CF12726@ORSMSX103.amr.corp.intel.com>
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>,
	"dvhart@linux.intel.com" <dvhart@linux.intel.com>, "WOLD,
	SAUL" <saul.wold@intel.com>
Subject: Re: [Patch v2 1/1] kernel.bbclass: enable a link for external module building
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
X-List-Received-Date: Wed, 05 Nov 2014 03:11:52 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-11-04, 6:58 PM, Kamble, Nitin A wrote:
>
>
>> -----Original Message-----
>> From: Zanussi, Tom
>> Sent: Tuesday, November 04, 2014 3:26 PM
>> To: Kamble, Nitin A
>> Cc: richard.purdie@linuxfoundation.org; Wold, Saul; Burton, Ross; Ashfield,
>> Bruce (Wind River); dvhart@linux.intel.com; Openembedded-
>> core@lists.openembedded.org
>> Subject: Re: [OE-core] [Patch v2 1/1] kernel.bbclass: enable a link for external
>> module building
>>
>> On Tue, 2014-09-30 at 14:40 -0700, nitin.a.kamble@intel.com wrote:
>>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>>>
>>> Even though the kernel-dev package provides the required support for
>>> building external kernel modules on the target, some commonly used
>>> scripts and utilities fail as they are not finding the kernel module
>>> build support files at the desired location.
>>>
>>> Create the /lib/modules/<kernel-version>/build link on target pointing
>>> to the sources provided by the kernel-dev package, to fix the issue.
>>>
>>> Fixes Bug:
>>> [YOCTO #2968]
>>>
>>
>> I just updated my dizzy branch and am getting this when building a kernel
>> with no modules:
>>
>> Build Configuration:
>> BB_VERSION        = "1.24.0"
>> BUILD_SYS         = "x86_64-linux"
>> NATIVELSBSTRING   = "Fedora-19"
>> TARGET_SYS        = "i586-poky-linux-uclibc"
>> MACHINE           = "galileo"
>> DISTRO            = "poky-micro"
>> DISTRO_VERSION    = "1.7"
>> TUNE_FEATURES     = "m32 i586"
>> TARGET_FPU        = ""
>> meta
>> meta-yocto
>> meta-yocto-bsp    = "dizzy0:64643804aea02e3062a7cde7af236771c56311fd"
>> meta-intel        = "dizzy0:002bef4c2a59e95503a2bb7729e7749cd5a9f65b"
>> meta-micro-galileo = "dizzy0:f30310dc84dcd96b9e93bb6e5b531631d57d26d6"
>>
>> NOTE: Preparing runqueue
>> NOTE: Executing SetScene Tasks
>> NOTE: Executing RunQueue Tasks
>> ERROR: Function failed: do_install (log file is located at
>> /home/trz/yocto/galileo-work/build/tmp/work/galileo-poky-linux-
>> uclibc/linux-yocto-micro/3.17+gitAUTOINC+fb21bdc896_522a64f489-
>> r4.1.1/temp/log.do_install.25369)
>> ERROR: Logfile of failure stored in: /home/trz/yocto/galileo-
>> work/build/tmp/work/galileo-poky-linux-uclibc/linux-yocto-
>> micro/3.17+gitAUTOINC+fb21bdc896_522a64f489-
>> r4.1.1/temp/log.do_install.25369
>> Log data follows:
>> | DEBUG: Executing python function package_get_auto_pr
>> | DEBUG: Python function package_get_auto_pr finished
>> | DEBUG: Executing shell function do_install
>> | NOTE: no modules to install
>> | ln: failed to create symbolic link
>> | '/home/trz/yocto/galileo-work/build/tmp/work/galileo-poky-linux-uclibc
>> | /linux-yocto-micro/3.17+gitAUTOINC+fb21bdc896_522a64f489-
>> r4.1.1/image/
>> | lib/modules/3.17.0-rc7-yocto-micro/build': No such file or directory
>> | WARNING: /home/trz/yocto/galileo-work/build/tmp/work/galileo-poky-
>> linux-uclibc/linux-yocto-micro/3.17+gitAUTOINC+fb21bdc896_522a64f489-
>> r4.1.1/temp/run.do_install.25369:1 exit 1 from
>> |   ln -sf /usr/src/kernel "/home/trz/yocto/galileo-
>> work/build/tmp/work/galileo-poky-linux-uclibc/linux-yocto-
>> micro/3.17+gitAUTOINC+fb21bdc896_522a64f489-
>> r4.1.1/image/lib/modules/3.17.0-rc7-yocto-micro/build"
>> | ERROR: Function failed: do_install (log file is located at
>> | /home/trz/yocto/galileo-work/build/tmp/work/galileo-poky-linux-uclibc/
>> | linux-yocto-micro/3.17+gitAUTOINC+fb21bdc896_522a64f489-
>> r4.1.1/temp/lo
>> | g.do_install.25369)
>> ERROR: Task 4 (/home/trz/yocto/galileo-work/meta-intel/meta-micro-
>> galileo/recipes-kernel/linux/linux-yocto-micro_3.17.bb, do_install) failed
>> with exit code '1'
>> NOTE: Tasks Summary: Attempted 387 tasks of which 386 didn't need to be
>> rerun and 1 failed.
>> No currently running tasks (357 of 395)
>>
>> Summary: 1 task failed:
>>    /home/trz/yocto/galileo-work/meta-intel/meta-micro-galileo/recipes-
>> kernel/linux/linux-yocto-micro_3.17.bb, do_install
>> Summary: There was 1 ERROR message shown, returning a non-zero exit
>> code.
>>
>>
>> Reverting this patch gets past it.


Zhe He sent the same patch on the 21st, I guess it slipped through
the cracks:

-----------------------------------------

[OE-core] [PATCH] kernel.bbclass: Create modules directory even if there 
is no modules installed

-----------------------------

zhe.he@windriver.com
Oct 21

to openembedded-c.
From: He Zhe <zhe.he@windriver.com>

During kernel_do_install it needs to make symbol link at
${D}/lib/modules/${KERNEL_VERSION}/build, but there will not be
${D}/lib/modules/${KERNEL_VERSION} if there is no modules installed for 
current
image, which will result in a build failure.
Add "mkdir -p ${D}/lib/modules/${KERNEL_VERSION}" here to avoid this failure
and the need of similar changes in other scripts that also expect it to 
exist.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
  meta/classes/kernel.bbclass | 1 +
  1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e958f90..e342ed1 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -233,6 +233,7 @@ kernel_do_install() {
         #
         kerneldir=${D}${KERNEL_SRC_PATH}
         install -d $kerneldir
+       mkdir -p ${D}/lib/modules/${KERNEL_VERSION}
         ln -sf ${KERNEL_SRC_PATH} 
"${D}/lib/modules/${KERNEL_VERSION}/build"

--------------------------

Bruce


> Hi Tom,
>    Because of the no modules kernel configuration, the required directory structure is missing. This patch would fix the issue by ensuring the required directory is present. Can you verify the fix?
>
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -213,6 +213,7 @@ kernel_do_install() {
>          #
>          kerneldir=${D}${KERNEL_SRC_PATH}
>          install -d $kerneldir
> +       mkdir -p "${D}/lib/modules/${KERNEL_VERSION}"
>          ln -sf ${KERNEL_SRC_PATH} "${D}/lib/modules/${KERNEL_VERSION}/build"
>
> Thanks,
> Nitin
>
>>
>> Tom
>>
>>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>>> ---
>>>   meta/classes/kernel.bbclass | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>> index 78b33ce..5ac4ff4 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -213,6 +213,7 @@ kernel_do_install() {
>>>      #
>>>      kerneldir=${D}${KERNEL_SRC_PATH}
>>>      install -d $kerneldir
>>> +   ln -sf ${KERNEL_SRC_PATH}
>> "${D}/lib/modules/${KERNEL_VERSION}/build"
>>>
>>>      #
>>>      # Store the kernel version in sysroots for module-base.bbclass @@
>>> -346,7 +347,7 @@ PACKAGES = "kernel kernel-base kernel-vmlinux
>>> kernel-image kernel-dev kernel-mod  FILES_${PN} = ""
>>>   FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order
>> /lib/modules/${KERNEL_VERSION}/modules.builtin"
>>>   FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
>>> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
>> /boot/config* ${KERNEL_SRC_PATH}"
>>> +FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
>> /boot/config* ${KERNEL_SRC_PATH}
>> /lib/modules/${KERNEL_VERSION}/build"
>>>   FILES_kernel-vmlinux = "/boot/vmlinux*"
>>>   FILES_kernel-modules = ""
>>>   RDEPENDS_kernel = "kernel-base"
>>> --
>>> 1.8.1.4
>>>
>>
>


