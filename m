Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXcGS-0006cG-4q
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 19:55:56 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 May 2012 10:45:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="147416848"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by azsmga001.ch.intel.com with ESMTP; 24 May 2012 10:45:42 -0700
Message-ID: <4FBE73C6.4090500@linux.intel.com>
Date: Thu, 24 May 2012 10:45:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336934223-12734-1-git-send-email-cazfi74@gmail.com>
In-Reply-To: <1336934223-12734-1-git-send-email-cazfi74@gmail.com>
Subject: Re: [PATCH] jpeg: update to upstream version 8d
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
X-List-Received-Date: Thu, 24 May 2012 17:55:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/13/2012 11:37 AM, Marko Lindqvist wrote:
> * fix_for_automake_1.11.2.patch removed as issue resolved upstream
> * Have README as license file instead of several source files that just
>    refer to it
>
> Signed-off-by: Marko Lindqvist<cazfi74@gmail.com>
> ---
>   .../jpeg/jpeg-8c/fix_for_automake_1.11.2.patch     |   28 --------------------
>   .../{jpeg-8c =>  jpeg-8d}/debian-libjpeg7_7-1.diff  |    0
>   meta/recipes-core/jpeg/{jpeg_8c.bb =>  jpeg_8d.bb}  |   13 ++++-----
>   3 files changed, 5 insertions(+), 36 deletions(-)
>   delete mode 100644 meta/recipes-core/jpeg/jpeg-8c/fix_for_automake_1.11.2.patch
>   rename meta/recipes-core/jpeg/{jpeg-8c =>  jpeg-8d}/debian-libjpeg7_7-1.diff (100%)
>   rename meta/recipes-core/jpeg/{jpeg_8c.bb =>  jpeg_8d.bb} (74%)
>
> diff --git a/meta/recipes-core/jpeg/jpeg-8c/fix_for_automake_1.11.2.patch b/meta/recipes-core/jpeg/jpeg-8c/fix_for_automake_1.11.2.patch
> deleted file mode 100644
> index c0d7f3e..0000000
> --- a/meta/recipes-core/jpeg/jpeg-8c/fix_for_automake_1.11.2.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Upstream-Status: Pending
> -
> -The support for automatic de-ANSI-fication has been deprecated in
> -automake 1.11.2, and will be removed altogether in automake 1.12
> -
> -This avoids this error:
> -| configure.ac:24: automatic de-ANSI-fication support is deprecated
> -| autoreconf: automake failed with exit status: 1
> -| ERROR: autoreconf execution failed.
> -NOTE: package jpeg-native-8c-r2: task do_configure: Failed
> -
> -Signed-Off-By: Nitin A Kamble<nitin.a.kamble@intel.com>
> -2011/12/28
> -
> -
> -Index: jpeg-8c/configure.ac
> -===================================================================
> ---- jpeg-8c.orig/configure.ac
> -+++ jpeg-8c/configure.ac
> -@@ -21,7 +21,7 @@ AC_CANONICAL_TARGET
> -
> - # Initialize Automake
> - # Don't require all the GNU mandated files
> --AM_INIT_AUTOMAKE([-Wall -Werror ansi2knr no-dist foreign])
> -+AM_INIT_AUTOMAKE([-Wall -Werror no-dist foreign])
> -
> - # Make --enable-silent-rules the default.
> - # To get verbose build output you may configure
> diff --git a/meta/recipes-core/jpeg/jpeg-8c/debian-libjpeg7_7-1.diff b/meta/recipes-core/jpeg/jpeg-8d/debian-libjpeg7_7-1.diff
> similarity index 100%
> rename from meta/recipes-core/jpeg/jpeg-8c/debian-libjpeg7_7-1.diff
> rename to meta/recipes-core/jpeg/jpeg-8d/debian-libjpeg7_7-1.diff
> diff --git a/meta/recipes-core/jpeg/jpeg_8c.bb b/meta/recipes-core/jpeg/jpeg_8d.bb
> similarity index 74%
> rename from meta/recipes-core/jpeg/jpeg_8c.bb
> rename to meta/recipes-core/jpeg/jpeg_8d.bb
> index 6aeaeaa..61f1c2e 100644
> --- a/meta/recipes-core/jpeg/jpeg_8c.bb
> +++ b/meta/recipes-core/jpeg/jpeg_8d.bb
> @@ -4,23 +4,20 @@ HOMEPAGE = "http://www.ijg.org/"
>   BUGTRACKER = ""
>
>   LICENSE ="BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe21d \
> -                    file://jpeglib.h;endline=14;md5=22f1e0f8fc71f6f7563146d3b210dbe5 \
> -                    file://djpeg.c;endline=13;md5=ca89254925da06fef47e4b6468233432"
> +LIC_FILES_CHKSUM = "file://README;md5=4f46756b064c225fae088903300e5c98"
>
>   SECTION = "libs"
>
>   DEPENDS = "libtool-cross"
>   DEPENDS_virtclass-native = "libtool-native"
>
> -PR = "r3"
> +PR = "r0"
>
>   SRC_URI = "http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz \
> -	   file://debian-libjpeg7_7-1.diff \
> -           file://fix_for_automake_1.11.2.patch"
> +	   file://debian-libjpeg7_7-1.diff"
>
> -SRC_URI[md5sum] = "a2c10c04f396a9ce72894beb18b4e1f9"
> -SRC_URI[sha256sum] = "edfc0b3e004b2fe58ffeeec89f96e3a3c28972c46725ec127d01edf8a1cc7c9a"
> +SRC_URI[md5sum] = "52654eb3b2e60c35731ea8fc87f1bd29"
> +SRC_URI[sha256sum] = "00029b1473f0f0ea72fbca3230e8cb25797fbb27e58ae2e46bb8bf5a806fe0b3"
>
>   inherit autotools
>

Merged into OE-Core

Thanks
	Sau!


