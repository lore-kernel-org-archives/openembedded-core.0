Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RqDSE-0005HQ-PS
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 01:44:43 +0100
Received: by iabz21 with SMTP id z21so58902iab.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 16:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/yv0C4aY+nTQPG2lCUCfjmsMIVzUl3WCcY1q90YozVo=;
	b=bchNd9BhtU8msl9V8Yygx/EXsIOS4ci3kMs2eIsLNazcSdHxzOHRmuSqQZHPiVTcVu
	M3m7nI7/jfqIOBElQWsXuFfR/1EcJWqSUNVt9Ek41mkBEQF3Zg2iXKkjPS64vUI3wIRe
	MP2R9d3ps/0f+UsB2YSk9+7yLrial9o2cIjXM=
Received: by 10.50.186.226 with SMTP id fn2mr20939684igc.25.1327538215001;
	Wed, 25 Jan 2012 16:36:55 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id wn6sm684047igb.3.2012.01.25.16.36.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 16:36:53 -0800 (PST)
Date: Wed, 25 Jan 2012 16:36:44 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120126003644.GA4973@sakrah.homelinux.org>
References: <COL120-W51BE77DBA9D330FF475952DD880@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <COL120-W51BE77DBA9D330FF475952DD880@phx.gbl>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Net::SSLeay perl extension OpenSSL
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
X-List-Received-Date: Thu, 26 Jan 2012 00:44:43 -0000
X-Groupsio-MsgNum: 16565
Content-Type: multipart/mixed; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline

--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/01/12 14:50), simran singh wrote:
> 
> Hello,
> 
> I am not sure if this is the right list.
> 
> Trying to add Net::SSLeay perl module, I get the following error.
> 

Please try attached patch. I have not tested it



> 
> 
>  NOTE: Running task 204 of 315 (ID: 11, 
> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-common/recipes/
> 
> net-ssleay/net-ssleay_1.36.bb, do_compile)
> 
> ERROR: TaskFailed event exception, aborting
> 
> ERROR: Build of 
> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb
> 
>  do_compile failed
> 
> ERROR: Task 11 
> (/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb,
> 
>  do_compile) failed with 256
> 
> ERROR: 
> '/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/engage-blackcore-common/recipes/net-ssleay/net-ssleay_1.36.bb'
>  failed
> 
> NOTE: package net-ssleay-1.36-r0: task do_compile: Started
> 
> ERROR: Function do_compile failed
> 
> NOTE: Task failed: ('function do_compile failed', 
> '/home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/work/
> 
> ppce500mc-linux/net-ssleay-1.36-r0/temp/log.do_compile.22680')
> 
> ERROR: Logfile of failure stored in: 
> /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/work/ppce500mc-
> 
> linux/net-ssleay-1.36-r0/temp/log.do_compile.22680
> 
> Log data follows:
> 
> | NOTE: make -j 2 -e MAKEFLAGS= PASTHRU_INC= -fexpensive-optimizations 
> -frename-registers -fomit-frame-pointer -O2 -g0 CCFLAGS= -fexpensive
> 
> -optimizations -frename-registers -fomit-frame-pointer -O2 -g0 
> LD=powerpc-linux-gnu-gcc -mcpu=e500mc -maix-struct-return 
> --sysroot=/home/Simran/
> 
> Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/sysroots/ppce500mc-linux
> 
> | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc 
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release
> 
> /sysroots/i686-linux/usr/lib/perl/5.10.1 
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr/lib
> 
> /perl/5.10.1 
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1
> 
>  /home/
> 
> jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr/lib/perl .).
> 
> | BEGIN failed--compilation aborted.
> 
> | make: *** [blib/lib/Net/.exists] Error 2
> 
> | make: *** Waiting for unfinished jobs....
> 
> | Can't locate ExtUtils/Command.pm in @INC (@INC contains: inc 
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/
> 
> build_p1023rds_release/sysroots/i686-linux/usr/lib/perl/5.10.1 
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release
> 
> /sysroots/i686-linux/usr/lib/perl/5.10.1 
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr
> 
> /lib/perl/5.10.1 
> /home/jenkins/jenkins/jobs/qoriq-dpaa-iso-step1/workspace/sb-dev.git/build_p1023rds_release/sysroots/i686-linux/usr/lib/perl
>  .).
> 
> | BEGIN failed--compilation aborted.
> 
> | make: *** [blib/arch/.exists] Error 2
> 
> | FATAL: oe_runmake failed
> 
> | ERROR: Function do_compile failed
> 
> NOTE: package net-ssleay-1.36-r0: task do_compile: Failed
> 
> ERROR: TaskFailed event exception, aborting
> 
> 
> 
> 
> 
> I used the libnet-ssleay-perl_1.36.bb, I found in the oe-commit archive.
> 
> Please advice and thanks.
> 
> 
> 
> Sim Gill 		 	   		   		 	   		  


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
-Khem

