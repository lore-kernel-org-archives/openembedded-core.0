Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPIOZ-0000YV-34
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 20:01:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 May 2011 10:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,268,1304319600"; 
   d="scan'208";a="1594400"
Received: from unknown (HELO [10.255.12.181]) ([10.255.12.181])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 10:58:18 -0700
Message-ID: <4DDD433F.4090009@linux.intel.com>
Date: Wed, 25 May 2011 10:58:23 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1306276122.git.dvhart@linux.intel.com>
	<4DDCA269.1030006@linux.intel.com>
In-Reply-To: <4DDCA269.1030006@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] oe-setup-builddir: remove unreachable code, update comments
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
X-List-Received-Date: Wed, 25 May 2011 18:01:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/24/2011 11:32 PM, Saul Wold wrote:
> On 05/24/2011 03:31 PM, Darren Hart wrote:
>> From: Darren Hart<dvhart@linux.intel.com>
>>
>> The following changes since commit 32a4e746273c3c7d3dd0f13b745bc0679cadaa44:
>>
>>    codeparser.py: fix syntax error in exception handling (2011-05-24 17:16:47 +0100)
>>
>> are available in the git repository at:
>>    git://git.pokylinux.org/poky-contrib.git dvhart/build
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/build
>>
>> Darren Hart (1):
>>    oe-setup-builddir: remove unreachable code, update comments
>>
>>   scripts/create-pull-request |    2 +-
>>   scripts/oe-setup-builddir   |   32 +++++++++++++-------------------
>>   2 files changed, 14 insertions(+), 20 deletions(-)
>>
>>
> If this is intended for oe-core, please rebase to oe-core and resend, I 
> had a merge issue and want to make sure I am getting the right code 
> committed.


Gah, right. I saw the oe- in the script name and just had oe-core in my
head. Apologies. The two scripts are slightly different in the two
repositories, but both suffer from the same unreachable code problem.

Would you prefer I send two patches, one for each repository, or that I
push to one or the other and let you handle the merge process as part of
the regular sync up process (whatever that is).

Before I do that - are people in agreement with the approach? ie Should
I be removing the unreachable code or should I instead making it usable
again, reestablishing the functionality of OELOCALCONF and OELAYERSCONF?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


