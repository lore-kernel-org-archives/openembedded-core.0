Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E16CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 23:05:34 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1140.1762556726276442392
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 15:05:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ekugia99;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-340e525487eso902833a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 15:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762556725; x=1763161525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qixok00/Va9DtfbKlp+bYEcLWxWB8tYcqm8VJEpT/bI=;
        b=Ekugia99Akw3k+TUIGK0ev0aEHNT8kR1k8RqqRsqIlyInrGMoG9pgJ8pHzXLWzhE5+
         AQflmDTJ8Rb8M/Bd8fV4hhpG1YVF8UTzHJ5mRoZlWvKdoFvLp6/HcBSDS1J2SN7M5psr
         1ZaPcnJHaYtR4YHkZokQpnFwiZOAYjbZJCN8MNhY3q7JaBW5pIUU9+zwWlLGJyUDQwkL
         fM64KBR5VuzSCDFUdOrOKbF060CaZ4G4VsbvMseAHjSCksO4Kgw7uo8YJLeTHfwL6mfS
         rsGa3wA7gbwb6dtHb3RzCh0zjbdLQfXenmPFkXS3wyUIwBW7v4Zb8FsXMryUNNjtrtQo
         k/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762556725; x=1763161525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qixok00/Va9DtfbKlp+bYEcLWxWB8tYcqm8VJEpT/bI=;
        b=TqU7WIfqeIGT8DuK8Xi5nekKcxGFFf7tV1t1FvecXE76TZPLfrU2pnqk4pN01zMyfV
         CB2O+byt3qeFYN4MpG2I1AEUjXvYdJ9sz+VUW/y29PrxOwTIhY7MuvDi1Cl1xA6rFpo3
         wbAQnIrQt5Vk4vcb7b1jkCqe+jz7J2Sq7kAlKmIwg/AUorTiLA+0cg1zL1O1pWJDdFQr
         NPW4aUB2AFLUFdzaehgqAMbV1gywhCOSp4EnAdyBOmtzDFbinJa7ex50vEgK/REbQFLY
         FR7V7Kup3tu5iVXeOaVC2DakdNYdUf1S+gf/36+06kWczhUb2RR+1jy82JGkDu2tD/K1
         uV3A==
X-Gm-Message-State: AOJu0YzqUdvQgBWnhhgZSVB7IfVagrcyfJCebfjn83y1FzwwgqA7bUL2
	S67B5WX5obGZcIEEEw70iDcvvgsyLmjYjT0uDVYVUxvCdIF8NpPnd6qomhHNDHXCfMk=
X-Gm-Gg: ASbGncujM5av4cOPekP0Ug5K6bGwxI/bSmkYR6E6/zoncbHSnvDoaFmVhU66nI9Hbt5
	uEsbsCGpntKt/3YC5GLUt3nlCTgEnfKRsXKiZaKT3/g6+UDSnJ+tXiO+hMNuNEKcHoZcX3m75vc
	anpmCiUt9HTObPTV3VObwjmRB8wGugepkNw1yrizz4ZHIu2+fXHavNuDrxaAM0cYyHJDbOPqQRN
	cIA3N+DDzXYfTaG8i99PBwHG1EeYo/n9+3dqVRTg8/vffpKWuyTbKxUTtI7YiUnJw4VMNyS/MSR
	NQk3NK4ufZMDZlr3bbHmdeCMRW/vkhwszH8H8n09K+7q8Fc9W142GpVtxkgArV/royIpoyvw7p/
	VkTDhttEQzQrj+T8v0kQdilVh8vucVw29PYJqNU6IhnjZCAzPG8w5hzfwj4UOrLUWq91YlFdx/r
	qlXJMUWf+DWrF8UI40SFcZKVG2L99nb3PxCQvdQfonHRa6iaukoUlZmWyCiyec/2P15rWmF/NO
X-Google-Smtp-Source: AGHT+IH16wEHOuRxoOz2bqYeB7Ld7/cFPeULEsSgaGGO5VdYnWjhlbW7qemRxK2JBp37NTuw5xRcLw==
X-Received: by 2002:a17:90b:2f8b:b0:340:ad5e:c9 with SMTP id 98e67ed59e1d1-3436cb9f0a4mr1013558a91.16.1762556723465;
        Fri, 07 Nov 2025 15:05:23 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c31d86esm3744661a91.8.2025.11.07.15.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 15:05:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] tcp-wrappers: Remove support
Date: Fri,  7 Nov 2025 15:05:19 -0800
Message-ID: <20251107230520.363117-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 23:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226067

It has been removed in 2001, The code does not compile with
new compilers, it has to be fixed/patched with every compiler
release

This has long gone in other distributions too e.g. fedora
removed it in F28 [1]

[1] https://fedoraproject.org/wiki/Changes/Deprecate_TCP_wrappers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |    1 -
 .../inetutils/inetutils_2.6.bb                |    2 +-
 .../nfs-utils/nfs-utils_2.8.4.bb              |    5 +-
 .../socat/socat_1.8.0.3.bb                    |    3 +-
 meta/recipes-extended/quota/quota_4.10.bb     |    5 +-
 .../recipes-extended/rpcbind/rpcbind_1.2.8.bb |    3 -
 .../0001-Fix-build-with-clang.patch           |   65 -
 ...plicit-function-declaration-warnings.patch |  114 --
 ...0001-Remove-fgets-extern-declaration.patch |   43 -
 .../tcp-wrappers-7.6/00_man_quoting.diff      |   77 -
 .../tcp-wrappers-7.6/01_man_portability.patch |  250 ----
 .../05_wildcard_matching.patch                |  105 --
 .../06_fix_gethostbyname.patch                |   32 -
 .../tcp-wrappers-7.6/10_usagi-ipv6.patch      | 1255 -----------------
 .../tcp-wrappers-7.6/11_tcpd_blacklist.patch  |  153 --
 .../tcp-wrappers-7.6/11_usagi_fix.patch       |   47 -
 .../tcp-wrappers-7.6/12_makefile_config.patch |   85 --
 .../tcp-wrappers-7.6/13_shlib_weaksym.patch   |  255 ----
 .../tcp-wrappers-7.6/14_cidr_support.patch    |   68 -
 .../tcp-wrappers-7.6/15_match_clarify.patch   |   14 -
 .../tcp-wrappers-7.6/expand_remote_port.patch |   73 -
 .../tcp-wrappers-7.6/fix_warnings.patch       |   25 -
 .../tcp-wrappers-7.6/fix_warnings2.patch      |  200 ---
 .../tcp-wrappers-7.6/have_strerror.patch      |   21 -
 .../tcp-wrappers-7.6/ldflags.patch            |   45 -
 .../makefile-fix-parallel.patch               |   54 -
 .../tcp-wrappers-7.6/man_fromhost.patch       |   23 -
 .../tcp-wrappers-7.6/musl-decls.patch         |   31 -
 .../rename_strings_variable.patch             |   35 -
 .../tcp-wrappers-7.6/restore_sigalarm.patch   |   39 -
 .../tcp-wrappers/tcp-wrappers-7.6/rfc931.diff |   41 -
 .../tcp-wrappers-7.6/safe_finger.8            |   34 -
 .../tcp-wrappers-7.6/safe_finger.patch        |   31 -
 .../tcp-wrappers-7.6/sig_fix.patch            |   36 -
 .../tcp-wrappers-7.6/siglongjmp.patch         |   32 -
 .../tcp-wrappers-7.6/socklen_t.patch          |   58 -
 .../tcp-wrappers-7.6/tcpdchk_libwrapped.patch |   41 -
 .../tcp-wrappers/tcp-wrappers-7.6/try-from.8  |   28 -
 .../tcp-wrappers/tcp-wrappers_7.6.bb          |  135 --
 .../xinetd/xinetd_2.3.15.4.bb                 |    3 -
 40 files changed, 5 insertions(+), 3562 deletions(-)
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.diff
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings2.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/have_strerror.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile-fix-parallel.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/man_fromhost.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rename_strings_variable.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.8
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrapped.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/try-from.8
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 79830ece999..6c3174cbb72 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -833,7 +833,6 @@ RECIPE_MAINTAINER:pn-target-sdk-provides-dummy = "Richard Purdie <richard.purdie
 RECIPE_MAINTAINER:pn-tcf-agent = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-tcl = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-tcl8 = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-tcp-wrappers = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-testexport-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-texinfo = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-texinfo-dummy-native = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.6.bb b/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
index 6e03195f2d2..9dcd4946943 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
@@ -192,7 +192,7 @@ RPROVIDES:${PN}-rsh = "rsh"
 FILES:${PN}-rshd = "${sbindir}/in.rshd ${sbindir}/in.rlogind ${sbindir}/in.rexecd \
                     ${sysconfdir}/xinetd.d/rsh ${sysconfdir}/xinetd.d/rlogin ${sysconfdir}/xinetd.d/rexec"
 FILES:${PN}-rshd-dbg = "${sbindir}/.debug/in.rshd ${sbindir}/.debug/in.rlogind ${sbindir}/.debug/in.rexecd"
-RDEPENDS:${PN}-rshd += "xinetd tcp-wrappers"
+RDEPENDS:${PN}-rshd += "xinetd"
 RCONFLICTS:${PN}-rshd += "netkit-rshd-server"
 RPROVIDES:${PN}-rshd = "rshd"
 
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
index b68a55edcd0..08e7dd89003 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
@@ -55,14 +55,11 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
 
 LDFLAGS += "-lsqlite3 -levent"
 
-PACKAGECONFIG ??= "tcp-wrappers \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
 "
 
-PACKAGECONFIG:remove:libc-musl = "tcp-wrappers"
 #krb5 is available in meta-oe
 PACKAGECONFIG[gssapi] = "--with-krb5=${STAGING_EXECPREFIXDIR} --enable-gss --enable-svcgss,--disable-gss --disable-svcgss,krb5"
-PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 # libdevmapper is available in meta-oe
 PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper,libdevmapper"
diff --git a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb b/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
index ee6ca1fe447..b5f5d72f9c9 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
@@ -37,9 +37,8 @@ TERMBITS_SHIFTS:powerpc64 = "sc_cv_sys_crdly_shift=12 \
                              sc_cv_sys_tabdly_shift=10 \
                              sc_cv_sys_csize_shift=8"
 
-PACKAGECONFIG:class-target ??= "tcp-wrappers readline openssl"
+PACKAGECONFIG:class-target ??= "readline openssl"
 PACKAGECONFIG ??= "readline openssl"
-PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 
diff --git a/meta/recipes-extended/quota/quota_4.10.bb b/meta/recipes-extended/quota/quota_4.10.bb
index 6f1dc587774..8f9e4fdf342 100644
--- a/meta/recipes-extended/quota/quota_4.10.bb
+++ b/meta/recipes-extended/quota/quota_4.10.bb
@@ -25,10 +25,9 @@ CFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'rpc', '-I${STAGING_INCDIR}/tir
 LDFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'rpc', '-ltirpc', '', d)}"
 ASNEEDED = ""
 
-PACKAGECONFIG ??= "tcp-wrappers rpc bsd"
-PACKAGECONFIG:libc-musl = "tcp-wrappers rpc"
+PACKAGECONFIG ??= "rpc bsd"
+PACKAGECONFIG:libc-musl = "rpc"
 
-PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
 PACKAGECONFIG[rpc] = "--enable-rpc,--disable-rpc,libtirpc"
 PACKAGECONFIG[bsd] = "--enable-bsd_behaviour=yes,--enable-bsd_behaviour=no,"
 PACKAGECONFIG[ldapmail] = "--enable-ldapmail,--disable-ldapmail,openldap"
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
index b669a53ae99..bcdadf4f108 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
@@ -22,9 +22,6 @@ SRC_URI[sha256sum] = "964132c389918e8964d7334936b6dd10ef025b300c6b29e693ba0f2955
 
 inherit autotools update-rc.d systemd pkgconfig update-alternatives sourceforge-releases
 
