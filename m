Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QgWyT-00083h-84
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 09:01:41 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jul 2011 23:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,519,1304319600"; d="scan'208";a="29233692"
Received: from unknown (HELO [10.255.13.180]) ([10.255.13.180])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2011 23:57:42 -0700
Message-ID: <4E1BF066.6030801@linux.intel.com>
Date: Mon, 11 Jul 2011 23:57:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1310090994.git.dongxiao.xu@intel.com>	<1310139923.20015.899.camel@rex>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D6D85432@shsmsx501.ccr.corp.intel.com>
In-Reply-To: <D5AB6E638E5A3E4B8F4406B113A5A19A12D6D85432@shsmsx501.ccr.corp.intel.com>
Subject: Re: [PATCH 0/2][PULL] alsa-tools: Fix recipe build error
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
X-List-Received-Date: Tue, 12 Jul 2011 07:01:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2011 10:24 PM, Xu, Dongxiao wrote:
> Hi Richard,
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Richard Purdie
>> Sent: Friday, July 08, 2011 11:45 PM
>> To: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCH 0/2][PULL] alsa-tools: Fix recipe build error
>>
>> On Fri, 2011-07-08 at 10:11 +0800, Dongxiao Xu wrote:
>>> Hi Saul,
>>>
>>> This pull request fixes the alsa-tools recipe build error.
>>> Please help to review and pull.
>>>
>>> [YOCTO #1038]
>>>
>>> Thanks,
>>> Dongxiao
>>>
>>> The following changes since commit
>> 2c79c9eb7ef8ef0aef8c3096c3c4387e28e56ea2:
>>>
>>>    pulseaudio: add 0.9.23 (2011-07-07 13:45:32 +0100)
>>>
>>> are available in the git repository at:
>>>    git://git.pokylinux.org/poky-contrib dxu4/alsa-tools
>>>
>>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/alsa-tools
>>>
>>> Dongxiao Xu (2):
>>>    fltk: add this recipe for alsa-tools build
>>>    alsa-tools: Fix recipe build error.
>>
>> I'd like to understand whether we need gtk and fltk tools from alsa-tools at this
>> point in time?
>>
>> Could we just disable those?
>
> I added those dependencies in since alsa-tools is not in our reference images (sato, sato-sdk, etc.), and it may not impact our daily builds.
>
> Actually alsa-tools is a set of subprojects, we can disable certain sub-projects in alsa-tools to avoid including gtk and fltk.
>
Which subprojects would you need to disable, there are others that use 
alsa-tools which is why it's in core.

Sau!

> Thanks,
> Dongxiao
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


