Return-Path: <tanuk@iki.fi>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
	[66.111.4.27])
	by mail.openembedded.org (Postfix) with ESMTP id 4A9D676802
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 20:58:00 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 80F55200CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:57:59 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Fri, 22 Jan 2016 15:57:59 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=y7wwYcou4+Zaxkz
	0y+azOuvog6g=; b=cYrm0QeVJKqSrdmymBdyzb8bwDT1oFhWT0fM5tuJxMyJcVi
	0oTA9xYdu2ppBSeV1FXvJWPPby1eXyhQ5lUDiky39IUUgHnWVgfcqyFbtngAdsS3
	LYdXt+von4FrIqSy1VXgj+RNZOQbDhFqQMXkPSqLRVT53vdm9jIbknnU2iyQ=
X-Sasl-enc: XjhcprKkjVMJXIZsZO5W8GtLw0HHyT/t+vZmxbPXmJax 1453496279
Received: from laptop (a88-114-110-232.elisa-laajakaista.fi [88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id CB7ECC01715;
	Fri, 22 Jan 2016 15:57:58 -0500 (EST)
Message-ID: <1453496277.10444.78.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2016 22:57:57 +0200
In-Reply-To: <1453495750-104494-2-git-send-email-raj.khem@gmail.com>
References: <1453495750-104494-1-git-send-email-raj.khem@gmail.com>
	<1453495750-104494-2-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] local.conf.sample: Document HOW-TO enable systemd or busbox to replace sysvinit
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
X-List-Received-Date: Fri, 22 Jan 2016 20:58:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-01-22 at 20:49 +0000, Khem Raj wrote:
> OE core provides systemd,busybox as options for system init system along
> with sysvinit being the default. Document the needed settings to enable
> systemd and busybox as options if user wishes.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/local.conf.sample | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index a662f4d..b760546 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -209,6 +209,23 @@ PACKAGECONFIG_append_pn-qemu-native = " sdl"
>  PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
>  #ASSUME_PROVIDED += "libsdl-native"
>  
> +#
> +# Use busybox/mdev for system initialization
> +#
> +#VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
> +#VIRTUAL-RUNTIME_login_manager = "busybox"
> +#VIRTUAL-RUNTIME_init_manager = "busybox"
> +#VIRTUAL-RUNTIME_initscripts = "initscripts"
> +#VIRTUAL-RUNTIME_keymaps = "keymaps"
> +#DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
> +
> +#
> +# Use systemd for system initialization
> +#
> +#DISTRO_FEATURES_append = " systemd sysvinit"
> +#DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"

Why is sysvinit included in both DISTRO_FEATURES and
DISTRO_FEATURES_BACKFILL_CONSIDERED? My understanding is that
BACKFILL_CONSIDERED only makes sense when the value is not included in
DISTRO_FEATURES.

-- 
Tanu

