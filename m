Return-Path: <martin@geanix.com>
X-Greylist: delayed 433 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Jun 2018 07:04:06 UTC
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id CA2417709E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 07:04:06 +0000 (UTC)
Received: from [10.0.0.220] (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id D87E71C1A2E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 08:56:52 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <20180605081056.16610-1-hongl.fnst@cn.fujitsu.com>
	<20180605081056.16610-2-hongl.fnst@cn.fujitsu.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <175b4c3b-b5bb-9b94-6c74-eb81b03b1b93@geanix.com>
Date: Wed, 6 Jun 2018 08:56:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180605081056.16610-2-hongl.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] [PATCH] [PATCH] bind:9.10.6 -> 9.10.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jun 2018 07:04:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Hong,

On 2018-06-05 10:10, Hong Liu wrote:
> 1.Upgrade bind from 9.10.6 to 9.10.7.

There is a pending patch for updating bind to 9.12.1:
https://patchwork.openembedded.org/patch/151135/

// Martin

> 2.Update the checksum of LIC_FILES_CHKSUM, since bind has been changed. The lincese has been modified time.
> 
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>   .../bind/{bind_9.10.6.bb => bind_9.10.7.bb}                 | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
>   rename meta/recipes-connectivity/bind/{bind_9.10.6.bb => bind_9.10.7.bb} (90%)
> 
> diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb b/meta/recipes-connectivity/bind/bind_9.10.7.bb
> similarity index 90%
> rename from meta/recipes-connectivity/bind/bind_9.10.6.bb
> rename to meta/recipes-connectivity/bind/bind_9.10.7.bb
> index 20c8d7b..124968b 100644
> --- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.10.7.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.isc.org/sw/bind/"
>   SECTION = "console/network"
>   
>   LICENSE = "ISC & BSD"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=dba46507446198119bcde32a4feaab43"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=c767ea4f3cf1017290d5b799fa929f80"
>   
>   DEPENDS = "openssl libcap"
>   
> @@ -15,16 +15,14 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>              file://named.service \
>              file://bind9 \
>              file://init.d-add-support-for-read-only-rootfs.patch \
> -           file://bind-confgen-build-unix.o-once.patch \
>              file://0001-build-use-pkg-config-to-find-libxml2.patch \
>              file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
>              file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
>              file://0001-lib-dns-gen.c-fix-too-long-error.patch \
> -           file://use-python3-and-fix-install-lib-path.patch \
>              "
>   
> -SRC_URI[md5sum] = "84e663284b17aee0df1ce6f248b137d7"
> -SRC_URI[sha256sum] = "17bbcd2bd7b1d32f5ba4b30d5dbe8a39bce200079048073d1e0d050fdf47e69d"
> +SRC_URI[md5sum] = "320b9ef5bdf19ef2718a823d9b4243ba"
> +SRC_URI[sha256sum] = "e15e70982d966cd4b194ff483f5cc636c0017b054ae2e332ca3f28fe53f11660"
>   
>   UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
>   UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
> @@ -36,6 +34,7 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
>                    --with-gssapi=no --with-ecdsa=yes \
>                    --sysconfdir=${sysconfdir}/bind \
>                    --with-openssl=${STAGING_DIR_HOST}${prefix} \
> +		--with-eddsa=no \
>                  "
>   
>   inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
> @@ -67,6 +66,7 @@ PACKAGE_BEFORE_PN += "${PN}-utils"
>   FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
>   FILES_${PN}-dev += "${bindir}/isc-config.h"
>   FILES_${PN} += "${sbindir}/generate-rndc-key.sh ${PYTHON_SITEPACKAGES_DIR}"
> +FILES_${PN} += "/usr/lib/python2.7/site-packages/*"
>   
>   PACKAGE_BEFORE_PN += "${PN}-libs"
>   FILES_${PN}-libs = "${libdir}/*.so*"
> @@ -88,7 +88,7 @@ do_install_append() {
>   	install -d "${D}${sysconfdir}/init.d"
>   	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
>   	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
> -	sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
> +	sed -i -e '1s,#!.*python,#! /usr/bin/python3,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
>   
>   	# Install systemd related files
>   	install -d ${D}${sbindir}
> @@ -120,4 +120,3 @@ CONFFILES_${PN} = " \
>   	${sysconfdir}/bind/db.local \
>   	${sysconfdir}/bind/db.root \
>   	"
> -
> 

-- 
Kind regards,
Martin Hundebøll
Embedded Linux Consultant

+45 61 65 54 61
martin@geanix.com

Geanix IVS
DK39600706

