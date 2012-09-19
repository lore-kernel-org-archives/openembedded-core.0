Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TEONQ-00036M-KC
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 19:47:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Sep 2012 10:35:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,450,1344236400"; d="scan'208";a="194943430"
Received: from unknown (HELO [10.255.13.229]) ([10.255.13.229])
	by orsmga001.jf.intel.com with ESMTP; 19 Sep 2012 10:35:14 -0700
Message-ID: <505A0251.9090602@linux.intel.com>
Date: Wed, 19 Sep 2012 10:35:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1347914898.git.raj.khem@gmail.com>
In-Reply-To: <cover.1347914898.git.raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] eglibc bugfixes for e5500 and systemd
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
X-List-Received-Date: Wed, 19 Sep 2012 17:47:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/17/2012 01:50 PM, Khem Raj wrote:
> This patchset addressed two bugs in eglibc on powerpc one where we would get
> fsqrt intruction emitted into libm code on e5500/64bit and second problem
> where systemd 189+ would not build on powerpc due to missing defines in
> fcntl.h for ppc.
>
> The following changes since commit 7887b99646d8e1e736ad6e4a306e47df9955221e:
>
>    local.conf.sample: change valgrind support architecture comment (2012-09-14 17:05:59 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-fixes
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/eglibc-fixes
>
> Khem Raj (2):
>    eglibc: Fix fcntl.h for powerpc
>    eglibc: Do not use fsqrt in libm when building for fsl ppc with fpu
>
>   ..._handle_at-open_by_handle-etc.-to-PowerPC.patch |   65 ++++++++++++++++++++
>   .../eglibc/eglibc-2.16/fsl-ppc-no-fsqrt.patch      |   44 +++++++++++++
>   meta/recipes-core/eglibc/eglibc_2.16.bb            |    4 +-
>   3 files changed, 112 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/fsl-ppc-no-fsqrt.patch
>

Merged into OE-Core

Thanks
	Sau!



