Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qw4eR-0005F3-FE
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 06:01:15 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Aug 2011 20:56:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,273,1312182000"; d="scan'208";a="44436375"
Received: from unknown (HELO [10.255.14.203]) ([10.255.14.203])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2011 20:56:28 -0700
Message-ID: <4E54766C.9080006@linux.intel.com>
Date: Tue, 23 Aug 2011 20:56:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313816148.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1313816148.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 0/8] Pending patches from O.S. Systems tree
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
X-List-Received-Date: Wed, 24 Aug 2011 04:01:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2011 09:58 PM, Otavio Salvador wrote:
> The following changes since commit c539155c51e43680711130df9050d3e92282591e:
>
>    newt: update distro tracking fields (2011-08-19 09:05:54 -0700)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core master
>    https://github.com/OSSystems/oe-core/tree/master
>
> Otavio Salvador (8):
>    Use OECORE_DISTRO_VERSION instead of POKY_DISTRO_VERSION
Merged

>    kernel.bbclass: blacklist perf-dbg
Not Merged - Need to figure out why perf-dbg is being generated.

>    kernel.bbclass: move uboot image generation to a specific class
Not Merged - See disussion on list

>    kernel.bbclass: save kernel image name into $kerneldir
Merged

>    fix SDK building due TARGET_ARCH use in installation path
Not Merged Pending RP and Koen discussion

>    scripts/runqemu: add support to pass bootparams to kernel
Merged

>    scripts/runqemu: remove redundant checking
Not merged (See Phil's email)

>    scripts/combo-layer: fix configuration file handling
Merged

>
>   meta/classes/kernel.bbclass            |   47 ++++++++++++++++++++-----------
>   meta/classes/populate_sdk.bbclass      |    2 +-
>   meta/classes/toolchain-scripts.bbclass |   12 ++++----
>   meta/conf/bitbake.conf                 |    2 +-
>   scripts/combo-layer                    |    4 +-
>   scripts/oe-find-native-sysroot         |    2 +-
>   scripts/runqemu                        |    5 +++-
>   scripts/runqemu-export-rootfs          |    2 +-
>   8 files changed, 46 insertions(+), 30 deletions(-)
>

Thanks
	Sau!


