Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E29BCAC59F
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:47 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.30936.1757937286303231503
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=epYLHxmr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RxtMrWv2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101994d3a39b0-4e2b638d-a789-4bab-9369-c13d52b223e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=quNn8awCZcax4TR4t9L5vDKAdFbW21OFmSijY+Mya94=;
	b=epYLHxmrSaY2ugpTTFd/R2/wtcgAgpEqX99EcCQblWlCRjoPkr4PbKJClE+WcIB5
	ahORE1fVaJo3NxBLlgM6VFlQn52oE6pz+ngmVRuixfIxYCbLYcsoBCdJzY4HRANv5zY
	8TgJaK+UnHG1ClxugmTEcFasLFbHuzWaRKJX9eaY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=quNn8awCZcax4TR4t9L5vDKAdFbW21OFmSijY+Mya94=;
	b=RxtMrWv2J/oPQosdOhbwE1yj2DYasbdMbCsONNu2IQt1u5qyAMjhGIYvEo5Rm4+3
	HRtZYlPNiPZ2fN0XyenKwr+013MuunQLDZCa9L3Rd0vnZoxt3NHxzqC5qlCr5/GJlax
	ipA+u2iVbCerfw6cA5T0bZkB2PxksxZV4wkIpeoE=
Content-Type: multipart/mixed; boundary="===============2615800320967221377=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtirpc: upgrading to 1.3.7 SUCCEEDED
Message-ID: <010101994d3a39b0-4e2b638d-a789-4bab-9369-c13d52b223e3-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223443

--===============2615800320967221377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtirpc* to *1.3.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtirpc-upgrade-1.3.6-1.3.7.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From bed458bb8ce8322a283cec5e941e4344b878c902 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 08:55:08 +0000
Subject: [PATCH] libtirpc: upgrade 1.3.6 -> 1.3.7

