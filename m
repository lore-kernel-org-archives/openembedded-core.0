Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SQ294-0000ks-S4
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 21:56:59 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2012 12:47:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96099985"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by AZSMGA002.ch.intel.com with ESMTP; 03 May 2012 12:47:11 -0700
Message-ID: <4FA2E0BF.9080108@linux.intel.com>
Date: Thu, 03 May 2012 12:47:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335887732.git.kergoth@gmail.com>
In-Reply-To: <cover.1335887732.git.kergoth@gmail.com>
Subject: Re: [PATCH 0/8] External CSL toolchain improvements
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
X-List-Received-Date: Thu, 03 May 2012 19:56:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/01/2012 08:58 AM, Christopher Larson wrote:
> See the commit message summaries for details, but this syncs up my local
> external-csl-toolchain recipe with upstream, which includes general cleanup
> and use of base_libdir to fix issues with mips64, splits out
> libstdc++-staticdev, adds CSL_VER_MAIN to target recipe signatures, and fixes
> and uses precompiled locales rather than regenerating them.
>
> Most of this is straightforward, but I would appreciate review in particular
> of the "libc-package: rework 'precompiled' locale handling". Thanks.
>
> The following changes since commit 26d822ad059dd4839cc6fee2a65714e73cc146e1:
>
>    nfs-utils: don't try to unload nfsd module (2012-05-01 14:28:47 +0100)
>
> are available in the git repository at:
>    git://github.com/kergoth/oe-core external-csl-improvements
>
> Christopher Larson (8):
>        csl-versions.inc: capture version in signatures
>        external-csl-toolchain: split out a libstdc++-staticdev package
>        external-csl-toolchain: silence .a/.debug QA warnings
>        external-csl-toolchain: cleanup, simplify, use base_libdir
>        external-csl-toolchain: update SUPPORTED to match toolchain
>        tclibc-eglibc: drop hardcoded locale-base-en-us/en-gb
>        libc-package: rework ''precompiled' locale handling
>        tcmode-external-csl: use the existing precompiled locale files
>
>   meta/classes/libc-package.bbclass                  |   96 ++++----
>   meta/conf/distro/include/csl-versions.inc          |    4 +
>   meta/conf/distro/include/tclibc-eglibc.inc         |   12 +-
>   meta/conf/distro/include/tcmode-external-csl.inc   |    4 +
>   meta/recipes-core/meta/external-csl-toolchain.bb   |   68 +++---
>   .../meta/external-csl-toolchain/SUPPORTED          |  257 +++++++++++++++++++-
>   6 files changed, 346 insertions(+), 95 deletions(-)
>
> Christopher Larson (8):
>    csl-versions.inc: capture version in signatures
>    external-csl-toolchain: split out a libstdc++-staticdev package
>    external-csl-toolchain: silence .a/.debug QA warnings
>    external-csl-toolchain: cleanup, simplify, use base_libdir
>    external-csl-toolchain: update SUPPORTED to match toolchain
>    tclibc-eglibc: drop hardcoded locale-base-en-us/en-gb
>    libc-package: rework ''precompiled' locale handling
>    tcmode-external-csl: use the existing precompiled locale files
>
>   meta/classes/libc-package.bbclass                  |   96 ++++----
>   meta/conf/distro/include/csl-versions.inc          |    4 +
>   meta/conf/distro/include/tclibc-eglibc.inc         |   12 +-
>   meta/conf/distro/include/tcmode-external-csl.inc   |    4 +
>   meta/recipes-core/meta/external-csl-toolchain.bb   |   68 +++---
>   .../meta/external-csl-toolchain/SUPPORTED          |  257 +++++++++++++++++++-
>   6 files changed, 346 insertions(+), 95 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



