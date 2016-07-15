Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3636E660
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 14:43:53 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u6FEhru5011182
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 15 Jul 2016 16:43:53 +0200
Received: from [139.16.77.104] (MD1FZU9C.ww002.siemens.net [139.16.77.104])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id u6FEhrVo010318
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 15 Jul 2016 16:43:53 +0200
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
References: <1468588941-2574-1-git-send-email-pascal.bach@siemens.com>
	<5788F111.9060305@gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <2f95d542-2ccd-7da3-49a2-0e350ca47a07@siemens.com>
Date: Fri, 15 Jul 2016 16:43:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <5788F111.9060305@gmail.com>
Subject: Re: [krogoth][PATCH] gcc, qemuppc: Explicitly disable forcing SPE flags for 4.9
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
X-List-Received-Date: Fri, 15 Jul 2016 14:43:55 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Armin

The patch only modifies an existing patch which already has a header.
I really just did the minimum change by copying and adapting the missing section from the corresponding patch for 5.3. to make qemuppc work again.

Pascal

On 15.07.2016 16:20, akuster808 wrote:
> Pascal,
>
> The "0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch" is
> missing the OE patch standard header information.
>
> please see http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>
> Also, there is no .bb update so this patch will be applied.
>
> regards,
> Armin
>
> On 07/15/2016 06:22 AM, Pascal Bach wrote:
>> This ports the missing changes from commit: 7a51776a830167e43cbd185505f62f328704e271
>> from 5.3 to 4.9 so that qemuppc can be compiled.
>>
>> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>> ---
>>  ...Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-4.9/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
>> index b98f8ff..77fa18a 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.9/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
>> +++ b/meta/recipes-devtools/gcc/gcc-4.9/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
>> @@ -37,6 +37,17 @@ index cb7a94e..d392c2b 100644
>>   	extra_options="${extra_options} rs6000/sysv4.opt"
>>   	tmake_file="rs6000/t-fprules rs6000/t-ppcos ${tmake_file} rs6000/t-ppccomm"
>>   	case ${target} in
>> +Index: gcc-4.9.3/gcc/config/rs6000/linuxspe.h
>> +===================================================================
>> +--- gcc-4.9.3.orig/gcc/config/rs6000/linuxspe.h
>> ++++ gcc-4.9.3/gcc/config/rs6000/linuxspe.h
>> +@@ -27,6 +27,3 @@
>> + #undef	TARGET_DEFAULT
>> + #define TARGET_DEFAULT MASK_STRICT_ALIGN
>> + #endif
>> +-
>> +-#undef  ASM_DEFAULT_SPEC
>> +-#define	ASM_DEFAULT_SPEC "-mppc -mspe -me500"
>>  -- 
>>  1.7.9.5
>>  
>>


