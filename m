Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA8E606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 14:33:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7HEXoPP006255
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Aug 2015 07:33:50 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 17 Aug 2015 07:33:50 -0700
Message-ID: <55D1F0BD.5060008@windriver.com>
Date: Mon, 17 Aug 2015 10:33:33 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: He Zhe <zhe.he@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1439204789.git.zhe.he@windriver.com>
	<55D1A5FB.90504@windriver.com>
In-Reply-To: <55D1A5FB.90504@windriver.com>
Subject: Re: [PATCH v4 0/1] Yocto Bug #6945
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
X-List-Received-Date: Mon, 17 Aug 2015 14:33:56 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-08-17 05:14 AM, He Zhe wrote:
> Ping.

Everyone still has this on their list. I'm just back from vacation now,
and will put a review in my TODO list.

But for now .. patience is still requested.

Cheers,

Bruce

>
> On 08/10/2015 08:46 PM, zhe.he@windriver.com wrote:
>> From: He Zhe <zhe.he@windriver.com>
>>
>>   - Add KERNEL_IMAGETYPES to support building packaging and installing
>> multi types of kernel images, such as zImage uImage, at one time.
>>   - KERNEL_IMAGETYPE works as it did.
>>   - v2: Update with the latest oe-core
>>   - v3: Add KERNEL_IMAGETYPES, leave KERNEL_IMAGETYPE as is
>>   - v4: Turn package name to lower case to meet opkg's requrement
>>         Modify "if test" in kernel-fitimage.bbclass and kernel-uimage.bbclass
>>
>>
>> He Zhe (1):
>>    kernel: Add KERNEL_IMAGETYPES to build multi types of kernel at one
>>      time
>>
>>   meta/classes/kernel-fitimage.bbclass    |  21 +++---
>>   meta/classes/kernel-grub.bbclass        |  46 +++++++----
>>   meta/classes/kernel-uimage.bbclass      |  22 +++---
>>   meta/classes/kernel.bbclass             | 130 +++++++++++++++++++++++---------
>>   meta/conf/documentation.conf            |   1 +
>>   meta/recipes-kernel/linux/linux-dtb.inc |  81 ++++++++++++--------
>>   6 files changed, 199 insertions(+), 102 deletions(-)
>>
>


