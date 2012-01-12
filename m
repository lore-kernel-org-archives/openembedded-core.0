Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlMqs-0007G5-F5
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 16:48:06 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Jan 2012 22:27:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95015176"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by azsmga001.ch.intel.com with ESMTP; 11 Jan 2012 22:27:52 -0800
Message-ID: <4F0E7D68.8090208@linux.intel.com>
Date: Wed, 11 Jan 2012 22:27:52 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1325911915-16001-2-git-send-email-steve@sakoman.com>
In-Reply-To: <1325911915-16001-2-git-send-email-steve@sakoman.com>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH v2] dbus: change permissions of dbus-daemon-launch-helper to 4755
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
X-List-Received-Date: Thu, 12 Jan 2012 15:48:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2012 08:51 PM, Steve Sakoman wrote:
> With current permissions of 4754 on systemd systems various services will fail to
> activate with "helpful" error messages of the type:
>
> 2000-01-01T00:00:25+00:00 omap3-multi dbus[178]: [system] Activated service
> 'org.freedesktop.nm_dispatcher' failed: Failed to execute program
> /usr/libexec/dbus-daemon-launch-helper: Success
>
> Signed-off-by: Steve Sakoman<steve@sakoman.com>
> ---
>   meta/recipes-core/dbus/dbus.inc |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index 99b2fc7..2a25256 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -10,6 +10,8 @@ DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X
>   DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
>   DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk virtual/libx11"
>
> +INC_PR = "r1"
> +
>   SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>              file://tmpdir.patch; \
>              file://dbus-1.init"
> @@ -84,7 +86,7 @@ do_install() {
>   	chown messagebus:messagebus ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus
>
>   	chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
> -	chmod 4754 ${D}${libexecdir}/dbus-daemon-launch-helper
> +	chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper
>
>   	# Remove Red Hat initscript
>   	rm -rf ${D}${sysconfdir}/rc.d

Merged into OE-Core

Thanks
	Sau!


