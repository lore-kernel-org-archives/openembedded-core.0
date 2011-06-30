Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qc8ec-0007vD-En
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 06:15:03 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jun 2011 21:11:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,447,1304319600"; d="scan'208";a="24576313"
Received: from unknown (HELO [10.255.14.13]) ([10.255.14.13])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2011 21:11:18 -0700
Message-ID: <4E0BF766.8020608@linux.intel.com>
Date: Wed, 29 Jun 2011 21:11:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1308940765.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1308940765.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/4] A few misc recipe fixed
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
X-List-Received-Date: Thu, 30 Jun 2011 04:15:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/24/2011 11:40 AM, Mark Hatle wrote:
> The problems with these recipes were detected over the course of a few
> make -k world builds.. This allows make world to complete.
>
> The following changes since commit 3aec2fa2df9aaa883feda0d7aed85e63d01398b9:
>
>    qemuimagetest: update cvs and iptables to newer version for toolchain test (2011-06-24 11:28:28 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/fix-recipe
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/fix-recipe
>
> Mark Hatle (4):
>    gcc: Fix file ownership
>    rpm: Change config option
>    msmtp: Disable gnome keyring
>    linux-firmware: Fix file permissions
>
>   .../recipes-devtools/gcc/gcc-configure-runtime.inc |    1 +
>   meta/recipes-devtools/gcc/gcc-package-sdk.inc      |    2 ++
>   meta/recipes-devtools/gcc/gcc-package-target.inc   |    2 ++
>   meta/recipes-devtools/gcc/libgcc_4.5.1.bb          |    2 ++
>   meta/recipes-devtools/gcc/libgcc_4.6.bb            |    2 ++
>   meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    2 +-
>   meta/recipes-extended/msmtp/msmtp_1.4.24.bb        |    4 +++-
>   .../linux-firmware/linux-firmware_git.bb           |    6 +++---
>   8 files changed, 16 insertions(+), 5 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


