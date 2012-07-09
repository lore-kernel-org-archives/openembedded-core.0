Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoHy1-00074Z-8H
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:41:49 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Jul 2012 10:30:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="169336570"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by orsmga002.jf.intel.com with ESMTP; 09 Jul 2012 10:30:38 -0700
Message-ID: <4FFB153E.1010206@linux.intel.com>
Date: Mon, 09 Jul 2012 10:30:38 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341601764.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1341601764.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/3] Image/SDK multilib fixes
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
X-List-Received-Date: Mon, 09 Jul 2012 17:41:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/06/2012 12:13 PM, Mark Hatle wrote:
> The image generation for RPM needs to be synced with the python fragement in
> the populate_sdk case.  Otherwise the multilib configuations get out of sync.
>
> Similar changes are NOT needed for deb or ipkg.
>
> We also needed to enable multilib remapping when the populate_sdk_base is
> loaded, otherwise we don't get matching package and sdk images.
>
> Finally to avoid conflicts in the SDK generation, we compute the install
> solutions by adding --replacepkgs to the temporary database.  This does
> not change the installed image behavior in any way.
>
> The following changes since commit 8f16811a8d51982a8b3d70e6087aef4a41926840:
>
>    bootimg: Use STAGING_KERNEL_DIR (2012-07-06 09:38:17 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/sdk
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/sdk
>
> Mark Hatle (3):
>    populate_sdk_rpm: Sync multilib configuration with rootfs_rpm
>    multilib: Enable multilib remapping for SDK generation
>    package_rpm: Avoid duplicate package generation failures
>
>   meta/classes/multilib.bbclass         |    6 ++++++
>   meta/classes/package_rpm.bbclass      |   10 +++++-----
>   meta/classes/populate_sdk_rpm.bbclass |   15 ++++++++++-----
>   meta/classes/rootfs_rpm.bbclass       |    1 +
>   4 files changed, 22 insertions(+), 10 deletions(-)
>

Merged into OE-Core with the updated request

Thanks
	Sau!


