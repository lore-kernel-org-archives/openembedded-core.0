Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T8uYW-0003Hx-UO
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 16:56:45 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Sep 2012 07:44:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,367,1344236400"; d="scan'208";a="217916594"
Received: from unknown (HELO [10.255.12.252]) ([10.255.12.252])
	by fmsmga001.fm.intel.com with ESMTP; 04 Sep 2012 07:44:21 -0700
Message-ID: <504613C5.3030701@linux.intel.com>
Date: Tue, 04 Sep 2012 07:44:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Sander van Grieken <sander@outrightsolutions.nl>
References: <1346326420-23677-1-git-send-email-sander@outrightsolutions.nl>
In-Reply-To: <1346326420-23677-1-git-send-email-sander@outrightsolutions.nl>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] avahi: systemd postinst and postrm removed in favor of using systemd.bbclass
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
X-List-Received-Date: Tue, 04 Sep 2012 14:56:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/30/2012 04:33 AM, Sander van Grieken wrote:
> The recipe's custom systemd service enable code is now handled by the meta-systemd
> bbappend recipe in meta-openembedded.
>
> Signed-off-by: Sander van Grieken <sander@outrightsolutions.nl>
> ---
>   meta/recipes-connectivity/avahi/avahi.inc |   19 -------------------
>   1 file changed, 19 deletions(-)
>
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> index c08acb5..a0a1681 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -155,22 +155,3 @@ pkg_postrm_avahi-autoipd () {
>   	deluser avahi-autoipd || true
>   	delgroup avahi-autoipd || true
>   }
> -
> -pkg_postinst_avahi-systemd() {
> -	# can't do this offline
> -	if [ "x$D" != "x" ]; then
> -		exit 1
> -	fi
> -	
> -	systemctl enable avahi-daemon.service
> -}
> -
> -pkg_postrm_avahi-systemd() {
> -	# can't do this offline
> -	if [ "x$D" != "x" ]; then
> -		exit 1
> -	fi
> -
> -	systemctl disable avahi-daemon.service
> -}
> -
>

Merged into OE-Core

Thanks
	Sau!



