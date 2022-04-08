Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB110C3527C
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.1556.1649448034163380726
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 13:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aiytxDIC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 535DE1C0007;
	Fri,  8 Apr 2022 20:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1649448031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xZuFy8U8Q8pX5yy1G0l0FmhJJwYBV6C1P7o85XFJLyA=;
	b=aiytxDIC1AzJFlTrqR04ibohA2q2iwCZTq39WEzya0xeHVCZnXzrWUgSWh3i3Vb5eRaoVd
	kU21xQK+n101oLamYoFGAvy6iEeC0Yqz9/XPGf3a8P6J5ezvD5KqDHH/wmyDlVwPLlOKGa
	xa0tFRaQNgl8fW09DyhI5X+p4Yo9GL8+RaFmjhuoKYRS5bv4iYVOPskenx5IHxTYdQLFsp
	pm/glVnyZFF7xMMF/cI5/gmUY+riWI6CYqJdTKWtbTQDlqorXIJziQCmFi2S54pcTWl5Al
	upF3D8zELHqJPQCOCO3iuhAQF/TUJu6qcEpJeF7VJ5k0uyjY3qdDO6Cc+DvDJw==
Date: Fri, 8 Apr 2022 22:00:30 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Simone Weiss <simone.weiss@elektrobit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libgpg-error: Add ptest
Message-ID: <YlCUXki7tRD+9K9m@mail.local>
References: 
 <3af35af0-4f47-4795-8392-c746c37a3a90@denue6es010.ebgroup.elektrobit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <3af35af0-4f47-4795-8392-c746c37a3a90@denue6es010.ebgroup.elektrobit.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164176

Hello,

On 06/04/2022 15:53:24+0200, Simone Weiss wrote:
> Add a ptest for libgpg-error to core-image-ptest-all. All tests passed on a
> trial run.
> 

It seems the tests are failing on the autobuilders:
{'libgpg-error': '2022-04-08T16:22\n'
                 '2022-04-08T16:22\n'
                 ' cd ../../libgpg-error-1.44 && /bin/bash '
                 'libgpg-error-1.44/build-aux/missing automake-1.16 --gnu '
                 'tests/Makefile\n'
                 '/bin/bash: line 10: cd: ../../libgpg-error-1.44: No such '
                 'file or directory\n'
                 'make: *** [Makefile:466: '
                 '../../libgpg-error-1.44/tests/Makefile.in] Error 1\n'
                 'cd .. && make  am--refresh\n'
                 "make[1]: Entering directory '/usr/lib/libgpg-error'\n"
                 "make[1]: *** No rule to make target 'am--refresh'.\n"
                 "make[1]: Leaving directory '/usr/lib/libgpg-error'\n"
                 'make: *** [Makefile:490: ../../libgpg-error-1.44/configure] '
                 'Error 2\n'
                 "make: Failed to remake makefile 'Makefile'.\n"
                 'PASS: t-version\n'
                 'Unspecified source: Success\n'
                 'gcrypt: Invalid length specifier in S-expression\n'
                 'GnuPG: Unknown packet\n'
                 'GpgSM: Certificate too young\n'
                 'GPG Agent: Bad CA certificate\n'
                 'Pinentry: Operation cancelled\n'
                 'SCD: Card removed\n'
                 'GPGME: Bad secret key\n'
                 'Keybox: Too late to cancel LDAP\n'
                 'PASS: t-strerror\n'
                 'PASS: t-syserror\n'
                 'PASS: t-lock\n'
                 'PASS: t-printf\n'
                 'PASS: t-poll\n'
                 'PASS: t-b64\n'
                 "current conffile='[cmdline]'\n"
                 'PASS: t-argparse\n'
                 'PASS: t-logging\n'
                 'PASS: t-stringutils\n'
                 'PASS: t-malloc\n'
                 'PASS: t-lock-single-posix\n'
                 '===================\n'
                 'All 12 tests passed\n'
                 '===================\n'
                 '\n'
                 'ERROR: Exit status is 2\n'
                 'DURATION: 0\n'}


https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3096/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3350/steps/13/logs/stdio

> Signed-off-by: Simone Weiss <simone.weiss@elektrobit.com>
> ---
>  meta/conf/distro/include/ptest-packagelists.inc    |  1 +
>  .../libgpg-error/libgpg-error/run-ptest            |  3 +++
>  .../libgpg-error/libgpg-error_1.44.bb              | 14 +++++++++++++-
>  3 files changed, 17 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/run-ptest
> 
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index b51cce4d9e..54a290871e 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -25,6 +25,7 @@ PTESTS_FAST = "\
>      json-glib-ptest \
>      libconvert-asn1-perl-ptest \
>      liberror-perl-ptest \
> +    libgpg-error-ptest\
>      libnl-ptest \
>      libmodule-build-perl-ptest \
>      libpcre-ptest \
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error/run-ptest b/meta/recipes-support/libgpg-error/libgpg-error/run-ptest
> new file mode 100644
> index 0000000000..5eb4e8c6f3
> --- /dev/null
> +++ b/meta/recipes-support/libgpg-error/libgpg-error/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +make -k runtest-TESTS
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
> index 41adad0ede..174350f6f5 100644
> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
> @@ -17,13 +17,16 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
>  SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
>             file://pkgconfig.patch \
>             file://0001-Do-not-fail-when-testing-config-scripts.patch \
> +           file://run-ptest \
>             "
>  
>  SRC_URI[sha256sum] = "8e3d2da7a8b9a104dd8e9212ebe8e0daf86aa838cc1314ba6bc4de8f2d8a1ff9"
>  
>  BINCONFIG = "${bindir}/gpg-error-config"
>  
> -inherit autotools binconfig-disabled pkgconfig gettext multilib_header multilib_script
> +inherit autotools binconfig-disabled pkgconfig gettext multilib_header multilib_script ptest
> +
> +RDEPENDS_${PN}-ptest:append = " make"
>  
>  MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/gpgrt-config"
>  
> @@ -35,6 +38,15 @@ do_install:append() {
>  	oe_multilib_header gpg-error.h gpgrt.h
>  }
>  
> +do_compile_ptest() {
> +    oe_runmake -C tests buildtest-TESTS
> +}
> +
> +do_install_ptest() {
> +    install ${B}/tests/t-*[!\.o] ${D}${PTEST_PATH}
> +    install ${B}/tests/Makefile ${D}${PTEST_PATH}
> +}
> +
>  FILES:${PN}-dev += "${bindir}/gpg-error"
>  FILES:${PN}-doc += "${datadir}/libgpg-error/errorref.txt"
>  
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164082): https://lists.openembedded.org/g/openembedded-core/message/164082
> Mute This Topic: https://lists.openembedded.org/mt/90289917/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

