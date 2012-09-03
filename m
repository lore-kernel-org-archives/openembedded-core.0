Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1T8SVD-0004uS-2O
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 10:59:27 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Sep 2012 01:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="188308695"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by orsmga001.jf.intel.com with ESMTP; 03 Sep 2012 01:47:05 -0700
Message-ID: <50446F2D.4020707@intel.com>
Date: Mon, 03 Sep 2012 11:49:49 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344429053-2858-1-git-send-email-radu.moisan@intel.com>
In-Reply-To: <1344429053-2858-1-git-send-email-radu.moisan@intel.com>
Subject: Re: [PATCH] curl: update to upstream version 7.27.0
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
X-List-Received-Date: Mon, 03 Sep 2012 08:59:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

What's the status of this patch? is it going to be merged?

radu

On 08/08/2012 03:30 PM, Radu Moisan wrote:
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>   meta/recipes-support/curl/curl/pkgconfig_fix.patch |   25 +++++++++-----------
>   .../curl/{curl_7.26.0.bb => curl_7.27.0.bb}        |    4 ++--
>   2 files changed, 13 insertions(+), 16 deletions(-)
>   rename meta/recipes-support/curl/{curl_7.26.0.bb => curl_7.27.0.bb} (92%)
>
> diff --git a/meta/recipes-support/curl/curl/pkgconfig_fix.patch b/meta/recipes-support/curl/curl/pkgconfig_fix.patch
> index ad73c00..5eb8ce2 100644
> --- a/meta/recipes-support/curl/curl/pkgconfig_fix.patch
> +++ b/meta/recipes-support/curl/curl/pkgconfig_fix.patch
> @@ -1,11 +1,8 @@
> -Upstream-Status: Inappropriate [packaging]
> -
> -
> -Index: curl-7.20.0/libcurl.pc.in
> +Index: curl-7.27.0/libcurl.pc.in
>   ===================================================================
> ---- curl-7.20.0.orig/libcurl.pc.in	2009-11-17 18:11:07.000000000 +0000
> -+++ curl-7.20.0/libcurl.pc.in	2010-03-25 12:13:26.814051066 +0000
> -@@ -35,6 +35,7 @@
> +--- curl-7.27.0.orig/libcurl.pc.in	2012-05-26 00:56:17.000000000 +0300
> ++++ curl-7.27.0/libcurl.pc.in	2012-08-08 11:30:41.000000000 +0300
> +@@ -34,6 +34,7 @@
>    URL: http://curl.haxx.se/
>    Description: Library to transfer files with ftp, http, etc.
>    Version: @CURLVERSION@
> @@ -14,12 +11,12 @@ Index: curl-7.20.0/libcurl.pc.in
>   +Requires.private: @GNUTLS_REQUIRED@
>   +Libs: -L${libdir} -lcurl
>   +Libs.private: -ldl -lz
> - Cflags: -I${includedir}
> -Index: curl-7.20.0/configure.ac
> + Cflags: -I${includedir} @CPPFLAG_CURL_STATICLIB@
> +Index: curl-7.27.0/configure.ac
>   ===================================================================
> ---- curl-7.20.0.orig/configure.ac	2010-02-04 21:41:46.000000000 +0000
> -+++ curl-7.20.0/configure.ac	2010-03-25 12:12:18.673129001 +0000
> -@@ -1668,6 +1668,7 @@
> +--- curl-7.27.0.orig/configure.ac	2012-07-27 21:25:09.000000000 +0300
> ++++ curl-7.27.0/configure.ac	2012-08-08 11:45:06.000000000 +0300
> +@@ -1863,6 +1863,7 @@
>           AC_SUBST(USE_GNUTLS, [1])
>           GNUTLS_ENABLED=1
>           USE_GNUTLS="yes"
> @@ -27,9 +24,9 @@ Index: curl-7.20.0/configure.ac
>           curl_ssl_msg="enabled (GnuTLS)"
>           ],
>           [
> -@@ -1696,6 +1697,8 @@
> +@@ -2102,6 +2103,8 @@
>    
> - fi dnl OPENSSL != 1
> + fi
>    
>   +AC_SUBST(GNUTLS_REQUIRED)
>   +
> diff --git a/meta/recipes-support/curl/curl_7.26.0.bb b/meta/recipes-support/curl/curl_7.27.0.bb
> similarity index 92%
> rename from meta/recipes-support/curl/curl_7.26.0.bb
> rename to meta/recipes-support/curl/curl_7.27.0.bb
> index f04b400..fe423c7 100644
> --- a/meta/recipes-support/curl/curl_7.26.0.bb
> +++ b/meta/recipes-support/curl/curl_7.27.0.bb
> @@ -13,8 +13,8 @@ PR = "r0"
>   SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>              file://pkgconfig_fix.patch"
>   
> -SRC_URI[md5sum] = "bfa80f01b3d300359cfb4d409b6136a3"
> -SRC_URI[sha256sum] = "fced262f16eb6bfcdcea15e04a7905ffcb5ff04b14a19ca35b9df86d6720d26a"
> +SRC_URI[md5sum] = "11fcbfc0de9c12512e607e7d72d500a0"
> +SRC_URI[sha256sum] = "aba5582135c28470b46084da9747470c1c680485fc91f9f0d3f7928df8169398"
>   
>   inherit autotools pkgconfig binconfig
>   



