Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QbZBF-0007fw-Se
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 16:22:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Jun 2011 07:18:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,437,1304319600"; d="scan'208";a="19746995"
Received: from unknown (HELO [10.255.13.106]) ([10.255.13.106])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2011 07:18:38 -0700
Message-ID: <4E09E2BE.3090203@linux.intel.com>
Date: Tue, 28 Jun 2011 07:18:38 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Ilya Yanok <yanok@emcraft.com>
References: <1308182971-23082-1-git-send-email-yanok@emcraft.com>
	<4E0953FB.508@linux.intel.com> <4E09A570.9070206@emcraft.com>
In-Reply-To: <4E09A570.9070206@emcraft.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-mkimage: bump version to 2011.03
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
X-List-Received-Date: Tue, 28 Jun 2011 14:22:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ilya,

On 06/28/2011 02:57 AM, Ilya Yanok wrote:
> Hi Darren,
> 
> 28.06.2011 8:09, Darren Hart wrote:
>> These look like good changes to me, with a couple of minor things needed:
>>
>> 1) Please submit the version change independently from the added
>>     patches to keep things functionally distinct.
> 
> Hm.. Actually the new version won't build without the patches, so I 
> think this should be addressed by a single commit. Maybe I should add a 
> note on this in the commit message though...

Ah, that is unfortunate :/

> 
>> 2) The patch from you marked as Submitted: has this received any
>>     discussion on the u-boot list?
> 
> Yes, it's already applied (with some cosmetic changes). I will repost my 
> oe-core with the new versions of U-Boot patches. Please let me know if 
> you still think these should be two separate commits.

Please update the upstream status on the new patch and resubmit as a
single patch.

Thanks!

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


