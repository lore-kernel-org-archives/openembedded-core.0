Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOExf-00046P-JA
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2012 23:13:48 +0200
Received: by pbbrq2 with SMTP id rq2so1961320pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Apr 2012 14:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=HGwEPnBadza/+ejDI/sMH36kcnNw5mmcoNqvLpIdv4k=;
	b=s7Viou4F9qJj8OoAh0ZMbzG4y6nPAPMpocXPSqc4gHcomtHkuNNeXDxFFYCwcRfKNI
	3k0cpXlX7CMTW7yvL8tnAOxlB3lDvkHoKM0tv4DIJMGF/sHMsYGEtHW1XiSLtOi7TZFJ
	k17Q7pihX6s6U7zHjEddwwpBSyFFFvRIMotBg/hy1kbh1FVD1KrnHeh7CtABAYoqCM3T
	+n/kVb+OdsfqqWtN5JkGrFu6hqpvc4+H9xwfwNjewiLb6qo7IvSYqBuuAlXwlvAsnUnP
	C3xYqjNkMXOz5c92Vj+Dd4+TIDiOUf5Fyw2RKFWwqmPSL1ZSE0B92/ft8JQJ58r94SaP
	B7wQ==
Received: by 10.68.217.227 with SMTP id pb3mr14238535pbc.138.1335647047018;
	Sat, 28 Apr 2012 14:04:07 -0700 (PDT)
Received: from [192.168.1.104] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id h10sm10663714pbh.69.2012.04.28.14.04.04
	(version=SSLv3 cipher=OTHER); Sat, 28 Apr 2012 14:04:05 -0700 (PDT)
Message-ID: <4F9C5B42.1010409@gmail.com>
Date: Sat, 28 Apr 2012 14:04:02 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120411 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1334152146.git.andrei@gherzan.ro>
	<ef5c9d2ab1340a0d6ce1bf09a68a20c60e11eef0.1334152146.git.andrei@gherzan.ro>
In-Reply-To: <ef5c9d2ab1340a0d6ce1bf09a68a20c60e11eef0.1334152146.git.andrei@gherzan.ro>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH 1/1] js185: Integrate version 1.8.5
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
X-List-Received-Date: Sat, 28 Apr 2012 21:13:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/11/2012 06:51 AM, Andrei Gherzan wrote:
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro> --- 
> meta/recipes-support/js/files/link_with_gcc.patch |   12 +++---- 
> meta/recipes-support/js/files/usepic.patch        |   15 ++------ 
> meta/recipes-support/js/js185_1.0.0.bb            |   36
> +++++++++++++++++++++ 3 files changed, 45 insertions(+), 18
> deletions(-) create mode 100644
> meta/recipes-support/js/js185_1.0.0.bb
> 
> diff --git a/meta/recipes-support/js/files/link_with_gcc.patch
> b/meta/recipes-support/js/files/link_with_gcc.patch index
> 988df61..1bee233 100644 ---
> a/meta/recipes-support/js/files/link_with_gcc.patch +++
> b/meta/recipes-support/js/files/link_with_gcc.patch @@ -1,11 +1,9
> @@ -Upstream-Status: Pending - -Index: src/config/Linux_All.mk 
> +Index: js-1.8.5/js/src/ref-config/Linux_All.mk 
> ===================================================================
>
> 
- ---- src.orig/config/Linux_All.mk	2005-05-10 19:53:44.000000000 +0000
> -+++ src/config/Linux_All.mk	2007-06-18 17:20:05.000000000 +0000 
> -@@ -47,7 +47,7 @@ - OS_CFLAGS = -DXP_UNIX -DSVR4 -DSYSV
> -D_BSD_SOURCE -DPOSIX_SOURCE -DHAVE_LOCALTIME_R +---
> src.orig/ref-config/Linux_All.mk	2012-04-09 23:43:45.099107032
> +0300 ++++ src/ref-config/Linux_All.mk	2012-04-09
> 23:43:56.947106799 +0300 +@@ -48,7 +48,7 @@ + OS_CFLAGS = -DXP_UNIX
> -DSVR4 -DSYSV -D_BSD_SOURCE -DPOSIX_SOURCE -DHAVE_LOCALTIME_R
> -DLINUX
> 
> RANLIB = echo -MKSHLIB = $(LD) -shared $(XMKSHLIBOPTS) diff --git
> a/meta/recipes-support/js/files/usepic.patch
> b/meta/recipes-support/js/files/usepic.patch index 91b0923..7098188
> 100644 --- a/meta/recipes-support/js/files/usepic.patch +++
> b/meta/recipes-support/js/files/usepic.patch @@ -1,15 +1,8 @@ 
> -Upstream-Status: Inappropriate [embedded specific] - -Mips needs
> -fPIC to compile properly. These tests are broken anyway as they
> test -the build system architecture, not the target. This is a
> hack. - -RP 10/6/2010 -


