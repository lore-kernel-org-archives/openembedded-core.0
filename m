Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SeTIb-0002l8-HP for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 17:46:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5CFZtlk012132
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:35:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11576-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:35:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5CFZjCH012126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:35:46 +0100
Message-ID: <1339515344.8065.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jun 2012 16:35:44 +0100
In-Reply-To: <1339514126-23855-1-git-send-email-sgw@linux.intel.com>
References: <1339514126-23855-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] busybox: Add check for wifi/bluetooth to enable rfkill
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
X-List-Received-Date: Tue, 12 Jun 2012 15:46:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-06-12 at 08:15 -0700, Saul Wold wrote:
> rfkill is a usefull tool when you have a device with bluetooth and wifi enabled
> 
> [YOCTO #2494]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-core/busybox/busybox.inc |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 5b83d32..83b25b4 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -57,6 +57,11 @@ def features_to_busybox_settings(d):
>  	busybox_cfg('nls',  distro_features, 'CONFIG_LOCALE_SUPPORT', cnf, rem)
>  	busybox_cfg('ipv4', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
>  	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
> +	busybox_cfg('wifi', distro_features, 'CONFIG_RFKILL', cnf, rem)
> +	busybox_cfg('bluetooth', distro_features, 'CONFIG_RFKILL', cnf, rem)
> +	machine_features = d.getVar('MACHINE_FEATURES', True).split()
> +	busybox_cfg('wifi', machine_features, 'CONFIG_RFKILL', cnf, rem)
> +	busybox_cfg('bluetooth', machine_features, 'CONFIG_RFKILL', cnf, rem)
>  	return "\n".join(cnf), "\n".join(rem)
>  
>  # X, Y = ${@features_to_uclibc_settings(d)}

This makes the busybox package machine specific? Is that intentional?

Cheers,

Richard





