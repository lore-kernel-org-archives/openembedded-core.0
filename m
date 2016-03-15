Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 931F16FF91
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 02:15:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2F2Fl73027086
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 Mar 2016 19:15:47 -0700 (PDT)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 14 Mar 2016 19:15:47 -0700
To: "Mittal, AnujX" <anujx.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1456912541-16297-1-git-send-email-anujx.mittal@intel.com>
	<1456912541-16297-2-git-send-email-anujx.mittal@intel.com>
	<DFCB2C9E62139C41B3FDE8F2B4659331CDF7EF@PGSMSX101.gar.corp.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56E77051.4030300@windriver.com>
Date: Tue, 15 Mar 2016 10:15:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <DFCB2C9E62139C41B3FDE8F2B4659331CDF7EF@PGSMSX101.gar.corp.intel.com>
Cc: "CHANG, REBECCA SWEE FUN" <rebecca.swee.fun.chang@intel.com>
Subject: Re: [meta-intel][master][jethro][PATCH 1/1] tune-corei7.inc: Fix PACKAGE_EXTRA_ARCHS for corei7-32
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
X-List-Received-Date: Tue, 15 Mar 2016 02:15:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Sorry for the late response, I put it to jethro-next just now.

   git://git.openembedded.org/openembedded-core-contrib rbt/jethro-next

// Robert

On 03/14/2016 03:38 PM, Mittal, AnujX wrote:
> Hi Robert,
>
>> Subject: [meta-intel][master][jethro][PATCH 1/1] tune-corei7.inc: Fix
>> PACKAGE_EXTRA_ARCHS for corei7-32
>>
>> From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
>>
>> Change the name to core2-32 from core2.
>>
>> There's no AVAILTUNES with the name core2. Make sure that we specify the correct
>> TUNE name so PACKAGE_EXTRA_ARCHS is expanded correctly.
>>
>> [ YOCTO #9197 ]
>
> Can this be merged to Jethro too? Thanks.
>
>>
>> Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
>> Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
>> ---
>>   meta/conf/machine/include/tune-corei7.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/machine/include/tune-corei7.inc
>> b/meta/conf/machine/include/tune-corei7.inc
>> index 153a21b..6edfb68 100644
>> --- a/meta/conf/machine/include/tune-corei7.inc
>> +++ b/meta/conf/machine/include/tune-corei7.inc
>> @@ -21,7 +21,7 @@ AVAILTUNES += "corei7-32"
>>   TUNE_FEATURES_tune-corei7-32 = "${TUNE_FEATURES_tune-x86} corei7"
>>   BASE_LIB_tune-corei7-32 = "lib"
>>   TUNE_PKGARCH_tune-corei7-32 = "corei7-32"
>> -PACKAGE_EXTRA_ARCHS_tune-corei7-32 =
>> "${PACKAGE_EXTRA_ARCHS_tune-core2} corei7-32"
>> +PACKAGE_EXTRA_ARCHS_tune-corei7-32 =
>> "${PACKAGE_EXTRA_ARCHS_tune-core2-32} corei7-32"
>>   QEMU_EXTRAOPTIONS_corei7-32 = " -cpu Nehalem,check=false"
>>
>>   AVAILTUNES += "corei7-64"
>> --
>> 1.9.1
>
>