why is patch header gone

> -Index: src/config/Linux_All.mk +Index:
> src/ref-config/Linux_All.mk 
> ===================================================================
>
> 
- ---- src.orig/config/Linux_All.mk	2010-06-10 22:09:43.000000000 +0100
> -+++ src/config/Linux_All.mk	2010-06-10 22:09:55.000000000 +0100 
> -@@ -90,14 +90,10 @@ +--- src.orig/ref-config/Linux_All.mk
> 2012-04-09 23:47:06.775103048 +0300 ++++
> src/ref-config/Linux_All.mk	2012-04-09 23:47:40.267102388 +0300 +@@
> -92,14 +92,10 @@ # Use the editline library to provide line-editing
> support. JS_EDITLINE = 1
> 
> diff --git a/meta/recipes-support/js/js185_1.0.0.bb
> b/meta/recipes-support/js/js185_1.0.0.bb new file mode 100644 index
> 0000000..c91d9b6 --- /dev/null +++
> b/meta/recipes-support/js/js185_1.0.0.bb @@ -0,0 +1,36 @@ 
> +DESCRIPTION = "Spidermonkey: a javascript engine written in C" 
> +HOMEPAGE = "http://www.mozilla.org/js/spidermonkey/" +SECTION =
> "libs" + +# the package is licensed under either of the following 
> +LICENSE = "MPL-1 | GPLv2+ | LGPLv2.1+" +LIC_FILES_CHKSUM =
> "file://jsapi.h;beginline=4;endline=39;md5=347c6bbf4fb4547de1fa5ad830030063"
>
> 
+PR = "r0"
> + +DEPENDS = "nspr" + +SRC_URI =
> "http://ftp.mozilla.org/pub/mozilla.org/js/js185-1.0.0.tar.gz \ +
> file://link_with_gcc.patch \ +           file://usepic.patch \ +
> " + +SRC_URI[md5sum] = "a4574365938222adca0a6bd33329cb32" 
> +SRC_URI[sha256sum] =
> "5d12f7e1f5b4a99436685d97b9b7b75f094d33580227aa998c406bbae6f2a687" 
> + +S = "${WORKDIR}/${PN}-${PV}/js/src" + +inherit autotools + +#
> Use the configure and avoid autoconf as v2.13 is mandatory 
> +do_configure_prepend() { +	rm -f ${S}/configure.in +} + 
> +EXTRA_OEMAKE = "'CC=${CC}' 'LD=${LD}' 'XCFLAGS=${CFLAGS}'
> 'XLDFLAGS=${LDFLAGS} -Wl,-soname=libjs' \ +
> 'BUILD_CC=${BUILD_CC}' 'BUILD_CFLAGS=${BUILD_CFLAGS}'
> 'BUILD_LDFLAGS=${BUILD_LDFLAGS}'" + +EXTRA_OECONF =
> '--with-nspr-libs="-lplds4 -lplc4 -lnspr4" \ +
> --prefix=/usr' + +PARALLEL_MAKE = ""

can you make sure this is really needed ?

> +

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+cW0IACgkQuwUzVZGdMxSFhgCfUUBEACEl2mG/QrelmeS01b+i
44IAn0JtcpeOtRFfIF1zqLNgZNjqk7Z8
=rO7K
-----END PGP SIGNATURE-----


