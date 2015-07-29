Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9DD38761D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 13:23:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6TDNWpZ019095
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 06:23:32 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 29 Jul 2015 06:23:15 -0700
Message-ID: <55B8D3CD.2060200@windriver.com>
Date: Wed, 29 Jul 2015 09:23:25 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: He Zhe <zhe.he@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1437461993.git.zhe.he@windriver.com>	<55B09C62.4060408@windriver.com>	<55B59CCF.1060300@windriver.com>
	<55B6F42F.7000105@windriver.com> <55B8819B.6040407@windriver.com>
In-Reply-To: <55B8819B.6040407@windriver.com>
Subject: Re: [PATCH v2 0/2] Yocto Bug #6945
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
X-List-Received-Date: Wed, 29 Jul 2015 13:23:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-07-29 03:32 AM, He Zhe wrote:
> Ping.
>
> Is there any comments on this?

I'm obviously ok with the patch in its current RFC status. It works
and I've tested it in my tree (hence why I've been quiet on this
one).

If it meets the style for merging into core, and that it doesn't
break other layers we can't see .. I was hoping to hear from others.

Bruce

>
> Zhe
>
> On 07/28/2015 11:17 AM, He Zhe wrote:
>> Ping.
>>
>> On 07/27/2015 10:51 AM, He Zhe wrote:
>>> Ping.
>>>
>>> On 07/23/2015 03:48 PM, He Zhe wrote:
>>>> Ping.
>>>>
>>>> On 07/21/2015 03:23 PM, zhe.he@windriver.com wrote:
>>>>> From: He Zhe <zhe.he@windriver.com>
>>>>>
>>>>>   - To support building packaging and installing multi types of kernel
>>>>>     images, such as zImage uImage, at one time define KERNEL_IMAGETYPE
>>>>>     as a list.
>>>>>   - Modify wherever reference KERNEL_IMAGETYPE accordingly.
>>>>>   - Pass mkimage in sysroot to kernel makefile by NATIVE_MKIMAGE to avoid
>>>>>     depending on build machine's, when KEEPUIMAGE is "yes".
>>>>>   - v2: update with the latest oe-core
>>>>>
>>>>> He Zhe (2):
>>>>>    kernel: Define KERNEL_IMAGETYPE as a list
>>>>>    kernel: Pass sysroot mkimage to kernel makefile
>>>>>
>>>>>   meta/classes/image_types.bbclass         |   6 +-
>>>>>   meta/classes/kernel-fitimage.bbclass     |  22 +++---
>>>>>   meta/classes/kernel-grub.bbclass         |  47 ++++++++----
>>>>>   meta/classes/kernel-uimage.bbclass       |  31 +++++---
>>>>>   meta/classes/kernel.bbclass              | 127 ++++++++++++++++++++++---------
>>>>>   meta/conf/documentation.conf             |   2 +-
>>>>>   meta/lib/oeqa/controllers/masterimage.py |   2 +-
>>>>>   meta/lib/oeqa/targetcontrol.py           |   2 +-
>>>>>   meta/recipes-kernel/linux/linux-dtb.inc  |  15 ++--
>>>>>   scripts/test-remote-image                |   2 +-
>>>>>   10 files changed, 175 insertions(+), 81 deletions(-)
>>>>>
>


