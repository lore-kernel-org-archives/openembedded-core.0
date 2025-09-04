Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC0BCA1013
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 19:10:50 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.3173.1757013040614661587
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 12:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dEp/Np4L;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so229303166b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 12:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757013039; x=1757617839; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wl0541J2BQHKAwuCqu976E6j3D/nesQaV9GeMGoh0mA=;
        b=dEp/Np4LSzDK2q+ZO/oYkwf0W4hozf1NgIljNJjeyMFtm0fl9Kou4bjd7wZI5jcHsE
         8n6Ze65gMbOFrSToT4CFMrQU4HrrHWZcd+08JvX2dt/7aJa+5wTr/fAsk5GNDvRQVtDP
         1rgckw+IOqHcMS1qSfTp4NVf+kgE31drMXeQ8Ieh8L5uL0vg73Z8tYHP564e9wgxUnmF
         JLR/bz80X/Hs3x/q41pD/vqZGh1kAm+PCfHas0hw+V6oP9xLL+IoctMuoK4/lDlH8Gzn
         7VSY5qxZHBrkKguryon2ubUVxh+DgRVbpMJHwc/lDIe+fjanS49eEVqWthkcnULtaJlS
         fHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757013039; x=1757617839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wl0541J2BQHKAwuCqu976E6j3D/nesQaV9GeMGoh0mA=;
        b=iIZk5aM7lW4ZYH+NpAfIfaQn4TG4fLd5JPFpS0ryVBG1GDcNkvZ45BbAdAgrhKbRBz
         8a2d8f9YpndKrhIgJK3Zy8YMoq56LlIqimbkwE4M8SbV8hL9B4WbhLmP9MGuGjOqbFEq
         Qtmp8ixPZ2lNs7clYMqTTxkMNhGHbTC4/zsRyQoV7IsT+d4NQth6tlZFCsQpTEsonoG9
         Bjqy8Zdb7YRbVIc1lQ40KB5IFfxKs48AMS/hPDvKvd3YckcOJl8eZFT58bLBFZALQs3q
         2a6yKsYJYMlJzRCIegEJrF2Al4yK//iiFcP2bxgCpWzAXhppN7AdOeAM2yaAf7ukMnGF
         D3ZQ==
X-Gm-Message-State: AOJu0YyLJlb7ZNmnYW6x8X6l1C0+kxa1s8X+L70C8yELTx4py69p8UK7
	AZhXv2FKMXnl/29ZoPaj19UWojsXGjm6mxVdZVY/CXnCPI9M5KC6qf+wvRmxzWnR
X-Gm-Gg: ASbGncu7ukvEBWlmNbLVX8PFp/kgo53/yKgAtbtHdGkmdbYpqEHhWGUDHBJ3qxiKdW5
	8JYNCI/H5cLhlfQgsG9Dg52O7MDIidNLUQ7nPTeUHCQOZNDHQjN0RNQ+bFwn5UjA2T5fmTpbDhh
	CpAgpAh/LGrph8W3mxhfHLrL9pQkJ1lF6NxB2ACZINA9y4lyEfdi205C/8EiHOrQWsQb1u5LQZf
	TxiVd9vdcdMAWfC+VyJzManjgKVJ1oax4qVCgwyeEX+MvnuQq4oFVufkEToxG3c4w2P+6A8YFIw
	C0OvNtsjpGdjR93K8QlWpz0LoZq2wBHgTZOfc+ZO37XBo9iv9011CN4iUCZxpJ2gqJrdBl71zZb
	A/ReCDgdRHhjVjXeG21TtMcjjzY32v66NiGXfjZ3dQA==
X-Google-Smtp-Source: AGHT+IF2k/GO8BekLaQ06HMdPJrr7kXUErpCPZXSqOK3mAzXP1WgU67/kdA/kRbM18rP0NX2Ewy5ug==
X-Received: by 2002:a17:907:3f9e:b0:b04:33a1:7f14 with SMTP id a640c23a62f3a-b0433a1864dmr1316453466b.35.1757013038572;
        Thu, 04 Sep 2025 12:10:38 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff173ddc78sm1450816966b.33.2025.09.04.12.10.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 12:10:38 -0700 (PDT)
