Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F30576486
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 09:32:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t779WKB6000525
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Aug 2015 02:32:20 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 7 Aug 2015 02:32:20 -0700
Message-ID: <55C47B22.4050900@windriver.com>
Date: Fri, 7 Aug 2015 17:32:18 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Cristian Iorga <cristian.iorga@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1438875900-16136-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1438875900-16136-1-git-send-email-cristian.iorga@intel.com>
Subject: Re: [PATCH] qemu: upgrade to 2.4.0-rc4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Aug 2015 09:32:22 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Maybe this patch caused a autobuilder failure ?

https://autobuilder.yoctoproject.org/main/builders/nightly-deb-non-deb/builds/86/steps/Running%20Sanity%20Tests/logs/stdio

// Robert

On 08/06/2015 11:45 PM, Cristian Iorga wrote:
> Bugfixes, bring it closer to 2.4.0 final release.
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   meta/recipes-devtools/qemu/{qemu_2.4.0-rc3.bb => qemu_2.4.0-rc4.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-devtools/qemu/{qemu_2.4.0-rc3.bb => qemu_2.4.0-rc4.bb} (82%)
>
> diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0-rc3.bb b/meta/recipes-devtools/qemu/qemu_2.4.0-rc4.bb
> similarity index 82%
> rename from meta/recipes-devtools/qemu/qemu_2.4.0-rc3.bb
> rename to meta/recipes-devtools/qemu/qemu_2.4.0-rc4.bb
> index 9b17bcc..1964a50 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.4.0-rc3.bb
> +++ b/meta/recipes-devtools/qemu/qemu_2.4.0-rc4.bb
> @@ -8,11 +8,11 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
>               file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
>              "
>   SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BPN}-${REALPV}.tar.bz2"
> -SRC_URI[md5sum] = "ba43213c94ef4463afc8bd01ee221860"
> -SRC_URI[sha256sum] = "aacd5834ce275300f1ba3617c32d4d149db93705ecb7955d7436c0fc9b96aa4c"
> +SRC_URI[md5sum] = "0e9c00b15d383043ce888f7bf17308c9"
> +SRC_URI[sha256sum] = "724bc17d29babe2b55107c76af7cd67e162857958a3bfe2f34bb9776f1f5f4b3"
>
>   S="${WORKDIR}/${BPN}-${REALPV}"
> -REALPV = "2.4.0-rc3"
> +REALPV = "2.4.0-rc4"
>   PV = "2.3.99+${REALPV}"
>
>   COMPATIBLE_HOST_class-target_mips64 = "null"
>

