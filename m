Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBrIT-0004TQ-Ov
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 20:04:21 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Sep 2012 10:51:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="191943922"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by azsmga001.ch.intel.com with ESMTP; 12 Sep 2012 10:51:28 -0700
Message-ID: <5050CBA0.5060409@linux.intel.com>
Date: Wed, 12 Sep 2012 10:51:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1347247613.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1347247613.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1 V2] package_rpm.bbclass: fix the arch (replace "-" with "_")
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
X-List-Received-Date: Wed, 12 Sep 2012 18:04:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2012 12:58 AM, Robert Yang wrote:
> Changes of V2:
> * Replace "-" with "_" for sat-solver_git.bb
>
> Test info:
> MACHINE = beagleboard/mpc8315e-rdb/qemux86
> PACKAGE_CLASSES = package_rpm
>
> $ bitbake core-image-minimal core-image-sato meta-toolchain \
> 	meta-toolchain-sdk adt-installer meta-ide-support
>
> $ bitbake package-index
>
> $ runqemu qemux86 (when MACHINE=qemux86)
>
> All of them are OK.
>
> Note:
> The nativesdk's arch would be x86_64_nativesdk or i686_nativesdk (it was
> x86_64 or i686 in the past) when use rpm.
>
> // Robert
>
>
> The following changes since commit 5343cdb20ee56a8b507733c637dcc2466ae13288:
>
>    bitbake: fetch2: replace double slashes in paths in encodeurl() (2012-09-07 14:50:04 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib robert/rpmarch
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/rpmarch
>
> Robert Yang (1):
>    package_rpm.bbclass: fix the arch (replace "-" with "_")
>
>   meta/classes/package_rpm.bbclass                   | 10 +++++-----
>   meta/recipes-extended/sat-solver/sat-solver_git.bb |  2 +-
>   2 files changed, 6 insertions(+), 6 deletions(-)
>
I think this needs rebasing, can you resend please.

Sau!



