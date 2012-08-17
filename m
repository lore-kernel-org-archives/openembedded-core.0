Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2TuO-0000XA-2z
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 23:16:44 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Aug 2012 14:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="182138176"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by orsmga001.jf.intel.com with ESMTP; 17 Aug 2012 14:04:44 -0700
Message-ID: <502EB1EB.1080708@linux.intel.com>
Date: Fri, 17 Aug 2012 14:04:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1344884283.git.ross.burton@intel.com>
	<244fabf84610b1aaab6942b9096105922e69abdd.1344884283.git.ross.burton@intel.com>
In-Reply-To: <244fabf84610b1aaab6942b9096105922e69abdd.1344884283.git.ross.burton@intel.com>
Subject: Re: [PATCH 2/8] clutter: DOLT isn't used anymore
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
X-List-Received-Date: Fri, 17 Aug 2012 21:16:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2012 11:58 AM, Ross Burton wrote:
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb |    7 +------
>   meta/recipes-graphics/clutter/clutter-1.8_git.bb   |    7 +------
>   meta/recipes-graphics/clutter/cogl_git.bb          |    7 +------
>   3 files changed, 3 insertions(+), 18 deletions(-)
>
> diff --git a/meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb b/meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb
> index a370568..aceef96 100644
> --- a/meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb
> +++ b/meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb
> @@ -1,7 +1,7 @@
>   require recipes-graphics/clutter/clutter.inc
>   require recipes-graphics/clutter/clutter-package.inc
>
> -PR = "r1"
> +PR = "r2"
>
>   # We're API/ABI compatible and this may make things easier for layers
>   PROVIDES += "clutter-1.6"
> @@ -19,10 +19,5 @@ S = "${WORKDIR}/clutter-${PV}"
>
>   BASE_CONF += "--disable-introspection"
>
> -do_configure_prepend () {
> -	# Disable DOLT
> -	sed -i -e 's/^DOLT//' ${S}/configure.ac
> -}
> -
>   SRC_URI[md5sum] = "487f70f9b59e1328b47f1db4094ab662"
>   SRC_URI[sha256sum] = "0d567177facd6913ac9c894e230ae48933125f02354ef965bbbf0586f1f0df91"
> diff --git a/meta/recipes-graphics/clutter/clutter-1.8_git.bb b/meta/recipes-graphics/clutter/clutter-1.8_git.bb
> index 7d8bcb3..89d8026 100644
> --- a/meta/recipes-graphics/clutter/clutter-1.8_git.bb
> +++ b/meta/recipes-graphics/clutter/clutter-1.8_git.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>   # the 1.8.4 tag
>   SRCREV = "f2183fa8df3d173afbee09cc4230ab8f4e03f459"
>   PV = "1.8.4+git${SRCPV}"
> -PR = "r1"
> +PR = "r2"
>
>   DEFAULT_PREFERENCE = "-1"
>
> @@ -18,8 +18,3 @@ S = "${WORKDIR}/git"
>   BASE_CONF += "--disable-introspection"
>
>   AUTOTOOLS_AUXDIR = "${S}/build"
> -
> -do_configure_prepend () {
> -	# Disable DOLT
> -	sed -i -e 's/^DOLT//' ${S}/configure.ac
> -}
> diff --git a/meta/recipes-graphics/clutter/cogl_git.bb b/meta/recipes-graphics/clutter/cogl_git.bb
> index 682f931..a3e1903 100644
> --- a/meta/recipes-graphics/clutter/cogl_git.bb
> +++ b/meta/recipes-graphics/clutter/cogl_git.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>   # the 1.8.2 tag
>   SRCREV = "e398e374e2ff0e88bc1d63577a192f8ca04a1cb5"
>   PV = "1.8.2+git${SRCPV}"
> -PR = "r2"
> +PR = "r3"
>
>   DEFAULT_PREFERENCE = "-1"
>
> @@ -14,8 +14,3 @@ SRC_URI = "git://git.gnome.org/cogl;protocol=git;branch=master \
>   S = "${WORKDIR}/git"
>
>   AUTOTOOLS_AUXDIR = "${S}/build"
> -
> -do_configure_prepend () {
> -	# Disable DOLT
> -	sed -i -e 's/^DOLT//' ${S}/configure.ac
> -}
>

Merged this into OE-Core

Thanks
	Sau!



