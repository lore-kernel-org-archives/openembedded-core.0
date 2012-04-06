Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFzmN-00079J-7D
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 05:24:03 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Apr 2012 20:14:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125862122"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga001.jf.intel.com with ESMTP; 05 Apr 2012 20:14:49 -0700
Message-ID: <4F7E5FA9.2010402@linux.intel.com>
Date: Thu, 05 Apr 2012 20:14:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333626413.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1333626413.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 0/2] Some multilib fixings
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
X-List-Received-Date: Fri, 06 Apr 2012 03:24:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/05/2012 04:49 AM, Lianhao Lu wrote:
> This is some multilib fixings for Yocto bug #2216.
>
> The following changes since commit 3e4562500956550dbae5467a5fe9289f1d32f775:
>    Saul Wold (1):
>          self-hosted-image: Increase space for build and allow builder user sudo access
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib llu/multilib
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/multilib
>
> Lianhao Lu (2):
>    package_ipk.bbclass: fixing muttilib prefix extracting.
>    connman: Fixed multilib support.
>
>   meta/classes/package_ipk.bbclass                  |    4 ++--
>   meta/recipes-connectivity/connman/connman.inc     |    3 ++-
>   meta/recipes-connectivity/connman/connman_0.79.bb |    1 +
>   3 files changed, 5 insertions(+), 3 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core with tweak to remove the ofono DEPENDS

Sau!