-PACKAGECONFIG ??= "tcp-wrappers"
-PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
-
 INITSCRIPT_NAME = "rpcbind"
 INITSCRIPT_PARAMS = "start 12 2 3 4 5 . stop 60 0 1 6 ."
 
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
deleted file mode 100644
index 9ca227d68d1..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 7f8878ac1aaf4a19992d39379797c151301bedb1 Mon Sep 17 00:00:00 2001
-From: Oleksiy Obitotskyy <oobitots@cisco.com>
-Date: Mon, 5 Feb 2018 08:29:10 -0800
-Subject: [PATCH] Fix build with clang
-
-Fix "error: non-void function 'fix_options' should return a value".
-Add function prototype to tcpd.c and miscd.c.
-
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
----
- v2 - add function prototypes
-
- fix_options.c | 2 +-
- miscd.c       | 4 ++++
- tcpd.c        | 4 ++++
- 3 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/fix_options.c b/fix_options.c
-index b5e81b8..9958ff4 100644
---- a/fix_options.c
-+++ b/fix_options.c
-@@ -29,7 +29,7 @@ static char sccsid[] = "@(#) fix_options.c 1.6 97/04/08 02:29:19";
- 
- /* fix_options - get rid of IP-level socket options */
- 
--fix_options(request)
-+void fix_options(request)
- struct request_info *request;
- {
- #ifdef IP_OPTIONS
-diff --git a/miscd.c b/miscd.c
-index 1ab835c..723b83a 100644
---- a/miscd.c
-+++ b/miscd.c
-@@ -40,6 +40,10 @@ static char sccsid[] = "@(#) miscd.c 1.10 96/02/11 17:01:30";
- #include "patchlevel.h"
- #include "tcpd.h"
- 
-+#ifdef KILL_IP_OPTIONS
-+void fix_options(struct request_info *);
-+#endif
-+
- int     allow_severity = SEVERITY;	/* run-time adjustable */
- int     deny_severity = LOG_WARNING;	/* ditto */
- 
-diff --git a/tcpd.c b/tcpd.c
-index d865b9c..a179891 100644
---- a/tcpd.c
-+++ b/tcpd.c
-@@ -38,6 +38,10 @@ static char sccsid[] = "@(#) tcpd.c 1.10 96/02/11 17:01:32";
- #include "patchlevel.h"
- #include "tcpd.h"
- 
-+#ifdef KILL_IP_OPTIONS
-+void fix_options(struct request_info *);
-+#endif
-+
- int     allow_severity = SEVERITY;	/* run-time adjustable */
- int     deny_severity = LOG_WARNING;	/* ditto */
- 
--- 
-2.10.3.dirty
-
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch
deleted file mode 100644
index 85031779261..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 9c97b5db237a793e0d1b6b0241570bdc6e35ee24 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 7 Aug 2022 17:42:24 -0700
-Subject: [PATCH] Fix implicit-function-declaration warnings
-
-These are seen with clang-15+
-
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- hosts_access.c | 3 +++
- safe_finger.c  | 1 +
- shell_cmd.c    | 3 +++
- tcpd.c         | 2 +-
- tcpdchk.c      | 1 +
- workarounds.c  | 1 +
- 6 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/hosts_access.c b/hosts_access.c
-index 0133e5e..58697ea 100644
---- a/hosts_access.c
-+++ b/hosts_access.c
-@@ -33,6 +33,12 @@ static char sccsid[] = "@(#) hosts_access.c 1.21 97/02/12 02:13:22";
- #endif
- #include <netinet/in.h>
- #include <arpa/inet.h>
-+#ifdef USE_GETDOMAIN
-+/* defined in workarounds.c */
-+extern int     yp_get_default_domain(char **ptr);
-+#else
-+#  include <rpcsvc/ypclnt.h>
-+#endif	/* USE_GETDOMAIN */
- #include <stdio.h>
- #include <stdlib.h>
- #include <syslog.h>
-@@ -45,6 +46,8 @@ static char sccsid[] = "@(#) hosts_access.c 1.21 97/02/12 02:13:22";
- #endif
- 
- extern int errno;
-+extern int match_pattern_ylo(const char *s, const char *pattern);
-+extern unsigned long cidr_mask_addr(char* str);
- 
- #ifndef	INADDR_NONE
- #define	INADDR_NONE	(-1)		/* XXX should be 0xffffffff */
-diff --git a/safe_finger.c b/safe_finger.c
-index 23afab1..a6458fb 100644
---- a/safe_finger.c
-+++ b/safe_finger.c
-@@ -34,6 +34,7 @@ static char sccsid[] = "@(#) safe_finger.c 1.4 94/12/28 17:42:41";
- #include <syslog.h>
- 
- extern void exit();
-+extern int pipe_stdin(char  **argv);
- 
- /* Local stuff */
- 
-diff --git a/shell_cmd.c b/shell_cmd.c
-index 62d31bc..a566092 100644
---- a/shell_cmd.c
-+++ b/shell_cmd.c
-@@ -16,10 +16,13 @@ static char sccsid[] = "@(#) shell_cmd.c 1.5 94/12/28 17:42:44";
- 
- #include <sys/types.h>
- #include <sys/param.h>
-+#include <sys/wait.h>
-+#include <fcntl.h>
- #include <signal.h>
- #include <stdio.h>
- #include <syslog.h>
- #include <string.h>
-+#include <unistd.h>
- 
- extern void exit();
- 
-diff --git a/tcpd.c b/tcpd.c
-index dc9ff17..4353caa 100644
---- a/tcpd.c
-+++ b/tcpd.c
-@@ -46,7 +46,7 @@ void fix_options(struct request_info *);
- int     allow_severity = SEVERITY;	/* run-time adjustable */
- int     deny_severity = LOG_WARNING;	/* ditto */
- 
--main(argc, argv)
-+void main(argc, argv)
- int     argc;
- char  **argv;
- {
-diff --git a/tcpdchk.c b/tcpdchk.c
-index 5dca8bd..67c12ce 100644
---- a/tcpdchk.c
-+++ b/tcpdchk.c
-@@ -38,6 +38,7 @@ static char sccsid[] = "@(#) tcpdchk.c 1.8 97/02/12 02:13:25";
- 
- extern int errno;
- extern void exit();
-+extern unsigned long cidr_mask_addr(char* str);
- extern int optind;
- extern char *optarg;
- 
-diff --git a/workarounds.c b/workarounds.c
-index b22b378..6335049 100644
---- a/workarounds.c
-+++ b/workarounds.c
-@@ -21,6 +21,7 @@ char    sccsid[] = "@(#) workarounds.c 1.6 96/03/19 16:22:25";
- #include <stdio.h>
- #include <syslog.h>
- #include <string.h>
-+#include <unistd.h>
- 
- extern int errno;
- 
--- 
-2.37.1
-
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch
deleted file mode 100644
index f485fe3fb6d..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 24d10919b4bc5e37a2d80b274d2cd2ee77b03549 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Jan 2020 14:25:47 -0800
-Subject: [PATCH] Remove fgets() extern declaration
-
-These sources already include <stdio.h> which should bring the correct
-declaration
-
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- hosts_access.c | 1 -
- misc.c         | 2 --
- 2 files changed, 3 deletions(-)
-
-diff --git a/hosts_access.c b/hosts_access.c
-index 329b35e..0133e5e 100644
---- a/hosts_access.c
-+++ b/hosts_access.c
-@@ -44,7 +44,6 @@ static char sccsid[] = "@(#) hosts_access.c 1.21 97/02/12 02:13:22";
- #include <netdb.h>
- #endif
- 
--extern char *fgets();
- extern int errno;
- 
- #ifndef	INADDR_NONE
-diff --git a/misc.c b/misc.c
-index 74ca319..9a5e73a 100644
---- a/misc.c
-+++ b/misc.c
-@@ -18,8 +18,6 @@ static char sccsic[] = "@(#) misc.c 1.2 96/02/11 17:01:29";
- 
- #include "tcpd.h"
- 
--extern char *fgets();
--
- #ifndef	INADDR_NONE
- #define	INADDR_NONE	(-1)		/* XXX should be 0xffffffff */
- #endif
--- 
-2.24.1
-
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.diff b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.diff
deleted file mode 100644
index c5ba3af3067..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.diff
+++ /dev/null
@@ -1,77 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_access.5
---- tcp_wrappers_7.6.orig/hosts_access.5	1995-01-30 19:51:47.000000000 +0100
-+++ tcp_wrappers_7.6/hosts_access.5	2004-04-09 16:59:45.000000000 +0200
-@@ -173,7 +173,7 @@
- Patterns like these can be used when the machine has different internet
- addresses with different internet hostnames.  Service providers can use
- this facility to offer FTP, GOPHER or WWW archives with internet names
--that may even belong to different organizations. See also the `twist'
-+that may even belong to different organizations. See also the `twist\'
- option in the hosts_options(5) document. Some systems (Solaris,
- FreeBSD) can have more than one internet address on one physical
- interface; with other systems you may have to resort to SLIP or PPP
-@@ -236,10 +236,10 @@
- Before accepting a client request, the wrappers can use the IDENT
- service to find out that the client did not send the request at all.
- When the client host provides IDENT service, a negative IDENT lookup
--result (the client matches `UNKNOWN@host') is strong evidence of a host
-+result (the client matches `UNKNOWN@host\') is strong evidence of a host
- spoofing attack.
- .PP
--A positive IDENT lookup result (the client matches `KNOWN@host') is
-+A positive IDENT lookup result (the client matches `KNOWN@host\') is
- less trustworthy. It is possible for an intruder to spoof both the
- client connection and the IDENT lookup, although doing so is much
- harder than spoofing just a client connection. It may also be that
-diff -ruN tcp_wrappers_7.6.orig/hosts_options.5 tcp_wrappers_7.6/hosts_options.5
---- tcp_wrappers_7.6.orig/hosts_options.5	1994-12-28 17:42:29.000000000 +0100
-+++ tcp_wrappers_7.6/hosts_options.5	2004-04-09 16:59:49.000000000 +0200
-@@ -124,7 +124,7 @@
- value is taken.
- .SH MISCELLANEOUS
- .IP "banners /some/directory"
--Look for a file in `/some/directory' with the same name as the daemon
-+Look for a file in `/some/directory\' with the same name as the daemon
- process (for example in.telnetd for the telnet service), and copy its
- contents to the client. Newline characters are replaced by
- carriage-return newline, and %<letter> sequences are expanded (see
-diff -ruN tcp_wrappers_7.6.orig/tcpdmatch.8 tcp_wrappers_7.6/tcpdmatch.8
---- tcp_wrappers_7.6.orig/tcpdmatch.8	1996-02-11 17:01:36.000000000 +0100
-+++ tcp_wrappers_7.6/tcpdmatch.8	2004-04-09 17:00:49.000000000 +0200
-@@ -26,7 +26,7 @@
- A daemon process name. Typically, the last component of a daemon
- executable pathname.
- .IP client
--A host name or network address, or one of the `unknown' or `paranoid'
-+A host name or network address, or one of the `unknown\' or `paranoid\'
- wildcard patterns.
- .sp
- When a client host name is specified, \fItcpdmatch\fR gives a
-@@ -37,13 +37,13 @@
- .PP
- Optional information specified with the \fIdaemon@server\fR form:
- .IP server
--A host name or network address, or one of the `unknown' or `paranoid'
--wildcard patterns. The default server name is `unknown'.
-+A host name or network address, or one of the `unknown\' or `paranoid\'
-+wildcard patterns. The default server name is `unknown\'.
- .PP
- Optional information specified with the \fIuser@client\fR form:
- .IP user
- A client user identifier. Typically, a login name or a numeric userid.
--The default user name is `unknown'.
-+The default user name is `unknown\'.
- .SH OPTIONS
- .IP -d
- Examine \fIhosts.allow\fR and \fIhosts.deny\fR files in the current
-@@ -70,7 +70,7 @@
- .ti +5
- tcpdmatch in.telnetd paranoid
- .PP
--On some systems, daemon names have no `in.' prefix, or \fItcpdmatch\fR
-+On some systems, daemon names have no `in.\' prefix, or \fItcpdmatch\fR
- may need some help to locate the inetd configuration file.
- .SH FILES
- .PP
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch
deleted file mode 100644
index fea8ab9d7af..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch
+++ /dev/null
@@ -1,250 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-diff -ruNp tcp_wrappers_7.6.orig/hosts_access.3 tcp_wrappers_7.6/hosts_access.3
---- tcp_wrappers_7.6.orig/hosts_access.3	2005-03-09 18:30:25.000000000 +0100
-+++ tcp_wrappers_7.6/hosts_access.3	2005-03-09 18:27:03.000000000 +0100
-@@ -3,7 +3,7 @@
- hosts_access, hosts_ctl, request_init, request_set \- access control library
- .SH SYNOPSIS
- .nf
--#include "tcpd.h"
-+#include <tcpd.h>
- 
- extern int allow_severity;
- extern int deny_severity;
-diff -ruNp tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_access.5
---- tcp_wrappers_7.6.orig/hosts_access.5	2005-03-09 18:30:25.000000000 +0100
-+++ tcp_wrappers_7.6/hosts_access.5	2005-03-09 18:30:18.000000000 +0100
-@@ -8,9 +8,9 @@ name, host name/address) patterns.  Exam
- impatient reader is encouraged to skip to the EXAMPLES section for a
- quick introduction.
- .PP
--An extended version of the access control language is described in the
--\fIhosts_options\fR(5) document. The extensions are turned on at
--program build time by building with -DPROCESS_OPTIONS.
-+The extended version of the access control language is described in the
-+\fIhosts_options\fR(5) document. \fBNote that this language supersedes
-+the meaning of \fIshell_command\fB as documented below.\fR
- .PP
- In the following text, \fIdaemon\fR is the the process name of a
- network daemon process, and \fIclient\fR is the name and/or address of
-@@ -346,8 +346,8 @@ in.tftpd: LOCAL, .my.domain
- /etc/hosts.deny:
- .in +3
- .nf
--in.tftpd: ALL: (/some/where/safe_finger -l @%h | \\
--	/usr/ucb/mail -s %d-%h root) &
-+in.tftpd: ALL: (/usr/sbin/safe_finger -l @%h | \\
-+	/usr/bin/mail -s %d-%h root) &
- .fi
- .PP
- The safe_finger command comes with the tcpd wrapper and should be
-@@ -383,6 +383,7 @@ that shouldn\'t.  All problems are repor
- .fi
- .SH SEE ALSO
- .nf
-+hosts_options(5) extended syntax.
- tcpd(8) tcp/ip daemon wrapper program.
- tcpdchk(8), tcpdmatch(8), test programs.
- .SH BUGS
-diff -ruNp tcp_wrappers_7.6.orig/hosts_options.5 tcp_wrappers_7.6/hosts_options.5
---- tcp_wrappers_7.6.orig/hosts_options.5	2005-03-09 18:30:24.000000000 +0100
-+++ tcp_wrappers_7.6/hosts_options.5	2005-03-09 18:27:03.000000000 +0100
-@@ -2,10 +2,8 @@
- .SH NAME
- hosts_options \- host access control language extensions
- .SH DESCRIPTION
--This document describes optional extensions to the language described
--in the hosts_access(5) document. The extensions are enabled at program
--build time. For example, by editing the Makefile and turning on the 
--PROCESS_OPTIONS compile-time option.
-+This document describes extensions to the language described
-+in the hosts_access(5) document.
- .PP
- The extensible language uses the following format:
- .sp
-@@ -58,12 +56,12 @@ Notice the leading dot on the domain nam
- Execute, in a child process, the specified shell command, after
- performing the %<letter> expansions described in the hosts_access(5)
- manual page.  The command is executed with stdin, stdout and stderr
--connected to the null device, so that it won\'t mess up the
-+connected to the null device, so that it won't mess up the
- conversation with the client host. Example:
- .sp
- .nf
- .ti +3
--spawn (/some/where/safe_finger -l @%h | /usr/ucb/mail root) &
-+spawn (/usr/sbin/safe_finger -l @%h | /usr/bin/mail root) &
- .fi
- .sp
- executes, in a background child process, the shell command "safe_finger
-diff -ruNp tcp_wrappers_7.6.orig/inetcf.c tcp_wrappers_7.6/inetcf.c
---- tcp_wrappers_7.6.orig/inetcf.c	1997-02-12 02:13:24.000000000 +0100
-+++ tcp_wrappers_7.6/inetcf.c	2005-03-09 18:27:03.000000000 +0100
-@@ -26,13 +26,17 @@ extern void exit();
-   * guesses. Shorter names follow longer ones.
-   */
- char   *inet_files[] = {
-+#if 0
-     "/private/etc/inetd.conf",		/* NEXT */
-     "/etc/inet/inetd.conf",		/* SYSV4 */
-     "/usr/etc/inetd.conf",		/* IRIX?? */
-+#endif
-     "/etc/inetd.conf",			/* BSD */
-+#if 0
-     "/etc/net/tlid.conf",		/* SYSV4?? */
-     "/etc/saf/tlid.conf",		/* SYSV4?? */
-     "/etc/tlid.conf",			/* SYSV4?? */
-+#endif
-     0,
- };
- 
-diff -ruNp tcp_wrappers_7.6.orig/tcpd.8 tcp_wrappers_7.6/tcpd.8
---- tcp_wrappers_7.6.orig/tcpd.8	1996-02-21 16:39:16.000000000 +0100
-+++ tcp_wrappers_7.6/tcpd.8	2005-03-09 18:27:03.000000000 +0100
-@@ -12,7 +12,11 @@ The program supports both 4.3BSD-style s
- TLI.  Functionality may be limited when the protocol underneath TLI is
- not an internet protocol.
- .PP
--Operation is as follows: whenever a request for service arrives, the
-+There are two possible modes of operation: execution of \fItcpd\fP
-+before a service started by \fIinetd\fP, or linking a daemon with
-+the \fIlibwrap\fP shared library as documented in the \fIhosts_access\fR(3)
-+manual page. Operation when started by \fIinetd\fP
-+is as follows: whenever a request for service arrives, the
- \fIinetd\fP daemon is tricked into running the \fItcpd\fP program
- instead of the desired server. \fItcpd\fP logs the request and does
- some additional checks. When all is well, \fItcpd\fP runs the
-@@ -88,11 +92,11 @@ configuration files.
- .sp
- .in +5
- # mkdir /other/place
--# mv /usr/etc/in.fingerd /other/place
--# cp tcpd /usr/etc/in.fingerd
-+# mv /usr/sbin/in.fingerd /other/place
-+# cp tcpd /usr/sbin/in.fingerd
- .fi
- .PP
--The example assumes that the network daemons live in /usr/etc. On some
-+The example assumes that the network daemons live in /usr/sbin. On some
- systems, network daemons live in /usr/sbin or in /usr/libexec, or have
- no `in.\' prefix to their name.
- .SH EXAMPLE 2
-@@ -101,35 +105,34 @@ are left in their original place.
- .PP
- In order to monitor access to the \fIfinger\fR service, perform the
- following edits on the \fIinetd\fR configuration file (usually 
--\fI/etc/inetd.conf\fR or \fI/etc/inet/inetd.conf\fR):
-+\fI/etc/inetd.conf\fR):
- .nf
- .sp
- .ti +5
--finger  stream  tcp  nowait  nobody  /usr/etc/in.fingerd  in.fingerd
-+finger  stream  tcp  nowait  nobody  /usr/sbin/in.fingerd  in.fingerd
- .sp
- becomes:
- .sp
- .ti +5
--finger  stream  tcp  nowait  nobody  /some/where/tcpd     in.fingerd
-+finger  stream  tcp  nowait  nobody  /usr/sbin/tcpd     in.fingerd
- .sp
- .fi
- .PP
--The example assumes that the network daemons live in /usr/etc. On some
-+The example assumes that the network daemons live in /usr/sbin. On some
- systems, network daemons live in /usr/sbin or in /usr/libexec, the
- daemons have no `in.\' prefix to their name, or there is no userid
- field in the inetd configuration file.
- .PP
- Similar changes will be needed for the other services that are to be
- covered by \fItcpd\fR.  Send a `kill -HUP\' to the \fIinetd\fR(8)
--process to make the changes effective. AIX users may also have to
--execute the `inetimp\' command.
-+process to make the changes effective.
- .SH EXAMPLE 3
- In the case of daemons that do not live in a common directory ("secret"
- or otherwise), edit the \fIinetd\fR configuration file so that it
- specifies an absolute path name for the process name field. For example:
- .nf
- .sp
--    ntalk  dgram  udp  wait  root  /some/where/tcpd  /usr/local/lib/ntalkd
-+    ntalk  dgram  udp  wait  root  /usr/sbin/tcpd  /usr/local/lib/ntalkd
- .sp
- .fi
- .PP
-@@ -164,6 +167,7 @@ The default locations of the host access
- .SH SEE ALSO
- .na
- .nf
-+hosts_access(3), functions provided by the libwrap library.
- hosts_access(5), format of the tcpd access control tables.
- syslog.conf(5), format of the syslogd control file.
- inetd.conf(5), format of the inetd control file.
-diff -ruNp tcp_wrappers_7.6.orig/tcpdchk.8 tcp_wrappers_7.6/tcpdchk.8
---- tcp_wrappers_7.6.orig/tcpdchk.8	1995-01-08 17:00:31.000000000 +0100
-+++ tcp_wrappers_7.6/tcpdchk.8	2005-03-09 18:27:03.000000000 +0100
-@@ -9,8 +9,8 @@ tcpdchk [-a] [-d] [-i inet_conf] [-v]
- potential and real problems it can find. The program examines the
- \fItcpd\fR access control files (by default, these are
- \fI/etc/hosts.allow\fR and \fI/etc/hosts.deny\fR), and compares the
--entries in these files against entries in the \fIinetd\fR or \fItlid\fR
--network configuration files.
-+entries in these files against entries in the \fIinetd\fR
-+network configuration file.
- .PP
- \fItcpdchk\fR reports problems such as non-existent pathnames; services
- that appear in \fItcpd\fR access control rules, but are not controlled
-@@ -26,14 +26,13 @@ problem.
- .SH OPTIONS
- .IP -a
- Report access control rules that permit access without an explicit
--ALLOW keyword. This applies only when the extended access control
--language is enabled (build with -DPROCESS_OPTIONS).
-+ALLOW keyword.
- .IP -d
- Examine \fIhosts.allow\fR and \fIhosts.deny\fR files in the current
- directory instead of the default ones.
- .IP "-i inet_conf"
- Specify this option when \fItcpdchk\fR is unable to find your
--\fIinetd.conf\fR or \fItlid.conf\fR network configuration file, or when
-+\fIinetd.conf\fR network configuration file, or when
- you suspect that the program uses the wrong one.
- .IP -v
- Display the contents of each access control rule.  Daemon lists, client
-@@ -54,7 +53,6 @@ tcpdmatch(8), explain what tcpd would do
- hosts_access(5), format of the tcpd access control tables.
- hosts_options(5), format of the language extensions.
- inetd.conf(5), format of the inetd control file.
--tlid.conf(5), format of the tlid control file.
- .SH AUTHORS
- .na
- .nf
-diff -ruNp tcp_wrappers_7.6.orig/tcpdmatch.8 tcp_wrappers_7.6/tcpdmatch.8
---- tcp_wrappers_7.6.orig/tcpdmatch.8	2005-03-09 18:30:24.000000000 +0100
-+++ tcp_wrappers_7.6/tcpdmatch.8	2005-03-09 18:27:03.000000000 +0100
-@@ -13,7 +13,7 @@ request for service.  Examples are given
- The program examines the \fItcpd\fR access control tables (default
- \fI/etc/hosts.allow\fR and \fI/etc/hosts.deny\fR) and prints its
- conclusion.  For maximal accuracy, it extracts additional information
--from your \fIinetd\fR or \fItlid\fR network configuration file.
-+from your \fIinetd\fR network configuration file.
- .PP
- When \fItcpdmatch\fR finds a match in the access control tables, it
- identifies the matched rule. In addition, it displays the optional
-@@ -50,7 +50,7 @@ Examine \fIhosts.allow\fR and \fIhosts.d
- directory instead of the default ones.
- .IP "-i inet_conf"
- Specify this option when \fItcpdmatch\fR is unable to find your
--\fIinetd.conf\fR or \fItlid.conf\fR network configuration file, or when
-+\fIinetd.conf\fR network configuration file, or when
- you suspect that the program uses the wrong one.
- .SH EXAMPLES
- To predict how \fItcpd\fR would handle a telnet request from the local
-@@ -86,7 +86,6 @@ tcpdchk(8), tcpd configuration checker
- hosts_access(5), format of the tcpd access control tables.
- hosts_options(5), format of the language extensions.
- inetd.conf(5), format of the inetd control file.
--tlid.conf(5), format of the tlid control file.
- .SH AUTHORS
- .na
- .nf
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch
deleted file mode 100644
index 525cd3531ba..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-See https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=17847
-
-diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_access.5
---- tcp_wrappers_7.6.orig/hosts_access.5	2004-04-10 18:54:33.000000000 +0200
-+++ tcp_wrappers_7.6/hosts_access.5	2004-04-10 18:54:27.000000000 +0200
-@@ -89,6 +89,10 @@
- bitwise AND of the address and the `mask\'. For example, the net/mask
- pattern `131.155.72.0/255.255.254.0\' matches every address in the
- range `131.155.72.0\' through `131.155.73.255\'.
-+.IP \(bu
-+Wildcards `*\' and `?\' can be used to match hostnames or IP addresses.  This
-+method of matching cannot be used in conjunction with `net/mask\' matching,
-+hostname matching beginning with `.\' or IP address matching ending with `.\'.
- .SH WILDCARDS
- The access control language supports explicit wildcards:
- .IP ALL
-diff -ruN tcp_wrappers_7.6.orig/hosts_access.c tcp_wrappers_7.6/hosts_access.c
---- tcp_wrappers_7.6.orig/hosts_access.c	1997-02-12 02:13:23.000000000 +0100
-+++ tcp_wrappers_7.6/hosts_access.c	2004-04-10 18:52:21.000000000 +0200
-@@ -289,6 +289,11 @@
- {
-     int     n;
- 
-+#ifndef DISABLE_WILDCARD_MATCHING
-+    if (strchr(tok, '*') || strchr(tok,'?')) {  /* contains '*' or '?' */
-+        return (match_pattern_ylo(string,tok)); 	       
-+    } else 
-+#endif    
-     if (tok[0] == '.') {			/* suffix */
- 	n = strlen(string) - strlen(tok);
- 	return (n > 0 && STR_EQ(tok, string + n));
-@@ -329,3 +334,71 @@
-     }
-     return ((addr & mask) == net);
- }
-+
-+#ifndef DISABLE_WILDCARD_MATCHING
-+/* Note: this feature has been adapted in a pretty straightforward way
-+   from Tatu Ylonen's last SSH version under free license by 
-+   Pekka Savola <pekkas@netcore.fi>.
-+
-+   Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
-+*/
-+
-+/* Returns true if the given string matches the pattern (which may contain
-+   ? and * as wildcards), and zero if it does not match. */
-+	  
-+int match_pattern_ylo(const char *s, const char *pattern)
-+{
-+  while (1)
-+    {
-+      /* If at end of pattern, accept if also at end of string. */
-+      if (!*pattern)
-+        return !*s;
-+
-+      /* Process '*'. */
-+      if (*pattern == '*')
-+        {
-+	  /* Skip the asterisk. */
-+	  pattern++;
-+
-+	  /* If at end of pattern, accept immediately. */
-+          if (!*pattern)
-+            return 1;
-+
-+	  /* If next character in pattern is known, optimize. */
-+          if (*pattern != '?' && *pattern != '*')
-+            {
-+	      /* Look instances of the next character in pattern, and try
-+		 to match starting from those. */
-+              for (; *s; s++)
-+                if (*s == *pattern &&
-+                    match_pattern_ylo(s + 1, pattern + 1))
-+                  return 1;
-+	      /* Failed. */
-+              return 0;
-+            }
-+
-+	  /* Move ahead one character at a time and try to match at each
-+	     position. */
-+          for (; *s; s++)
-+            if (match_pattern_ylo(s, pattern))
-+              return 1;
-+	  /* Failed. */
-+          return 0;
-+        }
-+
-+      /* There must be at least one more character in the string.  If we are
-+	 at the end, fail. */
-+      if (!*s)
-+        return 0;
-+
-+      /* Check if the next character of the string is acceptable. */
-+      if (*pattern != '?' && *pattern != *s)
-+	return 0;
-+      
-+      /* Move to the next character, both in string and in pattern. */
-+      s++;
-+      pattern++;
-+    }
-+  /*NOTREACHED*/
-+}
-+#endif /* DISABLE_WILDCARD_MATCHING */
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch
deleted file mode 100644
index 1f3f9e24acd..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-* Mon Feb  5 2001 Preston Brown <pbrown@redhat.com>
-- fix gethostbyname to work better with dot "." notation (#16949)
-
---- tcp_wrappers_7.6/socket.c.fixgethostbyname	Fri Mar 21 13:27:25 1997
-+++ tcp_wrappers_7.6/socket.c	Mon Feb  5 14:09:40 2001
-@@ -52,7 +52,8 @@
- char   *name;
- {
-     char    dot_name[MAXHOSTNAMELEN + 1];
--
-+    struct hostent *hp;
-+    
-     /*
-      * Don't append dots to unqualified names. Such names are likely to come
-      * from local hosts files or from NIS.
-@@ -61,8 +62,12 @@
-     if (strchr(name, '.') == 0 || strlen(name) >= MAXHOSTNAMELEN - 1) {
- 	return (gethostbyname(name));
-     } else {
--	sprintf(dot_name, "%s.", name);
--	return (gethostbyname(dot_name));
-+        sprintf(dot_name, "%s.", name);
-+        hp = gethostbyname(dot_name);
-+	if (hp)
-+	    return hp;
-+	else
-+	    return (gethostbyname(name));
-     }
- }
- 
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch
deleted file mode 100644
index ea45777734d..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch
+++ /dev/null
@@ -1,1255 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-diff -ruN tcp_wrappers_7.6.orig/fix_options.c tcp_wrappers_7.6/fix_options.c
---- tcp_wrappers_7.6.orig/fix_options.c	1997-04-08 02:29:19.000000000 +0200
-+++ tcp_wrappers_7.6/fix_options.c	2004-04-10 19:07:43.000000000 +0200
-@@ -11,6 +11,9 @@
- 
- #include <sys/types.h>
- #include <sys/param.h>
-+#ifdef INET6
-+#include <sys/socket.h>
-+#endif
- #include <netinet/in.h>
- #include <netinet/in_systm.h>
- #include <netinet/ip.h>
-@@ -41,6 +44,22 @@
-     unsigned int opt;
-     int     optlen;
-     struct in_addr dummy;
-+#ifdef INET6
-+    struct sockaddr_storage ss;
-+    int sslen;
-+
-+    /*
-+     * check if this is AF_INET socket
-+     * XXX IPv6 support?
-+     */
-+    sslen = sizeof(ss);
-+    if (getsockname(fd, (struct sockaddr *)&ss, &sslen) < 0) {
-+	syslog(LOG_ERR, "getpeername: %m");
-+	clean_exit(request);
-+    }
-+    if (ss.ss_family != AF_INET)
-+	return;
-+#endif
- 
-     if ((ip = getprotobyname("ip")) != 0)
- 	ipproto = ip->p_proto;
-diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_access.5
---- tcp_wrappers_7.6.orig/hosts_access.5	2004-04-10 19:22:58.000000000 +0200
-+++ tcp_wrappers_7.6/hosts_access.5	2004-04-10 19:07:43.000000000 +0200
-@@ -85,11 +85,18 @@
- for daemon process names or for client user names.
- .IP \(bu
- An expression of the form `n.n.n.n/m.m.m.m\' is interpreted as a
--`net/mask\' pair. A host address is matched if `net\' is equal to the
-+`net/mask\' pair. An IPv4 host address is matched if `net\' is equal to the
- bitwise AND of the address and the `mask\'. For example, the net/mask
- pattern `131.155.72.0/255.255.254.0\' matches every address in the
- range `131.155.72.0\' through `131.155.73.255\'.
- .IP \(bu
-+An expression of the form `[n:n:n:n:n:n:n:n]/m\' is interpreted as a
-+`[net]/prefixlen\' pair. An IPv6 host address is matched if
-+`prefixlen\' bits of `net\' is equal to the `prefixlen\' bits of the
-+address. For example, the [net]/prefixlen pattern
-+`[3ffe:505:2:1::]/64\' matches every address in the range
-+`3ffe:505:2:1::\' through `3ffe:505:2:1:ffff:ffff:ffff:ffff\'.
-+.IP \(bu
- Wildcards `*\' and `?\' can be used to match hostnames or IP addresses.  This
- method of matching cannot be used in conjunction with `net/mask\' matching,
- hostname matching beginning with `.\' or IP address matching ending with `.\'.
-diff -ruN tcp_wrappers_7.6.orig/hosts_access.c tcp_wrappers_7.6/hosts_access.c
---- tcp_wrappers_7.6.orig/hosts_access.c	2004-04-10 19:22:58.000000000 +0200
-+++ tcp_wrappers_7.6/hosts_access.c	2004-04-10 19:07:43.000000000 +0200
-@@ -24,7 +24,13 @@
- /* System libraries. */
- 
- #include <sys/types.h>
-+#ifdef INT32_T
-+    typedef uint32_t u_int32_t;
-+#endif
- #include <sys/param.h>
-+#ifdef INET6
-+#include <sys/socket.h>
-+#endif
- #include <netinet/in.h>
- #include <arpa/inet.h>
- #include <stdio.h>
-@@ -33,6 +39,9 @@
- #include <errno.h>
- #include <setjmp.h>
- #include <string.h>
-+#ifdef INET6
-+#include <netdb.h>
-+#endif
- 
- extern char *fgets();
- extern int errno;
-@@ -82,6 +91,10 @@
- static int host_match();
- static int string_match();
- static int masked_match();
-+#ifdef INET6
-+static int masked_match4();
-+static int masked_match6();
-+#endif
- 
- /* Size of logical line buffer. */
- 
-@@ -289,6 +302,13 @@
- {
-     int     n;
- 
-+#ifdef INET6
-+    /* convert IPv4 mapped IPv6 address to IPv4 address */
-+    if (STRN_EQ(string, "::ffff:", 7)
-+      && dot_quad_addr(string + 7) != INADDR_NONE) {
-+      string += 7;
-+    }
-+#endif    
- #ifndef DISABLE_WILDCARD_MATCHING
-     if (strchr(tok, '*') || strchr(tok,'?')) {  /* contains '*' or '?' */
-         return (match_pattern_ylo(string,tok)); 	       
-@@ -304,20 +324,72 @@
-     } else if (tok[(n = strlen(tok)) - 1] == '.') {	/* prefix */
- 	return (STRN_EQ(tok, string, n));
-     } else {					/* exact match */
-+#ifdef INET6
-+	struct addrinfo hints, *res;
-+	struct sockaddr_in6 pat, addr;
-+	int len, ret;
-+	char ch;
-+
-+	len = strlen(tok);
-+	if (*tok == '[' && tok[len - 1] == ']') {
-+	    ch = tok[len - 1];
-+	    tok[len - 1] = '\0';
-+	    memset(&hints, 0, sizeof(hints));
-+	    hints.ai_family = AF_INET6;
-+	    hints.ai_socktype = SOCK_STREAM;
-+	    hints.ai_flags = AI_PASSIVE | AI_NUMERICHOST;
-+	    if ((ret = getaddrinfo(tok + 1, NULL, &hints, &res)) == 0) {
-+		memcpy(&pat, res->ai_addr, sizeof(pat));
-+		freeaddrinfo(res);
-+	    }
-+	    tok[len - 1] = ch;
-+	    if (ret != 0 || getaddrinfo(string, NULL, &hints, &res) != 0)
-+		return NO;
-+	    memcpy(&addr, res->ai_addr, sizeof(addr));
-+	    freeaddrinfo(res);
-+#ifdef NI_WITHSCOPEID
-+	    if (pat.sin6_scope_id != 0 &&
-+		addr.sin6_scope_id != pat.sin6_scope_id)
-+		return NO;
-+#endif
-+	    return (!memcmp(&pat.sin6_addr, &addr.sin6_addr,
-+			    sizeof(struct in6_addr)));
-+	    return (ret);
-+	}
-+#endif
- 	return (STR_EQ(tok, string));
-     }
- }
- 
- /* masked_match - match address against netnumber/netmask */
- 
-+#ifdef INET6
- static int masked_match(net_tok, mask_tok, string)
- char   *net_tok;
- char   *mask_tok;
- char   *string;
- {
-+    return (masked_match4(net_tok, mask_tok, string) ||
-+	    masked_match6(net_tok, mask_tok, string));
-+}
-+
-+static int masked_match4(net_tok, mask_tok, string)
-+#else
-+static int masked_match(net_tok, mask_tok, string)
-+#endif
-+char   *net_tok;
-+char   *mask_tok;
-+char   *string;
-+{
-+#ifdef INET6
-+    u_int32_t net;
-+    u_int32_t mask;
-+    u_int32_t addr;
-+#else
-     unsigned long net;
-     unsigned long mask;
-     unsigned long addr;
-+#endif
- 
-     /*
-      * Disallow forms other than dotted quad: the treatment that inet_addr()
-@@ -329,12 +401,78 @@
- 	return (NO);
-     if ((net = dot_quad_addr(net_tok)) == INADDR_NONE
- 	|| (mask = dot_quad_addr(mask_tok)) == INADDR_NONE) {
-+#ifndef INET6
- 	tcpd_warn("bad net/mask expression: %s/%s", net_tok, mask_tok);
-+#endif
- 	return (NO);				/* not tcpd_jump() */
-     }
-     return ((addr & mask) == net);
- }
- 
-+#ifdef INET6
-+static int masked_match6(net_tok, mask_tok, string)
-+char   *net_tok;
-+char   *mask_tok;
-+char   *string;
-+{
-+    struct addrinfo hints, *res;
-+    struct sockaddr_in6 net, addr;
-+    u_int32_t mask;
-+    int len, mask_len, i = 0;
-+    char ch;
-+
-+    memset(&hints, 0, sizeof(hints));
-+    hints.ai_family = AF_INET6;
-+    hints.ai_socktype = SOCK_STREAM;
-+    hints.ai_flags = AI_PASSIVE | AI_NUMERICHOST;
-+    if (getaddrinfo(string, NULL, &hints, &res) != 0)
-+	return NO;
-+    memcpy(&addr, res->ai_addr, sizeof(addr));
-+    freeaddrinfo(res);
-+
-+    if (IN6_IS_ADDR_V4MAPPED(&addr.sin6_addr)) {
-+	if ((*(u_int32_t *)&net.sin6_addr.s6_addr[12] = dot_quad_addr(net_tok)) == INADDR_NONE
-+	 || (mask = dot_quad_addr(mask_tok)) == INADDR_NONE)
-+	    return (NO);
-+	return ((*(u_int32_t *)&addr.sin6_addr.s6_addr[12] & mask) == *(u_int32_t *)&net.sin6_addr.s6_addr[12]);
-+    }
-+
-+    /* match IPv6 address against netnumber/prefixlen */
-+    len = strlen(net_tok);
-+    if (*net_tok != '[' || net_tok[len - 1] != ']')
-+	return NO;
-+    ch = net_tok[len - 1];
-+    net_tok[len - 1] = '\0';
-+    if (getaddrinfo(net_tok + 1, NULL, &hints, &res) != 0) {
-+	net_tok[len - 1] = ch;
-+	return NO;
-+    }
-+    memcpy(&net, res->ai_addr, sizeof(net));
-+    freeaddrinfo(res);
-+    net_tok[len - 1] = ch;
-+    if ((mask_len = atoi(mask_tok)) < 0 || mask_len > 128)
-+	return NO;
-+
-+#ifdef NI_WITHSCOPEID
-+    if (net.sin6_scope_id != 0 && addr.sin6_scope_id != net.sin6_scope_id)
-+	return NO;
-+#endif
-+    while (mask_len > 0) {
-+	if (mask_len < 32) {
-+	    mask = htonl(~(0xffffffff >> mask_len));
-+	    if ((*(u_int32_t *)&addr.sin6_addr.s6_addr[i] & mask) != (*(u_int32_t *)&net.sin6_addr.s6_addr[i] & mask))
-+		return NO;
-+	    break;
-+	}
-+	if (*(u_int32_t *)&addr.sin6_addr.s6_addr[i] != *(u_int32_t *)&net.sin6_addr.s6_addr[i])
-+	    return NO;
-+	i += 4;
-+	mask_len -= 32;
-+    }
-+    return YES;
-+}
-+#endif /* INET6 */
-+
- #ifndef DISABLE_WILDCARD_MATCHING
- /* Note: this feature has been adapted in a pretty straightforward way
-    from Tatu Ylonen's last SSH version under free license by 
-diff -ruN tcp_wrappers_7.6.orig/Makefile tcp_wrappers_7.6/Makefile
---- tcp_wrappers_7.6.orig/Makefile	1997-03-21 19:27:21.000000000 +0100
-+++ tcp_wrappers_7.6/Makefile	2004-04-10 19:22:44.000000000 +0200
-@@ -21,7 +21,7 @@
- 	@echo "	dynix epix esix freebsd hpux irix4 irix5 irix6 isc iunix"
- 	@echo "	linux machten mips(untested) ncrsvr4 netbsd next osf power_unix_211"
- 	@echo "	ptx-2.x ptx-generic pyramid sco sco-nis sco-od2 sco-os5 sinix sunos4"
--	@echo "	sunos40 sunos5 sysv4 tandem ultrix unicos7 unicos8 unixware1 unixware2"
-+	@echo "	sunos40 sunos5 solaris8 sysv4 tandem ultrix unicos7 unicos8 unixware1 unixware2"
- 	@echo "	uts215 uxp"
- 	@echo
- 	@echo "If none of these match your environment, edit the system"
-@@ -131,20 +131,34 @@
- 	NETGROUP=-DNETGROUP TLI= SYSTYPE="-systype bsd43" all
- 
- # Freebsd and linux by default have no NIS.
--386bsd netbsd bsdos:
-+386bsd bsdos:
- 	@make REAL_DAEMON_DIR=$(REAL_DAEMON_DIR) STYLE=$(STYLE) \
- 	LIBS= RANLIB=ranlib ARFLAGS=rv AUX_OBJ= NETGROUP= TLI= \
- 	EXTRA_CFLAGS=-DSYS_ERRLIST_DEFINED VSYSLOG= all
- 
- freebsd:
- 	@make REAL_DAEMON_DIR=$(REAL_DAEMON_DIR) STYLE=$(STYLE) \
-+	LIBS="-L/usr/local/v6/lib -linet6" \
- 	LIBS= RANLIB=ranlib ARFLAGS=rv AUX_OBJ= NETGROUP= TLI= \
--	EXTRA_CFLAGS=-DSYS_ERRLIST_DEFINED VSYSLOG= all
-+	EXTRA_CFLAGS="-DSYS_ERRLIST_DEFINED -DINET6 -Dss_family=__ss_family -Dss_len=__ss_len" \
-+	VSYSLOG= all
-+
-+netbsd:
-+	@make REAL_DAEMON_DIR=$(REAL_DAEMON_DIR) STYLE=$(STYLE) \
-+	LIBS= RANLIB=ranlib ARFLAGS=rv AUX_OBJ= NETGROUP= TLI= \
-+	EXTRA_CFLAGS="-DSYS_ERRLIST_DEFINED -DINET6 -Dss_family=__ss_family -Dss_len=__ss_len" VSYSLOG= all
- 
- linux:
- 	@make REAL_DAEMON_DIR=$(REAL_DAEMON_DIR) STYLE=$(STYLE) \
--	LIBS= RANLIB=ranlib ARFLAGS=rv AUX_OBJ=setenv.o \
--	NETGROUP= TLI= EXTRA_CFLAGS="-DBROKEN_SO_LINGER" all
-+	LIBS=-lnsl RANLIB=ranlib ARFLAGS=rv AUX_OBJ= \
-+	NETGROUP="-DNETGROUP" TLI= VSYSLOG= BUGS= \
-+	EXTRA_CFLAGS="-DSYS_ERRLIST_DEFINED -DHAVE_STRERROR -DINET6=1 -Dss_family=__ss_family -Dss_len=__ss_len" all
-+
-+gnu:
-+	@make REAL_DAEMON_DIR=$(REAL_DAEMON_DIR) STYLE=$(STYLE) \
-+	LIBS=-lnsl RANLIB=ranlib ARFLAGS=rv AUX_OBJ= \
-+	NETGROUP=-DNETGROUP TLI= VSYSLOG= BUGS= \
-+	EXTRA_CFLAGS="-DSYS_ERRLIST_DEFINED -DHAVE_STRERROR" all
- 
- # This is good for many SYSV+BSD hybrids with NIS, probably also for HP-UX 7.x.
- hpux hpux8 hpux9 hpux10:
-@@ -196,6 +210,13 @@
- 	NETGROUP=-DNETGROUP AUX_OBJ=setenv.o TLI=-DTLI \
- 	BUGS="$(BUGS) -DSOLARIS_24_GETHOSTBYNAME_BUG" all
- 
-+# SunOS 5.8 is another SYSV4 variant, but has IPv6 support
-+solaris8:
-+	@make REAL_DAEMON_DIR=$(REAL_DAEMON_DIR) STYLE=$(STYLE) \
-+	LIBS="-lsocket -lnsl" RANLIB=echo ARFLAGS=rv VSYSLOG= \
-+	NETGROUP=-DNETGROUP AUX_OBJ=setenv.o TLI=-DTLI \
-+	EXTRA_CFLAGS="-DINET6 -DNO_CLONE_DEVICE -DINT32_T" all
-+
- # Generic SYSV40
- esix sysv4:
- 	@make REAL_DAEMON_DIR=$(REAL_DAEMON_DIR) STYLE=$(STYLE) \
-diff -ruN tcp_wrappers_7.6.orig/misc.c tcp_wrappers_7.6/misc.c
---- tcp_wrappers_7.6.orig/misc.c	1996-02-11 17:01:30.000000000 +0100
-+++ tcp_wrappers_7.6/misc.c	2004-04-10 19:07:43.000000000 +0200
-@@ -58,9 +58,31 @@
- {
-     char   *cp;
- 
-+#ifdef INET6
-+    int bracket = 0;
-+
-+    for (cp = string; cp && *cp; cp++) {
-+	switch (*cp) {
-+	case '[':
-+	    bracket++;
-+	    break;
-+	case ']':
-+	    bracket--;
-+	    break;
-+	default:
-+	    if (bracket == 0 && *cp == delimiter) {
-+		*cp++ = 0;
-+		return cp;
-+	    }
-+	    break;
-+	}
-+    }
-+    return (NULL);
-+#else
-     if ((cp = strchr(string, delimiter)) != 0)
- 	*cp++ = 0;
-     return (cp);
-+#endif
- }
- 
- /* dot_quad_addr - convert dotted quad to internal form */
-diff -ruN tcp_wrappers_7.6.orig/refuse.c tcp_wrappers_7.6/refuse.c
---- tcp_wrappers_7.6.orig/refuse.c	1994-12-28 17:42:40.000000000 +0100
-+++ tcp_wrappers_7.6/refuse.c	2004-04-10 19:07:43.000000000 +0200
-@@ -25,7 +25,12 @@
- void    refuse(request)
- struct request_info *request;
- {
-+#ifdef INET6
-+    syslog(deny_severity, "refused connect from %s (%s)",
-+	   eval_client(request), eval_hostaddr(request->client));
-+#else
-     syslog(deny_severity, "refused connect from %s", eval_client(request));
-+#endif
-     clean_exit(request);
-     /* NOTREACHED */
- }
-diff -ruN tcp_wrappers_7.6.orig/rfc931.c tcp_wrappers_7.6/rfc931.c
---- tcp_wrappers_7.6.orig/rfc931.c	1995-01-02 16:11:34.000000000 +0100
-+++ tcp_wrappers_7.6/rfc931.c	2004-04-10 19:07:43.000000000 +0200
-@@ -68,20 +68,50 @@
- /* rfc931 - return remote user name, given socket structures */
- 
- void    rfc931(rmt_sin, our_sin, dest)
-+#ifdef INET6
-+struct sockaddr *rmt_sin;
-+struct sockaddr *our_sin;
-+#else
- struct sockaddr_in *rmt_sin;
- struct sockaddr_in *our_sin;
-+#endif
- char   *dest;
- {
-     unsigned rmt_port;
-     unsigned our_port;
-+#ifdef INET6
-+    struct sockaddr_storage rmt_query_sin;
-+    struct sockaddr_storage our_query_sin;
-+    int alen;
-+#else
-     struct sockaddr_in rmt_query_sin;
-     struct sockaddr_in our_query_sin;
-+#endif
-     char    user[256];			/* XXX */
-     char    buffer[512];		/* XXX */
-     char   *cp;
-     char   *result = unknown;
-     FILE   *fp;
- 
-+#ifdef INET6
-+    /* address family must be the same */
-+    if (rmt_sin->sa_family != our_sin->sa_family) {
-+	STRN_CPY(dest, result, STRING_LENGTH);
-+	return;
-+    }
-+    switch (our_sin->sa_family) {
-+    case AF_INET:
-+	alen = sizeof(struct sockaddr_in);
-+	break;
-+    case AF_INET6:
-+	alen = sizeof(struct sockaddr_in6);
-+	break;
-+    default:
-+	STRN_CPY(dest, result, STRING_LENGTH);
-+	return;
-+    }
-+#endif
-+
-     /*
-      * Use one unbuffered stdio stream for writing to and for reading from
-      * the RFC931 etc. server. This is done because of a bug in the SunOS
-@@ -92,7 +122,11 @@
-      * sockets.
-      */
- 
-+#ifdef INET6
-+    if ((fp = fsocket(our_sin->sa_family, SOCK_STREAM, 0)) != 0) {
-+#else
-     if ((fp = fsocket(AF_INET, SOCK_STREAM, 0)) != 0) {
-+#endif
- 	setbuf(fp, (char *) 0);
- 
- 	/*
-@@ -112,6 +146,25 @@
- 	     * addresses from the query socket.
- 	     */
- 
-+#ifdef INET6
-+	    memcpy(&our_query_sin, our_sin, alen);
-+	    memcpy(&rmt_query_sin, rmt_sin, alen);
-+	    switch (our_sin->sa_family) {
-+	    case AF_INET:
-+		((struct sockaddr_in *)&our_query_sin)->sin_port = htons(ANY_PORT);
-+		((struct sockaddr_in *)&rmt_query_sin)->sin_port = htons(RFC931_PORT);
-+		break;
-+	    case AF_INET6:
-+		((struct sockaddr_in6 *)&our_query_sin)->sin6_port = htons(ANY_PORT);
-+		((struct sockaddr_in6 *)&rmt_query_sin)->sin6_port = htons(RFC931_PORT);
-+		break;
-+	    }
-+
-+	    if (bind(fileno(fp), (struct sockaddr *) & our_query_sin,
-+		     alen) >= 0 &&
-+		connect(fileno(fp), (struct sockaddr *) & rmt_query_sin,
-+			alen) >= 0) {
-+#else
- 	    our_query_sin = *our_sin;
- 	    our_query_sin.sin_port = htons(ANY_PORT);
- 	    rmt_query_sin = *rmt_sin;
-@@ -121,6 +174,7 @@
- 		     sizeof(our_query_sin)) >= 0 &&
- 		connect(fileno(fp), (struct sockaddr *) & rmt_query_sin,
- 			sizeof(rmt_query_sin)) >= 0) {
-+#endif
- 
- 		/*
- 		 * Send query to server. Neglect the risk that a 13-byte
-@@ -129,8 +183,13 @@
- 		 */
- 
- 		fprintf(fp, "%u,%u\r\n",
-+#ifdef INET6
-+			ntohs(((struct sockaddr_in *)rmt_sin)->sin_port),
-+			ntohs(((struct sockaddr_in *)our_sin)->sin_port));
-+#else
- 			ntohs(rmt_sin->sin_port),
- 			ntohs(our_sin->sin_port));
-+#endif
- 		fflush(fp);
- 
- 		/*
-@@ -144,8 +203,13 @@
- 		    && ferror(fp) == 0 && feof(fp) == 0
- 		    && sscanf(buffer, "%u , %u : USERID :%*[^:]:%255s",
- 			      &rmt_port, &our_port, user) == 3
-+#ifdef INET6
-+		    && ntohs(((struct sockaddr_in *)rmt_sin)->sin_port) == rmt_port
-+		    && ntohs(((struct sockaddr_in *)our_sin)->sin_port) == our_port) {
-+#else
- 		    && ntohs(rmt_sin->sin_port) == rmt_port
- 		    && ntohs(our_sin->sin_port) == our_port) {
-+#endif
- 
- 		    /*
- 		     * Strip trailing carriage return. It is part of the
-diff -ruN tcp_wrappers_7.6.orig/scaffold.c tcp_wrappers_7.6/scaffold.c
---- tcp_wrappers_7.6.orig/scaffold.c	1997-03-21 19:27:24.000000000 +0100
-+++ tcp_wrappers_7.6/scaffold.c	2004-04-10 19:07:43.000000000 +0200
-@@ -25,7 +25,9 @@
- #define	INADDR_NONE	(-1)		/* XXX should be 0xffffffff */
- #endif
- 
-+#ifndef INET6
- extern char *malloc();
-+#endif
- 
- /* Application-specific. */
- 
-@@ -39,6 +41,7 @@
- int     deny_severity = LOG_WARNING;
- int     rfc931_timeout = RFC931_TIMEOUT;
- 
-+#ifndef INET6
- /* dup_hostent - create hostent in one memory block */
- 
- static struct hostent *dup_hostent(hp)
-@@ -73,9 +76,46 @@
-     }
-     return (&hb->host);
- }
-+#endif
- 
- /* find_inet_addr - find all addresses for this host, result to free() */
- 
-+#ifdef INET6
-+struct addrinfo *find_inet_addr(host)
-+char   *host;
-+{
-+    struct addrinfo hints, *res;
-+
-+    memset(&hints, 0, sizeof(hints));
-+    hints.ai_family = PF_UNSPEC;
-+    hints.ai_socktype = SOCK_STREAM;
-+    hints.ai_flags = AI_PASSIVE | AI_NUMERICHOST;
-+    if (getaddrinfo(host, NULL, &hints, &res) == 0)
-+	return (res);
-+
-+    memset(&hints, 0, sizeof(hints));
-+    hints.ai_family = PF_UNSPEC;
-+    hints.ai_socktype = SOCK_STREAM;
-+    hints.ai_flags = AI_PASSIVE | AI_CANONNAME;
-+    if (getaddrinfo(host, NULL, &hints, &res) != 0) {
-+	tcpd_warn("%s: host not found", host);
-+	return (0);
-+    }
-+    if (res->ai_family != AF_INET6 && res->ai_family != AF_INET) {
-+	tcpd_warn("%d: not an internet host", res->ai_family);
-+	freeaddrinfo(res);
-+	return (0);
-+    }
-+    if (!res->ai_canonname) {
-+	tcpd_warn("%s: hostname alias", host);
-+	tcpd_warn("(cannot obtain official name)", res->ai_canonname);
-+    } else if (STR_NE(host, res->ai_canonname)) {
-+	tcpd_warn("%s: hostname alias", host);
-+	tcpd_warn("(official name: %.*s)", STRING_LENGTH, res->ai_canonname);
-+    }
-+    return (res);
-+}
-+#else
- struct hostent *find_inet_addr(host)
- char   *host;
- {
-@@ -118,6 +158,7 @@
-     }
-     return (dup_hostent(hp));
- }
-+#endif
- 
- /* check_dns - give each address thorough workout, return address count */
- 
-@@ -125,8 +166,13 @@
- char   *host;
- {
-     struct request_info request;
-+#ifdef INET6
-+    struct sockaddr_storage sin;
-+    struct addrinfo *hp, *res;
-+#else
-     struct sockaddr_in sin;
-     struct hostent *hp;
-+#endif
-     int     count;
-     char   *addr;
- 
-@@ -134,11 +180,18 @@
- 	return (0);
-     request_init(&request, RQ_CLIENT_SIN, &sin, 0);
-     sock_methods(&request);
-+#ifndef INET6
-     memset((char *) &sin, 0, sizeof(sin));
-     sin.sin_family = AF_INET;
-+#endif
- 
-+#ifdef INET6
-+    for (res = hp, count = 0; res; res = res->ai_next, count++) {
-+	memcpy(&sin, res->ai_addr, res->ai_addrlen);
-+#else
-     for (count = 0; (addr = hp->h_addr_list[count]) != 0; count++) {
- 	memcpy((char *) &sin.sin_addr, addr, sizeof(sin.sin_addr));
-+#endif
- 
- 	/*
- 	 * Force host name and address conversions. Use the request structure
-@@ -151,7 +204,11 @@
- 	    tcpd_warn("host address %s->name lookup failed",
- 		      eval_hostaddr(request.client));
-     }
-+#ifdef INET6
-+    freeaddrinfo(hp);
-+#else
-     free((char *) hp);
-+#endif
-     return (count);
- }
- 
-diff -ruN tcp_wrappers_7.6.orig/scaffold.h tcp_wrappers_7.6/scaffold.h
---- tcp_wrappers_7.6.orig/scaffold.h	1994-12-31 18:19:20.000000000 +0100
-+++ tcp_wrappers_7.6/scaffold.h	2004-04-10 19:07:43.000000000 +0200
-@@ -4,6 +4,10 @@
-   * Author: Wietse Venema, Eindhoven University of Technology, The Netherlands.
-   */
- 
-+#ifdef INET6
-+extern struct addrinfo *find_inet_addr();
-+#else
- extern struct hostent *find_inet_addr();
-+#endif
- extern int check_dns();
- extern int check_path();
-diff -ruN tcp_wrappers_7.6.orig/socket.c tcp_wrappers_7.6/socket.c
---- tcp_wrappers_7.6.orig/socket.c	2004-04-10 19:22:58.000000000 +0200
-+++ tcp_wrappers_7.6/socket.c	2004-04-10 19:07:43.000000000 +0200
-@@ -24,13 +24,22 @@
- #include <sys/types.h>
- #include <sys/param.h>
- #include <sys/socket.h>
-+#ifdef INT32_T
-+typedef uint32_t u_int32_t;
-+#endif
- #include <netinet/in.h>
- #include <netdb.h>
- #include <stdio.h>
- #include <syslog.h>
- #include <string.h>
- 
-+#ifdef INET6
-+#ifndef NI_WITHSCOPEID
-+#define NI_WITHSCOPEID	0
-+#endif
-+#else
- extern char *inet_ntoa();
-+#endif
- 
- /* Local stuff. */
- 
-@@ -79,8 +88,13 @@
- void    sock_host(request)
- struct request_info *request;
- {
-+#ifdef INET6
-+    static struct sockaddr_storage client;
-+    static struct sockaddr_storage server;
-+#else
-     static struct sockaddr_in client;
-     static struct sockaddr_in server;
-+#endif
-     int     len;
-     char    buf[BUFSIZ];
-     int     fd = request->fd;
-@@ -109,7 +123,11 @@
- 	memset(buf, 0 sizeof(buf));
- #endif
-     }
-+#ifdef INET6
-+    request->client->sin = (struct sockaddr *)&client;
-+#else
-     request->client->sin = &client;
-+#endif
- 
-     /*
-      * Determine the server binding. This is used for client username
-@@ -122,7 +140,11 @@
- 	tcpd_warn("getsockname: %m");
- 	return;
-     }
-+#ifdef INET6
-+    request->server->sin = (struct sockaddr *)&server;
-+#else
-     request->server->sin = &server;
-+#endif
- }
- 
- /* sock_hostaddr - map endpoint address to printable form */
-@@ -130,10 +152,26 @@
- void    sock_hostaddr(host)
- struct host_info *host;
- {
-+#ifdef INET6
-+    struct sockaddr *sin = host->sin;
-+    int salen;
-+
-+    if (!sin)
-+	return;
-+#ifdef SIN6_LEN
-+    salen = sin->sa_len;
-+#else
-+    salen = (sin->sa_family == AF_INET) ? sizeof(struct sockaddr_in)
-+					: sizeof(struct sockaddr_in6);
-+#endif
-+    getnameinfo(sin, salen, host->addr, sizeof(host->addr),
-+		NULL, 0, NI_NUMERICHOST | NI_WITHSCOPEID);
-+#else
-     struct sockaddr_in *sin = host->sin;
- 
-     if (sin != 0)
- 	STRN_CPY(host->addr, inet_ntoa(sin->sin_addr), sizeof(host->addr));
-+#endif
- }
- 
- /* sock_hostname - map endpoint address to host name */
-@@ -141,6 +179,160 @@
- void    sock_hostname(host)
- struct host_info *host;
- {
-+#ifdef INET6
-+    struct sockaddr *sin = host->sin;
-+    struct sockaddr_in sin4;
-+    struct addrinfo hints, *res, *res0 = NULL;
-+    int salen, alen, err = 1;
-+    char *ap = NULL, *rap, hname[NI_MAXHOST];
-+
-+    if (sin != NULL) {
-+	if (sin->sa_family == AF_INET6) {
-+	    struct sockaddr_in6 *sin6 = (struct sockaddr_in6 *)sin;
-+
-+	    if (IN6_IS_ADDR_V4MAPPED(&sin6->sin6_addr)) {
-+		memset(&sin4, 0, sizeof(sin4));
-+#ifdef SIN6_LEN
-+		sin4.sin_len = sizeof(sin4);
-+#endif
-+		sin4.sin_family = AF_INET;
-+		sin4.sin_port = sin6->sin6_port;
-+		sin4.sin_addr.s_addr = *(u_int32_t *)&sin6->sin6_addr.s6_addr[12];
-+		sin = (struct sockaddr *)&sin4;
-+	    }
-+	}
-+	switch (sin->sa_family) {
-+	case AF_INET:
-+	    ap = (char *)&((struct sockaddr_in *)sin)->sin_addr;
-+	    alen = sizeof(struct in_addr);
-+	    salen = sizeof(struct sockaddr_in);
-+	    break;
-+	case AF_INET6:
-+	    ap = (char *)&((struct sockaddr_in6 *)sin)->sin6_addr;
-+	    alen = sizeof(struct in6_addr);
-+	    salen = sizeof(struct sockaddr_in6);
-+	    break;
-+	default:
-+	    break;
-+	}
-+	if (ap)
-+	    err = getnameinfo(sin, salen, hname, sizeof(hname),
-+			      NULL, 0, NI_WITHSCOPEID | NI_NAMEREQD);
-+    }
-+    if (!err) {
-+
-+	STRN_CPY(host->name, hname, sizeof(host->name));
-+
-+	/* reject numeric addresses */
-+	memset(&hints, 0, sizeof(hints));
-+	hints.ai_family = sin->sa_family;
-+	hints.ai_socktype = SOCK_STREAM;
-+	hints.ai_flags = AI_PASSIVE | AI_CANONNAME | AI_NUMERICHOST;
-+	if ((err = getaddrinfo(host->name, NULL, &hints, &res0) == 0)) {
-+	    freeaddrinfo(res0);
-+	    res0 = NULL;
-+	    tcpd_warn("host name/name mismatch: "
-+		      "reverse lookup results in non-FQDN %s",
-+		      host->name);
-+	    strcpy(host->name, paranoid);	/* name is bad, clobber it */
-+	}
-+	err = !err;
-+    }
-+    if (!err) {
-+	/* we are now sure that this is non-numeric */
-+
-+	/*
-+	 * Verify that the address is a member of the address list returned
-+	 * by gethostbyname(hostname).
-+	 * 
-+	 * Verify also that gethostbyaddr() and gethostbyname() return the same
-+	 * hostname, or rshd and rlogind may still end up being spoofed.
-+	 * 
-+	 * On some sites, gethostbyname("localhost") returns "localhost.domain".
-+	 * This is a DNS artefact. We treat it as a special case. When we
-+	 * can't believe the address list from gethostbyname("localhost")
-+	 * we're in big trouble anyway.
-+	 */
-+
-+	memset(&hints, 0, sizeof(hints));
-+	hints.ai_family = sin->sa_family;
-+	hints.ai_socktype = SOCK_STREAM;
-+	hints.ai_flags = AI_PASSIVE | AI_CANONNAME;
-+	if (getaddrinfo(host->name, NULL, &hints, &res0) != 0) {
-+
-+	    /*
-+	     * Unable to verify that the host name matches the address. This
-+	     * may be a transient problem or a botched name server setup.
-+	     */
-+
-+	    tcpd_warn("can't verify hostname: getaddrinfo(%s, %s) failed",
-+		      host->name,
-+		      (sin->sa_family == AF_INET) ? "AF_INET" : "AF_INET6");
-+
-+	} else if ((res0->ai_canonname == NULL
-+		    || STR_NE(host->name, res0->ai_canonname))
-+		   && STR_NE(host->name, "localhost")) {
-+
-+	    /*
-+	     * The gethostbyaddr() and gethostbyname() calls did not return
-+	     * the same hostname. This could be a nameserver configuration
-+	     * problem. It could also be that someone is trying to spoof us.
-+	     */
-+
-+	    tcpd_warn("host name/name mismatch: %s != %.*s",
-+		      host->name, STRING_LENGTH,
-+		      (res0->ai_canonname == NULL) ? "" : res0->ai_canonname);
-+
-+	} else {
-+
-+	    /*
-+	     * The address should be a member of the address list returned by
-+	     * gethostbyname(). We should first verify that the h_addrtype
-+	     * field is AF_INET, but this program has already caused too much
-+	     * grief on systems with broken library code.
-+	     */
-+
-+	    for (res = res0; res; res = res->ai_next) {
-+		if (res->ai_family != sin->sa_family)
-+		    continue;
-+		switch (res->ai_family) {
-+		case AF_INET:
-+		    rap = (char *)&((struct sockaddr_in *)res->ai_addr)->sin_addr;
-+		    break;
-+		case AF_INET6:
-+		    /* need to check scope_id */
-+		    if (((struct sockaddr_in6 *)sin)->sin6_scope_id !=
-+		        ((struct sockaddr_in6 *)res->ai_addr)->sin6_scope_id) {
-+			continue;
-+		    }
-+		    rap = (char *)&((struct sockaddr_in6 *)res->ai_addr)->sin6_addr;
-+		    break;
-+		default:
-+		    continue;
-+		}
-+		if (memcmp(rap, ap, alen) == 0) {
-+		    freeaddrinfo(res0);
-+		    return;			/* name is good, keep it */
-+		}
-+	    }
-+
-+	    /*
-+	     * The host name does not map to the initial address. Perhaps
-+	     * someone has messed up. Perhaps someone compromised a name
-+	     * server.
-+	     */
-+
-+	    getnameinfo(sin, salen, hname, sizeof(hname),
-+			NULL, 0, NI_NUMERICHOST | NI_WITHSCOPEID);
-+	    tcpd_warn("host name/address mismatch: %s != %.*s",
-+		      hname, STRING_LENGTH,
-+		      (res0->ai_canonname == NULL) ? "" : res0->ai_canonname);
-+	}
-+	strcpy(host->name, paranoid);		/* name is bad, clobber it */
-+	if (res0)
-+	    freeaddrinfo(res0);
-+    }
-+#else /* INET6 */
-     struct sockaddr_in *sin = host->sin;
-     struct hostent *hp;
-     int     i;
-@@ -220,6 +412,7 @@
- 	}
- 	strcpy(host->name, paranoid);		/* name is bad, clobber it */
-     }
-+#endif /* INET6 */
- }
- 
- /* sock_sink - absorb unreceived IP datagram */
-@@ -228,7 +421,11 @@
- int     fd;
- {
-     char    buf[BUFSIZ];
-+#ifdef INET6
-+    struct sockaddr_storage sin;
-+#else
-     struct sockaddr_in sin;
-+#endif
-     int     size = sizeof(sin);
- 
-     /*
-diff -ruN tcp_wrappers_7.6.orig/tcpd.c tcp_wrappers_7.6/tcpd.c
---- tcp_wrappers_7.6.orig/tcpd.c	1996-02-11 17:01:33.000000000 +0100
-+++ tcp_wrappers_7.6/tcpd.c	2004-04-10 19:07:43.000000000 +0200
-@@ -120,7 +120,12 @@
- 
-     /* Report request and invoke the real daemon program. */
- 
-+#ifdef INET6
-+    syslog(allow_severity, "connect from %s (%s)",
-+	   eval_client(&request), eval_hostaddr(request.client));
-+#else
-     syslog(allow_severity, "connect from %s", eval_client(&request));
-+#endif
-     closelog();
-     (void) execv(path, argv);
-     syslog(LOG_ERR, "error: cannot execute %s: %m", path);
-diff -ruN tcp_wrappers_7.6.orig/tcpdchk.c tcp_wrappers_7.6/tcpdchk.c
---- tcp_wrappers_7.6.orig/tcpdchk.c	1997-02-12 02:13:25.000000000 +0100
-+++ tcp_wrappers_7.6/tcpdchk.c	2004-04-10 19:07:43.000000000 +0200
-@@ -22,6 +22,9 @@
- 
- #include <sys/types.h>
- #include <sys/stat.h>
-+#ifdef INET6
-+#include <sys/socket.h>
-+#endif
- #include <netinet/in.h>
- #include <arpa/inet.h>
- #include <stdio.h>
-@@ -397,6 +400,31 @@
-     }
- }
- 
-+#ifdef INET6
-+static int is_inet6_addr(pat)
-+    char *pat;
-+{
-+    struct addrinfo hints, *res;
-+    int len, ret;
-+    char ch;
-+
-+    if (*pat != '[')
-+	return (0);
-+    len = strlen(pat);
-+    if ((ch = pat[len - 1]) != ']')
-+	return (0);
-+    pat[len - 1] = '\0';
-+    memset(&hints, 0, sizeof(hints));
-+    hints.ai_family = AF_INET6;
-+    hints.ai_socktype = SOCK_STREAM;
-+    hints.ai_flags = AI_PASSIVE | AI_NUMERICHOST;
-+    if ((ret = getaddrinfo(pat + 1, NULL, &hints, &res)) == 0)
-+	freeaddrinfo(res);
-+    pat[len - 1] = ch;
-+    return (ret == 0);
-+}
-+#endif
-+
- /* check_host - criticize host pattern */
- 
- static int check_host(pat)
-@@ -423,14 +451,27 @@
- #endif
- #endif
-     } else if (mask = split_at(pat, '/')) {	/* network/netmask */
-+#ifdef INET6
-+	int mask_len;
-+
-+	if ((dot_quad_addr(pat) == INADDR_NONE
-+	    || dot_quad_addr(mask) == INADDR_NONE)
-+	    && (!is_inet6_addr(pat)
-+		|| ((mask_len = atoi(mask)) < 0 || mask_len > 128)))
-+#else
- 	if (dot_quad_addr(pat) == INADDR_NONE
- 	    || dot_quad_addr(mask) == INADDR_NONE)
-+#endif
- 	    tcpd_warn("%s/%s: bad net/mask pattern", pat, mask);
-     } else if (STR_EQ(pat, "FAIL")) {		/* obsolete */
- 	tcpd_warn("FAIL is no longer recognized");
- 	tcpd_warn("(use EXCEPT or DENY instead)");
-     } else if (reserved_name(pat)) {		/* other reserved */
- 	 /* void */ ;
-+#ifdef INET6
-+    } else if (is_inet6_addr(pat)) { /* IPv6 address */
-+	addr_count = 1;
-+#endif
-     } else if (NOT_INADDR(pat)) {		/* internet name */
- 	if (pat[strlen(pat) - 1] == '.') {
- 	    tcpd_warn("%s: domain or host name ends in dot", pat);
-diff -ruN tcp_wrappers_7.6.orig/tcpd.h tcp_wrappers_7.6/tcpd.h
---- tcp_wrappers_7.6.orig/tcpd.h	1996-03-19 16:22:25.000000000 +0100
-+++ tcp_wrappers_7.6/tcpd.h	2004-04-10 19:07:43.000000000 +0200
-@@ -11,7 +11,11 @@
- struct host_info {
-     char    name[STRING_LENGTH];	/* access via eval_hostname(host) */
-     char    addr[STRING_LENGTH];	/* access via eval_hostaddr(host) */
-+#ifdef INET6
-+    struct sockaddr *sin;		/* socket address or 0 */
-+#else
-     struct sockaddr_in *sin;		/* socket address or 0 */
-+#endif
-     struct t_unitdata *unit;		/* TLI transport address or 0 */
-     struct request_info *request;	/* for shared information */
- };
-diff -ruN tcp_wrappers_7.6.orig/tcpdmatch.c tcp_wrappers_7.6/tcpdmatch.c
---- tcp_wrappers_7.6.orig/tcpdmatch.c	1996-02-11 17:01:36.000000000 +0100
-+++ tcp_wrappers_7.6/tcpdmatch.c	2004-04-10 19:07:43.000000000 +0200
-@@ -57,7 +57,11 @@
- int     argc;
- char  **argv;
- {
-+#ifdef INET6
-+    struct addrinfo hints, *hp, *res;
-+#else
-     struct hostent *hp;
-+#endif
-     char   *myname = argv[0];
-     char   *client;
-     char   *server;
-@@ -68,8 +72,13 @@
-     int     ch;
-     char   *inetcf = 0;
-     int     count;
-+#ifdef INET6
-+    struct sockaddr_storage server_sin;
-+    struct sockaddr_storage client_sin;
-+#else
-     struct sockaddr_in server_sin;
-     struct sockaddr_in client_sin;
-+#endif
-     struct stat st;
- 
-     /*
-@@ -172,13 +181,20 @@
-     if (NOT_INADDR(server) == 0 || HOSTNAME_KNOWN(server)) {
- 	if ((hp = find_inet_addr(server)) == 0)
- 	    exit(1);
-+#ifndef INET6
- 	memset((char *) &server_sin, 0, sizeof(server_sin));
- 	server_sin.sin_family = AF_INET;
-+#endif
- 	request_set(&request, RQ_SERVER_SIN, &server_sin, 0);
- 
-+#ifdef INET6
-+	for (res = hp, count = 0; res; res = res->ai_next, count++) {
-+	    memcpy(&server_sin, res->ai_addr, res->ai_addrlen);
-+#else
- 	for (count = 0; (addr = hp->h_addr_list[count]) != 0; count++) {
- 	    memcpy((char *) &server_sin.sin_addr, addr,
- 		   sizeof(server_sin.sin_addr));
-+#endif
- 
- 	    /*
- 	     * Force evaluation of server host name and address. Host name
-@@ -194,7 +210,11 @@
- 	    fprintf(stderr, "Please specify an address instead\n");
- 	    exit(1);
- 	}
-+#ifdef INET6
-+	freeaddrinfo(hp);
-+#else
- 	free((char *) hp);
-+#endif
-     } else {
- 	request_set(&request, RQ_SERVER_NAME, server, 0);
-     }
-@@ -208,6 +228,18 @@
- 	tcpdmatch(&request);
- 	exit(0);
-     }
-+#ifdef INET6
-+    memset(&hints, 0, sizeof(hints));
-+    hints.ai_family = AF_INET6;
-+    hints.ai_socktype = SOCK_STREAM;
-+    hints.ai_flags = AI_PASSIVE | AI_NUMERICHOST;
-+    if (getaddrinfo(client, NULL, &hints, &res) == 0) {
-+	freeaddrinfo(res);
-+	request_set(&request, RQ_CLIENT_ADDR, client, 0);
-+	tcpdmatch(&request);
-+	exit(0);
-+    }
-+#endif
- 
-     /*
-      * Perhaps they are testing special client hostname patterns that aren't
-@@ -229,6 +261,34 @@
-      */
-     if ((hp = find_inet_addr(client)) == 0)
- 	exit(1);
-+#ifdef INET6
-+    request_set(&request, RQ_CLIENT_SIN, &client_sin, 0);
-+
-+    for (res = hp, count = 0; res; res = res->ai_next, count++) {
-+	memcpy(&client_sin, res->ai_addr, res->ai_addrlen);
-+
-+	/*
-+	 * getnameinfo() doesn't do reverse lookup against link-local
-+	 * address.  So, we pass through host name evaluation against
-+	 * such addresses.
-+	 */
-+	if (res->ai_family != AF_INET6 ||
-+	    !IN6_IS_ADDR_LINKLOCAL(&((struct sockaddr_in6 *)res->ai_addr)->sin6_addr)) {
-+	    /*
-+	     * Force evaluation of client host name and address. Host name
-+	     * conflicts will be reported while eval_hostname() does its job.
-+	     */
-+	    request_set(&request, RQ_CLIENT_NAME, "", RQ_CLIENT_ADDR, "", 0);
-+	    if (STR_EQ(eval_hostname(request.client), unknown))
-+		tcpd_warn("host address %s->name lookup failed",
-+			  eval_hostaddr(request.client));
-+	}
-+	tcpdmatch(&request);
-+	if (res->ai_next)
-+	    printf("\n");
-+    }
-+    freeaddrinfo(hp);
-+#else
-     memset((char *) &client_sin, 0, sizeof(client_sin));
-     client_sin.sin_family = AF_INET;
-     request_set(&request, RQ_CLIENT_SIN, &client_sin, 0);
-@@ -250,6 +310,7 @@
- 	    printf("\n");
-     }
-     free((char *) hp);
-+#endif
-     exit(0);
- }
- 
-diff -ruN tcp_wrappers_7.6.orig/tli.c tcp_wrappers_7.6/tli.c
---- tcp_wrappers_7.6.orig/tli.c	1997-03-21 19:27:26.000000000 +0100
-+++ tcp_wrappers_7.6/tli.c	2004-04-10 19:07:43.000000000 +0200
-@@ -65,8 +65,13 @@
- void    tli_host(request)
- struct request_info *request;
- {
-+#ifdef INET6
-+    static struct sockaddr_storage client;
-+    static struct sockaddr_storage server;
-+#else
-     static struct sockaddr_in client;
-     static struct sockaddr_in server;
-+#endif
- 
-     /*
-      * If we discover that we are using an IP transport, pretend we never
-@@ -76,14 +81,29 @@
- 
-     tli_endpoints(request);
-     if ((request->config = tli_transport(request->fd)) != 0
-+#ifdef INET6
-+	&& (STR_EQ(request->config->nc_protofmly, "inet") ||
-+	    STR_EQ(request->config->nc_protofmly, "inet6"))) {
-+#else
- 	&& STR_EQ(request->config->nc_protofmly, "inet")) {
-+#endif
- 	if (request->client->unit != 0) {
-+#ifdef INET6
-+	    client = *(struct sockaddr_storage *) request->client->unit->addr.buf;
-+	    request->client->sin = (struct sockaddr *) &client;
-+#else
- 	    client = *(struct sockaddr_in *) request->client->unit->addr.buf;
- 	    request->client->sin = &client;
-+#endif
- 	}
- 	if (request->server->unit != 0) {
-+#ifdef INET6
-+	    server = *(struct sockaddr_storage *) request->server->unit->addr.buf;
-+	    request->server->sin = (struct sockaddr *) &server;
-+#else
- 	    server = *(struct sockaddr_in *) request->server->unit->addr.buf;
- 	    request->server->sin = &server;
-+#endif
- 	}
- 	tli_cleanup(request);
- 	sock_methods(request);
-@@ -187,7 +207,15 @@
-     }
-     while (config = getnetconfig(handlep)) {
- 	if (stat(config->nc_device, &from_config) == 0) {
-+#ifdef NO_CLONE_DEVICE
-+	/*
-+	 * If the network devices are not cloned (as is the case for
-+	 * Solaris 8 Beta), we must compare the major device numbers.
-+	 */
-+	    if (major(from_config.st_rdev) == major(from_client.st_rdev))
-+#else
- 	    if (minor(from_config.st_rdev) == major(from_client.st_rdev))
-+#endif
- 		break;
- 	}
-     }
-diff -ruN tcp_wrappers_7.6.orig/update.c tcp_wrappers_7.6/update.c
---- tcp_wrappers_7.6.orig/update.c	1994-12-28 17:42:56.000000000 +0100
-+++ tcp_wrappers_7.6/update.c	2004-04-10 19:07:43.000000000 +0200
-@@ -46,10 +46,18 @@
- 	    request->fd = va_arg(ap, int);
- 	    continue;
- 	case RQ_CLIENT_SIN:
-+#ifdef INET6
-+	    request->client->sin = va_arg(ap, struct sockaddr *);
-+#else
- 	    request->client->sin = va_arg(ap, struct sockaddr_in *);
-+#endif
- 	    continue;
- 	case RQ_SERVER_SIN:
-+#ifdef INET6
-+	    request->server->sin = va_arg(ap, struct sockaddr *);
-+#else
- 	    request->server->sin = va_arg(ap, struct sockaddr_in *);
-+#endif
- 	    continue;
- 
- 	    /*
-diff -ruN tcp_wrappers_7.6.orig/workarounds.c tcp_wrappers_7.6/workarounds.c
---- tcp_wrappers_7.6.orig/workarounds.c	1996-03-19 16:22:26.000000000 +0100
-+++ tcp_wrappers_7.6/workarounds.c	2004-04-10 19:07:43.000000000 +0200
-@@ -166,11 +166,22 @@
- int    *len;
- {
-     int     ret;
-+#ifdef INET6
-+    struct sockaddr *sin = sa;
-+#else
-     struct sockaddr_in *sin = (struct sockaddr_in *) sa;
-+#endif
- 
-     if ((ret = getpeername(sock, sa, len)) >= 0
-+#ifdef INET6
-+	&& ((sin->su_si.si_family == AF_INET6
-+	     && IN6_IS_ADDR_UNSPECIFIED(&sin->su_sin6.sin6_addr))
-+	    || (sin->su_si.si_family == AF_INET
-+		&& sin->su_sin.sin_addr.s_addr == 0))) {
-+#else
- 	&& sa->sa_family == AF_INET
- 	&& sin->sin_addr.s_addr == 0) {
-+#endif
- 	errno = ENOTCONN;
- 	return (-1);
-     } else {
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch
deleted file mode 100644
index 77d5b423421..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-Path: news.porcupine.org!news.porcupine.org!not-for-mail
-From: Wietse Venema <wietse@((no)(spam)(please))wzv.win.tue.nl>
-Newsgroups: comp.mail.sendmail,comp.security.unix
-Subject: TCP Wrapper Blacklist Extension
-Followup-To: poster
-Date: 8 Sep 1997 18:53:13 -0400
-Organization: Wietse's hangout while on sabattical in the USA
-Lines: 147
-Sender: wietse@spike.porcupine.org
-Message-ID: <5v1vkp$h4f$1@spike.porcupine.org>
-NNTP-Posting-Host: spike.porcupine.org
-Xref: news.porcupine.org comp.mail.sendmail:3541 comp.security.unix:7158
-
-The patch below adds a new host pattern to the TCP Wrapper access
-control language. Instead of a host name or address pattern, you
-can specify an external /file/name with host name or address
-patterns.   The feature can be used recursively.
-
-The /file/name extension makes it easy to blacklist bad sites, for
-example, to block unwanted electronic mail when libwrap is linked
-into sendmail.  Adding hosts to a simple text file is much easier
-than having to edit a more complex hosts.allow/deny file.
-
-I developed this a year or so ago as a substitute for NIS netgroups.
-At that time, I did not consider it of sufficient interest for
-inclusion in the TCP Wrapper distribution. How times have changed.
-
-The patch is relative to TCP Wrappers version 7.6. The main archive
-site is ftp://ftp.win.tue.nl/pub/security/tcp_wrappers_7.6.tar.gz
-
-Thanks to the Debian LINUX folks for expressing their interest in
-this patch.
-
-	Wietse
-
-
-[diff updated by Md]
-
-diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_access.5
---- tcp_wrappers_7.6.orig/hosts_access.5	2004-04-10 19:28:09.000000000 +0200
-+++ tcp_wrappers_7.6/hosts_access.5	2004-04-10 19:28:01.000000000 +0200
-@@ -97,6 +97,13 @@
- `[3ffe:505:2:1::]/64\' matches every address in the range
- `3ffe:505:2:1::\' through `3ffe:505:2:1:ffff:ffff:ffff:ffff\'.
- .IP \(bu
-+A string that begins with a `/\' character is treated as a file
-+name. A host name or address is matched if it matches any host name
-+or address pattern listed in the named file. The file format is
-+zero or more lines with zero or more host name or address patterns
-+separated by whitespace.  A file name pattern can be used anywhere
-+a host name or address pattern can be used.
-+.IP \(bu
- Wildcards `*\' and `?\' can be used to match hostnames or IP addresses.  This
- method of matching cannot be used in conjunction with `net/mask\' matching,
- hostname matching beginning with `.\' or IP address matching ending with `.\'.
-diff -ruN tcp_wrappers_7.6.orig/hosts_access.c tcp_wrappers_7.6/hosts_access.c
---- tcp_wrappers_7.6.orig/hosts_access.c	2004-04-10 19:28:09.000000000 +0200
-+++ tcp_wrappers_7.6/hosts_access.c	2004-04-10 19:27:05.000000000 +0200
-@@ -253,6 +253,26 @@
-     }
- }
- 
-+/* hostfile_match - look up host patterns from file */
-+
-+static int hostfile_match(path, host)
-+char   *path;
-+struct hosts_info *host;
-+{
-+    char    tok[BUFSIZ];
-+    int     match = NO;
-+    FILE   *fp;
-+
-+    if ((fp = fopen(path, "r")) != 0) {
-+	while (fscanf(fp, "%s", tok) == 1 && !(match = host_match(tok, host)))
-+	     /* void */ ;
-+	fclose(fp);
-+    } else if (errno != ENOENT) {
-+	tcpd_warn("open %s: %m", path);
-+    }
-+    return (match);
-+}
-+
- /* host_match - match host name and/or address against pattern */
- 
- static int host_match(tok, host)
-@@ -280,6 +300,8 @@
- 	tcpd_warn("netgroup support is disabled");	/* not tcpd_jump() */
- 	return (NO);
- #endif
-+    } else if (tok[0] == '/') {			/* /file hack */
-+	return (hostfile_match(tok, host));
-     } else if (STR_EQ(tok, "KNOWN")) {		/* check address and name */
- 	char   *name = eval_hostname(host);
- 	return (STR_NE(eval_hostaddr(host), unknown) && HOSTNAME_KNOWN(name));
-diff -ruN tcp_wrappers_7.6.orig/tcpdchk.c tcp_wrappers_7.6/tcpdchk.c
---- tcp_wrappers_7.6.orig/tcpdchk.c	2004-04-10 19:28:09.000000000 +0200
-+++ tcp_wrappers_7.6/tcpdchk.c	2004-04-10 19:27:05.000000000 +0200
-@@ -353,6 +353,8 @@
- {
-     if (pat[0] == '@') {
- 	tcpd_warn("%s: daemon name begins with \"@\"", pat);
-+    } else if (pat[0] == '/') {
-+	tcpd_warn("%s: daemon name begins with \"/\"", pat);
-     } else if (pat[0] == '.') {
- 	tcpd_warn("%s: daemon name begins with dot", pat);
-     } else if (pat[strlen(pat) - 1] == '.') {
-@@ -385,6 +387,8 @@
- {
-     if (pat[0] == '@') {			/* @netgroup */
- 	tcpd_warn("%s: user name begins with \"@\"", pat);
-+    } else if (pat[0] == '/') {
-+	tcpd_warn("%s: user name begins with \"/\"", pat);
-     } else if (pat[0] == '.') {
- 	tcpd_warn("%s: user name begins with dot", pat);
-     } else if (pat[strlen(pat) - 1] == '.') {
-@@ -430,8 +434,13 @@
- static int check_host(pat)
- char   *pat;
- {
-+    char    buf[BUFSIZ];
-     char   *mask;
-     int     addr_count = 1;
-+    FILE   *fp;
-+    struct tcpd_context saved_context;
-+    char   *cp;
-+    char   *wsp = " \t\r\n";
- 
-     if (pat[0] == '@') {			/* @netgroup */
- #ifdef NO_NETGRENT
-@@ -450,6 +459,21 @@
- 	tcpd_warn("netgroup support disabled");
- #endif
- #endif
-+    } else if (pat[0] == '/') {			/* /path/name */
-+	if ((fp = fopen(pat, "r")) != 0) {
-+	    saved_context = tcpd_context;
-+	    tcpd_context.file = pat;
-+	    tcpd_context.line = 0;
-+	    while (fgets(buf, sizeof(buf), fp)) {
-+		tcpd_context.line++;
-+		for (cp = strtok(buf, wsp); cp; cp = strtok((char *) 0, wsp))
-+		    check_host(cp);
-+	    }
-+	    tcpd_context = saved_context;
-+	    fclose(fp);
-+	} else if (errno != ENOENT) {
-+	    tcpd_warn("open %s: %m", pat);
-+	}
-     } else if (mask = split_at(pat, '/')) {	/* network/netmask */
- #ifdef INET6
- 	int mask_len;
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch
deleted file mode 100644
index 09a1e0527e3..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-diff -uN tcp_wrappers_7.6/hosts_access.c tcp_wrappers_7.6.new/hosts_access.c
---- tcp_wrappers_7.6/hosts_access.c	Mon May 20 14:00:56 2002
-+++ tcp_wrappers_7.6.new/hosts_access.c	Mon May 20 14:25:05 2002
-@@ -448,6 +448,15 @@
-     int len, mask_len, i = 0;
-     char ch;
- 
-+    /*
-+     * Behavior of getaddrinfo() against IPv4-mapped IPv6 address is
-+     * different between KAME and Solaris8.  While KAME returns
-+     * AF_INET6, Solaris8 returns AF_INET.  So, we avoid this here.
-+     */
-+    if (STRN_EQ(string, "::ffff:", 7)
-+	&& dot_quad_addr(string + 7) != INADDR_NONE)
-+	return (masked_match4(net_tok, mask_tok, string + 7));
-+
-     memset(&hints, 0, sizeof(hints));
-     hints.ai_family = AF_INET6;
-     hints.ai_socktype = SOCK_STREAM;
-@@ -457,13 +466,6 @@
-     memcpy(&addr, res->ai_addr, sizeof(addr));
-     freeaddrinfo(res);
- 
--    if (IN6_IS_ADDR_V4MAPPED(&addr.sin6_addr)) {
--	if ((*(u_int32_t *)&net.sin6_addr.s6_addr[12] = dot_quad_addr(net_tok)) == INADDR_NONE
--	 || (mask = dot_quad_addr(mask_tok)) == INADDR_NONE)
--	    return (NO);
--	return ((*(u_int32_t *)&addr.sin6_addr.s6_addr[12] & mask) == *(u_int32_t *)&net.sin6_addr.s6_addr[12]);
--    }
--
-     /* match IPv6 address against netnumber/prefixlen */
-     len = strlen(net_tok);
-     if (*net_tok != '[' || net_tok[len - 1] != ']')
-diff -uN tcp_wrappers_7.6/socket.c tcp_wrappers_7.6.new/socket.c
---- tcp_wrappers_7.6/socket.c	Mon May 20 13:48:35 2002
-+++ tcp_wrappers_7.6.new/socket.c	Mon May 20 14:22:27 2002
-@@ -228,7 +228,7 @@
- 	hints.ai_family = sin->sa_family;
- 	hints.ai_socktype = SOCK_STREAM;
- 	hints.ai_flags = AI_PASSIVE | AI_CANONNAME | AI_NUMERICHOST;
--	if ((err = getaddrinfo(host->name, NULL, &hints, &res0) == 0)) {
-+	if ((err = getaddrinfo(host->name, NULL, &hints, &res0)) == 0) {
- 	    freeaddrinfo(res0);
- 	    res0 = NULL;
- 	    tcpd_warn("host name/name mismatch: "
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch
deleted file mode 100644
index 895a72e6b4b..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-Index: tcp_wrappers_7.6/Makefile
-===================================================================
---- tcp_wrappers_7.6.orig/Makefile
-+++ tcp_wrappers_7.6/Makefile
-@@ -45,7 +45,7 @@ what:
- #
- # SysV.4 Solaris 2.x OSF AIX
- #REAL_DAEMON_DIR=/usr/sbin
--#
-+REAL_DAEMON_DIR=/usr/sbin
- # BSD 4.4
- #REAL_DAEMON_DIR=/usr/libexec
- #
-@@ -513,6 +513,7 @@ VSYSLOG	= -Dvsyslog=myvsyslog
- # (examples: allow, deny, banners, twist and spawn).
- # 
- #STYLE	= -DPROCESS_OPTIONS	# Enable language extensions.
-+STYLE = -DPROCESS_OPTIONS
- 
- ################################################################
- # Optional: Changing the default disposition of logfile records
-@@ -536,6 +537,7 @@ VSYSLOG	= -Dvsyslog=myvsyslog
- # The LOG_XXX names below are taken from the /usr/include/syslog.h file.
- 
- FACILITY= LOG_MAIL	# LOG_MAIL is what most sendmail daemons use
-+FACILITY= LOG_DAEMON
- 
- # The syslog priority at which successful connections are logged.
- 
-@@ -632,6 +634,7 @@ TABLES	= -DHOSTS_DENY=\"/etc/hosts.deny\
- # lookups altogether, see the next section.
- 
- PARANOID= -DPARANOID
-+PARANOID=
- 
- ########################################
- # Optional: turning off hostname lookups
-@@ -645,6 +648,7 @@ PARANOID= -DPARANOID
- # mode (see previous section) and comment out the following definition.
- 
- HOSTNAME= -DALWAYS_HOSTNAME
-+HOSTNAME=
- 
- #############################################
- # Optional: Turning on host ADDRESS checking
-@@ -671,6 +675,7 @@ HOSTNAME= -DALWAYS_HOSTNAME
- # Solaris 2.x, and Linux. See your system documentation for details.
- #
- # KILL_OPT= -DKILL_IP_OPTIONS
-+KILL_OPT= -DKILL_IP_OPTIONS
- 
- ## End configuration options
- ############################
-@@ -678,9 +683,10 @@ HOSTNAME= -DALWAYS_HOSTNAME
- # Protection against weird shells or weird make programs.
- 
- SHELL	= /bin/sh
--.c.o:;	$(CC) $(CFLAGS) -c $*.c
-+.c.o:;	$(CC) $(CFLAGS) -o $*.o -c $*.c
- 
--CFLAGS	= -O -DFACILITY=$(FACILITY) $(ACCESS) $(PARANOID) $(NETGROUP) \
-+COPTS	= -O2 -g
-+CFLAGS	= $(COPTS) -DFACILITY=$(FACILITY) $(ACCESS) $(PARANOID) $(NETGROUP) \
- 	$(BUGS) $(SYSTYPE) $(AUTH) $(UMASK) \
- 	-DREAL_DAEMON_DIR=\"$(REAL_DAEMON_DIR)\" $(STYLE) $(KILL_OPT) \
- 	-DSEVERITY=$(SEVERITY) -DRFC931_TIMEOUT=$(RFC931_TIMEOUT) \
-@@ -713,11 +719,12 @@ all other: config-check tcpd tcpdmatch t
- 
- config-check:
- 	@set +e; test -n "$(REAL_DAEMON_DIR)" || { make; exit 1; }
--	@set +e; echo $(CFLAGS) >/tmp/cflags.$$$$ ; \
--	if cmp cflags /tmp/cflags.$$$$ ; \
--	then rm /tmp/cflags.$$$$ ; \
--	else mv /tmp/cflags.$$$$ cflags ; \
-+	@set +e; echo $(CFLAGS) >cflags.new ; \
-+	if cmp cflags cflags.new ; \
-+	then rm cflags.new ; \
-+	else mv cflags.new cflags ; \
- 	fi >/dev/null 2>/dev/null
-+	@if [ ! -d shared ]; then mkdir shared; fi
- 
- $(LIB):	$(LIB_OBJ)
- 	rm -f $(LIB)
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch
deleted file mode 100644
index 9503fb3c881..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch
+++ /dev/null
@@ -1,255 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-diff -ruN tcp_wrappers_7.6.orig/Makefile tcp_wrappers_7.6/Makefile
---- tcp_wrappers_7.6.orig/Makefile	2004-05-02 15:37:59.000000000 +0200
-+++ tcp_wrappers_7.6/Makefile	2004-05-02 15:31:09.000000000 +0200
-@@ -150,15 +150,15 @@
- 
- linux:
- 	@make REAL_DAEMON_DIR=$(REAL_DAEMON_DIR) STYLE=$(STYLE) \
--	LIBS=-lnsl RANLIB=ranlib ARFLAGS=rv AUX_OBJ= \
-+	LIBS=-lnsl RANLIB=ranlib ARFLAGS=rv AUX_OBJ=weak_symbols.o \
- 	NETGROUP="-DNETGROUP" TLI= VSYSLOG= BUGS= \
--	EXTRA_CFLAGS="-DSYS_ERRLIST_DEFINED -DHAVE_STRERROR -DINET6=1 -Dss_family=__ss_family -Dss_len=__ss_len" all
-+	EXTRA_CFLAGS="-DSYS_ERRLIST_DEFINED -DHAVE_STRERROR -DHAVE_WEAKSYMS -D_REENTRANT -DINET6=1 -Dss_family=__ss_family -Dss_len=__ss_len" all
- 
- gnu:
- 	@make REAL_DAEMON_DIR=$(REAL_DAEMON_DIR) STYLE=$(STYLE) \
--	LIBS=-lnsl RANLIB=ranlib ARFLAGS=rv AUX_OBJ= \
-+	LIBS=-lnsl RANLIB=ranlib ARFLAGS=rv AUX_OBJ=weak_symbols.o \
- 	NETGROUP=-DNETGROUP TLI= VSYSLOG= BUGS= \
--	EXTRA_CFLAGS="-DSYS_ERRLIST_DEFINED -DHAVE_STRERROR" all
-+	EXTRA_CFLAGS="-DSYS_ERRLIST_DEFINED -DHAVE_STRERROR -DHAVE_WEAKSYMS -D_REENTRANT" all
- 
- # This is good for many SYSV+BSD hybrids with NIS, probably also for HP-UX 7.x.
- hpux hpux8 hpux9 hpux10:
-@@ -713,7 +713,22 @@
- 
- LIB	= libwrap.a
- 
--all other: config-check tcpd tcpdmatch try-from safe_finger tcpdchk
-+shared/%.o: %.c
-+	$(CC) $(CFLAGS) $(SHCFLAGS) -c $< -o $@
-+
-+SOMAJOR = 0
-+SOMINOR = 7.6
-+
-+SHLIB		= shared/libwrap.so.$(SOMAJOR).$(SOMINOR)
-+SHLIBSOMAJ	= shared/libwrap.so.$(SOMAJOR)
-+SHLIBSO		= shared/libwrap.so
-+SHLIBFLAGS	= -Lshared -lwrap
-+
-+SHLINKFLAGS = -shared -Xlinker -soname -Xlinker libwrap.so.$(SOMAJOR) -lc $(LIBS)
-+SHCFLAGS = -fPIC -shared -D_REENTRANT
-+SHLIB_OBJ= $(addprefix shared/, $(LIB_OBJ));
-+
-+all other: config-check tcpd tcpdmatch try-from safe_finger tcpdchk $(LIB)
- 
- # Invalidate all object files when the compiler options (CFLAGS) have changed.
- 
-@@ -731,27 +746,33 @@
- 	$(AR) $(ARFLAGS) $(LIB) $(LIB_OBJ)
- 	-$(RANLIB) $(LIB)
- 
--tcpd:	tcpd.o $(LIB)
--	$(CC) $(CFLAGS) -o $@ tcpd.o $(LIB) $(LIBS)
-+$(SHLIB): $(SHLIB_OBJ)
-+	rm -f $(SHLIB)
-+	$(CC) -o $(SHLIB) $(SHLINKFLAGS) $(SHLIB_OBJ)
-+	ln -sf $(notdir $(SHLIB)) $(SHLIBSOMAJ)
-+	ln -sf $(notdir $(SHLIBSOMAJ)) $(SHLIBSO)
-+
-+tcpd:	tcpd.o $(SHLIB)
-+	$(CC) $(CFLAGS) -o $@ tcpd.o $(SHLIBFLAGS)
- 
- miscd:	miscd.o $(LIB)
- 	$(CC) $(CFLAGS) -o $@ miscd.o $(LIB) $(LIBS)
- 
--safe_finger: safe_finger.o $(LIB)
--	$(CC) $(CFLAGS) -o $@ safe_finger.o $(LIB) $(LIBS)
-+safe_finger: safe_finger.o $(SHLIB)
-+	$(CC) $(CFLAGS) -o $@ safe_finger.o $(SHLIBFLAGS)
- 
- TCPDMATCH_OBJ = tcpdmatch.o fakelog.o inetcf.o scaffold.o
- 
--tcpdmatch: $(TCPDMATCH_OBJ) $(LIB)
--	$(CC) $(CFLAGS) -o $@ $(TCPDMATCH_OBJ) $(LIB) $(LIBS)
-+tcpdmatch: $(TCPDMATCH_OBJ) $(SHLIB)
-+	$(CC) $(CFLAGS) -o $@ $(TCPDMATCH_OBJ) $(SHLIBFLAGS)
- 
--try-from: try-from.o fakelog.o $(LIB)
--	$(CC) $(CFLAGS) -o $@ try-from.o fakelog.o $(LIB) $(LIBS)
-+try-from: try-from.o fakelog.o $(SHLIB)
-+	$(CC) $(CFLAGS) -o $@ try-from.o fakelog.o $(SHLIBFLAGS)
- 
- TCPDCHK_OBJ = tcpdchk.o fakelog.o inetcf.o scaffold.o
- 
--tcpdchk: $(TCPDCHK_OBJ) $(LIB)
--	$(CC) $(CFLAGS) -o $@ $(TCPDCHK_OBJ) $(LIB) $(LIBS)
-+tcpdchk: $(TCPDCHK_OBJ) $(SHLIB)
-+	$(CC) $(CFLAGS) -o $@ $(TCPDCHK_OBJ) $(SHLIBFLAGS)
- 
- shar:	$(KIT)
- 	@shar $(KIT)
-@@ -767,7 +788,9 @@
- 
- clean:
- 	rm -f tcpd miscd safe_finger tcpdmatch tcpdchk try-from *.[oa] core \
-+	libwrap*.so* \
- 	cflags
-+	rm -rf shared/
- 
- tidy:	clean
- 	chmod -R a+r .
-@@ -913,5 +936,6 @@
- update.o: mystdarg.h
- update.o: tcpd.h
- vfprintf.o: cflags
-+weak_symbols.o: tcpd.h
- workarounds.o: cflags
- workarounds.o: tcpd.h
-diff -ruN tcp_wrappers_7.6.orig/tcpd.h tcp_wrappers_7.6/tcpd.h
---- tcp_wrappers_7.6.orig/tcpd.h	2004-05-02 15:37:59.000000000 +0200
-+++ tcp_wrappers_7.6/tcpd.h	2004-05-02 15:37:49.000000000 +0200
-@@ -4,6 +4,15 @@
-   * Author: Wietse Venema, Eindhoven University of Technology, The Netherlands.
-   */
- 
-+#ifndef _TCPWRAPPERS_TCPD_H
-+#define _TCPWRAPPERS_TCPD_H
-+
-+/* Need definitions of struct sockaddr_in and FILE. */
-+#include <netinet/in.h>
-+#include <stdio.h>
-+
-+__BEGIN_DECLS
-+
- /* Structure to describe one communications endpoint. */
- 
- #define STRING_LENGTH	128		/* hosts, users, processes */
-@@ -29,10 +38,10 @@
-     char    pid[10];			/* access via eval_pid(request) */
-     struct host_info client[1];		/* client endpoint info */
-     struct host_info server[1];		/* server endpoint info */
--    void  (*sink) ();			/* datagram sink function or 0 */
--    void  (*hostname) ();		/* address to printable hostname */
--    void  (*hostaddr) ();		/* address to printable address */
--    void  (*cleanup) ();		/* cleanup function or 0 */
-+    void  (*sink) (int);		/* datagram sink function or 0 */
-+    void  (*hostname) (struct host_info *); /* address to printable hostname */
-+    void  (*hostaddr) (struct host_info *); /* address to printable address */
-+    void  (*cleanup) (struct request_info *); /* cleanup function or 0 */
-     struct netconfig *config;		/* netdir handle */
- };
- 
-@@ -70,20 +79,27 @@
- #define fromhost sock_host		/* no TLI support needed */
- #endif
- 
--extern int hosts_access();		/* access control */
--extern void shell_cmd();		/* execute shell command */
--extern char *percent_x();		/* do %<char> expansion */
--extern void rfc931();			/* client name from RFC 931 daemon */
--extern void clean_exit();		/* clean up and exit */
--extern void refuse();			/* clean up and exit */
--extern char *xgets();			/* fgets() on steroids */
--extern char *split_at();		/* strchr() and split */
--extern unsigned long dot_quad_addr();	/* restricted inet_addr() */
-+extern int hosts_access(struct request_info *request);	/* access control */
-+extern void shell_cmd(char *);		/* execute shell command */
-+extern char *percent_x(char *, int, char *, struct request_info *);
-+					/* do %<char> expansion */
-+extern void rfc931(struct sockaddr *, struct sockaddr *, char *);
-+					/* client name from RFC 931 daemon */
-+extern void clean_exit(struct request_info *);	/* clean up and exit */
-+extern void refuse(struct request_info *);	/* clean up and exit */
-+extern char *xgets(char *, int, FILE *);	/* fgets() on steroids */
-+extern char *split_at(char *, int);		/* strchr() and split */
-+extern unsigned long dot_quad_addr(char *);	/* restricted inet_addr() */
- 
- /* Global variables. */
- 
-+#ifdef HAVE_WEAKSYMS
-+extern int allow_severity __attribute__ ((weak)); /* for connection logging */
-+extern int deny_severity __attribute__ ((weak)); /* for connection logging */
-+#else
- extern int allow_severity;		/* for connection logging */
- extern int deny_severity;		/* for connection logging */
-+#endif
- extern char *hosts_allow_table;		/* for verification mode redirection */
- extern char *hosts_deny_table;		/* for verification mode redirection */
- extern int hosts_access_verbose;	/* for verbose matching mode */
-@@ -98,6 +114,8 @@
- #ifdef __STDC__
- extern struct request_info *request_init(struct request_info *,...);
- extern struct request_info *request_set(struct request_info *,...);
-+extern int hosts_ctl(char *daemon, char *client_name, char *client_addr,
-+		char *client_user);
- #else
- extern struct request_info *request_init();	/* initialize request */
- extern struct request_info *request_set();	/* update request structure */
-@@ -121,20 +139,23 @@
-   * host_info structures serve as caches for the lookup results.
-   */
- 
--extern char *eval_user();		/* client user */
--extern char *eval_hostname();		/* printable hostname */
--extern char *eval_hostaddr();		/* printable host address */
--extern char *eval_hostinfo();		/* host name or address */
--extern char *eval_client();		/* whatever is available */
--extern char *eval_server();		/* whatever is available */
-+extern char *eval_user(struct request_info *);	/* client user */
-+extern char *eval_hostname(struct host_info *);	/* printable hostname */
-+extern char *eval_hostaddr(struct host_info *);	/* printable host address */
-+extern char *eval_hostinfo(struct host_info *);	/* host name or address */
-+extern char *eval_client(struct request_info *);/* whatever is available */
-+extern char *eval_server(struct request_info *);/* whatever is available */
- #define eval_daemon(r)	((r)->daemon)	/* daemon process name */
- #define eval_pid(r)	((r)->pid)	/* process id */
- 
- /* Socket-specific methods, including DNS hostname lookups. */
- 
--extern void sock_host();		/* look up endpoint addresses */
--extern void sock_hostname();		/* translate address to hostname */
--extern void sock_hostaddr();		/* address to printable address */
-+/* look up endpoint addresses */
-+extern void sock_host(struct request_info *);
-+/* translate address to hostname */
-+extern void sock_hostname(struct host_info *);
-+/* address to printable address */
-+extern void sock_hostaddr(struct host_info *);
- #define sock_methods(r) \
- 	{ (r)->hostname = sock_hostname; (r)->hostaddr = sock_hostaddr; }
- 
-@@ -182,7 +203,7 @@
-   * behavior.
-   */
- 
--extern void process_options();		/* execute options */
-+extern void process_options(char *, struct request_info *);/* execute options */
- extern int dry_run;			/* verification flag */
- 
- /* Bug workarounds. */
-@@ -221,3 +242,7 @@
- #define strtok	my_strtok
- extern char *my_strtok();
- #endif
-+
-+__END_DECLS
-+
-+#endif
-diff -ruN tcp_wrappers_7.6.orig/weak_symbols.c tcp_wrappers_7.6/weak_symbols.c
---- tcp_wrappers_7.6.orig/weak_symbols.c	1970-01-01 01:00:00.000000000 +0100
-+++ tcp_wrappers_7.6/weak_symbols.c	2004-05-02 15:31:09.000000000 +0200
-@@ -0,0 +1,11 @@
-+ /*
-+  * @(#) weak_symbols.h 1.5 99/12/29 23:50
-+  * 
-+  * Author: Anthony Towns <ajt@debian.org>
-+  */
-+
-+#ifdef HAVE_WEAKSYMS
-+#include <syslog.h>
-+int deny_severity = LOG_WARNING;
-+int allow_severity = SEVERITY; 
-+#endif
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch
deleted file mode 100644
index b6681df8ce4..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_access.5
---- tcp_wrappers_7.6.orig/hosts_access.5	2003-08-21 03:15:36.000000000 +0200
-+++ tcp_wrappers_7.6/hosts_access.5	2003-08-21 03:15:31.000000000 +0200
-@@ -90,6 +90,10 @@
- pattern `131.155.72.0/255.255.254.0\' matches every address in the
- range `131.155.72.0\' through `131.155.73.255\'.
- .IP \(bu
-+An expression of the form `n.n.n.n/mm' is interpreted as a
-+`net/masklength' pair, where `mm' is the number of consecutive `1'
-+bits in the netmask applied to the `n.n.n.n' address.
-+.IP \(bu
- An expression of the form `[n:n:n:n:n:n:n:n]/m\' is interpreted as a
- `[net]/prefixlen\' pair. An IPv6 host address is matched if
- `prefixlen\' bits of `net\' is equal to the `prefixlen\' bits of the
-diff -ruN tcp_wrappers_7.6.orig/hosts_access.c tcp_wrappers_7.6/hosts_access.c
---- tcp_wrappers_7.6.orig/hosts_access.c	2003-08-21 03:15:36.000000000 +0200
-+++ tcp_wrappers_7.6/hosts_access.c	2003-08-21 03:09:30.000000000 +0200
-@@ -417,7 +417,8 @@
-     if ((addr = dot_quad_addr(string)) == INADDR_NONE)
- 	return (NO);
-     if ((net = dot_quad_addr(net_tok)) == INADDR_NONE
--	|| (mask = dot_quad_addr(mask_tok)) == INADDR_NONE) {
-+	|| ((mask = dot_quad_addr(mask_tok)) == INADDR_NONE
-+	    && (mask = cidr_mask_addr(mask_tok)) == 0)) {
- #ifndef INET6
- 	tcpd_warn("bad net/mask expression: %s/%s", net_tok, mask_tok);
- #endif
-diff -ruN tcp_wrappers_7.6.orig/misc.c tcp_wrappers_7.6/misc.c
---- tcp_wrappers_7.6.orig/misc.c	2003-08-21 03:15:36.000000000 +0200
-+++ tcp_wrappers_7.6/misc.c	2003-08-21 03:09:30.000000000 +0200
-@@ -107,3 +107,17 @@
-     }
-     return (runs == 4 ? inet_addr(str) : INADDR_NONE);
- }
-+
-+/* cidr_mask_addr - convert cidr netmask length to internal form */
-+
-+unsigned long cidr_mask_addr(str)
-+char   *str;
-+{
-+    int     maskbits;
-+
-+    maskbits = atoi(str);
-+    if (maskbits < 1 || maskbits > 32)
-+	return (0);
-+    return htonl(0xFFFFFFFF << (32 - maskbits));
-+}
-+
-diff -ruN tcp_wrappers_7.6.orig/tcpdchk.c tcp_wrappers_7.6/tcpdchk.c
---- tcp_wrappers_7.6.orig/tcpdchk.c	2003-08-21 03:15:36.000000000 +0200
-+++ tcp_wrappers_7.6/tcpdchk.c	2003-08-21 03:09:30.000000000 +0200
-@@ -497,12 +497,12 @@
- 	int mask_len;
- 
- 	if ((dot_quad_addr(pat) == INADDR_NONE
--	    || dot_quad_addr(mask) == INADDR_NONE)
-+	    || dot_quad_addr(mask) == INADDR_NONE && cidr_mask_addr(mask) == 0)
- 	    && (!is_inet6_addr(pat)
- 		|| ((mask_len = atoi(mask)) < 0 || mask_len > 128)))
- #else
- 	if (dot_quad_addr(pat) == INADDR_NONE
--	    || dot_quad_addr(mask) == INADDR_NONE)
-+	    || dot_quad_addr(mask) == INADDR_NONE && cidr_mask_addr(mask) == 0)
- #endif
- 	    tcpd_warn("%s/%s: bad net/mask pattern", pat, mask);
-     } else if (STR_EQ(pat, "FAIL")) {		/* obsolete */
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch
deleted file mode 100644
index 0c8594cac3a..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_access.5
---- tcp_wrappers_7.6.orig/hosts_access.5	2004-04-25 12:17:59.000000000 +0200
-+++ tcp_wrappers_7.6/hosts_access.5	2004-04-25 12:17:53.000000000 +0200
-@@ -89,6 +89,8 @@
- bitwise AND of the address and the `mask\'. For example, the net/mask
- pattern `131.155.72.0/255.255.254.0\' matches every address in the
- range `131.155.72.0\' through `131.155.73.255\'.
-+`255.255.255.255\' is not a valid mask value, so a single host can be
-+matched just by its IP.
- .IP \(bu
- An expression of the form `n.n.n.n/mm' is interpreted as a
- `net/masklength' pair, where `mm' is the number of consecutive `1'
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch
deleted file mode 100644
index 0c54ba6d35b..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-diff -ruN tcp_wrappers_7.6.orig/eval.c tcp_wrappers_7.6/eval.c
---- tcp_wrappers_7.6.orig/eval.c	1995-01-30 19:51:46.000000000 +0100
-+++ tcp_wrappers_7.6/eval.c	2004-11-04 13:59:01.000000000 +0100
-@@ -98,6 +98,28 @@
-     }
- }
- 
-+/* eval_port - return string with the port */
-+char   *eval_port(saddr)
-+#ifdef INET6
-+struct sockaddr *saddr;
-+#else
-+struct sockaddr_in *saddr;
-+#endif
-+{
-+    static char port[16];
-+    if (saddr != 0) {
-+        sprintf(port, "%u",
-+#ifdef INET6
-+            ntohs(((struct sockaddr_in *)saddr)->sin_port));
-+#else
-+            ntohs(saddr->sin_port));
-+#endif
-+    } else {
-+	strcpy(port, "0");
-+    }
-+    return (port);
-+}
-+
- /* eval_client - return string with as much about the client as we know */
- 
- char   *eval_client(request)
-diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_access.5
---- tcp_wrappers_7.6.orig/hosts_access.5	2004-11-04 13:17:45.000000000 +0100
-+++ tcp_wrappers_7.6/hosts_access.5	2004-11-04 13:55:32.000000000 +0100
-@@ -175,6 +175,8 @@
- unavailable.
- .IP "%n (%N)"
- The client (server) host name (or "unknown" or "paranoid").
-+.IP "%r (%R)"
-+The clients (servers) port number (or "0").
- .IP %p
- The daemon process id.
- .IP %s
-diff -ruN tcp_wrappers_7.6.orig/percent_x.c tcp_wrappers_7.6/percent_x.c
---- tcp_wrappers_7.6.orig/percent_x.c	1994-12-28 17:42:38.000000000 +0100
-+++ tcp_wrappers_7.6/percent_x.c	2004-11-04 13:19:29.000000000 +0100
-@@ -63,6 +63,8 @@
- 		ch == 'n' ? eval_hostname(request->client) :
- 		ch == 'N' ? eval_hostname(request->server) :
- 		ch == 'p' ? eval_pid(request) :
-+		ch == 'r' ? eval_port(request->client->sin) :
-+		ch == 'R' ? eval_port(request->server->sin) :
- 		ch == 's' ? eval_server(request) :
- 		ch == 'u' ? eval_user(request) :
- 		ch == '%' ? "%" : (tcpd_warn("unrecognized %%%c", ch), "");
-diff -ruN tcp_wrappers_7.6.orig/tcpd.h tcp_wrappers_7.6/tcpd.h
---- tcp_wrappers_7.6.orig/tcpd.h	2004-11-04 13:17:45.000000000 +0100
-+++ tcp_wrappers_7.6/tcpd.h	2004-11-04 13:19:13.000000000 +0100
-@@ -145,6 +145,11 @@
- extern char *eval_hostinfo(struct host_info *);	/* host name or address */
- extern char *eval_client(struct request_info *);/* whatever is available */
- extern char *eval_server(struct request_info *);/* whatever is available */
-+#ifdef INET6
-+extern char *eval_port(struct sockaddr *);
-+#else
-+extern char *eval_port(struct sockaddr_in *);
-+#endif
- #define eval_daemon(r)	((r)->daemon)	/* daemon process name */
- #define eval_pid(r)	((r)->pid)	/* process id */
- 
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings.patch
deleted file mode 100644
index 0fd2ca7b2b5..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Compile warning fixes from Debian
-
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
---- a/options.c
-+++ b/options.c
-@@ -41,6 +41,7 @@ static char sccsid[] = "@(#) options.c 1
- #include <netinet/in.h>
- #include <netdb.h>
- #include <stdio.h>
-+#include <unistd.h>
- #include <syslog.h>
- #include <pwd.h>
- #include <grp.h>
---- a/scaffold.c
-+++ b/scaffold.c
-@@ -17,6 +17,7 @@ static char sccs_id[] = "@(#) scaffold.c
- #include <arpa/inet.h>
- #include <netdb.h>
- #include <stdio.h>
-+#include <stdlib.h>
- #include <syslog.h>
- #include <setjmp.h>
- #include <string.h>
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings2.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings2.patch
deleted file mode 100644
index d9a6909db70..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/fix_warnings2.patch
+++ /dev/null
@@ -1,200 +0,0 @@
-Compile warning fixes from Debian
-
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
---- a/clean_exit.c
-+++ b/clean_exit.c
-@@ -13,6 +13,7 @@ static char sccsid[] = "@(#) clean_exit.
- #endif
- 
- #include <stdio.h>
-+#include <unistd.h>
- 
- extern void exit();
- 
---- a/hosts_access.c
-+++ b/hosts_access.c
-@@ -34,6 +34,7 @@ static char sccsid[] = "@(#) hosts_acces
- #include <netinet/in.h>
- #include <arpa/inet.h>
- #include <stdio.h>
-+#include <stdlib.h>
- #include <syslog.h>
- #include <ctype.h>
- #include <errno.h>
---- a/misc.c
-+++ b/misc.c
-@@ -13,6 +13,7 @@ static char sccsic[] = "@(#) misc.c 1.2
- #include <netinet/in.h>
- #include <arpa/inet.h>
- #include <stdio.h>
-+#include <stdlib.h>
- #include <string.h>
- 
- #include "tcpd.h"
---- a/options.c
-+++ b/options.c
-@@ -41,6 +41,7 @@ static char sccsid[] = "@(#) options.c 1
- #include <netinet/in.h>
- #include <netdb.h>
- #include <stdio.h>
-+#include <stdlib.h>
- #include <unistd.h>
- #include <syslog.h>
- #include <pwd.h>
---- a/percent_x.c
-+++ b/percent_x.c
-@@ -17,6 +17,7 @@ static char sccsid[] = "@(#) percent_x.c
- /* System libraries. */
- 
- #include <stdio.h>
-+#include <unistd.h>
- #include <syslog.h>
- #include <string.h>
- 
---- a/rfc931.c
-+++ b/rfc931.c
-@@ -16,6 +16,7 @@ static char sccsid[] = "@(#) rfc931.c 1.
- /* System libraries. */
- 
- #include <stdio.h>
-+#include <unistd.h>
- #include <syslog.h>
- #include <sys/types.h>
- #include <sys/socket.h>
---- a/tcpd.c
-+++ b/tcpd.c
-@@ -22,6 +22,7 @@ static char sccsid[] = "@(#) tcpd.c 1.10
- #include <sys/socket.h>
- #include <netinet/in.h>
- #include <stdio.h>
-+#include <unistd.h>
- #include <syslog.h>
- #include <string.h>
- 
---- a/update.c
-+++ b/update.c
-@@ -20,6 +20,7 @@ static char sccsid[] = "@(#) update.c 1.
- /* System libraries */
- 
- #include <stdio.h>
-+#include <unistd.h>
- #include <syslog.h>
- #include <string.h>
- 
---- a/fakelog.c
-+++ b/fakelog.c
-@@ -17,7 +17,7 @@ static char sccsid[] = "@(#) fakelog.c 1
- 
- /* ARGSUSED */
- 
--openlog(name, logopt, facility)
-+void openlog(name, logopt, facility)
- char   *name;
- int     logopt;
- int     facility;
-@@ -27,7 +27,7 @@ int     facility;
- 
- /* vsyslog - format one record */
- 
--vsyslog(severity, fmt, ap)
-+void vsyslog(severity, fmt, ap)
- int     severity;
- char   *fmt;
- va_list ap;
-@@ -43,7 +43,7 @@ va_list ap;
- 
- /* VARARGS */
- 
--VARARGS(syslog, int, severity)
-+void VARARGS(syslog, int, severity)
- {
-     va_list ap;
-     char   *fmt;
-@@ -56,7 +56,7 @@ VARARGS(syslog, int, severity)
- 
- /* closelog - dummy */
- 
--closelog()
-+void closelog()
- {
-     /* void */
- }
---- a/safe_finger.c
-+++ b/safe_finger.c
-@@ -22,10 +22,15 @@ static char sccsid[] = "@(#) safe_finger
- 
- #include <sys/types.h>
- #include <sys/stat.h>
-+#include <sys/wait.h>
-+#include <fcntl.h>
- #include <signal.h>
- #include <stdio.h>
-+#include <stdlib.h>
-+#include <unistd.h>
- #include <ctype.h>
- #include <pwd.h>
-+#include <grp.h>
- #include <syslog.h>
- 
- extern void exit();
-@@ -52,7 +59,7 @@ int     sig;
-     exit(0);
- }
- 
--main(argc, argv)
-+int main(argc, argv)
- int     argc;
- char  **argv;
- {
---- a/tcpdchk.c
-+++ b/tcpdchk.c
-@@ -28,6 +28,8 @@ static char sccsid[] = "@(#) tcpdchk.c 1
- #include <netinet/in.h>
- #include <arpa/inet.h>
- #include <stdio.h>
-+#include <stdlib.h>
-+#include <unistd.h>
- #include <syslog.h>
- #include <setjmp.h>
- #include <errno.h>
---- a/tcpdmatch.c
-+++ b/tcpdmatch.c
-@@ -26,6 +26,7 @@ static char sccsid[] = "@(#) tcpdmatch.c
- #include <arpa/inet.h>
- #include <netdb.h>
- #include <stdio.h>
-+#include <unistd.h>
- #include <syslog.h>
- #include <setjmp.h>
- #include <string.h>
---- a/try-from.c
-+++ b/try-from.c
-@@ -37,7 +37,7 @@ static char sccsid[] = "@(#) try-from.c
- int     allow_severity = SEVERITY;	/* run-time adjustable */
- int     deny_severity = LOG_WARNING;	/* ditto */
- 
--main(argc, argv)
-+int main(argc, argv)
- int     argc;
- char  **argv;
- {
---- a/inetcf.c
-+++ b/inetcf.c
-@@ -12,6 +12,7 @@ static char sccsid[] = "@(#) inetcf.c 1.
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <stdio.h>
-+#include <stdlib.h>
- #include <errno.h>
- #include <string.h>
- 
-@@ -20,6 +21,7 @@ extern void exit();
- 
- #include "tcpd.h"
- #include "inetcf.h"
-+#include "scaffold.h"
- 
-  /*
-   * Network configuration files may live in unusual places. Here are some
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/have_strerror.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/have_strerror.patch
deleted file mode 100644
index 9b1a3c0fa1a..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/have_strerror.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-diff -ruN tcp_wrappers_7.6.orig/percent_m.c tcp_wrappers_7.6/percent_m.c
---- tcp_wrappers_7.6.orig/percent_m.c	1994-12-28 17:42:37.000000000 +0100
-+++ tcp_wrappers_7.6/percent_m.c	2003-08-21 02:45:31.000000000 +0200
-@@ -29,11 +29,15 @@
- 
-     while (*bp = *cp)
- 	if (*cp == '%' && cp[1] == 'm') {
-+#ifdef HAVE_STRERROR
-+	    strcpy(bp, strerror(errno));
-+#else
- 	    if (errno < sys_nerr && errno > 0) {
- 		strcpy(bp, sys_errlist[errno]);
- 	    } else {
- 		sprintf(bp, "Unknown error %d", errno);
- 	    }
-+#endif
- 	    bp += strlen(bp);
- 	    cp += 2;
- 	} else {
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
deleted file mode 100644
index 79b677f456c..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-Index: tcp_wrappers_7.6.orig/Makefile
-===================================================================
---- tcp_wrappers_7.6.orig.orig/Makefile	2009-04-06 10:55:47.000000000 +0000
-+++ tcp_wrappers_7.6.orig/Makefile	2009-04-06 10:57:04.000000000 +0000
-@@ -748,31 +748,31 @@
- 
- $(SHLIB): $(SHLIB_OBJ)
- 	rm -f $(SHLIB)
--	$(CC) -o $(SHLIB) $(SHLINKFLAGS) $(SHLIB_OBJ)
-+	$(CC) $(LDFLAGS) -o $(SHLIB) $(SHLINKFLAGS) $(SHLIB_OBJ)
- 	ln -sf $(notdir $(SHLIB)) $(SHLIBSOMAJ)
- 	ln -sf $(notdir $(SHLIBSOMAJ)) $(SHLIBSO)
- 
- tcpd:	tcpd.o $(SHLIB)
--	$(CC) $(CFLAGS) -o $@ tcpd.o $(SHLIBFLAGS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ tcpd.o $(SHLIBFLAGS)
- 
- miscd:	miscd.o $(LIB)
--	$(CC) $(CFLAGS) -o $@ miscd.o $(LIB) $(LIBS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ miscd.o $(LIB) $(LIBS)
- 
- safe_finger: safe_finger.o $(SHLIB)
--	$(CC) $(CFLAGS) -o $@ safe_finger.o $(SHLIBFLAGS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ safe_finger.o $(SHLIBFLAGS)
- 
- TCPDMATCH_OBJ = tcpdmatch.o fakelog.o inetcf.o scaffold.o
- 
- tcpdmatch: $(TCPDMATCH_OBJ) $(SHLIB)
--	$(CC) $(CFLAGS) -o $@ $(TCPDMATCH_OBJ) $(SHLIBFLAGS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(TCPDMATCH_OBJ) $(SHLIBFLAGS)
- 
- try-from: try-from.o fakelog.o $(SHLIB)
--	$(CC) $(CFLAGS) -o $@ try-from.o fakelog.o $(SHLIBFLAGS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ try-from.o fakelog.o $(SHLIBFLAGS)
- 
- TCPDCHK_OBJ = tcpdchk.o fakelog.o inetcf.o scaffold.o
- 
- tcpdchk: $(TCPDCHK_OBJ) $(SHLIB)
--	$(CC) $(CFLAGS) -o $@ $(TCPDCHK_OBJ) $(SHLIBFLAGS)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(TCPDCHK_OBJ) $(SHLIBFLAGS)
- 
- shar:	$(KIT)
- 	@shar $(KIT)
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile-fix-parallel.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile-fix-parallel.patch
deleted file mode 100644
index 23762449ac4..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/makefile-fix-parallel.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From daf89d272e51b2153015ce7f54ab0b86182e64c1 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Wed, 28 Jan 2015 18:50:23 -0800
-Subject: [PATCH] Makefile: fix for parallel build
-
-Fixed:
-make: *** No rule to make target `cflags', needed by `tcpd.o'.  Stop.
-
-Let "cflags" depend on config-check which generates cflgas will fix the
-problem.
-
-Also fixed:
-Fatal error: can't create shared/hosts_access.o: No such file or directory
-
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- Makefile |    5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index fe5e732..f468751 100644
---- a/Makefile
-+++ b/Makefile
-@@ -714,6 +714,7 @@ KIT	= README miscd.c tcpd.c fromhost.c hosts_access.c shell_cmd.c \
- LIB	= libwrap.a
- 
- shared/%.o: %.c
-+	[ -d shared ] || mkdir -p shared
- 	$(CC) $(CFLAGS) $(SHCFLAGS) -c $< -o $@
- 
- SOMAJOR = 0
-@@ -730,6 +731,8 @@ SHLIB_OBJ= $(addprefix shared/, $(LIB_OBJ));
- 
- all other: config-check tcpd tcpdmatch try-from safe_finger tcpdchk $(LIB)
- 
-+cflags: config-check
-+
- # Invalidate all object files when the compiler options (CFLAGS) have changed.
- 
- config-check:
-@@ -739,7 +742,7 @@ config-check:
- 	then rm cflags.new ; \
- 	else mv cflags.new cflags ; \
- 	fi >/dev/null 2>/dev/null
--	@if [ ! -d shared ]; then mkdir shared; fi
-+	@[ -d shared ] || mkdir -p shared
- 
- $(LIB):	$(LIB_OBJ)
- 	rm -f $(LIB)
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/man_fromhost.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/man_fromhost.patch
deleted file mode 100644
index 30e74a1de11..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/man_fromhost.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-diff -ruN tcp_wrappers_7.6.orig/hosts_access.3 tcp_wrappers_7.6/hosts_access.3
---- tcp_wrappers_7.6.orig/hosts_access.3	2004-04-25 00:10:48.000000000 +0200
-+++ tcp_wrappers_7.6/hosts_access.3	2004-04-25 00:09:36.000000000 +0200
-@@ -14,6 +14,9 @@
- struct request_info *request_set(request, key, value, ..., 0)
- struct request_info *request;
- 
-+void fromhost(request)
-+struct request_info *request;
-+
- int hosts_access(request)
- struct request_info *request;
- 
-@@ -60,6 +63,7 @@
- is available, host names and client user names are looked up on demand,
- using the request structure as a cache.  hosts_access() returns zero if
- access should be denied.
-+fromhost() must be called before hosts_access().
- .PP
- hosts_ctl() is a wrapper around the request_init() and hosts_access()
- routines with a perhaps more convenient interface (though it does not
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch
deleted file mode 100644
index b998675aa0b..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-__BEGIN_DECLS/__END_DECLS are BSD specific and not defined in musl
-glibc and uclibc had sys/cdefs.h doing it.
-
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: tcp_wrappers_7.6/tcpd.h
-===================================================================
---- tcp_wrappers_7.6.orig/tcpd.h
-+++ tcp_wrappers_7.6/tcpd.h
-@@ -11,7 +11,9 @@
- #include <netinet/in.h>
- #include <stdio.h>
- 
--__BEGIN_DECLS
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- /* Structure to describe one communications endpoint. */
- 
-@@ -252,6 +254,8 @@ extern char *fix_strtok();
- extern char *my_strtok();
- #endif
- 
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
- 
- #endif
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rename_strings_variable.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rename_strings_variable.patch
deleted file mode 100644
index f42b9d2799a..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rename_strings_variable.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-STRINGS name conflicts with variable for strings tools (e.g. i586-oe-linux-strings)
-
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
---- tcp_wrappers_7.6/Makefile.orig	2013-04-18 23:41:58.277981740 +0200
-+++ tcp_wrappers_7.6/Makefile	2013-04-18 23:42:42.513978966 +0200
-@@ -309,7 +309,7 @@
- pyramid:
- 	@make REAL_DAEMON_DIR=$(REAL_DAEMON_DIR) STYLE=$(STYLE) \
- 	LIBS= RANLIB=ranlib ARFLAGS=rv AUX_OBJ="environ.o vfprintf.o" \
--	STRINGS="-Dstrchr=index -Dstrrchr=rindex -Dmemcmp=bcmp -Dno_memcpy" \
-+	STRINGS_FLAGS="-Dstrchr=index -Dstrrchr=rindex -Dmemcmp=bcmp -Dno_memcpy" \
- 	NETGROUP="-DNETGROUP -DUSE_GETDOMAIN" TLI= all
- 
- # Untested.
-@@ -419,7 +419,7 @@
- # Uncomment the following if your C library does not provide the
- # strchr/strrchr/memcmp routines, but comes with index/rindex/bcmp.
- #
--#STRINGS= -Dstrchr=index -Dstrrchr=rindex -Dmemcmp=bcmp -Dno_memcpy
-+#STRINGS_FLAGS= -Dstrchr=index -Dstrrchr=rindex -Dmemcmp=bcmp -Dno_memcpy
- 
- #################################################################
- # System dependencies: selection of non-default object libraries.
-@@ -690,7 +690,7 @@
- 	$(BUGS) $(SYSTYPE) $(AUTH) $(UMASK) \
- 	-DREAL_DAEMON_DIR=\"$(REAL_DAEMON_DIR)\" $(STYLE) $(KILL_OPT) \
- 	-DSEVERITY=$(SEVERITY) -DRFC931_TIMEOUT=$(RFC931_TIMEOUT) \
--	$(UCHAR) $(TABLES) $(STRINGS) $(TLI) $(EXTRA_CFLAGS) $(DOT) \
-+	$(UCHAR) $(TABLES) $(STRINGS_FLAGS) $(TLI) $(EXTRA_CFLAGS) $(DOT) \
- 	$(VSYSLOG) $(HOSTNAME)
- 
- LIB_OBJ= hosts_access.o options.o shell_cmd.o rfc931.o eval.o \
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch
deleted file mode 100644
index a864e381298..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-diff -ruN tcp_wrappers_7.6.orig/rfc931.c tcp_wrappers_7.6/rfc931.c
---- tcp_wrappers_7.6.orig/rfc931.c	2004-08-29 18:40:08.000000000 +0200
-+++ tcp_wrappers_7.6/rfc931.c	2004-08-29 18:40:02.000000000 +0200
-@@ -92,6 +92,8 @@
-     char   *cp;
-     char   *result = unknown;
-     FILE   *fp;
-+    unsigned saved_timeout;
-+    struct sigaction nact, oact;
- 
- #ifdef INET6
-     /* address family must be the same */
-@@ -134,7 +136,12 @@
- 	 */
- 
- 	if (setjmp(timebuf) == 0) {
--	    signal(SIGALRM, timeout);
-+	    /* Save SIGALRM timer and handler. Sudheer Abdul-Salam, SUN. */
-+	    saved_timeout = alarm(0);
-+	    nact.sa_handler = timeout;
-+	    nact.sa_flags = 0;
-+	    (void) sigemptyset(&nact.sa_mask);
-+	    (void) sigaction(SIGALRM, &nact, &oact);
- 	    alarm(rfc931_timeout);
- 
- 	    /*
-@@ -223,6 +230,10 @@
- 	    }
- 	    alarm(0);
- 	}
-+	/* Restore SIGALRM timer and handler. Sudheer Abdul-Salam, SUN. */
-+	(void) sigaction(SIGALRM, &oact, NULL);
-+	if (saved_timeout > 0)
-+	    alarm(saved_timeout);
- 	fclose(fp);
-     }
-     STRN_CPY(dest, result, STRING_LENGTH);
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff
deleted file mode 100644
index 2d0f548f89f..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-diff -ruNp tcp_wrappers_7.6.orig/scaffold.c tcp_wrappers_7.6/scaffold.c
---- tcp_wrappers_7.6.orig/scaffold.c	2005-03-09 18:22:04.000000000 +0100
-+++ tcp_wrappers_7.6/scaffold.c	2005-03-09 18:20:47.000000000 +0100
-@@ -237,10 +237,17 @@ struct request_info *request;
- 
- /* ARGSUSED */
- 
--void    rfc931(request)
--struct request_info *request;
-+void    rfc931(rmt_sin, our_sin, dest)
-+#ifdef INET6
-+struct sockaddr *rmt_sin;
-+struct sockaddr *our_sin;
-+#else
-+struct sockaddr_in *rmt_sin;
-+struct sockaddr_in *our_sin;
-+#endif
-+char   *dest;
- {
--    strcpy(request->user, unknown);
-+    strcpy(dest, unknown);
- }
- 
- /* check_path - examine accessibility */
-diff -ruNp tcp_wrappers_7.6.orig/tcpd.h tcp_wrappers_7.6/tcpd.h
---- tcp_wrappers_7.6.orig/tcpd.h	2005-03-09 18:22:04.000000000 +0100
-+++ tcp_wrappers_7.6/tcpd.h	2005-03-09 18:21:23.000000000 +0100
-@@ -83,7 +83,11 @@ extern int hosts_access(struct request_i
- extern void shell_cmd(char *);		/* execute shell command */
- extern char *percent_x(char *, int, char *, struct request_info *);
- 					/* do %<char> expansion */
-+#ifdef INET6
- extern void rfc931(struct sockaddr *, struct sockaddr *, char *);
-+#else
-+extern void rfc931(struct sockaddr_in *, struct sockaddr_in *, char *);
-+#endif
- 					/* client name from RFC 931 daemon */
- extern void clean_exit(struct request_info *);	/* clean up and exit */
- extern void refuse(struct request_info *);	/* clean up and exit */
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.8 b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.8
deleted file mode 100644
index 875616b9eab..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.8
+++ /dev/null
@@ -1,34 +0,0 @@
-.TH SAFE_FINGER 8 "21th June 1997" Linux "Linux Programmer's Manual"
-.SH NAME
-safe_finger \- finger client wrapper that protects against nasty stuff
-from finger servers
-.SH SYNOPSIS
-.B safe_finger [finger_options]
-.SH DESCRIPTION
-The
-.B safe_finger
-command protects against nasty stuff from finger servers. Use this
-program for automatic reverse finger probes from the
-.B tcp_wrapper
-.B (tcpd)
-, not the raw finger command. The
-.B safe_finger
-command makes sure that the finger client is not run with root
-privileges. It also runs the finger client with a defined PATH
-environment.
-.B safe_finger
-will also protect you from problems caused by the output of some
-finger servers. The problem: some programs may react to stuff in
-the first column. Other programs may get upset by thrash anywhere
-on a line. File systems may fill up as the finger server keeps
-sending data. Text editors may bomb out on extremely long lines.
-The finger server may take forever because it is somehow wedged.
-.B safe_finger
-takes care of all this badness.
-.SH SEE ALSO
-.BR hosts_access (5),
-.BR hosts_options (5),
-.BR tcpd (8)
-.SH AUTHOR
-Wietse Venema, Eindhoven University of Technology, The Netherlands.
-
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch
deleted file mode 100644
index b6543fc92e5..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
---- tcp-wrappers-7.6-ipv6.1.orig/safe_finger.c
-+++ tcp-wrappers-7.6-ipv6.1/safe_finger.c
-@@ -26,21 +26,24 @@
- #include <stdio.h>
- #include <ctype.h>
- #include <pwd.h>
-+#include <syslog.h>
- 
- extern void exit();
- 
- /* Local stuff */
- 
--char    path[] = "PATH=/bin:/usr/bin:/usr/ucb:/usr/bsd:/etc:/usr/etc:/usr/sbin";
-+char    path[] = "PATH=/bin:/usr/bin:/sbin:/usr/sbin";
- 
- #define	TIME_LIMIT	60		/* Do not keep listinging forever */
- #define	INPUT_LENGTH	100000		/* Do not keep listinging forever */
- #define	LINE_LENGTH	128		/* Editors can choke on long lines */
- #define	FINGER_PROGRAM	"finger"	/* Most, if not all, UNIX systems */
- #define	UNPRIV_NAME	"nobody"	/* Preferred privilege level */
--#define	UNPRIV_UGID	32767		/* Default uid and gid */
-+#define	UNPRIV_UGID	65534		/* Default uid and gid */
- 
- int     finger_pid;
-+int	allow_severity = SEVERITY;
-+int	deny_severity = LOG_WARNING;
- 
- void    cleanup(sig)
- int     sig;
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch
deleted file mode 100644
index 843063fd7cf..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-* Mon Feb 10 2003 Harald Hoyer <harald@redhat.de> 7.6-29
-- added security patch tcp_wrappers-7.6-sig.patch
-
---- tcp_wrappers_7.6/hosts_access.c.sig	2003-02-10 16:18:31.000000000 +0100
-+++ tcp_wrappers_7.6/hosts_access.c	2003-02-10 16:50:38.000000000 +0100
-@@ -66,6 +66,7 @@
- 
- #define	YES		1
- #define	NO		0
-+#define ERR             -1
- 
-  /*
-   * These variables are globally visible so that they can be redirected in
-@@ -129,9 +129,9 @@
- 	return (verdict == AC_PERMIT);
-     if (table_match(hosts_allow_table, request))
- 	return (YES);
--    if (table_match(hosts_deny_table, request))
--	return (NO);
--    return (YES);
-+    if (table_match(hosts_deny_table, request) == NO)
-+	return (YES);
-+    return (NO);
- }
- 
- /* table_match - match table entries with (daemon, client) pair */
-@@ -175,6 +175,7 @@
- 	(void) fclose(fp);
-     } else if (errno != ENOENT) {
- 	tcpd_warn("cannot open %s: %m", table);
-+	match = ERR;
-     }
-     if (match) {
- 	if (hosts_access_verbose > 1)
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch
deleted file mode 100644
index d4a1146594c..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-diff -ruNp tcp_wrappers_7.6.orig/rfc931.c tcp_wrappers_7.6/rfc931.c
---- tcp_wrappers_7.6.orig/rfc931.c	2004-08-29 18:42:25.000000000 +0200
-+++ tcp_wrappers_7.6/rfc931.c	2004-08-29 18:41:04.000000000 +0200
-@@ -33,7 +33,7 @@ static char sccsid[] = "@(#) rfc931.c 1.
- 
- int     rfc931_timeout = RFC931_TIMEOUT;/* Global so it can be changed */
- 
--static jmp_buf timebuf;
-+static sigjmp_buf timebuf;
- 
- /* fsocket - open stdio stream on top of socket */
- 
-@@ -62,7 +62,7 @@ int     protocol;
- static void timeout(sig)
- int     sig;
- {
--    longjmp(timebuf, sig);
-+    siglongjmp(timebuf, sig);
- }
- 
- /* rfc931 - return remote user name, given socket structures */
-@@ -135,7 +135,7 @@ char   *dest;
- 	 * Set up a timer so we won't get stuck while waiting for the server.
- 	 */
- 
--	if (setjmp(timebuf) == 0) {
-+	if (sigsetjmp(timebuf, 0) == 0) {
- 	    /* Save SIGALRM timer and handler. Sudheer Abdul-Salam, SUN. */
- 	    saved_timeout = alarm(0);
- 	    nact.sa_handler = timeout;
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch
deleted file mode 100644
index fb64f93f1d1..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-commit 88b6984ef0bf3b703c1c851092662b95e91db1ff
-Author: farrah rashid <farrah.rashid@windriver.com>
-Date:   Tue Feb 12 09:53:50 2013 -0500
-
-    tcp-wrappers Support for building with glibc
-    
-    Added support for socklen_t type to len argument passed to socket related
-    calls. This fixes a bug that causes tcp wrappers to fail when using sshd.
-    
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-Signed-off-by: farrah rashid <farrah.rashid@windriver.com>
-
-diff --git a/fix_options.c b/fix_options.c
-index 7473adf..fe2b442 100644
---- a/fix_options.c
-+++ b/fix_options.c
-@@ -38,7 +38,12 @@ struct request_info *request;
- #ifdef IP_OPTIONS
-     unsigned char optbuf[BUFFER_SIZE / 3], *cp;
-     char    lbuf[BUFFER_SIZE], *lp;
--    int     optsize = sizeof(optbuf), ipproto;
-+#ifdef __GLIBC__
-+    socklen_t  optsize = sizeof(optbuf);
-+#else
-+    int     optsize = sizeof(optbuf);
-+#endif
-+    int ipproto;
-     struct protoent *ip;
-     int     fd = request->fd;
-     unsigned int opt;
-diff --git a/socket.c b/socket.c
-index 4b2c575..a0d2987 100644
---- a/socket.c
-+++ b/socket.c
-@@ -95,7 +95,11 @@ struct request_info *request;
-     static struct sockaddr_in client;
-     static struct sockaddr_in server;
- #endif
-+#ifdef __GLIBC__
-+    socklen_t  len;
-+#else
-     int     len;
-+#endif
-     char    buf[BUFSIZ];
-     int     fd = request->fd;
- 
-@@ -426,7 +430,11 @@ int     fd;
- #else
-     struct sockaddr_in sin;
- #endif
-+#ifdef __GLIBC__
-+    socklen_t  size = sizeof(sin);
-+#else
-     int     size = sizeof(sin);
-+#endif
- 
-     /*
-      * Eat up the not-yet received datagram. Some systems insist on a
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrapped.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrapped.patch
deleted file mode 100644
index 2e3b1719fd3..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrapped.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Inactive-Upstream [current release is from 1997; no vcs anywhere]
-
-diff -ruN tcp_wrappers_7.6.orig/tcpdchk.c tcp_wrappers_7.6/tcpdchk.c
---- tcp_wrappers_7.6.orig/tcpdchk.c	2003-08-21 02:50:37.000000000 +0200
-+++ tcp_wrappers_7.6/tcpdchk.c	2003-08-21 02:50:33.000000000 +0200
-@@ -53,6 +53,24 @@
- #include "inetcf.h"
- #include "scaffold.h"
- 
-+/* list of programs which are known to be linked with libwrap in debian */
-+static const char *const libwrap_programs[] = {
-+    "portmap", "mountd", "statd", "ugidd",
-+    "redir", "rlinetd",
-+    "sshd",
-+    "atftpd",
-+    "diald",
-+    "esound",
-+    "gdm", "gnome-session",
-+    "icecast", "icecast_admin", "icecast_client", "icecast_source",
-+    "mysqld",
-+    "ntop",
-+    "pptpd",
-+    "rquotad",
-+    "sendmail", "smail",
-+    NULL
-+};
-+
-  /*
-   * Stolen from hosts_access.c...
-   */
-@@ -147,8 +165,8 @@
-     /*
-      * These are not run from inetd but may have built-in access control.
-      */
--    inet_set("portmap", WR_NOT);
--    inet_set("rpcbind", WR_NOT);
-+    for (c = 0; libwrap_programs[c]; c++)
-+	inet_set(libwrap_programs[c], WR_YES);
- 
-     /*
-      * Check accessibility of access control files.
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/try-from.8 b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/try-from.8
deleted file mode 100644
index 9c8f30543eb..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/try-from.8
+++ /dev/null
@@ -1,28 +0,0 @@
-.TH TRY-FROM 8 "21th June 1997" Linux "Linux Programmer's Manual"
-.SH NAME
-try-from \- test program for the tcp_wrapper
-.SH SYNOPSIS
-.B try-from
-.SH DESCRIPTION
-The
-.B try-from
-command can be called via a remote shell command to find out
-if the hostname and address are properly recognized
-by the
-.B tcp_wrapper
-library, if username lookup works, and (SysV only) if the TLI
-on top of IP heuristics work. Diagnostics are reported through
-.BR syslog (3)
-and redirected to stderr.
-
-Example:
-
-rsh host /some/where/try-from
-
-.SH SEE ALSO
-.BR hosts_access (5),
-.BR hosts_options (5),
-.BR tcpd (8)
-.SH AUTHOR
-Wietse Venema, Eindhoven University of Technology, The Netherlands.
-
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
deleted file mode 100644
index da3ff908915..00000000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ /dev/null
@@ -1,135 +0,0 @@
-SUMMARY = "Security tool that is a wrapper for TCP daemons"
-HOMEPAGE = "http://www.softpanorama.org/Net/Network_security/TCP_wrappers/"
-DESCRIPTION = "Tools for monitoring and filtering incoming requests for tcp \
-               services."
-SECTION = "console/network"
-
-LICENSE = "BSD-1-Clause"
-LIC_FILES_CHKSUM = "file://DISCLAIMER;md5=071bd69cb78b18888ea5e3da5c3127fa"
-
-PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev libwrap-staticdev ${PN} ${PN}-doc"
-FILES:libwrap = "${base_libdir}/lib*${SOLIBS}"
-FILES:libwrap-doc = "${mandir}/man3 ${mandir}/man5"
-FILES:libwrap-dev = "${libdir}/lib*${SOLIBSDEV} ${includedir}"
-FILES:libwrap-staticdev = "${libdir}/lib*.a"
-FILES:${PN} = "${sbindir}"
-FILES:${PN}-doc = "${mandir}/man8"
-
-SRC_URI = "http://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
-           file://00_man_quoting.diff \
-           file://01_man_portability.patch \
-           file://05_wildcard_matching.patch \
-           file://06_fix_gethostbyname.patch \
-           file://10_usagi-ipv6.patch \
-           file://11_tcpd_blacklist.patch \
-           file://11_usagi_fix.patch \
-           file://12_makefile_config.patch \
-           file://13_shlib_weaksym.patch \
-           file://14_cidr_support.patch \
-           file://15_match_clarify.patch \
-           file://expand_remote_port.patch \
-           file://have_strerror.patch \
-           file://man_fromhost.patch \
-           file://restore_sigalarm.patch \
-           file://rfc931.diff \
-           file://safe_finger.patch \
-           file://sig_fix.patch \
-           file://siglongjmp.patch \
-           file://socklen_t.patch \
-           file://tcpdchk_libwrapped.patch \
-           file://ldflags.patch \
-           file://rename_strings_variable.patch \
-           file://try-from.8 \
-           file://safe_finger.8 \
-           file://makefile-fix-parallel.patch \
-           file://musl-decls.patch \
-           file://0001-Fix-build-with-clang.patch \
-           file://fix_warnings.patch \
-           file://fix_warnings2.patch \
-           file://0001-Remove-fgets-extern-declaration.patch \
-           file://0001-Fix-implicit-function-declaration-warnings.patch \
-           "
-
-SRC_URI[sha256sum] = "9543d7adedf78a6de0b221ccbbd1952e08b5138717f4ade814039bb489a4315d"
-
-S = "${UNPACKDIR}/tcp_wrappers_${PV}"
-
-CFLAGS += "-std=gnu17"
-
-EXTRA_OEMAKE = "'CC=${CC}' \
-                'AR=${AR}' \
-                'RANLIB=${RANLIB}' \
-                'REAL_DAEMON_DIR=${sbindir}' \
-                'STYLE=-DPROCESS_OPTIONS' \
-                'FACILITY=LOG_DAEMON' \
-                'SEVERITY=LOG_INFO' \
-                'BUGS=' \
-                'VSYSLOG=' \
-                'RFC931_TIMEOUT=10' \
-                'ACCESS=-DHOSTS_ACCESS' \
-                'KILL_OPT=-DKILL_IP_OPTIONS' \
-                'UMASK=-DDAEMON_UMASK=022' \
-                'NETGROUP=${EXTRA_OEMAKE_NETGROUP}' \
-                'ARFLAGS=rv' \
-                'AUX_OBJ=weak_symbols.o' \
-                'TLI=' \
-                'COPTS=' \
-                'EXTRA_CFLAGS=${CFLAGS} -DSYS_ERRLIST_DEFINED -DHAVE_STRERROR -DHAVE_WEAKSYMS -D_REENTRANT -DINET6=1 -Dss_family=__ss_family -Dss_len=__ss_len'"
-
-EXTRA_OEMAKE_NETGROUP = "-DNETGROUP -DUSE_GETDOMAIN"
-EXTRA_OEMAKE_NETGROUP:libc-musl = "-DUSE_GETDOMAIN"
-
-EXTRA_OEMAKE:append:libc-musl = " 'LIBS='"
-
-do_compile () {
-	oe_runmake 'TABLES=-DHOSTS_DENY=\"${sysconfdir}/hosts.deny\" -DHOSTS_ALLOW=\"${sysconfdir}/hosts.allow\"' \
-		   all
-}
-
-BINS = "safe_finger tcpd tcpdchk try-from tcpdmatch"
-MANS3 = "hosts_access"
-MANS5 = "hosts_options"
-MANS8 = "tcpd tcpdchk tcpdmatch"
-do_install () {
-	oe_libinstall -a libwrap ${D}${libdir}
-	oe_libinstall -C shared -so libwrap ${D}${base_libdir}
-
-	if [ "${libdir}" != "${base_libdir}" ] ; then
-		rel_lib_prefix=`echo ${libdir} | sed 's,\(^/\|\)[^/][^/]*,..,g'`
-		libname=`readlink ${D}${base_libdir}/libwrap.so | xargs basename`
-		ln -s ${rel_lib_prefix}${base_libdir}/${libname} ${D}${libdir}/libwrap.so
-		rm -f ${D}${base_libdir}/libwrap.so
-	fi
-
-	install -d ${D}${sbindir}
-	for b in ${BINS}; do
-		install -m 0755 $b ${D}${sbindir}/ || exit 1
-	done
-
-	install -d ${D}${mandir}/man3
-	for m in ${MANS3}; do
-		install -m 0644 $m.3 ${D}${mandir}/man3/ || exit 1
-	done
-
-	install -d ${D}${mandir}/man5
-	for m in ${MANS5}; do
-		install -m 0644 $m.5 ${D}${mandir}/man5/ || exit 1
-	done
-
-	install -d ${D}${mandir}/man8
-	for m in ${MANS8}; do
-		install -m 0644 $m.8 ${D}${mandir}/man8/ || exit 1
-	done
-
-	install -m 0644 ${UNPACKDIR}/try-from.8 ${D}${mandir}/man8/
-	install -m 0644 ${UNPACKDIR}/safe_finger.8 ${D}${mandir}/man8/
-
-	install -d ${D}${includedir}
-	install -m 0644 tcpd.h ${D}${includedir}/
-
-	install -d ${D}${sysconfdir}
-	touch ${D}${sysconfdir}/hosts.allow
-	touch ${D}${sysconfdir}/hosts.deny
-}
-
-FILES:${PN} += "${sysconfdir}/hosts.allow ${sysconfdir}/hosts.deny"
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
index 2f727128a57..a15ea43d66a 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -26,9 +26,6 @@ SYSTEMD_SERVICE:${PN} = "xinetd.service"
 INITSCRIPT_NAME = "xinetd"
 INITSCRIPT_PARAMS = "defaults"
 
-PACKAGECONFIG ??= "tcp-wrappers"
-PACKAGECONFIG[tcp-wrappers] = "--with-libwrap,,tcp-wrappers"
-
 CFLAGS += "-D_GNU_SOURCE -std=gnu17"
 
 CONFFILES:${PN} = "${sysconfdir}/xinetd.conf"

