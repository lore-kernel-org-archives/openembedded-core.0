Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke@linux.intel.com>) id 1Qsy9z-0001jm-LX
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 16:28:59 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Aug 2011 07:24:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="38562065"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 15 Aug 2011 07:24:22 -0700
Received: from [10.255.27.100] (kyu3-mobl3.ccr.corp.intel.com [10.255.27.100])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 412E26A4087;
	Mon, 15 Aug 2011 07:24:18 -0700 (PDT)
Message-ID: <4E492C11.5040800@linux.intel.com>
Date: Mon, 15 Aug 2011 22:24:17 +0800
From: Yu Ke <ke@linux.intel.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313328487.git.ke.yu@intel.com>
	<fdc4b5810c9adedea19d41a7856612201615e99c.1313328487.git.ke.yu@intel.com>
	<73BE3575-4FA5-4C20-9476-A36B9A5422D7@dominion.thruhere.net>
	<4E491589.3030000@linux.intel.com> <1313414185.14274.576.camel@rex>
In-Reply-To: <1313414185.14274.576.camel@rex>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] gcc-cross-intermediate: revise the 64bithack.patch for multilib case
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
X-List-Received-Date: Mon, 15 Aug 2011 14:28:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011/8/15 21:16, Richard Purdie wrote:
> On Mon, 2011-08-15 at 20:48 +0800, Yu Ke wrote:
>> On 2011/8/15 1:31, Koen Kooi wrote:
>>>
>>> Op 14 aug. 2011, om 15:32 heeft Yu Ke het volgende geschreven:
>>>
>>>> current gcc-cross-intermediate has build failure in qemux86-64 lib64
>>>> multilib case. the reason is that it still use lib instead of lib64
>>>> while do_install use the libdir i.e. lib64
>>>>
>>>> so this patch fix this issue by making gcc honour the libdir.
>>>>
>>>> CC: Kumar Gala<galak@kernel.crashing.org>
>>>> CC: Richard Purdie<richard.purdie@linuxfoundation.org>
>>>>
>>>> Signed-off-by: Yu Ke<ke.yu@intel.com>
>>>> ---
>>>> meta/recipes-devtools/gcc/gcc-4.6.inc             |    2 +-
>>>> meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch |   16 +++++++++-------
>>>
>>> wouldn't gcc 4.5 need a similar change?
>>
>> yes, gcc 4.5 should also has this change. I will sent out another patch
>> for this.
>
> Please take a look at:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/ml4&id=4de8e0e9c286ff64f1b7fd2e695fe2d62fdadfbd

Thanks. it is more comprehensive. just a small issue, the parentheses 
looks mismatching in

++MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir) ../$(shell 
basename $(base_libdir)

>
> I've updated the patch header and ensured that whichever compiler
> options are used, the compiler works as expected and also applied this
> to mips and pcc.
>
> Could you also please open a bug about target gcc multilib as mentioned
> in the patch header (targeted at post 1.1).

done. http://bugzilla.yoctoproject.org/show_bug.cgi?id=1369

>
>> just curious question, what is gcc 4.5 for, since gcc 4.6 is already there?
>
> Some people are still using gcc 4.5 for various reasons. It is getting
> to the point we should probably move that to meta-oe though?
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



