Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 323087C371
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 06:06:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0P66F7j011151
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jan 2019 22:06:15 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 24 Jan 2019 22:06:02 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1548313066.git.liezhi.yang@windriver.com>
	<a0d185da70165b9d7e8166bf7e6a1a7065045fea.1548313066.git.liezhi.yang@windriver.com>
	<CAMKF1srfkqtzhsQ7OcPUQsOuf_bzA4V-AOrCWhRm2Ur=G1BO_w@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <acf814b3-91fb-7728-db74-0319bcd3e486@windriver.com>
Date: Fri, 25 Jan 2019 14:10:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srfkqtzhsQ7OcPUQsOuf_bzA4V-AOrCWhRm2Ur=G1BO_w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] gcc-runtime: Add --cache-file to EXTRA_OECONF
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
X-List-Received-Date: Fri, 25 Jan 2019 06:06:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/25/19 12:23 PM, Khem Raj wrote:
> On Thu, Jan 24, 2019 at 2:00 AM Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> This can save configure time since it runs configure multiple times:
>> $ time bitbake gcc-runtime -cconfigure
>>    60s -> 54s
>>
>>    Saved 6s
> 
> looks ok. Are we sure this file is preserved across builds

Sorry, what did you mean about preserved across builds, please ?

// Robert

>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-runtime.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> index 50ecc81..3d03d8e 100644
>> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> @@ -15,6 +15,7 @@ EXTRA_OECONF_PATHS = "\
>>   "
>>
>>   EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>> +EXTRA_OECONF_append = " --cache-file=${B}/config.cache"
>>
>>   RUNTIMELIBITM = "libitm"
>>   RUNTIMELIBITM_arc = ""
>> --
>> 2.10.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

