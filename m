Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TsCFk-0002m0-Qg
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 13:56:34 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Jan 2013 04:41:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,424,1355126400"; d="scan'208";a="242953563"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 07 Jan 2013 04:41:21 -0800
Message-ID: <50EAC270.9030202@intel.com>
Date: Mon, 07 Jan 2013 14:41:20 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <cover.1357366840.git.sgw@linux.intel.com>
	<1357557021.28649.228.camel@ted> <50EAC025.6080402@intel.com>
	<CAF6bG8eF43-U5eqGZ8d5hBFdBCWf4gjVXFuWY5c1NzJ_dvfVZw@mail.gmail.com>
In-Reply-To: <CAF6bG8eF43-U5eqGZ8d5hBFdBCWf4gjVXFuWY5c1NzJ_dvfVZw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (V2) 00/35] Updates, Multilib Patches and other fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 12:56:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/07/2013 02:38 PM, Marko Lindqvist wrote:
> On 7 January 2013 14:31, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
>>
>>
>> On 01/07/2013 01:10 PM, Richard Purdie wrote:
>>> On Fri, 2013-01-04 at 22:22 -0800, Saul Wold wrote:
>>>>
>>>> Laurentiu Palcu (1):
>>>>   pango: have postinstalls run at do_rootfs time
>>>
>>> Merged, apart from harfbuzz, pango, glib and glib-networking changes as
>>> per the feedback on list.
>> I think pango can be merged. The comments on the list are about other
>> packages that ship pango modules, in which case the qemu approach should
>> be used.
> 
>  This was about pango update (to 1.32) to depend on harfbuzz so when
> harfbuzz was dropped, pango update had to be dropped too (it wouldn't
> build)
Sorry for the noise then. I missed the pango update commit line...

Thanks,
Laurentiu
> 
> 
>  - ML
> 


