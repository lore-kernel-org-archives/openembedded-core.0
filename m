Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qbiuj-0006Fz-Fj
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 02:45:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2011 17:42:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,440,1304319600"; d="scan'208";a="24052554"
Received: from swold-mobl.jf.intel.com (HELO [10.24.0.56]) ([10.24.0.56])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2011 17:42:14 -0700
Message-ID: <4E0A74E5.2020406@linux.intel.com>
Date: Tue, 28 Jun 2011 17:42:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1308230863.25285.4590.camel@phil-desktop>
In-Reply-To: <1308230863.25285.4590.camel@phil-desktop>
Subject: Re: [PATCH] dhcp: don't try to move files from ${sbindir} to ${base_sbindir} if they are the same
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
X-List-Received-Date: Wed, 29 Jun 2011 00:45:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/16/2011 06:27 AM, Phil Blundell wrote:
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/recipes-connectivity/dhcp/dhcp4.inc |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-connectivity/dhcp/dhcp4.inc b/meta/recipes-connectivity/dhcp/dhcp4.inc
> index 159ae89..885cc19 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp4.inc
> +++ b/meta/recipes-connectivity/dhcp/dhcp4.inc
> @@ -47,7 +47,9 @@ do_install_append () {
>   	install -m 0644 ${WORKDIR}/dhcpd.conf ${D}${sysconfdir}/dhcp/dhcpd.conf
>
>   	install -d ${D}${base_sbindir}/
> -	mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
> +	if [ "${sbindir}" != "${base_sbindir}" ]; then
> +		mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
> +	fi
>   	install -m 0755 ${S}/client/scripts/linux ${D}${base_sbindir}/dhclient-script
>   }
>

Appears to be merged in OE-Core, just no email yet.

Consider this your Merged email!  I think that RP is catching up Emails 
may not have yet.

Sau!


