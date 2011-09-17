Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1R512j-0007dE-Qq
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Sep 2011 21:59:18 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 Sep 2011 12:54:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,398,1312182000"; d="scan'208";a="52765489"
Received: from unknown (HELO envy.home) ([10.255.15.16])
	by fmsmga001.fm.intel.com with ESMTP; 17 Sep 2011 12:54:02 -0700
Message-ID: <4E74FADA.1020608@linux.intel.com>
Date: Sat, 17 Sep 2011 12:54:02 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1316126173.git.dvhart@linux.intel.com>
	<1316176329.20858.1.camel@ted>
In-Reply-To: <1316176329.20858.1.camel@ted>
Subject: Re: [PATCH 0/2] initrd contamination and explict PATH
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
X-List-Received-Date: Sat, 17 Sep 2011 19:59:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/16/2011 05:32 AM, Richard Purdie wrote:
> On Thu, 2011-09-15 at 15:41 -0700, Darren Hart wrote:
>> I ran into a bit of a nasty issue where EXTRA_IMAGE_FEATURES set in my
>> local.conf was causing core-image-initramfs to pull a bunch of files into
>> my initrd, including bash and a 100+MB vmlinux image. The 85M initrd caused
>> some strange initial boot behavior, and bash in the initrd caused our init
>> scripts to fail as bash has a different default PATH than busybox.
>>
>> The following patches address these issues.
>>
>> Live boot tested on 32 bit x86.
>>
>> The following changes since commit bb4a5c44da23a1bb363f1f081cf1644fd7975957:
>>
>>   linux-yocto: remove emenlow from meta-yocto bbappend (2.6.37 version) (2011-09-15 11:27:22 +0100)
>>
>> are available in the git repository at:
>>   git://git.pokylinux.org/poky-contrib dvhart/initrdscripts
>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/initrdscripts
>>
>> Darren Hart (2):
>>   Set an explicit path for the initrd scripts
>>   Prevent IMAGE_FEATURES from contaminating initrd
>>
>>  .../images/core-image-minimal-initramfs.bb         |    3 +++
>>  meta/recipes-core/initrdscripts/files/init-boot.sh |    2 ++
>>  .../initrdscripts/files/init-install.sh            |    2 ++
>>  meta/recipes-core/initrdscripts/files/init-live.sh |    4 +++-
>>  4 files changed, 10 insertions(+), 1 deletions(-)
> 
> Merged to master but I had to add PR bumps for the script PATH changes.
> 
> We shouldn't really be hardcoding the paths but using the expressions
> ${bindir} etc and making substitutions in the scripts too but we can
> leave that issue for another time (they already had other hardcoded
> issues).

ARG... Sorry about missing the PR. As for the ${bindir}, would you
prefer a patch post 1.1 ? Or would you take one for 1.1 by EOD Monday?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


