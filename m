Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0zrC-0007g6-O0
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 19:27:02 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Feb 2012 10:18:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110466620"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by azsmga001.ch.intel.com with ESMTP; 24 Feb 2012 10:18:38 -0800
Message-ID: <4F47D47E.7010707@linux.intel.com>
Date: Fri, 24 Feb 2012 10:18:38 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1329685524-30028-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1329685524-30028-1-git-send-email-andrei@gherzan.ro>
Subject: Re: [PATCH] dbus: Remove empty ${lindir}dbus-1.0/test directory as we don't build tests
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
X-List-Received-Date: Fri, 24 Feb 2012 18:27:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/19/2012 01:05 PM, Andrei Gherzan wrote:
> This empty directory generates a QA warning of unshippped files/dirs.
>
> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
> ---
>   meta/recipes-core/dbus/dbus.inc |    5 ++++-
>   1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index 2a25256..588209f 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -10,7 +10,7 @@ DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X
>   DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
>   DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk virtual/libx11"
>
> -INC_PR = "r1"
> +INC_PR = "r2"
>
>   SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>              file://tmpdir.patch; \
> @@ -91,6 +91,9 @@ do_install() {
>   	# Remove Red Hat initscript
>   	rm -rf ${D}${sysconfdir}/rc.d
>
> +	# Remove empty testexec directory as we don't build tests
> +	rm -rf ${D}${libdir}/dbus-1.0/test
> +
>   	# disable dbus-1 sysv script on systemd installs
>   	# nearly all distros call the initscript plain 'dbus', but OE-core is different
>   	ln -sf /dev/null ${D}/${base_libdir}/systemd/system/dbus-1.service

Merged into OE-core

Thanks
	Sau!