---
 ...d-conditional-version-script-support.patch | 505 +-----------------
 ...rations-to-allow-compile-with-gcc-15.patch |  64 ---
 ...d-key_call-declarations-to-allow-com.patch |  60 ---
 .../{libtirpc_1.3.6.bb => libtirpc_1.3.7.bb}  |   6 +-
 4 files changed, 18 insertions(+), 617 deletions(-)
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch
 rename meta/recipes-extended/libtirpc/{libtirpc_1.3.6.bb => libtirpc_1.3.7.bb} (82%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-script-support.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-script-support.patch
index 2764f65284..b3183e8d95 100644
--- a/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-script-support.patch
+++ b/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-script-support.patch
@@ -1,4 +1,4 @@
-From 8ae9a335d56fc4aba8454159b326d809efca597f Mon Sep 17 00:00:00 2001
+From 2c7d0b6566b86f6cb8f3935fd2324d359572df66 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 11 Aug 2025 21:13:59 -0700
 Subject: [PATCH] Add conditional version script support
@@ -22,151 +22,16 @@ Fixes linking errors when these features are not available.
 Upstream-Status: Submitted [https://lore.kernel.org/linux-nfs/20250812180809.2182301-1-raj.khem@gmail.com/T/#u]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- configure.ac                          | 50 +++++++++++++++++++++++++++
- src/Makefile.am                       | 21 +++++++++--
- src/{libtirpc.map => libtirpc.map.in} | 48 +++++--------------------
- 3 files changed, 77 insertions(+), 42 deletions(-)
- rename src/{libtirpc.map => libtirpc.map.in} (84%)
+ src/libtirpc.map | 303 -----------------------------------------------
+ 1 file changed, 303 deletions(-)
+ delete mode 100644 src/libtirpc.map
 
---- a/configure.ac
-+++ b/configure.ac
-@@ -77,6 +77,19 @@ if test "x$enable_ipv6" != xno; then
- 	AC_DEFINE(INET6, 1, [Define to 1 if IPv6 is available])
- fi
- 
-+# RPC database support
-+AC_ARG_ENABLE(rpcdb,
-+    [AS_HELP_STRING([--enable-rpcdb], [Enable RPC Database support @<:@default=no@:>@])],
-+    [], [enable_rpcdb=no])
-+AM_CONDITIONAL(RPCDB, test "x$enable_rpcdb" = xyes)
-+if test "x$enable_rpcdb" != "xno"; then
-+    AC_CHECK_FUNCS([getrpcent getrpcbyname getrpcbynumber], [have_rpcdb=yes])
-+
-+    if test "x$have_rpcdb" = "xyes"; then
-+        AC_DEFINE([RPCDB], [1], [Define if RPC database support is available])
-+    fi
-+fi
-+
- AC_ARG_ENABLE(symvers,
- 	[AS_HELP_STRING([--disable-symvers],[Disable symbol versioning @<:@default=no@:>@])],
-       [],[enable_symvers=maybe])
-@@ -97,6 +110,33 @@ fi
- 
- AM_CONDITIONAL(SYMVERS, test "x$enable_symvers" = xyes)
- 
-+# Generate symbol lists for version script
-+if test "x$enable_gssapi" = "xyes"; then
-+    GSS_SYMBOLS="_svcauth_gss; authgss_create; authgss_create_default; authgss_free_private_data; authgss_get_private_data; authgss_service; gss_log_debug; gss_log_hexdump; gss_log_status; rpc_gss_get_error; rpc_gss_get_mech_info; rpc_gss_get_mechanisms; rpc_gss_get_principal_name; rpc_gss_get_versions; rpc_gss_qop_to_num; rpc_gss_seccreate; rpc_gss_set_callback; rpc_gss_set_defaults; rpc_gss_set_svc_name; rpc_gss_svc_max_data_length;"
-+
-+    GSS_SYMBOLS_031="svcauth_gss_get_principal; svcauth_gss_set_svc_name;"
-+else
-+    GSS_SYMBOLS=""
-+    GSS_SYMBOLS_031=""
-+fi
-+
-+if test "x$enable_authdes" = "xyes"; then
-+    DES_SYMBOLS="cbc_crypt; ecb_crypt; xdr_authdes_cred; xdr_authdes_verf; xdr_rpc_gss_cred; xdr_rpc_gss_data; xdr_rpc_gss_init_args; xdr_rpc_gss_init_res;"
-+else
-+    DES_SYMBOLS=""
-+fi
-+
-+if test "x$enable_rpcdb" = "xyes"; then
-+    RPCDB_SYMBOLS="endrpcent; getrpcent; getrpcbynumber; getrpcbyname; setrpcent;"
-+else
-+    RPCDB_SYMBOLS=""
-+fi
-+
-+AC_SUBST([GSS_SYMBOLS])
-+AC_SUBST([GSS_SYMBOLS_031])
-+AC_SUBST([DES_SYMBOLS])
-+AC_SUBST([RPCDB_SYMBOLS])
-+
- AC_CANONICAL_BUILD
- # Check for which host we are on and setup a few things
- # specifically based on the host
-@@ -167,7 +207,16 @@ AC_CHECK_FUNCS([getpeereid getrpcbyname
- AC_CHECK_TYPES(struct rpcent,,, [
-       #include <netdb.h>])
- AC_CONFIG_FILES([Makefile src/Makefile man/Makefile doc/Makefile])
-+AC_CONFIG_FILES([src/libtirpc.map])
- AC_CONFIG_FILES([libtirpc.pc])
- AC_OUTPUT
- 
-+# Configuration summary
-+AC_MSG_NOTICE([
-+libtirpc configuration summary:
-+  GSS-API support: $enable_gssapi
-+  DES crypto support: $enable_authdes
-+  RPC database support: $enable_rpcdb
-+  Symbol versioning: $enable_symvers
-+])
- 
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -6,6 +6,9 @@
- ## anything like that.
- 
- noinst_HEADERS = rpc_com.h debug.h
-+EXTRA_DIST = libtirpc.map.in
-+# Generated files
-+BUILT_SOURCES = libtirpc.map
- 
- AM_CPPFLAGS = -I$(top_srcdir)/tirpc -include config.h -DPORTMAP -DINET6 \
- 		-D_GNU_SOURCE -Wall -pipe
-@@ -15,10 +18,19 @@ lib_LTLIBRARIES = libtirpc.la
- libtirpc_la_LDFLAGS = @LDFLAG_NOUNDEFINED@ -no-undefined @PTHREAD_LIBS@
- libtirpc_la_LDFLAGS += -version-info @LT_VERSION_INFO@
- 
-+# Generate version script from template
-+libtirpc.map: $(srcdir)/libtirpc.map.in
-+	$(AM_V_GEN)$(SED) \
-+		-e 's|@GSS_SYMBOLS@|$(GSS_SYMBOLS)|g' \
-+		-e 's|@GSS_SYMBOLS_031@|$(GSS_SYMBOLS_031)|g' \
-+		-e 's|@DES_SYMBOLS@|$(DES_SYMBOLS)|g' \
-+		-e 's|@RPCDB_SYMBOLS@|$(RPCDB_SYMBOLS)|g' \
-+		< $(srcdir)/libtirpc.map.in > $@ || rm -f $@
-+
- libtirpc_la_SOURCES = auth_none.c auth_unix.c authunix_prot.c \
-         binddynport.c bindresvport.c \
-         clnt_bcast.c clnt_dg.c clnt_generic.c clnt_perror.c clnt_raw.c clnt_simple.c \
--        clnt_vc.c rpc_dtablesize.c getnetconfig.c getnetpath.c getrpcent.c \
-+        clnt_vc.c rpc_dtablesize.c getnetconfig.c getnetpath.c \
-         getrpcport.c mt_misc.c pmap_clnt.c pmap_getmaps.c pmap_getport.c \
-         pmap_prot.c pmap_prot2.c pmap_rmt.c rpc_prot.c rpc_commondata.c \
-         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
-@@ -34,19 +46,23 @@ endif
- libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c xdr_sizeof.c
- 
- if SYMVERS
--    libtirpc_la_LDFLAGS += -Wl,--version-script=$(srcdir)/libtirpc.map
-+    libtirpc_la_LDFLAGS += -Wl,--version-script=$(builddir)/libtirpc.map
- endif
- 
- ## Secure-RPC
- if GSS
--    libtirpc_la_SOURCES += auth_gss.c authgss_prot.c svc_auth_gss.c \
--			   rpc_gss_utils.c
--    libtirpc_la_LIBADD = $(GSSAPI_LIBS)
--    libtirpc_la_CFLAGS = -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
-+libtirpc_la_SOURCES += auth_gss.c authgss_prot.c svc_auth_gss.c rpc_gss_utils.c
-+libtirpc_la_LIBADD = $(GSSAPI_LIBS)
-+libtirpc_la_CFLAGS = -DHAVE_RPCSEC_GSS $(GSSAPI_CFLAGS)
-+endif
-+
-+# Conditionally add RPC database sources
-+if RPCDB
-+libtirpc_la_SOURCES += getrpcent.c
- endif
- 
- libtirpc_la_SOURCES += key_call.c key_prot_xdr.c getpublickey.c
- libtirpc_la_SOURCES += netname.c netnamer.c rpcdname.c rtime.c
- 
--CLEANFILES	       = cscope.* *~
-+CLEANFILES	       = cscope.* libtirpc.map *~
- DISTCLEANFILES	       = Makefile.in
+diff --git a/src/libtirpc.map b/src/libtirpc.map
+deleted file mode 100644
+index 479b4ff..0000000
 --- a/src/libtirpc.map
 +++ /dev/null
-@@ -1,335 +0,0 @@
+@@ -1,303 +0,0 @@
 -TIRPC_0.3.0 {
 -  global:
 -    # __*
@@ -203,16 +68,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -    _svcauth_none;
 -    _svcauth_short;
 -    _svcauth_unix;
--    _svcauth_gss;
 -
 -    # a*
 -    authdes_create;
 -    authdes_seccreate;
--    authgss_create;
--    authgss_create_default;
--    authgss_free_private_data;
--    authgss_get_private_data;
--    authgss_service;
 -    authnone_create;
 -    authunix_create;
 -    authunix_create_default;
@@ -223,7 +82,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -
 -    # c*
 -    callrpc;
--    cbc_crypt;
 -    clnt_broadcast;
 -    clnt_create;
 -    clnt_create_timed;
@@ -248,10 +106,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -    clntunix_create;
 -
 -    # e*
--    ecb_crypt;
 -    endnetconfig;
 -    endnetpath;
--    endrpcent;
 -
 -    # f*
 -    freenetconfigent;
@@ -261,13 +117,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -    getnetconfig;
 -    getnetconfigent;
 -    getnetpath;
--    getrpcent;
--    getrpcbynumber;
--    getrpcbyname;
 -    getrpcport;
--    gss_log_debug;
--    gss_log_hexdump;
--    gss_log_status;
 -
 -    # n*
 -    nc_perror;
@@ -287,21 +137,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -    rpc_call;
 -    rpc_control;
 -    rpc_createerr;
--    rpc_gss_get_error;
--    rpc_gss_get_mech_info;
--    rpc_gss_get_mechanisms;
--    rpc_gss_get_principal_name;
--    rpc_gss_get_versions;
--    rpc_gss_getcred;
--    rpc_gss_is_installed;
--    rpc_gss_max_data_length;
--    rpc_gss_mech_to_oid;
--    rpc_gss_qop_to_num;
--    rpc_gss_seccreate;
--    rpc_gss_set_callback;
--    rpc_gss_set_defaults;
--    rpc_gss_set_svc_name;
--    rpc_gss_svc_max_data_length;
 -    rpc_nullproc;
 -    rpc_reg;
 -    rpcb_getaddr;
@@ -316,7 +151,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -    # s*
 -    setnetconfig;
 -    setnetpath;
--    setrpcent;
 -    svc_auth_reg;
 -    svc_create;
 -    svc_dg_create;
@@ -363,8 +197,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -    # x*
 -    xdr_accepted_reply;
 -    xdr_array;
--    xdr_authdes_cred;
--    xdr_authdes_verf;
 -    xdr_authunix_parms;
 -    xdr_bool;
 -    xdr_bytes;
@@ -397,10 +229,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -    xdr_replymsg;
 -    xdr_rmtcall_args;
 -    xdr_rmtcallres;
--    xdr_rpc_gss_cred;
--    xdr_rpc_gss_data;
--    xdr_rpc_gss_init_args;
--    xdr_rpc_gss_init_res;
 -    xdr_rpcb;
 -    xdr_rpcb_entry;
 -    xdr_rpcb_entry_list_ptr;
@@ -444,14 +272,20 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -    xdrstdio_create;
 -    xprt_register;
 -    xprt_unregister;
+-    # GSS-API symbols (conditionally included)
+-_svcauth_gss; authgss_create; authgss_create_default; authgss_free_private_data; authgss_get_private_data; authgss_service; gss_log_debug; gss_log_hexdump; gss_log_status; rpc_gss_get_error; rpc_gss_get_mech_info; rpc_gss_get_mechanisms; rpc_gss_get_principal_name; rpc_gss_get_versions; rpc_gss_qop_to_num; rpc_gss_seccreate; rpc_gss_set_callback; rpc_gss_set_defaults; rpc_gss_set_svc_name; rpc_gss_svc_max_data_length;
+-    # DES crypto symbols (conditionally included)
+-
+-    # RPC database symbols (conditionally included)
+-
 -
 -  local:
 -    *;
 -};
 -
 -TIRPC_0.3.1 {
--    svcauth_gss_get_principal;
--    svcauth_gss_set_svc_name;
+-# GSS-API symbols (conditionally included)
+-svcauth_gss_get_principal; svcauth_gss_set_svc_name;
 -} TIRPC_0.3.0;
 -
 -TIRPC_0.3.2 {
@@ -459,7 +293,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -    getpublicandprivatekey;
 -    getpublickey;
 -    host2netname;
--    key_call_destroy;
 -    key_decryptsession;
 -    key_decryptsession_pk;
 -    key_encryptsession;
@@ -502,309 +335,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -  # private, but used by rpcbind:
 -    __svc_clean_idle; svc_auth_none; libtirpc_set_debug;
 -};
---- /dev/null
-+++ b/src/libtirpc.map.in
-@@ -0,0 +1,303 @@
-+TIRPC_0.3.0 {
-+  global:
-+    # __*
-+    __rpc_createerr;
-+    __rpc_dtbsize;
-+    __rpc_endconf;
-+    __rpc_fd2sockinfo;
-+    __rpc_fixup_addr;
-+    __rpc_get_a_size;
-+    __rpc_get_local_uid;
-+    __rpc_get_t_size;
-+    __rpc_getconf;
-+    __rpc_getconfip;
-+    __rpc_nconf2fd;
-+    __rpc_nconf2fd_flags;
-+    __rpc_nconf2sockinfo;
-+    __rpc_rawcombuf;
-+    __rpc_seman2socktype;
-+    __rpc_setconf;
-+    __rpc_sockinfo2netid;
-+    __rpc_sockisbound;
-+    __rpc_socktype2seman;
-+    __rpc_taddr2uaddr_af;
-+    __rpc_uaddr2taddr_af;
-+    __rpcgettp;
-+
-+    # _*
-+    _authenticate;
-+    _get_next_token;
-+    _gss_authenticate;
-+    _null_auth;
-+    _rpc_dtablesize;
-+    _seterr_reply;
-+    _svcauth_none;
-+    _svcauth_short;
-+    _svcauth_unix;
-+
-+    # a*
-+    authdes_create;
-+    authdes_seccreate;
-+    authnone_create;
-+    authunix_create;
-+    authunix_create_default;
-+
-+    # b*
-+    bindresvport;
-+    bindresvport_sa;
-+
-+    # c*
-+    callrpc;
-+    clnt_broadcast;
-+    clnt_create;
-+    clnt_create_timed;
-+    clnt_create_vers;
-+    clnt_create_vers_timed;
-+    clnt_dg_create;
-+    clnt_pcreateerror;
-+    clnt_perrno;
-+    clnt_perror;
-+    clnt_raw_create;
-+    clnt_spcreateerror;
-+    clnt_sperrno;
-+    clnt_sperror;
-+    clnt_tli_create;
-+    clnt_tp_create;
-+    clnt_tp_create_timed;
-+    clnt_vc_create;
-+    clntraw_create;
-+    clnttcp_create;
-+    clntudp_bufcreate;
-+    clntudp_create;
-+    clntunix_create;
-+
-+    # e*
-+    endnetconfig;
-+    endnetpath;
-+
-+    # f*
-+    freenetconfigent;
-+
-+    # g*
-+    get_myaddress;
-+    getnetconfig;
-+    getnetconfigent;
-+    getnetpath;
-+    getrpcport;
-+
-+    # n*
-+    nc_perror;
-+    nc_sperror;
-+
-+    # p*
-+    pmap_getmaps;
-+    pmap_getport;
-+    pmap_rmtcall;
-+    pmap_set;
-+    pmap_unset;
-+
-+    # r*
-+    registerrpc;
-+    rpc_broadcast;
-+    rpc_broadcast_exp;
-+    rpc_call;
-+    rpc_control;
-+    rpc_createerr;
-+    rpc_nullproc;
-+    rpc_reg;
-+    rpcb_getaddr;
-+    rpcb_getmaps;
-+    rpcb_gettime;
-+    rpcb_rmtcall;
-+    rpcb_set;
-+    rpcb_taddr2uaddr;
-+    rpcb_uaddr2taddr;
-+    rpcb_unset;
-+
-+    # s*
-+    setnetconfig;
-+    setnetpath;
-+    svc_auth_reg;
-+    svc_create;
-+    svc_dg_create;
-+    svc_dg_enablecache;
-+    svc_exit;
-+    svc_fd_create;
-+    svc_fdset;
-+    svc_getreq;
-+    svc_getreq_common;
-+    svc_getreq_poll;
-+    svc_getreqset;
-+    svc_maxfd;
-+    svc_raw_create;
-+    svc_reg;
-+    svc_register;
-+    svc_run;
-+    svc_sendreply;
-+    svc_tli_create;
-+    svc_tp_create;
-+    svc_unreg;
-+    svc_unregister;
-+    svc_vc_create;
-+    svcerr_auth;
-+    svcerr_decode;
-+    svcerr_noproc;
-+    svcerr_noprog;
-+    svcerr_progvers;
-+    svcerr_systemerr;
-+    svcerr_weakauth;
-+    svcfd_create;
-+    svcraw_create;
-+    svctcp_create;
-+    svcudp_bufcreate;
-+    svcudp_create;
-+    svcunix_create;
-+    svcunixfd_create;
-+
-+    # t*
-+    taddr2uaddr;
-+
-+    # u*
-+    uaddr2taddr;
-+
-+    # x*
-+    xdr_accepted_reply;
-+    xdr_array;
-+    xdr_authunix_parms;
-+    xdr_bool;
-+    xdr_bytes;
-+    xdr_callhdr; xdr_callmsg;
-+    xdr_char;
-+    xdr_des_block;
-+    xdr_double;
-+    xdr_enum;
-+    xdr_float;
-+    xdr_free;
-+    xdr_hyper;
-+    xdr_int16_t;
-+    xdr_int32_t;
-+    xdr_int64_t;
-+    xdr_int8_t;
-+    xdr_int;
-+    xdr_long;
-+    xdr_longlong_t;
-+    xdr_netbuf;
-+    xdr_netobj;
-+    xdr_opaque;
-+    xdr_opaque_auth;
-+    xdr_pmap;
-+    xdr_pmaplist;
-+    xdr_pmaplist_ptr;
-+    xdr_pointer;
-+    xdr_quad_t;
-+    xdr_reference;
-+    xdr_rejected_reply;
-+    xdr_replymsg;
-+    xdr_rmtcall_args;
-+    xdr_rmtcallres;
-+    xdr_rpcb;
-+    xdr_rpcb_entry;
-+    xdr_rpcb_entry_list_ptr;
-+    xdr_rpcb_rmtcallargs;
-+    xdr_rpcb_rmtcallres;
-+    xdr_rpcb_stat;
-+    xdr_rpcb_stat_byvers;
-+    xdr_rpcblist;
-+    xdr_rpcblist_ptr;
-+    xdr_rpcbs_addrlist;
-+    xdr_rpcbs_addrlist_ptr;
-+    xdr_rpcbs_proc;
-+    xdr_rpcbs_rmtcalllist;
-+    xdr_rpcbs_rmtcalllist_ptr;
-+    xdr_short;
-+    xdr_string;
-+    xdr_u_char;
-+    xdr_u_hyper;
-+    xdr_u_int16_t;
-+    xdr_u_int32_t;
-+    xdr_u_int64_t;
-+    xdr_u_int8_t;
-+    xdr_u_int;
-+    xdr_u_long;
-+    xdr_u_longlong_t;
-+    xdr_u_quad_t;
-+    xdr_u_short;
-+    xdr_uint16_t;
-+    xdr_uint32_t;
-+    xdr_uint64_t;
-+    xdr_uint8_t;
-+    xdr_union;
-+    xdr_vector;
-+    xdr_void;
-+    xdr_wrapstring;
-+    xdrmem_create;
-+    xdrrec_create;
-+    xdrrec_endofrecord;
-+    xdrrec_eof;
-+    xdrrec_skiprecord;
-+    xdrstdio_create;
-+    xprt_register;
-+    xprt_unregister;
-+    # GSS-API symbols (conditionally included)
-+@GSS_SYMBOLS@
-+    # DES crypto symbols (conditionally included)
-+@DES_SYMBOLS@
-+    # RPC database symbols (conditionally included)
-+@RPCDB_SYMBOLS@
-+
-+  local:
-+    *;
-+};
-+
-+TIRPC_0.3.1 {
-+# GSS-API symbols (conditionally included)
-+@GSS_SYMBOLS_031@
-+} TIRPC_0.3.0;
-+
-+TIRPC_0.3.2 {
-+    getnetname;
-+    getpublicandprivatekey;
-+    getpublickey;
-+    host2netname;
-+    key_decryptsession;
-+    key_decryptsession_pk;
-+    key_encryptsession;
-+    key_encryptsession_pk;
-+    key_gendes;
-+    key_get_conv;
-+    key_setsecret;
-+    key_secretkey_is_set;
-+    key_setnet;
-+    netname2host;
-+    netname2user;
-+    rtime;
-+    user2netname;
-+    xdr_cryptkeyarg;
-+    xdr_cryptkeyarg2;
-+    xdr_cryptkeyres;
-+    xdr_getcredres;
-+    xdr_key_netstarg;
-+    xdr_key_netstres;
-+    xdr_keybuf;
-+    xdr_keystatus;
-+    xdr_netnamestr;
-+    xdr_unixcred;
-+} TIRPC_0.3.1;
-+
-+TIRPC_0.3.3 {
-+    __getpublickey_LOCAL;
-+    __key_decryptsession_pk_LOCAL;
-+    __key_encryptsession_pk_LOCAL;
-+    __key_gendes_LOCAL;
-+    xdr_sizeof;
-+    authdes_pk_create;
-+    svc_pollfd;
-+    svc_max_pollfd;
-+} TIRPC_0.3.2;
-+
-+TIRPC_PRIVATE {
-+  global:
-+    __libc_clntudp_bufcreate;
-+  # private, but used by rpcbind:
-+    __svc_clean_idle; svc_auth_none; libtirpc_set_debug;
-+};
diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
deleted file mode 100644
index 7bfe7c2924..0000000000
--- a/meta/recipes-extended/libtirpc/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From b526c0a90953f47d4cbf7ef01e9ac13e9e76904a Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Thu, 12 Dec 2024 04:16:02 -0500
-Subject: [PATCH 1/2] Update declarations to allow compile with gcc-15
-
-This patch fixes some of the compile errors with gcc 15-20241117.
-
-In addition the follow declarations need to be fixed:
-  sed -n 75,77p libtirpc-1.3.6/src/key_call.c
-  cryptkeyres *(*__key_encryptsession_pk_LOCAL)() = 0;
-  cryptkeyres *(*__key_decryptsession_pk_LOCAL)() = 0;
-  des_block *(*__key_gendes_LOCAL)() = 0;
-
-Upstream-Status: Backport [https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=d473f1e1f6ba80bfaee4daa058da159305167323]
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/auth_none.c     | 2 +-
- src/getpublickey.c  | 2 +-
- src/svc_auth_none.c | 4 ++--
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/auth_none.c b/src/auth_none.c
-index 0b0bbd1..aca6e71 100644
---- a/src/auth_none.c
-+++ b/src/auth_none.c
-@@ -62,7 +62,7 @@ static bool_t authnone_validate (AUTH *, struct opaque_auth *);
- static bool_t authnone_refresh (AUTH *, void *);
- static void authnone_destroy (AUTH *);
- 
--extern bool_t xdr_opaque_auth();
-+extern bool_t xdr_opaque_auth(XDR *, struct opaque_auth *);
- 
- static struct auth_ops *authnone_ops();
- 
-diff --git a/src/getpublickey.c b/src/getpublickey.c
-index be37a24..4e96c7c 100644
---- a/src/getpublickey.c
-+++ b/src/getpublickey.c
-@@ -52,7 +52,7 @@
- /*
-  * Hack to let ypserv/rpc.nisd use AUTH_DES.
-  */
--int (*__getpublickey_LOCAL)() = 0;
-+int (*__getpublickey_LOCAL)(const char *, char *) = 0;
- 
- /*
-  * Get somebody's public key
-diff --git a/src/svc_auth_none.c b/src/svc_auth_none.c
-index 887e809..5ca98e9 100644
---- a/src/svc_auth_none.c
-+++ b/src/svc_auth_none.c
-@@ -37,8 +37,8 @@
- 
- #include <rpc/rpc.h>
- 
--static bool_t	svcauth_none_destroy();
--static bool_t   svcauth_none_wrap();
-+static bool_t	svcauth_none_destroy(SVCAUTH *);
-+static bool_t   svcauth_none_wrap(SVCAUTH *, XDR *, bool_t (*)(XDR *, ...), char *);
- 
- struct svc_auth_ops svc_auth_none_ops = {
- 	svcauth_none_wrap,
diff --git a/meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch b/meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch
deleted file mode 100644
index 83e2105a1a..0000000000
--- a/meta/recipes-extended/libtirpc/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 55452e6ae71869880f8c85d5dba9aa24d7147d8b Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Thu, 2 Jan 2025 08:46:24 -0500
-Subject: [PATCH 2/2] update signal and key_call declarations to allow compile
- with gcc-15
-
-Follow up patch addressing the following declarations:
-  sed -n 75,77p libtirpc-1.3.6/src/key_call.c
-  cryptkeyres *(*__key_encryptsession_pk_LOCAL)() = 0;
-  cryptkeyres *(*__key_decryptsession_pk_LOCAL)() = 0;
-  des_block *(*__key_gendes_LOCAL)() = 0;
-
-Upstream-Status: Backport [https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=240ee6c774729c9c24812aa8912f1fcf8996b162]
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/auth_time.c | 4 ++--
- src/key_call.c  | 6 +++---
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/auth_time.c b/src/auth_time.c
-index 936dd76..c21b1df 100644
---- a/src/auth_time.c
-+++ b/src/auth_time.c
-@@ -248,7 +248,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)
- 	char			ut[64], ipuaddr[64];
- 	endpoint		teps[32];
- 	nis_server		tsrv;
--	void			(*oldsig)() = NULL; /* old alarm handler */
-+	void			(*oldsig)(int) = NULL; /* old alarm handler */
- 	struct sockaddr_in	sin;
- 	int			s = RPC_ANYSOCK;
- 	socklen_t len;
-@@ -417,7 +417,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)
- 		} else {
- 			int res;
- 
--			oldsig = (void (*)())signal(SIGALRM, alarm_hndler);
-+			oldsig = (void (*)(int))signal(SIGALRM, alarm_hndler);
- 			saw_alarm = 0; /* global tracking the alarm */
- 			alarm(20); /* only wait 20 seconds */
- 			res = connect(s, (struct sockaddr *)&sin, sizeof(sin));
-diff --git a/src/key_call.c b/src/key_call.c
-index 9f4b1d2..43f990e 100644
---- a/src/key_call.c
-+++ b/src/key_call.c
-@@ -72,9 +72,9 @@
-  * implementations of these functions, and to call those in key_call().
-  */
- 
--cryptkeyres *(*__key_encryptsession_pk_LOCAL)() = 0;
--cryptkeyres *(*__key_decryptsession_pk_LOCAL)() = 0;
--des_block *(*__key_gendes_LOCAL)() = 0;
-+cryptkeyres *(*__key_encryptsession_pk_LOCAL)(uid_t, char *) = 0;
-+cryptkeyres *(*__key_decryptsession_pk_LOCAL)(uid_t, char *) = 0;
-+des_block *(*__key_gendes_LOCAL)(uid_t, char *) = 0;
- 
- static int key_call( u_long, xdrproc_t, void *, xdrproc_t, void *);
- 
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
similarity index 82%
rename from meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
rename to meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
index c6901839c1..e85f95e6fd 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb
@@ -10,13 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
 PROVIDES = "virtual/librpc"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
-           file://0001-Update-declarations-to-allow-compile-with-gcc-15.patch \
-           file://0002-update-signal-and-key_call-declarations-to-allow-com.patch \
            file://0001-Add-conditional-version-script-support.patch \
-          "
+           "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-SRC_URI[sha256sum] = "bbd26a8f0df5690a62a47f6aa30f797f3ef8d02560d1bc449a83066b5a1d3508"
+SRC_URI[sha256sum] = "b47d3ac19d3549e54a05d0019a6c400674da716123858cfdb6d3bdd70a66c702"
 
 inherit autotools pkgconfig
 
-- 
2.47.1


--===============2615800320967221377==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtirpc-upgrade-1.3.6-1.3.7.patch"

RnJvbSBiZWQ0NThiYjhjZTgzMjJhMjgzY2VjNWU5NDFlNDM0NGI4NzhjOTAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMDg6NTU6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ0aXJwYzogdXBncmFkZSAxLjMuNiAtPiAxLjMuNwoKLS0tCiAuLi5kLWNvbmRpdGlvbmFsLXZl
cnNpb24tc2NyaXB0LXN1cHBvcnQucGF0Y2ggfCA1MDUgKy0tLS0tLS0tLS0tLS0tLS0tCiAuLi5y
YXRpb25zLXRvLWFsbG93LWNvbXBpbGUtd2l0aC1nY2MtMTUucGF0Y2ggfCAgNjQgLS0tCiAuLi5k
LWtleV9jYWxsLWRlY2xhcmF0aW9ucy10by1hbGxvdy1jb20ucGF0Y2ggfCAgNjAgLS0tCiAuLi4v
e2xpYnRpcnBjXzEuMy42LmJiID0+IGxpYnRpcnBjXzEuMy43LmJifSAgfCAgIDYgKy0KIDQgZmls
ZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNjE3IGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy9saWJ0aXJwYy8wMDAxLVVw
ZGF0ZS1kZWNsYXJhdGlvbnMtdG8tYWxsb3ctY29tcGlsZS13aXRoLWdjYy0xNS5wYXRjaAogZGVs
ZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy9saWJ0aXJwYy8w
MDAyLXVwZGF0ZS1zaWduYWwtYW5kLWtleV9jYWxsLWRlY2xhcmF0aW9ucy10by1hbGxvdy1jb20u
cGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlidGlycGMve2xpYnRpcnBjXzEu
My42LmJiID0+IGxpYnRpcnBjXzEuMy43LmJifSAoODIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9saWJ0aXJwYy9saWJ0aXJwYy8wMDAxLUFkZC1jb25kaXRpb25hbC12ZXJz
aW9uLXNjcmlwdC1zdXBwb3J0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBj
L2xpYnRpcnBjLzAwMDEtQWRkLWNvbmRpdGlvbmFsLXZlcnNpb24tc2NyaXB0LXN1cHBvcnQucGF0
Y2gKaW5kZXggMjc2NGY2NTI4NC4uYjMxODNlOGQ5NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRpcnBjLzAwMDEtQWRkLWNvbmRpdGlvbmFsLXZlcnNpb24t
c2NyaXB0LXN1cHBvcnQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBj
L2xpYnRpcnBjLzAwMDEtQWRkLWNvbmRpdGlvbmFsLXZlcnNpb24tc2NyaXB0LXN1cHBvcnQucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDhhZTlhMzM1ZDU2ZmM0YWJhODQ1NDE1OWIzMjZkODA5
ZWZjYTU5N2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJjN2QwYjY1NjZiODZmNmNi
OGYzOTM1ZmQyMzI0ZDM1OTU3MmRmNjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogTW9uLCAxMSBBdWcgMjAyNSAyMTox
Mzo1OSAtMDcwMAogU3ViamVjdDogW1BBVENIXSBBZGQgY29uZGl0aW9uYWwgdmVyc2lvbiBzY3Jp
cHQgc3VwcG9ydApAQCAtMjIsMTUxICsyMiwxNiBAQCBGaXhlcyBsaW5raW5nIGVycm9ycyB3aGVu
IHRoZXNlIGZlYXR1cmVzIGFyZSBub3QgYXZhaWxhYmxlLgogVXBzdHJlYW0tU3RhdHVzOiBTdWJt
aXR0ZWQgW2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW5mcy8yMDI1MDgxMjE4MDgwOS4y
MTgyMzAxLTEtcmFqLmtoZW1AZ21haWwuY29tL1QvI3VdCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgogLS0tCi0gY29uZmlndXJlLmFjICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDUwICsrKysrKysrKysrKysrKysrKysrKysrKysrKwotIHNyYy9NYWtlZmls
ZS5hbSAgICAgICAgICAgICAgICAgICAgICAgfCAyMSArKysrKysrKystLQotIHNyYy97bGlidGly
cGMubWFwID0+IGxpYnRpcnBjLm1hcC5pbn0gfCA0OCArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
Ci0gMyBmaWxlcyBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspLCA0MiBkZWxldGlvbnMoLSkKLSBy
ZW5hbWUgc3JjL3tsaWJ0aXJwYy5tYXAgPT4gbGlidGlycGMubWFwLmlufSAoODQlKQorIHNyYy9s
aWJ0aXJwYy5tYXAgfCAzMDMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KKyAxIGZpbGUgY2hhbmdlZCwgMzAzIGRlbGV0aW9ucygtKQorIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBzcmMvbGlidGlycGMubWFwCiAKLS0tLSBhL2NvbmZpZ3VyZS5hYwotKysrIGIvY29u
ZmlndXJlLmFjCi1AQCAtNzcsNiArNzcsMTkgQEAgaWYgdGVzdCAieCRlbmFibGVfaXB2NiIgIT0g
eG5vOyB0aGVuCi0gCUFDX0RFRklORShJTkVUNiwgMSwgW0RlZmluZSB0byAxIGlmIElQdjYgaXMg
YXZhaWxhYmxlXSkKLSBmaQotIAotKyMgUlBDIGRhdGFiYXNlIHN1cHBvcnQKLStBQ19BUkdfRU5B
QkxFKHJwY2RiLAotKyAgICBbQVNfSEVMUF9TVFJJTkcoWy0tZW5hYmxlLXJwY2RiXSwgW0VuYWJs
ZSBSUEMgRGF0YWJhc2Ugc3VwcG9ydCBAPDpAZGVmYXVsdD1ub0A6PkBdKV0sCi0rICAgIFtdLCBb
ZW5hYmxlX3JwY2RiPW5vXSkKLStBTV9DT05ESVRJT05BTChSUENEQiwgdGVzdCAieCRlbmFibGVf
cnBjZGIiID0geHllcykKLStpZiB0ZXN0ICJ4JGVuYWJsZV9ycGNkYiIgIT0gInhubyI7IHRoZW4K
LSsgICAgQUNfQ0hFQ0tfRlVOQ1MoW2dldHJwY2VudCBnZXRycGNieW5hbWUgZ2V0cnBjYnludW1i
ZXJdLCBbaGF2ZV9ycGNkYj15ZXNdKQotKwotKyAgICBpZiB0ZXN0ICJ4JGhhdmVfcnBjZGIiID0g
Inh5ZXMiOyB0aGVuCi0rICAgICAgICBBQ19ERUZJTkUoW1JQQ0RCXSwgWzFdLCBbRGVmaW5lIGlm
IFJQQyBkYXRhYmFzZSBzdXBwb3J0IGlzIGF2YWlsYWJsZV0pCi0rICAgIGZpCi0rZmkKLSsKLSBB
Q19BUkdfRU5BQkxFKHN5bXZlcnMsCi0gCVtBU19IRUxQX1NUUklORyhbLS1kaXNhYmxlLXN5bXZl
cnNdLFtEaXNhYmxlIHN5bWJvbCB2ZXJzaW9uaW5nIEA8OkBkZWZhdWx0PW5vQDo+QF0pXSwKLSAg
ICAgICBbXSxbZW5hYmxlX3N5bXZlcnM9bWF5YmVdKQotQEAgLTk3LDYgKzExMCwzMyBAQCBmaQot
IAotIEFNX0NPTkRJVElPTkFMKFNZTVZFUlMsIHRlc3QgIngkZW5hYmxlX3N5bXZlcnMiID0geHll
cykKLSAKLSsjIEdlbmVyYXRlIHN5bWJvbCBsaXN0cyBmb3IgdmVyc2lvbiBzY3JpcHQKLStpZiB0
ZXN0ICJ4JGVuYWJsZV9nc3NhcGkiID0gInh5ZXMiOyB0aGVuCi0rICAgIEdTU19TWU1CT0xTPSJf
c3ZjYXV0aF9nc3M7IGF1dGhnc3NfY3JlYXRlOyBhdXRoZ3NzX2NyZWF0ZV9kZWZhdWx0OyBhdXRo
Z3NzX2ZyZWVfcHJpdmF0ZV9kYXRhOyBhdXRoZ3NzX2dldF9wcml2YXRlX2RhdGE7IGF1dGhnc3Nf
c2VydmljZTsgZ3NzX2xvZ19kZWJ1ZzsgZ3NzX2xvZ19oZXhkdW1wOyBnc3NfbG9nX3N0YXR1czsg
cnBjX2dzc19nZXRfZXJyb3I7IHJwY19nc3NfZ2V0X21lY2hfaW5mbzsgcnBjX2dzc19nZXRfbWVj
aGFuaXNtczsgcnBjX2dzc19nZXRfcHJpbmNpcGFsX25hbWU7IHJwY19nc3NfZ2V0X3ZlcnNpb25z
OyBycGNfZ3NzX3FvcF90b19udW07IHJwY19nc3Nfc2VjY3JlYXRlOyBycGNfZ3NzX3NldF9jYWxs
YmFjazsgcnBjX2dzc19zZXRfZGVmYXVsdHM7IHJwY19nc3Nfc2V0X3N2Y19uYW1lOyBycGNfZ3Nz
X3N2Y19tYXhfZGF0YV9sZW5ndGg7IgotKwotKyAgICBHU1NfU1lNQk9MU18wMzE9InN2Y2F1dGhf
Z3NzX2dldF9wcmluY2lwYWw7IHN2Y2F1dGhfZ3NzX3NldF9zdmNfbmFtZTsiCi0rZWxzZQotKyAg
ICBHU1NfU1lNQk9MUz0iIgotKyAgICBHU1NfU1lNQk9MU18wMzE9IiIKLStmaQotKwotK2lmIHRl
c3QgIngkZW5hYmxlX2F1dGhkZXMiID0gInh5ZXMiOyB0aGVuCi0rICAgIERFU19TWU1CT0xTPSJj
YmNfY3J5cHQ7IGVjYl9jcnlwdDsgeGRyX2F1dGhkZXNfY3JlZDsgeGRyX2F1dGhkZXNfdmVyZjsg
eGRyX3JwY19nc3NfY3JlZDsgeGRyX3JwY19nc3NfZGF0YTsgeGRyX3JwY19nc3NfaW5pdF9hcmdz
OyB4ZHJfcnBjX2dzc19pbml0X3JlczsiCi0rZWxzZQotKyAgICBERVNfU1lNQk9MUz0iIgotK2Zp
Ci0rCi0raWYgdGVzdCAieCRlbmFibGVfcnBjZGIiID0gInh5ZXMiOyB0aGVuCi0rICAgIFJQQ0RC
X1NZTUJPTFM9ImVuZHJwY2VudDsgZ2V0cnBjZW50OyBnZXRycGNieW51bWJlcjsgZ2V0cnBjYnlu
YW1lOyBzZXRycGNlbnQ7IgotK2Vsc2UKLSsgICAgUlBDREJfU1lNQk9MUz0iIgotK2ZpCi0rCi0r
QUNfU1VCU1QoW0dTU19TWU1CT0xTXSkKLStBQ19TVUJTVChbR1NTX1NZTUJPTFNfMDMxXSkKLStB
Q19TVUJTVChbREVTX1NZTUJPTFNdKQotK0FDX1NVQlNUKFtSUENEQl9TWU1CT0xTXSkKLSsKLSBB
Q19DQU5PTklDQUxfQlVJTEQKLSAjIENoZWNrIGZvciB3aGljaCBob3N0IHdlIGFyZSBvbiBhbmQg
c2V0dXAgYSBmZXcgdGhpbmdzCi0gIyBzcGVjaWZpY2FsbHkgYmFzZWQgb24gdGhlIGhvc3QKLUBA
IC0xNjcsNyArMjA3LDE2IEBAIEFDX0NIRUNLX0ZVTkNTKFtnZXRwZWVyZWlkIGdldHJwY2J5bmFt
ZQotIEFDX0NIRUNLX1RZUEVTKHN0cnVjdCBycGNlbnQsLCwgWwotICAgICAgICNpbmNsdWRlIDxu
ZXRkYi5oPl0pCi0gQUNfQ09ORklHX0ZJTEVTKFtNYWtlZmlsZSBzcmMvTWFrZWZpbGUgbWFuL01h
a2VmaWxlIGRvYy9NYWtlZmlsZV0pCi0rQUNfQ09ORklHX0ZJTEVTKFtzcmMvbGlidGlycGMubWFw
XSkKLSBBQ19DT05GSUdfRklMRVMoW2xpYnRpcnBjLnBjXSkKLSBBQ19PVVRQVVQKLSAKLSsjIENv
bmZpZ3VyYXRpb24gc3VtbWFyeQotK0FDX01TR19OT1RJQ0UoWwotK2xpYnRpcnBjIGNvbmZpZ3Vy
YXRpb24gc3VtbWFyeToKLSsgIEdTUy1BUEkgc3VwcG9ydDogJGVuYWJsZV9nc3NhcGkKLSsgIERF
UyBjcnlwdG8gc3VwcG9ydDogJGVuYWJsZV9hdXRoZGVzCi0rICBSUEMgZGF0YWJhc2Ugc3VwcG9y
dDogJGVuYWJsZV9ycGNkYgotKyAgU3ltYm9sIHZlcnNpb25pbmc6ICRlbmFibGVfc3ltdmVycwot
K10pCi0gCi0tLS0gYS9zcmMvTWFrZWZpbGUuYW0KLSsrKyBiL3NyYy9NYWtlZmlsZS5hbQotQEAg
LTYsNiArNiw5IEBACi0gIyMgYW55dGhpbmcgbGlrZSB0aGF0LgotIAotIG5vaW5zdF9IRUFERVJT
ID0gcnBjX2NvbS5oIGRlYnVnLmgKLStFWFRSQV9ESVNUID0gbGlidGlycGMubWFwLmluCi0rIyBH
ZW5lcmF0ZWQgZmlsZXMKLStCVUlMVF9TT1VSQ0VTID0gbGlidGlycGMubWFwCi0gCi0gQU1fQ1BQ
RkxBR1MgPSAtSSQodG9wX3NyY2RpcikvdGlycGMgLWluY2x1ZGUgY29uZmlnLmggLURQT1JUTUFQ
IC1ESU5FVDYgXAotIAkJLURfR05VX1NPVVJDRSAtV2FsbCAtcGlwZQotQEAgLTE1LDEwICsxOCwx
OSBAQCBsaWJfTFRMSUJSQVJJRVMgPSBsaWJ0aXJwYy5sYQotIGxpYnRpcnBjX2xhX0xERkxBR1Mg
PSBATERGTEFHX05PVU5ERUZJTkVEQCAtbm8tdW5kZWZpbmVkIEBQVEhSRUFEX0xJQlNACi0gbGli
dGlycGNfbGFfTERGTEFHUyArPSAtdmVyc2lvbi1pbmZvIEBMVF9WRVJTSU9OX0lORk9ACi0gCi0r
IyBHZW5lcmF0ZSB2ZXJzaW9uIHNjcmlwdCBmcm9tIHRlbXBsYXRlCi0rbGlidGlycGMubWFwOiAk
KHNyY2RpcikvbGlidGlycGMubWFwLmluCi0rCSQoQU1fVl9HRU4pJChTRUQpIFwKLSsJCS1lICdz
fEBHU1NfU1lNQk9MU0B8JChHU1NfU1lNQk9MUyl8ZycgXAotKwkJLWUgJ3N8QEdTU19TWU1CT0xT
XzAzMUB8JChHU1NfU1lNQk9MU18wMzEpfGcnIFwKLSsJCS1lICdzfEBERVNfU1lNQk9MU0B8JChE
RVNfU1lNQk9MUyl8ZycgXAotKwkJLWUgJ3N8QFJQQ0RCX1NZTUJPTFNAfCQoUlBDREJfU1lNQk9M
Uyl8ZycgXAotKwkJPCAkKHNyY2RpcikvbGlidGlycGMubWFwLmluID4gJEAgfHwgcm0gLWYgJEAK
LSsKLSBsaWJ0aXJwY19sYV9TT1VSQ0VTID0gYXV0aF9ub25lLmMgYXV0aF91bml4LmMgYXV0aHVu
aXhfcHJvdC5jIFwKLSAgICAgICAgIGJpbmRkeW5wb3J0LmMgYmluZHJlc3Zwb3J0LmMgXAotICAg
ICAgICAgY2xudF9iY2FzdC5jIGNsbnRfZGcuYyBjbG50X2dlbmVyaWMuYyBjbG50X3BlcnJvci5j
IGNsbnRfcmF3LmMgY2xudF9zaW1wbGUuYyBcCi0tICAgICAgICBjbG50X3ZjLmMgcnBjX2R0YWJs
ZXNpemUuYyBnZXRuZXRjb25maWcuYyBnZXRuZXRwYXRoLmMgZ2V0cnBjZW50LmMgXAotKyAgICAg
ICAgY2xudF92Yy5jIHJwY19kdGFibGVzaXplLmMgZ2V0bmV0Y29uZmlnLmMgZ2V0bmV0cGF0aC5j
IFwKLSAgICAgICAgIGdldHJwY3BvcnQuYyBtdF9taXNjLmMgcG1hcF9jbG50LmMgcG1hcF9nZXRt
YXBzLmMgcG1hcF9nZXRwb3J0LmMgXAotICAgICAgICAgcG1hcF9wcm90LmMgcG1hcF9wcm90Mi5j
IHBtYXBfcm10LmMgcnBjX3Byb3QuYyBycGNfY29tbW9uZGF0YS5jIFwKLSAgICAgICAgIHJwY19j
YWxsbXNnLmMgcnBjX2dlbmVyaWMuYyBycGNfc29jLmMgcnBjYl9jbG50LmMgcnBjYl9wcm90LmMg
XAotQEAgLTM0LDE5ICs0NiwyMyBAQCBlbmRpZgotIGxpYnRpcnBjX2xhX1NPVVJDRVMgKz0geGRy
LmMgeGRyX3JlYy5jIHhkcl9hcnJheS5jIHhkcl9mbG9hdC5jIHhkcl9tZW0uYyB4ZHJfcmVmZXJl
bmNlLmMgeGRyX3N0ZGlvLmMgeGRyX3NpemVvZi5jCi0gCi0gaWYgU1lNVkVSUwotLSAgICBsaWJ0
aXJwY19sYV9MREZMQUdTICs9IC1XbCwtLXZlcnNpb24tc2NyaXB0PSQoc3JjZGlyKS9saWJ0aXJw
Yy5tYXAKLSsgICAgbGlidGlycGNfbGFfTERGTEFHUyArPSAtV2wsLS12ZXJzaW9uLXNjcmlwdD0k
KGJ1aWxkZGlyKS9saWJ0aXJwYy5tYXAKLSBlbmRpZgotIAotICMjIFNlY3VyZS1SUEMKLSBpZiBH
U1MKLS0gICAgbGlidGlycGNfbGFfU09VUkNFUyArPSBhdXRoX2dzcy5jIGF1dGhnc3NfcHJvdC5j
IHN2Y19hdXRoX2dzcy5jIFwKLS0JCQkgICBycGNfZ3NzX3V0aWxzLmMKLS0gICAgbGlidGlycGNf
bGFfTElCQUREID0gJChHU1NBUElfTElCUykKLS0gICAgbGlidGlycGNfbGFfQ0ZMQUdTID0gLURI
QVZFX1JQQ1NFQ19HU1MgJChHU1NBUElfQ0ZMQUdTKQotK2xpYnRpcnBjX2xhX1NPVVJDRVMgKz0g
YXV0aF9nc3MuYyBhdXRoZ3NzX3Byb3QuYyBzdmNfYXV0aF9nc3MuYyBycGNfZ3NzX3V0aWxzLmMK
LStsaWJ0aXJwY19sYV9MSUJBREQgPSAkKEdTU0FQSV9MSUJTKQotK2xpYnRpcnBjX2xhX0NGTEFH
UyA9IC1ESEFWRV9SUENTRUNfR1NTICQoR1NTQVBJX0NGTEFHUykKLStlbmRpZgotKwotKyMgQ29u
ZGl0aW9uYWxseSBhZGQgUlBDIGRhdGFiYXNlIHNvdXJjZXMKLStpZiBSUENEQgotK2xpYnRpcnBj
X2xhX1NPVVJDRVMgKz0gZ2V0cnBjZW50LmMKLSBlbmRpZgotIAotIGxpYnRpcnBjX2xhX1NPVVJD
RVMgKz0ga2V5X2NhbGwuYyBrZXlfcHJvdF94ZHIuYyBnZXRwdWJsaWNrZXkuYwotIGxpYnRpcnBj
X2xhX1NPVVJDRVMgKz0gbmV0bmFtZS5jIG5ldG5hbWVyLmMgcnBjZG5hbWUuYyBydGltZS5jCi0g
Ci0tQ0xFQU5GSUxFUwkgICAgICAgPSBjc2NvcGUuKiAqfgotK0NMRUFORklMRVMJICAgICAgID0g
Y3Njb3BlLiogbGlidGlycGMubWFwICp+Ci0gRElTVENMRUFORklMRVMJICAgICAgID0gTWFrZWZp
bGUuaW4KK2RpZmYgLS1naXQgYS9zcmMvbGlidGlycGMubWFwIGIvc3JjL2xpYnRpcnBjLm1hcAor
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCA0NzliNGZmLi4wMDAwMDAwCiAtLS0gYS9z
cmMvbGlidGlycGMubWFwCiArKysgL2Rldi9udWxsCi1AQCAtMSwzMzUgKzAsMCBAQAorQEAgLTEs
MzAzICswLDAgQEAKIC1USVJQQ18wLjMuMCB7CiAtICBnbG9iYWw6CiAtICAgICMgX18qCkBAIC0y
MDMsMTYgKzY4LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+CiAtICAgIF9zdmNhdXRoX25vbmU7CiAtICAgIF9zdmNhdXRoX3Nob3J0OwogLSAgICBfc3Zj
YXV0aF91bml4OwotLSAgICBfc3ZjYXV0aF9nc3M7CiAtCiAtICAgICMgYSoKIC0gICAgYXV0aGRl
c19jcmVhdGU7CiAtICAgIGF1dGhkZXNfc2VjY3JlYXRlOwotLSAgICBhdXRoZ3NzX2NyZWF0ZTsK
LS0gICAgYXV0aGdzc19jcmVhdGVfZGVmYXVsdDsKLS0gICAgYXV0aGdzc19mcmVlX3ByaXZhdGVf
ZGF0YTsKLS0gICAgYXV0aGdzc19nZXRfcHJpdmF0ZV9kYXRhOwotLSAgICBhdXRoZ3NzX3NlcnZp
Y2U7CiAtICAgIGF1dGhub25lX2NyZWF0ZTsKIC0gICAgYXV0aHVuaXhfY3JlYXRlOwogLSAgICBh
dXRodW5peF9jcmVhdGVfZGVmYXVsdDsKQEAgLTIyMyw3ICs4Miw2IEBAIFNpZ25lZC1vZmYtYnk6
IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAtCiAtICAgICMgYyoKIC0gICAgY2FsbHJw
YzsKLS0gICAgY2JjX2NyeXB0OwogLSAgICBjbG50X2Jyb2FkY2FzdDsKIC0gICAgY2xudF9jcmVh
dGU7CiAtICAgIGNsbnRfY3JlYXRlX3RpbWVkOwpAQCAtMjQ4LDEwICsxMDYsOCBAQCBTaWduZWQt
b2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogLSAgICBjbG50dW5peF9jcmVh
dGU7CiAtCiAtICAgICMgZSoKLS0gICAgZWNiX2NyeXB0OwogLSAgICBlbmRuZXRjb25maWc7CiAt
ICAgIGVuZG5ldHBhdGg7Ci0tICAgIGVuZHJwY2VudDsKIC0KIC0gICAgIyBmKgogLSAgICBmcmVl
bmV0Y29uZmlnZW50OwpAQCAtMjYxLDEzICsxMTcsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgogLSAgICBnZXRuZXRjb25maWc7CiAtICAgIGdldG5ldGNv
bmZpZ2VudDsKIC0gICAgZ2V0bmV0cGF0aDsKLS0gICAgZ2V0cnBjZW50OwotLSAgICBnZXRycGNi
eW51bWJlcjsKLS0gICAgZ2V0cnBjYnluYW1lOwogLSAgICBnZXRycGNwb3J0OwotLSAgICBnc3Nf
bG9nX2RlYnVnOwotLSAgICBnc3NfbG9nX2hleGR1bXA7Ci0tICAgIGdzc19sb2dfc3RhdHVzOwog
LQogLSAgICAjIG4qCiAtICAgIG5jX3BlcnJvcjsKQEAgLTI4NywyMSArMTM3LDYgQEAgU2lnbmVk
LW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIC0gICAgcnBjX2NhbGw7CiAt
ICAgIHJwY19jb250cm9sOwogLSAgICBycGNfY3JlYXRlZXJyOwotLSAgICBycGNfZ3NzX2dldF9l
cnJvcjsKLS0gICAgcnBjX2dzc19nZXRfbWVjaF9pbmZvOwotLSAgICBycGNfZ3NzX2dldF9tZWNo
YW5pc21zOwotLSAgICBycGNfZ3NzX2dldF9wcmluY2lwYWxfbmFtZTsKLS0gICAgcnBjX2dzc19n
ZXRfdmVyc2lvbnM7Ci0tICAgIHJwY19nc3NfZ2V0Y3JlZDsKLS0gICAgcnBjX2dzc19pc19pbnN0
YWxsZWQ7Ci0tICAgIHJwY19nc3NfbWF4X2RhdGFfbGVuZ3RoOwotLSAgICBycGNfZ3NzX21lY2hf
dG9fb2lkOwotLSAgICBycGNfZ3NzX3FvcF90b19udW07Ci0tICAgIHJwY19nc3Nfc2VjY3JlYXRl
OwotLSAgICBycGNfZ3NzX3NldF9jYWxsYmFjazsKLS0gICAgcnBjX2dzc19zZXRfZGVmYXVsdHM7
Ci0tICAgIHJwY19nc3Nfc2V0X3N2Y19uYW1lOwotLSAgICBycGNfZ3NzX3N2Y19tYXhfZGF0YV9s
ZW5ndGg7CiAtICAgIHJwY19udWxscHJvYzsKIC0gICAgcnBjX3JlZzsKIC0gICAgcnBjYl9nZXRh
ZGRyOwpAQCAtMzE2LDcgKzE1MSw2IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+CiAtICAgICMgcyoKIC0gICAgc2V0bmV0Y29uZmlnOwogLSAgICBzZXRuZXRw
YXRoOwotLSAgICBzZXRycGNlbnQ7CiAtICAgIHN2Y19hdXRoX3JlZzsKIC0gICAgc3ZjX2NyZWF0
ZTsKIC0gICAgc3ZjX2RnX2NyZWF0ZTsKQEAgLTM2Myw4ICsxOTcsNiBAQCBTaWduZWQtb2ZmLWJ5
OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogLSAgICAjIHgqCiAtICAgIHhkcl9hY2Nl
cHRlZF9yZXBseTsKIC0gICAgeGRyX2FycmF5OwotLSAgICB4ZHJfYXV0aGRlc19jcmVkOwotLSAg
ICB4ZHJfYXV0aGRlc192ZXJmOwogLSAgICB4ZHJfYXV0aHVuaXhfcGFybXM7CiAtICAgIHhkcl9i
b29sOwogLSAgICB4ZHJfYnl0ZXM7CkBAIC0zOTcsMTAgKzIyOSw2IEBAIFNpZ25lZC1vZmYtYnk6
IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAtICAgIHhkcl9yZXBseW1zZzsKIC0gICAg
eGRyX3JtdGNhbGxfYXJnczsKIC0gICAgeGRyX3JtdGNhbGxyZXM7Ci0tICAgIHhkcl9ycGNfZ3Nz
X2NyZWQ7Ci0tICAgIHhkcl9ycGNfZ3NzX2RhdGE7Ci0tICAgIHhkcl9ycGNfZ3NzX2luaXRfYXJn
czsKLS0gICAgeGRyX3JwY19nc3NfaW5pdF9yZXM7CiAtICAgIHhkcl9ycGNiOwogLSAgICB4ZHJf
cnBjYl9lbnRyeTsKIC0gICAgeGRyX3JwY2JfZW50cnlfbGlzdF9wdHI7CkBAIC00NDQsMTQgKzI3
MiwyMCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogLSAg
ICB4ZHJzdGRpb19jcmVhdGU7CiAtICAgIHhwcnRfcmVnaXN0ZXI7CiAtICAgIHhwcnRfdW5yZWdp
c3RlcjsKKy0gICAgIyBHU1MtQVBJIHN5bWJvbHMgKGNvbmRpdGlvbmFsbHkgaW5jbHVkZWQpCist
X3N2Y2F1dGhfZ3NzOyBhdXRoZ3NzX2NyZWF0ZTsgYXV0aGdzc19jcmVhdGVfZGVmYXVsdDsgYXV0
aGdzc19mcmVlX3ByaXZhdGVfZGF0YTsgYXV0aGdzc19nZXRfcHJpdmF0ZV9kYXRhOyBhdXRoZ3Nz
X3NlcnZpY2U7IGdzc19sb2dfZGVidWc7IGdzc19sb2dfaGV4ZHVtcDsgZ3NzX2xvZ19zdGF0dXM7
IHJwY19nc3NfZ2V0X2Vycm9yOyBycGNfZ3NzX2dldF9tZWNoX2luZm87IHJwY19nc3NfZ2V0X21l
Y2hhbmlzbXM7IHJwY19nc3NfZ2V0X3ByaW5jaXBhbF9uYW1lOyBycGNfZ3NzX2dldF92ZXJzaW9u
czsgcnBjX2dzc19xb3BfdG9fbnVtOyBycGNfZ3NzX3NlY2NyZWF0ZTsgcnBjX2dzc19zZXRfY2Fs
bGJhY2s7IHJwY19nc3Nfc2V0X2RlZmF1bHRzOyBycGNfZ3NzX3NldF9zdmNfbmFtZTsgcnBjX2dz
c19zdmNfbWF4X2RhdGFfbGVuZ3RoOworLSAgICAjIERFUyBjcnlwdG8gc3ltYm9scyAoY29uZGl0
aW9uYWxseSBpbmNsdWRlZCkKKy0KKy0gICAgIyBSUEMgZGF0YWJhc2Ugc3ltYm9scyAoY29uZGl0
aW9uYWxseSBpbmNsdWRlZCkKKy0KIC0KIC0gIGxvY2FsOgogLSAgICAqOwogLX07CiAtCiAtVElS
UENfMC4zLjEgewotLSAgICBzdmNhdXRoX2dzc19nZXRfcHJpbmNpcGFsOwotLSAgICBzdmNhdXRo
X2dzc19zZXRfc3ZjX25hbWU7CistIyBHU1MtQVBJIHN5bWJvbHMgKGNvbmRpdGlvbmFsbHkgaW5j
bHVkZWQpCistc3ZjYXV0aF9nc3NfZ2V0X3ByaW5jaXBhbDsgc3ZjYXV0aF9nc3Nfc2V0X3N2Y19u
YW1lOwogLX0gVElSUENfMC4zLjA7CiAtCiAtVElSUENfMC4zLjIgewpAQCAtNDU5LDcgKzI5Myw2
IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAtICAgIGdl
dHB1YmxpY2FuZHByaXZhdGVrZXk7CiAtICAgIGdldHB1YmxpY2tleTsKIC0gICAgaG9zdDJuZXRu
YW1lOwotLSAgICBrZXlfY2FsbF9kZXN0cm95OwogLSAgICBrZXlfZGVjcnlwdHNlc3Npb247CiAt
ICAgIGtleV9kZWNyeXB0c2Vzc2lvbl9wazsKIC0gICAga2V5X2VuY3J5cHRzZXNzaW9uOwpAQCAt
NTAyLDMwOSArMzM1LDMgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4KIC0gICMgcHJpdmF0ZSwgYnV0IHVzZWQgYnkgcnBjYmluZDoKIC0gICAgX19zdmNfY2xl
YW5faWRsZTsgc3ZjX2F1dGhfbm9uZTsgbGlidGlycGNfc2V0X2RlYnVnOwogLX07Ci0tLS0gL2Rl
di9udWxsCi0rKysgYi9zcmMvbGlidGlycGMubWFwLmluCi1AQCAtMCwwICsxLDMwMyBAQAotK1RJ
UlBDXzAuMy4wIHsKLSsgIGdsb2JhbDoKLSsgICAgIyBfXyoKLSsgICAgX19ycGNfY3JlYXRlZXJy
OwotKyAgICBfX3JwY19kdGJzaXplOwotKyAgICBfX3JwY19lbmRjb25mOwotKyAgICBfX3JwY19m
ZDJzb2NraW5mbzsKLSsgICAgX19ycGNfZml4dXBfYWRkcjsKLSsgICAgX19ycGNfZ2V0X2Ffc2l6
ZTsKLSsgICAgX19ycGNfZ2V0X2xvY2FsX3VpZDsKLSsgICAgX19ycGNfZ2V0X3Rfc2l6ZTsKLSsg
ICAgX19ycGNfZ2V0Y29uZjsKLSsgICAgX19ycGNfZ2V0Y29uZmlwOwotKyAgICBfX3JwY19uY29u
ZjJmZDsKLSsgICAgX19ycGNfbmNvbmYyZmRfZmxhZ3M7Ci0rICAgIF9fcnBjX25jb25mMnNvY2tp
bmZvOwotKyAgICBfX3JwY19yYXdjb21idWY7Ci0rICAgIF9fcnBjX3NlbWFuMnNvY2t0eXBlOwot
KyAgICBfX3JwY19zZXRjb25mOwotKyAgICBfX3JwY19zb2NraW5mbzJuZXRpZDsKLSsgICAgX19y
cGNfc29ja2lzYm91bmQ7Ci0rICAgIF9fcnBjX3NvY2t0eXBlMnNlbWFuOwotKyAgICBfX3JwY190
YWRkcjJ1YWRkcl9hZjsKLSsgICAgX19ycGNfdWFkZHIydGFkZHJfYWY7Ci0rICAgIF9fcnBjZ2V0
dHA7Ci0rCi0rICAgICMgXyoKLSsgICAgX2F1dGhlbnRpY2F0ZTsKLSsgICAgX2dldF9uZXh0X3Rv
a2VuOwotKyAgICBfZ3NzX2F1dGhlbnRpY2F0ZTsKLSsgICAgX251bGxfYXV0aDsKLSsgICAgX3Jw
Y19kdGFibGVzaXplOwotKyAgICBfc2V0ZXJyX3JlcGx5OwotKyAgICBfc3ZjYXV0aF9ub25lOwot
KyAgICBfc3ZjYXV0aF9zaG9ydDsKLSsgICAgX3N2Y2F1dGhfdW5peDsKLSsKLSsgICAgIyBhKgot
KyAgICBhdXRoZGVzX2NyZWF0ZTsKLSsgICAgYXV0aGRlc19zZWNjcmVhdGU7Ci0rICAgIGF1dGhu
b25lX2NyZWF0ZTsKLSsgICAgYXV0aHVuaXhfY3JlYXRlOwotKyAgICBhdXRodW5peF9jcmVhdGVf
ZGVmYXVsdDsKLSsKLSsgICAgIyBiKgotKyAgICBiaW5kcmVzdnBvcnQ7Ci0rICAgIGJpbmRyZXN2
cG9ydF9zYTsKLSsKLSsgICAgIyBjKgotKyAgICBjYWxscnBjOwotKyAgICBjbG50X2Jyb2FkY2Fz
dDsKLSsgICAgY2xudF9jcmVhdGU7Ci0rICAgIGNsbnRfY3JlYXRlX3RpbWVkOwotKyAgICBjbG50
X2NyZWF0ZV92ZXJzOwotKyAgICBjbG50X2NyZWF0ZV92ZXJzX3RpbWVkOwotKyAgICBjbG50X2Rn
X2NyZWF0ZTsKLSsgICAgY2xudF9wY3JlYXRlZXJyb3I7Ci0rICAgIGNsbnRfcGVycm5vOwotKyAg
ICBjbG50X3BlcnJvcjsKLSsgICAgY2xudF9yYXdfY3JlYXRlOwotKyAgICBjbG50X3NwY3JlYXRl
ZXJyb3I7Ci0rICAgIGNsbnRfc3BlcnJubzsKLSsgICAgY2xudF9zcGVycm9yOwotKyAgICBjbG50
X3RsaV9jcmVhdGU7Ci0rICAgIGNsbnRfdHBfY3JlYXRlOwotKyAgICBjbG50X3RwX2NyZWF0ZV90
aW1lZDsKLSsgICAgY2xudF92Y19jcmVhdGU7Ci0rICAgIGNsbnRyYXdfY3JlYXRlOwotKyAgICBj
bG50dGNwX2NyZWF0ZTsKLSsgICAgY2xudHVkcF9idWZjcmVhdGU7Ci0rICAgIGNsbnR1ZHBfY3Jl
YXRlOwotKyAgICBjbG50dW5peF9jcmVhdGU7Ci0rCi0rICAgICMgZSoKLSsgICAgZW5kbmV0Y29u
ZmlnOwotKyAgICBlbmRuZXRwYXRoOwotKwotKyAgICAjIGYqCi0rICAgIGZyZWVuZXRjb25maWdl
bnQ7Ci0rCi0rICAgICMgZyoKLSsgICAgZ2V0X215YWRkcmVzczsKLSsgICAgZ2V0bmV0Y29uZmln
OwotKyAgICBnZXRuZXRjb25maWdlbnQ7Ci0rICAgIGdldG5ldHBhdGg7Ci0rICAgIGdldHJwY3Bv
cnQ7Ci0rCi0rICAgICMgbioKLSsgICAgbmNfcGVycm9yOwotKyAgICBuY19zcGVycm9yOwotKwot
KyAgICAjIHAqCi0rICAgIHBtYXBfZ2V0bWFwczsKLSsgICAgcG1hcF9nZXRwb3J0OwotKyAgICBw
bWFwX3JtdGNhbGw7Ci0rICAgIHBtYXBfc2V0OwotKyAgICBwbWFwX3Vuc2V0OwotKwotKyAgICAj
IHIqCi0rICAgIHJlZ2lzdGVycnBjOwotKyAgICBycGNfYnJvYWRjYXN0OwotKyAgICBycGNfYnJv
YWRjYXN0X2V4cDsKLSsgICAgcnBjX2NhbGw7Ci0rICAgIHJwY19jb250cm9sOwotKyAgICBycGNf
Y3JlYXRlZXJyOwotKyAgICBycGNfbnVsbHByb2M7Ci0rICAgIHJwY19yZWc7Ci0rICAgIHJwY2Jf
Z2V0YWRkcjsKLSsgICAgcnBjYl9nZXRtYXBzOwotKyAgICBycGNiX2dldHRpbWU7Ci0rICAgIHJw
Y2Jfcm10Y2FsbDsKLSsgICAgcnBjYl9zZXQ7Ci0rICAgIHJwY2JfdGFkZHIydWFkZHI7Ci0rICAg
IHJwY2JfdWFkZHIydGFkZHI7Ci0rICAgIHJwY2JfdW5zZXQ7Ci0rCi0rICAgICMgcyoKLSsgICAg
c2V0bmV0Y29uZmlnOwotKyAgICBzZXRuZXRwYXRoOwotKyAgICBzdmNfYXV0aF9yZWc7Ci0rICAg
IHN2Y19jcmVhdGU7Ci0rICAgIHN2Y19kZ19jcmVhdGU7Ci0rICAgIHN2Y19kZ19lbmFibGVjYWNo
ZTsKLSsgICAgc3ZjX2V4aXQ7Ci0rICAgIHN2Y19mZF9jcmVhdGU7Ci0rICAgIHN2Y19mZHNldDsK
LSsgICAgc3ZjX2dldHJlcTsKLSsgICAgc3ZjX2dldHJlcV9jb21tb247Ci0rICAgIHN2Y19nZXRy
ZXFfcG9sbDsKLSsgICAgc3ZjX2dldHJlcXNldDsKLSsgICAgc3ZjX21heGZkOwotKyAgICBzdmNf
cmF3X2NyZWF0ZTsKLSsgICAgc3ZjX3JlZzsKLSsgICAgc3ZjX3JlZ2lzdGVyOwotKyAgICBzdmNf
cnVuOwotKyAgICBzdmNfc2VuZHJlcGx5OwotKyAgICBzdmNfdGxpX2NyZWF0ZTsKLSsgICAgc3Zj
X3RwX2NyZWF0ZTsKLSsgICAgc3ZjX3VucmVnOwotKyAgICBzdmNfdW5yZWdpc3RlcjsKLSsgICAg
c3ZjX3ZjX2NyZWF0ZTsKLSsgICAgc3ZjZXJyX2F1dGg7Ci0rICAgIHN2Y2Vycl9kZWNvZGU7Ci0r
ICAgIHN2Y2Vycl9ub3Byb2M7Ci0rICAgIHN2Y2Vycl9ub3Byb2c7Ci0rICAgIHN2Y2Vycl9wcm9n
dmVyczsKLSsgICAgc3ZjZXJyX3N5c3RlbWVycjsKLSsgICAgc3ZjZXJyX3dlYWthdXRoOwotKyAg
ICBzdmNmZF9jcmVhdGU7Ci0rICAgIHN2Y3Jhd19jcmVhdGU7Ci0rICAgIHN2Y3RjcF9jcmVhdGU7
Ci0rICAgIHN2Y3VkcF9idWZjcmVhdGU7Ci0rICAgIHN2Y3VkcF9jcmVhdGU7Ci0rICAgIHN2Y3Vu
aXhfY3JlYXRlOwotKyAgICBzdmN1bml4ZmRfY3JlYXRlOwotKwotKyAgICAjIHQqCi0rICAgIHRh
ZGRyMnVhZGRyOwotKwotKyAgICAjIHUqCi0rICAgIHVhZGRyMnRhZGRyOwotKwotKyAgICAjIHgq
Ci0rICAgIHhkcl9hY2NlcHRlZF9yZXBseTsKLSsgICAgeGRyX2FycmF5OwotKyAgICB4ZHJfYXV0
aHVuaXhfcGFybXM7Ci0rICAgIHhkcl9ib29sOwotKyAgICB4ZHJfYnl0ZXM7Ci0rICAgIHhkcl9j
YWxsaGRyOyB4ZHJfY2FsbG1zZzsKLSsgICAgeGRyX2NoYXI7Ci0rICAgIHhkcl9kZXNfYmxvY2s7
Ci0rICAgIHhkcl9kb3VibGU7Ci0rICAgIHhkcl9lbnVtOwotKyAgICB4ZHJfZmxvYXQ7Ci0rICAg
IHhkcl9mcmVlOwotKyAgICB4ZHJfaHlwZXI7Ci0rICAgIHhkcl9pbnQxNl90OwotKyAgICB4ZHJf
aW50MzJfdDsKLSsgICAgeGRyX2ludDY0X3Q7Ci0rICAgIHhkcl9pbnQ4X3Q7Ci0rICAgIHhkcl9p
bnQ7Ci0rICAgIHhkcl9sb25nOwotKyAgICB4ZHJfbG9uZ2xvbmdfdDsKLSsgICAgeGRyX25ldGJ1
ZjsKLSsgICAgeGRyX25ldG9iajsKLSsgICAgeGRyX29wYXF1ZTsKLSsgICAgeGRyX29wYXF1ZV9h
dXRoOwotKyAgICB4ZHJfcG1hcDsKLSsgICAgeGRyX3BtYXBsaXN0OwotKyAgICB4ZHJfcG1hcGxp
c3RfcHRyOwotKyAgICB4ZHJfcG9pbnRlcjsKLSsgICAgeGRyX3F1YWRfdDsKLSsgICAgeGRyX3Jl
ZmVyZW5jZTsKLSsgICAgeGRyX3JlamVjdGVkX3JlcGx5OwotKyAgICB4ZHJfcmVwbHltc2c7Ci0r
ICAgIHhkcl9ybXRjYWxsX2FyZ3M7Ci0rICAgIHhkcl9ybXRjYWxscmVzOwotKyAgICB4ZHJfcnBj
YjsKLSsgICAgeGRyX3JwY2JfZW50cnk7Ci0rICAgIHhkcl9ycGNiX2VudHJ5X2xpc3RfcHRyOwot
KyAgICB4ZHJfcnBjYl9ybXRjYWxsYXJnczsKLSsgICAgeGRyX3JwY2Jfcm10Y2FsbHJlczsKLSsg
ICAgeGRyX3JwY2Jfc3RhdDsKLSsgICAgeGRyX3JwY2Jfc3RhdF9ieXZlcnM7Ci0rICAgIHhkcl9y
cGNibGlzdDsKLSsgICAgeGRyX3JwY2JsaXN0X3B0cjsKLSsgICAgeGRyX3JwY2JzX2FkZHJsaXN0
OwotKyAgICB4ZHJfcnBjYnNfYWRkcmxpc3RfcHRyOwotKyAgICB4ZHJfcnBjYnNfcHJvYzsKLSsg
ICAgeGRyX3JwY2JzX3JtdGNhbGxsaXN0OwotKyAgICB4ZHJfcnBjYnNfcm10Y2FsbGxpc3RfcHRy
OwotKyAgICB4ZHJfc2hvcnQ7Ci0rICAgIHhkcl9zdHJpbmc7Ci0rICAgIHhkcl91X2NoYXI7Ci0r
ICAgIHhkcl91X2h5cGVyOwotKyAgICB4ZHJfdV9pbnQxNl90OwotKyAgICB4ZHJfdV9pbnQzMl90
OwotKyAgICB4ZHJfdV9pbnQ2NF90OwotKyAgICB4ZHJfdV9pbnQ4X3Q7Ci0rICAgIHhkcl91X2lu
dDsKLSsgICAgeGRyX3VfbG9uZzsKLSsgICAgeGRyX3VfbG9uZ2xvbmdfdDsKLSsgICAgeGRyX3Vf
cXVhZF90OwotKyAgICB4ZHJfdV9zaG9ydDsKLSsgICAgeGRyX3VpbnQxNl90OwotKyAgICB4ZHJf
dWludDMyX3Q7Ci0rICAgIHhkcl91aW50NjRfdDsKLSsgICAgeGRyX3VpbnQ4X3Q7Ci0rICAgIHhk
cl91bmlvbjsKLSsgICAgeGRyX3ZlY3RvcjsKLSsgICAgeGRyX3ZvaWQ7Ci0rICAgIHhkcl93cmFw
c3RyaW5nOwotKyAgICB4ZHJtZW1fY3JlYXRlOwotKyAgICB4ZHJyZWNfY3JlYXRlOwotKyAgICB4
ZHJyZWNfZW5kb2ZyZWNvcmQ7Ci0rICAgIHhkcnJlY19lb2Y7Ci0rICAgIHhkcnJlY19za2lwcmVj
b3JkOwotKyAgICB4ZHJzdGRpb19jcmVhdGU7Ci0rICAgIHhwcnRfcmVnaXN0ZXI7Ci0rICAgIHhw
cnRfdW5yZWdpc3RlcjsKLSsgICAgIyBHU1MtQVBJIHN5bWJvbHMgKGNvbmRpdGlvbmFsbHkgaW5j
bHVkZWQpCi0rQEdTU19TWU1CT0xTQAotKyAgICAjIERFUyBjcnlwdG8gc3ltYm9scyAoY29uZGl0
aW9uYWxseSBpbmNsdWRlZCkKLStAREVTX1NZTUJPTFNACi0rICAgICMgUlBDIGRhdGFiYXNlIHN5
bWJvbHMgKGNvbmRpdGlvbmFsbHkgaW5jbHVkZWQpCi0rQFJQQ0RCX1NZTUJPTFNACi0rCi0rICBs
b2NhbDoKLSsgICAgKjsKLSt9OwotKwotK1RJUlBDXzAuMy4xIHsKLSsjIEdTUy1BUEkgc3ltYm9s
cyAoY29uZGl0aW9uYWxseSBpbmNsdWRlZCkKLStAR1NTX1NZTUJPTFNfMDMxQAotK30gVElSUENf
MC4zLjA7Ci0rCi0rVElSUENfMC4zLjIgewotKyAgICBnZXRuZXRuYW1lOwotKyAgICBnZXRwdWJs
aWNhbmRwcml2YXRla2V5OwotKyAgICBnZXRwdWJsaWNrZXk7Ci0rICAgIGhvc3QybmV0bmFtZTsK
LSsgICAga2V5X2RlY3J5cHRzZXNzaW9uOwotKyAgICBrZXlfZGVjcnlwdHNlc3Npb25fcGs7Ci0r
ICAgIGtleV9lbmNyeXB0c2Vzc2lvbjsKLSsgICAga2V5X2VuY3J5cHRzZXNzaW9uX3BrOwotKyAg
ICBrZXlfZ2VuZGVzOwotKyAgICBrZXlfZ2V0X2NvbnY7Ci0rICAgIGtleV9zZXRzZWNyZXQ7Ci0r
ICAgIGtleV9zZWNyZXRrZXlfaXNfc2V0OwotKyAgICBrZXlfc2V0bmV0OwotKyAgICBuZXRuYW1l
Mmhvc3Q7Ci0rICAgIG5ldG5hbWUydXNlcjsKLSsgICAgcnRpbWU7Ci0rICAgIHVzZXIybmV0bmFt
ZTsKLSsgICAgeGRyX2NyeXB0a2V5YXJnOwotKyAgICB4ZHJfY3J5cHRrZXlhcmcyOwotKyAgICB4
ZHJfY3J5cHRrZXlyZXM7Ci0rICAgIHhkcl9nZXRjcmVkcmVzOwotKyAgICB4ZHJfa2V5X25ldHN0
YXJnOwotKyAgICB4ZHJfa2V5X25ldHN0cmVzOwotKyAgICB4ZHJfa2V5YnVmOwotKyAgICB4ZHJf
a2V5c3RhdHVzOwotKyAgICB4ZHJfbmV0bmFtZXN0cjsKLSsgICAgeGRyX3VuaXhjcmVkOwotK30g
VElSUENfMC4zLjE7Ci0rCi0rVElSUENfMC4zLjMgewotKyAgICBfX2dldHB1YmxpY2tleV9MT0NB
TDsKLSsgICAgX19rZXlfZGVjcnlwdHNlc3Npb25fcGtfTE9DQUw7Ci0rICAgIF9fa2V5X2VuY3J5
cHRzZXNzaW9uX3BrX0xPQ0FMOwotKyAgICBfX2tleV9nZW5kZXNfTE9DQUw7Ci0rICAgIHhkcl9z
aXplb2Y7Ci0rICAgIGF1dGhkZXNfcGtfY3JlYXRlOwotKyAgICBzdmNfcG9sbGZkOwotKyAgICBz
dmNfbWF4X3BvbGxmZDsKLSt9IFRJUlBDXzAuMy4yOwotKwotK1RJUlBDX1BSSVZBVEUgewotKyAg
Z2xvYmFsOgotKyAgICBfX2xpYmNfY2xudHVkcF9idWZjcmVhdGU7Ci0rICAjIHByaXZhdGUsIGJ1
dCB1c2VkIGJ5IHJwY2JpbmQ6Ci0rICAgIF9fc3ZjX2NsZWFuX2lkbGU7IHN2Y19hdXRoX25vbmU7
IGxpYnRpcnBjX3NldF9kZWJ1ZzsKLSt9OwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2xpYnRpcnBjL2xpYnRpcnBjLzAwMDEtVXBkYXRlLWRlY2xhcmF0aW9ucy10by1hbGxvdy1j
b21waWxlLXdpdGgtZ2NjLTE1LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBj
L2xpYnRpcnBjLzAwMDEtVXBkYXRlLWRlY2xhcmF0aW9ucy10by1hbGxvdy1jb21waWxlLXdpdGgt
Z2NjLTE1LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA3YmZlN2MyOTI0Li4w
MDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy9saWJ0aXJwYy8w
MDAxLVVwZGF0ZS1kZWNsYXJhdGlvbnMtdG8tYWxsb3ctY29tcGlsZS13aXRoLWdjYy0xNS5wYXRj
aAorKysgL2Rldi9udWxsCkBAIC0xLDY0ICswLDAgQEAKLUZyb20gYjUyNmMwYTkwOTUzZjQ3ZDRj
YmY3ZWYwMWU5YWMxM2U5ZTc2OTA0YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFJ1
ZGkgSGVpdGJhdW0gPHJ1ZGlAaGVpdGJhdW0uY29tPgotRGF0ZTogVGh1LCAxMiBEZWMgMjAyNCAw
NDoxNjowMiAtMDUwMAotU3ViamVjdDogW1BBVENIIDEvMl0gVXBkYXRlIGRlY2xhcmF0aW9ucyB0
byBhbGxvdyBjb21waWxlIHdpdGggZ2NjLTE1Ci0KLVRoaXMgcGF0Y2ggZml4ZXMgc29tZSBvZiB0
aGUgY29tcGlsZSBlcnJvcnMgd2l0aCBnY2MgMTUtMjAyNDExMTcuCi0KLUluIGFkZGl0aW9uIHRo
ZSBmb2xsb3cgZGVjbGFyYXRpb25zIG5lZWQgdG8gYmUgZml4ZWQ6Ci0gIHNlZCAtbiA3NSw3N3Ag
bGlidGlycGMtMS4zLjYvc3JjL2tleV9jYWxsLmMKLSAgY3J5cHRrZXlyZXMgKigqX19rZXlfZW5j
cnlwdHNlc3Npb25fcGtfTE9DQUwpKCkgPSAwOwotICBjcnlwdGtleXJlcyAqKCpfX2tleV9kZWNy
eXB0c2Vzc2lvbl9wa19MT0NBTCkoKSA9IDA7Ci0gIGRlc19ibG9jayAqKCpfX2tleV9nZW5kZXNf
TE9DQUwpKCkgPSAwOwotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdC5s
aW51eC1uZnMub3JnLz9wPXN0ZXZlZC9saWJ0aXJwYy5naXQ7YT1jb21taXQ7aD1kNDczZjFlMWY2
YmE4MGJmYWVlNGRhYTA1OGRhMTU5MzA1MTY3MzIzXQotU2lnbmVkLW9mZi1ieTogUnVkaSBIZWl0
YmF1bSA8cnVkaUBoZWl0YmF1bS5jb20+Ci1TaWduZWQtb2ZmLWJ5OiBTdGV2ZSBEaWNrc29uIDxz
dGV2ZWRAcmVkaGF0LmNvbT4KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+Ci0tLS0KLSBzcmMvYXV0aF9ub25lLmMgICAgIHwgMiArLQotIHNyYy9nZXRwdWJsaWNr
ZXkuYyAgfCAyICstCi0gc3JjL3N2Y19hdXRoX25vbmUuYyB8IDQgKystLQotIDMgZmlsZXMgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvc3Jj
L2F1dGhfbm9uZS5jIGIvc3JjL2F1dGhfbm9uZS5jCi1pbmRleCAwYjBiYmQxLi5hY2E2ZTcxIDEw
MDY0NAotLS0tIGEvc3JjL2F1dGhfbm9uZS5jCi0rKysgYi9zcmMvYXV0aF9ub25lLmMKLUBAIC02
Miw3ICs2Miw3IEBAIHN0YXRpYyBib29sX3QgYXV0aG5vbmVfdmFsaWRhdGUgKEFVVEggKiwgc3Ry
dWN0IG9wYXF1ZV9hdXRoICopOwotIHN0YXRpYyBib29sX3QgYXV0aG5vbmVfcmVmcmVzaCAoQVVU
SCAqLCB2b2lkICopOwotIHN0YXRpYyB2b2lkIGF1dGhub25lX2Rlc3Ryb3kgKEFVVEggKik7Ci0g
Ci0tZXh0ZXJuIGJvb2xfdCB4ZHJfb3BhcXVlX2F1dGgoKTsKLStleHRlcm4gYm9vbF90IHhkcl9v
cGFxdWVfYXV0aChYRFIgKiwgc3RydWN0IG9wYXF1ZV9hdXRoICopOwotIAotIHN0YXRpYyBzdHJ1
Y3QgYXV0aF9vcHMgKmF1dGhub25lX29wcygpOwotIAotZGlmZiAtLWdpdCBhL3NyYy9nZXRwdWJs
aWNrZXkuYyBiL3NyYy9nZXRwdWJsaWNrZXkuYwotaW5kZXggYmUzN2EyNC4uNGU5NmM3YyAxMDA2
NDQKLS0tLSBhL3NyYy9nZXRwdWJsaWNrZXkuYwotKysrIGIvc3JjL2dldHB1YmxpY2tleS5jCi1A
QCAtNTIsNyArNTIsNyBAQAotIC8qCi0gICogSGFjayB0byBsZXQgeXBzZXJ2L3JwYy5uaXNkIHVz
ZSBBVVRIX0RFUy4KLSAgKi8KLS1pbnQgKCpfX2dldHB1YmxpY2tleV9MT0NBTCkoKSA9IDA7Ci0r
aW50ICgqX19nZXRwdWJsaWNrZXlfTE9DQUwpKGNvbnN0IGNoYXIgKiwgY2hhciAqKSA9IDA7Ci0g
Ci0gLyoKLSAgKiBHZXQgc29tZWJvZHkncyBwdWJsaWMga2V5Ci1kaWZmIC0tZ2l0IGEvc3JjL3N2
Y19hdXRoX25vbmUuYyBiL3NyYy9zdmNfYXV0aF9ub25lLmMKLWluZGV4IDg4N2U4MDkuLjVjYTk4
ZTkgMTAwNjQ0Ci0tLS0gYS9zcmMvc3ZjX2F1dGhfbm9uZS5jCi0rKysgYi9zcmMvc3ZjX2F1dGhf
bm9uZS5jCi1AQCAtMzcsOCArMzcsOCBAQAotIAotICNpbmNsdWRlIDxycGMvcnBjLmg+Ci0gCi0t
c3RhdGljIGJvb2xfdAlzdmNhdXRoX25vbmVfZGVzdHJveSgpOwotLXN0YXRpYyBib29sX3QgICBz
dmNhdXRoX25vbmVfd3JhcCgpOwotK3N0YXRpYyBib29sX3QJc3ZjYXV0aF9ub25lX2Rlc3Ryb3ko
U1ZDQVVUSCAqKTsKLStzdGF0aWMgYm9vbF90ICAgc3ZjYXV0aF9ub25lX3dyYXAoU1ZDQVVUSCAq
LCBYRFIgKiwgYm9vbF90ICgqKShYRFIgKiwgLi4uKSwgY2hhciAqKTsKLSAKLSBzdHJ1Y3Qgc3Zj
X2F1dGhfb3BzIHN2Y19hdXRoX25vbmVfb3BzID0gewotIAlzdmNhdXRoX25vbmVfd3JhcCwKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy9saWJ0aXJwYy8wMDAyLXVw
ZGF0ZS1zaWduYWwtYW5kLWtleV9jYWxsLWRlY2xhcmF0aW9ucy10by1hbGxvdy1jb20ucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlidGlycGMvbGlidGlycGMvMDAwMi11cGRhdGUtc2ln
bmFsLWFuZC1rZXlfY2FsbC1kZWNsYXJhdGlvbnMtdG8tYWxsb3ctY29tLnBhdGNoCmRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCA4M2UyMTA1YTFhLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy9saWJ0aXJwYy8wMDAyLXVwZGF0ZS1zaWduYWwtYW5k
LWtleV9jYWxsLWRlY2xhcmF0aW9ucy10by1hbGxvdy1jb20ucGF0Y2gKKysrIC9kZXYvbnVsbApA
QCAtMSw2MCArMCwwIEBACi1Gcm9tIDU1NDUyZTZhZTcxODY5ODgwZjhjODVkNWRiYTlhYTI0ZDcx
NDdkOGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBSdWRpIEhlaXRiYXVtIDxydWRp
QGhlaXRiYXVtLmNvbT4KLURhdGU6IFRodSwgMiBKYW4gMjAyNSAwODo0NjoyNCAtMDUwMAotU3Vi
amVjdDogW1BBVENIIDIvMl0gdXBkYXRlIHNpZ25hbCBhbmQga2V5X2NhbGwgZGVjbGFyYXRpb25z
IHRvIGFsbG93IGNvbXBpbGUKLSB3aXRoIGdjYy0xNQotCi1Gb2xsb3cgdXAgcGF0Y2ggYWRkcmVz
c2luZyB0aGUgZm9sbG93aW5nIGRlY2xhcmF0aW9uczoKLSAgc2VkIC1uIDc1LDc3cCBsaWJ0aXJw
Yy0xLjMuNi9zcmMva2V5X2NhbGwuYwotICBjcnlwdGtleXJlcyAqKCpfX2tleV9lbmNyeXB0c2Vz
c2lvbl9wa19MT0NBTCkoKSA9IDA7Ci0gIGNyeXB0a2V5cmVzICooKl9fa2V5X2RlY3J5cHRzZXNz
aW9uX3BrX0xPQ0FMKSgpID0gMDsKLSAgZGVzX2Jsb2NrICooKl9fa2V5X2dlbmRlc19MT0NBTCko
KSA9IDA7Ci0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0LmxpbnV4LW5m
cy5vcmcvP3A9c3RldmVkL2xpYnRpcnBjLmdpdDthPWNvbW1pdDtoPTI0MGVlNmM3NzQ3MjljOWMy
NDgxMmFhODkxMmYxZmNmODk5NmIxNjJdCi1TaWduZWQtb2ZmLWJ5OiBSdWRpIEhlaXRiYXVtIDxy
dWRpQGhlaXRiYXVtLmNvbT4KLVNpZ25lZC1vZmYtYnk6IFN0ZXZlIERpY2tzb24gPHN0ZXZlZEBy
ZWRoYXQuY29tPgotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4K
LS0tLQotIHNyYy9hdXRoX3RpbWUuYyB8IDQgKystLQotIHNyYy9rZXlfY2FsbC5jICB8IDYgKysr
LS0tCi0gMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCi0K
LWRpZmYgLS1naXQgYS9zcmMvYXV0aF90aW1lLmMgYi9zcmMvYXV0aF90aW1lLmMKLWluZGV4IDkz
NmRkNzYuLmMyMWIxZGYgMTAwNjQ0Ci0tLS0gYS9zcmMvYXV0aF90aW1lLmMKLSsrKyBiL3NyYy9h
dXRoX3RpbWUuYwotQEAgLTI0OCw3ICsyNDgsNyBAQCBfX3JwY19nZXRfdGltZV9vZmZzZXQodGQs
IHNydiwgdGhvc3QsIHVhZGRyLCBuZXRpZCkKLSAJY2hhcgkJCXV0WzY0XSwgaXB1YWRkcls2NF07
Ci0gCWVuZHBvaW50CQl0ZXBzWzMyXTsKLSAJbmlzX3NlcnZlcgkJdHNydjsKLS0Jdm9pZAkJCSgq
b2xkc2lnKSgpID0gTlVMTDsgLyogb2xkIGFsYXJtIGhhbmRsZXIgKi8KLSsJdm9pZAkJCSgqb2xk
c2lnKShpbnQpID0gTlVMTDsgLyogb2xkIGFsYXJtIGhhbmRsZXIgKi8KLSAJc3RydWN0IHNvY2th
ZGRyX2luCXNpbjsKLSAJaW50CQkJcyA9IFJQQ19BTllTT0NLOwotIAlzb2NrbGVuX3QgbGVuOwot
QEAgLTQxNyw3ICs0MTcsNyBAQCBfX3JwY19nZXRfdGltZV9vZmZzZXQodGQsIHNydiwgdGhvc3Qs
IHVhZGRyLCBuZXRpZCkKLSAJCX0gZWxzZSB7Ci0gCQkJaW50IHJlczsKLSAKLS0JCQlvbGRzaWcg
PSAodm9pZCAoKikoKSlzaWduYWwoU0lHQUxSTSwgYWxhcm1faG5kbGVyKTsKLSsJCQlvbGRzaWcg
PSAodm9pZCAoKikoaW50KSlzaWduYWwoU0lHQUxSTSwgYWxhcm1faG5kbGVyKTsKLSAJCQlzYXdf
YWxhcm0gPSAwOyAvKiBnbG9iYWwgdHJhY2tpbmcgdGhlIGFsYXJtICovCi0gCQkJYWxhcm0oMjAp
OyAvKiBvbmx5IHdhaXQgMjAgc2Vjb25kcyAqLwotIAkJCXJlcyA9IGNvbm5lY3QocywgKHN0cnVj
dCBzb2NrYWRkciAqKSZzaW4sIHNpemVvZihzaW4pKTsKLWRpZmYgLS1naXQgYS9zcmMva2V5X2Nh
bGwuYyBiL3NyYy9rZXlfY2FsbC5jCi1pbmRleCA5ZjRiMWQyLi40M2Y5OTBlIDEwMDY0NAotLS0t
IGEvc3JjL2tleV9jYWxsLmMKLSsrKyBiL3NyYy9rZXlfY2FsbC5jCi1AQCAtNzIsOSArNzIsOSBA
QAotICAqIGltcGxlbWVudGF0aW9ucyBvZiB0aGVzZSBmdW5jdGlvbnMsIGFuZCB0byBjYWxsIHRo
b3NlIGluIGtleV9jYWxsKCkuCi0gICovCi0gCi0tY3J5cHRrZXlyZXMgKigqX19rZXlfZW5jcnlw
dHNlc3Npb25fcGtfTE9DQUwpKCkgPSAwOwotLWNyeXB0a2V5cmVzICooKl9fa2V5X2RlY3J5cHRz
ZXNzaW9uX3BrX0xPQ0FMKSgpID0gMDsKLS1kZXNfYmxvY2sgKigqX19rZXlfZ2VuZGVzX0xPQ0FM
KSgpID0gMDsKLStjcnlwdGtleXJlcyAqKCpfX2tleV9lbmNyeXB0c2Vzc2lvbl9wa19MT0NBTCko
dWlkX3QsIGNoYXIgKikgPSAwOwotK2NyeXB0a2V5cmVzICooKl9fa2V5X2RlY3J5cHRzZXNzaW9u
X3BrX0xPQ0FMKSh1aWRfdCwgY2hhciAqKSA9IDA7Ci0rZGVzX2Jsb2NrICooKl9fa2V5X2dlbmRl
c19MT0NBTCkodWlkX3QsIGNoYXIgKikgPSAwOwotIAotIHN0YXRpYyBpbnQga2V5X2NhbGwoIHVf
bG9uZywgeGRycHJvY190LCB2b2lkICosIHhkcnByb2NfdCwgdm9pZCAqKTsKLSAKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy9saWJ0aXJwY18xLjMuNi5iYiBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy9saWJ0aXJwY18xLjMuNy5iYgpzaW1pbGFyaXR5
IGluZGV4IDgyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlidGlycGMvbGli
dGlycGNfMS4zLjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy9s
aWJ0aXJwY18xLjMuNy5iYgppbmRleCBjNjkwMTgzOWMxLi5lODVmOTVlNmZkIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlidGlycGMvbGlidGlycGNfMS4zLjYuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRpcnBjXzEuMy43LmJiCkBAIC0xMCwx
MyArMTAsMTEgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9ZjgzNWNj
ZTg4NTI0ODFlNGIyYmJiZGQyM2I1ZTQ3ZjMgXAogUFJPVklERVMgPSAidmlydHVhbC9saWJycGMi
CiAKIFNSQ19VUkkgPSAiJHtTT1VSQ0VGT1JHRV9NSVJST1J9LyR7QlBOfS8ke0JQfS50YXIuYnoy
IFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtVXBkYXRlLWRlY2xhcmF0aW9ucy10by1hbGxvdy1j
b21waWxlLXdpdGgtZ2NjLTE1LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDItdXBkYXRl
LXNpZ25hbC1hbmQta2V5X2NhbGwtZGVjbGFyYXRpb25zLXRvLWFsbG93LWNvbS5wYXRjaCBcCiAg
ICAgICAgICAgIGZpbGU6Ly8wMDAxLUFkZC1jb25kaXRpb25hbC12ZXJzaW9uLXNjcmlwdC1zdXBw
b3J0LnBhdGNoIFwKLSAgICAgICAgICAiCisgICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNLX1VS
SSA9ICJodHRwczovL3NvdXJjZWZvcmdlLm5ldC9wcm9qZWN0cy9saWJ0aXJwYy9maWxlcy9saWJ0
aXJwYy8iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICIoP1A8cHZlcj5cZCsoXC5cZCspKykvIgot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImJiZDI2YThmMGRmNTY5MGE2MmE0N2Y2YWEzMGY3OTdmM2Vm
OGQwMjU2MGQxYmM0NDlhODMwNjZiNWExZDM1MDgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjQ3
ZDNhYzE5ZDM1NDllNTRhMDVkMDAxOWE2YzQwMDY3NGRhNzE2MTIzODU4Y2ZkYjZkM2JkZDcwYTY2
YzcwMiIKIAogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnCiAKLS0gCjIuNDcuMQoK

--===============2615800320967221377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libtirpc: PV changed from "1.3.6" to "1.3.7"
packages/x86-64-v3-poky-linux/libtirpc: SRC_URI changed from "https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.6.tar.bz2 file://0001-Update-declarations-to-allow-compile-with-gcc-15.patch file://0002-update-signal-and-key_call-declarations-to-allow-com.patch file://0001-Add-conditional-version-script-support.patch" to "https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.7.tar.bz2 file://0001-Add-conditional-version-script-support.patch"
packages/x86-64-v3-poky-linux/libtirpc: PKGV changed from 1.3.6 [default] to 1.3.7 [default]
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-dbg: PV changed from "1.3.6" to "1.3.7"
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-dbg: PKGSIZE changed from 583336 to 583208 (-0%)
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-dbg: PKGV changed from 1.3.6 [default] to 1.3.7 [default]
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-dev: PV changed from "1.3.6" to "1.3.7"
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-dev: PKGV changed from 1.3.6 [default] to 1.3.7 [default]
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-doc: PV changed from "1.3.6" to "1.3.7"
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-doc: PKGV changed from 1.3.6 [default] to 1.3.7 [default]
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-locale: PV changed from "1.3.6" to "1.3.7"
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-locale: PKGV changed from 1.3.6 [default] to 1.3.7 [default]
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-src: PV changed from "1.3.6" to "1.3.7"
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-src: PKGV changed from 1.3.6 [default] to 1.3.7 [default]
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-staticdev: PV changed from "1.3.6" to "1.3.7"
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-staticdev: PKGV changed from 1.3.6 [default] to 1.3.7 [default]
packages/x86-64-v3-poky-linux/libtirpc/libtirpc: PV changed from "1.3.6" to "1.3.7"
packages/x86-64-v3-poky-linux/libtirpc/libtirpc: PKGV changed from 1.3.6 [default] to 1.3.7 [default]

--===============2615800320967221377==--

