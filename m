Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2P53-0001T2-8I
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 18:07:25 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Aug 2012 08:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="135445313"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Aug 2012 08:55:25 -0700
Message-ID: <502E696C.8050304@linux.intel.com>
Date: Fri, 17 Aug 2012 08:55:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1345208727-3029-1-git-send-email-radu.moisan@intel.com>
In-Reply-To: <1345208727-3029-1-git-send-email-radu.moisan@intel.com>
Subject: Re: [PATCH][RFC] coreutils: Upgrade to upstream version 8.17
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
X-List-Received-Date: Fri, 17 Aug 2012 16:07:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2012 06:05 AM, Radu Moisan wrote:
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>   .../coreutils-8.17/realpath-works-yes.patch        |   13 +++++++++++++
>   .../remove-gets.patch                              |   20 +++++++++++---------
>   .../remove-usr-local-lib-from-m4.patch             |    0
>   .../{coreutils_8.14.bb => coreutils_8.17.bb}       |    9 +++++----
>   4 files changed, 29 insertions(+), 13 deletions(-)
>   create mode 100644 meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
>   rename meta/recipes-core/coreutils/{coreutils-8.14 => coreutils-8.17}/remove-gets.patch (47%)
>   rename meta/recipes-core/coreutils/{coreutils-8.14 => coreutils-8.17}/remove-usr-local-lib-from-m4.patch (100%)
>   rename meta/recipes-core/coreutils/{coreutils_8.14.bb => coreutils_8.17.bb} (91%)
>
> diff --git a/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
> new file mode 100644
> index 0000000..6bbe7ee
> --- /dev/null
> +++ b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch

Your new patch needs a header, explaining why, and adding 
Upstream-Status and Signed-off-by tags.

Sau!

> @@ -0,0 +1,13 @@
> +Index: coreutils-8.17/m4/canonicalize.m4
> +===================================================================
> +--- coreutils-8.17.orig/m4/canonicalize.m4	2012-05-08 12:05:23.000000000 +0300
> ++++ coreutils-8.17/m4/canonicalize.m4	2012-08-17 14:20:22.000000000 +0300
> +@@ -95,7 +95,7 @@
> +      [gl_cv_func_realpath_works=no],
> +      [case "$host_os" in
> +                 # Guess yes on glibc systems.
> +-        *-gnu*) gl_cv_func_realpath_works="guessing yes" ;;
> ++        *-gnu*) gl_cv_func_realpath_works="yes" ;;
> +                 # If we don't know, assume the worst.
> +         *)      gl_cv_func_realpath_works="guessing no" ;;
> +       esac
> diff --git a/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch b/meta/recipes-core/coreutils/coreutils-8.17/remove-gets.patch
> similarity index 47%
> rename from meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
> rename to meta/recipes-core/coreutils/coreutils-8.17/remove-gets.patch
> index 4f61c92..eaadf7e 100644
> --- a/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
> +++ b/meta/recipes-core/coreutils/coreutils-8.17/remove-gets.patch
> @@ -3,19 +3,21 @@ use gets iff its defined. eglibc 2.16 removed gets
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   Upstream-Status: Pending
>
> -Index: coreutils-8.14/lib/stdio.in.h
> +Index: coreutils-8.17/lib/stdio.in.h
>   ===================================================================
> ---- coreutils-8.14.orig/lib/stdio.in.h	2011-09-24 04:20:48.000000000 -0700
> -+++ coreutils-8.14/lib/stdio.in.h	2012-07-03 10:36:19.886296576 -0700
> -@@ -713,11 +713,13 @@
> - _GL_CXXALIAS_SYS (gets, char *, (char *s));
> - #  undef gets
> +--- coreutils-8.17.orig/lib/stdio.in.h
> ++++ coreutils-8.17/lib/stdio.in.h
> +@@ -698,13 +698,14 @@ _GL_WARN_ON_USE (getline, "getline is un
> +                  "use gnulib module getline for portability");
>    # endif
> + #endif
> +-
>   +# if defined gets
> - _GL_CXXALIASWARN (gets);
>    /* It is very rare that the developer ever has full control of stdin,
> -    so any use of gets warrants an unconditional warning.  Assume it is
> -    always declared, since it is required by C89.  */
> +    so any use of gets warrants an unconditional warning; besides, C11
> +    removed it.  */
> + #undef gets
> + #if HAVE_RAW_DECL_GETS
>    _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
>   +# endif
>    #endif
> diff --git a/meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils-8.17/remove-usr-local-lib-from-m4.patch
> similarity index 100%
> rename from meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-lib-from-m4.patch
> rename to meta/recipes-core/coreutils/coreutils-8.17/remove-usr-local-lib-from-m4.patch
> diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.17.bb
> similarity index 91%
> rename from meta/recipes-core/coreutils/coreutils_8.14.bb
> rename to meta/recipes-core/coreutils/coreutils_8.17.bb
> index 9a714a9..9d8170e 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.14.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.17.bb
> @@ -6,8 +6,8 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
>   BUGTRACKER = "http://debbugs.gnu.org/coreutils"
>   LICENSE = "GPLv3+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
> -                    file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
> -PR = "r5"
> +                    file://src/ls.c;startline=5;endline=16;md5=30c84fd2942cad91041e5e2dcd19ced6"
> +PR = "r0"
>   DEPENDS = "gmp libcap"
>   DEPENDS_virtclass-native = ""
>
> @@ -16,9 +16,10 @@ inherit autotools gettext
>   SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>              file://remove-usr-local-lib-from-m4.patch \
>              file://remove-gets.patch \
> +           file://realpath-works-yes.patch \
>             "
> -SRC_URI[md5sum] = "bcb135ce553493a45aba01b39eb3920a"
> -SRC_URI[sha256sum] = "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb116cf82b65d18b02d"
> +SRC_URI[md5sum] = "bbda656ce8ca2c6903948f9faa204ba3"
> +SRC_URI[sha256sum] = "4e075a0d238072a5bd079046e1f024dc5e0d9133d43a39c73d0b86b0d1e2c5e5"
>
>   EXTRA_OECONF_virtclass-native = "--without-gmp"
>
>


