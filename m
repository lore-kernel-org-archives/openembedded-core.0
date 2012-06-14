Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Sf2gl-0003wQ-UT
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 07:33:48 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Jun 2012 22:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156179851"
Received: from unknown (HELO envy.home) ([10.255.12.119])
	by azsmga001.ch.intel.com with ESMTP; 13 Jun 2012 22:23:09 -0700
Message-ID: <4FD974F1.2000703@linux.intel.com>
Date: Wed, 13 Jun 2012 22:21:53 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1339650859.git.dvhart@linux.intel.com>
	<3b44305edae36265295087fb5f31d22d660599b8.1339650859.git.dvhart@linux.intel.com>
In-Reply-To: <3b44305edae36265295087fb5f31d22d660599b8.1339650859.git.dvhart@linux.intel.com>
X-Enigmail-Version: 1.4.2
Cc: Yocto Project <yocto@yoctoproject.org>
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
X-List-Received-Date: Thu, 14 Jun 2012 05:33:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Note that this is a part of a larger series. The other patches are
against meta-yocto, but the busybox change seemed more appropriate here
than in a bbappend in meta-yocto.

At some point poky-tiny may need to come into oe-core, until then...

On 06/13/2012 10:19 PM, Darren Hart wrote:
> When building very small systems, it can be useful to spawn
> a shell from a simple init script, rather than a full System V Init
> process. This requires the shell be the session leader and be able to
> open the controlling terminal if it is to have job control.
> 
> Enable CONFIG_CTTYHACK and CONFIG_SETSID to enable this for distros
> defining the "tiny" DISTRO_FEATURE.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: OE Core <openembedded-core@lists.openembedded.org>
> ---
>  meta/recipes-core/busybox/busybox.inc |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
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
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




