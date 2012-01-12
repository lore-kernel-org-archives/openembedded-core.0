Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlTxM-00088p-EJ
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 00:21:16 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Jan 2012 08:56:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="55866943"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Jan 2012 08:56:44 -0800
Message-ID: <4F0F10CC.9030704@linux.intel.com>
Date: Thu, 12 Jan 2012 08:56:44 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Tom Zanussi <tom.zanussi@intel.com>
References: <cover.1325903501.git.tom.zanussi@intel.com>
	<1d28eae1f497931d4a0a232a3390a9737a508aec.1325903501.git.tom.zanussi@intel.com>
	<4F07D3CA.4090807@linux.intel.com>
	<1325913187.15053.83.camel@elmorro>
	<4F0B7FF0.9060904@linux.intel.com>
	<1326154410.2413.22.camel@elmorro>
In-Reply-To: <1326154410.2413.22.camel@elmorro>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] base.bbclass: add support for LICENSE_FLAGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jan 2012 23:21:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2012 04:13 PM, Tom Zanussi wrote:
> On Mon, 2012-01-09 at 16:01 -0800, Saul Wold wrote:
>> On 01/06/2012 09:13 PM, Tom Zanussi wrote:
>>> On Fri, 2012-01-06 at 21:10 -0800, Saul Wold wrote:
>>>> On 01/06/2012 06:34 PM, tom.zanussi@intel.com wrote:
>>>>> From: Tom Zanussi<tom.zanussi@intel.com>

<SNIP>

>>>>
>> With all the discussion about License related stuff on the list and IRC,
>> I think we should be creating a bbclass to define and hold these flags.
>>    Then there is just a call from base.bbclass into check_license_flags
>> and return True/False for the skip_package().
>>
>
> So move this code into a separate .bbclass, ok.
>
Move this code the license.bbclass or meta/lib/oe/licensee.py as 
appropriate.

>> And based on a comment from Chris L. on the IRC, will this handle
>> package level LICENSE_FLAGS, this is recipe level currently, correct?
>>
>
> Right.
>
>> It could be you have some recipe with multiple binaries (for example)
>> some are OK and some are not and they are packaged separately. Can the
>> LICENSE_FLAGS handle this?
>>
>
> No, I don't think so, there's just the per-recipe LICENSE_FLAGS.  How
> would that be expanded to per-package?
>
I verified with Richard, I thought we could do per-package, we can not 
currently, so LICENSE_FLAGS will be per-recipe now.

Possibly change in the future would be per-package.

Thanks for your work on this, I you have had to do some reworks, we are 
just trying to get it right.

Sau!

> Tom
>
>> Sau!
>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>
>
>


