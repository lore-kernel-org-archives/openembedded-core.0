Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 352CA65E43
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 15:57:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3AFvoZN022787
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Apr 2014 08:57:50 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 10 Apr 2014 08:57:50 -0700
Message-ID: <5346BF78.10602@windriver.com>
Date: Thu, 10 Apr 2014 11:57:44 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <cover.1397142033.git.bruce.ashfield@windriver.com>
	<198fd55bc5c581415314c7494497fe280965ee17.1397142033.git.bruce.ashfield@windriver.com>
	<20140410155554.GM3370@denix.org>
In-Reply-To: <20140410155554.GM3370@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/6] linux-yocto/3.14: beagleboard black: USB, DRM config tweaks
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
X-List-Received-Date: Thu, 10 Apr 2014 15:57:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-04-10 11:55 AM, Denys Dmytriyenko wrote:
> Thanks, Bruce!
>
> The subject says beagleboard but should be beaglebone...

old habits die hard ;)

Bruce

>
>
> On Thu, Apr 10, 2014 at 11:12:35AM -0400, Bruce Ashfield wrote:
>> Importing the meta SRCREV to pick up the following two fixes:
>>
>>    928d7b2ddad0 beaglebone: enhance USB support and enable MUSB modules
>>    fbe38387ac61 beaglebone: enable DRM for HDMI output
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb | 2 +-
>>   meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
>> index 2a1e20429d8a..a441a53fb95b 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
>> @@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.14"
>>   KMETA = "meta"
>>
>>   SRCREV_machine ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
>> -SRCREV_meta ?= "8f55bee2403176a50cc0dd41811aa60fcf07243c"
>> +SRCREV_meta ?= "928d7b2ddad0abc8827055c51ba34225878344a0"
>>
>>   PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
>> index b275f2738d8b..7f0ec2b559a3 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
>> @@ -17,7 +17,7 @@ SRCREV_machine_qemux86 ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
>>   SRCREV_machine_qemux86-64 ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
>>   SRCREV_machine_qemumips64 ?= "ccb2a788551a7951563ac44a27175c6f28501008"
>>   SRCREV_machine ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
>> -SRCREV_meta ?= "8f55bee2403176a50cc0dd41811aa60fcf07243c"
>> +SRCREV_meta ?= "928d7b2ddad0abc8827055c51ba34225878344a0"
>>
>>   SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
>>
>> --
>> 1.8.1.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


