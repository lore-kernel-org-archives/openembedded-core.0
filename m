Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QfDiE-00030o-UW
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:15:31 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jul 2011 09:09:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,500,1304319600"; d="scan'208";a="27911063"
Received: from unknown (HELO [10.255.13.187]) ([10.255.13.187])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jul 2011 09:09:33 -0700
Message-ID: <4E172BBD.30709@linux.intel.com>
Date: Fri, 08 Jul 2011 09:09:33 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1309503004.git.sgw@linux.intel.com>	<1b743a32b4fc3ccdea5ebbb94691d6441bdd706a.1309503004.git.sgw@linux.intel.com>
	<A9686B58-013C-4390-B43C-3F06E9EDB02B@dominion.thruhere.net>
In-Reply-To: <A9686B58-013C-4390-B43C-3F06E9EDB02B@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 2/4] uboot: Update to 2011.06
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
X-List-Received-Date: Fri, 08 Jul 2011 16:15:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 07/01/2011 12:16 AM, Koen Kooi wrote:
> 
> Op 1 jul 2011, om 08:54 heeft Saul Wold het volgende geschreven:
> 
>> [YOCTO #1198]
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>> ...Drop-config.h-include-in-tools-imximage.h.patch |    0
>> ...ove-LDSCRIPT-processing-to-the-top-level-.patch |    0
>> ...kimage_2011.03.bb => u-boot-mkimage_2011.06.bb} |   12 +++++-------
>> .../uboot/{u-boot_2011.03.bb => u-boot_2011.06.bb} |   10 +++++-----
> 
> You do realize that people .bbappending 2011.03 are now left out in the cold, right?

My apologies to Saul as I probably contributed to this by not being
explicit in the bug report. As stated in my earlier mail regarding uboot
policy, we should keep at least two revisions of u-boot around to give
people time to migrate to the newer one (if they can at all).

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


