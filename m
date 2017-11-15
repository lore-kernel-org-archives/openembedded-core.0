Return-Path: <stefan@agner.ch>
X-Greylist: delayed 542 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Nov 2017 17:00:25 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 6684B7847F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 17:00:25 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 89B705C100E;
	Wed, 15 Nov 2017 17:46:03 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 15 Nov 2017 17:47:01 +0100
From: Stefan Agner <stefan@agner.ch>
To: Otavio Salvador <otavio@ossystems.com.br>
In-Reply-To: <20171114183223.7804-1-otavio@ossystems.com.br>
References: <20171114183223.7804-1-otavio@ossystems.com.br>
Message-ID: <52e78a6cf11a3a374fab68885140c2b4@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1510764363; bh=frF505qsgz/u7u+RHMgZYaJlh7plGJkFyDWjiKP4zeo=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=HjqlOS2mmXo4wgAsgmnXk29ywoG/VgYrShCUIxg65L8EGEc/xvNQWXjAdahnQKqmdXnaqBuiUq29j9CYHAdVpOIn3Af9d3SnZJOFnPCES57Sa2/DBdy4/jeielPnomQaWxDY5ZbbUssPZubzGAA5GKRim17uilPgSVUrU4y+S2A=
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.11 release
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
X-List-Received-Date: Wed, 15 Nov 2017 17:00:26 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-11-14 19:32, Otavio Salvador wrote:
> This upgrades the U-Boot from 2017.09 to 2017.11 release.

You might encounter this when building fw_printenv/setenv tools alone:

https://lists.denx.de/pipermail/u-boot/2017-November/311505.html

--
Stefan

> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>  .../u-boot/{u-boot-common_2017.09.inc => u-boot-common_2017.11.inc}     | 2 +-
>  .../u-boot/{u-boot-fw-utils_2017.09.bb => u-boot-fw-utils_2017.11.bb}   | 0
>  .../u-boot/{u-boot-mkimage_2017.09.bb => u-boot-mkimage_2017.11.bb}     | 0
>  meta/recipes-bsp/u-boot/{u-boot_2017.09.bb => u-boot_2017.11.bb}        | 0
>  4 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.09.inc =>
> u-boot-common_2017.11.inc} (89%)
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.09.bb =>
> u-boot-fw-utils_2017.11.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.09.bb =>
> u-boot-mkimage_2017.11.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2017.09.bb => u-boot_2017.11.bb} (100%)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
> b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> similarity index 89%
> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> index 02e51242cb..bfdf1a0d8f 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> @@ -7,7 +7,7 @@ PE = "1"
>  
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "c98ac3487e413c71e5d36322ef3324b21c6f60f9"
> +SRCREV = "c253573f3e269fd9a24ee6684d87dd91106018a5"
>  
>  SRC_URI = "git://git.denx.de/u-boot.git \
>      file://MPC8315ERDB-enable-DHCP.patch \
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
> b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.11.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.11.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.09.bb
> b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.11.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.09.bb
> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.11.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.09.bb
> b/meta/recipes-bsp/u-boot/u-boot_2017.11.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot_2017.09.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2017.11.bb
> -- 
> 2.15.0

