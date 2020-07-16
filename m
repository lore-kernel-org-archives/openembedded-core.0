Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web10.11109.1594887833518066115
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 01:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4B6nMq0Hj5z5tlB;
	Thu, 16 Jul 2020 10:23:50 +0200 (CEST)
Date: Thu, 16 Jul 2020 10:23:49 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Mark Deneen <mdeneen@saucontech.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [[PATCH v2] ppp: Allow arbitrary interface names to be specified in pppd config
Message-ID: <20200716082349.xupj6ruqzi7zv4a7@qschulz>
References: <20200714164951.2095229-1-mdeneen@saucontech.com>
MIME-Version: 1.0
In-Reply-To: <20200714164951.2095229-1-mdeneen@saucontech.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

On Tue, Jul 14, 2020 at 12:49:51PM -0400, Mark Deneen wrote:
> pppd is patched in most Linux distributions to allow arbitrary naming
> of ppp interfaces, allowing users to create consistent firewall rules
> rather than having interfaces named "ppp0", "ppp1", etc.  Yocto is
> missing this option.
> 
> This patch, originally from SUSE, adds this option to pppd. It is not
> included upstream because there are some pppd-supported platforms which
> lack the ability to rename interfaces.
> 
> Upstream-Status: Inappropriate [not all platforms supported by pppd can rename interfaces]
> 

This should probably go....

> Signed-off-by: Mark Deneen <mdeneen@saucontech.com>
> ---
>  .../ppp/ppp/0002-pppd-add-ifname-option.patch | 214 ++++++++++++++++++
>  meta/recipes-connectivity/ppp/ppp_2.4.8.bb    |   1 +
>  2 files changed, 215 insertions(+)
>  create mode 100644 meta/recipes-connectivity/ppp/ppp/0002-pppd-add-ifname-option.patch
> 
> diff --git a/meta/recipes-connectivity/ppp/ppp/0002-pppd-add-ifname-option.patch b/meta/recipes-connectivity/ppp/ppp/0002-pppd-add-ifname-option.patch
> new file mode 100644
> index 0000000000..8e54024d15
> --- /dev/null
> +++ b/meta/recipes-connectivity/ppp/ppp/0002-pppd-add-ifname-option.patch
> @@ -0,0 +1,214 @@
> +From bbcdc4366bbee6c3f4e1ddda31e4eec8c1b3ccc2 Mon Sep 17 00:00:00 2001
> +From: Paul Mackerras <paulus@samba.org>
> +Date: Tue, 23 Aug 2016 16:10:21 +1000
> +Subject: [PATCH 13/16] pppd: allow use of arbitrary interface names
> +
> +This is a modified version of a patch from openSUSE that enables PPP interfaces
> +to be called arbitrary names, rather than simply pppX where X is the unit
> +number.
> +
> +The modifications from the stock openSUSE patch are:
> +- refresh patch on top of 018_ip-up_option.diff
> +- fix a printf format-string vulnerability in pppd/main.c:set_ifunit()
> +- clarify the pppd.8 manpage additions
> +- patch pppstats/pppstats.c to query renamed interfaces without complaint
> +
> +Origin: SUSE
> +Bug-Debian: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=458646
> +Forwarded: no
> +Reviewed-by: Chris Boot <bootc@debian.org>
> +Signed-off-by: Paul Mackerras <paulus@ozlabs.org>

... here ^.

With your Signed-off-by right after?

Also.. Does Yocto support any of such platforms that can't rename
interfaces?

Thanks,
Quentin
