Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXFud-000159-8u
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 20:03:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2012 10:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156256329"
Received: from unknown (HELO [10.252.120.171]) ([10.252.120.171])
	by fmsmga001.fm.intel.com with ESMTP; 23 May 2012 10:52:22 -0700
Message-ID: <4FBD23D5.6050103@intel.com>
Date: Wed, 23 May 2012 20:52:21 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
	<3B64436D-65E8-4090-99D7-91B3D4FFC42D@dominion.thruhere.net>
In-Reply-To: <3B64436D-65E8-4090-99D7-91B3D4FFC42D@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 00/19] Package updates
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
X-List-Received-Date: Wed, 23 May 2012 18:03:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


On 05/23/2012 05:05 PM, Koen Kooi wrote:
> 
> Op 23 mei 2012, om 15:10 heeft Laurentiu Palcu het volgende geschreven:
> 
>> The updates in this patchset are mainly related to graphics functionality area.
> 
> How were those tested?
Basic functionality tests on x86 only. For some reason, one could be
that I'm quite new to this project :), I missed testing on other
architectures... Once I fix the commit issue below and repeat my tests
for mips/ppc/arm, I'll resend.

> 
>> The following changes since commit 33c4bf2096effc850720009564e3d1adbda24452:
>>
>>  fetch2: Also exclude urls containing wildcards from checksumming for now (2012-05-22 12:18:53 +0100)
> 
> That commit doesn't exist in oe-core
It looks like I based my patches against poky/master. :( Sorry for that.
I will fetch oe-core/master, rebase and resend.
> 
>> are available in the git repository at:
>>
>>  git://git.yoctoproject.org/poky-contrib lpalcu/updates
>>  http://git.yoctoproject.org/cgit.cgi//log/?h=lpalcu/updates
> 
> And that branch fails to merge into oe-core
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


