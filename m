Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B00686E760
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 05:33:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Mar 2014 21:33:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,598,1389772800"; d="scan'208";a="493265525"
Received: from unknown (HELO [10.255.12.231]) ([10.255.12.231])
	by fmsmga002.fm.intel.com with ESMTP; 05 Mar 2014 21:33:00 -0800
Message-ID: <5318088B.9090506@linux.intel.com>
Date: Wed, 05 Mar 2014 21:32:59 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <c8001854a355061a1c36a51eced9f72f2ce294d3.1393973357.git.sgw@linux.intel.com>
	<fcfa2539551a2688b638b4b361a4ce4c55e6b649.1393973357.git.sgw@linux.intel.com>
In-Reply-To: <fcfa2539551a2688b638b4b361a4ce4c55e6b649.1393973357.git.sgw@linux.intel.com>
Subject: Re: [PATCH 2/6] bind: Update to 9.9.5
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
X-List-Received-Date: Thu, 06 Mar 2014 05:33:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Please Hold this and the DHCP update which relies on the version of bind.

I will submit a v2 in the next couple of days.

Sau!

On 03/04/2014 02:50 PM, Saul Wold wrote:
> Remove CVE patches that are in bind
> Updated COPYRIGHT includes date changes the NetBSD Copyright
> Modifies the Base BSD License to 3-Clause (removes advertising clause)w
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   .../{bind-9.8.1 => bind}/bind-9.8.1-CVE-2012-5166.patch   |  0
>   .../bind/{bind-9.8.1 => bind}/bind-CVE-2011-4313.patch    |  0
>   .../bind/{bind-9.8.1 => bind}/bind-CVE-2012-1667.patch    |  0
>   .../bind/{bind-9.8.1 => bind}/bind-CVE-2012-3817.patch    |  0
>   .../bind/{bind-9.8.1 => bind}/bind-CVE-2013-2266.patch    |  0
>   .../{bind-9.8.1 => bind}/bind-Fix-CVE-2012-4244.patch     |  0
>   .../bind/{bind-9.8.1 => bind}/conf.patch                  |  0
>   .../bind/{bind-9.8.1 => bind}/cross-build-fix.patch       |  0
>   .../make-etc-initd-bind-stop-work.patch                   |  0
>   .../{bind-9.8.1 => bind}/mips1-not-support-opcode.diff    |  0
>   .../bind/{bind_9.8.1.bb => bind_9.9.5.bb}                 | 15 ++++-----------
>   11 files changed, 4 insertions(+), 11 deletions(-)
>   rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-9.8.1-CVE-2012-5166.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-CVE-2011-4313.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-CVE-2012-1667.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-CVE-2012-3817.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-CVE-2013-2266.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-Fix-CVE-2012-4244.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/conf.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/cross-build-fix.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/make-etc-initd-bind-stop-work.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/mips1-not-support-opcode.diff (100%)
>   rename meta/recipes-connectivity/bind/{bind_9.8.1.bb => bind_9.9.5.bb} (77%)
>
> diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-9.8.1-CVE-2012-5166.patch b/meta/recipes-connectivity/bind/bind/bind-9.8.1-CVE-2012-5166.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.8.1/bind-9.8.1-CVE-2012-5166.patch
> rename to meta/recipes-connectivity/bind/bind/bind-9.8.1-CVE-2012-5166.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2011-4313.patch b/meta/recipes-connectivity/bind/bind/bind-CVE-2011-4313.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2011-4313.patch
> rename to meta/recipes-connectivity/bind/bind/bind-CVE-2011-4313.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-1667.patch b/meta/recipes-connectivity/bind/bind/bind-CVE-2012-1667.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-1667.patch
> rename to meta/recipes-connectivity/bind/bind/bind-CVE-2012-1667.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-3817.patch b/meta/recipes-connectivity/bind/bind/bind-CVE-2012-3817.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-3817.patch
> rename to meta/recipes-connectivity/bind/bind/bind-CVE-2012-3817.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2013-2266.patch b/meta/recipes-connectivity/bind/bind/bind-CVE-2013-2266.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2013-2266.patch
> rename to meta/recipes-connectivity/bind/bind/bind-CVE-2013-2266.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-Fix-CVE-2012-4244.patch b/meta/recipes-connectivity/bind/bind/bind-Fix-CVE-2012-4244.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.8.1/bind-Fix-CVE-2012-4244.patch
> rename to meta/recipes-connectivity/bind/bind/bind-Fix-CVE-2012-4244.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.8.1/conf.patch
> rename to meta/recipes-connectivity/bind/bind/conf.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/cross-build-fix.patch b/meta/recipes-connectivity/bind/bind/cross-build-fix.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.8.1/cross-build-fix.patch
> rename to meta/recipes-connectivity/bind/bind/cross-build-fix.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.8.1/make-etc-initd-bind-stop-work.patch
> rename to meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/mips1-not-support-opcode.diff b/meta/recipes-connectivity/bind/bind/mips1-not-support-opcode.diff
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.8.1/mips1-not-support-opcode.diff
> rename to meta/recipes-connectivity/bind/bind/mips1-not-support-opcode.diff
> diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
> similarity index 77%
> rename from meta/recipes-connectivity/bind/bind_9.8.1.bb
> rename to meta/recipes-connectivity/bind/bind_9.9.5.bb
> index e12bb39..998d111 100644
> --- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
> @@ -3,32 +3,25 @@ HOMEPAGE = "http://www.isc.org/sw/bind/"
>   SECTION = "console/network"
>
>   LICENSE = "ISC & BSD"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0fbe2a3ab3c68ac3fea3cad13093877c"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=a3df5f651469919a0e6cb42f84fb6ff1"
>
>   DEPENDS = "openssl libcap"
> -PR = "r5"
>
>   SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>              file://conf.patch \
>              file://cross-build-fix.patch \
>              file://make-etc-initd-bind-stop-work.patch \
> -           file://bind-9.8.1-CVE-2012-5166.patch \
> -           file://bind-CVE-2011-4313.patch \
> -           file://bind-CVE-2012-1667.patch \
> -           file://bind-CVE-2012-3817.patch \
> -           file://bind-CVE-2013-2266.patch \
> -           file://bind-Fix-CVE-2012-4244.patch \
>              file://mips1-not-support-opcode.diff \
>   	   "
>
> -SRC_URI[md5sum] = "cf31117c5d35af34d4c0702970ad9fb7"
> -SRC_URI[sha256sum] = "02285dc429cb2a6687a1b2446e9ee22c1df27f2577225b05be5092395ee7c92c"
> +SRC_URI[md5sum] = "e676c65cad5234617ee22f48e328c24e"
> +SRC_URI[sha256sum] = "d4b64c1dde442145a316679acff2df4008aa117ae52dfa3a6bc69efecc7840d1"
>
>   # --enable-exportlib is necessary for building dhcp
>   ENABLE_IPV6 = "--enable-ipv6=${@base_contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
>   EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
>                    --disable-devpoll --disable-epoll --with-gost=no \
> -                 --with-gssapi=no \
> +                 --with-gssapi=no --with-ecdsa=yes \
>                    --sysconfdir=${sysconfdir}/bind \
>                    --with-openssl=${STAGING_LIBDIR}/.. --with-libxml2=${STAGING_LIBDIR}/.. \
>                    --enable-exportlib --with-export-includedir=${includedir} --with-export-libdir=${libdir} \
>

