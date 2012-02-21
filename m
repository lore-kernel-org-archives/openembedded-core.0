Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RzvAt-0002xF-Vp
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 20:14:56 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Feb 2012 11:06:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119774344"
Received: from unknown (HELO [10.255.15.72]) ([10.255.15.72])
	by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2012 11:06:36 -0800
Message-ID: <4F43EB3B.9000602@linux.intel.com>
Date: Tue, 21 Feb 2012 11:06:35 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1329185046.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1329185046.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 0/1] eds-tools: Update it to fix the build error
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
X-List-Received-Date: Tue, 21 Feb 2012 19:14:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/13/2012 11:56 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan<wenzong.fan@windriver.com>
>
> Get the latest updates to eds-tools for fixing the build error:
> * libedataserver/e-data-server-module.h: No such file or directory
>
> Also update its recipe file to reflect it has been converted to git
> repo and splict the generated binaries to correct packages.
>
> [yocto#1786]
>
> The following changes since commit 41a83ccfe50ec69425a4828fb5836d38d3f99e67:
>    Lianhao Lu (1):
>          guile: fix cross configure failure
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/1786
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/1786
>
> Wenzong Fan (1):
>    eds-tools: Update it to fix the build error
>
>   .../conf/distro/include/distro_tracking_fields.inc |    4 ++--
>   meta/recipes-sato/eds/eds-tools_git.bb             |    8 +++++---
>   2 files changed, 7 insertions(+), 5 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-core

Thanks
	Sau!


