Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Sf6iM-00007G-Nn
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 11:51:42 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1Sf6Y5-0005tw-66; Thu, 14 Jun 2012 11:41:05 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jun 2012 10:41:04 +0100
In-Reply-To: <3b44305edae36265295087fb5f31d22d660599b8.1339650859.git.dvhart@linux.intel.com>
References: <cover.1339650859.git.dvhart@linux.intel.com>
	<3b44305edae36265295087fb5f31d22d660599b8.1339650859.git.dvhart@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1339666865.14857.39.camel@phil-desktop>
Mime-Version: 1.0
Cc: Yocto Project <yocto@yoctoproject.org>,
	Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 2/3] busybox: Add setsid and cttyhack for tiny DISTRO_FEATURE
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
X-List-Received-Date: Thu, 14 Jun 2012 09:51:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-06-13 at 22:19 -0700, Darren Hart wrote:
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 5b83d32..d07ba7e 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -57,6 +57,8 @@ def features_to_busybox_settings(d):
>  	busybox_cfg('nls',  distro_features, 'CONFIG_LOCALE_SUPPORT', cnf, rem)
>  	busybox_cfg('ipv4', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
>  	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
> +	busybox_cfg('tiny', distro_features, 'CONFIG_SETSID', cnf, rem)
> +	busybox_cfg('tiny', distro_features, 'CONFIG_CTTYHACK', cnf, rem)
>  	return "\n".join(cnf), "\n".join(rem)
>  
>  # X, Y = ${@features_to_uclibc_settings(d)}

What exactly is the mission of the "tiny" DISTRO_FEATURE?  It doesn't
seem very wholesome for it to be enabling a random grab-bag of bits in
busybox (or anywhere else).  

If poky-tiny wants those features enabled then it can, and should, ship
its own configuration for busybox which turns them on.  I think that
would be better than further proliferation of switches in oe-core.

p.




