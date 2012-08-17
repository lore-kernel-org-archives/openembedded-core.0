Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2TvY-0000ar-GE
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 23:17:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Aug 2012 14:05:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="182138611"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by orsmga001.jf.intel.com with ESMTP; 17 Aug 2012 14:05:56 -0700
Message-ID: <502EB234.6090903@linux.intel.com>
Date: Fri, 17 Aug 2012 14:05:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1344929471.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1344929471.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/2] apt-native and rootfs_deb fixes
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
X-List-Received-Date: Fri, 17 Aug 2012 21:17:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2012 02:41 AM, Robert Yang wrote:
> * Remove an extra line from apt.conf
> * Fix the race issue and populate_sdk_deb
>
> Test info:
> $ bitbake core-image-sato meta-toolchain-sdk core-image-sato-sdk
>
> The build is OK, it would fail by strange errors without these
> 2 patches.
>
> // Robert
>
> The following changes since commit d45bbc5c75a8f277fc1185a5f28847116eec376d:
>
>    createrepo: add wrapper script to fix paths (2012-08-13 20:10:34 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/deblock
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/deblock
>
> Robert Yang (2):
>    apt-native 0.7.14: remove an extra line from apt.conf
>    rootfs_deb: move the lock from WORKDIR  to DEPLOY_DIR_DEB
>
>   meta/classes/populate_sdk_deb.bbclass          |    3 ++-
>   meta/classes/rootfs_deb.bbclass                |    2 +-
>   meta/recipes-devtools/apt/apt-native_0.7.14.bb |    2 +-
>   meta/recipes-devtools/apt/files/apt.conf       |    1 -
>   4 files changed, 4 insertions(+), 4 deletions(-)
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


