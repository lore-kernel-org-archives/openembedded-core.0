Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5C23160125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 02:31:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2M2VkUx027285
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 19:31:47 -0700 (PDT)
Received: from [128.224.162.234] (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 21 Mar 2016 19:31:45 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1456315808.git.zhe.he@windriver.com>
	<56E23C3E.2000101@windriver.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <56F0AE86.3060105@windriver.com>
Date: Tue, 22 Mar 2016 10:31:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56E23C3E.2000101@windriver.com>
X-Originating-IP: [128.224.162.234]
Subject: Re: [PATCH v3 0/2] Yocto Bug #6945
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
X-List-Received-Date: Tue, 22 Mar 2016 02:31:48 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Ping.

Thanks,
Zhe

On 03/11/2016 11:32 AM, He Zhe wrote:
> Any more comments?
>
> Thanks,
> Zhe
>
> On 02/24/2016 08:20 PM, zhe.he@windriver.com wrote:
>> From: He Zhe <zhe.he@windriver.com>
>>
>> v1 to v2:
>>  - Change KERNEL_OUTPUT to KERNEL_OUTPUT_DIR and update comments
>>  - Update related doc files
>>  - Replace all KERNEL_ALT_IMAGETYPEs with KERNEL_IMAGETYPES
>>  - Link built vmlinuz to boot directory for reference
>>
>> v2 to v3:
>>  - Merge existing KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES in order that users can still use the old variables.
>>  - Run oe_rummake in a loop for every types so that we can add different configurations to them easily in the future.
>>  - Warn, intead of die, users if one of the types are over the size limit.
>>  - Remove the replacement of KERNEL_ALT_IMAGETYPE in v2.
>>  - Remove the doc parts. They will be submitted yocto-docs later.
>>  - Change some grep usage to make it more clear.
>>  - Correct a typo.
>>
>> The following changes since commit 23056103c949b498c23b47579e8dd57ce78e6ed9:
>>
>>   uclibc: Do not use immediate expansion operator (2016-02-22 20:42:48 +0000)
>>
>> are available in the git repository at:
>>
>>   git://git.yoctoproject.org/poky-contrib zhe/yocto-bug-6945
>>   http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=zhe/yocto-bug-6945
>>
>> for you to fetch changes up to dc52a1efbb8248ea274a1cd0cca5734290b3025f:
>>
>>   kernel: Make symbol link to vmlinuz in boot directory (2016-02-24 07:08:16 -0500)
>>
>> ----------------------------------------------------------------
>> He Zhe (2):
>>       kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time
>>       kernel: Make symbol link to vmlinuz in boot directory
>>
>>  meta/classes/kernel-fitimage.bbclass      |  20 ++++++++-------
>>  meta/classes/kernel-grub.bbclass          |  44 +++++++++++++++++++++-----------
>>  meta/classes/kernel-uimage.bbclass        |  22 ++++++++--------
>>  meta/classes/kernel.bbclass               | 187 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------
>>  meta/conf/documentation.conf              |   3 ++-
>>  meta/recipes-kernel/linux/linux-dtb.inc   |  49 ++++++++++++++++++++++--------------
>>  meta/recipes-kernel/linux/linux-yocto.inc |   2 +-
>>  7 files changed, 218 insertions(+), 109 deletions(-)
>>
>> He Zhe (2):
>>   kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time
>>   kernel: Make symbol link to vmlinuz in boot directory
>>
>>  meta/classes/kernel-fitimage.bbclass      |  20 ++--
>>  meta/classes/kernel-grub.bbclass          |  44 ++++---
>>  meta/classes/kernel-uimage.bbclass        |  22 ++--
>>  meta/classes/kernel.bbclass               | 187 +++++++++++++++++++++---------
>>  meta/conf/documentation.conf              |   3 +-
>>  meta/recipes-kernel/linux/linux-dtb.inc   |  49 +++++---
>>  meta/recipes-kernel/linux/linux-yocto.inc |   2 +-
>>  7 files changed, 218 insertions(+), 109 deletions(-)
>>


