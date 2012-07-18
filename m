Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrIOu-00069E-53
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 02:46:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jul 2012 17:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169612894"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 17 Jul 2012 17:34:38 -0700
Message-ID: <5006049E.40509@linux.intel.com>
Date: Tue, 17 Jul 2012 17:34:38 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342454838-31263-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1342454838-31263-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [RFC 1/2] glib: upgrade to 2.32.4
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
X-List-Received-Date: Wed, 18 Jul 2012 00:46:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/16/2012 09:07 AM, Martin Jansa wrote:
> * it's bugfix release, see http://ftp.gnome.org/pub/gnome/sources/glib/2.32/glib-2.32.4.news
>    for list of fixed bugs
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch |   11 +++++++----
>   .../{glib-2.0_2.32.3.bb => glib-2.0_2.32.4.bb}     |    5 ++---
>   2 files changed, 9 insertions(+), 7 deletions(-)
>   rename meta/recipes-core/glib-2.0/{glib-2.0_2.32.3.bb => glib-2.0_2.32.4.bb} (92%)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch b/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
> index 0149767..d310041 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
> @@ -1,9 +1,12 @@
> -From 0040842024725c0e74f84c1719ead6c79ba94aba Mon Sep 17 00:00:00 2001
> +From e1252cbf65001487ff3b94bbc141acacf6e528b6 Mon Sep 17 00:00:00 2001
>   From: Martin Jansa <Martin.Jansa@gmail.com>
>   Date: Wed, 16 May 2012 20:03:34 +0200
>   Subject: [PATCH] configure: add option to disable libelf support
>
> -Upstream-Status: Pending
> +Upstream-Status: Backport
> +Applied in master
> +http://git.gnome.org/browse/glib/commit/?id=9e1d4da14d8e69fb60da1a9733ac1d58d0dcd8b2
> +can be dropped when upgrading to 2.34.* or newer
>
>   Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>   ---
> @@ -11,7 +14,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>    1 files changed, 4 insertions(+), 0 deletions(-)
>
>   diff --git a/configure.ac b/configure.ac
> -index aa65648..1bb49bf 100644
> +index ed4c10e..210df90 100644
>   --- a/configure.ac
>   +++ b/configure.ac
>   @@ -1815,6 +1815,9 @@ AC_SUBST(XATTR_LIBS)
> @@ -22,7 +25,7 @@ index aa65648..1bb49bf 100644
>   +              AC_HELP_STRING([--disable-libelf], [build without libelf support]))
>   +if test "x$enable_libelf" != "xno"; then
>
> - PKG_CHECK_MODULES([LIBELF], [libelf], [have_libelf=yes], [have_libelf=maybe])
> + PKG_CHECK_MODULES([LIBELF], [libelf >= 0.8.12], [have_libelf=yes], [have_libelf=maybe])
>
>   @@ -1835,6 +1838,7 @@ fi
>    if test $have_libelf = yes; then
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
> similarity index 92%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
> index 08aa897..fca5f8d 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
> @@ -1,6 +1,5 @@
>   require glib.inc
>
> -PR = "r2"
>   PE = "1"
>
>   DEPENDS += "libffi python-argparse-native zlib"
> @@ -16,8 +15,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>              file://nodbus.patch \
>              file://nolibelf.patch \
>             "
> -SRC_URI[md5sum] = "9bd3ac535c24b6c162be13b2c43c5adc"
> -SRC_URI[sha256sum] = "b65ceb462807e4a2f91c95e4293ce6bbefca308cb44a1407bcfdd9e40363ff4d"
> +SRC_URI[md5sum] = "bf84fefd9c1a5b5a7a38736f4ddd674a"
> +SRC_URI[sha256sum] = "a5d742a4fda22fb6975a8c0cfcd2499dd1c809b8afd4ef709bda4d11b167fae2"
>
>   SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
>   BBCLASSEXTEND = "native nativesdk"
>

This patch set was merged into OE-Core, but it appears to cause a 
problem with the gdbus-codegen getting auto-tools substitution with the 
wrong PYTHON.

It seems to be getting the native sysroot python instead of the more 
correct "#! /usr/bin/env python", this is causing a dependency failure.

If you could look at this please.

Thanks
	Sau!


