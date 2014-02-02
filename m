Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D76B16EC03
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Feb 2014 11:47:13 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s12Bl1Db015785; Sun, 2 Feb 2014 11:47:02 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IZRccwDB4-0j; Sun,  2 Feb 2014 11:47:01 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s12BkuEB015782
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sun, 2 Feb 2014 11:46:57 GMT
Message-ID: <1391341610.28575.150.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>
Date: Sun, 02 Feb 2014 11:46:50 +0000
In-Reply-To: <1391082719-14432-2-git-send-email-ross.burton@intel.com>
References: <1391082719-14432-1-git-send-email-ross.burton@intel.com>
	<1391082719-14432-2-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] gnome-desktop-testing: upgrade to current git master
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
X-List-Received-Date: Sun, 02 Feb 2014 11:47:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-01-30 at 11:51 +0000, Ross Burton wrote:
> no-introspection.patch has been merged upstream.
> 
> Update license checksum as copyright dates have been updated.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../files/no-introspection.patch                    |   19 -------------------
>  ...sting_2013.1.bb => gnome-desktop-testing_git.bb} |   12 +++++++-----
>  2 files changed, 7 insertions(+), 24 deletions(-)
>  delete mode 100644 meta/recipes-support/gnome-desktop-testing/files/no-introspection.patch
>  rename meta/recipes-support/gnome-desktop-testing/{gnome-desktop-testing_2013.1.bb => gnome-desktop-testing_git.bb} (60%)
> 
> diff --git a/meta/recipes-support/gnome-desktop-testing/files/no-introspection.patch b/meta/recipes-support/gnome-desktop-testing/files/no-introspection.patch
> deleted file mode 100644
> index 67b64f2..0000000
> --- a/meta/recipes-support/gnome-desktop-testing/files/no-introspection.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Introspection is a hard requirement to build gnome-desktop-testing upstream, but
> -it isn't needed anymore.
> -
> -Upstream-Status: Submitted
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -diff --git a/configure.ac b/configure.ac
> -index 7460c69..6249caf 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -27,8 +27,6 @@ AC_SUBST(WARN_CFLAGS)
> - LT_PREREQ([2.2.4])
> - LT_INIT([disable-static])
> - 
> --GOBJECT_INTROSPECTION_REQUIRE([1.34.0])
> --
> - PKG_CHECK_MODULES(GIO_UNIX, [gio-unix-2.0 >= 2.34.0])
> - GIO_UNIX_CFLAGS="$GIO_UNIX_CFLAGS -DGLIB_VERSION_MIN_REQUIRED=GLIB_VERSION_2_36 -DGLIB_VERSION_MAX_ALLOWED=GLIB_VERSION_2_36"
> - 
> diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2013.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_git.bb
> similarity index 60%
> rename from meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2013.1.bb
> rename to meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_git.bb
> index 36e13b1..be43d98 100644
> --- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2013.1.bb
> +++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_git.bb
> @@ -2,13 +2,15 @@ SUMMARY = "Test runner for GNOME-style installed tests"
>  HOMEPAGE = "https://wiki.gnome.org/GnomeGoals/InstalledTests"
>  LICENSE = "LGPLv2+"
>  
> -SRC_URI = "${GNOME_MIRROR}/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
> -           file://no-introspection.patch"
> -SRC_URI[md5sum] = "c6824f7bfac95bf0fcf6ed0c255979c1"
> -SRC_URI[sha256sum] = "632e7224de8614a8e4b7cdf87fc32551531efa9290fba0da4dae56234c584b7b"
> +SRCREV = "fbec635575013b22ed5aa853e725448057ac54bc"
> +PV = "2013.1+git${SRCPV}"
> +
> +SRC_URI = "gitsm://git.gnome.org/${PN}"
> +
> +S = "${WORKDIR}/git"

Its rather sad to need the gitsm fetcher. That fetcher isn't mirror safe
so I'm not sure we can use it.

Regardless, this blows up on multilib builds due to PN instead of BPN.

Cheers,

Richard


 



