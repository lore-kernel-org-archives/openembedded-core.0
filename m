Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sm7Gz-0002SE-Ux
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 19:52:26 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jul 2012 10:41:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="188051816"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2012 10:41:17 -0700
Message-ID: <4FF32EBD.2050006@linux.intel.com>
Date: Tue, 03 Jul 2012 10:41:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341262097.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1341262097.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/7 v3] Enable the ability to create an image matching SDK
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
X-List-Received-Date: Tue, 03 Jul 2012 17:52:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2012 01:50 PM, Mark Hatle wrote:
> Rebased and patch 7/7 added to correct an oversight in base.bbclass.
>
> --- v2
>
> Only difference is patch 1/6, I accidently sent and older broken version of the
> patch.  This is the correct version.
>
> --- v1
>
> After this series of patches, it is possible to generate an SDK that
> matches the image.  The SDK and all related code is only activated if an image
> recipe is built using the "populate_sdk" task, such as:
>
> bitbake core-image-sato -c populate_sdk
>
> Existing SDK images, such as meta-toolchain or meta-toolchain-gmae continue to
> work without modifications.
>
> The following changes since commit 64422f7c5da160050a5454817c8fa9d070104b34:
>
>    package.bbclass: Add missing PKGR, PKGV, PKGE and ALTERNATIVE variables from PACKAGEVARS (2012-07-02 16:44:57 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/sdk
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/sdk
>
> Mark Hatle (7):
>    Fix manual log file paths
>    populate_sdk.bbclass: Split into two parts
>    populate_sdk: Allow for attempt only packages in the SDK
>    populate_sdk_base.bbclass: Change to using task specific depends
>    populate_sdk: enable basic multilib support
>    image.bbclass: Add support to build the SDK in parallel with the
>      image
>    base.bbclass: Add cross-canadian-${TRANSLATED_TARGET_ARCH} to the
>      license exclusion list
>
>   meta/classes/base.bbclass              |    2 +-
>   meta/classes/image.bbclass             |    7 ++-
>   meta/classes/package_deb.bbclass       |    4 +-
>   meta/classes/package_ipk.bbclass       |    2 +-
>   meta/classes/package_rpm.bbclass       |   10 +-
>   meta/classes/populate_sdk.bbclass      |   91 +---------------------
>   meta/classes/populate_sdk_base.bbclass |  128 ++++++++++++++++++++++++++++++++
>   meta/classes/populate_sdk_deb.bbclass  |    6 +-
>   meta/classes/populate_sdk_ipk.bbclass  |    5 +-
>   meta/classes/populate_sdk_rpm.bbclass  |    4 +-
>   meta/classes/rootfs_deb.bbclass        |    2 +
>   meta/classes/rootfs_ipk.bbclass        |    2 +
>   meta/classes/toolchain-scripts.bbclass |   16 +++--
>   13 files changed, 171 insertions(+), 108 deletions(-)
>   create mode 100644 meta/classes/populate_sdk_base.bbclass
>

Merged into OE-Core

Thanks
	Sau!


