Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 84E6071A76
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 16:07:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 14 Dec 2016 08:07:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,347,1477983600"; d="scan'208";a="1072023045"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.142])
	([10.219.128.142])
	by orsmga001.jf.intel.com with ESMTP; 14 Dec 2016 08:07:24 -0800
To: "Lopez, Mariano" <mariano.lopez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1481701176.git.mariano.lopez@linux.intel.com>
	<78c9c118e58c8b406baddaae656e791d7238f198.1481701176.git.mariano.lopez@linux.intel.com>
	<bed2fbbc-efb4-f04d-86cd-621a48e834f6@linux.intel.com>
	<de192a74-c001-a65a-e992-ba0112b3bab0@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <66911e47-4fa3-9b2c-f4b5-0d4fd87eb84d@linux.intel.com>
Date: Wed, 14 Dec 2016 10:13:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <de192a74-c001-a65a-e992-ba0112b3bab0@linux.intel.com>
Subject: Re: [PATCH 1/1] oeqa/utils/commands.py: Fix get_bb_vars() when called without arguments
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
X-List-Received-Date: Wed, 14 Dec 2016 16:07:24 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 12/14/2016 10:04 AM, Lopez, Mariano wrote:
>
>
> On 12/14/2016 10:01 AM, Leonardo Sandoval wrote:
>>
>>
>> On 12/14/2016 01:45 AM, mariano.lopez@linux.intel.com wrote:
>>> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>>>
>>> Commit 9d55e9d489cd78be592fb9b4d6484f9060c62fdd broke calling 
>>> get_bb_vars()
>>> when called without arguments. This fix this issue.
>>>
>>> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
>>> ---
>>>   meta/lib/oeqa/utils/commands.py | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/lib/oeqa/utils/commands.py 
>>> b/meta/lib/oeqa/utils/commands.py
>>> index 6acb24a..aecf8cf 100644
>>> --- a/meta/lib/oeqa/utils/commands.py
>>> +++ b/meta/lib/oeqa/utils/commands.py
>>> @@ -149,7 +149,8 @@ def get_bb_vars(variables=None, target=None, 
>>> postconfig=None):
>>>       """Get values of multiple bitbake variables"""
>>>       bbenv = get_bb_env(target, postconfig=postconfig)
>>>   -    variables = variables.copy()
>>> +    if variables is not None:
>>> +        variables = variables.copy()
>>
>> Is 'variables' type is  a dict (or some derived type)? I see some 
>> get_bb_env calls using lists and lists do not have the copy method.
>
> I only see 3 calls in OE core, two of them uses None as first 
> argument, and the last one uses a list, also if you check the function 
> it will handle the argument as a list; so the function expect a list 
> or None. And the list support the copy method, I just double check it:
>
> >>> l = [1,2,3]
> >>> l.copy()
> [1, 2, 3]

Sorry, I was using the python2 interpreter when I was doing this check. 
P3 included the copy method on the list data structure.



>
>


