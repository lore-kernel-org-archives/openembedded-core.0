Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 560E37199A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Aug 2017 16:46:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v73GkqZA017099
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 3 Aug 2017 09:46:52 -0700
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 3 Aug 2017 09:46:51 -0700
To: akuster808 <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <1501521367-17192-1-git-send-email-akuster808@gmail.com>
	<1501521367-17192-2-git-send-email-akuster808@gmail.com>
	<b07d8080-7ad5-c68e-5c8b-471db09ff515@windriver.com>
	<1984b5e8-8d54-4f03-dcdb-b086605b4a91@gmail.com>
	<c5907c3e-ae33-625a-d214-30d130a5a37b@windriver.com>
	<e0e65de3-e49a-b1af-9bd7-67a6d33ba859@gmail.com>
	<ef1580a9-9643-f8ad-1865-78fc5f6aeec4@gmail.com>
	<CAMKF1sp+4C4XPUf5Xhc=fhKiidy-YHqrkLZzhGpToTexCV=1pg@mail.gmail.com>
	<0ba13ea2-54b8-f447-1e85-5f84a15c3f82@windriver.com>
	<CAMKF1sp4xrp0hEXh2sY3tb0Sk61S8k_ToX=LBQfp5e3ioYUtOQ@mail.gmail.com>
	<9ed788dd-bac2-378d-5263-23a5dfab40a4@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <c0562339-5ba4-df6f-be80-fcd15f657c9c@windriver.com>
Date: Thu, 3 Aug 2017 11:46:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <9ed788dd-bac2-378d-5263-23a5dfab40a4@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] armv8: update to use armv8-a tune
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
X-List-Received-Date: Thu, 03 Aug 2017 16:46:53 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 8/3/17 10:56 AM, akuster808 wrote:
> 
> 
> On 08/01/2017 08:46 AM, Khem Raj wrote:
>> On Tue, Aug 1, 2017 at 8:24 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>> On 8/1/17 10:20 AM, Khem Raj wrote:
>>>> On Tue, Aug 1, 2017 at 8:17 AM, akuster808 <akuster808@gmail.com> wrote:
>>>>>
>>>>> On 07/31/2017 12:04 PM, Khem Raj wrote:
>>>>>>
>>>>>> On 7/31/17 10:51 AM, Mark Hatle wrote:
>>>>>>> On 7/31/17 12:40 PM, akuster808 wrote:
>>>>>>>>
>>>>>>>> On 07/31/2017 10:31 AM, Mark Hatle wrote:
>>>>>>>>> On 7/31/17 12:16 PM, Armin Kuster wrote:
>>>>>>>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>>>>>>>> ---
>>>>>>>>>>    meta/conf/machine/include/arm/arch-armv8.inc | 25
>>>>>>>>>> +++++++++++++++++++++++++
>>>>>>>>>>    1 file changed, 25 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc
>>>>>>>>>> b/meta/conf/machine/include/arm/arch-armv8.inc
>>>>>>>>>> index 5e832fa..dc1ba5e 100644
>>>>>>>>>> --- a/meta/conf/machine/include/arm/arch-armv8.inc
>>>>>>>>>> +++ b/meta/conf/machine/include/arm/arch-armv8.inc
>>>>>>>>>> @@ -1 +1,26 @@
>>>>>>>>>> +DEFAULTTUNE ?= "armv8-a"
>>>>>>>>> do we want the '-a'?  The other arm (7) are of the format armv7a (no
>>>>>>>>> '-').
>>>>>>>> works for me either way.
>>>>>>>>
>>>>>>>> While we are at it. How would we want ‘armv8.1-a’, ‘armv8.2-a’,
>>>>>>>> ‘armv8.3-a'
>>>>>>>> formated as?
>>>>>>> My preference is to drop the '-'.  As for the '.', I'm not sure.. not
>>>>>>> something
>>>>>>> we've run across before.
>>>>>>>
>>>>>>> We could just drop it (the '.'), but it really depends on if armv81a
>>>>>>> would
>>>>>>> confuse someone (familiar with arm) or not.
>>>>>> I would suggest to also sync  with other distros and ensure that we dont
>>>>>> do something different. Its very costly later. Since applications get
>>>>>> ported to most common combination
>>>>> Sync what part? naming of file? ( sorry lost regarding your comment)
>>>> naming convention for arch e.g.
>>>>
>>> I'd say Debian/Ubuntu -- Fedora/RH would be the two primary sources I'd look at.
>>>   Between debian package names and RPM package names, it should give a clue if
>>> there is any community standard forming for those names.
>>>
>>> (May still be too premature for those environments for the armv8.X-a naming...
>>> and I've not seen it discussed on any other lists either.)
>> yeah, it will be good to not go through the pain of community doing
>> something else later
>> like *-*-gnueabihf triplet was invented and to date we keep fixing
>> packages for OE
>> to account for gnueabihf can be gnueabi + -mfloat-abi=hard but
>> packages just assume
> 
> I think I now understand the issue. Any interest in having additional 
> tune files warehoused somewhere so folks don't have to reinvent the 
> wheel? Something like "meta-extra-tunes" ?
> 
> I prefer fostering contributions for additional tune files that get 
> vetted by the community rather than the multitude of unseen 
> implementations I have found sitting around.

I wouldn't be against it.  The original thought was that new tunes (and related
configurations) would be housed in the BSP until submitted to the YP.  But I'm
not sure in hindsight that is very robust..

Having a general meta-* layer that can just collect arch settings would be
useful to help coordinate people, but keep out in-progress stuff from the base.
The only issue is someone will have to further coordinate acceptance into the
extra layer, and help push them into the oe-core proper when the tune quality is
at a correct level --or-- the tune becomes prevalent in the world.

(I just don't want it to become a dumping ground and it never ends up in the
core...  Similarly moving older tunes out of the core might some day be useful
as well.)

Key of course is this should include tunes, as well as things like
siteinfo.bbclass and insane.bbclass or other extensions.  (via:
PACKAGEQA_EXTRA_MACHDEFFUNCS and similar.)

While the toolchains, arch recipe patches, etc should be elsewhere...

--Mark

> regards,
> armin
> 
>>
>>
>>> --Mark
> 


