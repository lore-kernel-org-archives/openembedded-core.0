Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B3ECCD1A2
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:34 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.17914.1759325528936938531
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cNoUiR2W;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dvoxlZQo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101999ff96891-3bd89763-d7d9-4709-906d-a2545f232aa8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325546;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZpYmUihmKX3YdtsYkCEYVqCBtYN9bQnJTbhoDuOrwFE=;
	b=cNoUiR2WAt97eWIpxIOdARNkXdaUQaDvwpDtN4QgYN1+DHnMN/lXTZOZYOZlW1U4
	JX4IXRN0Z3X8zFjSsUrcgqvNOwV0IrAmoZA6N3LoocbrDy1gFyWBH+eZO54cTLJO/oe
	CMI9HsAHgDsnhjPtmxccZ8/G9iw9Txqs5XiXhagg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325546;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZpYmUihmKX3YdtsYkCEYVqCBtYN9bQnJTbhoDuOrwFE=;
	b=dvoxlZQojXfCCfFKXhfmB8em0OHjTGcRKoePLnElSeEYKRCI1u6AJDzAgaK29OTa
	EDSgJ5UML7K4WFGFJvPkAmZkILvEIWM+RvZdvcSryNOZDN7wZh1mRtD8fOuL+fE0DAf
	E5DX/3ladgy1L0dzj3KJEJG1v7TTs6z7PWdSt0Aw=
Content-Type: multipart/mixed; boundary="===============4135393879383859504=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libtirpc: upgrading to 1.3.7 SUCCEEDED
Message-ID: <010101999ff96891-3bd89763-d7d9-4709-906d-a2545f232aa8-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224262

--===============4135393879383859504==
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
From 90def8ba9af31d55a5aa0ea1275e31404de2ddea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 10:15:55 +0000
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
index 2764f65284..471fa1035a 100644
--- a/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-script-support.patch
+++ b/meta/recipes-extended/libtirpc/libtirpc/0001-Add-conditional-version-script-support.patch
@@ -1,4 +1,4 @@
-From 8ae9a335d56fc4aba8454159b326d809efca597f Mon Sep 17 00:00:00 2001
+From 2cdfcf20297c2f85b02d93a2146ced3244ac951e Mon Sep 17 00:00:00 2001
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


--===============4135393879383859504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libtirpc: PV changed from "1.3.6" to "1.3.7"
packages/x86-64-v3-poky-linux/libtirpc: SRC_URI changed from "https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.6.tar.bz2 file://0001-Update-declarations-to-allow-compile-with-gcc-15.patch file://0002-update-signal-and-key_call-declarations-to-allow-com.patch file://0001-Add-conditional-version-script-support.patch" to "https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.7.tar.bz2 file://0001-Add-conditional-version-script-support.patch"
packages/x86-64-v3-poky-linux/libtirpc: PKGV changed from 1.3.6 [default] to 1.3.7 [default]
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-dbg: PV changed from "1.3.6" to "1.3.7"
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-dbg: PKGV changed from 1.3.6 [default] to 1.3.7 [default]
packages/x86-64-v3-poky-linux/libtirpc/libtirpc-dbg: PKGSIZE changed from 583336 to 583208 (-0%)
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

--===============4135393879383859504==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtirpc-upgrade-1.3.6-1.3.7.patch"

