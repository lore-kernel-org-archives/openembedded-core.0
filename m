Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THGHa-0000Sc-FP
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 17:45:46 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Sep 2012 08:32:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="149881163"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Sep 2012 08:32:51 -0700
Message-ID: <506471A2.9080904@linux.intel.com>
Date: Thu, 27 Sep 2012 08:32:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1348691119-13561-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1348691119-13561-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dbus: disable all X11 when native
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
X-List-Received-Date: Thu, 27 Sep 2012 15:45:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2012 01:25 PM, Ross Burton wrote:
> Without --without-x the X11 detection would still go ahead and find the host X11
> headers, which seems to cause problems at link time.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-core/dbus/dbus.inc |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index 5c99e11..550eb0a 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -10,7 +10,7 @@ DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X
>   DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
>   DEPENDS_virtclass-nativesdk = "nativesdk-expat virtual/nativesdk-libintl virtual/libx11"
>
> -INC_PR = "r4"
> +INC_PR = "r5"
>
>   SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>              file://tmpdir.patch; \
> @@ -64,7 +64,7 @@ pkg_postinst_dbus() {
>   }
>
>   EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
> -EXTRA_OECONF_X_virtclass-native = "--disable-x11-autolaunch"
> +EXTRA_OECONF_X_virtclass-native = "--without-x --disable-x11-autolaunch"
>
>   EXTRA_OECONF = "--disable-tests \
>                   --disable-checks \
>

Merged into OE-Core

Thanks
	Sau!



