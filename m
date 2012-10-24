Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TR2cq-0003il-Nc
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 17:12:08 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Oct 2012 07:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,640,1344236400"; d="scan'208";a="237606867"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by fmsmga001.fm.intel.com with ESMTP; 24 Oct 2012 07:58:39 -0700
Message-ID: <5088021F.2030402@linux.intel.com>
Date: Wed, 24 Oct 2012 07:58:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Christopher Larson <kergoth@gmail.com>
References: <1350919392-28079-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1350919392-28079-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lttng-2.0: fix srcrev/pv to match the recipe filenames
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
X-List-Received-Date: Wed, 24 Oct 2012 15:12:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/2012 08:23 AM, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> Somehow the recipe names got bumped, but the SRCREV and PVs in the recipes
> didn't get updated, so they were still building old versions.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>   meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb | 9 ++++-----
>   meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb   | 6 +++---
>   meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb    | 6 +++---
>   3 files changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
> index d81e9b8..4b15d93 100644
> --- a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
> +++ b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
> @@ -10,13 +10,12 @@ DEPENDS = "virtual/kernel"
>
>   inherit module
>
> -SRCREV = "4d3e89e379fc66480d729abe8daa5c86eb585400"
> -PV = "2.0.pre11+git${SRCREV}"
> -PR = "r1"
> +SRCREV = "a848cad4cc82d05493c487a709f6b55f22695ec6"
> +PV = "2.0.5"
> +PR = "r0"
>
>   SRC_URI = "git://git.lttng.org/lttng-modules.git;protocol=git \
> -           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
> -           file://lttng-sycalls-protect-is_compat_task-from-redefiniti.patch"
> +           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
>
>   export INSTALL_MOD_DIR="kernel/lttng-modules"
>   export KERNEL_SRC="${STAGING_KERNEL_DIR}"
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
> index cf5731d..2a5dd58 100644
> --- a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
> +++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
> @@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=61273c2e3f60dd38a74b01beb5f51fbd \
>
>   DEPENDS = "liburcu popt lttng2-ust"
>
> -SRCREV = "8c3919ea2dc77fdd47fb1c90e41490a20bb4d478"
> -PV = "v2.0.1+git${SRCREV}"
> -PR = "r2"
> +SRCREV = "98c8c95b0e1afb2dac686338efdf036f6446d790"
> +PV = "v2.0.4"
> +PR = "r0"
>
>   SRC_URI = "git://git.lttng.org/lttng-tools.git;protocol=git"
>
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
> index 5e9a529..64ae3a2 100644
> --- a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
> +++ b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
> @@ -12,9 +12,9 @@ inherit autotools
>
>   DEPENDS = "liburcu util-linux"
>
> -SRCREV = "a367ee66aad3ffd21ef64d1b24efc6f862e09562"
> -PV = "2.0.2+git${SRCPV}"
> -PR = "r1"
> +SRCREV = "5fbf75f52c808b648feebea1ed4874c5f6264b05"
> +PV = "2.0.5"
> +PR = "r0"
>
>   SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git"
>
>

Merged into OE-Core

Thanks
	Sau!