RnJvbSA5MGRlZjhiYTlhZjMxZDU1YTVhYTBlYTEyNzVlMzE0MDRkZTJkZGVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAxMDoxNTo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnRpcnBjOiB1cGdyYWRlIDEuMy42IC0+IDEuMy43CgotLS0KIC4uLmQtY29uZGl0aW9uYWwtdmVy
c2lvbi1zY3JpcHQtc3VwcG9ydC5wYXRjaCB8IDUwNSArLS0tLS0tLS0tLS0tLS0tLS0KIC4uLnJh
dGlvbnMtdG8tYWxsb3ctY29tcGlsZS13aXRoLWdjYy0xNS5wYXRjaCB8ICA2NCAtLS0KIC4uLmQt
a2V5X2NhbGwtZGVjbGFyYXRpb25zLXRvLWFsbG93LWNvbS5wYXRjaCB8ICA2MCAtLS0KIC4uLi97
bGlidGlycGNfMS4zLjYuYmIgPT4gbGlidGlycGNfMS4zLjcuYmJ9ICB8ICAgNiArLQogNCBmaWxl
cyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA2MTcgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRpcnBjLzAwMDEtVXBk
YXRlLWRlY2xhcmF0aW9ucy10by1hbGxvdy1jb21waWxlLXdpdGgtZ2NjLTE1LnBhdGNoCiBkZWxl
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRpcnBjLzAw
MDItdXBkYXRlLXNpZ25hbC1hbmQta2V5X2NhbGwtZGVjbGFyYXRpb25zLXRvLWFsbG93LWNvbS5w
YXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy97bGlidGlycGNfMS4z
LjYuYmIgPT4gbGlidGlycGNfMS4zLjcuYmJ9ICg4MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRpcnBjLzAwMDEtQWRkLWNvbmRpdGlvbmFsLXZlcnNp
b24tc2NyaXB0LXN1cHBvcnQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlidGlycGMv
bGlidGlycGMvMDAwMS1BZGQtY29uZGl0aW9uYWwtdmVyc2lvbi1zY3JpcHQtc3VwcG9ydC5wYXRj
aAppbmRleCAyNzY0ZjY1Mjg0Li40NzFmYTEwMzVhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbGlidGlycGMvbGlidGlycGMvMDAwMS1BZGQtY29uZGl0aW9uYWwtdmVyc2lvbi1z
Y3JpcHQtc3VwcG9ydC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlidGlycGMv
bGlidGlycGMvMDAwMS1BZGQtY29uZGl0aW9uYWwtdmVyc2lvbi1zY3JpcHQtc3VwcG9ydC5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOGFlOWEzMzVkNTZmYzRhYmE4NDU0MTU5YjMyNmQ4MDll
ZmNhNTk3ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMmNkZmNmMjAyOTdjMmY4NWIw
MmQ5M2EyMTQ2Y2VkMzI0NGFjOTUxZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDExIEF1ZyAyMDI1IDIxOjEz
OjU5IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBjb25kaXRpb25hbCB2ZXJzaW9uIHNjcmlw
dCBzdXBwb3J0CkBAIC0yMiwxNTEgKzIyLDE2IEBAIEZpeGVzIGxpbmtpbmcgZXJyb3JzIHdoZW4g
dGhlc2UgZmVhdHVyZXMgYXJlIG5vdCBhdmFpbGFibGUuCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1p
dHRlZCBbaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbmZzLzIwMjUwODEyMTgwODA5LjIx
ODIzMDEtMS1yYWoua2hlbUBnbWFpbC5jb20vVC8jdV0KIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+CiAtLS0KLSBjb25maWd1cmUuYWMgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgNTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrCi0gc3JjL01ha2VmaWxl
LmFtICAgICAgICAgICAgICAgICAgICAgICB8IDIxICsrKysrKysrKy0tCi0gc3JjL3tsaWJ0aXJw
Yy5tYXAgPT4gbGlidGlycGMubWFwLmlufSB8IDQ4ICsrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0K
LSAzIGZpbGVzIGNoYW5nZWQsIDc3IGluc2VydGlvbnMoKyksIDQyIGRlbGV0aW9ucygtKQotIHJl
bmFtZSBzcmMve2xpYnRpcnBjLm1hcCA9PiBsaWJ0aXJwYy5tYXAuaW59ICg4NCUpCisgc3JjL2xp
YnRpcnBjLm1hcCB8IDMwMyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQorIDEgZmlsZSBjaGFuZ2VkLCAzMDMgZGVsZXRpb25zKC0pCisgZGVsZXRlIG1vZGUg
MTAwNjQ0IHNyYy9saWJ0aXJwYy5tYXAKIAotLS0tIGEvY29uZmlndXJlLmFjCi0rKysgYi9jb25m
aWd1cmUuYWMKLUBAIC03Nyw2ICs3NywxOSBAQCBpZiB0ZXN0ICJ4JGVuYWJsZV9pcHY2IiAhPSB4
bm87IHRoZW4KLSAJQUNfREVGSU5FKElORVQ2LCAxLCBbRGVmaW5lIHRvIDEgaWYgSVB2NiBpcyBh
dmFpbGFibGVdKQotIGZpCi0gCi0rIyBSUEMgZGF0YWJhc2Ugc3VwcG9ydAotK0FDX0FSR19FTkFC
TEUocnBjZGIsCi0rICAgIFtBU19IRUxQX1NUUklORyhbLS1lbmFibGUtcnBjZGJdLCBbRW5hYmxl
IFJQQyBEYXRhYmFzZSBzdXBwb3J0IEA8OkBkZWZhdWx0PW5vQDo+QF0pXSwKLSsgICAgW10sIFtl
bmFibGVfcnBjZGI9bm9dKQotK0FNX0NPTkRJVElPTkFMKFJQQ0RCLCB0ZXN0ICJ4JGVuYWJsZV9y
cGNkYiIgPSB4eWVzKQotK2lmIHRlc3QgIngkZW5hYmxlX3JwY2RiIiAhPSAieG5vIjsgdGhlbgot
KyAgICBBQ19DSEVDS19GVU5DUyhbZ2V0cnBjZW50IGdldHJwY2J5bmFtZSBnZXRycGNieW51bWJl
cl0sIFtoYXZlX3JwY2RiPXllc10pCi0rCi0rICAgIGlmIHRlc3QgIngkaGF2ZV9ycGNkYiIgPSAi
eHllcyI7IHRoZW4KLSsgICAgICAgIEFDX0RFRklORShbUlBDREJdLCBbMV0sIFtEZWZpbmUgaWYg
UlBDIGRhdGFiYXNlIHN1cHBvcnQgaXMgYXZhaWxhYmxlXSkKLSsgICAgZmkKLStmaQotKwotIEFD
X0FSR19FTkFCTEUoc3ltdmVycywKLSAJW0FTX0hFTFBfU1RSSU5HKFstLWRpc2FibGUtc3ltdmVy
c10sW0Rpc2FibGUgc3ltYm9sIHZlcnNpb25pbmcgQDw6QGRlZmF1bHQ9bm9AOj5AXSldLAotICAg
ICAgIFtdLFtlbmFibGVfc3ltdmVycz1tYXliZV0pCi1AQCAtOTcsNiArMTEwLDMzIEBAIGZpCi0g
Ci0gQU1fQ09ORElUSU9OQUwoU1lNVkVSUywgdGVzdCAieCRlbmFibGVfc3ltdmVycyIgPSB4eWVz
KQotIAotKyMgR2VuZXJhdGUgc3ltYm9sIGxpc3RzIGZvciB2ZXJzaW9uIHNjcmlwdAotK2lmIHRl
c3QgIngkZW5hYmxlX2dzc2FwaSIgPSAieHllcyI7IHRoZW4KLSsgICAgR1NTX1NZTUJPTFM9Il9z
dmNhdXRoX2dzczsgYXV0aGdzc19jcmVhdGU7IGF1dGhnc3NfY3JlYXRlX2RlZmF1bHQ7IGF1dGhn
c3NfZnJlZV9wcml2YXRlX2RhdGE7IGF1dGhnc3NfZ2V0X3ByaXZhdGVfZGF0YTsgYXV0aGdzc19z
ZXJ2aWNlOyBnc3NfbG9nX2RlYnVnOyBnc3NfbG9nX2hleGR1bXA7IGdzc19sb2dfc3RhdHVzOyBy
cGNfZ3NzX2dldF9lcnJvcjsgcnBjX2dzc19nZXRfbWVjaF9pbmZvOyBycGNfZ3NzX2dldF9tZWNo
YW5pc21zOyBycGNfZ3NzX2dldF9wcmluY2lwYWxfbmFtZTsgcnBjX2dzc19nZXRfdmVyc2lvbnM7
IHJwY19nc3NfcW9wX3RvX251bTsgcnBjX2dzc19zZWNjcmVhdGU7IHJwY19nc3Nfc2V0X2NhbGxi
YWNrOyBycGNfZ3NzX3NldF9kZWZhdWx0czsgcnBjX2dzc19zZXRfc3ZjX25hbWU7IHJwY19nc3Nf
c3ZjX21heF9kYXRhX2xlbmd0aDsiCi0rCi0rICAgIEdTU19TWU1CT0xTXzAzMT0ic3ZjYXV0aF9n
c3NfZ2V0X3ByaW5jaXBhbDsgc3ZjYXV0aF9nc3Nfc2V0X3N2Y19uYW1lOyIKLStlbHNlCi0rICAg
IEdTU19TWU1CT0xTPSIiCi0rICAgIEdTU19TWU1CT0xTXzAzMT0iIgotK2ZpCi0rCi0raWYgdGVz
dCAieCRlbmFibGVfYXV0aGRlcyIgPSAieHllcyI7IHRoZW4KLSsgICAgREVTX1NZTUJPTFM9ImNi
Y19jcnlwdDsgZWNiX2NyeXB0OyB4ZHJfYXV0aGRlc19jcmVkOyB4ZHJfYXV0aGRlc192ZXJmOyB4
ZHJfcnBjX2dzc19jcmVkOyB4ZHJfcnBjX2dzc19kYXRhOyB4ZHJfcnBjX2dzc19pbml0X2FyZ3M7
IHhkcl9ycGNfZ3NzX2luaXRfcmVzOyIKLStlbHNlCi0rICAgIERFU19TWU1CT0xTPSIiCi0rZmkK
LSsKLStpZiB0ZXN0ICJ4JGVuYWJsZV9ycGNkYiIgPSAieHllcyI7IHRoZW4KLSsgICAgUlBDREJf
U1lNQk9MUz0iZW5kcnBjZW50OyBnZXRycGNlbnQ7IGdldHJwY2J5bnVtYmVyOyBnZXRycGNieW5h
bWU7IHNldHJwY2VudDsiCi0rZWxzZQotKyAgICBSUENEQl9TWU1CT0xTPSIiCi0rZmkKLSsKLStB
Q19TVUJTVChbR1NTX1NZTUJPTFNdKQotK0FDX1NVQlNUKFtHU1NfU1lNQk9MU18wMzFdKQotK0FD
X1NVQlNUKFtERVNfU1lNQk9MU10pCi0rQUNfU1VCU1QoW1JQQ0RCX1NZTUJPTFNdKQotKwotIEFD
X0NBTk9OSUNBTF9CVUlMRAotICMgQ2hlY2sgZm9yIHdoaWNoIGhvc3Qgd2UgYXJlIG9uIGFuZCBz
ZXR1cCBhIGZldyB0aGluZ3MKLSAjIHNwZWNpZmljYWxseSBiYXNlZCBvbiB0aGUgaG9zdAotQEAg
LTE2Nyw3ICsyMDcsMTYgQEAgQUNfQ0hFQ0tfRlVOQ1MoW2dldHBlZXJlaWQgZ2V0cnBjYnluYW1l
Ci0gQUNfQ0hFQ0tfVFlQRVMoc3RydWN0IHJwY2VudCwsLCBbCi0gICAgICAgI2luY2x1ZGUgPG5l
dGRiLmg+XSkKLSBBQ19DT05GSUdfRklMRVMoW01ha2VmaWxlIHNyYy9NYWtlZmlsZSBtYW4vTWFr
ZWZpbGUgZG9jL01ha2VmaWxlXSkKLStBQ19DT05GSUdfRklMRVMoW3NyYy9saWJ0aXJwYy5tYXBd
KQotIEFDX0NPTkZJR19GSUxFUyhbbGlidGlycGMucGNdKQotIEFDX09VVFBVVAotIAotKyMgQ29u
ZmlndXJhdGlvbiBzdW1tYXJ5Ci0rQUNfTVNHX05PVElDRShbCi0rbGlidGlycGMgY29uZmlndXJh
dGlvbiBzdW1tYXJ5OgotKyAgR1NTLUFQSSBzdXBwb3J0OiAkZW5hYmxlX2dzc2FwaQotKyAgREVT
IGNyeXB0byBzdXBwb3J0OiAkZW5hYmxlX2F1dGhkZXMKLSsgIFJQQyBkYXRhYmFzZSBzdXBwb3J0
OiAkZW5hYmxlX3JwY2RiCi0rICBTeW1ib2wgdmVyc2lvbmluZzogJGVuYWJsZV9zeW12ZXJzCi0r
XSkKLSAKLS0tLSBhL3NyYy9NYWtlZmlsZS5hbQotKysrIGIvc3JjL01ha2VmaWxlLmFtCi1AQCAt
Niw2ICs2LDkgQEAKLSAjIyBhbnl0aGluZyBsaWtlIHRoYXQuCi0gCi0gbm9pbnN0X0hFQURFUlMg
PSBycGNfY29tLmggZGVidWcuaAotK0VYVFJBX0RJU1QgPSBsaWJ0aXJwYy5tYXAuaW4KLSsjIEdl
bmVyYXRlZCBmaWxlcwotK0JVSUxUX1NPVVJDRVMgPSBsaWJ0aXJwYy5tYXAKLSAKLSBBTV9DUFBG
TEFHUyA9IC1JJCh0b3Bfc3JjZGlyKS90aXJwYyAtaW5jbHVkZSBjb25maWcuaCAtRFBPUlRNQVAg
LURJTkVUNiBcCi0gCQktRF9HTlVfU09VUkNFIC1XYWxsIC1waXBlCi1AQCAtMTUsMTAgKzE4LDE5
IEBAIGxpYl9MVExJQlJBUklFUyA9IGxpYnRpcnBjLmxhCi0gbGlidGlycGNfbGFfTERGTEFHUyA9
IEBMREZMQUdfTk9VTkRFRklORURAIC1uby11bmRlZmluZWQgQFBUSFJFQURfTElCU0AKLSBsaWJ0
aXJwY19sYV9MREZMQUdTICs9IC12ZXJzaW9uLWluZm8gQExUX1ZFUlNJT05fSU5GT0AKLSAKLSsj
IEdlbmVyYXRlIHZlcnNpb24gc2NyaXB0IGZyb20gdGVtcGxhdGUKLStsaWJ0aXJwYy5tYXA6ICQo
c3JjZGlyKS9saWJ0aXJwYy5tYXAuaW4KLSsJJChBTV9WX0dFTikkKFNFRCkgXAotKwkJLWUgJ3N8
QEdTU19TWU1CT0xTQHwkKEdTU19TWU1CT0xTKXxnJyBcCi0rCQktZSAnc3xAR1NTX1NZTUJPTFNf
MDMxQHwkKEdTU19TWU1CT0xTXzAzMSl8ZycgXAotKwkJLWUgJ3N8QERFU19TWU1CT0xTQHwkKERF
U19TWU1CT0xTKXxnJyBcCi0rCQktZSAnc3xAUlBDREJfU1lNQk9MU0B8JChSUENEQl9TWU1CT0xT
KXxnJyBcCi0rCQk8ICQoc3JjZGlyKS9saWJ0aXJwYy5tYXAuaW4gPiAkQCB8fCBybSAtZiAkQAot
KwotIGxpYnRpcnBjX2xhX1NPVVJDRVMgPSBhdXRoX25vbmUuYyBhdXRoX3VuaXguYyBhdXRodW5p
eF9wcm90LmMgXAotICAgICAgICAgYmluZGR5bnBvcnQuYyBiaW5kcmVzdnBvcnQuYyBcCi0gICAg
ICAgICBjbG50X2JjYXN0LmMgY2xudF9kZy5jIGNsbnRfZ2VuZXJpYy5jIGNsbnRfcGVycm9yLmMg
Y2xudF9yYXcuYyBjbG50X3NpbXBsZS5jIFwKLS0gICAgICAgIGNsbnRfdmMuYyBycGNfZHRhYmxl
c2l6ZS5jIGdldG5ldGNvbmZpZy5jIGdldG5ldHBhdGguYyBnZXRycGNlbnQuYyBcCi0rICAgICAg
ICBjbG50X3ZjLmMgcnBjX2R0YWJsZXNpemUuYyBnZXRuZXRjb25maWcuYyBnZXRuZXRwYXRoLmMg
XAotICAgICAgICAgZ2V0cnBjcG9ydC5jIG10X21pc2MuYyBwbWFwX2NsbnQuYyBwbWFwX2dldG1h
cHMuYyBwbWFwX2dldHBvcnQuYyBcCi0gICAgICAgICBwbWFwX3Byb3QuYyBwbWFwX3Byb3QyLmMg
cG1hcF9ybXQuYyBycGNfcHJvdC5jIHJwY19jb21tb25kYXRhLmMgXAotICAgICAgICAgcnBjX2Nh
bGxtc2cuYyBycGNfZ2VuZXJpYy5jIHJwY19zb2MuYyBycGNiX2NsbnQuYyBycGNiX3Byb3QuYyBc
Ci1AQCAtMzQsMTkgKzQ2LDIzIEBAIGVuZGlmCi0gbGlidGlycGNfbGFfU09VUkNFUyArPSB4ZHIu
YyB4ZHJfcmVjLmMgeGRyX2FycmF5LmMgeGRyX2Zsb2F0LmMgeGRyX21lbS5jIHhkcl9yZWZlcmVu
Y2UuYyB4ZHJfc3RkaW8uYyB4ZHJfc2l6ZW9mLmMKLSAKLSBpZiBTWU1WRVJTCi0tICAgIGxpYnRp
cnBjX2xhX0xERkxBR1MgKz0gLVdsLC0tdmVyc2lvbi1zY3JpcHQ9JChzcmNkaXIpL2xpYnRpcnBj
Lm1hcAotKyAgICBsaWJ0aXJwY19sYV9MREZMQUdTICs9IC1XbCwtLXZlcnNpb24tc2NyaXB0PSQo
YnVpbGRkaXIpL2xpYnRpcnBjLm1hcAotIGVuZGlmCi0gCi0gIyMgU2VjdXJlLVJQQwotIGlmIEdT
UwotLSAgICBsaWJ0aXJwY19sYV9TT1VSQ0VTICs9IGF1dGhfZ3NzLmMgYXV0aGdzc19wcm90LmMg
c3ZjX2F1dGhfZ3NzLmMgXAotLQkJCSAgIHJwY19nc3NfdXRpbHMuYwotLSAgICBsaWJ0aXJwY19s
YV9MSUJBREQgPSAkKEdTU0FQSV9MSUJTKQotLSAgICBsaWJ0aXJwY19sYV9DRkxBR1MgPSAtREhB
VkVfUlBDU0VDX0dTUyAkKEdTU0FQSV9DRkxBR1MpCi0rbGlidGlycGNfbGFfU09VUkNFUyArPSBh
dXRoX2dzcy5jIGF1dGhnc3NfcHJvdC5jIHN2Y19hdXRoX2dzcy5jIHJwY19nc3NfdXRpbHMuYwot
K2xpYnRpcnBjX2xhX0xJQkFERCA9ICQoR1NTQVBJX0xJQlMpCi0rbGlidGlycGNfbGFfQ0ZMQUdT
ID0gLURIQVZFX1JQQ1NFQ19HU1MgJChHU1NBUElfQ0ZMQUdTKQotK2VuZGlmCi0rCi0rIyBDb25k
aXRpb25hbGx5IGFkZCBSUEMgZGF0YWJhc2Ugc291cmNlcwotK2lmIFJQQ0RCCi0rbGlidGlycGNf
bGFfU09VUkNFUyArPSBnZXRycGNlbnQuYwotIGVuZGlmCi0gCi0gbGlidGlycGNfbGFfU09VUkNF
UyArPSBrZXlfY2FsbC5jIGtleV9wcm90X3hkci5jIGdldHB1YmxpY2tleS5jCi0gbGlidGlycGNf
bGFfU09VUkNFUyArPSBuZXRuYW1lLmMgbmV0bmFtZXIuYyBycGNkbmFtZS5jIHJ0aW1lLmMKLSAK
LS1DTEVBTkZJTEVTCSAgICAgICA9IGNzY29wZS4qICp+Ci0rQ0xFQU5GSUxFUwkgICAgICAgPSBj
c2NvcGUuKiBsaWJ0aXJwYy5tYXAgKn4KLSBESVNUQ0xFQU5GSUxFUwkgICAgICAgPSBNYWtlZmls
ZS5pbgorZGlmZiAtLWdpdCBhL3NyYy9saWJ0aXJwYy5tYXAgYi9zcmMvbGlidGlycGMubWFwCitk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4IDQ3OWI0ZmYuLjAwMDAwMDAKIC0tLSBhL3Ny
Yy9saWJ0aXJwYy5tYXAKICsrKyAvZGV2L251bGwKLUBAIC0xLDMzNSArMCwwIEBACitAQCAtMSwz
MDMgKzAsMCBAQAogLVRJUlBDXzAuMy4wIHsKIC0gIGdsb2JhbDoKIC0gICAgIyBfXyoKQEAgLTIw
MywxNiArNjgsMTAgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4KIC0gICAgX3N2Y2F1dGhfbm9uZTsKIC0gICAgX3N2Y2F1dGhfc2hvcnQ7CiAtICAgIF9zdmNh
dXRoX3VuaXg7Ci0tICAgIF9zdmNhdXRoX2dzczsKIC0KIC0gICAgIyBhKgogLSAgICBhdXRoZGVz
X2NyZWF0ZTsKIC0gICAgYXV0aGRlc19zZWNjcmVhdGU7Ci0tICAgIGF1dGhnc3NfY3JlYXRlOwot
LSAgICBhdXRoZ3NzX2NyZWF0ZV9kZWZhdWx0OwotLSAgICBhdXRoZ3NzX2ZyZWVfcHJpdmF0ZV9k
YXRhOwotLSAgICBhdXRoZ3NzX2dldF9wcml2YXRlX2RhdGE7Ci0tICAgIGF1dGhnc3Nfc2Vydmlj
ZTsKIC0gICAgYXV0aG5vbmVfY3JlYXRlOwogLSAgICBhdXRodW5peF9jcmVhdGU7CiAtICAgIGF1
dGh1bml4X2NyZWF0ZV9kZWZhdWx0OwpAQCAtMjIzLDcgKzgyLDYgQEAgU2lnbmVkLW9mZi1ieTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIC0KIC0gICAgIyBjKgogLSAgICBjYWxscnBj
OwotLSAgICBjYmNfY3J5cHQ7CiAtICAgIGNsbnRfYnJvYWRjYXN0OwogLSAgICBjbG50X2NyZWF0
ZTsKIC0gICAgY2xudF9jcmVhdGVfdGltZWQ7CkBAIC0yNDgsMTAgKzEwNiw4IEBAIFNpZ25lZC1v
ZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAtICAgIGNsbnR1bml4X2NyZWF0
ZTsKIC0KIC0gICAgIyBlKgotLSAgICBlY2JfY3J5cHQ7CiAtICAgIGVuZG5ldGNvbmZpZzsKIC0g
ICAgZW5kbmV0cGF0aDsKLS0gICAgZW5kcnBjZW50OwogLQogLSAgICAjIGYqCiAtICAgIGZyZWVu
ZXRjb25maWdlbnQ7CkBAIC0yNjEsMTMgKzExNyw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+CiAtICAgIGdldG5ldGNvbmZpZzsKIC0gICAgZ2V0bmV0Y29u
ZmlnZW50OwogLSAgICBnZXRuZXRwYXRoOwotLSAgICBnZXRycGNlbnQ7Ci0tICAgIGdldHJwY2J5
bnVtYmVyOwotLSAgICBnZXRycGNieW5hbWU7CiAtICAgIGdldHJwY3BvcnQ7Ci0tICAgIGdzc19s
b2dfZGVidWc7Ci0tICAgIGdzc19sb2dfaGV4ZHVtcDsKLS0gICAgZ3NzX2xvZ19zdGF0dXM7CiAt
CiAtICAgICMgbioKIC0gICAgbmNfcGVycm9yOwpAQCAtMjg3LDIxICsxMzcsNiBAQCBTaWduZWQt
b2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogLSAgICBycGNfY2FsbDsKIC0g
ICAgcnBjX2NvbnRyb2w7CiAtICAgIHJwY19jcmVhdGVlcnI7Ci0tICAgIHJwY19nc3NfZ2V0X2Vy
cm9yOwotLSAgICBycGNfZ3NzX2dldF9tZWNoX2luZm87Ci0tICAgIHJwY19nc3NfZ2V0X21lY2hh
bmlzbXM7Ci0tICAgIHJwY19nc3NfZ2V0X3ByaW5jaXBhbF9uYW1lOwotLSAgICBycGNfZ3NzX2dl
dF92ZXJzaW9uczsKLS0gICAgcnBjX2dzc19nZXRjcmVkOwotLSAgICBycGNfZ3NzX2lzX2luc3Rh
bGxlZDsKLS0gICAgcnBjX2dzc19tYXhfZGF0YV9sZW5ndGg7Ci0tICAgIHJwY19nc3NfbWVjaF90
b19vaWQ7Ci0tICAgIHJwY19nc3NfcW9wX3RvX251bTsKLS0gICAgcnBjX2dzc19zZWNjcmVhdGU7
Ci0tICAgIHJwY19nc3Nfc2V0X2NhbGxiYWNrOwotLSAgICBycGNfZ3NzX3NldF9kZWZhdWx0czsK
LS0gICAgcnBjX2dzc19zZXRfc3ZjX25hbWU7Ci0tICAgIHJwY19nc3Nfc3ZjX21heF9kYXRhX2xl
bmd0aDsKIC0gICAgcnBjX251bGxwcm9jOwogLSAgICBycGNfcmVnOwogLSAgICBycGNiX2dldGFk
ZHI7CkBAIC0zMTYsNyArMTUxLDYgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KIC0gICAgIyBzKgogLSAgICBzZXRuZXRjb25maWc7CiAtICAgIHNldG5ldHBh
dGg7Ci0tICAgIHNldHJwY2VudDsKIC0gICAgc3ZjX2F1dGhfcmVnOwogLSAgICBzdmNfY3JlYXRl
OwogLSAgICBzdmNfZGdfY3JlYXRlOwpAQCAtMzYzLDggKzE5Nyw2IEBAIFNpZ25lZC1vZmYtYnk6
IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAtICAgICMgeCoKIC0gICAgeGRyX2FjY2Vw
dGVkX3JlcGx5OwogLSAgICB4ZHJfYXJyYXk7Ci0tICAgIHhkcl9hdXRoZGVzX2NyZWQ7Ci0tICAg
IHhkcl9hdXRoZGVzX3ZlcmY7CiAtICAgIHhkcl9hdXRodW5peF9wYXJtczsKIC0gICAgeGRyX2Jv
b2w7CiAtICAgIHhkcl9ieXRlczsKQEAgLTM5NywxMCArMjI5LDYgQEAgU2lnbmVkLW9mZi1ieTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIC0gICAgeGRyX3JlcGx5bXNnOwogLSAgICB4
ZHJfcm10Y2FsbF9hcmdzOwogLSAgICB4ZHJfcm10Y2FsbHJlczsKLS0gICAgeGRyX3JwY19nc3Nf
Y3JlZDsKLS0gICAgeGRyX3JwY19nc3NfZGF0YTsKLS0gICAgeGRyX3JwY19nc3NfaW5pdF9hcmdz
OwotLSAgICB4ZHJfcnBjX2dzc19pbml0X3JlczsKIC0gICAgeGRyX3JwY2I7CiAtICAgIHhkcl9y
cGNiX2VudHJ5OwogLSAgICB4ZHJfcnBjYl9lbnRyeV9saXN0X3B0cjsKQEAgLTQ0NCwxNCArMjcy
LDIwIEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAtICAg
IHhkcnN0ZGlvX2NyZWF0ZTsKIC0gICAgeHBydF9yZWdpc3RlcjsKIC0gICAgeHBydF91bnJlZ2lz
dGVyOworLSAgICAjIEdTUy1BUEkgc3ltYm9scyAoY29uZGl0aW9uYWxseSBpbmNsdWRlZCkKKy1f
c3ZjYXV0aF9nc3M7IGF1dGhnc3NfY3JlYXRlOyBhdXRoZ3NzX2NyZWF0ZV9kZWZhdWx0OyBhdXRo
Z3NzX2ZyZWVfcHJpdmF0ZV9kYXRhOyBhdXRoZ3NzX2dldF9wcml2YXRlX2RhdGE7IGF1dGhnc3Nf
c2VydmljZTsgZ3NzX2xvZ19kZWJ1ZzsgZ3NzX2xvZ19oZXhkdW1wOyBnc3NfbG9nX3N0YXR1czsg
cnBjX2dzc19nZXRfZXJyb3I7IHJwY19nc3NfZ2V0X21lY2hfaW5mbzsgcnBjX2dzc19nZXRfbWVj
aGFuaXNtczsgcnBjX2dzc19nZXRfcHJpbmNpcGFsX25hbWU7IHJwY19nc3NfZ2V0X3ZlcnNpb25z
OyBycGNfZ3NzX3FvcF90b19udW07IHJwY19nc3Nfc2VjY3JlYXRlOyBycGNfZ3NzX3NldF9jYWxs
YmFjazsgcnBjX2dzc19zZXRfZGVmYXVsdHM7IHJwY19nc3Nfc2V0X3N2Y19uYW1lOyBycGNfZ3Nz
X3N2Y19tYXhfZGF0YV9sZW5ndGg7CistICAgICMgREVTIGNyeXB0byBzeW1ib2xzIChjb25kaXRp
b25hbGx5IGluY2x1ZGVkKQorLQorLSAgICAjIFJQQyBkYXRhYmFzZSBzeW1ib2xzIChjb25kaXRp
b25hbGx5IGluY2x1ZGVkKQorLQogLQogLSAgbG9jYWw6CiAtICAgICo7CiAtfTsKIC0KIC1USVJQ
Q18wLjMuMSB7Ci0tICAgIHN2Y2F1dGhfZ3NzX2dldF9wcmluY2lwYWw7Ci0tICAgIHN2Y2F1dGhf
Z3NzX3NldF9zdmNfbmFtZTsKKy0jIEdTUy1BUEkgc3ltYm9scyAoY29uZGl0aW9uYWxseSBpbmNs
dWRlZCkKKy1zdmNhdXRoX2dzc19nZXRfcHJpbmNpcGFsOyBzdmNhdXRoX2dzc19zZXRfc3ZjX25h
bWU7CiAtfSBUSVJQQ18wLjMuMDsKIC0KIC1USVJQQ18wLjMuMiB7CkBAIC00NTksNyArMjkzLDYg
QEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIC0gICAgZ2V0
cHVibGljYW5kcHJpdmF0ZWtleTsKIC0gICAgZ2V0cHVibGlja2V5OwogLSAgICBob3N0Mm5ldG5h
bWU7Ci0tICAgIGtleV9jYWxsX2Rlc3Ryb3k7CiAtICAgIGtleV9kZWNyeXB0c2Vzc2lvbjsKIC0g
ICAga2V5X2RlY3J5cHRzZXNzaW9uX3BrOwogLSAgICBrZXlfZW5jcnlwdHNlc3Npb247CkBAIC01
MDIsMzA5ICszMzUsMyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPgogLSAgIyBwcml2YXRlLCBidXQgdXNlZCBieSBycGNiaW5kOgogLSAgICBfX3N2Y19jbGVh
bl9pZGxlOyBzdmNfYXV0aF9ub25lOyBsaWJ0aXJwY19zZXRfZGVidWc7CiAtfTsKLS0tLSAvZGV2
L251bGwKLSsrKyBiL3NyYy9saWJ0aXJwYy5tYXAuaW4KLUBAIC0wLDAgKzEsMzAzIEBACi0rVElS
UENfMC4zLjAgewotKyAgZ2xvYmFsOgotKyAgICAjIF9fKgotKyAgICBfX3JwY19jcmVhdGVlcnI7
Ci0rICAgIF9fcnBjX2R0YnNpemU7Ci0rICAgIF9fcnBjX2VuZGNvbmY7Ci0rICAgIF9fcnBjX2Zk
MnNvY2tpbmZvOwotKyAgICBfX3JwY19maXh1cF9hZGRyOwotKyAgICBfX3JwY19nZXRfYV9zaXpl
OwotKyAgICBfX3JwY19nZXRfbG9jYWxfdWlkOwotKyAgICBfX3JwY19nZXRfdF9zaXplOwotKyAg
ICBfX3JwY19nZXRjb25mOwotKyAgICBfX3JwY19nZXRjb25maXA7Ci0rICAgIF9fcnBjX25jb25m
MmZkOwotKyAgICBfX3JwY19uY29uZjJmZF9mbGFnczsKLSsgICAgX19ycGNfbmNvbmYyc29ja2lu
Zm87Ci0rICAgIF9fcnBjX3Jhd2NvbWJ1ZjsKLSsgICAgX19ycGNfc2VtYW4yc29ja3R5cGU7Ci0r
ICAgIF9fcnBjX3NldGNvbmY7Ci0rICAgIF9fcnBjX3NvY2tpbmZvMm5ldGlkOwotKyAgICBfX3Jw
Y19zb2NraXNib3VuZDsKLSsgICAgX19ycGNfc29ja3R5cGUyc2VtYW47Ci0rICAgIF9fcnBjX3Rh
ZGRyMnVhZGRyX2FmOwotKyAgICBfX3JwY191YWRkcjJ0YWRkcl9hZjsKLSsgICAgX19ycGNnZXR0
cDsKLSsKLSsgICAgIyBfKgotKyAgICBfYXV0aGVudGljYXRlOwotKyAgICBfZ2V0X25leHRfdG9r
ZW47Ci0rICAgIF9nc3NfYXV0aGVudGljYXRlOwotKyAgICBfbnVsbF9hdXRoOwotKyAgICBfcnBj
X2R0YWJsZXNpemU7Ci0rICAgIF9zZXRlcnJfcmVwbHk7Ci0rICAgIF9zdmNhdXRoX25vbmU7Ci0r
ICAgIF9zdmNhdXRoX3Nob3J0OwotKyAgICBfc3ZjYXV0aF91bml4OwotKwotKyAgICAjIGEqCi0r
ICAgIGF1dGhkZXNfY3JlYXRlOwotKyAgICBhdXRoZGVzX3NlY2NyZWF0ZTsKLSsgICAgYXV0aG5v
bmVfY3JlYXRlOwotKyAgICBhdXRodW5peF9jcmVhdGU7Ci0rICAgIGF1dGh1bml4X2NyZWF0ZV9k
ZWZhdWx0OwotKwotKyAgICAjIGIqCi0rICAgIGJpbmRyZXN2cG9ydDsKLSsgICAgYmluZHJlc3Zw
b3J0X3NhOwotKwotKyAgICAjIGMqCi0rICAgIGNhbGxycGM7Ci0rICAgIGNsbnRfYnJvYWRjYXN0
OwotKyAgICBjbG50X2NyZWF0ZTsKLSsgICAgY2xudF9jcmVhdGVfdGltZWQ7Ci0rICAgIGNsbnRf
Y3JlYXRlX3ZlcnM7Ci0rICAgIGNsbnRfY3JlYXRlX3ZlcnNfdGltZWQ7Ci0rICAgIGNsbnRfZGdf
Y3JlYXRlOwotKyAgICBjbG50X3BjcmVhdGVlcnJvcjsKLSsgICAgY2xudF9wZXJybm87Ci0rICAg
IGNsbnRfcGVycm9yOwotKyAgICBjbG50X3Jhd19jcmVhdGU7Ci0rICAgIGNsbnRfc3BjcmVhdGVl
cnJvcjsKLSsgICAgY2xudF9zcGVycm5vOwotKyAgICBjbG50X3NwZXJyb3I7Ci0rICAgIGNsbnRf
dGxpX2NyZWF0ZTsKLSsgICAgY2xudF90cF9jcmVhdGU7Ci0rICAgIGNsbnRfdHBfY3JlYXRlX3Rp
bWVkOwotKyAgICBjbG50X3ZjX2NyZWF0ZTsKLSsgICAgY2xudHJhd19jcmVhdGU7Ci0rICAgIGNs
bnR0Y3BfY3JlYXRlOwotKyAgICBjbG50dWRwX2J1ZmNyZWF0ZTsKLSsgICAgY2xudHVkcF9jcmVh
dGU7Ci0rICAgIGNsbnR1bml4X2NyZWF0ZTsKLSsKLSsgICAgIyBlKgotKyAgICBlbmRuZXRjb25m
aWc7Ci0rICAgIGVuZG5ldHBhdGg7Ci0rCi0rICAgICMgZioKLSsgICAgZnJlZW5ldGNvbmZpZ2Vu
dDsKLSsKLSsgICAgIyBnKgotKyAgICBnZXRfbXlhZGRyZXNzOwotKyAgICBnZXRuZXRjb25maWc7
Ci0rICAgIGdldG5ldGNvbmZpZ2VudDsKLSsgICAgZ2V0bmV0cGF0aDsKLSsgICAgZ2V0cnBjcG9y
dDsKLSsKLSsgICAgIyBuKgotKyAgICBuY19wZXJyb3I7Ci0rICAgIG5jX3NwZXJyb3I7Ci0rCi0r
ICAgICMgcCoKLSsgICAgcG1hcF9nZXRtYXBzOwotKyAgICBwbWFwX2dldHBvcnQ7Ci0rICAgIHBt
YXBfcm10Y2FsbDsKLSsgICAgcG1hcF9zZXQ7Ci0rICAgIHBtYXBfdW5zZXQ7Ci0rCi0rICAgICMg
cioKLSsgICAgcmVnaXN0ZXJycGM7Ci0rICAgIHJwY19icm9hZGNhc3Q7Ci0rICAgIHJwY19icm9h
ZGNhc3RfZXhwOwotKyAgICBycGNfY2FsbDsKLSsgICAgcnBjX2NvbnRyb2w7Ci0rICAgIHJwY19j
cmVhdGVlcnI7Ci0rICAgIHJwY19udWxscHJvYzsKLSsgICAgcnBjX3JlZzsKLSsgICAgcnBjYl9n
ZXRhZGRyOwotKyAgICBycGNiX2dldG1hcHM7Ci0rICAgIHJwY2JfZ2V0dGltZTsKLSsgICAgcnBj
Yl9ybXRjYWxsOwotKyAgICBycGNiX3NldDsKLSsgICAgcnBjYl90YWRkcjJ1YWRkcjsKLSsgICAg
cnBjYl91YWRkcjJ0YWRkcjsKLSsgICAgcnBjYl91bnNldDsKLSsKLSsgICAgIyBzKgotKyAgICBz
ZXRuZXRjb25maWc7Ci0rICAgIHNldG5ldHBhdGg7Ci0rICAgIHN2Y19hdXRoX3JlZzsKLSsgICAg
c3ZjX2NyZWF0ZTsKLSsgICAgc3ZjX2RnX2NyZWF0ZTsKLSsgICAgc3ZjX2RnX2VuYWJsZWNhY2hl
OwotKyAgICBzdmNfZXhpdDsKLSsgICAgc3ZjX2ZkX2NyZWF0ZTsKLSsgICAgc3ZjX2Zkc2V0Owot
KyAgICBzdmNfZ2V0cmVxOwotKyAgICBzdmNfZ2V0cmVxX2NvbW1vbjsKLSsgICAgc3ZjX2dldHJl
cV9wb2xsOwotKyAgICBzdmNfZ2V0cmVxc2V0OwotKyAgICBzdmNfbWF4ZmQ7Ci0rICAgIHN2Y19y
YXdfY3JlYXRlOwotKyAgICBzdmNfcmVnOwotKyAgICBzdmNfcmVnaXN0ZXI7Ci0rICAgIHN2Y19y
dW47Ci0rICAgIHN2Y19zZW5kcmVwbHk7Ci0rICAgIHN2Y190bGlfY3JlYXRlOwotKyAgICBzdmNf
dHBfY3JlYXRlOwotKyAgICBzdmNfdW5yZWc7Ci0rICAgIHN2Y191bnJlZ2lzdGVyOwotKyAgICBz
dmNfdmNfY3JlYXRlOwotKyAgICBzdmNlcnJfYXV0aDsKLSsgICAgc3ZjZXJyX2RlY29kZTsKLSsg
ICAgc3ZjZXJyX25vcHJvYzsKLSsgICAgc3ZjZXJyX25vcHJvZzsKLSsgICAgc3ZjZXJyX3Byb2d2
ZXJzOwotKyAgICBzdmNlcnJfc3lzdGVtZXJyOwotKyAgICBzdmNlcnJfd2Vha2F1dGg7Ci0rICAg
IHN2Y2ZkX2NyZWF0ZTsKLSsgICAgc3ZjcmF3X2NyZWF0ZTsKLSsgICAgc3ZjdGNwX2NyZWF0ZTsK
LSsgICAgc3ZjdWRwX2J1ZmNyZWF0ZTsKLSsgICAgc3ZjdWRwX2NyZWF0ZTsKLSsgICAgc3ZjdW5p
eF9jcmVhdGU7Ci0rICAgIHN2Y3VuaXhmZF9jcmVhdGU7Ci0rCi0rICAgICMgdCoKLSsgICAgdGFk
ZHIydWFkZHI7Ci0rCi0rICAgICMgdSoKLSsgICAgdWFkZHIydGFkZHI7Ci0rCi0rICAgICMgeCoK
LSsgICAgeGRyX2FjY2VwdGVkX3JlcGx5OwotKyAgICB4ZHJfYXJyYXk7Ci0rICAgIHhkcl9hdXRo
dW5peF9wYXJtczsKLSsgICAgeGRyX2Jvb2w7Ci0rICAgIHhkcl9ieXRlczsKLSsgICAgeGRyX2Nh
bGxoZHI7IHhkcl9jYWxsbXNnOwotKyAgICB4ZHJfY2hhcjsKLSsgICAgeGRyX2Rlc19ibG9jazsK
LSsgICAgeGRyX2RvdWJsZTsKLSsgICAgeGRyX2VudW07Ci0rICAgIHhkcl9mbG9hdDsKLSsgICAg
eGRyX2ZyZWU7Ci0rICAgIHhkcl9oeXBlcjsKLSsgICAgeGRyX2ludDE2X3Q7Ci0rICAgIHhkcl9p
bnQzMl90OwotKyAgICB4ZHJfaW50NjRfdDsKLSsgICAgeGRyX2ludDhfdDsKLSsgICAgeGRyX2lu
dDsKLSsgICAgeGRyX2xvbmc7Ci0rICAgIHhkcl9sb25nbG9uZ190OwotKyAgICB4ZHJfbmV0YnVm
OwotKyAgICB4ZHJfbmV0b2JqOwotKyAgICB4ZHJfb3BhcXVlOwotKyAgICB4ZHJfb3BhcXVlX2F1
dGg7Ci0rICAgIHhkcl9wbWFwOwotKyAgICB4ZHJfcG1hcGxpc3Q7Ci0rICAgIHhkcl9wbWFwbGlz
dF9wdHI7Ci0rICAgIHhkcl9wb2ludGVyOwotKyAgICB4ZHJfcXVhZF90OwotKyAgICB4ZHJfcmVm
ZXJlbmNlOwotKyAgICB4ZHJfcmVqZWN0ZWRfcmVwbHk7Ci0rICAgIHhkcl9yZXBseW1zZzsKLSsg
ICAgeGRyX3JtdGNhbGxfYXJnczsKLSsgICAgeGRyX3JtdGNhbGxyZXM7Ci0rICAgIHhkcl9ycGNi
OwotKyAgICB4ZHJfcnBjYl9lbnRyeTsKLSsgICAgeGRyX3JwY2JfZW50cnlfbGlzdF9wdHI7Ci0r
ICAgIHhkcl9ycGNiX3JtdGNhbGxhcmdzOwotKyAgICB4ZHJfcnBjYl9ybXRjYWxscmVzOwotKyAg
ICB4ZHJfcnBjYl9zdGF0OwotKyAgICB4ZHJfcnBjYl9zdGF0X2J5dmVyczsKLSsgICAgeGRyX3Jw
Y2JsaXN0OwotKyAgICB4ZHJfcnBjYmxpc3RfcHRyOwotKyAgICB4ZHJfcnBjYnNfYWRkcmxpc3Q7
Ci0rICAgIHhkcl9ycGNic19hZGRybGlzdF9wdHI7Ci0rICAgIHhkcl9ycGNic19wcm9jOwotKyAg
ICB4ZHJfcnBjYnNfcm10Y2FsbGxpc3Q7Ci0rICAgIHhkcl9ycGNic19ybXRjYWxsbGlzdF9wdHI7
Ci0rICAgIHhkcl9zaG9ydDsKLSsgICAgeGRyX3N0cmluZzsKLSsgICAgeGRyX3VfY2hhcjsKLSsg
ICAgeGRyX3VfaHlwZXI7Ci0rICAgIHhkcl91X2ludDE2X3Q7Ci0rICAgIHhkcl91X2ludDMyX3Q7
Ci0rICAgIHhkcl91X2ludDY0X3Q7Ci0rICAgIHhkcl91X2ludDhfdDsKLSsgICAgeGRyX3VfaW50
OwotKyAgICB4ZHJfdV9sb25nOwotKyAgICB4ZHJfdV9sb25nbG9uZ190OwotKyAgICB4ZHJfdV9x
dWFkX3Q7Ci0rICAgIHhkcl91X3Nob3J0OwotKyAgICB4ZHJfdWludDE2X3Q7Ci0rICAgIHhkcl91
aW50MzJfdDsKLSsgICAgeGRyX3VpbnQ2NF90OwotKyAgICB4ZHJfdWludDhfdDsKLSsgICAgeGRy
X3VuaW9uOwotKyAgICB4ZHJfdmVjdG9yOwotKyAgICB4ZHJfdm9pZDsKLSsgICAgeGRyX3dyYXBz
dHJpbmc7Ci0rICAgIHhkcm1lbV9jcmVhdGU7Ci0rICAgIHhkcnJlY19jcmVhdGU7Ci0rICAgIHhk
cnJlY19lbmRvZnJlY29yZDsKLSsgICAgeGRycmVjX2VvZjsKLSsgICAgeGRycmVjX3NraXByZWNv
cmQ7Ci0rICAgIHhkcnN0ZGlvX2NyZWF0ZTsKLSsgICAgeHBydF9yZWdpc3RlcjsKLSsgICAgeHBy
dF91bnJlZ2lzdGVyOwotKyAgICAjIEdTUy1BUEkgc3ltYm9scyAoY29uZGl0aW9uYWxseSBpbmNs
dWRlZCkKLStAR1NTX1NZTUJPTFNACi0rICAgICMgREVTIGNyeXB0byBzeW1ib2xzIChjb25kaXRp
b25hbGx5IGluY2x1ZGVkKQotK0BERVNfU1lNQk9MU0AKLSsgICAgIyBSUEMgZGF0YWJhc2Ugc3lt
Ym9scyAoY29uZGl0aW9uYWxseSBpbmNsdWRlZCkKLStAUlBDREJfU1lNQk9MU0AKLSsKLSsgIGxv
Y2FsOgotKyAgICAqOwotK307Ci0rCi0rVElSUENfMC4zLjEgewotKyMgR1NTLUFQSSBzeW1ib2xz
IChjb25kaXRpb25hbGx5IGluY2x1ZGVkKQotK0BHU1NfU1lNQk9MU18wMzFACi0rfSBUSVJQQ18w
LjMuMDsKLSsKLStUSVJQQ18wLjMuMiB7Ci0rICAgIGdldG5ldG5hbWU7Ci0rICAgIGdldHB1Ymxp
Y2FuZHByaXZhdGVrZXk7Ci0rICAgIGdldHB1YmxpY2tleTsKLSsgICAgaG9zdDJuZXRuYW1lOwot
KyAgICBrZXlfZGVjcnlwdHNlc3Npb247Ci0rICAgIGtleV9kZWNyeXB0c2Vzc2lvbl9wazsKLSsg
ICAga2V5X2VuY3J5cHRzZXNzaW9uOwotKyAgICBrZXlfZW5jcnlwdHNlc3Npb25fcGs7Ci0rICAg
IGtleV9nZW5kZXM7Ci0rICAgIGtleV9nZXRfY29udjsKLSsgICAga2V5X3NldHNlY3JldDsKLSsg
ICAga2V5X3NlY3JldGtleV9pc19zZXQ7Ci0rICAgIGtleV9zZXRuZXQ7Ci0rICAgIG5ldG5hbWUy
aG9zdDsKLSsgICAgbmV0bmFtZTJ1c2VyOwotKyAgICBydGltZTsKLSsgICAgdXNlcjJuZXRuYW1l
OwotKyAgICB4ZHJfY3J5cHRrZXlhcmc7Ci0rICAgIHhkcl9jcnlwdGtleWFyZzI7Ci0rICAgIHhk
cl9jcnlwdGtleXJlczsKLSsgICAgeGRyX2dldGNyZWRyZXM7Ci0rICAgIHhkcl9rZXlfbmV0c3Rh
cmc7Ci0rICAgIHhkcl9rZXlfbmV0c3RyZXM7Ci0rICAgIHhkcl9rZXlidWY7Ci0rICAgIHhkcl9r
ZXlzdGF0dXM7Ci0rICAgIHhkcl9uZXRuYW1lc3RyOwotKyAgICB4ZHJfdW5peGNyZWQ7Ci0rfSBU
SVJQQ18wLjMuMTsKLSsKLStUSVJQQ18wLjMuMyB7Ci0rICAgIF9fZ2V0cHVibGlja2V5X0xPQ0FM
OwotKyAgICBfX2tleV9kZWNyeXB0c2Vzc2lvbl9wa19MT0NBTDsKLSsgICAgX19rZXlfZW5jcnlw
dHNlc3Npb25fcGtfTE9DQUw7Ci0rICAgIF9fa2V5X2dlbmRlc19MT0NBTDsKLSsgICAgeGRyX3Np
emVvZjsKLSsgICAgYXV0aGRlc19wa19jcmVhdGU7Ci0rICAgIHN2Y19wb2xsZmQ7Ci0rICAgIHN2
Y19tYXhfcG9sbGZkOwotK30gVElSUENfMC4zLjI7Ci0rCi0rVElSUENfUFJJVkFURSB7Ci0rICBn
bG9iYWw6Ci0rICAgIF9fbGliY19jbG50dWRwX2J1ZmNyZWF0ZTsKLSsgICMgcHJpdmF0ZSwgYnV0
IHVzZWQgYnkgcnBjYmluZDoKLSsgICAgX19zdmNfY2xlYW5faWRsZTsgc3ZjX2F1dGhfbm9uZTsg
bGlidGlycGNfc2V0X2RlYnVnOwotK307CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvbGlidGlycGMvbGlidGlycGMvMDAwMS1VcGRhdGUtZGVjbGFyYXRpb25zLXRvLWFsbG93LWNv
bXBpbGUtd2l0aC1nY2MtMTUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlidGlycGMv
bGlidGlycGMvMDAwMS1VcGRhdGUtZGVjbGFyYXRpb25zLXRvLWFsbG93LWNvbXBpbGUtd2l0aC1n
Y2MtMTUucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDdiZmU3YzI5MjQuLjAw
MDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRpcnBjLzAw
MDEtVXBkYXRlLWRlY2xhcmF0aW9ucy10by1hbGxvdy1jb21waWxlLXdpdGgtZ2NjLTE1LnBhdGNo
CisrKyAvZGV2L251bGwKQEAgLTEsNjQgKzAsMCBAQAotRnJvbSBiNTI2YzBhOTA5NTNmNDdkNGNi
ZjdlZjAxZTlhYzEzZTllNzY5MDRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogUnVk
aSBIZWl0YmF1bSA8cnVkaUBoZWl0YmF1bS5jb20+Ci1EYXRlOiBUaHUsIDEyIERlYyAyMDI0IDA0
OjE2OjAyIC0wNTAwCi1TdWJqZWN0OiBbUEFUQ0ggMS8yXSBVcGRhdGUgZGVjbGFyYXRpb25zIHRv
IGFsbG93IGNvbXBpbGUgd2l0aCBnY2MtMTUKLQotVGhpcyBwYXRjaCBmaXhlcyBzb21lIG9mIHRo
ZSBjb21waWxlIGVycm9ycyB3aXRoIGdjYyAxNS0yMDI0MTExNy4KLQotSW4gYWRkaXRpb24gdGhl
IGZvbGxvdyBkZWNsYXJhdGlvbnMgbmVlZCB0byBiZSBmaXhlZDoKLSAgc2VkIC1uIDc1LDc3cCBs
aWJ0aXJwYy0xLjMuNi9zcmMva2V5X2NhbGwuYwotICBjcnlwdGtleXJlcyAqKCpfX2tleV9lbmNy
eXB0c2Vzc2lvbl9wa19MT0NBTCkoKSA9IDA7Ci0gIGNyeXB0a2V5cmVzICooKl9fa2V5X2RlY3J5
cHRzZXNzaW9uX3BrX0xPQ0FMKSgpID0gMDsKLSAgZGVzX2Jsb2NrICooKl9fa2V5X2dlbmRlc19M
T0NBTCkoKSA9IDA7Ci0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0Lmxp
bnV4LW5mcy5vcmcvP3A9c3RldmVkL2xpYnRpcnBjLmdpdDthPWNvbW1pdDtoPWQ0NzNmMWUxZjZi
YTgwYmZhZWU0ZGFhMDU4ZGExNTkzMDUxNjczMjNdCi1TaWduZWQtb2ZmLWJ5OiBSdWRpIEhlaXRi
YXVtIDxydWRpQGhlaXRiYXVtLmNvbT4KLVNpZ25lZC1vZmYtYnk6IFN0ZXZlIERpY2tzb24gPHN0
ZXZlZEByZWRoYXQuY29tPgotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4KLS0tLQotIHNyYy9hdXRoX25vbmUuYyAgICAgfCAyICstCi0gc3JjL2dldHB1YmxpY2tl
eS5jICB8IDIgKy0KLSBzcmMvc3ZjX2F1dGhfbm9uZS5jIHwgNCArKy0tCi0gMyBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9zcmMv
YXV0aF9ub25lLmMgYi9zcmMvYXV0aF9ub25lLmMKLWluZGV4IDBiMGJiZDEuLmFjYTZlNzEgMTAw
NjQ0Ci0tLS0gYS9zcmMvYXV0aF9ub25lLmMKLSsrKyBiL3NyYy9hdXRoX25vbmUuYwotQEAgLTYy
LDcgKzYyLDcgQEAgc3RhdGljIGJvb2xfdCBhdXRobm9uZV92YWxpZGF0ZSAoQVVUSCAqLCBzdHJ1
Y3Qgb3BhcXVlX2F1dGggKik7Ci0gc3RhdGljIGJvb2xfdCBhdXRobm9uZV9yZWZyZXNoIChBVVRI
ICosIHZvaWQgKik7Ci0gc3RhdGljIHZvaWQgYXV0aG5vbmVfZGVzdHJveSAoQVVUSCAqKTsKLSAK
LS1leHRlcm4gYm9vbF90IHhkcl9vcGFxdWVfYXV0aCgpOwotK2V4dGVybiBib29sX3QgeGRyX29w
YXF1ZV9hdXRoKFhEUiAqLCBzdHJ1Y3Qgb3BhcXVlX2F1dGggKik7Ci0gCi0gc3RhdGljIHN0cnVj
dCBhdXRoX29wcyAqYXV0aG5vbmVfb3BzKCk7Ci0gCi1kaWZmIC0tZ2l0IGEvc3JjL2dldHB1Ymxp
Y2tleS5jIGIvc3JjL2dldHB1YmxpY2tleS5jCi1pbmRleCBiZTM3YTI0Li40ZTk2YzdjIDEwMDY0
NAotLS0tIGEvc3JjL2dldHB1YmxpY2tleS5jCi0rKysgYi9zcmMvZ2V0cHVibGlja2V5LmMKLUBA
IC01Miw3ICs1Miw3IEBACi0gLyoKLSAgKiBIYWNrIHRvIGxldCB5cHNlcnYvcnBjLm5pc2QgdXNl
IEFVVEhfREVTLgotICAqLwotLWludCAoKl9fZ2V0cHVibGlja2V5X0xPQ0FMKSgpID0gMDsKLStp
bnQgKCpfX2dldHB1YmxpY2tleV9MT0NBTCkoY29uc3QgY2hhciAqLCBjaGFyICopID0gMDsKLSAK
LSAvKgotICAqIEdldCBzb21lYm9keSdzIHB1YmxpYyBrZXkKLWRpZmYgLS1naXQgYS9zcmMvc3Zj
X2F1dGhfbm9uZS5jIGIvc3JjL3N2Y19hdXRoX25vbmUuYwotaW5kZXggODg3ZTgwOS4uNWNhOThl
OSAxMDA2NDQKLS0tLSBhL3NyYy9zdmNfYXV0aF9ub25lLmMKLSsrKyBiL3NyYy9zdmNfYXV0aF9u
b25lLmMKLUBAIC0zNyw4ICszNyw4IEBACi0gCi0gI2luY2x1ZGUgPHJwYy9ycGMuaD4KLSAKLS1z
dGF0aWMgYm9vbF90CXN2Y2F1dGhfbm9uZV9kZXN0cm95KCk7Ci0tc3RhdGljIGJvb2xfdCAgIHN2
Y2F1dGhfbm9uZV93cmFwKCk7Ci0rc3RhdGljIGJvb2xfdAlzdmNhdXRoX25vbmVfZGVzdHJveShT
VkNBVVRIICopOwotK3N0YXRpYyBib29sX3QgICBzdmNhdXRoX25vbmVfd3JhcChTVkNBVVRIICos
IFhEUiAqLCBib29sX3QgKCopKFhEUiAqLCAuLi4pLCBjaGFyICopOwotIAotIHN0cnVjdCBzdmNf
YXV0aF9vcHMgc3ZjX2F1dGhfbm9uZV9vcHMgPSB7Ci0gCXN2Y2F1dGhfbm9uZV93cmFwLApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRpcnBjLzAwMDItdXBk
YXRlLXNpZ25hbC1hbmQta2V5X2NhbGwtZGVjbGFyYXRpb25zLXRvLWFsbG93LWNvbS5wYXRjaCBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy9saWJ0aXJwYy8wMDAyLXVwZGF0ZS1zaWdu
YWwtYW5kLWtleV9jYWxsLWRlY2xhcmF0aW9ucy10by1hbGxvdy1jb20ucGF0Y2gKZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDgzZTIxMDVhMWEuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRpcnBjLzAwMDItdXBkYXRlLXNpZ25hbC1hbmQt
a2V5X2NhbGwtZGVjbGFyYXRpb25zLXRvLWFsbG93LWNvbS5wYXRjaAorKysgL2Rldi9udWxsCkBA
IC0xLDYwICswLDAgQEAKLUZyb20gNTU0NTJlNmFlNzE4Njk4ODBmOGM4NWQ1ZGJhOWFhMjRkNzE0
N2Q4YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFJ1ZGkgSGVpdGJhdW0gPHJ1ZGlA
aGVpdGJhdW0uY29tPgotRGF0ZTogVGh1LCAyIEphbiAyMDI1IDA4OjQ2OjI0IC0wNTAwCi1TdWJq
ZWN0OiBbUEFUQ0ggMi8yXSB1cGRhdGUgc2lnbmFsIGFuZCBrZXlfY2FsbCBkZWNsYXJhdGlvbnMg
dG8gYWxsb3cgY29tcGlsZQotIHdpdGggZ2NjLTE1Ci0KLUZvbGxvdyB1cCBwYXRjaCBhZGRyZXNz
aW5nIHRoZSBmb2xsb3dpbmcgZGVjbGFyYXRpb25zOgotICBzZWQgLW4gNzUsNzdwIGxpYnRpcnBj
LTEuMy42L3NyYy9rZXlfY2FsbC5jCi0gIGNyeXB0a2V5cmVzICooKl9fa2V5X2VuY3J5cHRzZXNz
aW9uX3BrX0xPQ0FMKSgpID0gMDsKLSAgY3J5cHRrZXlyZXMgKigqX19rZXlfZGVjcnlwdHNlc3Np
b25fcGtfTE9DQUwpKCkgPSAwOwotICBkZXNfYmxvY2sgKigqX19rZXlfZ2VuZGVzX0xPQ0FMKSgp
ID0gMDsKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXQubGludXgtbmZz
Lm9yZy8/cD1zdGV2ZWQvbGlidGlycGMuZ2l0O2E9Y29tbWl0O2g9MjQwZWU2Yzc3NDcyOWM5YzI0
ODEyYWE4OTEyZjFmY2Y4OTk2YjE2Ml0KLVNpZ25lZC1vZmYtYnk6IFJ1ZGkgSGVpdGJhdW0gPHJ1
ZGlAaGVpdGJhdW0uY29tPgotU2lnbmVkLW9mZi1ieTogU3RldmUgRGlja3NvbiA8c3RldmVkQHJl
ZGhhdC5jb20+Ci1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgot
LS0tCi0gc3JjL2F1dGhfdGltZS5jIHwgNCArKy0tCi0gc3JjL2tleV9jYWxsLmMgIHwgNiArKyst
LS0KLSAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKLQot
ZGlmZiAtLWdpdCBhL3NyYy9hdXRoX3RpbWUuYyBiL3NyYy9hdXRoX3RpbWUuYwotaW5kZXggOTM2
ZGQ3Ni4uYzIxYjFkZiAxMDA2NDQKLS0tLSBhL3NyYy9hdXRoX3RpbWUuYwotKysrIGIvc3JjL2F1
dGhfdGltZS5jCi1AQCAtMjQ4LDcgKzI0OCw3IEBAIF9fcnBjX2dldF90aW1lX29mZnNldCh0ZCwg
c3J2LCB0aG9zdCwgdWFkZHIsIG5ldGlkKQotIAljaGFyCQkJdXRbNjRdLCBpcHVhZGRyWzY0XTsK
LSAJZW5kcG9pbnQJCXRlcHNbMzJdOwotIAluaXNfc2VydmVyCQl0c3J2OwotLQl2b2lkCQkJKCpv
bGRzaWcpKCkgPSBOVUxMOyAvKiBvbGQgYWxhcm0gaGFuZGxlciAqLwotKwl2b2lkCQkJKCpvbGRz
aWcpKGludCkgPSBOVUxMOyAvKiBvbGQgYWxhcm0gaGFuZGxlciAqLwotIAlzdHJ1Y3Qgc29ja2Fk
ZHJfaW4Jc2luOwotIAlpbnQJCQlzID0gUlBDX0FOWVNPQ0s7Ci0gCXNvY2tsZW5fdCBsZW47Ci1A
QCAtNDE3LDcgKzQxNyw3IEBAIF9fcnBjX2dldF90aW1lX29mZnNldCh0ZCwgc3J2LCB0aG9zdCwg
dWFkZHIsIG5ldGlkKQotIAkJfSBlbHNlIHsKLSAJCQlpbnQgcmVzOwotIAotLQkJCW9sZHNpZyA9
ICh2b2lkICgqKSgpKXNpZ25hbChTSUdBTFJNLCBhbGFybV9obmRsZXIpOwotKwkJCW9sZHNpZyA9
ICh2b2lkICgqKShpbnQpKXNpZ25hbChTSUdBTFJNLCBhbGFybV9obmRsZXIpOwotIAkJCXNhd19h
bGFybSA9IDA7IC8qIGdsb2JhbCB0cmFja2luZyB0aGUgYWxhcm0gKi8KLSAJCQlhbGFybSgyMCk7
IC8qIG9ubHkgd2FpdCAyMCBzZWNvbmRzICovCi0gCQkJcmVzID0gY29ubmVjdChzLCAoc3RydWN0
IHNvY2thZGRyICopJnNpbiwgc2l6ZW9mKHNpbikpOwotZGlmZiAtLWdpdCBhL3NyYy9rZXlfY2Fs
bC5jIGIvc3JjL2tleV9jYWxsLmMKLWluZGV4IDlmNGIxZDIuLjQzZjk5MGUgMTAwNjQ0Ci0tLS0g
YS9zcmMva2V5X2NhbGwuYwotKysrIGIvc3JjL2tleV9jYWxsLmMKLUBAIC03Miw5ICs3Miw5IEBA
Ci0gICogaW1wbGVtZW50YXRpb25zIG9mIHRoZXNlIGZ1bmN0aW9ucywgYW5kIHRvIGNhbGwgdGhv
c2UgaW4ga2V5X2NhbGwoKS4KLSAgKi8KLSAKLS1jcnlwdGtleXJlcyAqKCpfX2tleV9lbmNyeXB0
c2Vzc2lvbl9wa19MT0NBTCkoKSA9IDA7Ci0tY3J5cHRrZXlyZXMgKigqX19rZXlfZGVjcnlwdHNl
c3Npb25fcGtfTE9DQUwpKCkgPSAwOwotLWRlc19ibG9jayAqKCpfX2tleV9nZW5kZXNfTE9DQUwp
KCkgPSAwOwotK2NyeXB0a2V5cmVzICooKl9fa2V5X2VuY3J5cHRzZXNzaW9uX3BrX0xPQ0FMKSh1
aWRfdCwgY2hhciAqKSA9IDA7Ci0rY3J5cHRrZXlyZXMgKigqX19rZXlfZGVjcnlwdHNlc3Npb25f
cGtfTE9DQUwpKHVpZF90LCBjaGFyICopID0gMDsKLStkZXNfYmxvY2sgKigqX19rZXlfZ2VuZGVz
X0xPQ0FMKSh1aWRfdCwgY2hhciAqKSA9IDA7Ci0gCi0gc3RhdGljIGludCBrZXlfY2FsbCggdV9s
b25nLCB4ZHJwcm9jX3QsIHZvaWQgKiwgeGRycHJvY190LCB2b2lkICopOwotIApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRpcnBjXzEuMy42LmJiIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRpcnBjXzEuMy43LmJiCnNpbWlsYXJpdHkg
aW5kZXggODIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy9saWJ0
aXJwY18xLjMuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xp
YnRpcnBjXzEuMy43LmJiCmluZGV4IGM2OTAxODM5YzEuLmU4NWY5NWU2ZmQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy9saWJ0aXJwY18xLjMuNi5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlidGlycGMvbGlidGlycGNfMS4zLjcuYmIKQEAgLTEwLDEz
ICsxMCwxMSBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1mODM1Y2Nl
ODg1MjQ4MWU0YjJiYmJkZDIzYjVlNDdmMyBcCiBQUk9WSURFUyA9ICJ2aXJ0dWFsL2xpYnJwYyIK
IAogU1JDX1VSSSA9ICIke1NPVVJDRUZPUkdFX01JUlJPUn0vJHtCUE59LyR7QlB9LnRhci5iejIg
XAotICAgICAgICAgICBmaWxlOi8vMDAwMS1VcGRhdGUtZGVjbGFyYXRpb25zLXRvLWFsbG93LWNv
bXBpbGUtd2l0aC1nY2MtMTUucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMi11cGRhdGUt
c2lnbmFsLWFuZC1rZXlfY2FsbC1kZWNsYXJhdGlvbnMtdG8tYWxsb3ctY29tLnBhdGNoIFwKICAg
ICAgICAgICAgZmlsZTovLzAwMDEtQWRkLWNvbmRpdGlvbmFsLXZlcnNpb24tc2NyaXB0LXN1cHBv
cnQucGF0Y2ggXAotICAgICAgICAgICIKKyAgICAgICAgICAgIgogVVBTVFJFQU1fQ0hFQ0tfVVJJ
ID0gImh0dHBzOi8vc291cmNlZm9yZ2UubmV0L3Byb2plY3RzL2xpYnRpcnBjL2ZpbGVzL2xpYnRp
cnBjLyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIig/UDxwdmVyPlxkKyhcLlxkKykrKS8iCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYmJkMjZhOGYwZGY1NjkwYTYyYTQ3ZjZhYTMwZjc5N2YzZWY4
ZDAyNTYwZDFiYzQ0OWE4MzA2NmI1YTFkMzUwOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiNDdk
M2FjMTlkMzU0OWU1NGEwNWQwMDE5YTZjNDAwNjc0ZGE3MTYxMjM4NThjZmRiNmQzYmRkNzBhNjZj
NzAyIgogCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcKIAotLSAKMi40Ny4xCgo=

--===============4135393879383859504==--

