Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5885373243
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 15:44:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8IFiYNY008245
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 08:44:35 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Fri, 18 Sep 2015 08:44:34 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1442503745.git.alejandro.joya.cruz@intel.com>
	<55FBDAF1.3030906@communistcode.co.uk>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55FC3163.7010603@windriver.com>
Date: Fri, 18 Sep 2015 10:44:35 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <55FBDAF1.3030906@communistcode.co.uk>
Subject: Re: [PATCH 0/3] Dynamic common utilities
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
X-List-Received-Date: Fri, 18 Sep 2015 15:44:37 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 9/18/15 4:35 AM, Jack Mitchell wrote:
> On 17/09/15 17:20, Alejandro Joya wrote:
>> It provide a virtual reference for the common utilities.
>> it replace of the lock to busybox, it will be simple exchange between other
>> common utilities like gnu core utils or toybox among others.
>>
>> In order to enable its required to fill at the distro conf or local.conf
>>
>> VIRTUAL-RUNTIME_login_manager ?= "busybox"
>> PREFERRED_PROVIDER_virtual/anybox ?= "busybox"
>> PREFERRED_RPROVIDER_virtual/anybox ?= "busybox"
>> VIRTUAL-RUNTIME_anybox ?= "busybox"
>> VIRTUAL-RUNTIME_anybox-hwclock ?= "busybox-hwclock"
>>
>> The following changes since commit f0189829498e30231d826c9f55aad73e622d076e:
>>
>>    qemu: Update to upstream patches (2015-09-14 11:22:02 +0100)
>>
>> are available in the git repository at:
>>
>>    git://github.com/Ajoyacr/openembedded-core anybox
>>    https://github.com/Ajoyacr/openembedded-core/tree/anybox
>>
>> Alejandro Joya (3):
>>    core-mage-minimal-initramfs: overwrite hardcoded dependency to virtual
>>      reference
>>    initramfs-framework: overwrite hardcoded dependency to virtual
>>      reference
>>    packagegroup-core-boot: overwrite hardcoded dependency to virtual
>>      reference
>>
>>   meta/recipes-core/images/core-image-minimal-initramfs.bb   | 2 +-
>>   meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 +-
>>   meta/recipes-core/packagegroups/packagegroup-core-boot.bb  | 6 +++---
>>   3 files changed, 5 insertions(+), 5 deletions(-)
>>
> 
> is 'anybox' a good name for the virtual provider? What happens if we have a new 
> suite of core utility replacements without box in the name, I assume it will be 
> a nightmare to retroactivly change the name so we should probably come up with a 
> more generic one now. virtual/core-utils, virtual/base-utils?

Personally I like this better -- however, I think we're "too late" in the
current development cycle to do it..  but for the next cycle, we should
certainly consider going through the system and doing this instead.

(It will definitely make it easier in the future to get rid of a "box" based
system if desired.)

--Mark

> Cheers,
> Jack.
> 


