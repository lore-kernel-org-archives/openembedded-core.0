Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469EFCA0EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 22:19:27 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.87877.1755037161608847046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 15:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YP6x7gXx;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76b77a97a04so5529375b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 15:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755037160; x=1755641960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3N3Ig3PIoZRY5Q74NmoJZzzYZ4sDNbJVaaTd6R2ogfo=;
        b=YP6x7gXxIuqbMHrEHozVJAd9KnIlfpUjDdLxgWJGuqfgCDymh16mJBy5qaVjs/OpWW
         uYnXSjsBt5rjX5iwZbq7ndWbAa3QL1ktFkKjJCjhEVIX0xsfxFjfYbjW+VwXWtiER+bw
         Bt1zKwU7LD1LjmLinr9tU0COQnRUoOrNhRiyLT5ZSA4nHw8wbM7rMOrN+0MYyARyTBht
         HbO+P2kMPxJIIlfwgn4o9JsNVhgQsB8C7ok2ymX2vESDhmD16kBv7EWuDjFcCLNL3EE+
         B0hOpgPSkFC37gQwgI47CdJOLEbu62UkVapv4/vxcb+2LV+4OURUIqAkr6nyDTz7r6oI
         1jWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755037160; x=1755641960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3N3Ig3PIoZRY5Q74NmoJZzzYZ4sDNbJVaaTd6R2ogfo=;
        b=gsO13XgZnZJBnpiRnXIKsLKm9BMXeErf7P0z9bpSVtPHm/peTPa8lEZ05CsFmjujUD
         QjRyRhjLhlfhxHZS7QAWH2ZZgL8ziqrRaVtnfryHgNFPi2ld10P5+r49Dsvc3eMuVeNd
         wYJhFMYGP7VSNl41X503p0pCy2fov+yRrtUlbdxi5C9OPxuz1etMMGeVv7S0T6T6Ud0d
         ymMYztSmPs1r38pN19/GKoi1+e0ES4S2ZjDDIewmRLndLBWnjMI7JVphiugsMAW1rS/R
         xoXTll1vc+8kzgKh0Ps56JwTfKykneRzghvmlRmH+zei/SaispdK668pLdahpK0Ef6j3
         fTIQ==
X-Gm-Message-State: AOJu0YxpJ+PlLNhefRRFtj/Lff3MJ5jZMAtG1EshrPryGeMkY6u6RV5q
	x9KBgskTiC9+0VxVP+/cV/BOmDiVa5B0Kdo0OeFwEalpur/8vxJGgTSHuNdmhsgDOks=
X-Gm-Gg: ASbGncsV8BlR7IQsIHoH8f4iT7thzCxy0IgK3Ut9/0zxMkMCSn2e3gp7SqNdPqsyYjB
	KckSi7SEpBBE3oUPDU2iYpP/IaX+ntqh10IyjhIAoRFN8HRJHx2GsIPT6AmkyF/gS8w7I9/ONAj
	vThVa7+TIYTEKDzuvVEjTBYZ5gRA1TQ2ICnnKWMOzM/+VxZE6s24zB7DW0SVfdaSFw0BFIOTuhr
	u2FHV/3erTsXgBAuTjA2/rwI32Fj4ltaGRzTELLxjpVd2GCxvQ8JrCRm5lZn+MEoUGu8Sf8ZkcA
	aahDERJQ/21giif0VvZvTJYLUrYuPRCJ6x7RqSoO7pfWF7SyEsEgCOhCF5MKGRja8/BJ4iAi16S
	UtXUCfxGivp22WLkqUKq5
X-Google-Smtp-Source: AGHT+IGlzt73QcL3f5X84LuE1i19Fwmey7/DIsupA8cRapwywKPzFjRkz5hJ6Pb8asC+FMkwKgmqWg==
X-Received: by 2002:a17:903:2301:b0:240:5c75:4d47 with SMTP id d9443c01a7336-2430cf53dc8mr14251755ad.0.1755037160119;
        Tue, 12 Aug 2025 15:19:20 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef6cb7sm306440305ad.26.2025.08.12.15.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 15:19:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4] libtirpc: Fix version scripts to work with lld linker
Date: Tue, 12 Aug 2025 15:19:17 -0700
Message-ID: <20250812221917.3926403-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 22:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221780

Since bfd linker does not enable string checking for versioned symbols, build is generating
undefined versioned symbols, which LLD does not allow by default. Actually these symbols
should not be generated at all when given features are not enabled

