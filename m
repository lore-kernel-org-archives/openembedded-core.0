Return-Path: <saul.wold@intel.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 65B126B9C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 16:19:52 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id x10so865802pdj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 09:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:message-id:date:from:organization:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=d8J1R7n7GUiLPIeDmTeJyHVyoTBg2wY2o2yUiGgrThk=;
	b=QfhiVSfjys4w/EeG5LgyrhZb++xgQlUZt9Cpi3eL1L3p66DwvU4sDkwIdCLRzP9OYU
	v+ciFsT9213Le6Srlqp57fN55eeDKPJvQmzTHtq/8gUSvcKUOl0Ya/+EsTHebq6PBohU
	/LUQXysXQL4QvYYLRYgEhiuA0gkUTUcDjJnVRoBJ3uJ2hxqWETmQLpCUgykV3eoVTRqo
	XuqUjcMM1s5ibyoihBOZAAv632zOVJGo2QDDvqi0eGlYrU/QWB5eZda1QcI/x0AC00RM
	SU8cPySEF/P41VNf9CQEMNRnsfXaCtDXkuR7wmoTlegS9az9//6Szrj1ne4Uh2oL+ewT
	5I1A==
X-Gm-Message-State: ALoCoQkko8aL5YdFLLLcGBKzcIRwDiFXpnLgwVa/CsltwzB437lLZ9aBSURNoXdGqMB+pIf1ojSN
X-Received: by 10.66.219.41 with SMTP id pl9mr2422138pac.187.1377274793204;
	Fri, 23 Aug 2013 09:19:53 -0700 (PDT)
Received: from [10.6.18.24] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPSA id xs1sm2003404pac.7.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 09:19:52 -0700 (PDT)
Message-ID: <52178BA7.2020107@intel.com>
Date: Fri, 23 Aug 2013 09:19:51 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
References: <fdbdadc72d3c6c1ef1feb0602d9f16dce3645a33.1377207091.git.cazfi74@gmail.com>
	<fa107ce2393b834fd74c353526e98e9edcac0a85.1377207091.git.cazfi74@gmail.com>
