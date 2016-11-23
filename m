Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5CBDC6067D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 19:42:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uANJgq05006544
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Nov 2016 11:42:52 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 23 Nov 2016 11:42:51 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <20161123174209.211349-1-mark.hatle@windriver.com>
	<20161123174209.211349-2-mark.hatle@windriver.com>
	<20161123181039.GF3265@jama>
	<c06ab920-517b-b6b8-f2c8-e9ec8ae8714c@windriver.com>
	<20161123185617.GH3265@jama>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <f2e7d5d6-7094-10b6-16bc-9398c8bb828e@windriver.com>
Date: Wed, 23 Nov 2016 13:42:50 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.5.0
MIME-Version: 1.0
In-Reply-To: <20161123185617.GH3265@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta/conf/layer.conf: Add recommended download layer
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
X-List-Received-Date: Wed, 23 Nov 2016 19:42:52 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 11/23/16 12:56 PM, Martin Jansa wrote:
> On Wed, Nov 23, 2016 at 12:38:42PM -0600, Mark Hatle wrote:
>> On 11/23/16 12:10 PM, Martin Jansa wrote:
>>> On Wed, Nov 23, 2016 at 11:42:09AM -0600, Mark Hatle wrote:
>>>> This is a Wind River specific patch and not generally applicable.
>>>
>>> Then why is it sent to oe-core ML?
>>
>> As noted in the cover letter, I'm required to by Yocto Project compliance
>> requirements.
>>
>> As indicated LAST time I got scolded, I was told to indicate this in the patch
>> summary email -- which I did.
> 
> Sorry I've noticed the cover letter only after the response.
> 
> So it's only because of this requirement from Yocto Project compliance?

yes.

> "Have all patches applied to BitBake and OpenEmbedded-Core (if present)
> been submitted to the open source community?"
> 
> Shouldn't the wording be change to something like "all applicable
> patches" or "all generally useful patches"?
> 
> It seems strange to send project specific patches together with cover
> saying that they aren't generally applicable and shouldn't be merged,
> just because of this requirement.

It was done this way to prevent people from cheating and claiming something was
(effectively) not useful/applicable/etc when it some special secret sauce.

Even these patches while not generally applicable could give someone else the
idea to duplicate (or improve) on our approach at providing layer specific
download layers.

--Mark

> Regards,
> 
>>>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>>> ---
>>>>  meta/conf/layer.conf | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
>>>> index 24b4df0..a94e524 100644
>>>> --- a/meta/conf/layer.conf
>>>> +++ b/meta/conf/layer.conf
>>>> @@ -11,6 +11,8 @@ BBFILE_PRIORITY_core = "5"
>>>>  # cause compatibility issues with other layers
>>>>  LAYERVERSION_core = "9"
>>>>  
>>>> +LAYERRECOMMENDS_core = "oe-core-dl-2-2"
>>>> +
>>>>  BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
>>>>  
>>>>  # Set a variable to get to the top of the metadata location
>>>> -- 
>>>> 2.9.3
>>>>
>>>> -- 
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
> 


