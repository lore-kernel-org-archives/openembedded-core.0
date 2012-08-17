Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2Tya-0000kb-5E
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 23:21:05 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Aug 2012 14:09:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="182139428"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by orsmga001.jf.intel.com with ESMTP; 17 Aug 2012 14:09:04 -0700
Message-ID: <502EB2EF.8040007@linux.intel.com>
Date: Fri, 17 Aug 2012 14:09:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344948628-15705-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1344948628-15705-1-git-send-email-constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: Re: [PATCH 0/3] Package upgrades
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
X-List-Received-Date: Fri, 17 Aug 2012 21:21:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2012 05:50 AM, Constantin Musca wrote:
> This is another set of package upgrades compiled on all architectures
> and tested using core-image-sato-sdk. Beware that the libxrandr package upgrade
> must be applied after applying the randrproto package upgrade.
>
> Constantin Musca (3):
>    pciutils: upgrade to 3.1.10
Merged into OE-Core

>    randrproto: upgrade to 1.4.0
>    libxrandr: upgrade to 1.4.0
>
These 2 need commit message updates explaining what changed in their 
license files.  It could be as simple as saying the Year changed, but we 
need to know.

Thanks
	Sau!


>   .../configure.patch                                |    0
>   .../guess-fix.patch                                |    0
>   .../lib-build-fix.patch                            |    0
>   .../makefile.patch                                 |    0
>   .../pcimodules-pciutils.diff                       |    0
>   .../{pciutils_3.1.9.bb => pciutils_3.1.10.bb}      |    4 ++--
>   .../{libxrandr_1.3.2.bb => libxrandr_1.4.0.bb}     |    6 +++---
>   .../{randrproto_1.3.2.bb => randrproto_1.4.0.bb}   |    8 ++++----
>   8 files changed, 9 insertions(+), 9 deletions(-)
>   rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/configure.patch (100%)
>   rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/guess-fix.patch (100%)
>   rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/lib-build-fix.patch (100%)
>   rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/makefile.patch (100%)
>   rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/pcimodules-pciutils.diff (100%)
>   rename meta/recipes-bsp/pciutils/{pciutils_3.1.9.bb => pciutils_3.1.10.bb} (92%)
>   rename meta/recipes-graphics/xorg-lib/{libxrandr_1.3.2.bb => libxrandr_1.4.0.bb} (72%)
>   rename meta/recipes-graphics/xorg-proto/{randrproto_1.3.2.bb => randrproto_1.4.0.bb} (68%)
>


