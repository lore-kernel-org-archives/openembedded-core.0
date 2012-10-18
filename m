Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOwz4-0004gJ-3U
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:46:26 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 18 Oct 2012 13:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,609,1344236400"; d="scan'208";a="157826860"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Oct 2012 13:33:04 -0700
Message-ID: <50806780.7030901@linux.intel.com>
Date: Thu, 18 Oct 2012 13:33:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1350512717.4470.171.camel@x121e.pbcl.net>
In-Reply-To: <1350512717.4470.171.camel@x121e.pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gconf: Avoid error when trying to delete files that don't exist
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
X-List-Received-Date: Thu, 18 Oct 2012 20:46:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2012 03:25 PM, Phil Blundell wrote:
> Use "rm -f" in do_install_append() so we don't fail if the files we're
> trying to delete have already been removed.  This can happen if the
> distro policy suppresses both static libs and .la files.
>
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>   meta/recipes-gnome/gnome/gconf_3.2.3.bb |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
> index dc3520f..4d77a14 100644
> --- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
> +++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
> @@ -33,8 +33,8 @@ do_install_append() {
>   	install -d ${D}${sysconfdir}/gconf/gconf.xml.system
>
>   	# this stuff is unusable
> -	rm ${D}${libdir}/GConf/*/*.*a
> -	rm ${D}${libdir}/gio/*/*.*a
> +	rm -f ${D}${libdir}/GConf/*/*.*a
> +	rm -f ${D}${libdir}/gio/*/*.*a
>   }
>
>   # disable dbus-x11 when x11 isn't in DISTRO_FEATURES
>
Merged into OE-Core

Thanks
	Sau!



