Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1F59C70101
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 21:55:04 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2017 13:55:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,265,1486454400"; d="scan'208";a="233894920"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by fmsmga004.fm.intel.com with ESMTP; 08 Mar 2017 13:55:05 -0800
Message-ID: <1489010552.3261.35.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: liu.ming50@gmail.com
Date: Wed, 08 Mar 2017 16:02:32 -0600
In-Reply-To: <1488982634-24222-1-git-send-email-liu.ming50@gmail.com>
References: <1488982634-24222-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Do not append to BBCLASSEXTEND
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
X-List-Received-Date: Wed, 08 Mar 2017 21:55:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi

you need to send a v2 revision, following the shortlog format

* Patch            Do not append to BBCLASSEXTEND
 Issue             Shortlog does not follow expected format [test_shortlog_format] 
  Suggested fix    Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"



On Wed, 2017-03-08 at 15:17 +0100, liu.ming50@gmail.com wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
> 
> Replace some "+=/=+" with "=" when setting BBCLASSEXTEND, they are
> redundant and inconsistent with the same setting in other recipes.
> 
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/recipes-devtools/build-compare/build-compare_git.bb         | 2 +-
>  meta/recipes-extended/libsolv/libsolv_0.6.24.bb                  | 2 +-
>  meta/recipes-extended/lzip/lzip_1.18.bb                          | 2 +-
>  meta/recipes-extended/wget/wget.inc                              | 2 +-
>  meta/recipes-support/ca-certificates/ca-certificates_20161130.bb | 2 +-
>  meta/recipes-support/lz4/lz4.bb                                  | 2 +-
>  meta/recipes-support/lzop/lzop_1.03.bb                           | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
> index e432143..eb12e40 100644
> --- a/meta/recipes-devtools/build-compare/build-compare_git.bb
> +++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
> @@ -22,7 +22,7 @@ PV = "git+${SRCPV}"
>  
>  S = "${WORKDIR}/git"
>  
> -BBCLASSEXTEND += "native nativesdk"
> +BBCLASSEXTEND = "native nativesdk"
>  
>  do_install() {
>      install -d ${D}/${bindir}
> diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.24.bb b/meta/recipes-extended/libsolv/libsolv_0.6.24.bb
> index 6de38b5..73db5ed 100644
> --- a/meta/recipes-extended/libsolv/libsolv_0.6.24.bb
> +++ b/meta/recipes-extended/libsolv/libsolv_0.6.24.bb
> @@ -27,4 +27,4 @@ FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibSolv.cmake"
>  FILES_${PN}-tools = "${bindir}/*"
>  FILES_${PN}ext = "${libdir}/${PN}ext.so.*"
>  
> -BBCLASSEXTEND =+ "native nativesdk"
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-extended/lzip/lzip_1.18.bb b/meta/recipes-extended/lzip/lzip_1.18.bb
> index 30c7dd5..c1dc8ce 100644
> --- a/meta/recipes-extended/lzip/lzip_1.18.bb
> +++ b/meta/recipes-extended/lzip/lzip_1.18.bb
> @@ -38,4 +38,4 @@ do_install () {
>      fi
>  }
>  
> -BBCLASSEXTEND += "native nativesdk"
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
> index 9eb051f..1299edb 100644
> --- a/meta/recipes-extended/wget/wget.inc
> +++ b/meta/recipes-extended/wget/wget.inc
> @@ -16,7 +16,7 @@ ALTERNATIVE_PRIORITY = "100"
>  
>  RRECOMMENDS_${PN} += "ca-certificates"
>  
> -BBCLASSEXTEND += "nativesdk"
> +BBCLASSEXTEND = "nativesdk"
>  
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>  PACKAGECONFIG[libuuid] = "--with-libuuid, --without-libuuid,util-linux"
> diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
> index e47bad1..42088b9 100644
> --- a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
> +++ b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
> @@ -80,4 +80,4 @@ do_install_append_class-native () {
>  
>  RDEPENDS_${PN} += "openssl"
>  
> -BBCLASSEXTEND += "native nativesdk"
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-support/lz4/lz4.bb b/meta/recipes-support/lz4/lz4.bb
> index 18e56d0..03c5a7a 100644
> --- a/meta/recipes-support/lz4/lz4.bb
> +++ b/meta/recipes-support/lz4/lz4.bb
> @@ -18,4 +18,4 @@ do_install() {
>  	oe_runmake install
>  }
>  
> -BBCLASSEXTEND += "native nativesdk"
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-support/lzop/lzop_1.03.bb b/meta/recipes-support/lzop/lzop_1.03.bb
> index 649e724..6f09002 100644
> --- a/meta/recipes-support/lzop/lzop_1.03.bb
> +++ b/meta/recipes-support/lzop/lzop_1.03.bb
> @@ -26,4 +26,4 @@ do_configure_prepend () {
>      install -Dm 0644 ${WORKDIR}/acinclude.m4 ${S}/acinclude.m4
>  }
>  
> -BBCLASSEXTEND += "native nativesdk"
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 1.9.1
> 



