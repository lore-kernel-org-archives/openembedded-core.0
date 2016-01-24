Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A667B762AF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 19:21:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Jan 2016 11:21:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,341,1449561600"; d="scan'208";a="867554381"
Received: from yeeteikn-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.180.99])
	by orsmga001.jf.intel.com with ESMTP; 24 Jan 2016 11:21:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Jan 2016 08:21:36 +1300
Message-ID: <1692476.LQWgxAY4ZP@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.3-301.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <1453495750-104494-2-git-send-email-raj.khem@gmail.com>
References: <1453495750-104494-1-git-send-email-raj.khem@gmail.com>
	<1453495750-104494-2-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sun, 24 Jan 2016 19:21:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Fri, 22 Jan 2016 20:49:10 Khem Raj wrote:
> OE core provides systemd,busybox as options for system init system along
> with sysvinit being the default. Document the needed settings to enable
> systemd and busybox as options if user wishes.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/local.conf.sample | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index a662f4d..b760546 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -209,6 +209,23 @@ PACKAGECONFIG_append_pn-qemu-native = " sdl"
>  PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
>  #ASSUME_PROVIDED += "libsdl-native"
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
> +#VIRTUAL-RUNTIME_init_manager = "systemd"
> +#VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
> 
>  # CONF_VERSION is increased each time build/conf/ changes incompatibly and
> is used to # track the version of this file when it was generated. This can
> safely be ignored if

Is this sort of thing really appropriate for local.conf though? Shouldn't we 
be encouraging people to create a distro config for this level of 
customisation?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