--k+w/mQv8wyuph6w0
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-libnet-ssleay-perl_1.42-Add-recipe.patch"

From 8e8337baa71086cbcf85e5ecddf8ffb23c5785a4 Mon Sep 17 00:00:00 2001
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jan 2012 16:33:51 -0800
Subject: [PATCH] libnet-ssleay-perl_1.42: Add recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/perl/libnet-ssleay-license   |  187 ++++++++++++++++++++
 .../perl/libnet-ssleay-perl_1.42.bb                |   33 ++++
 2 files changed, 220 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/perl/libnet-ssleay-license
 create mode 100644 meta/recipes-extended/perl/libnet-ssleay-perl_1.42.bb

diff --git a/meta/recipes-extended/perl/libnet-ssleay-license b/meta/recipes-extended/perl/libnet-ssleay-license
new file mode 100644
index 0000000..588fba8
--- /dev/null
+++ b/meta/recipes-extended/perl/libnet-ssleay-license
@@ -0,0 +1,187 @@
+Format-Specification: http://svn.debian.org/wsvn/dep/web/deps/dep5.mdwn?op=file&rev=135
+Maintainer: Florian Ragwitz <rafl@debian.org>, Mike McCauley <mikem@open.com.au>
+Source: http://search.cpan.org/dist/Net-SSLeay/
+Name: Net-SSLeay
+
+Files: *
+Copyright: 1996-2003, Sampo Kellomaki <sampo@iki.fi>
+ 2005-2006, Florian Ragwitz <rafl@debian.org>
+ 2005-2006, Mike McCauley <mikem@open.com.au>
+License: OpenSSL
+
+Files: inc/Module/*
+Copyright: 2002-2010, Adam Kennedy <adamk@cpan.org>
+ 2002-2010, Audrey Tang <autrijus@autrijus.org>
+ 2002-2010, Brian Ingerson <ingy@cpan.org>
+License: Artistic or GPL-1+
+
+Files: debian/*
+Copyright: 1999-2001, Gergely Madarasz <gorgo@caesar.elte.hu>
+ 2001, Remi Lefebvre <remi@debian.org>
+ 2001-2004, Stephen Zander <gibreel@debian.org>
+ 2002, Brendan O'Dea <bod@debian.org>
+ 2005, Steve Kemp <skx@debian.org>
+ 2005-2006, Florian Ragwitz <rafl@debian.org>
+ 2008, Niko Tyni <ntyni@debian.org>
+ 2008, Damyan Ivanov <dmn@debian.org>
+ 2008-2011, gregor herrmann <gregoa@debian.org>
+ 2010, Franck Joncourt <franck@debian.org>
+License: Artistic or GPL-1+
+
+License: OpenSSL
+ Distribution and use of this module is under the same terms as the
+ OpenSSL package itself (i.e. free, but mandatory attribution; NO
+ WARRANTY). Please consult LICENSE file in the root of the OpenSSL
+ distribution.
+ .
+ While the source distribution of this perl module does not contain
+ Eric's or OpenSSL's code, if you use this module you will use OpenSSL
+ library. Please give Eric and OpenSSL team credit (as required by
+ their licenses).
+ .
+ And remember, you, and nobody else but you, are responsible for
+ auditing this module and OpenSSL library for security problems,
+ backdoors, and general suitability for your application.
+ .
+ LICENSE ISSUES
+ ==============
+ .
+ The OpenSSL toolkit stays under a dual license, i.e. both the conditions of
+ the OpenSSL License and the original SSLeay license apply to the toolkit.
+ See below for the actual license texts. Actually both licenses are BSD-style
+ Open Source licenses. In case of any license issues related to OpenSSL
+ please contact openssl-core@openssl.org.
+ .
+ OpenSSL License
+ ---------------
+ .
+ /* ====================================================================
+  * Copyright (c) 1998-1999 The OpenSSL Project.  All rights reserved.
+  *
+  * Redistribution and use in source and binary forms, with or without
+  * modification, are permitted provided that the following conditions
+  * are met:
+  *
+  * 1. Redistributions of source code must retain the above copyright
+  *    notice, this list of conditions and the following disclaimer. 
+  *
+  * 2. Redistributions in binary form must reproduce the above copyright
+  *    notice, this list of conditions and the following disclaimer in
+  *    the documentation and/or other materials provided with the
+  *    distribution.
+  *
+  * 3. All advertising materials mentioning features or use of this
+  *    software must display the following acknowledgment:
+  *    "This product includes software developed by the OpenSSL Project
+  *    for use in the OpenSSL Toolkit. (http://www.openssl.org/)"
+  *
+  * 4. The names "OpenSSL Toolkit" and "OpenSSL Project" must not be used to
+  *    endorse or promote products derived from this software without
+  *    prior written permission. For written permission, please contact
+  *    openssl-core@openssl.org.
+  *
+  * 5. Products derived from this software may not be called "OpenSSL"
+  *    nor may "OpenSSL" appear in their names without prior written
+  *    permission of the OpenSSL Project.
+  *
+  * 6. Redistributions of any form whatsoever must retain the following
+  *    acknowledgment:
+  *    "This product includes software developed by the OpenSSL Project
+  *    for use in the OpenSSL Toolkit (http://www.openssl.org/)"
+  *
+  * THIS SOFTWARE IS PROVIDED BY THE OpenSSL PROJECT ``AS IS'' AND ANY
+  * EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+  * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE OpenSSL PROJECT OR
+  * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+  * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
+  * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+  * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+  * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
+  * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+  * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
+  * OF THE POSSIBILITY OF SUCH DAMAGE.
+  * ====================================================================
+  *
+  * This product includes cryptographic software written by Eric Young
+  * (eay@cryptsoft.com).  This product includes software written by Tim
+  * Hudson (tjh@cryptsoft.com).
+  *
+  */
+ .
+ Original SSLeay License
+ -----------------------
+ .
+ /* Copyright (C) 1995-1998 Eric Young (eay@cryptsoft.com)
+  * All rights reserved.
+  *
+  * This package is an SSL implementation written
+  * by Eric Young (eay@cryptsoft.com).
+  * The implementation was written so as to conform with Netscapes SSL.
+  * 
+  * This library is free for commercial and non-commercial use as long as
+  * the following conditions are aheared to.  The following conditions
+  * apply to all code found in this distribution, be it the RC4, RSA,
+  * lhash, DES, etc., code; not just the SSL code.  The SSL documentation
+  * included with this distribution is covered by the same copyright terms
+  * except that the holder is Tim Hudson (tjh@cryptsoft.com).
+  * 
+  * Copyright remains Eric Young's, and as such any Copyright notices in
+  * the code are not to be removed.
+  * If this package is used in a product, Eric Young should be given attribution
+  * as the author of the parts of the library used.
+  * This can be in the form of a textual message at program startup or
+  * in documentation (online or textual) provided with the package.
+  * 
+  * Redistribution and use in source and binary forms, with or without
+  * modification, are permitted provided that the following conditions
+  * are met:
+  * 1. Redistributions of source code must retain the copyright
+  *    notice, this list of conditions and the following disclaimer.
+  * 2. Redistributions in binary form must reproduce the above copyright
+  *    notice, this list of conditions and the following disclaimer in the
+  *    documentation and/or other materials provided with the distribution.
+  * 3. All advertising materials mentioning features or use of this software
+  *    must display the following acknowledgement:
+  *    "This product includes cryptographic software written by
+  *     Eric Young (eay@cryptsoft.com)"
+  *    The word 'cryptographic' can be left out if the rouines from the library
+  *    being used are not cryptographic related :-).
+  * 4. If you include any Windows specific code (or a derivative thereof) from 
+  *    the apps directory (application code) you must include an acknowledgement:
+  *    "This product includes software written by Tim Hudson (tjh@cryptsoft.com)"
+  * 
+  * THIS SOFTWARE IS PROVIDED BY ERIC YOUNG ``AS IS'' AND
+  * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+  * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
+  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+  * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+  * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+  * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+  * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+  * SUCH DAMAGE.
+  * 
+  * The licence and distribution terms for any publically available version or
+  * derivative of this code cannot be changed.  i.e. this code cannot simply be
+  * copied and put under another distribution licence
+  * [including the GNU Public Licence.]
+  */
+
+License: Artistic
+ This program is free software; you can redistribute it and/or modify
+ it under the terms of the Artistic License, which comes with Perl.
+ .
+ On Debian systems, the complete text of the Artistic License
+ can be found in `/usr/share/common-licenses/Artistic'.
+
+License: GPL-1+
+ This program is free software; you can redistribute it and/or modify
+ it under the terms of the GNU General Public License as published by
+ the Free Software Foundation; either version 1, or (at your option)
+ any later version.
+ .
+ On Debian systems, the complete text of version 1 of the GNU General
+ Public License can be found in `/usr/share/common-licenses/GPL-1'.
+
diff --git a/meta/recipes-extended/perl/libnet-ssleay-perl_1.42.bb b/meta/recipes-extended/perl/libnet-ssleay-perl_1.42.bb
new file mode 100644
index 0000000..3a75de2
--- /dev/null
+++ b/meta/recipes-extended/perl/libnet-ssleay-perl_1.42.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Net::SSLeay - Perl extension for using OpenSSL"
+SECTION = "libs"
+LICENSE = "OpenSSL"
+DEPENDS = "openssl zlib"
+RDEPENDS_${PN} += " \
+	perl-module-carp \
+	perl-module-errno \
+	perl-module-extutils-makemaker \
+	perl-module-mime-base64 \
+	perl-module-socket \
+	"
+
+BBCLASSEXTEND = "native"
+PR = "r1"
+LIC_FILES_CHKSUM = "file://libnet-ssleay-license;md5=d9af28e1564d74d6834e9642404639b6"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz;name=net-ssleay-${PV} \
+           file://libnet-ssleay-license \
+          "
+
+SRC_URI[net-ssleay-1.42.md5sum] = "3f9c9589495301c14bfc03097388ca4f"
+SRC_URI[net-ssleay-1.42.sha256sum] = "b6ca7719cd8568e60204f39027c1c68d19fa690b1f3fd380ed14031a1a70fd9d"
+
+S = "${WORKDIR}/Net-SSLeay-${PV}"
+
+export OPENSSL_PREFIX="${STAGING_INCDIR}/.."
+
+inherit cpan
+
+do_configure_prepend () {
+	cp -a ${WORKDIR}/libnet-ssleay-license ${S}
+}
+FILES_${PN}-dbg += "${PERLLIBDIRS}/vendor_perl/*/auto/Net/SSLeay/.debug/"
-- 
1.7.8.3


--k+w/mQv8wyuph6w0--
