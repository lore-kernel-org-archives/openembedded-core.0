Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlO4I-0000lT-0i
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 18:31:46 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Jul 2011 09:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,262,1309762800"; d="scan'208";a="29839050"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by orsmga002.jf.intel.com with ESMTP; 25 Jul 2011 09:27:32 -0700
Message-ID: <4E2D9973.1040608@linux.intel.com>
Date: Mon, 25 Jul 2011 09:27:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311343068-942-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1311343068-942-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH] gcc-4.6: Fix packaging of native toolchains
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
X-List-Received-Date: Mon, 25 Jul 2011 16:31:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/22/2011 06:57 AM, Kumar Gala wrote:
> The base gcc package is missing liblto_plugin.so.  If we try a simple
> hello world compile we get something like:
>
> root@p5020-ds:~# gcc hello.c
> gcc: fatal error: -fuse-linker-plugin, but liblto_plugin.so not found
> compilation terminated.
>
> We need to include liblto_plugin.so in the base gcc package and not
> gcc-dev.
>
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
>   meta/recipes-devtools/gcc/gcc-4.6.inc            |    2 +-
>   meta/recipes-devtools/gcc/gcc-package-target.inc |    1 +
>   2 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
> index a724594..4c1e1e1 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
> @@ -1,6 +1,6 @@
>   require gcc-common.inc
>
> -PR = "r1"
> +PR = "r2"
>
>   # Third digit in PV should be incremented after a minor release
>   # happens from this branch on gcc e.g. currently its 4.6.0
> diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
> index e6105da..a0e5da4 100644
> --- a/meta/recipes-devtools/gcc/gcc-package-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
> @@ -17,6 +17,7 @@ FILES_${PN} = "\
>     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc* \
>     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto* \
>     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
> +  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/liblto*${SOLIBSDEV} \
>     ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
>     ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
>     ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \

Merged into OE-Core

Thanks
	Sau!


