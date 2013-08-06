Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 32367612D1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 17:42:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 06 Aug 2013 10:41:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,827,1367996400"; d="scan'208";a="377063227"
Received: from unknown (HELO [10.255.14.23]) ([10.255.14.23])
	by fmsmga001.fm.intel.com with ESMTP; 06 Aug 2013 10:41:43 -0700
Message-ID: <52013556.8080701@linux.intel.com>
Date: Tue, 06 Aug 2013 10:41:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <cover.1375787843.git.ross.burton@intel.com>
In-Reply-To: <cover.1375787843.git.ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Enable out-of-tree builds for Mesa
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Aug 2013 17:42:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2013 04:18 AM, Ross Burton wrote:
> Hi,
>
> Attached is a two-patch series to enable out-of-tree build for Mesa.
>
> Ross
>
> The following changes since commit 4cff3defb545643132b7233fcffb3fedc1bf182b:
>
>    grep: Add patch for texinfo 5.1 (2013-08-03 10:33:14 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ross/mesa
>
> for you to fetch changes up to 653b8f2da86101031731b208b84a4ca4f91b5074:
>
>    seperatebuilddir: mesa now builds out of tree (2013-08-06 12:16:55 +0100)
>
> ----------------------------------------------------------------
> Ross Burton (2):
>        mesa: fix out-of-tree builds when Gallium is enabled
>        seperatebuilddir: mesa now builds out of tree
>
>   meta/conf/distro/include/seperatebuilddir.inc      |    2 +-
>   .../mesa/0005-fix-out-of-tree-builds-gallium.patch |   42 ++++++++++++++++++++
>   meta/recipes-graphics/mesa/mesa_9.1.5.bb           |    1 +
>   meta/recipes-graphics/mesa/mesa_git.bb             |    1 +
>   4 files changed, 45 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
>

This needs to be rebased for the mesa 9.1.6 Update.

Thanks
	Sau!


> Ross Burton (2):
>    mesa: fix out-of-tree builds when Gallium is enabled
>    seperatebuilddir: mesa now builds out of tree
>
>   meta/conf/distro/include/seperatebuilddir.inc      |    2 +-
>   .../mesa/0005-fix-out-of-tree-builds-gallium.patch |   42 ++++++++++++++++++++
>   meta/recipes-graphics/mesa/mesa_9.1.5.bb           |    1 +
>   meta/recipes-graphics/mesa/mesa_git.bb             |    1 +
>   4 files changed, 45 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
>

