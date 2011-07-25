Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlNLM-0005ec-H3
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 17:45:20 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 Jul 2011 08:41:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,262,1309762800"; d="scan'208";a="31185607"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2011 08:41:07 -0700
Message-ID: <4E2D8E93.6030302@linux.intel.com>
Date: Mon, 25 Jul 2011 08:41:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311558123.git.lei.mei@intel.com>
In-Reply-To: <cover.1311558123.git.lei.mei@intel.com>
Subject: Re: [PATCH 0/1]perl-dynloader.patch: Fix libdir issue for multilib
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
X-List-Received-Date: Mon, 25 Jul 2011 15:45:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/24/2011 07:13 PM, Mei Lei wrote:
> Hi Richard,
> 	This patch fixes the libdir issue, relax the regular expression to match lib32, lib64 and libx32, etc. Please review it.
>
> Thanks
> Lei
>
> The following changes since commit eea4bd731ef286516ee1fb934fe2222a09c06e70:
>    Kumar Gala (1):
>          mpc8315e-rdb: Set TARGET_FPU correct
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib lmei3/ml-perl
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/ml-perl
>
> Mei Lei (1):
>    perl-dynloader.patch: Fix multilib issue for perl
>
>   .../perl/perl-5.12.3/perl-dynloader.patch          |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
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


