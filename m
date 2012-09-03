Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T8YkM-00083j-SG
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 17:39:31 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2012 08:27:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,360,1344236400"; d="scan'208";a="217581211"
Received: from unknown (HELO [10.255.12.252]) ([10.255.12.252])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 08:27:09 -0700
Message-ID: <5044CC4C.50006@linux.intel.com>
Date: Mon, 03 Sep 2012 08:27:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
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
X-List-Received-Date: Mon, 03 Sep 2012 15:39:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2012 05:30 AM, Radu Moisan wrote:
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
Why are you removing the Upstream-Status?  Also you have 3 other patches 
that I have send you email about that are missing the Upstream-Status tag.

This is also missing a Signed-off-by: tag in the pkgconfig_fix.patch itself.

Sau!

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
>


