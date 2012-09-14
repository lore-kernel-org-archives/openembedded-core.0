Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCYTV-0006RM-Hx
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 18:10:37 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Sep 2012 08:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,423,1344236400"; d="scan'208";a="222106993"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by fmsmga002.fm.intel.com with ESMTP; 14 Sep 2012 08:58:00 -0700
Message-ID: <50535408.1070508@linux.intel.com>
Date: Fri, 14 Sep 2012 08:58:00 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1347573352.git.raj.khem@gmail.com>
In-Reply-To: <cover.1347573352.git.raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Binutils fixes
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
X-List-Received-Date: Fri, 14 Sep 2012 16:10:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2012 02:58 PM, Khem Raj wrote:
> This patch is backporting strictly the patches that has gone into
> 2.22 release branch since 2.22 was released last year. I have dropped
> the patches for AVR,CRIS and HPPA which does not concern OE-Core's primary
> architecture. Majority fixes are for ld and mips and ppc architecture
> Binutils testruns are better after these bugfixes and also all architectures
> booted console-image successfully
>
> The following changes since commit 835654994574c158d6324218ebe000bd2ef9a792:
>
>    rt: Add hwlatdetect to rt images (2012-09-12 15:11:12 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib kraj/binutils-backports
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/binutils-backports
>
> Khem Raj (1):
>    binutils-2.22: Backport PR fixes from 2.22 branch
>
>   meta/recipes-devtools/binutils/binutils-2.22.inc   |   16 +-
>   ...print_insn_micromips-Rename-local-variabl.patch |  634 +++++++
>   .../binutils/binutils/0019-PR-ld-13468.patch       |   46 +
>   .../binutils/0028-Backport-from-mainline.patch     |  139 ++
>   ...19-Chung-Lin-Tang-cltang-codesourcery.com.patch |   47 +
>   ...19-Chung-Lin-Tang-cltang-codesourcery.com.patch |  214 +++
>   ...19-Chung-Lin-Tang-cltang-codesourcery.com.patch | 1068 +++++++++++
>   ...opy-from-mainline-to-binutils-2.22-branch.patch | 1944 ++++++++++++++++++++
>   ...elf32bmip.sh-OTHER_SECTIONS-Put-.mdebug.-.patch |   49 +
>   .../binutils/binutils/0052-gas.patch               |   83 +
>   ...55-Remove-ABI_64_P-check-on-R_X86_64_PCXX.patch |  176 ++
>   .../binutils/binutils/0078-PR-binutils-13622.patch |   48 +
>   .../binutils/0144-timer.cc-include-unistd.h.patch  |   32 +
>   ...-2012-04-27-Doug-Kwan-dougkwan-google.com.patch |  169 ++
>   .../binutils/binutils/0182-PR-ld-13991.patch       | 1617 ++++++++++++++++
>   15 files changed, 6281 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0006-mips-dis.c-print_insn_micromips-Rename-local-variabl.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0019-PR-ld-13468.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0028-Backport-from-mainline.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0035-2011-12-19-Chung-Lin-Tang-cltang-codesourcery.com.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0036-2011-12-19-Chung-Lin-Tang-cltang-codesourcery.com.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0037-2011-12-19-Chung-Lin-Tang-cltang-codesourcery.com.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0038-Copy-from-mainline-to-binutils-2.22-branch.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0039-emulparams-elf32bmip.sh-OTHER_SECTIONS-Put-.mdebug.-.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0052-gas.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0055-Remove-ABI_64_P-check-on-R_X86_64_PCXX.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0078-PR-binutils-13622.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0144-timer.cc-include-unistd.h.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0166-2012-04-27-Doug-Kwan-dougkwan-google.com.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0182-PR-ld-13991.patch
>

Merged into OE-Core

Thanks
	Sau!