Fixes link errors with lld

aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol '_svcauth_gss' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'authgss_create' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'authgss_create_default' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'authgss_free_private_data' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'authgss_get_private_data' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'authgss_service' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'cbc_crypt' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'ecb_crypt' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'endrpcent' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'getrpcent' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'getrpcbynumber' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'getrpcbyname' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'gss_log_debug' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'gss_log_hexdump' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'gss_log_status' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'rpc_gss_get_error' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'rpc_gss_get_mech_info' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'rpc_gss_get_mechanisms' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'rpc_gss_get_principal_name' failed: symbol not defined
aarch64-yoesdk-linux-ld.lld: error: version script assignment of 'TIRPC_0.3.0' to symbol 'rpc_gss_get_versions' failed: symbol not defined

Add packageconfig for rpcdb

Enable it by default on musl, these functions are needed by
packages e.g. quote, nfs-utils, snort3 on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add a fix to tidy up linker map
v3: Add packageconfig for rpcdb and enable it by default
v4: Enable rpcdb packageconfig only on musl

 ...d-conditional-version-script-support.patch | 810 ++++++++++++++++++
 .../libtirpc/libtirpc_1.3.6.bb                |   4 +
 2 files changed, 814 insertions(+)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-script-support.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-script-support.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-script-support.patch
