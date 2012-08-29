Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T6qp6-0005i9-Ry
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 00:33:21 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Aug 2012 15:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,335,1344236400"; d="scan'208";a="186635182"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by azsmga001.ch.intel.com with ESMTP; 29 Aug 2012 15:21:03 -0700
Message-ID: <503E95CF.2090200@linux.intel.com>
Date: Wed, 29 Aug 2012 15:21:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1345963712.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1345963712.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] archiver.bbclass: fixes and clean up
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
X-List-Received-Date: Wed, 29 Aug 2012 22:33:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/25/2012 11:51 PM, Robert Yang wrote:
>
> * Fix the indent and coding style
> * Fix the fakeroot error and other issues
> * remove the "upper()" function
> * copyleft_compliance.bbclass: remove the duplicated code
> * fix the remove error
>
> I have sent a patch to yocto@yoctoproject.org to update the
> local.conf.sample.extended
>
> // Robert
>
> The following changes since commit b4c5725af4cd85d5644f0373e2674e903c4eab2b:
>
>    yocto-bsp: add missing xserver-xf86-config .bbappend for qemu (2012-08-25 14:47:07 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib robert/archiver
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/archiver_sample
>
> Robert Yang (6):
>    archiver.bbclass: indent fixes
>    archiver.bbclass: fix the coding style
>    archiver.bbclass: fix the fakeroot and other issues
>    archiver.bbclass: remove the "upper()" function
>    copyleft_compliance.bbclass: remove the duplicated code
>    archiver.bbclass: fix the remove error
>
>   meta/classes/archive-configured-source.bbclass |   9 +-
>   meta/classes/archive-original-source.bbclass   |   9 +-
>   meta/classes/archive-patched-source.bbclass    |   9 +-
>   meta/classes/archiver.bbclass                  | 884 +++++++++++++------------
>   meta/classes/copyleft_compliance.bbclass       |  51 +-
>   meta/classes/package_rpm.bbclass               |  43 +-
>   6 files changed, 503 insertions(+), 502 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



