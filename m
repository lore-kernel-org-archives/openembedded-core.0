Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3CD556A9D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 19:19:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Oct 2014 12:19:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,718,1406617200"; d="scan'208";a="614455376"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.58])
	([10.219.4.58])
	by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2014 12:19:22 -0700
Message-ID: <543D7740.1060701@linux.intel.com>
Date: Tue, 14 Oct 2014 14:19:28 -0500
From: =?windows-1252?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>, openembedded-core@lists.openembedded.org
References: <543C4180.1050902@linux.intel.com> <543C4F99.9070409@gmail.com>
In-Reply-To: <543C4F99.9070409@gmail.com>
Subject: Re: License manifest OR handling
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
X-List-Received-Date: Tue, 14 Oct 2014 19:19:30 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Jonathan,

I think is possible but i don't know how useful it is,

Can you give an example?

Regards.

On 13/10/14 17:18, Jonathan Liu wrote:
> On 14/10/2014 8:17 AM, Aníbal Limón wrote:
>> Hi everybody,
>>
>> I'm working in one bug [1] related to License manifest creation and i 
>> have some concerns about what is
>> expected in License creation more specifically in the OR's handling.
>>
>> I re-implemented license creation function from shell to python for 
>> use oe.license module and added support
>> for take into account INCOMPATIBLE_LICENSES.
>>
>> For example: Currently if you have LICENSE set to (MPLv2 | GPLv2.1) & 
>> LGPLv3,
>>     - With INCOMPATIBLE_LICENSES not set the result is: MPLv2 LGPLv3.
>>     - With INCOMPATIBLE_LICENSES set to MPLv2 the result is: GPLv2.1 
>> LGPLv3.
>>
>> This is that oe.license model eval's the OR expression and if you 
>> have several OR only one is chosen, this is
>> the expected behavior?, if yes i think is needed to add priorities 
>> for license choose, example [2].
>>
>> Comments?
>>
>> Best regards.
>>
>> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=6765
>> [2] https://gist.github.com/kergoth/1590028
> I think license priority is a good idea. Would you be able to set 
> LICENSE_PRIORITY to a different values for specific recipes too?
>
> Regards,
> Jonathan


