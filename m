Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMP0z-0002ss-2Y
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 20:29:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 May 2011 11:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,226,1304319600"; 
   d="scan'208";a="2919448"
Received: from unknown (HELO [10.255.12.160]) ([10.255.12.160])
	by fmsmga002.fm.intel.com with ESMTP; 17 May 2011 11:26:10 -0700
Message-ID: <4DD2BDC2.4000401@linux.intel.com>
Date: Tue, 17 May 2011 11:26:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305564106.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1305564106.git.bruce.ashfield@windriver.com>
Subject: Re: [PATCH 0/1] linux-yocto: branch manipulation changes
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
X-List-Received-Date: Tue, 17 May 2011 18:29:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2011 09:52 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Recently a few alternate workflow/use cases have been
> looked at recently. While they aren't existing cases, or
> ones that were previously supported, they are reasonable
> so I've tweaked the tools and processing to support them.
>
> The first change is to allow AUTOREV processing to skip
> branch validation (since it doesn't make sense). The second
> change allows a repository with only a single BSP branch
> and a meta directory to be present .. and the tools can
> reconstruct what they need to validate and build the
> kernel.
>
> Tested against the new use cases, and existing ones, all
> performed properly.
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: zedd/kernel
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Thanks,
>      Bruce Ashfield<bruce.ashfield@windriver.com>
> ---
>
>
> Bruce Ashfield (1):
>    linux-yocto: detect and avoid branch revision checking for AUTOREV
>
>   meta/classes/kernel-yocto.bbclass                  |    7 +++++++
>   .../kern-tools/kern-tools-native_git.bb            |    2 +-
>   2 files changed, 8 insertions(+), 1 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged into oe-core and poky

Thanks
	Sau!



