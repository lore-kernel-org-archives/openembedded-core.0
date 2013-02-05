Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1U2g1o-0000XY-GZ
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 11:45:29 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 73CC6F811EF; Tue,  5 Feb 2013 03:29:40 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id EFC89F811E9;
	Tue,  5 Feb 2013 03:29:35 -0700 (MST)
Message-ID: <5110DF13.7010502@mlbassoc.com>
Date: Tue, 05 Feb 2013 03:29:39 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1359990723-21304-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1359990723-21304-1-git-send-email-constantinx.musca@intel.com>
Subject: Re: [PATCH v5] netbase: split up in netbase and init-ifupdown
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
X-List-Received-Date: Tue, 05 Feb 2013 10:45:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-02-04 08:12, Constantin Musca wrote:
> - netbase should only include etc-rpc, etc-protocols, etc-services
> and the hosts file
> - the init script/configuration files should be in another package
> (init-ifupdown)

What is the benefit of such an intrusive change?
Why not just have the netbase recipe create a separate package?
\
>
> [YOCTO #2486]
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   meta/conf/layer.conf                               |  1 +
>   .../init-ifupdown/init-ifupdown-1.0/copyright      | 11 ++++++
>   .../init-ifupdown-1.0}/init                        |  0
>   .../init-ifupdown-1.0}/interfaces                  |  0
>   .../init-ifupdown-1.0}/nfsroot                     |  0
>   .../init-ifupdown-1.0}/qemuarm/interfaces          |  0
>   .../init-ifupdown-1.0}/qemuarmv6/interfaces        |  0
>   .../init-ifupdown-1.0}/qemuarmv7/interfaces        |  0
>   .../init-ifupdown-1.0}/qemumips/interfaces         |  0
>   .../init-ifupdown-1.0}/qemumips64/interfaces       |  0
>   .../init-ifupdown-1.0}/qemuppc/interfaces          |  0
>   .../init-ifupdown-1.0}/qemush4/interfaces          |  0
>   .../init-ifupdown-1.0}/qemux86-64/interfaces       |  0
>   .../init-ifupdown-1.0}/qemux86/interfaces          |  0
>   .../init-ifupdown/init-ifupdown_1.0.bb             | 42 ++++++++++++++++++++++
>   meta/recipes-core/netbase/netbase_5.0.bb           | 32 +++--------------
>   .../packagegroups/packagegroup-core-boot.bb        |  3 +-
>   17 files changed, 60 insertions(+), 29 deletions(-)
>   create mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/copyright
>   rename meta/recipes-core/{netbase/netbase-5.0 => init-ifupdown/init-ifupdown-1.0}/init (100%)
>   rename meta/recipes-core/{netbase/netbase-5.0 => init-ifupdown/init-ifupdown-1.0}/interfaces (100%)
>   rename meta/recipes-core/{netbase/netbase-5.0 => init-ifupdown/init-ifupdown-1.0}/nfsroot (100%)
>   rename meta/recipes-core/{netbase/netbase-5.0 => init-ifupdown/init-ifupdown-1.0}/qemuarm/interfaces (100%)
>   rename meta/recipes-core/{netbase/netbase-5.0 => init-ifupdown/init-ifupdown-1.0}/qemuarmv6/interfaces (100%)
>   rename meta/recipes-core/{netbase/netbase-5.0 => init-ifupdown/init-ifupdown-1.0}/qemuarmv7/interfaces (100%)
>   rename meta/recipes-core/{netbase/netbase-5.0 => init-ifupdown/init-ifupdown-1.0}/qemumips/interfaces (100%)
>   rename meta/recipes-core/{netbase/netbase-5.0 => init-ifupdown/init-ifupdown-1.0}/qemumips64/interfaces (100%)
>   rename meta/recipes-core/{netbase/netbase-5.0 => init-ifupdown/init-ifupdown-1.0}/qemuppc/interfaces (100%)
>   rename meta/recipes-core/{netbase/netbase-5.0 => init-ifupdown/init-ifupdown-1.0}/qemush4/interfaces (100%)
>   rename meta/recipes-core/{netbase/netbase-5.0 => init-ifupdown/init-ifupdown-1.0}/qemux86-64/interfaces (100%)
>   rename meta/recipes-core/{netbase/netbase-5.0 => init-ifupdown/init-ifupdown-1.0}/qemux86/interfaces (100%)
>   create mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
>
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 3259e5c..6e5cd0c 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -22,6 +22,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>     shadow-securetty \
>     opkg-config-base \
>     netbase \
> +  init-ifupdown \
>     connman-conf \
>     formfactor \
>     xserver-xf86-config \
> diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/copyright b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/copyright
> new file mode 100644
> index 0000000..2a8e0d1
> --- /dev/null
> +++ b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/copyright
> @@ -0,0 +1,11 @@
> +This package was created by Peter Tobias tobias@et-inf.fho-emden.de on
> +Wed, 24 Aug 1994 21:33:28 +0200 and maintained by Anthony Towns
> +<ajt@debian.org> until 2001.
> +It is currently maintained by Marco d'Itri <md@linux.it>.
> +
> +Copyright 1994-2010 Peter Tobias, Anthony Towns and Marco d'Itri
> +
> +The programs in this package are distributed under the terms of the GNU
> +General Public License, version 2 as distributed by the Free Software
> +Foundation. On Debian systems, a copy of this license may be found in
> +/usr/share/common-licenses/GPL-2.
> diff --git a/meta/recipes-core/netbase/netbase-5.0/init b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/init
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/init
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/init
> diff --git a/meta/recipes-core/netbase/netbase-5.0/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/interfaces
> diff --git a/meta/recipes-core/netbase/netbase-5.0/nfsroot b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/nfsroot
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/nfsroot
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/nfsroot
> diff --git a/meta/recipes-core/netbase/netbase-5.0/qemuarm/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarm/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/qemuarm/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarm/interfaces
> diff --git a/meta/recipes-core/netbase/netbase-5.0/qemuarmv6/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv6/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/qemuarmv6/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv6/interfaces
> diff --git a/meta/recipes-core/netbase/netbase-5.0/qemuarmv7/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv7/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/qemuarmv7/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv7/interfaces
> diff --git a/meta/recipes-core/netbase/netbase-5.0/qemumips/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/qemumips/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips/interfaces
> diff --git a/meta/recipes-core/netbase/netbase-5.0/qemumips64/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips64/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/qemumips64/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips64/interfaces
> diff --git a/meta/recipes-core/netbase/netbase-5.0/qemuppc/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuppc/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/qemuppc/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuppc/interfaces
> diff --git a/meta/recipes-core/netbase/netbase-5.0/qemush4/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemush4/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/qemush4/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemush4/interfaces
> diff --git a/meta/recipes-core/netbase/netbase-5.0/qemux86-64/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86-64/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/qemux86-64/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86-64/interfaces
> diff --git a/meta/recipes-core/netbase/netbase-5.0/qemux86/interfaces b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/qemux86/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86/interfaces
> diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> new file mode 100644
> index 0000000..f0ee793
> --- /dev/null
> +++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> @@ -0,0 +1,42 @@
> +SUMMARY = "Basic TCP/IP networking init scripts and configuration files"
> +DESCRIPTION = "This package provides high level tools to configure network interfaces"
> +HOMEPAGE = "http://packages.debian.org/ifupdown"
> +SECTION = "base"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
> +PR = "r0"
> +
> +inherit update-rc.d
> +
> +INITSCRIPT_NAME = "networking"
> +INITSCRIPT_PARAMS = "start 40 S . stop 40 0 6 1 ."
> +
> +SRC_URI = "file://copyright \
> +           file://init \
> +           file://interfaces \
> +           file://nfsroot"
> +
> +do_install () {
> +	install -d ${D}${sysconfdir}/init.d \
> +		   ${D}${sysconfdir}/network/if-pre-up.d \
> +		   ${D}${sysconfdir}/network/if-up.d \
> +		   ${D}${sysconfdir}/network/if-down.d \
> +		   ${D}${sysconfdir}/network/if-post-down.d
> +	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/networking
> +	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfaces
> +	install -m 0755 ${WORKDIR}/nfsroot ${D}${sysconfdir}/network/if-pre-up.d
> +
> +	# Disable network manager on machines that commonly do NFS booting
> +	case "${MACHINE}" in
> +		"qemuarm*" | "qemux86" | "qemux86-64" | "qemumips*" | "qemuppc" | "qemush*")
> +			touch ${D}${sysconfdir}/network/nm-disabled-eth0
> +			;;
> +		*)
> +			;;
> +	esac
> +}
> +
> +RDEPENDS_${PN} = "netbase"
> +RCONFLICTS_${PN} = "netbase (< 1:5.0)"
> +
> +CONFFILES_${PN} = "${sysconfdir}/network/interfaces"
> diff --git a/meta/recipes-core/netbase/netbase_5.0.bb b/meta/recipes-core/netbase/netbase_5.0.bb
> index 3aea874..03fdc38 100644
> --- a/meta/recipes-core/netbase/netbase_5.0.bb
> +++ b/meta/recipes-core/netbase/netbase_5.0.bb
> @@ -5,44 +5,20 @@ SECTION = "base"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
>   PR = "r0"
> -
> -inherit update-rc.d
> -
> -INITSCRIPT_NAME = "networking"
> -INITSCRIPT_PARAMS = "start 40 S . stop 40 0 6 1 ."
> +PE = "1"
>
>   SRC_URI = "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
> -           file://init \
> -           file://hosts \
> -           file://interfaces \
> -           file://nfsroot"
> +           file://hosts"
>
>   SRC_URI[md5sum] = "a379d9199d44d817543eddc211a29b70"
>   SRC_URI[sha256sum] = "ac9424d3cb2bd3c07b6c5bc5875c434d3bc687a73cd7c54b7dc7122308afa9dc"
>
>   do_install () {
> -	install -d ${D}${sysconfdir}/init.d \
> -		   ${D}${mandir}/man8 \
> -		   ${D}${sysconfdir}/network/if-pre-up.d \
> -		   ${D}${sysconfdir}/network/if-up.d \
> -		   ${D}${sysconfdir}/network/if-down.d \
> -		   ${D}${sysconfdir}/network/if-post-down.d
> -	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/networking
> +	install -d ${D}/${mandir}/man8 ${D}${sysconfdir}
>   	install -m 0644 ${WORKDIR}/hosts ${D}${sysconfdir}/hosts
>   	install -m 0644 etc-rpc ${D}${sysconfdir}/rpc
>   	install -m 0644 etc-protocols ${D}${sysconfdir}/protocols
>   	install -m 0644 etc-services ${D}${sysconfdir}/services
> -	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfaces
> -	install -m 0755 ${WORKDIR}/nfsroot ${D}${sysconfdir}/network/if-pre-up.d
> -
> -	# Disable network manager on machines that commonly do NFS booting
> -	case "${MACHINE}" in
> -		"qemuarm*" | "qemux86" | "qemux86-64" | "qemumips*" | "qemuppc" | "qemush*")
> -			touch ${D}${sysconfdir}/network/nm-disabled-eth0
> -			;;
> -		*)
> -			;;
> -	esac
>   }
>
> -CONFFILES_${PN} = "${sysconfdir}/hosts ${sysconfdir}/network/interfaces"
> +CONFFILES_${PN} = "${sysconfdir}/hosts"
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> index edb9e74..b9183a8 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> @@ -6,7 +6,7 @@ SUMMARY = "Minimal boot requirements"
>   DESCRIPTION = "The minimal set of packages required to boot the system"
>   LICENSE = "MIT"
>   DEPENDS = "virtual/kernel"
> -PR = "r10"
> +PR = "r11"
>
>   inherit packagegroup
>
> @@ -38,6 +38,7 @@ RDEPENDS_${PN} = "\
>       ${@base_contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
>       modutils-initscripts \
>       netbase \
> +    init-ifupdown \
>       ${VIRTUAL-RUNTIME_login_manager} \
>       ${VIRTUAL-RUNTIME_init_manager} \
>       ${VIRTUAL-RUNTIME_initscripts} \
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


