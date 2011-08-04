Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QozI0-0003W5-JO
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 16:52:48 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Aug 2011 07:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,316,1309762800"; d="scan'208";a="34412401"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 04 Aug 2011 07:48:24 -0700
Message-ID: <4E3AB137.90506@linux.intel.com>
Date: Thu, 04 Aug 2011 07:48:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1312258679.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1312258679.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 0/1] Set version related variables in environment files.
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
X-List-Received-Date: Thu, 04 Aug 2011 14:52:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2011 09:20 PM, Lianhao Lu wrote:
> Fixed bug #1306. Have all the environment files created by meta-toolchain,
> meta-ide-support and meta-envrionment-xxx contain the same version related
> variables.
>
> The following changes since commit 2a41a311ddda11713296391050f3c2c1b2c1d3d3:
>    Koen Kooi (1):
>          arch-armv7a.inc: fix armv7a-vfp-neon ->  armv7a compat case
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib llu/bug1306
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1306
>
> Lianhao Lu (1):
>    environment files: Added and unified version related variables.
>
>   meta/classes/toolchain-scripts.bbclass     |    3 +++
>   meta/recipes-core/meta/meta-environment.bb |    2 +-
>   meta/recipes-core/meta/meta-ide-support.bb |    2 +-
>   meta/recipes-core/meta/meta-toolchain.bb   |    2 +-
>   4 files changed, 6 insertions(+), 3 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged into OE-Core

Thanks
	Sau!


