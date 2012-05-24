Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXQBJ-0006gx-EH
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 07:01:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 May 2012 21:51:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="147105875"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by azsmga001.ch.intel.com with ESMTP; 23 May 2012 21:51:37 -0700
Message-ID: <4FBDBE59.3040502@linux.intel.com>
Date: Wed, 23 May 2012 21:51:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: "Zhai, Edwin" <edwin.zhai@intel.com>
References: <cover.1337805812.git.sgw@linux.intel.com>
	<5ddf365f3f772918a18a67dac1a5b8cc3e2758a6.1337805812.git.sgw@linux.intel.com>
	<4FBDAEB3.2040608@linux.intel.com> <4FBDB8F7.1030305@intel.com>
In-Reply-To: <4FBDB8F7.1030305@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Consolidated Pull 4/5] qemu: Add an option to remove host sdl/gl checking
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
X-List-Received-Date: Thu, 24 May 2012 05:01:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2012 09:28 PM, Zhai, Edwin wrote:
> On 05/24/2012 11:44 AM, Saul Wold wrote:
>> On 05/23/2012 03:46 PM, Saul Wold wrote:
>>> From: Zhai Edwin<edwin.zhai@intel.com>
>>>
>>> Add an PACKAGECONFIG in qemu to disable GL acceleration:
>>> * By default configure try best to enable GL acceleration and fail
>>> when missing
>>> host dependency(libSDL and libGL).
>>> * End user can also choose to turn off GL capability, thus remove the
>>> host
>>> dependence in building.
>>>
>>> [YOCTO #2407] got fixed.
>>>
>> I think I found a problem with this when building for the target, so I
>> pulled it from the branch.
>
>
> Which target? Can you attach build log?
>
I am seeing 2 different failures.

MACHINE=beagleboard
Target: qemu (target device not native)
ERROR: Function failed: do_configure (see 
/srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qemu-0.15.1-r7/temp/log.do_configure.20469 
for further information)
ERROR: Logfile of failure stored in: 
/srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qemu-0.15.1-r7/temp/log.do_configure.20469
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function do_configure
| ERROR: unknown option --enable-gl-accel
|
| Usage: configure [options]
| Options: [defaults in brackets after descriptions


MACHINE=qemuarm
Target meta-toolchain-gmae:
ERROR: Command Error: exit status: 1  Output:
Applying patch glflags.patch
patching file Makefile.target
Hunk #1 FAILED at 362.
1 out of 1 hunk FAILED -- rejects in file Makefile.target
Patch glflags.patch does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in: 
/srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/qemu-nativesdk-0.15.1-r7/temp/log.do_patch.26666


>
>>
>> Sau!
>
>
>