In-Reply-To: <fa107ce2393b834fd74c353526e98e9edcac0a85.1377207091.git.cazfi74@gmail.com>
Subject: Re: [PATCH 2/2] automake: update to upstream version 1.13.4
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
X-List-Received-Date: Fri, 23 Aug 2013 16:19:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2013 02:37 PM, Marko Lindqvist wrote:
> prefer-cpio-over-pax-for-ustar-archives.patch updated to apply
>
> Signed-off-by: Marko Lindqvist <cazfi74-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   .../prefer-cpio-over-pax-for-ustar-archives.patch  |   37 ++++++++++----------
>   .../{automake_1.12.6.bb => automake_1.13.4.bb}     |    6 ++--
>   2 files changed, 21 insertions(+), 22 deletions(-)
>   rename meta/recipes-devtools/automake/{automake_1.12.6.bb => automake_1.13.4.bb} (90%)
>
> diff --git a/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch b/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
> index 4627855..6558a00 100644
> --- a/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
> +++ b/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
> @@ -19,24 +19,13 @@ Updated for version 1.11.3:
>   Signed-off-by: Nitin A Kamble <nitin.a.kamble-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>   Date: 2011/03/14
>
> -Index: automake-1.11.3/m4/tar.m4
> -===================================================================
> ---- automake-1.11.3.orig/m4/tar.m4	2012-01-31 03:41:18.000000000 -0800
> -+++ automake-1.11.3/m4/tar.m4	2012-03-14 17:36:11.901303777 -0700
> -@@ -31,7 +31,7 @@ m4_if([$1], [v7],
> -               [m4_fatal([Unknown tar format])])
> - AC_MSG_CHECKING([how to create a $1 tar archive])
> - # Loop over all known methods to create a tar archive until one works.
> --_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) pax cpio none'
> -+_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) cpio pax none'
> - _am_tools=${am_cv_prog_tar_$1-$_am_tools}
> - # Do not fold the above two line into one, because Tru64 sh and
> - # Solaris sh will not grok spaces in the rhs of `-'.
> -Index: automake-1.11.3/Makefile.in
> -===================================================================
> ---- automake-1.11.3.orig/Makefile.in	2012-02-01 02:37:59.000000000 -0800
> -+++ automake-1.11.3/Makefile.in	2012-03-14 17:38:03.530869197 -0700
> -@@ -62,7 +62,7 @@ am__aclocal_m4_deps = $(top_srcdir)/m4/a
> +Updated for version 1.13.2:
> +Signed-off-by: Marko Lindqvist <cazfi74-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +
> +diff -Nurd automake-1.13.2/Makefile.in automake-1.13.2/Makefile.in
> +--- automake-1.13.2/Makefile.in	2013-05-15 23:12:58.000000000 +0300
> ++++ automake-1.13.2/Makefile.in	2013-05-23 02:13:41.364026301 +0300
> +@@ -141,7 +141,7 @@
>    	$(top_srcdir)/m4/options.m4 $(top_srcdir)/m4/runlog.m4 \
>    	$(top_srcdir)/m4/sanity.m4 $(top_srcdir)/m4/silent.m4 \
>    	$(top_srcdir)/m4/strip.m4 $(top_srcdir)/m4/substnot.m4 \
> @@ -45,3 +34,15 @@ Index: automake-1.11.3/Makefile.in
>    am__configure_deps = $(am__aclocal_m4_deps) $(CONFIGURE_DEPENDENCIES) \
>    	$(ACLOCAL_M4)
>    am__CONFIG_DISTCLEAN_FILES = config.status config.cache config.log \
> +diff -Nurd automake-1.13.2/m4/tar.m4 automake-1.13.2/m4/tar.m4
> +--- automake-1.13.2/m4/tar.m4	2013-05-13 23:12:48.000000000 +0300
> ++++ automake-1.13.2/m4/tar.m4	2013-05-23 02:13:26.600025805 +0300
> +@@ -26,7 +26,7 @@
> + AC_SUBST([AMTAR], ['$${TAR-tar}'])
> +
> + # We'll loop over all known methods to create a tar archive until one works.
> +-_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) pax cpio none'
> ++_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) cpio pax none'
> +
> + m4_if([$1], [v7],
> +   [am__tar='$${TAR-tar} chof - "$$tardir"' am__untar='$${TAR-tar} xf -'],
> diff --git a/meta/recipes-devtools/automake/automake_1.12.6.bb b/meta/recipes-devtools/automake/automake_1.13.4.bb
> similarity index 90%
> rename from meta/recipes-devtools/automake/automake_1.12.6.bb
> rename to meta/recipes-devtools/automake/automake_1.13.4.bb
> index 549051b..e3db834 100644
> --- a/meta/recipes-devtools/automake/automake_1.12.6.bb
> +++ b/meta/recipes-devtools/automake/automake_1.13.4.bb
> @@ -26,10 +26,8 @@ SRC_URI += "${PATHFIXPATCH} \
>               file://py-compile-compile-only-optimized-byte-code.patch \
>               file://buildtest.patch"
>
> -SRC_URI[md5sum] = "199d39ece2e6070d64ac20d45ac86026"
> -SRC_URI[sha256sum] = "0cbe570db487908e70af7119da85ba04f7e28656b26f717df0265ae08defd9ef"
> -
> -PR = "r0"
> +SRC_URI[md5sum] = "9199e266993a5bbdc914923349d51e3e"
> +SRC_URI[sha256sum] = "4c93abc0bff54b296f41f92dd3aa1e73e554265a6f719df465574983ef6f878c"
>
>   do_install_append () {
>       install -d ${D}${datadir}
>
Seems this update might have a perl script that is hard coded and will 
need to be worked on.  This occurs with a toolchain build:
bitbake core-image-sato -c populate_sdk

| Computing transaction...error: Can't install 
nativesdk-automake-1.13.4-r0@x86_64_nativesdk: no package provides /bin/perl
|

Sau!



