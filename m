Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B434731D5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 15:43:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4AFhojq016031
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 May 2016 08:43:50 -0700 (PDT)
Received: from server.local (147.11.118.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 08:43:49 -0700
To: akuster808 <akuster808@gmail.com>, <richard.purdie@linuxfoundation.org>
References: <cover.1462383941.git.bruce.ashfield@windriver.com>
	<fe6fd22aae19a4723616d4b712c7105151315318.1462383941.git.bruce.ashfield@windriver.com>
	<57320003.40509@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <1f45fae0-fdcc-a058-9a48-5bf4d33e00db@windriver.com>
Date: Tue, 10 May 2016 11:43:49 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <57320003.40509@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/11] linux-yocto/4.4: bump to v4.4.8
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
X-List-Received-Date: Tue, 10 May 2016 15:43:55 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-05-10 11:36 AM, akuster808 wrote:
>
>
> On 05/04/2016 10:53 AM, Bruce Ashfield wrote:
>> Integrating the korg -stable releases.
>
> shouldn't LINUX_VERSION ?= "4.4.3" be LINUX_VERSION ?= "4.4.8" ??

Gah. Yes it should. I'm about to to 4.4.9 today, so I can fix up this
change at the same time.

Bruce

>
> - Armin
>
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>  meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
>>  meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 16 ++++++++--------
>>  3 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> index 89c6fff5a4b6..5b509940b5ca 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> @@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt"
>>
>>  require recipes-kernel/linux/linux-yocto.inc
>>
>> -SRCREV_machine ?= "fcabc089b516e760d00a066893f9772d1535785c"
>> +SRCREV_machine ?= "4da435e403bbe6dd8fbc5cdda4411cb6afe72053"
>>  SRCREV_meta ?= "9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8"
>>
>>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
>> index 345e2d577889..b094143c9c07 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
>> @@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.4.3"
>>  KMETA = "kernel-meta"
>>  KCONF_BSP_AUDIT_LEVEL = "2"
>>
>> -SRCREV_machine ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
>> +SRCREV_machine ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
>>  SRCREV_meta ?= "9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8"
>>
>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
>> index f02e0189f21f..b74903ee8aef 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
>> @@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
>>  KBRANCH_qemux86-64 ?= "standard/base"
>>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
>>
>> -SRCREV_machine_qemuarm ?= "1882e842bd477d8a4de02e304a13d230b597d142"
>> -SRCREV_machine_qemuarm64 ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
>> -SRCREV_machine_qemumips ?= "3d1402582cd48731ccfaec497dd9296a59cda386"
>> -SRCREV_machine_qemuppc ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
>> -SRCREV_machine_qemux86 ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
>> -SRCREV_machine_qemux86-64 ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
>> -SRCREV_machine_qemumips64 ?= "6519e6317cc72e380bc1b7543e614ac0032a80ae"
>> -SRCREV_machine ?= "076cc85486fda808582bd1e77400a5c49dea3e2e"
>> +SRCREV_machine_qemuarm ?= "1394eb1f0a1988da223dfc93304222f4543d19c3"
>> +SRCREV_machine_qemuarm64 ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
>> +SRCREV_machine_qemumips ?= "6a063a7239fd16e7a796ce4876e8677d5d02e8cc"
>> +SRCREV_machine_qemuppc ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
>> +SRCREV_machine_qemux86 ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
>> +SRCREV_machine_qemux86-64 ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
>> +SRCREV_machine_qemumips64 ?= "3a1c6d7576908a2dd21746b1d4ab4f43b83cd824"
>> +SRCREV_machine ?= "b18090556c1d1b449233cd555c27a04d38272d6d"
>>  SRCREV_meta ?= "9ab4787fe2aea2ae0fcc31a5e067eaba19ef64c8"
>>
>>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
>>


