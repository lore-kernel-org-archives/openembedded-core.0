Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UA877-0005Jg-PE
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 01:09:46 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Feb 2013 15:53:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,736,1355126400"; d="scan'208";a="291703037"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2013 15:53:25 -0800
Message-ID: <512BF975.90206@linux.intel.com>
Date: Mon, 25 Feb 2013 15:53:25 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>
References: <1361782141-18273-1-git-send-email-cristian.iorga@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB16205C3C@IRSMSX102.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16205C3C@IRSMSX102.ger.corp.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] connman: enable connman client
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 00:09:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/25/2013 12:51 AM, Iorga, Cristian wrote:
> Changes from V1:
> 	- connman client is explicitly enabled
> 	- ${B} is used instead of ${S} (in this specific case are the same, it will be changed later on)
>
Please add these to a proper commit message.

Also, there was some discussion prior about putting the connmanctl in a 
separate package, that does not seem to have happened here.

It could go into the -tools packages that already exists or it's own 
package connman-ctl?

I know Jack M. mentioned looking into this also, so let's be sure to 
coordinate this.

Thanks
	Sau!

> -----Original Message-----
> From: Iorga, Cristian
> Sent: Monday, February 25, 2013 10:49 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Iorga, Cristian
> Subject: [PATCH V2] connman: enable connman client
>
> connmanctl is now included when connman is installed
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   meta/recipes-connectivity/connman/connman.inc |    5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index b61e2af..b0ede60 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
>               ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
>               "
>
> -INC_PR = "r17"
> +INC_PR = "r18"
>
>   TIST = "--enable-tist"
>   TIST_powerpc = ""
> @@ -38,7 +38,7 @@ EXTRA_OECONF += "\
>       --enable-tools \
>       --enable-test \
>       --disable-polkit \
> -    --disable-client \
> +    --enable-client \
>       --enable-fake \
>       ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '', d)} \  "
> @@ -73,6 +73,7 @@ do_install_append() {
>   	install -d ${D}${bindir}
>   	install -m 0755 ${S}/tools/*-test ${D}${bindir}
>   	install -m 0755 ${S}/tools/wispr ${D}${bindir}
> +	install -m 0755 ${B}/client/connmanctl ${D}${bindir}
>
>   	# We don't need to package an empty directory
>   	rmdir ${D}${libdir}/connman/scripts
> --
> 1.7.10.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


