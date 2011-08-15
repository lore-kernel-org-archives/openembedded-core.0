Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke@linux.intel.com>) id 1QswgC-0007cu-H7
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 14:54:08 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Aug 2011 05:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="37874661"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 15 Aug 2011 05:48:26 -0700
Received: from [10.255.24.155] (kyu3-mobl3.ccr.corp.intel.com [10.255.24.155])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 544B66A4087;
	Mon, 15 Aug 2011 05:48:19 -0700 (PDT)
Message-ID: <4E491589.3030000@linux.intel.com>
Date: Mon, 15 Aug 2011 20:48:09 +0800
From: Yu Ke <ke@linux.intel.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313328487.git.ke.yu@intel.com>
	<fdc4b5810c9adedea19d41a7856612201615e99c.1313328487.git.ke.yu@intel.com>
	<73BE3575-4FA5-4C20-9476-A36B9A5422D7@dominion.thruhere.net>
In-Reply-To: <73BE3575-4FA5-4C20-9476-A36B9A5422D7@dominion.thruhere.net>
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
X-List-Received-Date: Mon, 15 Aug 2011 12:54:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011/8/15 1:31, Koen Kooi wrote:
>
> Op 14 aug. 2011, om 15:32 heeft Yu Ke het volgende geschreven:
>
>> current gcc-cross-intermediate has build failure in qemux86-64 lib64
>> multilib case. the reason is that it still use lib instead of lib64
>> while do_install use the libdir i.e. lib64
>>
>> so this patch fix this issue by making gcc honour the libdir.
>>
>> CC: Kumar Gala<galak@kernel.crashing.org>
>> CC: Richard Purdie<richard.purdie@linuxfoundation.org>
>>
>> Signed-off-by: Yu Ke<ke.yu@intel.com>
>> ---
>> meta/recipes-devtools/gcc/gcc-4.6.inc             |    2 +-
>> meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch |   16 +++++++++-------
>
> wouldn't gcc 4.5 need a similar change?

yes, gcc 4.5 should also has this change. I will sent out another patch 
for this.

just curious question, what is gcc 4.5 for, since gcc 4.6 is already there?

Regards
Ke


