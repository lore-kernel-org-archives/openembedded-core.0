Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 243E360FF6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 13:07:02 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBKD6wYS007961 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 13:06:58 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id D6YxtJ55bHLV
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 13:06:58 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBKD6tBx007955
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 13:06:56 GMT
Message-ID: <1387544810.6402.98.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Dec 2013 13:06:50 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc: Drop 4.7.2 version since 4.8 is stable now
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
X-List-Received-Date: Fri, 20 Dec 2013 13:07:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We've had 4.8 around for a while now, I'm not aware of any issues with
it so we can drop the older 4.7 version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

[diffstat send instead of a patch to keep things smaller for the list]

 meta/recipes-devtools/gcc/gcc-4.7.inc                                                             |  145 
 meta/recipes-devtools/gcc/gcc-4.7/0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch |   93 
 meta/recipes-devtools/gcc/gcc-4.7/0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch |   49 
 meta/recipes-devtools/gcc/gcc-4.7/100-uclibc-conf.patch                                           |   39 
 meta/recipes-devtools/gcc/gcc-4.7/200-uclibc-locale.patch                                         | 2810 ----------
 meta/recipes-devtools/gcc/gcc-4.7/203-uclibc-locale-no__x.patch                                   |  235 
 meta/recipes-devtools/gcc/gcc-4.7/204-uclibc-locale-wchar_fix.patch                               |   54 
 meta/recipes-devtools/gcc/gcc-4.7/205-uclibc-locale-update.patch                                  |  521 -
 meta/recipes-devtools/gcc/gcc-4.7/301-missing-execinfo_h.patch                                    |   15 
 meta/recipes-devtools/gcc/gcc-4.7/302-c99-snprintf.patch                                          |   15 
 meta/recipes-devtools/gcc/gcc-4.7/303-c99-complex-ugly-hack.patch                                 |   16 
 meta/recipes-devtools/gcc/gcc-4.7/304-index_macro.patch                                           |   30 
 meta/recipes-devtools/gcc/gcc-4.7/305-libmudflap-susv3-legacy.patch                               |   51 
 meta/recipes-devtools/gcc/gcc-4.7/306-libstdc++-namespace.patch                                   |   40 
 meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch                                                 |   63 
 meta/recipes-devtools/gcc/gcc-4.7/740-sh-pr24836.patch                                            |   31 
 meta/recipes-devtools/gcc/gcc-4.7/800-arm-bigendian.patch                                         |   36 
 meta/recipes-devtools/gcc/gcc-4.7/COLLECT_GCC_OPTIONS.patch                                       |   25 
 meta/recipes-devtools/gcc/gcc-4.7/GLIBC_DYNAMIC_LINKER.patch                                      |  165 
 meta/recipes-devtools/gcc/gcc-4.7/arm-hard-float-loader.patch                                     |   48 
 meta/recipes-devtools/gcc/gcc-4.7/avoid-oob-array-access.patch                                    |   45 
 meta/recipes-devtools/gcc/gcc-4.7/cpp-honor-sysroot.patch                                         |   40 
 meta/recipes-devtools/gcc/gcc-4.7/define_insn_reservation.patch                                   |  118 
 meta/recipes-devtools/gcc/gcc-4.7/disable-texinfo-5.patch                                         |  107 
 meta/recipes-devtools/gcc/gcc-4.7/disable_relax_pic_calls_flag.patch                              |   48 
 meta/recipes-devtools/gcc/gcc-4.7/disablesdt.patch                                                |   66 
 meta/recipes-devtools/gcc/gcc-4.7/fix-g++-sysroot.patch                                           |  428 -
 meta/recipes-devtools/gcc/gcc-4.7/fortran-cross-compile-hack.patch                                |   32 
 meta/recipes-devtools/gcc/gcc-4.7/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch                           |   33 
 meta/recipes-devtools/gcc/gcc-4.7/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch                       |  116 
 meta/recipes-devtools/gcc/gcc-4.7/gcc-argument-list-too-long.patch                                |   33 
 meta/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch                             |   31 
 meta/recipes-devtools/gcc/gcc-4.7/gcc-poison-dir-extend.patch                                     |   27 
 meta/recipes-devtools/gcc/gcc-4.7/gcc-poison-system-directories.patch                             |  223 
 meta/recipes-devtools/gcc/gcc-4.7/gcc-uclibc-locale-ctype_touplow_t.patch                         |   72 
 meta/recipes-devtools/gcc/gcc-4.7/libgcc-sjlj-check.patch                                         |   61 
 meta/recipes-devtools/gcc/gcc-4.7/libtool.patch                                                   |   29 
 meta/recipes-devtools/gcc/gcc-4.7/mips64-default-n64.patch                                        |   19 
 meta/recipes-devtools/gcc/gcc-4.7/optional_libstdc.patch                                          |   86 
 meta/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch                                          |   72 
 meta/recipes-devtools/gcc/gcc-4.7/ppc_with_cpu.patch                                              |  752 --
 meta/recipes-devtools/gcc/gcc-4.7/ppce5500-e6500-support.patch                                    |  713 --
 meta/recipes-devtools/gcc/gcc-4.7/pr32219.patch                                                   |   72 
 meta/recipes-devtools/gcc/gcc-4.7/rs6000-tables.patch                                             |  135 
 meta/recipes-devtools/gcc/gcc-4.7/use-defaults.h-and-t-oe-in-B.patch                              |   77 
 meta/recipes-devtools/gcc/gcc-4.7/use-ml-conf-files-from-B.patch                                  |   87 
 meta/recipes-devtools/gcc/gcc-4.7/wcast-qual-PR55383.patch                                        |   43 
 meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb                                               |    3 
 meta/recipes-devtools/gcc/gcc-cross-initial_4.7.bb                                                |    2 
 meta/recipes-devtools/gcc/gcc-cross_4.7.bb                                                        |    3 
 meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.7.bb                                             |    3 
 meta/recipes-devtools/gcc/gcc-crosssdk_4.7.bb                                                     |    2 
 meta/recipes-devtools/gcc/gcc-runtime_4.7.bb                                                      |    3 
 meta/recipes-devtools/gcc/gcc_4.7.bb                                                              |    2 
 meta/recipes-devtools/gcc/libgcc_4.7.bb                                                           |    3 



