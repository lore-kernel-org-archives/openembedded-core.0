Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt12X-00010n-GC
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 19:05:45 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2012 09:57:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="103207888"
Received: from unknown (HELO [10.255.14.238]) ([10.255.14.238])
	by orsmga001.jf.intel.com with ESMTP; 02 Feb 2012 09:57:47 -0800
Message-ID: <4F2ACE9B.8030103@linux.intel.com>
Date: Thu, 02 Feb 2012 09:57:47 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1327977970.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1327977970.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/1] e2fsprogs streamlining
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
X-List-Received-Date: Thu, 02 Feb 2012 18:05:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2012 06:47 PM, Scott Garman wrote:
> Hello,
>
> Koen Kooi suggested that the quotefix patch was not needed,
> and the build of the recipe should now be multithread-safe.
> My testing has confirmed this.
>
> The following changes since commit d7b13cd42ab8d5f44f97e119b73ec2e363677d26:
>
>    useradd.bbclass: Fix missing quote (2012-01-27 23:57:33 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/e2fsprogs-final
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/e2fsprogs-final
>
> Scott Garman (1):
>    e2fsprogs: remove unneeded patch and re-enable PARALLEL_MAKE
>
>   .../e2fsprogs/e2fsprogs-1.42/quotefix.patch        |   44 --------------------
>   meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb  |    5 +--
>   2 files changed, 1 insertions(+), 48 deletions(-)
>   delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/quotefix.patch
>
Merged into OE-core

Thanks
	Sau!