new file mode 100644
index 00000000000..2764f652846
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-script-support.patch
@@ -0,0 +1,810 @@
+From 8ae9a335d56fc4aba8454159b326d809efca597f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 11 Aug 2025 21:13:59 -0700
+Subject: [PATCH] Add conditional version script support
+
+This patch adds conditional symbol versioning to libtirpc, allowing
+GSS-API, DES crypto, and RPC database symbols to be conditionally
+included in the version script based on build configuration.
+
+LLD is strict about undefined symbols referenced in a version script.
+Some libtirpc symbols (rpcsec_gss, old DES helpers, rpc database
+helpers) are optional and may not be built depending on configure
+options or missing deps. GNU ld tolerated this; LLD errors out.
+
+This change keeps the canonical symbol map in src/libtirpc.map, but
+adds a make-time rule to generate a filtered copy
+where names from disabled features are deleted. The lib is then linked
+against the generated linker map file.
+
+Fixes linking errors when these features are not available.
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-nfs/20250812180809.2182301-1-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac                          | 50 +++++++++++++++++++++++++++
+ src/Makefile.am                       | 21 +++++++++--
+ src/{libtirpc.map => libtirpc.map.in} | 48 +++++--------------------
+ 3 files changed, 77 insertions(+), 42 deletions(-)
+ rename src/{libtirpc.map => libtirpc.map.in} (84%)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -77,6 +77,19 @@ if test "x$enable_ipv6" != xno; then
+ 	AC_DEFINE(INET6, 1, [Define to 1 if IPv6 is available])
+ fi
+ 
++# RPC database support
++AC_ARG_ENABLE(rpcdb,
++    [AS_HELP_STRING([--enable-rpcdb], [Enable RPC Database support @<:@default=no@:>@])],
++    [], [enable_rpcdb=no])
++AM_CONDITIONAL(RPCDB, test "x$enable_rpcdb" = xyes)
++if test "x$enable_rpcdb" != "xno"; then
++    AC_CHECK_FUNCS([getrpcent getrpcbyname getrpcbynumber], [have_rpcdb=yes])
++
++    if test "x$have_rpcdb" = "xyes"; then
++        AC_DEFINE([RPCDB], [1], [Define if RPC database support is available])
++    fi
++fi
++
+ AC_ARG_ENABLE(symvers,
+ 	[AS_HELP_STRING([--disable-symvers],[Disable symbol versioning @<:@default=no@:>@])],
+       [],[enable_symvers=maybe])
+@@ -97,6 +110,33 @@ fi
+ 
+ AM_CONDITIONAL(SYMVERS, test "x$enable_symvers" = xyes)
+ 
++# Generate symbol lists for version script
++if test "x$enable_gssapi" = "xyes"; then
++    GSS_SYMBOLS="_svcauth_gss; authgss_create; authgss_create_default; authgss_free_private_data; authgss_get_private_data; authgss_service; gss_log_debug; gss_log_hexdump; gss_log_status; rpc_gss_get_error; rpc_gss_get_mech_info; rpc_gss_get_mechanisms; rpc_gss_get_principal_name; rpc_gss_get_versions; rpc_gss_qop_to_num; rpc_gss_seccreate; rpc_gss_set_callback; rpc_gss_set_defaults; rpc_gss_set_svc_name; rpc_gss_svc_max_data_length;"
++
++    GSS_SYMBOLS_031="svcauth_gss_get_principal; svcauth_gss_set_svc_name;"
++else
++    GSS_SYMBOLS=""
++    GSS_SYMBOLS_031=""
++fi
++
++if test "x$enable_authdes" = "xyes"; then
++    DES_SYMBOLS="cbc_crypt; ecb_crypt; xdr_authdes_cred; xdr_authdes_verf; xdr_rpc_gss_cred; xdr_rpc_gss_data; xdr_rpc_gss_init_args; xdr_rpc_gss_init_res;"
++else
++    DES_SYMBOLS=""
++fi
++
++if test "x$enable_rpcdb" = "xyes"; then
++    RPCDB_SYMBOLS="endrpcent; getrpcent; getrpcbynumber; getrpcbyname; setrpcent;"
++else
++    RPCDB_SYMBOLS=""
++fi
++
++AC_SUBST([GSS_SYMBOLS])
++AC_SUBST([GSS_SYMBOLS_031])
++AC_SUBST([DES_SYMBOLS])
++AC_SUBST([RPCDB_SYMBOLS])
++
+ AC_CANONICAL_BUILD
+ # Check for which host we are on and setup a few things
+ # specifically based on the host
+@@ -167,7 +207,16 @@ AC_CHECK_FUNCS([getpeereid getrpcbyname
+ AC_CHECK_TYPES(struct rpcent,,, [
+       #include <netdb.h>])
+ AC_CONFIG_FILES([Makefile src/Makefile man/Makefile doc/Makefile])
++AC_CONFIG_FILES([src/libtirpc.map])
+ AC_CONFIG_FILES([libtirpc.pc])
+ AC_OUTPUT
+ 
++# Configuration summary
++AC_MSG_NOTICE([
++libtirpc configuration summary:
++  GSS-API support: $enable_gssapi
++  DES crypto support: $enable_authdes
++  RPC database support: $enable_rpcdb
++  Symbol versioning: $enable_symvers
++])
+ 
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -6,6 +6,9 @@
+ ## anything like that.
+ 
+ noinst_HEADERS = rpc_com.h debug.h
++EXTRA_DIST = libtirpc.map.in
++# Generated files
++BUILT_SOURCES = libtirpc.map
+ 
+ AM_CPPFLAGS = -I$(top_srcdir)/tirpc -include config.h -DPORTMAP -DINET6 \
+ 		-D_GNU_SOURCE -Wall -pipe
+@@ -15,10 +18,19 @@ lib_LTLIBRARIES = libtirpc.la
+ libtirpc_la_LDFLAGS = @LDFLAG_NOUNDEFINED@ -no-undefined @PTHREAD_LIBS@
+ libtirpc_la_LDFLAGS += -version-info @LT_VERSION_INFO@
+ 
++# Generate version script from template
++libtirpc.map: $(srcdir)/libtirpc.map.in
++	$(AM_V_GEN)$(SED) \
++		-e 's|@GSS_SYMBOLS@|$(GSS_SYMBOLS)|g' \
++		-e 's|@GSS_SYMBOLS_031@|$(GSS_SYMBOLS_031)|g' \
++		-e 's|@DES_SYMBOLS@|$(DES_SYMBOLS)|g' \
++		-e 's|@RPCDB_SYMBOLS@|$(RPCDB_SYMBOLS)|g' \
++		< $(srcdir)/libtirpc.map.in > $@ || rm -f $@
++
+ libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c \
+         binddynport.c bindresvport.c \
+         clnt_bcast.c clnt_dg.c clnt_generic.c clnt_perror.c clnt_raw.c clnt_simple.c \
+-        clnt_vc.c rpc_dtablesize.c getnetconfig.c getnetpath.c getrpcent.c \
++        clnt_vc.c rpc_dtablesize.c getnetconfig.c getnetpath.c \
+         getrpcport.c mt_misc.c pmap_clnt.c pmap_getmaps.c pmap_getport.c \
+         pmap_prot.c pmap_prot2.c pmap_rmt.c rpc_prot.c rpc_commondata.c \
+         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
+@@ -34,19 +46,23 @@ endif
+ libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c xdr_sizeof.c
+ 
+ if SYMVERS
+-    libtirpc_la_LDFLAGS += -Wl,--version-script=$(srcdir)/libtirpc.map
++    libtirpc_la_LDFLAGS += -Wl,--version-script=$(builddir)/libtirpc.map
+ endif
+ 
+ ## Secure-RPC
+ if GSS
+-    libtirpc_la_SOURCES += auth_gss.c authgss_prot.c svc_auth_gss.c \
+-			   rpc_gss_utils.c
+-    libtirpc_la_LIBADD = $(GSSAPI_LIBS)
+-    libtirpc_la_CFLAGS = -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
++libtirpc_la_SOURCES += auth_gss.c authgss_prot.c svc_auth_gss.c rpc_gss_utils.c
++libtirpc_la_LIBADD = $(GSSAPI_LIBS)
++libtirpc_la_CFLAGS = -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
++endif
++
++# Conditionally add RPC database sources
++if RPCDB
++libtirpc_la_SOURCES += getrpcent.c
+ endif
+ 
+ libtirpc_la_SOURCES += key_call.c key_prot_xdr.c getpublickey.c
+ libtirpc_la_SOURCES += netname.c netnamer.c rpcdname.c rtime.c
+ 
+-CLEANFILES	       = cscope.* *~
++CLEANFILES	       = cscope.* libtirpc.map *~
+ DISTCLEANFILES	       = Makefile.in
+--- a/src/libtirpc.map
++++ /dev/null
+@@ -1,335 +0,0 @@
+-TIRPC_0.3.0 {
+-  global:
+-    # __*
+-    __rpc_createerr;
+-    __rpc_dtbsize;
+-    __rpc_endconf;
+-    __rpc_fd2sockinfo;
+-    __rpc_fixup_addr;
+-    __rpc_get_a_size;
+-    __rpc_get_local_uid;
+-    __rpc_get_t_size;
+-    __rpc_getconf;
+-    __rpc_getconfip;
+-    __rpc_nconf2fd;
+-    __rpc_nconf2fd_flags;
+-    __rpc_nconf2sockinfo;
+-    __rpc_rawcombuf;
+-    __rpc_seman2socktype;
+-    __rpc_setconf;
+-    __rpc_sockinfo2netid;
+-    __rpc_sockisbound;
+-    __rpc_socktype2seman;
+-    __rpc_taddr2uaddr_af;
+-    __rpc_uaddr2taddr_af;
+-    __rpcgettp;
+-
+-    # _*
+-    _authenticate;
+-    _get_next_token;
+-    _gss_authenticate;
+-    _null_auth;
+-    _rpc_dtablesize;
+-    _seterr_reply;
+-    _svcauth_none;
+-    _svcauth_short;
+-    _svcauth_unix;
+-    _svcauth_gss;
+-
+-    # a*
+-    authdes_create;
+-    authdes_seccreate;
+-    authgss_create;
+-    authgss_create_default;
+-    authgss_free_private_data;
+-    authgss_get_private_data;
+-    authgss_service;
+-    authnone_create;
+-    authunix_create;
+-    authunix_create_default;
+-
+-    # b*
+-    bindresvport;
+-    bindresvport_sa;
+-
+-    # c*
+-    callrpc;
+-    cbc_crypt;
+-    clnt_broadcast;
+-    clnt_create;
+-    clnt_create_timed;
+-    clnt_create_vers;
+-    clnt_create_vers_timed;
+-    clnt_dg_create;
+-    clnt_pcreateerror;
+-    clnt_perrno;
+-    clnt_perror;
+-    clnt_raw_create;
+-    clnt_spcreateerror;
+-    clnt_sperrno;
+-    clnt_sperror;
+-    clnt_tli_create;
+-    clnt_tp_create;
+-    clnt_tp_create_timed;
+-    clnt_vc_create;
+-    clntraw_create;
+-    clnttcp_create;
+-    clntudp_bufcreate;
+-    clntudp_create;
+-    clntunix_create;
+-
+-    # e*
+-    ecb_crypt;
+-    endnetconfig;
+-    endnetpath;
+-    endrpcent;
+-
+-    # f*
+-    freenetconfigent;
+-
+-    # g*
+-    get_myaddress;
+-    getnetconfig;
+-    getnetconfigent;
+-    getnetpath;
+-    getrpcent;
+-    getrpcbynumber;
+-    getrpcbyname;
+-    getrpcport;
+-    gss_log_debug;
+-    gss_log_hexdump;
+-    gss_log_status;
+-
+-    # n*
+-    nc_perror;
+-    nc_sperror;
+-
+-    # p*
+-    pmap_getmaps;
+-    pmap_getport;
+-    pmap_rmtcall;
+-    pmap_set;
+-    pmap_unset;
+-
+-    # r*
+-    registerrpc;
+-    rpc_broadcast;
+-    rpc_broadcast_exp;
+-    rpc_call;
+-    rpc_control;
+-    rpc_createerr;
+-    rpc_gss_get_error;
+-    rpc_gss_get_mech_info;
+-    rpc_gss_get_mechanisms;
+-    rpc_gss_get_principal_name;
+-    rpc_gss_get_versions;
+-    rpc_gss_getcred;
+-    rpc_gss_is_installed;
+-    rpc_gss_max_data_length;
+-    rpc_gss_mech_to_oid;
+-    rpc_gss_qop_to_num;
+-    rpc_gss_seccreate;
+-    rpc_gss_set_callback;
+-    rpc_gss_set_defaults;
+-    rpc_gss_set_svc_name;
+-    rpc_gss_svc_max_data_length;
+-    rpc_nullproc;
+-    rpc_reg;
+-    rpcb_getaddr;
+-    rpcb_getmaps;
+-    rpcb_gettime;
+-    rpcb_rmtcall;
+-    rpcb_set;
+-    rpcb_taddr2uaddr;
+-    rpcb_uaddr2taddr;
+-    rpcb_unset;
+-
+-    # s*
+-    setnetconfig;
+-    setnetpath;
+-    setrpcent;
+-    svc_auth_reg;
+-    svc_create;
+-    svc_dg_create;
+-    svc_dg_enablecache;
+-    svc_exit;
+-    svc_fd_create;
+-    svc_fdset;
+-    svc_getreq;
+-    svc_getreq_common;
+-    svc_getreq_poll;
+-    svc_getreqset;
+-    svc_maxfd;
+-    svc_raw_create;
+-    svc_reg;
+-    svc_register;
+-    svc_run;
+-    svc_sendreply;
+-    svc_tli_create;
+-    svc_tp_create;
+-    svc_unreg;
+-    svc_unregister;
+-    svc_vc_create;
+-    svcerr_auth;
+-    svcerr_decode;
+-    svcerr_noproc;
+-    svcerr_noprog;
+-    svcerr_progvers;
+-    svcerr_systemerr;
+-    svcerr_weakauth;
+-    svcfd_create;
+-    svcraw_create;
+-    svctcp_create;
+-    svcudp_bufcreate;
+-    svcudp_create;
+-    svcunix_create;
+-    svcunixfd_create;
+-
+-    # t*
+-    taddr2uaddr;
+-
+-    # u*
+-    uaddr2taddr;
+-
+-    # x*
+-    xdr_accepted_reply;
+-    xdr_array;
+-    xdr_authdes_cred;
+-    xdr_authdes_verf;
+-    xdr_authunix_parms;
+-    xdr_bool;
+-    xdr_bytes;
+-    xdr_callhdr; xdr_callmsg;
+-    xdr_char;
+-    xdr_des_block;
+-    xdr_double;
+-    xdr_enum;
+-    xdr_float;
+-    xdr_free;
+-    xdr_hyper;
+-    xdr_int16_t;
+-    xdr_int32_t;
+-    xdr_int64_t;
+-    xdr_int8_t;
+-    xdr_int;
+-    xdr_long;
+-    xdr_longlong_t;
+-    xdr_netbuf;
+-    xdr_netobj;
+-    xdr_opaque;
+-    xdr_opaque_auth;
+-    xdr_pmap;
+-    xdr_pmaplist;
+-    xdr_pmaplist_ptr;
+-    xdr_pointer;
+-    xdr_quad_t;
+-    xdr_reference;
+-    xdr_rejected_reply;
+-    xdr_replymsg;
+-    xdr_rmtcall_args;
+-    xdr_rmtcallres;
+-    xdr_rpc_gss_cred;
+-    xdr_rpc_gss_data;
+-    xdr_rpc_gss_init_args;
+-    xdr_rpc_gss_init_res;
+-    xdr_rpcb;
+-    xdr_rpcb_entry;
+-    xdr_rpcb_entry_list_ptr;
+-    xdr_rpcb_rmtcallargs;
+-    xdr_rpcb_rmtcallres;
+-    xdr_rpcb_stat;
+-    xdr_rpcb_stat_byvers;
+-    xdr_rpcblist;
+-    xdr_rpcblist_ptr;
+-    xdr_rpcbs_addrlist;
+-    xdr_rpcbs_addrlist_ptr;
+-    xdr_rpcbs_proc;
+-    xdr_rpcbs_rmtcalllist;
+-    xdr_rpcbs_rmtcalllist_ptr;
+-    xdr_short;
+-    xdr_string;
+-    xdr_u_char;
+-    xdr_u_hyper;
+-    xdr_u_int16_t;
+-    xdr_u_int32_t;
+-    xdr_u_int64_t;
+-    xdr_u_int8_t;
+-    xdr_u_int;
+-    xdr_u_long;
+-    xdr_u_longlong_t;
+-    xdr_u_quad_t;
+-    xdr_u_short;
+-    xdr_uint16_t;
+-    xdr_uint32_t;
+-    xdr_uint64_t;
+-    xdr_uint8_t;
+-    xdr_union;
+-    xdr_vector;
+-    xdr_void;
+-    xdr_wrapstring;
+-    xdrmem_create;
+-    xdrrec_create;
+-    xdrrec_endofrecord;
+-    xdrrec_eof;
+-    xdrrec_skiprecord;
+-    xdrstdio_create;
+-    xprt_register;
+-    xprt_unregister;
+-
+-  local:
+-    *;
+-};
+-
+-TIRPC_0.3.1 {
+-    svcauth_gss_get_principal;
+-    svcauth_gss_set_svc_name;
+-} TIRPC_0.3.0;
+-
+-TIRPC_0.3.2 {
+-    getnetname;
+-    getpublicandprivatekey;
+-    getpublickey;
+-    host2netname;
+-    key_call_destroy;
+-    key_decryptsession;
+-    key_decryptsession_pk;
+-    key_encryptsession;
+-    key_encryptsession_pk;
+-    key_gendes;
+-    key_get_conv;
+-    key_setsecret;
+-    key_secretkey_is_set;
+-    key_setnet;
+-    netname2host;
+-    netname2user;
+-    rtime;
+-    user2netname;
+-    xdr_cryptkeyarg;
+-    xdr_cryptkeyarg2;
+-    xdr_cryptkeyres;
+-    xdr_getcredres;
+-    xdr_key_netstarg;
+-    xdr_key_netstres;
+-    xdr_keybuf;
+-    xdr_keystatus;
+-    xdr_netnamestr;
+-    xdr_unixcred;
+-} TIRPC_0.3.1;
+-
+-TIRPC_0.3.3 {
+-    __getpublickey_LOCAL;
+-    __key_decryptsession_pk_LOCAL;
+-    __key_encryptsession_pk_LOCAL;
+-    __key_gendes_LOCAL;
+-    xdr_sizeof;
+-    authdes_pk_create;
+-    svc_pollfd;
+-    svc_max_pollfd;
+-} TIRPC_0.3.2;
+-
+-TIRPC_PRIVATE {
+-  global:
+-    __libc_clntudp_bufcreate;
+-  # private, but used by rpcbind:
+-    __svc_clean_idle; svc_auth_none; libtirpc_set_debug;
+-};
+--- /dev/null
++++ b/src/libtirpc.map.in
+@@ -0,0 +1,303 @@
++TIRPC_0.3.0 {
++  global:
++    # __*
++    __rpc_createerr;
++    __rpc_dtbsize;
++    __rpc_endconf;
++    __rpc_fd2sockinfo;
++    __rpc_fixup_addr;
++    __rpc_get_a_size;
++    __rpc_get_local_uid;
++    __rpc_get_t_size;
++    __rpc_getconf;
++    __rpc_getconfip;
++    __rpc_nconf2fd;
++    __rpc_nconf2fd_flags;
++    __rpc_nconf2sockinfo;
++    __rpc_rawcombuf;
++    __rpc_seman2socktype;
++    __rpc_setconf;
++    __rpc_sockinfo2netid;
++    __rpc_sockisbound;
++    __rpc_socktype2seman;
++    __rpc_taddr2uaddr_af;
++    __rpc_uaddr2taddr_af;
++    __rpcgettp;
++
++    # _*
++    _authenticate;
++    _get_next_token;
++    _gss_authenticate;
++    _null_auth;
++    _rpc_dtablesize;
++    _seterr_reply;
++    _svcauth_none;
++    _svcauth_short;
++    _svcauth_unix;
++
++    # a*
++    authdes_create;
++    authdes_seccreate;
++    authnone_create;
++    authunix_create;
++    authunix_create_default;
++
++    # b*
++    bindresvport;
++    bindresvport_sa;
++
++    # c*
++    callrpc;
++    clnt_broadcast;
++    clnt_create;
++    clnt_create_timed;
++    clnt_create_vers;
++    clnt_create_vers_timed;
++    clnt_dg_create;
++    clnt_pcreateerror;
++    clnt_perrno;
++    clnt_perror;
++    clnt_raw_create;
++    clnt_spcreateerror;
++    clnt_sperrno;
++    clnt_sperror;
++    clnt_tli_create;
++    clnt_tp_create;
++    clnt_tp_create_timed;
++    clnt_vc_create;
++    clntraw_create;
++    clnttcp_create;
++    clntudp_bufcreate;
++    clntudp_create;
++    clntunix_create;
++
++    # e*
++    endnetconfig;
++    endnetpath;
++
++    # f*
++    freenetconfigent;
++
++    # g*
++    get_myaddress;
++    getnetconfig;
++    getnetconfigent;
++    getnetpath;
++    getrpcport;
++
++    # n*
++    nc_perror;
++    nc_sperror;
++
++    # p*
++    pmap_getmaps;
++    pmap_getport;
++    pmap_rmtcall;
++    pmap_set;
++    pmap_unset;
++
++    # r*
++    registerrpc;
++    rpc_broadcast;
++    rpc_broadcast_exp;
++    rpc_call;
++    rpc_control;
++    rpc_createerr;
++    rpc_nullproc;
++    rpc_reg;
++    rpcb_getaddr;
++    rpcb_getmaps;
++    rpcb_gettime;
++    rpcb_rmtcall;
++    rpcb_set;
++    rpcb_taddr2uaddr;
++    rpcb_uaddr2taddr;
++    rpcb_unset;
++
++    # s*
++    setnetconfig;
++    setnetpath;
++    svc_auth_reg;
++    svc_create;
++    svc_dg_create;
++    svc_dg_enablecache;
++    svc_exit;
++    svc_fd_create;
++    svc_fdset;
++    svc_getreq;
++    svc_getreq_common;
++    svc_getreq_poll;
++    svc_getreqset;
++    svc_maxfd;
++    svc_raw_create;
++    svc_reg;
++    svc_register;
++    svc_run;
++    svc_sendreply;
++    svc_tli_create;
++    svc_tp_create;
++    svc_unreg;
++    svc_unregister;
++    svc_vc_create;
++    svcerr_auth;
++    svcerr_decode;
++    svcerr_noproc;
++    svcerr_noprog;
++    svcerr_progvers;
++    svcerr_systemerr;
++    svcerr_weakauth;
++    svcfd_create;
++    svcraw_create;
++    svctcp_create;
++    svcudp_bufcreate;
++    svcudp_create;
++    svcunix_create;
++    svcunixfd_create;
++
++    # t*
++    taddr2uaddr;
++
++    # u*
++    uaddr2taddr;
++
++    # x*
++    xdr_accepted_reply;
++    xdr_array;
++    xdr_authunix_parms;
++    xdr_bool;
++    xdr_bytes;
++    xdr_callhdr; xdr_callmsg;
++    xdr_char;
++    xdr_des_block;
++    xdr_double;
++    xdr_enum;
++    xdr_float;
++    xdr_free;
++    xdr_hyper;
++    xdr_int16_t;
++    xdr_int32_t;
++    xdr_int64_t;
++    xdr_int8_t;
++    xdr_int;
++    xdr_long;
++    xdr_longlong_t;
++    xdr_netbuf;
++    xdr_netobj;
++    xdr_opaque;
++    xdr_opaque_auth;
++    xdr_pmap;
++    xdr_pmaplist;
++    xdr_pmaplist_ptr;
++    xdr_pointer;
++    xdr_quad_t;
++    xdr_reference;
++    xdr_rejected_reply;
++    xdr_replymsg;
++    xdr_rmtcall_args;
++    xdr_rmtcallres;
++    xdr_rpcb;
++    xdr_rpcb_entry;
++    xdr_rpcb_entry_list_ptr;
++    xdr_rpcb_rmtcallargs;
++    xdr_rpcb_rmtcallres;
++    xdr_rpcb_stat;
++    xdr_rpcb_stat_byvers;
++    xdr_rpcblist;
++    xdr_rpcblist_ptr;
++    xdr_rpcbs_addrlist;
++    xdr_rpcbs_addrlist_ptr;
++    xdr_rpcbs_proc;
++    xdr_rpcbs_rmtcalllist;
++    xdr_rpcbs_rmtcalllist_ptr;
++    xdr_short;
++    xdr_string;
++    xdr_u_char;
++    xdr_u_hyper;
++    xdr_u_int16_t;
++    xdr_u_int32_t;
++    xdr_u_int64_t;
++    xdr_u_int8_t;
++    xdr_u_int;
++    xdr_u_long;
++    xdr_u_longlong_t;
++    xdr_u_quad_t;
++    xdr_u_short;
++    xdr_uint16_t;
++    xdr_uint32_t;
++    xdr_uint64_t;
++    xdr_uint8_t;
++    xdr_union;
++    xdr_vector;
++    xdr_void;
++    xdr_wrapstring;
++    xdrmem_create;
++    xdrrec_create;
++    xdrrec_endofrecord;
++    xdrrec_eof;
++    xdrrec_skiprecord;
++    xdrstdio_create;
++    xprt_register;
++    xprt_unregister;
++    # GSS-API symbols (conditionally included)
++@GSS_SYMBOLS@
++    # DES crypto symbols (conditionally included)
++@DES_SYMBOLS@
++    # RPC database symbols (conditionally included)
++@RPCDB_SYMBOLS@
++
++  local:
++    *;
++};
++
++TIRPC_0.3.1 {
++# GSS-API symbols (conditionally included)
++@GSS_SYMBOLS_031@
++} TIRPC_0.3.0;
++
++TIRPC_0.3.2 {
++    getnetname;
++    getpublicandprivatekey;
++    getpublickey;
++    host2netname;
++    key_decryptsession;
++    key_decryptsession_pk;
++    key_encryptsession;
++    key_encryptsession_pk;
++    key_gendes;
++    key_get_conv;
++    key_setsecret;
++    key_secretkey_is_set;
++    key_setnet;
++    netname2host;
++    netname2user;
++    rtime;
++    user2netname;
++    xdr_cryptkeyarg;
++    xdr_cryptkeyarg2;
++    xdr_cryptkeyres;
++    xdr_getcredres;
++    xdr_key_netstarg;
++    xdr_key_netstres;
++    xdr_keybuf;
++    xdr_keystatus;
++    xdr_netnamestr;
++    xdr_unixcred;
++} TIRPC_0.3.1;
++
++TIRPC_0.3.3 {
++    __getpublickey_LOCAL;
++    __key_decryptsession_pk_LOCAL;
++    __key_encryptsession_pk_LOCAL;
++    __key_gendes_LOCAL;
++    xdr_sizeof;
++    authdes_pk_create;
++    svc_pollfd;
++    svc_max_pollfd;
++} TIRPC_0.3.2;
++
++TIRPC_PRIVATE {
++  global:
++    __libc_clntudp_bufcreate;
++  # private, but used by rpcbind:
++    __svc_clean_idle; svc_auth_none; libtirpc_set_debug;
++};
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
index 6ea9a725dbf..31521bbccac 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
@@ -12,6 +12,7 @@ PROVIDES = "virtual/librpc"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://0001-Update-declarations-to-allow-compile-with-gcc-15.patch \
            file://0002-update-signal-and-key_call-declarations-to-allow-com.patch \
+           file://0001-Add-conditional-version-script-support.patch \
           "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
@@ -24,8 +25,11 @@ inherit autotools pkgconfig
 PACKAGECONFIG ??= "\
 	${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
+PACKAGECONFIG:append:libc-musl = " rpcdb"
+
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
 PACKAGECONFIG[gssapi] = "--enable-gssapi,--disable-gssapi,krb5"
+PACKAGECONFIG[rpcdb] = "--enable-rpcdb,--disable-rpcdb,"
 
 do_install:append() {
 	test -e ${D}${sysconfdir}/netconfig && chown root:root ${D}${sysconfdir}/netconfig

