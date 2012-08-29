Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T6qnw-0005bF-0k
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 00:32:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Aug 2012 15:19:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,335,1344236400"; d="scan'208";a="186634675"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by azsmga001.ch.intel.com with ESMTP; 29 Aug 2012 15:19:27 -0700
Message-ID: <503E956E.8020506@linux.intel.com>
Date: Wed, 29 Aug 2012 15:19:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: tom.zanussi@intel.com
References: <cover.1345935181.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1345935181.git.tom.zanussi@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] add flex/bison to perf DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2012 22:32:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/25/2012 03:57 PM, tom.zanussi@intel.com wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
>
> To potentially fix a build problem seen on the yocto autobuilder.
>
> I'm not able to reproduce the problem myself without this patch,
> but it looks like these dependencies should be added regardless.
>
> The following changes since commit b4c5725af4cd85d5644f0373e2674e903c4eab2b:
>
>    yocto-bsp: add missing xserver-xf86-config .bbappend for qemu (2012-08-25 14:47:07 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib.git tzanussi/perf-bison-flex-depends
>    http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/perf-bison-flex-depends
>
> Tom Zanussi (1):
>    perf: add bison and flex to DEPENDS
>
>   meta/recipes-kernel/perf/perf_3.4.bb |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



