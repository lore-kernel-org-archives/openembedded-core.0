Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBrAX-0003od-6H
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 19:56:09 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Sep 2012 10:43:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="144306601"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Sep 2012 10:43:31 -0700
Message-ID: <5050C9C3.4040204@linux.intel.com>
Date: Wed, 12 Sep 2012 10:43:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1346905978.git.raj.khem@gmail.com>
In-Reply-To: <cover.1346905978.git.raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] GCC fixes and updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 17:56:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/2012 09:35 PM, Khem Raj wrote:
> This patchset switches us back to using svn for SRC_URI
> and fixes building for armv4 and ppc soft float targets
> Finally fixes for libgcc to build with new build sequence
> such that its same with gcc-cross and gcc-cross-initial
>
> The following changes since commit 610f8c0c0cab8e258919689fd641faec28b58caf:
>
>    adt-installer: Allow changing YOCTOADT_REPO (2012-09-05 23:27:31 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib kraj/gcc-updates
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/gcc-updates
>
> Khem Raj (4):
>    gcc: Switch SRC_URI to use svn

There has already been some discussion about this one.

>    gcc-4.7: Fix build for armv4/EABI and ppc/Os
>    arch-armv4.inc: On armv4 add --fix-v4bx to linker flags for kernel
>    gcc-4.7: Backport libgcc fixes to appease the new build sequence
>
Merged these last three into OE-Core

Thanks
	Sau!

>   meta/conf/machine/include/arm/arch-armv4.inc       |    1 +
>   meta/recipes-devtools/gcc/gcc-4.7.inc              |   14 +--
>   ...-vis_hide-gen-hide-list-Do-not-make-defin.patch |   93 ++++++++++++++++++++
>   ...USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch |   49 +++++++++++
>   .../gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch    |   29 ++++++
>   .../gcc/gcc-4.7/ppc_no_crtsavres.patch             |   21 +++++
>   6 files changed, 202 insertions(+), 5 deletions(-)
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch
>


