Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SirWq-0005Lf-IQ
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 20:27:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Jun 2012 11:16:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="161984972"
Received: from unknown (HELO [10.255.12.175]) ([10.255.12.175])
	by orsmga002.jf.intel.com with ESMTP; 24 Jun 2012 11:16:29 -0700
Message-ID: <4FE7597D.7020301@linux.intel.com>
Date: Sun, 24 Jun 2012 11:16:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340319020.git.raj.khem@gmail.com>
	<34661d7f2383341236e842d75197263faf23ced1.1340319020.git.raj.khem@gmail.com>
In-Reply-To: <34661d7f2383341236e842d75197263faf23ced1.1340319020.git.raj.khem@gmail.com>
Subject: Re: [PATCH 1/5] kconfig-frontends: New recipe
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
X-List-Received-Date: Sun, 24 Jun 2012 18:27:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/21/2012 03:54 PM, Khem Raj wrote:
> kconfig-frontends provides the kconfig infrastructure
> thats used for linux kernel as a standalone package. Its
> not intended to be used for kernel itself but can be
> used by packages who are based on kconfig e.g. busybox
> uclibc or new packages who wants to use kconfig infra
> for the package build
>
Khem:

Did you build for nativesdk? Also did you check a multi-lib build, we 
have seen issues with new recipes and multi-lib.

Sau!

ERROR: Nothing PROVIDES 'flex-nativesdk' (but 
virtual:nativesdk:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly/build/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb 
DEPENDS on or otherwise requires it)
ERROR: Nothing PROVIDES 'bison-nativesdk' (but 
virtual:nativesdk:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly/build/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb 
DEPENDS on or otherwise requires it)
ERROR: Nothing PROVIDES 'gperf-nativesdk' (but 
virtual:nativesdk:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly/build/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb 
DEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'kconfig-frontends-nativesdk-dev' (but 
virtual:nativesdk:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly/build/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb 
RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'kconfig-frontends-nativesdk-dev'
NOTE: Runtime target 'kconfig-frontends-nativesdk-dev' is unbuildable, 
removing...
Missing or unbuildable dependency chain was: 
['kconfig-frontends-nativesdk-dev']
ERROR: Nothing RPROVIDES 'kconfig-frontends-nativesdk' (but 
virtual:nativesdk:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly/build/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb 
RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'kconfig-frontends-nativesdk'
NOTE: Runtime target 'kconfig-frontends-nativesdk' is unbuildable, 
removing...
Missing or unbuildable dependency chain was: ['kconfig-frontends-nativesdk']

> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../kconfig-frontends/kconfig-frontends_3.4.bb     |   28 ++++++++++++++++++++
>   1 files changed, 28 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
>
> diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
> new file mode 100644
> index 0000000..d95d3e8
> --- /dev/null
> +++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
> @@ -0,0 +1,28 @@
> +# Copyright (C) 2012 Khem Raj<raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION = "The kconfig-frontends project aims at centralising \
> +the effort of keeping an up-to-date, out-of-tree, packaging of the \
> +kconfig infrastructure, ready for use by third-party projects. \
> +The kconfig-frontends package provides the kconfig parser, as well as all \
> +the frontends"
> +HOMEPAGE = "http://ymorin.is-a-geek.org/projects/kconfig-frontends"
> +LICENSE = "GPL-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=9b8cf60ff39767ff04b671fca8302408"
> +SECTION = "devel"
> +DEPENDS += "ncurses flex bison gperf"
> +PR = "r0"
> +PV = "3.4.0"
> +SPIN = "0"
> +SRC_URI = "http://ymorin.is-a-geek.org/download/${BPN}/${BPN}-${PV}-${SPIN}.tar.xz"
> +SRC_URI[md5sum] = "7eed0faf5a41d6dd0b2a886a440a972d"
> +SRC_URI[sha256sum] = "638006f3d1aefefdc1db3030a15b562cf3c89f2028b1cea0bf0f0629708802f2"
> +
> +S = "${WORKDIR}/${BPN}-${PV}-${SPIN}"
> +
> +inherit autotools
> +do_configure_prepend () {
> +	mkdir -p scripts/.autostuff/m4
> +}
> +EXTRA_OECONF += "--disable-gconf --disable-qconf"
> +BBCLASSEXTEND = "native nativesdk"


