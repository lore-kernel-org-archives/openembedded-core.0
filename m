Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 34C4F79558
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 15:57:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8LFvuJd005994
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Sep 2018 08:57:56 -0700 (PDT)
Received: from server.local (128.224.20.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 21 Sep 2018 08:57:55 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>, Anuj Mittal
	<anuj.mittal@intel.com>, Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <CALbNGRTAbsa9CzzXqtq7mpiknFzUB_=9eHcFHnD5W--HEM8bPw@mail.gmail.com>
	<20180402215705.GA25121@linux-uys3>
	<CALbNGRThT8S5bfJH=zXMkQzCMMasQ=yUoEXTjsfPXtncig3yFA@mail.gmail.com>
	<ada194d6-5653-fde7-a70a-64646b08b281@intel.com>
	<CALbNGRTthOp+_T-6c_Vc3qmgMHTt-2ztyDiGbNEHY4+6UuW2ig@mail.gmail.com>
	<CALbNGRQT94ptEPAygj+Rm9vBm27yo=inbz+O6nR2gL_etkGd7g@mail.gmail.com>
	<CALbNGRQxauR4PkJ+FMXKmnJapcWO9pVSvW1cLVyrDU9-T+o65A@mail.gmail.com>
	<0717be0e-0c72-e3f5-dc11-8e4065585749@intel.com>
	<CALbNGRQtXBw+yAeUK5X5WDZtrv6WeuSH1ZQ97neVrkJm4v8wVQ@mail.gmail.com>
	<CALbNGRRVkb19JTLwAPJhUeKSf1guBKU9O_x2VemBr8-uKSw_AQ@mail.gmail.com>
	<4e5235ad-b3a6-4985-43b4-ef71d6bf16a6@windriver.com>
Message-ID: <b8ccd853-2b25-4364-7770-7ef8df4db646@windriver.com>
Date: Fri, 21 Sep 2018 11:57:54 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <4e5235ad-b3a6-4985-43b4-ef71d6bf16a6@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel menuconfig broken?
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
X-List-Received-Date: Fri, 21 Sep 2018 15:57:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2018-09-21 11:34 AM, Bruce Ashfield wrote:
> On 2018-09-21 11:33 AM, Andreas Müller wrote:
>> On Fri, Sep 21, 2018 at 4:39 PM, Andreas Müller 
>> <schnitzeltony@gmail.com> wrote:
>>> On Fri, Sep 21, 2018 at 1:46 PM, Anuj Mittal <anuj.mittal@intel.com> 
>>> wrote:
>>>>> Hi,
>>>>>
>>>>> seems upstream has introduced changes 4.17 -> 4.18 - the patch does
>>>>> not apply anymore. Is this patch available for 4.18 somewhere?
>>>>>
>>>>
>>>> Are you looking for this:
>>>>
>>>> https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit?h=v4.18/standard/base&id=bd6314212686ef8156a108b6f1eec67d34402878 
>>>>
>>>>
>>>> https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit/?h=v4.18/standard/base&id=0aa800372a846d6ed2c0fc3e0fdc22656d268968 
>>>>
>>> Exactly thanks
>>>
>> Otavio pointed to it when I sent them to linux-fslc: Why the code 
>> duplication?
>>
> 
> What do you mean by code duplication ? There was a bug in the initial
> port that needed a 2nd commit to fix it, but there's no duplicated
> code.

Ah. I see what you mean now. That was a mistake. I've already fixed
it in future versions, but since nothing breaks with it, the extra
block has stayed in 4.18.

Bruce

> 
> Bruce
> 
>> Andreas
>>
> 


