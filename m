Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T24JB-0007KQ-Ae
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 19:56:37 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Aug 2012 10:44:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="187331270"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by orsmga002.jf.intel.com with ESMTP; 16 Aug 2012 10:44:15 -0700
Message-ID: <502D316F.6090604@linux.intel.com>
Date: Thu, 16 Aug 2012 10:44:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343827529-30803-1-git-send-email-marcin.juszkiewicz@linaro.org>
In-Reply-To: <1343827529-30803-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: Re: [PATCH] dbus: provide/replace dbus-x11 only for target
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
X-List-Received-Date: Thu, 16 Aug 2012 17:56:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2012 06:25 AM, Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   meta/recipes-core/dbus/dbus.inc |    4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index 164c4d3..53171e9 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -34,6 +34,10 @@ DEBIANNAME_${PN} = "dbus-1"
>   PACKAGES =+ "${PN}-lib ${PN}-systemd"
>
>   # for compatibility
> +RPROVIDES_${PN}_virtclass-native = ""
> +RPROVIDES_${PN}_virtclass-nativesdk = ""
> +RREPLACES_${PN}_virtclass-native = ""
> +RREPLACES_${PN}_virtclass-nativesdk = ""
>   RPROVIDES_${PN} = "dbus-x11"
>   RREPLACES_${PN} += "dbus-x11"
>
>
Merged into OE-Core

Thanks
	Sau!



