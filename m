Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 2C22E6FFED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 00:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5186120AD6;
	Fri, 15 Dec 2017 00:23:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id m3yLQGchLvxv; Fri, 15 Dec 2017 00:23:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 25D4B20567;
	Fri, 15 Dec 2017 00:22:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C37181631EC; Thu, 14 Dec 2017 19:22:57 -0500 (EST)
Date: Thu, 14 Dec 2017 19:22:57 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Kristian Amlie <kristian.amlie@northern.tech>
Message-ID: <20171215002257.GI9221@denix.org>
References: <1513173807-26292-1-git-send-email-kristian.amlie@northern.tech>
	<1513176749-28928-1-git-send-email-kristian.amlie@northern.tech>
MIME-Version: 1.0
In-Reply-To: <1513176749-28928-1-git-send-email-kristian.amlie@northern.tech>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Tom Rini <trini@konsulko.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] u-boot-fw-utils: Fix broken makefile in v2017.11.
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
X-List-Received-Date: Fri, 15 Dec 2017 00:22:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Isn't it "Upstream-Status: Backport [URL]"?

Also, what were the changes in v2 and v3 of this patch?


On Wed, Dec 13, 2017 at 03:52:29PM +0100, Kristian Amlie wrote:
> See the patch for details. This patch has already been applied
> upstream, but we need it for v2017.11.
> 
> Upstream-Status: Accepted [http://git.denx.de/?p=u-boot.git;a=commit;h=ded84f90a1066eef5f34daa4539273de64f7b811]
> 
> Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
> ---
>  .../u-boot/files/v2017.11-fw-utils-build-fix.patch | 41 ++++++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc  |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
> 
> diff --git a/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch b/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
> new file mode 100644
> index 0000000..6aadae4
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
> @@ -0,0 +1,41 @@
> +From 2d3078f3c0bd0656dadf6341888d608c0fe921ea Mon Sep 17 00:00:00 2001
> +From: Stefan Agner <stefan.agner@toradex.com>
> +Date: Tue, 14 Nov 2017 15:47:18 +0100
> +Subject: [PATCH 1/1] envtools: make sure version/timestamp header file are
> + available
> +
> +With commit 84d46e7e8948 ("tools: env: allow to print U-Boot version")
> +the fw_env utilities need the version.h header file. Building only
> +the envtools in a pristine build directory will fail due to missing
> +header files.
> +
> +Make sure the header files are a dependency of the envtools target.
> +
> +Fixes: 84d46e7e8948 ("tools: env: allow to print U-Boot version")
> +Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> +Tested-by: Peter Robinson <pbrobinson@gmail.com>
> +Reviewed-by: Simon Glass <sjg@chromium.org>
> +
> +Upstream-Status: Accepted [http://git.denx.de/?p=u-boot.git;a=commit;h=ded84f90a1066eef5f34daa4539273de64f7b811]
> +
> +Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 61fd973..f8c66a2 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1447,7 +1447,7 @@ checkarmreloc: u-boot
> + 		false; \
> + 	fi
> + 
> +-envtools: scripts_basic
> ++envtools: scripts_basic $(version_h) $(timestamp_h)
> + 	$(Q)$(MAKE) $(build)=tools/env
> + 
> + tools-only: scripts_basic $(version_h) $(timestamp_h)
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> index bfdf1a0..65f1228 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> @@ -12,6 +12,7 @@ SRCREV = "c253573f3e269fd9a24ee6684d87dd91106018a5"
>  SRC_URI = "git://git.denx.de/u-boot.git \
>      file://MPC8315ERDB-enable-DHCP.patch \
>      file://10m50-update-device-tree.patch \
> +    file://v2017.11-fw-utils-build-fix.patch \
>  "
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

