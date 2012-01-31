Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RsJKB-0004xH-4z
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 20:25:03 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 31 Jan 2012 11:17:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="61777687"
Received: from unknown (HELO envy.home) ([10.255.14.180])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Jan 2012 11:17:06 -0800
Message-ID: <4F283E15.3020204@linux.intel.com>
Date: Tue, 31 Jan 2012 11:16:37 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1327681281-11454-1-git-send-email-paul.gortmaker@windriver.com>
	<4F281CAC.5010304@linux.intel.com> <4F282815.1070407@windriver.com>
	<4F28343A.8070501@linux.intel.com>
In-Reply-To: <4F28343A.8070501@linux.intel.com>
X-Enigmail-Version: 1.3.5
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, poky@yoctoproject.org
Subject: Re: [poky] [PATCH 0/3] U-boot recipe for most recent stable release.
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
X-List-Received-Date: Tue, 31 Jan 2012 19:25:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/31/2012 10:34 AM, Saul Wold wrote:
> On 01/31/2012 09:42 AM, Paul Gortmaker wrote:
>> On 12-01-31 11:54 AM, Saul Wold wrote:
>>> On 01/27/2012 08:21 AM, Paul Gortmaker wrote:
>>>> This adds a recipe for U-Boot v2011.12.  In doing so, some of
>>>> non-shareable settings were moved out of u-boot.inc and others
>>>> moved in.
>>>>
>>>> The recipe was tested on an mpc8315 Yocto configuration.
>>>>
>>>> Paul Gortmaker (3):
>>>>     u-boot: Don't make the -Os removal part of global settings.
>>>>     u-boot: make FILESDIR a shared setting.
>>>>     u-boot: Add recipe for u-boot v2011.12
>>>>
>>>>    meta/recipes-bsp/u-boot/u-boot.inc        |    4 +---
>>>>    meta/recipes-bsp/u-boot/u-boot_2011.03.bb |    3 ++-
>>>>    meta/recipes-bsp/u-boot/u-boot_2011.06.bb |    3 ++-
>>>>    meta/recipes-bsp/u-boot/u-boot_2011.12.bb |   20 ++++++++++++++++++++
>>>>    4 files changed, 25 insertions(+), 5 deletions(-)
>>>>    create mode 100644 meta/recipes-bsp/u-boot/u-boot_2011.12.bb
>>>>
>>>
>>> What about the u-boot-mkimage recipe, does that also need to be updated?
>>
>> It could be, but it strictly doesn't have to be.  I'd say that
>> mkimage is a tool akin to something like tar -- i.e. you can build
>> whatever version you want, but its functionality isn't going
>> to really change often from one release to the next.
>>
>> If you want it updated, I can send a follow on patch to do
>> that.  What do you guys usually do with the old recipes, leave
>> them laying around, or STONITH?
>>
> Adding openembedded-core since that is really where patches to meta 
> should go.
> 
> u-boot seems to be a special beast since we keep the older recipes 
> around for u-boot itself, are they are compatibility issues with going 
> to the latest u-boot-mkimage and older u-boot itself?
> 
> Comments from the u-boot users?  Do we need to keep the older u-boot or 
> u-boot-mkimage around, or should the move to BSP/layers that need the 
> compatibility of the older version?

We should keep N and N-1 uboot versions around. This gives users time to
ensure their BSP works. After that, if new u-boot cannot be made to work
with a given BSP, then that BSP layer should include their own version
of a u-boot recipe in the layer's recipes-bsp/u-boot.

--
Darren

> 
> Thanks
> 	Sau!
> 
>> Thanks,
>> Paul.
>>
>>>
>>> Sau!
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


