Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QQNMj-00044M-0n
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 19:31:57 +0200
Received: by pvc30 with SMTP id 30so1219183pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2011 10:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=JjZEpe1SRiCj3Udsgk64TZyOrCSuRrTZ+1p/BfgSB2w=;
	b=oedKCumtlICjp7Xy65V6OIoQXBu7K2A5Zn22IgxunOq+wjOWezLHv8c18TvfB8P8IJ
	DQv+v7CgX+nGxVB7dXEmjc30Z8UkqBOyUdhdyzdEyUwxrrslhGSx+PEThBgU7tOmg26B
	MV0em0IfQPNFJ+2RrzeDrl5OyW4WWRDefVP2Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=qEj7W/zdrQGRxvUIKA5aIMgvxE3jYGSMGXeQW9zlOHbmMr+ytc23mtMiLLAn0yjL7I
	YUOZH1Iz6k/U+XR2lNKJH51RJwcJIossSzrfcJksQC+a0I8to5EOb6kInRZLcDljneqM
	7ZqzYBHJQOt4HGsyKCGU+/iiadXqn274/03Rs=
Received: by 10.142.12.16 with SMTP id 16mr467460wfl.253.1306603726664;
	Sat, 28 May 2011 10:28:46 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id j14sm2077394wfg.2.2011.05.28.10.28.44
	(version=SSLv3 cipher=OTHER); Sat, 28 May 2011 10:28:45 -0700 (PDT)
Message-ID: <4DE130C8.3090207@gmail.com>
Date: Sat, 28 May 2011 10:28:40 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1306520012.git.nitin.a.kamble@intel.com>	<b883a6b6076317ebc3eb64f160c5f2df6996a95e.1306520012.git.nitin.a.kamble@intel.com>	<BANLkTi=nTJ5-uFhtjMh0QhsJHZyRyRwfPA@mail.gmail.com>	<4DDFF866.5040302@windriver.com>	<BANLkTi=PAbExYQ8vPqkGzmVqu-t5BOK3Pw@mail.gmail.com>
	<4DDFFE6B.6030902@windriver.com>
