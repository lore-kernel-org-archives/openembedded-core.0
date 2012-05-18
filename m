Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SVVEL-0006yC-Ej
	for openembedded-core@lists.openembedded.org;
	Sat, 19 May 2012 00:01:01 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 May 2012 14:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="168284144"
Received: from unknown (HELO envy.home) ([10.255.13.126])
	by fmsmga002.fm.intel.com with ESMTP; 18 May 2012 14:50:53 -0700
Message-ID: <4FB6C40D.7080504@linux.intel.com>
Date: Fri, 18 May 2012 14:50:05 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337131523-8176-1-git-send-email-kergoth@gmail.com>
	<4FB50F47.6060207@linux.intel.com>
	<4A22156E-2396-413C-A621-E947330B22D1@dominion.thruhere.net>
In-Reply-To: <4A22156E-2396-413C-A621-E947330B22D1@dominion.thruhere.net>
X-Enigmail-Version: 1.4.1
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] kernel.bbclass: add deploy link to KERNEL_IMAGETYPE
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
X-List-Received-Date: Fri, 18 May 2012 22:01:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/17/2012 07:58 AM, Koen Kooi wrote:
> 
> Op 17 mei 2012, om 16:46 heeft Darren Hart het volgende geschreven:
> 
>> On 05/15/2012 06:25 PM, Christopher Larson wrote:
>>> From: Christopher Larson <chris_larson@mentor.com>
>>> 
>>> It's common to provide a non-machine-suffixed link in
>>> DEPLOY_DIR_IMAGE, so let's be consistent and do so here as well.
>> 
>> This of course means that building two machines in the same build
>> dir will result in overwriting the latest non-machine-suffixed
>> link (provided they are the same image type)
> 
> Actually it doesn't. At least not on angstrom, shr and slugos:
> 
> koen@dominion:/OE/tentacle/sources/meta-angstrom$ git grep
> DEPLOY_DIR_IMAGE conf/distro/include/angstrom.inc:DEPLOY_DIR_IMAGE =
> "${DEPLOY_DIR}/images/${MACHINE}"

That seems like a good idea to me. It would make more sense to me for
that to be the default. Having a DISTRO define BUILD policy seems a bit
backwards.

Would anyone object to including ${MACHINE} in the deploy dir by default?

> 
> The above was mentioned a few weeks ago, but it looks like no one but
> the distros above and Chris care about proper multimachine builds. 

Awe, you were doing so well up until there.

--
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


