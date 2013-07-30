Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3B5716B3FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 16:46:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2013 09:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,778,1367996400"; d="scan'208";a="378988469"
Received: from unknown (HELO [10.255.14.47]) ([10.255.14.47])
	by orsmga002.jf.intel.com with ESMTP; 30 Jul 2013 09:45:59 -0700
Message-ID: <51F7EDC7.1050105@linux.intel.com>
Date: Tue, 30 Jul 2013 09:45:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<20130629053844.GQ3261@jama>
	<408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
	<20130629153101.GV3261@jama>
	<45F76803-CA83-4DAC-A972-EE4CB8FEE054@gmail.com>
In-Reply-To: <45F76803-CA83-4DAC-A972-EE4CB8FEE054@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/24] Add python3 recipes
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
X-List-Received-Date: Tue, 30 Jul 2013 16:46:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2013 01:16 AM, Khem Raj wrote:
>
> On Jun 29, 2013, at 8:31 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> On Sat, Jun 29, 2013 at 07:11:35AM -0700, Khem Raj wrote:
>>>
>>> On Jun 28, 2013, at 10:38 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>
>>>> On Fri, Jun 28, 2013 at 03:03:39PM -0700, Khem Raj wrote:
>>>>>
>>>>> generate-manifest-3.3.py: Add script to generate python 3.3 manifests
>>>>> python-3.3-manifest: Add python3 manifest file
>>>>
>>>>> classes: Add distutils for python3
>>>>> setuptools.bbclass: Use python-distribute instead of
>>>>>    python-setuptools
>>>>> distutils3.bbclass: Port the distutils class fix to handle filenames
>>>>>    with spaces
>>>>> setuptools3.bbclass: Remove useless multiline comment
>>>>> distutils: Introduce PYTHON_ABI variable
>>>>> distutils3: Do build_ext as separate step during compile
>>>>
>>>
>>>> I think these 2 groups could be squashed together for easier review, but
>>>
>>> do you mean create just two patches out of those ?
>>
>> Yes
>>
>>>> otherwise great work, thanks for doing it!
>>>>
>>>> I'll add them to jenkins a bit later when I get some better build that
>>>> what we have now.
>>>
>>> They were added in order that the build keeps working with every commit for helping bisects on tree later
>>
>> I meant that e.g.
>>   classes: Add distutils for python3
>> introduces setuptools3.bbclass and
>>   setuptools3.bbclass: Remove useless multiline comment
>> just 3 commits later fixes that, the same with the left-over commit I
>> mentined in other thread which was also resolved by some follow up
>> commit, with all new .bbclasses together I would read them just once.
>>
>
> Thanks Martin and Paul for reviewing and trying out the patches
> Finally I have now addressed all the comments/feedback that was provided for this patch set.
> The pull tree is now updated to latest.
>
> Take a look and install if its ok
>
Please review your patches for Upstream-Status: and Signed-off-by: tags.

I will be reviewing and building this on the AB in mut.


Sau!

> -Khem
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

