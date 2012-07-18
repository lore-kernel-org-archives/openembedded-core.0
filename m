Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrIQC-0006Bg-L7
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 02:47:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Jul 2012 17:35:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="173434222"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by orsmga002.jf.intel.com with ESMTP; 17 Jul 2012 17:35:59 -0700
Message-ID: <500604EF.3060903@linux.intel.com>
Date: Tue, 17 Jul 2012 17:35:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342021183-30173-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1342021183-30173-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] connman: fix build with automake 1.12
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
X-List-Received-Date: Wed, 18 Jul 2012 00:47:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2012 08:39 AM, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-connectivity/connman/connman.inc |    6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index 12378e9..bb6f532 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
>               ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
>               "
>
> -INC_PR = "r11"
> +INC_PR = "r12"
>
>   TIST = "--enable-tist"
>   TIST_powerpc = ""
> @@ -72,6 +72,10 @@ do_install_append() {
>
>   	# We don't need to package an empty directory
>   	rmdir ${D}${libdir}/connman/scripts
> +
> +	# Automake 1.12 won't install empty directories, but we need the
> +	# plugins directory to be present for ownership
> +	mkdir -p ${D}${libdir}/connman/plugins
>   }
>
>   # These used to be plugins, but now they are core
>


Merged this change into OE-Core, other connman changes are pending with 
some clean up requests.

Thanks
	Sau!


