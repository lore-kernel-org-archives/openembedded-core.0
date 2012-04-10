Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHdFM-0006rh-BV
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 17:44:44 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Apr 2012 08:35:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="151964662"
Received: from unknown (HELO [10.255.12.159]) ([10.255.12.159])
	by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2012 08:35:25 -0700
Message-ID: <4F84533D.9090401@linux.intel.com>
Date: Tue, 10 Apr 2012 08:35:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333966697.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1333966697.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] meta-toolchain: runqemu falied on FC16/Opensuse12.1 x86_64
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
X-List-Received-Date: Tue, 10 Apr 2012 15:44:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2012 03:22 AM, Robert Yang wrote:
> Test info:
> * Have tested on:
>    * Fedora 16 x86_64
>    * Opensuse 12.1 x86_64
>    * Ubuntu 10.04
>
> * The testing commands are:
>    $ bitbake core-image-sato meta-toolchain meta-toolchain-sdk
>
>    And untar the sdk, then runqemu from the sdk to start the target.
>
> // Robert
>
> The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:
>
>    runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:15 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/tc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/tc
>
> Robert Yang (1):
>    meta-toolchain: runqemu falied on FC16/Opensuse12.1 x86_64
>
>   meta/conf/distro/include/tcmode-default.inc |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
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


