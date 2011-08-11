Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QrZPI-0004Lv-Pb
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 19:51:00 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Aug 2011 10:46:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,357,1309762800"; d="scan'208";a="38334911"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2011 10:46:27 -0700
Message-ID: <4E441573.6090504@linux.intel.com>
Date: Thu, 11 Aug 2011 10:46:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1312788761.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1312788761.git.dongxiao.xu@intel.com>
Subject: Re: [PATCH 0/2][PULL] Multilib: Fix bug 1340
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
X-List-Received-Date: Thu, 11 Aug 2011 17:51:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2011 12:35 AM, Dongxiao Xu wrote:
> Hi Richard,
>
> The following two commits fix the issue that, some normal packages are
> built out when building pure multilib image "lib32-core-image-sato".
>
> Please help to review and pull.
>
> [YOCTO #1340]
>
In the future, please include this Bug Fix ID in the commit message 
itself, not in the Header. This way when someone looks at the actual 
commit log we can find the bug info.

Thanks
	Sau!

> The following changes since commit 7a278238d9b08e0315e92d386282cb488cc0c7b4:
>
>    bitbake.conf/powerpc64: Set baselib to 'lib64' for ppc64 (2011-08-05 17:48:23 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dxu4/ml2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml2
>
> Dongxiao Xu (2):
>    gnome-doc-utils: Avoid RDEPENDS on bash in native case.
>    module-init-tools-cross: Clean the RDEPENDS value
>
>   meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    1 +
>   .../module-init-tools-cross_3.16.bb                |    1 +
>   2 files changed, 2 insertions(+), 0 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


