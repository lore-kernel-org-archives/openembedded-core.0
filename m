Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SQMMJ-000456-Bh
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 19:31:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 May 2012 10:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="140178175"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by orsmga002.jf.intel.com with ESMTP; 04 May 2012 10:22:11 -0700
Message-ID: <4FA41043.2070109@linux.intel.com>
Date: Fri, 04 May 2012 10:22:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336118046-20901-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1336118046-20901-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] connman: enable TI shared transport plugin when wifi or bluetooth are requested
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
X-List-Received-Date: Fri, 04 May 2012 17:31:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2012 12:54 AM, Koen Kooi wrote:
> This plugin manages the firmware loading for the TI wl12xx series of bluetooth/wifi/fm chips.
>
> The double --enable-tist when both bluetooth and wireless are enabled is ugly, but harmless
>
> The background on the plugin: https://bugs.meego.com/show_bug.cgi?id=8418
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>
> If accepted into master I'd like to have this in the 'denzil' branch as well.
>
>   meta/recipes-connectivity/connman/connman.inc     |    4 ++--
>   meta/recipes-connectivity/connman/connman_0.79.bb |    2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index bfe6620..8b27cfb 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -28,8 +28,8 @@ EXTRA_OECONF += "\
>       --enable-threads \
>       --enable-loopback \
>       --enable-ethernet \
> -    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi', '--disable-wifi', d)} \
> -    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi --enable-tist', '--disable-wifi', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth --enable-tist', '--disable-bluetooth', d)} \
>       --enable-dnsproxy \
>       --enable-ofono \
>       --enable-tools \
> diff --git a/meta/recipes-connectivity/connman/connman_0.79.bb b/meta/recipes-connectivity/connman/connman_0.79.bb
> index 4c57dab..d7f22b9 100644
> --- a/meta/recipes-connectivity/connman/connman_0.79.bb
> +++ b/meta/recipes-connectivity/connman/connman_0.79.bb
> @@ -11,4 +11,4 @@ SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
>               file://test-set-ipv6-method-api-fix.patch \
>               file://connman"
>   S = "${WORKDIR}/git"
> -PR = "r3"
> +PR = "r4"
Merged into OE-Core

Thanks
	Sau!


