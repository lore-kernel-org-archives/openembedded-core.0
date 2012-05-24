Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXcTG-0007Yb-3k
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 20:09:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 May 2012 10:58:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="144309634"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by orsmga001.jf.intel.com with ESMTP; 24 May 2012 10:58:57 -0700
Message-ID: <4FBE76E1.20409@linux.intel.com>
Date: Thu, 24 May 2012 10:58:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337707070-2036-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1337707070-2036-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] wpa-supplicant: fix packaging error since last commit
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
X-List-Received-Date: Thu, 24 May 2012 18:09:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/22/2012 10:17 AM, Andreas Oberritter wrote:
> * wpa-passphrase has its own package, but commit
>    4a4c568e25a08e9f222d723f9819582c9f895c58 broke it.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   .../wpa-supplicant/wpa-supplicant-0.7.inc          |    2 +-
>   .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
> index aabb3df..b489893 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
> @@ -19,7 +19,7 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
>   S = "${WORKDIR}/wpa_supplicant-${PV}/wpa_supplicant"
>
>   PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
> -FILES_wpa-supplicant-passphrase = "${sbindir}/wpa_passphrase"
> +FILES_wpa-supplicant-passphrase = "${bindir}/wpa_passphrase"
>   FILES_wpa-supplicant-cli = "${sbindir}/wpa_cli"
>   FILES_${PN} += "${datadir}/dbus-1/system-services/*"
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
> index dc2eb6c..1e0086a 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
> @@ -1,6 +1,6 @@
>   require wpa-supplicant-0.7.inc
>
> -PR = "r9"
> +PR = "r10"
>
>   SRC_URI[md5sum] = "f516f191384a9a546e3f5145c08addda"
>   SRC_URI[sha256sum] = "d0cd50caa85346ccc376dcda5ed3c258eef19a93b3cade39d25760118ad59443"

Merged into OE-Core

Thanks
	Sau!


