Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T3qyM-0000A1-QT
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 18:06:31 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Aug 2012 08:54:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,802,1336374000"; d="scan'208";a="207609948"
Received: from unknown (HELO [10.255.13.49]) ([10.255.13.49])
	by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2012 08:54:25 -0700
Message-ID: <5033AF31.8010501@linux.intel.com>
Date: Tue, 21 Aug 2012 08:54:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1345519167.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1345519167.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] package_rpm.bbclass: fix and enhance the incremental rpm generation
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
X-List-Received-Date: Tue, 21 Aug 2012 16:06:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2012 11:48 PM, Robert Yang wrote:
> * Test info:
> $ bitbake core-image-sato core-image-sato-sdk meta-toolchain meta-toolchain-sdk
> $ bitbake package-index
>
> Tested the incremental rpm generation based on core-image-minimal and
> core-image-sato
>
> * Note: it doesn't have any conflict with the "Install external binary packages"
>    patches which are in Patch Review.
>
> // Robert
>
> The following changes since commit 7c40daab587306da25c8d8f566392ee1f57bbef4:
>
>    qemu: Fix broken accidental path move (2012-08-20 17:25:28 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/inc_rpm
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/inc_rpm
>
> Robert Yang (1):
>    package_rpm.bbclass: fix and enhance the incremental rpm generation
>
>   meta/classes/package_rpm.bbclass |   68 ++++++++++++++++++++++++--------------
>   1 files changed, 43 insertions(+), 25 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!


>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


