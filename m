Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC647705F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 06:32:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8E6WPL3001195
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 13 Sep 2016 23:32:25 -0700
Received: from [128.224.21.36] (128.224.21.36) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Sep 2016 23:32:23 -0700
To: Robert Yang <liezhi.yang@windriver.com>,
	<richard.purdie@linuxfoundation.org>
References: <cover.1473704020.git.bruce.ashfield@windriver.com>
	<924accb9f4101282ad0fb3417fdb48e1439679d8.1473704020.git.bruce.ashfield@windriver.com>
	<272ec6fd-6989-bb61-a8f2-0faef9eb6fbb@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <57D8EEF2.4040200@windriver.com>
Date: Wed, 14 Sep 2016 02:32:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <272ec6fd-6989-bb61-a8f2-0faef9eb6fbb@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] linux-yocto/4.1: update to 4.1.32
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
X-List-Received-Date: Wed, 14 Sep 2016 06:32:28 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2016 10:21 PM, Robert Yang wrote:
>
> Hi Bruce,
>
> All the kernel 4.1 and 4.4 buildings are down on autobuilder:
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/builds/928/stehttps://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/947/steps/BuildImages/logs/stdiops/BuildImages/logs/stdio
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/builds/928/steps/BuildImages/logs/stdio

My push to the kernel-cache bounced (due to competing changes I was
working on).

It should be fixed up now, but I'm on a slow network and can't easily
test at the moment.

Bruce

>
>
> // Robert
>
> On 09/13/2016 02:16 AM, Bruce Ashfield wrote:
>> Integrating the korg stable update
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
>>  meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20
>> ++++++++++----------
>>  3 files changed, 16 insertions(+), 16 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
>> index f0d6a81a9c54..4308a07a9765 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
>> @@ -11,13 +11,13 @@ python () {
>>          raise bb.parse.SkipPackage("Set
>> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>>  }
>>
>> -SRCREV_machine ?= "b88e2b5805213daeb0136fdd8c840dc0254a3d21"
>> -SRCREV_meta ?= "9d0f0db8442a5ccb3f2ce81e2e43d96b6515a45a"
>> +SRCREV_machine ?= "ee83bffe0f76032fe0a0b7fde436f0f596101df2"
>> +SRCREV_meta ?= "b30b6b9ef215433b28e8966c73ebb6b98a7f4d1f"
>>
>>  SRC_URI =
>> "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine
>> \
>>
>> git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
>>
>>
>> -LINUX_VERSION ?= "4.1.30"
>> +LINUX_VERSION ?= "4.1.32"
>>
>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
>> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
>> index 092a224451e1..2294a3db87da 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
>> @@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
>>
>>  require recipes-kernel/linux/linux-yocto.inc
>>
>> -LINUX_VERSION ?= "4.1.30"
>> +LINUX_VERSION ?= "4.1.32"
>>
>>  KMETA = "kernel-meta"
>>  KCONF_BSP_AUDIT_LEVEL = "2"
>>
>> -SRCREV_machine ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
>> -SRCREV_meta ?= "9d0f0db8442a5ccb3f2ce81e2e43d96b6515a45a"
>> +SRCREV_machine ?= "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
>> +SRCREV_meta ?= "b30b6b9ef215433b28e8966c73ebb6b98a7f4d1f"
>>
>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
>> b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
>> index e23d7da58881..f4006b74d096 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
>> @@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
>>  KBRANCH_qemux86-64 ?= "standard/base"
>>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
>>
>> -SRCREV_machine_qemuarm ?= "9c5e96205316d167379d101d808a6cda93adc335"
>> -SRCREV_machine_qemuarm64 ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
>> -SRCREV_machine_qemumips ?= "9e531cb59dd7dfa2026637cc456a7bdcbdb50275"
>> -SRCREV_machine_qemuppc ?= "32968ddd9357f72dfd427f5b3eda62c4a49833c7"
>> -SRCREV_machine_qemux86 ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
>> -SRCREV_machine_qemux86-64 ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
>> -SRCREV_machine_qemumips64 ?= "106ed721d21c595dfb993a8990c3a29830dfc166"
>> -SRCREV_machine ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
>> -SRCREV_meta ?= "9d0f0db8442a5ccb3f2ce81e2e43d96b6515a45a"
>> +SRCREV_machine_qemuarm ?= "4db58705727e27bea8ccf805bd5c7d04d2d029ed"
>> +SRCREV_machine_qemuarm64 ?= "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
>> +SRCREV_machine_qemumips ?= "d6237b3b244b894d4b3479ecf37acef041416dfa"
>> +SRCREV_machine_qemuppc ?= "8520e65497ae10e14c38c76920a3457dc64349bf"
>> +SRCREV_machine_qemux86 ?= "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
>> +SRCREV_machine_qemux86-64 ?= "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
>> +SRCREV_machine_qemumips64 ?= "d0524e144cd15a3c0edf768f68400968a4477cbe"
>> +SRCREV_machine ?= "93b1a6cee7d4a4437a1c0edf3e54ffe78edb4462"
>> +SRCREV_meta ?= "b30b6b9ef215433b28e8966c73ebb6b98a7f4d1f"
>>
>>  SRC_URI =
>> "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH};
>> \
>>
>> git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
>>
>>
>> -LINUX_VERSION ?= "4.1.30"
>> +LINUX_VERSION ?= "4.1.32"
>>
>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>>


