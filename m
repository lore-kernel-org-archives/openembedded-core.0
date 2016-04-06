Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 01F54731B9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 08:53:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u368rPSK017092
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Apr 2016 01:53:26 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Apr 2016 01:53:25 -0700
To: Joshua G Lock <joshua.g.lock@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1459917622.git.dengke.du@windriver.com>
	<39560f98b94a3d0d24c44c7ff139aa1c605a8498.1459917622.git.dengke.du@windriver.com>
	<57049583.8060608@windriver.com>
	<1459932124.5713.1.camel@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5704CE84.6090204@windriver.com>
Date: Wed, 6 Apr 2016 16:53:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1459932124.5713.1.camel@linux.intel.com>
Subject: Re: [PATCH 1/1] coreutils: correct the case for class-native
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
X-List-Received-Date: Wed, 06 Apr 2016 08:53:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/06/2016 04:42 PM, Joshua G Lock wrote:
> On Wed, 2016-04-06 at 12:50 +0800, Robert Yang wrote:
>>
>> On 04/06/2016 12:45 PM, Dengke Du wrote:
>>>
>>> The function of do_install_append_class-native for class-native
>>> had alread exist,so exclude the class-native in function
>>> do_install_append.
>>>
>>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>>> ---
>>>    meta/recipes-core/coreutils/coreutils_8.25.bb | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/meta/recipes-core/coreutils/coreutils_8.25.bb
>>> b/meta/recipes-core/coreutils/coreutils_8.25.bb
>>> index 419a693..e8e269a 100644
>>> --- a/meta/recipes-core/coreutils/coreutils_8.25.bb
>>> +++ b/meta/recipes-core/coreutils/coreutils_8.25.bb
>>> @@ -70,6 +70,10 @@ do_compile_prepend () {
>>>    }
>>>
>>>    do_install_append() {
>>> +	if [ "${CLASSOVERRIDE}" = "class-native" ]; then
>>> +		return
>>> +	fi
>>> +
>
> If the do_install_append is only valid for the target it'd be cleaner
> to use a target-specific override i.e.

Thanks, but it is needed by both target and nativesdk.

// Robert

>
> do_install_append_class-target () {
> }
>
> Thanks,
>
> Joshua
>

