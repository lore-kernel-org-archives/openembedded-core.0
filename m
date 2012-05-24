Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXcQm-0007QG-2T
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 20:06:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 10:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148040900"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 10:56:22 -0700
Message-ID: <4FBE7646.6020803@linux.intel.com>
Date: Thu, 24 May 2012 10:56:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337620159.git.raj.khem@gmail.com>
In-Reply-To: <cover.1337620159.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/3] ARM hf support
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
X-List-Received-Date: Thu, 24 May 2012 18:06:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2012 10:11 AM, Khem Raj wrote:
> This patchset adds the newly added hard float convention for naming the
> dynamic linker. We have a tune feature to denote hf calling convention
> already therefore this patch uses that feature to decide on configuring
> the toolchain to be soft float or hard-float call conventions by default.
>
>
> The following changes since commit e6333825c3482a559a0c0499e17f8f48d3042ddf:
>
>    tune-mips64.inc: Add new tune file for mips64 big-endian (2012-05-20 20:24:37 -0700)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib kraj/armhf
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/armhf
>
> Khem Raj (3):
>    gcc-4.7: Add knowledge about arm hf dynamic loader
>    eglibc: Add ARM hf dynamic linker support
>    gcc: Grok for callconvention-hard to enable hard float
>
>   .../eglibc/eglibc-2.15/add_HAVE_ARM_PCS_VFP.patch  |   28 ++
>   .../eglibc/eglibc-2.15/ldso_arm_hf_support.patch   |  338 ++++++++++++++++++++
>   meta/recipes-core/eglibc/eglibc_2.15.bb            |    4 +-
>   meta/recipes-devtools/gcc/gcc-4.7.inc              |    1 +
>   .../gcc/gcc-4.7/arm-hard-float-loader.patch        |   48 +++
>   meta/recipes-devtools/gcc/gcc-common.inc           |    2 +
>   6 files changed, 420 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/add_HAVE_ARM_PCS_VFP.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/ldso_arm_hf_support.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/arm-hard-float-loader.patch
>

Merged into OE-Core

Thanks
	Sau!


