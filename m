Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4A70375D53
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 15:24:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 07 Jul 2015 08:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,424,1432623600"; d="scan'208";a="757632569"
Received: from tl-wr841n.zpn.intel.com (HELO [10.219.4.159]) ([10.219.4.159])
	by fmsmga002.fm.intel.com with ESMTP; 07 Jul 2015 08:24:04 -0700
Message-ID: <559BEF37.4040300@linux.intel.com>
Date: Tue, 07 Jul 2015 10:24:39 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1434522878.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1434522878.git.leonardo.sandoval.gonzalez@linux.intel.com>
Cc: matt.fleming@intel.com, ricardo.neri@intel.com
Subject: Re: [PATCH 0/2] Add UEFI firmware for qemux86*
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
X-List-Received-Date: Tue, 07 Jul 2015 15:24:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 06/17/2015 01:43 AM, leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> These two patches include:
>
>      1. Recipe: Including the OVMF recipe (taken from luv-yocto repository) on Poky
>      2. Boot script: Instrumenting runqemu to include OECORE_MACHINE_SYSROOT,
>      so the OVMF BIOS can be found.
>
> [YOCTO #5654]
>
> The following changes since commit 062678c4ab88fa94ed38efa6520c3b4e2d88ca73:
>
>    sysvinit: Only enable recipe in builds where its applicable (2015-06-10 12:03:19 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib lsandov1/efi-qemux86
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/efi-qemux86
>
> Leonardo Sandoval (2):
>    ovmf: Recipe taken from luv-yocto repository
>    runqemu: Define OECORE_MACHINE_SYSROOT on setup_sysroot
>
>   ...s-Force-tools-variables-to-host-toolchain.patch | 50 ++++++++++++++++++
>   meta/recipes-core/ovmf/ovmf_git.bb                 | 61 ++++++++++++++++++++++
>   scripts/runqemu                                    | 13 ++++-
>   3 files changed, 123 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
>   create mode 100644 meta/recipes-core/ovmf/ovmf_git.bb
>

