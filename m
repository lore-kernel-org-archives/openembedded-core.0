Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E8C66789FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 08:49:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7H8n3mj023828
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 17 Aug 2018 01:49:03 -0700 (PDT)
Received: from [128.224.162.207] (128.224.162.207) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 17 Aug 2018 01:49:02 -0700
To: Anuj Mittal <anuj.mittal@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180817042938.59347-1-zhixiong.chi@windriver.com>
	<20180817042938.59347-2-zhixiong.chi@windriver.com>
	<0710103a-91d4-1e3b-aad4-6286d45703f2@intel.com>
From: Zhixiong Chi <zhixiong.chi@windriver.com>
Message-ID: <1bf9a203-3752-1fda-f35b-663d0b0edfa3@windriver.com>
Date: Fri, 17 Aug 2018 16:49:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <0710103a-91d4-1e3b-aad4-6286d45703f2@intel.com>
Subject: Re: [PATCH 2/2] sdk: don't install glibc locales for mingw32
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
X-List-Received-Date: Fri, 17 Aug 2018 08:49:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Sorry for that, I will resend the v2 later.

Thanks.


On 2018年08月17日 16:29, Anuj Mittal wrote:
> On 08/17/2018 12:29 PM, Zhixiong Chi wrote:
>> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>> ---
>>   meta/lib/oe/sdk.py | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
>> index 153b07d76b..5d7e4ed2ac 100644
>> --- a/meta/lib/oe/sdk.py
>> +++ b/meta/lib/oe/sdk.py
>> @@ -88,6 +88,10 @@ class Sdk(object, metaclass=ABCMeta):
>>           if self.d.getVar("TCLIBC") != "glibc":
>>               return
>>   
>> +        # Don't install locales for mingw32 SDK_OS
>> +	    if self.d.getVar("SDK_OS") == "mingw32":
>> +            return
> The alignment seems off here ...
>
>    File "../meta/lib/oe/sdk.py", line 138
>      if self.d.getVar("SDK_OS") == "mingw32":
>                                             ^
> TabError: inconsistent use of tabs and spaces in indentation

-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036


