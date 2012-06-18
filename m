Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SgfJX-0002Lu-75
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 19:00:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jun 2012 09:49:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181667166"
Received: from unknown (HELO [10.255.12.105]) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2012 09:49:48 -0700
Message-ID: <4FDF5C2B.2070407@linux.intel.com>
Date: Mon, 18 Jun 2012 09:49:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1339739522.git.kai.kang@windriver.com>
In-Reply-To: <cover.1339739522.git.kai.kang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/4] Update cleanup-workdir
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
X-List-Received-Date: Mon, 18 Jun 2012 17:00:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2012 10:56 PM, Kang Kai wrote:
> Hi,
>
> This series of patches update the cleanup-workdir:
> 1 update the help text
> 2 update the way to check obsolete directories
> 3 only clean the directories related to current arch
> 4 replace module commands with subprocess
>
> Regards,
> Kai
>
> The following changes since commit 5ed855d12cddf2de535c3f6d05d3dfe85d69d99d:
>
>    openjade-native: Ensure we reautoconf the package (2012-06-12 16:34:30 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/distro
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro
>
> Kang Kai (4):
>    cleanup-workdir: update the way to check obsolete dirs
>    cleanup-workdir: replace commands with subprocess
>    cleanup-workdir: only deal dirs related to current arch
>    cleanup-workdir: update help text
>
>   scripts/cleanup-workdir |  128 ++++++++++++++++++++++++++++++-----------------
>   1 files changed, 82 insertions(+), 46 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


