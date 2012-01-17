Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnGys-0001BP-Ci
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 22:54:14 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2012 13:45:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="57410046"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jan 2012 13:45:23 -0800
Message-ID: <4F15EBF2.3070909@linux.intel.com>
Date: Tue, 17 Jan 2012 13:45:22 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <b042b10b86d6e28290a64e42e1e23de81621630b.1326831402.git.nitin.a.kamble@intel.com>
	<18ffbd8884132baf127ac1104cf8aa393b59e3ff.1326831402.git.nitin.a.kamble@intel.com>
In-Reply-To: <18ffbd8884132baf127ac1104cf8aa393b59e3ff.1326831402.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 5/5] grub-efi-native: fix errors with automake 1.11.2
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
X-List-Received-Date: Tue, 17 Jan 2012 21:54:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2012 12:30 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> This commit replaces earlier patch
> (grub-1.99_fix_for_automake_1.11.2.patch) which did not work on all distros.
>
> Fixes these errors observed with automake 1.11.2
> The useof pkglibhas become more strict compared to the earlier release
> of
> automake resulting in these failures.
> Fixed the files related to automake to avoid the issue.
>
> | conf/Makefile.common:140: `pkglibdir' is not a legitimate directory
> for `DATA'
> | grub-core/Makefile.am:5:   `conf/Makefile.common' included from here
> | conf/Makefile.common:140: `pkglibdir' is not a legitimate directory
> for `DATA'
> | Makefile.am:6:   `conf/Makefile.common' included from here
> | autoreconf: automake failed with exit status: 1
> | ERROR: autoreconf execution failed.
>
> | conf/Makefile.common:150: `pkglibdir' is not a legitimate directory
> for `SCRIPTS'
> | grub-core/Makefile.am:5:   `conf/Makefile.common' included from here
> | conf/Makefile.common:140: `pkglibdir' is not a legitimate directory
> for `DATA'
> | grub-core/Makefile.am:5:   `conf/Makefile.common' included from here
> | conf/Makefile.common:150: `pkglibdir' is not a legitimate directory
> for `SCRIPTS'
> | Makefile.am:6:   `conf/Makefile.common' included from here
> | conf/Makefile.common:140: `pkglibdir' is not a legitimate directory
> for `DATA'
> | Makefile.am:6:   `conf/Makefile.common' included from here
> | autoreconf: automake failed with exit status: 1
>
> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> ---
>   .../files/grub-1.99_fix_for_automake_1.11.2.patch  | 5808 --------------------
>   meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |    4 +-
>   2 files changed, 2 insertions(+), 5810 deletions(-)
>
> diff --git a/meta/recipes-bsp/grub/files/grub-1.99_fix_for_automake_1.11.2.patch b/meta/recipes-bsp/grub/files/grub-1.99_fix_for_automake_1.11.2.patch
> index 1c70e4a..4d729e5 100644
> --- a/meta/recipes-bsp/grub/files/grub-1.99_fix_for_automake_1.11.2.patch
> +++ b/meta/recipes-bsp/grub/files/grub-1.99_fix_for_automake_1.11.2.patch
> @@ -65,5612 +65,6 @@ Index: grub-1.99/Makefile.am
>
>
Missing Patch header with Upstream-Status: and Signed-off-by:

Sau!

>    if COND_i386_coreboot
> -Index: grub-1.99/Makefile.tpl
> -===================================================================
> ---- grub-1.99.orig/Makefile.tpl
> -+++ grub-1.99/Makefile.tpl

<SNIP>

> - CLEANFILES += genmod.sh
> diff --git a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
> index b976d1e..dfa4725 100644
> --- a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
> +++ b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
> @@ -14,9 +14,9 @@ LICENSE = "GPLv3"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
>   # FIXME: We should be able to optionally drop freetype as a dependency
> -DEPENDS = "help2man-native"
> +DEPENDS = "help2man-native autogen-native"
>   RDEPENDS_${PN} = "diffutils freetype"
> -PR = "r3"
> +PR = "r4"
>
>   # Native packages do not normally rebuild when the target changes.
>   # Ensure this is built once per HOST-TARGET pair.


