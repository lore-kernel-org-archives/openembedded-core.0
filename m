Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SSGRj-0001Iy-VP
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 01:37:28 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 May 2012 16:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141122968"
Received: from unknown (HELO [10.255.12.218]) ([10.255.12.218])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2012 16:27:32 -0700
Message-ID: <4FAAFD64.10607@linux.intel.com>
Date: Wed, 09 May 2012 16:27:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1336541197.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1336541197.git.dongxiao.xu@intel.com>
Subject: Re: [PATCH 0/1][1.2.1][PULL] Multilib bug fix
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
X-List-Received-Date: Wed, 09 May 2012 23:37:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2012 10:28 PM, Dongxiao Xu wrote:
> Hi Richard and Scott,
>
> This pull request is to fix some multilib issues in libc-package.bbclass. Please help to review and pull.
>
> This is both for upstream and 1.2.1 branch.
>
> Thanks,
> Dongxiao
>
> The following changes since commit 043871d7e5d2d19c2ff43e54d2ff180c09e8903e:
>
>    kern-tools: integrate minor fixes (2012-05-08 16:06:15 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dxu4/multilib
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/multilib
>
> Dongxiao Xu (1):
>    libc-package.bbclass: Add MLPREFIX while dynamically set RDEPENDS
>
>   meta/classes/libc-package.bbclass          |   12 +++++++-----
>   meta/recipes-core/eglibc/eglibc-locale.inc |    2 +-
>   2 files changed, 8 insertions(+), 6 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!


