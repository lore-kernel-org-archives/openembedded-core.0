Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJf1E-0000j4-3h
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 06:58:00 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 May 2011 21:55:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,344,1301900400"; d="scan'208";a="690491232"
Received: from unknown (HELO [10.255.12.75]) ([10.255.12.75])
	by fmsmga002.fm.intel.com with ESMTP; 09 May 2011 21:55:13 -0700
Message-ID: <4DC8C531.6040802@linux.intel.com>
Date: Mon, 09 May 2011 21:55:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1304977276.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1304977276.git.nitin.a.kamble@intel.com>
Cc: poky@yoctoproject.org
Subject: Re: [PATCH 0/5] Misc fixes related to gcc 4.6.0
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
X-List-Received-Date: Tue, 10 May 2011 04:58:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2011 02:43 PM, Nitin A Kamble wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: nitin/misc
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc
>
> Thanks,
>      Nitin A Kamble<nitin.a.kamble@intel.com>
> ---
>
>
> Khem Raj (1):
>    gcc-4.6.0: Apply linaro patches
>
> Nitin A Kamble (4):
>    mdadm: compilation fix for gcc 4.6.0
>    pax: fix for compiling with gcc 4.6.0
>    systemtap: fix for compilation with gcc 4.6.0
>    kexec-tools: fix compiler errors with gcc 4.6.0
>
Nitin,

I noticed that you are using "=" instead of ": for the Upstream-status,
it should be ":" just like "Signed-off-by:", also please use 
"Uptream-status" capitalization.  If you used "=" before, my apologies 
for not catching it last time.

Sau!


>   meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    4 +
>   .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch  |   51 ++
>   .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch  |   63 ++
>   .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch  |   32 +
>   .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch  |   28 +
>   .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch  |  653 ++++++++++++++++++++
>   .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch  |  126 ++++
>   .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch  |  177 ++++++
>   .../gcc/gcc-4_6-branch-linaro-backports.inc        |    9 +
>   .../mdadm/fix_for_compilation_with_gcc-4.6.0.patch |  174 ++++++
>   meta/recipes-extended/mdadm/mdadm_3.2.1.bb         |    5 +-
>   .../pax/pax/fix_for_compile_with_gcc-4.6.0.patch   |   25 +
>   meta/recipes-extended/pax/pax_3.4.bb               |    5 +-
>   .../fix_for_compiling_with_gcc-4.6.0.patch         |   40 ++
>   meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb     |    3 +-
>   .../fix_for_compilation_with_gcc-4.6.0.patch       |  119 ++++
>   meta/recipes-kernel/systemtap/systemtap_git.bb     |    3 +-
>   17 files changed, 1511 insertions(+), 6 deletions(-)
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
>   create mode 100644 meta/recipes-extended/mdadm/mdadm/fix_for_compilation_with_gcc-4.6.0.patch
>   create mode 100644 meta/recipes-extended/pax/pax/fix_for_compile_with_gcc-4.6.0.patch
>   create mode 100644 meta/recipes-kernel/kexec/kexec-tools/fix_for_compiling_with_gcc-4.6.0.patch
>   create mode 100644 meta/recipes-kernel/systemtap/systemtap/fix_for_compilation_with_gcc-4.6.0.patch
>


