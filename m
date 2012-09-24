Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1TG6ie-0008Ti-D5
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 13:20:56 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Sep 2012 04:08:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,474,1344236400"; d="scan'208";a="225711672"
Received: from adinu-vostro-460 (HELO [10.237.105.39]) ([10.237.105.39])
	by fmsmga001.fm.intel.com with ESMTP; 24 Sep 2012 04:07:43 -0700
Message-ID: <50603F22.8020002@intel.com>
Date: Mon, 24 Sep 2012 14:08:18 +0300
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
References: <1348484687-8019-1-git-send-email-andrei.adrianx.dinu@intel.com>
In-Reply-To: <1348484687-8019-1-git-send-email-andrei.adrianx.dinu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] fix for bug 2577
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
X-List-Received-Date: Mon, 24 Sep 2012 11:20:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore. will resend.

On 09/24/2012 02:04 PM, Andrei Dinu wrote:
> Upstream status : pending
>
> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> ---
>   .../eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch      |   25 ++++++++++++++++++++
>   meta/recipes-core/eglibc/eglibc_2.16.bb            |    1 +
>   2 files changed, 26 insertions(+)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch
>
> diff --git a/meta/recipes-core/eglibc/eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch b/meta/recipes-core/eglibc/eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch
> new file mode 100644
> index 0000000..f2480e5
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch
> @@ -0,0 +1,25 @@
> +From 73890569c5048aef34d9a6f08907895a53211d72 Mon Sep 17 00:00:00 2001
> +From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> +Date: Mon, 24 Sep 2012 10:21:49 +0300
> +Subject: [PATCH] updated version
> +
> +Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> +---
> + .../libc/ports/sysdeps/arm/dl-machine.h            |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +ndex 8d905e8..dcfa71e 100644
> +--- libc.orig/ports/sysdeps/arm/dl-machine.h
> ++++ libc/ports/sysdeps/arm/dl-machine.h
> +@@ -503,7 +503,7 @@ elf_machine_rel (struct link_map *map, const Elf32_Rel *reloc,
> +
> + 	case R_ARM_TLS_DTPOFF32:
> + 	  if (sym != NULL)
> +-	    *reloc_addr += sym->st_value;
> ++	    *reloc_addr = sym->st_value;
> + 	  break;
> +
> + 	case R_ARM_TLS_TPOFF32:
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
> index 78dc44a..68da385 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.16.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
> @@ -29,6 +29,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=h
>              file://0001-eglibc-menuconfig-support.patch \
>              file://0002-eglibc-menuconfig-hex-string-options.patch \
>              file://0003-eglibc-menuconfig-build-instructions.patch \
> +           file://0001-R_ARM_TLS_DTPOFF32.patch \
>             "
>   LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
>         file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \



