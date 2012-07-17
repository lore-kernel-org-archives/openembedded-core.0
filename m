Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrDCG-00065h-3Y
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 21:12:36 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Jul 2012 12:01:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169507538"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 17 Jul 2012 12:01:15 -0700
Message-ID: <5005B67B.6040206@linux.intel.com>
Date: Tue, 17 Jul 2012 12:01:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342513736-468-1-git-send-email-cristian.iorga@intel.com>
	<1342513736-468-3-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1342513736-468-3-git-send-email-cristian.iorga@intel.com>
Subject: Re: [PATCH 3/3] wpa-supplicant: upgrade to 1.0
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
X-List-Received-Date: Tue, 17 Jul 2012 19:12:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2012 01:28 AM, Cristian Iorga wrote:
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   ...a-supplicant-0.7.inc => wpa-supplicant-1.0.inc} |    4 ++--
>   .../99_wpa_supplicant                              |    0
>   .../defconfig-gnutls                               |    0
>   .../wpa-supplicant.sh                              |    0
>   .../wpa_supplicant.conf                            |    0
>   .../wpa_supplicant.conf-sane                       |    0
>   .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    6 ------
>   .../wpa-supplicant/wpa-supplicant_1.0.bb           |    6 ++++++
>   8 files changed, 8 insertions(+), 8 deletions(-)
>   rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-0.7.inc => wpa-supplicant-1.0.inc} (95%)
>   rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-0.7.3 => wpa-supplicant-1.0}/99_wpa_supplicant (100%)
>   rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-0.7.3 => wpa-supplicant-1.0}/defconfig-gnutls (100%)
>   rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-0.7.3 => wpa-supplicant-1.0}/wpa-supplicant.sh (100%)
>   rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-0.7.3 => wpa-supplicant-1.0}/wpa_supplicant.conf (100%)
>   rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-0.7.3 => wpa-supplicant-1.0}/wpa_supplicant.conf-sane (100%)
>   delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
>   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
> similarity index 95%
> rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
> rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
> index 6c84202..0c18b30 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
> @@ -4,8 +4,8 @@ BUGTRACKER = "http://hostap.epitest.fi/bugz/"
>   SECTION = "network"
>   LICENSE = "GPLv2 | BSD"
>   LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
> -                    file://../README;md5=54cfc88015d3ce83f7156e63c6bb1738 \
> -                    file://wpa_supplicant.c;beginline=1;endline=17;md5=acdc5a4b0d6345f21f136eace747260e"
> +                    file://../README;md5=9bee93996fecdb70f807baceb29d84b9 \
> +                    file://wpa_supplicant.c;beginline=1;endline=17;md5=372fb65dc23b228aec4e40e64de3e467"

As mentioned before, what changed and why?  This should be in the commit 
message.

Sau!

>   DEPENDS = "gnutls dbus libnl"
>   RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/99_wpa_supplicant b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/99_wpa_supplicant
> similarity index 100%
> rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/99_wpa_supplicant
> rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/99_wpa_supplicant
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/defconfig-gnutls
> similarity index 100%
> rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls
> rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/defconfig-gnutls
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa-supplicant.sh b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa-supplicant.sh
> similarity index 100%
> rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa-supplicant.sh
> rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa-supplicant.sh
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant.conf b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa_supplicant.conf
> similarity index 100%
> rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant.conf
> rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa_supplicant.conf
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant.conf-sane b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa_supplicant.conf-sane
> similarity index 100%
> rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant.conf-sane
> rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa_supplicant.conf-sane
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
> deleted file mode 100644
> index 6f6378b..0000000
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require wpa-supplicant-0.7.inc
> -
> -PR = "r12"
> -
> -SRC_URI[md5sum] = "f516f191384a9a546e3f5145c08addda"
> -SRC_URI[sha256sum] = "d0cd50caa85346ccc376dcda5ed3c258eef19a93b3cade39d25760118ad59443"
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
> new file mode 100644
> index 0000000..8ede3e5
> --- /dev/null
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
> @@ -0,0 +1,6 @@
> +require wpa-supplicant-1.0.inc
> +
> +PR = "r0"
> +
> +SRC_URI[md5sum] = "8650f6aa23646ef634402552d0669640"
> +SRC_URI[sha256sum] = "91d41d473a5aafa2e25dd6577ebda975c4d4a3188850a53e31feaf7c04482b9c"
>