In-Reply-To: <4DDFFE6B.6030902@windriver.com>
Subject: Re: [bugfix 1/2] gcc-4.6.0: fix ICE with armv7 target
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
X-List-Received-Date: Sat, 28 May 2011 17:31:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/2011 12:41 PM, Mark Hatle wrote:
> On 5/27/11 2:36 PM, Khem Raj wrote:
>> On Fri, May 27, 2011 at 12:15 PM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>>> On 5/27/11 1:25 PM, Khem Raj wrote:
>>>> On Fri, May 27, 2011 at 11:15 AM,<nitin.a.kamble@intel.com>  wrote:
>>>>> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>>>>>
>>>>> This fixes an internal compiler error for gcc 4.6.0 for armv7
>>>>>
>>>>> Patch came from: Phil Blundell<pb@pbcl.net>
>>>>> Validated by Nitin
>>>>>
>>>>> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
>>>>> Signed-Off-by: Phil Blundell<pb@pbcl.net>
>>>>> ---
>>>>>   meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    3 +-
>>>>>   .../gcc/gcc-4.6.0/ICE_fix_for_arm.patch            |   44 ++++++++++++++++++++
>>>>>   2 files changed, 46 insertions(+), 1 deletions(-)
>>>>>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/ICE_fix_for_arm.patch
>>>>>
>>>>> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0.inc b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
>>>>> index fb5c70d..4407eca 100644
>>>>> --- a/meta/recipes-devtools/gcc/gcc-4.6.0.inc
>>>>> +++ b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
>>>>> @@ -7,7 +7,7 @@ require gcc-common.inc
>>>>>
>>>>>   require gcc-4_6-branch-backports.inc
>>>>>
>>>>> -PR = "r2"
>>>>> +PR = "r3"
>>>>>
>>>>>   DEPENDS =+ "mpfr gmp libmpc"
>>>>>   NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native"
>>>>> @@ -53,6 +53,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>>>>            file://gcc-poison-parameters.patch \
>>>>>            file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
>>>>>            file://COLLECT_GCC_OPTIONS.patch \
>>>>> +          file://ICE_fix_for_arm.patch \
>>>>>           "
>>>>>   SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch;patch=1 "
>>>>>
>>>>> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/ICE_fix_for_arm.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/ICE_fix_for_arm.patch
>>>>> new file mode 100644
>>>>> index 0000000..037a180
>>>>> --- /dev/null
>>>>> +++ b/meta/recipes-devtools/gcc/gcc-4.6.0/ICE_fix_for_arm.patch
>>>>> @@ -0,0 +1,44 @@
>>>>> +Upstream-Status: Pending
>>>>> +
>>>>> +Patch came from: Phil Blundell<pb@pbcl.net>
>>>>> +Validated by Nitin
>>>>> +This fixes the following internal compiler error of gcc 4.6.0 on for armv7-a
>>>>> +related gcc bugzilla: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=47719
>>>>> +
>>>>> +
>>>>> +| arm-poky-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon
>>>>> +-mfloat-abi=softfp -fno-tree-vectorize
>>>>> +--sysroot=/srv/home/pokybuild/poky-slave/nightly-external/build/build/tmp/sysroots/beagleboard
>>>>> +-c -I. -I../../../../src/gallium/include -I../../../../src/gallium/auxiliary
>>>>> +-I../../../../src/gallium/drivers
>>>>> +-I../../../../src/gallium/drivers/svga/include -O2 -pipe -g
>>>>> +-feliminate-unused-debug-types -Wall -Wmissing-prototypes -std=c99 -ffast-math
>>>>> +-fvisibility=hidden -fno-strict-aliasing -fPIC -D_GNU_SOURCE -DPTHREADS
>>>>> +-DHAVE_POSIX_MEMALIGN -DUSE_XSHM -std=gnu99 -fvisibility=hidden -DHAVE_STDINT_H
>>>>> +-DHAVE_SYS_TYPES_H svga_resource_buffer_upload.c -o
>>>>> +svga_resource_buffer_upload.o
>>>>> +| svga_tgsi_insn.c: In function 'svga_shader_emit_instructions':
>>>>> +| svga_tgsi_insn.c:2969:1: internal compiler error: in push_minipool_fix, at
>>>>> +config/arm/arm.c:12084
>>>>> +| Please submit a full bug report,
>>>>> +| with preprocessed source if appropriate.
>>>>> +| See<http://gcc.gnu.org/bugs.html>  for instructions.
>>>>> +| make[4]: *** [svga_tgsi_insn.o] Error 1
>>>>> +
>>>>> +Nitin A Kamble<nitin.a.kamble@intel.com>  2011/05/27
>>>>> +
>>>>> +Index: gcc-4.6.0/gcc/config/arm/arm.md
>>>>> +===================================================================
>>>>> +--- gcc-4.6.0.orig/gcc/config/arm/arm.md
>>>>> ++++ gcc-4.6.0/gcc/config/arm/arm.md
>>>>> +@@ -4213,7 +4213,9 @@
>>>>> +    uxth%?\\t%0, %1
>>>>> +    ldr%(h%)\\t%0, %1"
>>>>> +   [(set_attr "type" "alu_shift,load_byte")
>>>>> +-   (set_attr "predicable" "yes")]
>>>>> ++   (set_attr "predicable" "yes")
>>>>> ++   (set_attr "pool_range" "*,256")
>>>>> ++   (set_attr "neg_pool_range" "*,244")]
>>>>> + )
>>>>> +
>>>>
>>>> FWIW a patch which is similar to this was rejected here.
>>>> http://gcc.gnu.org/ml/gcc-patches/2011-02/msg01731.html
>>>>
>>>
>>> based on that link, I'd say there are two cases that are needed for a proper
>>> workaround.
>>>
>>> Then likely we wait until upstream has a fix....
>>
>> working around package is better than working around gcc IMHO
>
> Problem is the ICE will still be there.  If we put the workaround in gcc, then
> the package will work with different versions of gcc (without modification), and
> other packages will not experience this ICE.
>
> (This of course is assuming the gcc workaround is reasonable and not introducing
> other faults.)

we should qualify and run regression tests IMO to validate it if we 
intend patch gcc. I think fixing the given recipe is path of least impact