Message-ID: <03abf8f0-89f7-41b4-9fe6-81072b2e6d87@gmail.com>
Date: Thu, 4 Sep 2025 21:10:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC] gettext, gettext-native-minimal: upgrade 0.23.1
 -> 0.26
To: openembedded-core@lists.openembedded.org
References: <186229F4B4DD4221.5335@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <186229F4B4DD4221.5335@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 19:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222969

This v1 rfc-patch is only reposted for review reasons, it seems it
wasn't captured by lore.
It has been superseded by v2, and this one shouldn't be tested.

On 9/4/25 21:08, Gyorgy Sarvari via lists.openembedded.org wrote:
> From: "Gyorgy Sarvari via lists.openembedded.org" <skandigraun=gmail.com@lists.openembedded.org>
>
> Changelog:
> 0.24: https://lists.gnu.org/archive/html/info-gnu/2025-02/msg00010.html
> 0.25: https://lists.gnu.org/archive/html/info-gnu/2025-05/msg00000.html
> 0.26: https://lists.gnu.org/archive/html/info-gnu/2025-07/msg00007.html
>
> - gettext-minimal-native recipe adapted to the new macro name (aclocal_DATA -> macros_DATA)
> - install Makevars.template to gettext-minimal-native to be able to update missing variables
>   The file is renamed in the desitanion to Makevars.template.minimal, to avoid clashing
>   with the full gettext package (some recipes have both as dependency).
> - autotools.bbclass: search for all po folders, and update the Makefile.in.in file
>   in each of them. This is required, because without this the old Makefile.in.in
>   files in these non ${S}/po folders are not updated with the new version of gettext, and
>   the compilation routinely fails due to this.
>   As part of the same change, also concatenate the source's Makevars files with the gettext
>   Makevars.template: this allows all variables to be defined, even the new ones that the
>   source didn't contain originally. First set the gettext template, and then append
>   the source's original Makevars to it, so it should override the variables that it was
>   setting originally, and keep the new variables at their default value.
> - Adding coreutils to ptest:RDEPENDS allows 3 additional tests to be executed (they need "fold" program)
>
> Ptest results:
>
> =======================
> All 626 tests passed
> (40 tests were not run)
> =======================
> DURATION: 36
> END: /usr/lib/gettext/ptest
> 2025-08-30T17:49
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> With the previous version:
> All 545 tests passed
> (34 tests were not run)
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> Cc: Ross Burton <ross.burton@arm.com>
>
> ---
>  meta/classes-recipe/autotools.bbclass         | 32 ++++++++++++++++---
>  ...23.1.bb => gettext-minimal-native_0.26.bb} |  4 ++-
>  meta/recipes-core/gettext/gettext-sources.inc |  5 ++-
>  ...01-tests-autopoint-3-unset-MAKEFLAGS.patch |  8 ++---
>  .../gettext/gettext/serial-tests-config.patch | 28 ++++++++--------
>  .../{gettext_0.23.1.bb => gettext_0.26.bb}    |  9 ++++--
>  6 files changed, 56 insertions(+), 30 deletions(-)
>  rename meta/recipes-core/gettext/{gettext-minimal-native_0.23.1.bb => gettext-minimal-native_0.26.bb} (87%)
>  rename meta/recipes-core/gettext/{gettext_0.23.1.bb => gettext_0.26.bb} (95%)
>
> diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/autotools.bbclass
> index 948f8c183a..0d83e68679 100644
> --- a/meta/classes-recipe/autotools.bbclass
> +++ b/meta/classes-recipe/autotools.bbclass
> @@ -186,13 +186,35 @@ autotools_do_configure() {
>  				echo "no" | glib-gettextize --force --copy
>  			fi
>  		elif [ "${BPN}" != "gettext" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
> -			# We'd call gettextize here if it wasn't so broken...
> +			# Gettextize could be called here, however it doesn't make the job much easier:
> +			# It doesn't discover relevant po folders on its own, so they still need to be
> +			# found by some heurestics. Also, it would require always the full gettext
> +			# package always, instead of gettext-minimal-native.
>  			cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
> -			if [ -d ${S}/po/ ]; then
> -				cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po/
> -				if [ ! -e ${S}/po/remove-potcdate.sed ]; then
> -					cp ${STAGING_DATADIR_NATIVE}/gettext/po/remove-potcdate.sed ${S}/po/
> +			if [ -d ${S}/po ]; then
> +				if [ -f ${S}/po/Makefile.in.in ]; then
> +					# search for all Makefile.in.in files that are identical to ./po/Makefile.in.in, by md5sum
> +					base_makefile_hash=`md5sum ${S}/po/Makefile.in.in | tr -s ' ' | cut -f1 -d' '`
> +					makefiles_to_update=`find ${S} -name Makefile.in.in -exec md5sum {} \+ | grep $base_makefile_hash | tr -s ' ' | cut -d' ' -f2`
> +				else
> +					# if there is no po/Makefile.in.in, then just copy the latest there, without
> +					# searching for others
> +					makefiles_to_update="./po/Makefile.in.in"
>  				fi
> +				bbnote List of Makefile.in.ins to update: $makefiles_to_update
> +				for makefile in ${makefiles_to_update}; do
> +					makefile_dir=$(dirname $makefile)
> +					bbnote Executing: cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${makefile_dir}/
> +					cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${makefile_dir}/
> +					if [ ! -e ${makefile_dir}/remove-potcdate.sed ]; then
> +						cp ${STAGING_DATADIR_NATIVE}/gettext/po/remove-potcdate.sed ${makefile_dir}/
> +					fi
> +				done
> +				for makevars in `find ${S} -name Makevars`; do
> +					bbnote Concatenating Makevars: $makevars
> +					cat ${STAGING_DATADIR_NATIVE}/gettext/po/Makevars.template.minimal ${makevars} >> ${makevars}.yocto_temp
> +					mv ${makevars}.yocto_temp ${makevars}
> +				done
>  			fi
>  			PRUNE_M4="$PRUNE_M4 gettext.m4 iconv.m4 lib-ld.m4 lib-link.m4 lib-prefix.m4 nls.m4 po.m4 progtest.m4"
>  		fi
> diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.23.1.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.26.bb
> similarity index 87%
> rename from meta/recipes-core/gettext/gettext-minimal-native_0.23.1.bb
> rename to meta/recipes-core/gettext/gettext-minimal-native_0.26.bb
> index 941896ec48..b5c32d0786 100644
> --- a/meta/recipes-core/gettext/gettext-minimal-native_0.23.1.bb
> +++ b/meta/recipes-core/gettext/gettext-minimal-native_0.26.bb
> @@ -24,7 +24,7 @@ python get_aclocal_files() {
>      with open(fpath) as f:
>          content = f.read()
>          for l in content.replace("\\\n","").split("\n"):
> -            if l.startswith("aclocal_DATA"):
> +            if l.startswith("macros_DATA"):
>                  aclocal_files = l.split("=")[1]
>                  with open(oe.path.join(d.getVar("WORKDIR"),"aclocal-files"),'w') as outf:
>                      outf.write(aclocal_files)
> @@ -43,4 +43,6 @@ do_install () {
>  	cp ${S}/build-aux/config.rpath ${D}${datadir}/gettext/
>  	cp ${S}/gettext-runtime/po/Makefile.in.in ${D}${datadir}/gettext/po/
>  	cp ${S}/gettext-runtime/po/remove-potcdate.sed ${D}${datadir}/gettext/po/
> +	# The gettext recipe also installs the same Makevars.template at the same place, rename it
> +	cp ${S}/gettext-tools/po/Makevars.template ${D}${datadir}/gettext/po/Makevars.template.minimal
>  }
> diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-core/gettext/gettext-sources.inc
> index 5d90d81b58..2ddf47334d 100644
> --- a/meta/recipes-core/gettext/gettext-sources.inc
> +++ b/meta/recipes-core/gettext/gettext-sources.inc
> @@ -1,4 +1,3 @@
>  HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
> -SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
> -           "
> -SRC_URI[sha256sum] = "52a578960fe308742367d75cd1dff8552c5797bd0beba7639e12bdcda28c0e49"
> +SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz"
> +SRC_URI[sha256sum] = "39acf4b0371e9b110b60005562aace5b3631fed9b1bb9ecccfc7f56e58bb1d7f"
> diff --git a/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
> index a8f6684bd7..f14d8df689 100644
> --- a/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
> +++ b/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
> @@ -16,10 +16,10 @@ diff --git a/gettext-tools/tests/autopoint-3 b/gettext-tools/tests/autopoint-3
>  index af2e17f..46cf3f7 100755
>  --- a/gettext-tools/tests/autopoint-3
>  +++ b/gettext-tools/tests/autopoint-3
> -@@ -137,6 +137,7 @@ ${CONFIG_SHELL} ./configure >/dev/null 2>autopoint.err
> - test $? = 0 || { cat autopoint.err; Exit 1; }
> - 
> - : ${MAKE=make}
> +@@ -149,6 +149,7 @@
> +     *) MAKE=make ;;
> +   esac
> + fi
>  +unset MAKEFLAGS
>   ${MAKE} >/dev/null 2>autopoint.err
>   test $? = 0 || { cat autopoint.err; Exit 1; }
> diff --git a/meta/recipes-core/gettext/gettext/serial-tests-config.patch b/meta/recipes-core/gettext/gettext/serial-tests-config.patch
> index 3baf549795..88bd33951a 100644
> --- a/meta/recipes-core/gettext/gettext/serial-tests-config.patch
> +++ b/meta/recipes-core/gettext/gettext/serial-tests-config.patch
> @@ -18,23 +18,23 @@ diff --git a/configure.ac b/configure.ac
>  index 5106676..3114998 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -22,7 +22,7 @@ AC_INIT([gettext],
> - 	[bug-gettext@gnu.org])
> - AC_CONFIG_SRCDIR([gettext-tools/src/msgfmt.c])
> - AC_CONFIG_AUX_DIR([build-aux])
> +@@ -23,7 +23,7 @@ AC_CONFIG_AUX_DIR([build-aux])
> + VERSION_NUMBER=`cd $srcdir \
> +                 && build-aux/git-version-gen .tarball-version`
> + gl_INIT_PACKAGE_VERSION([$VERSION_NUMBER])
>  -AM_INIT_AUTOMAKE([1.13 silent-rules parallel-tests tar-ustar])
>  +AM_INIT_AUTOMAKE([1.13 silent-rules serial-tests tar-ustar])
>   
> - dnl Override automake's tar command used for creating distributions.
> - am__tar='${AMTAR} chf - --format=ustar --owner=root --group=root "$$tardir"'
> + dnl Override automake's tar command used for creating distributions:
> + dnl - Sort the files by basename, not by dirname, to achieve higher compression
>  diff --git a/gettext-runtime/configure.ac b/gettext-runtime/configure.ac
>  index e128f5b..9f7447c 100644
>  --- a/gettext-runtime/configure.ac
>  +++ b/gettext-runtime/configure.ac
> -@@ -22,7 +22,7 @@ AC_INIT([gettext-runtime],
> - 	[bug-gettext@gnu.org])
> - AC_CONFIG_SRCDIR([intl/dcigettext.c])
> - AC_CONFIG_AUX_DIR([../build-aux])
> +@@ -23,7 +23,7 @@ AC_CONFIG_AUX_DIR([../build-aux])
> + VERSION_NUMBER=`cd $srcdir/.. \
> +                 && build-aux/git-version-gen .tarball-version`
> + gl_INIT_PACKAGE_VERSION([$VERSION_NUMBER])
>  -AM_INIT_AUTOMAKE([1.11.1 silent-rules parallel-tests])
>  +AM_INIT_AUTOMAKE([1.11.1 silent-rules serial-tests])
>   AC_CONFIG_HEADERS([config.h])
> @@ -44,10 +44,10 @@ diff --git a/gettext-tools/configure.ac b/gettext-tools/configure.ac
>  index 3b1f461..14510a9 100644
>  --- a/gettext-tools/configure.ac
>  +++ b/gettext-tools/configure.ac
> -@@ -22,7 +22,7 @@ AC_INIT([gettext-tools],
> - 	[bug-gettext@gnu.org])
> - AC_CONFIG_SRCDIR([src/msgfmt.c])
> - AC_CONFIG_AUX_DIR([../build-aux])
> +@@ -23,7 +23,7 @@ AC_CONFIG_AUX_DIR([../build-aux])
> + VERSION_NUMBER=`cd $srcdir/.. \
> +                 && build-aux/git-version-gen .tarball-version`
> + gl_INIT_PACKAGE_VERSION([$VERSION_NUMBER])
>  -AM_INIT_AUTOMAKE([1.11.1 silent-rules parallel-tests])
>  +AM_INIT_AUTOMAKE([1.11.1 silent-rules serial-tests])
>   AC_CONFIG_HEADERS([config.h])
> diff --git a/meta/recipes-core/gettext/gettext_0.23.1.bb b/meta/recipes-core/gettext/gettext_0.26.bb
> similarity index 95%
> rename from meta/recipes-core/gettext/gettext_0.23.1.bb
> rename to meta/recipes-core/gettext/gettext_0.26.bb
> index c704a3b6d7..f34474e062 100644
> --- a/meta/recipes-core/gettext/gettext_0.23.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.26.bb
> @@ -89,7 +89,8 @@ FILES:${PN} += "${libdir}/${BPN}/"
>  # The its/Makefile.am has defined:
>  # itsdir = $(pkgdatadir)$(PACKAGE_SUFFIX)/its
>  # not itsdir = $(pkgdatadir), so use wildcard to match the version.
> -FILES:${PN} += "${datadir}/${BPN}-*/*"
> +FILES:${PN} += "${datadir}/${BPN}-*/* \
> +                ${datadir}/${BPN}/m4/*"
>  
>  FILES:gettext-runtime = "${bindir}/gettext \
>                           ${bindir}/ngettext \
> @@ -170,11 +171,13 @@ do_install_ptest() {
>          find ${D}${PTEST_PATH}/ -name "*.o" -exec rm {} \;
>          chmod 0755 ${D}${PTEST_PATH}/tests/lang-vala ${D}${PTEST_PATH}/tests/plural-1 ${D}${PTEST_PATH}/tests/xgettext-tcl-4 \
>                     ${D}${PTEST_PATH}/tests/xgettext-vala-1  ${D}${PTEST_PATH}/tests/xgettext-po-2 ${D}${PTEST_PATH}/tests/xgettext-vala-6 \
> -                   ${D}${PTEST_PATH}/tests/plural-3 ${D}${PTEST_PATH}/tests/plural-4 ${D}${PTEST_PATH}/tests/xgettext-java-8 ${D}${PTEST_PATH}/tests/xgettext-java-9
> +                   ${D}${PTEST_PATH}/tests/plural-3 ${D}${PTEST_PATH}/tests/plural-4 ${D}${PTEST_PATH}/tests/xgettext-java-8 ${D}${PTEST_PATH}/tests/xgettext-java-9 \
> +                   ${D}${PTEST_PATH}/tests/msgfmt-21 ${D}${PTEST_PATH}/tests/format-modula2-1 ${D}${PTEST_PATH}/tests/format-modula2-2 \
> +                   ${D}${PTEST_PATH}/tests/lang-go ${D}${PTEST_PATH}/tests/lang-ruby ${D}${PTEST_PATH}/tests/lang-modula2 ${D}${PTEST_PATH}/tests/lang-d
>          sed -i -e 's|${DEBUG_PREFIX_MAP}||g' ${D}${PTEST_PATH}/tests/init-env
>  }
>  
> -RDEPENDS:${PN}-ptest += "make xz bash gawk autoconf locale-base-de-de locale-base-fr-fr"
> +RDEPENDS:${PN}-ptest += "make xz bash gawk autoconf locale-base-de-de locale-base-fr-fr coreutils"
>  RDEPENDS:${PN}-ptest:append:libc-glibc = "\
>      glibc-gconv-big5 \
>      glibc-charmap-big5 \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222968): https://lists.openembedded.org/g/openembedded-core/message/222968
> Mute This Topic: https://lists.openembedded.org/mt/114982746/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


