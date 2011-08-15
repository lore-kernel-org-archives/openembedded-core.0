Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke@linux.intel.com>) id 1QswZZ-0007Nu-6d
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 14:47:17 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Aug 2011 05:41:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,374,1309762800"; d="scan'208";a="41563444"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2011 05:41:36 -0700
Received: from [10.255.24.155] (kyu3-mobl3.ccr.corp.intel.com [10.255.24.155])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id B37586A4087;
	Mon, 15 Aug 2011 05:41:33 -0700 (PDT)
Message-ID: <4E4913FC.5070108@linux.intel.com>
Date: Mon, 15 Aug 2011 20:41:32 +0800
From: Yu Ke <ke@linux.intel.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313328487.git.ke.yu@intel.com>
	<fdc4b5810c9adedea19d41a7856612201615e99c.1313328487.git.ke.yu@intel.com>
	<4E47E757.9000408@gmail.com>
In-Reply-To: <4E47E757.9000408@gmail.com>
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
X-List-Received-Date: Mon, 15 Aug 2011 12:47:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011/8/14 23:18, Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 08/14/2011 06:32 AM, Yu Ke wrote:
>> current gcc-cross-intermediate has build failure in qemux86-64 lib64
>> multilib case. the reason is that it still use lib instead of lib64
>> while do_install use the libdir i.e. lib64
>>
>> so this patch fix this issue by making gcc honour the libdir.
>
> I think similar patch should be done to ppc and mips as well.

According to Kumar, current ppc works just fine in multilib 64bit case. 
so ppc may not need this kind of patch. I am not sure how is mips. Since 
i am not familar with mips, i'd like to leave it to other mips expert.

Regards
Ke


